package ZK9500FingerPrint;
import com.zkteco.biometric.FingerprintSensorErrorCode;
import com.zkteco.biometric.FingerprintSensorEx;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import javax.imageio.ImageIO;
import javax.swing.ButtonGroup;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JRadioButton;
import javax.swing.JTextArea;
import java.sql.*;
import java.util.ArrayList;
import java.net.*;
import java.nio.charset.StandardCharsets;

public class ZTKFingerPrint extends JFrame{
	JButton btnOpen = null;
	JButton btnEnroll = null;
	JButton btnIdentify = null;
	JButton btnClose = null;
	JButton btnImg = null;
	JRadioButton radioISO = null;
	JRadioButton radioANSI = null;

	private JTextArea textArea;

	int fpWidth = 0;
	int fpHeight = 0;
	private byte[] lastRegTemp = new byte[2048];
	private int cbRegTemp = 0;
	private byte[][] regtemparray = new byte[3][2048];
	private boolean bRegister = false;
	private boolean bIdentify = true;
	private int iFid = 1;

	private int nFakeFunOn = 1;
	static final int enroll_cnt = 3;
	private int enroll_idx = 0;

	private byte[] imgbuf = null;
	private byte[] template = new byte[2048];
	private int[] templateLen = new int[1];


	private boolean mbStop = true;
	private long mhDevice = 0;
	private long mhDB = 0;
	private WorkThread workThread = null;

	public void launchFrame(){
		this.setLayout (null);
		btnOpen = new JButton("Open");
		this.add(btnOpen);
		int nRsize = 20;
		btnOpen.setBounds(30, 10 + nRsize, 100, 30);

		btnEnroll = new JButton("Enroll");
		this.add(btnEnroll);
		btnEnroll.setBounds(30, 60 + nRsize, 100, 30);

		btnIdentify = new JButton("Identify");
		this.add(btnIdentify);
		btnIdentify.setBounds(30, 110 + nRsize, 100, 30);

		btnClose = new JButton("Close");
		this.add(btnClose);
		btnClose.setBounds(30, 310 + nRsize, 100, 30);

		radioANSI = new JRadioButton("ANSI", true);
		this.add(radioANSI);
		radioANSI.setBounds(30, 360 + nRsize, 60, 30);

		radioISO = new JRadioButton("ISO");
		this.add(radioISO);
		radioISO.setBounds(120, 360 + nRsize, 60, 30);

		ButtonGroup group = new ButtonGroup();
		group = new ButtonGroup();
		group.add(radioANSI);
		group.add(radioISO);

		btnImg = new JButton();
		btnImg.setBounds(150, 5, 256, 300);
		btnImg.setDefaultCapable(false);
		this.add(btnImg);

		textArea = new JTextArea();
		this.add(textArea);
		textArea.setBounds(10, 440, 480, 100);


		this.setSize(520, 580);
		this.setLocationRelativeTo(null);
		this.setVisible(true);
		this.setTitle("Fingerprint Reader Gym");
		this.setResizable(false);

		btnOpen.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				if (0 != mhDevice)
				{
					textArea.setText("Please close device first!");
					return;
				}
				int ret = FingerprintSensorErrorCode.ZKFP_ERR_OK;
				System.out.println("initialization correctly " + ret);
				cbRegTemp = 0;
				bRegister = false;
				bIdentify = false;
				iFid = 1;
				enroll_idx = 0;
				if (FingerprintSensorErrorCode.ZKFP_ERR_OK != FingerprintSensorEx.Init())
				{
					textArea.setText("Init failed!");
					return;
				}
				ret = FingerprintSensorEx.GetDeviceCount();
				if (ret < 0)
				{
					textArea.setText("No devices connected!");
					FreeSensor();
					return;
				}
				if (0 == (mhDevice = FingerprintSensorEx.OpenDevice(0)))
				{
					textArea.setText("Open device fail, ret = " + ret + "!");
					FreeSensor();
					return;
				}
				if (0 == (mhDB = FingerprintSensorEx.DBInit()))
				{
					textArea.setText("Init DB fail, ret = " + ret + "!");
					FreeSensor();
					return;
				}

				int nFmt = 0;
				if (radioISO.isSelected())
				{
					nFmt = 1;
				}
				FingerprintSensorEx.DBSetParameter(mhDB,  5010, nFmt);

				byte[] paramValue = new byte[4];
				int[] size = new int[1];

				size[0] = 4;
				FingerprintSensorEx.GetParameters(mhDevice, 1, paramValue, size);
				fpWidth = byteArrayToInt(paramValue);
				size[0] = 4;
				FingerprintSensorEx.GetParameters(mhDevice, 2, paramValue, size);
				fpHeight = byteArrayToInt(paramValue);
				imgbuf = new byte[fpWidth*fpHeight];
				mbStop = false;
				workThread = new WorkThread();

				workThread.start();
				textArea.setText("Open succ!");
				ArrayList<ArrayList<?>> data = new ArrayList<>();
				ArrayList<byte[]> fprints = new ArrayList<>();
				ArrayList<Integer> fid = new ArrayList<>();
				String query = "SELECT fingerprint_template, no FROM fingerprints";

				try(Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fingerprint_sql_db?characterEncoding=latin1&useConfigs=maxPerformance","root","2612005");

					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(query)){
					while(rs.next()) {
						fprints.add(rs.getBytes("fingerprint_template"));
						fid.add(rs.getInt("no"));
						System.out.println("Obtenemos la fingerprint_template del cliente  iFid " + rs.getInt("no"));
					}
					data.add(fprints);
					data.add(fid);
				}catch(SQLException f) {
					System.out.println(f.getMessage());
				}
				if(fprints.size() == fid.size()) {
					System.out.println("Database size matches, " + fid.size());
					int i;
					ArrayList<byte[]> fprints2 = (ArrayList<byte[]>) data.get(0);
					ArrayList<Integer> fid2 = (ArrayList<Integer>) data.get(1);

					for(i = 0; i < fprints2.size(); i++) {

						if(0 == (ret = FingerprintSensorEx.DBAdd(mhDB, fid2.get(i), fprints2.get(i)))){
							System.out.println("Adding client fingerprints " + (i+1));
						}else {
							System.out.println("Failed to add client fingerprint " + (i+1));
						}
						iFid = fid2.get(i);
					}
					System.out.println("ret" + mhDB);
					if(fprints2.size() > 0) {
						iFid += 1;
					}
					System.out.println("Next finger id " + iFid);
				}


			}
		});



		btnClose.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				FreeSensor();

				textArea.setText("Close succ!");
			}
		});

		btnEnroll.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				if(0 == mhDevice)
				{
					textArea.setText("Please press Open Sensor!");
					return;
				}
				if(!bRegister)
				{
					enroll_idx = 0;
					bRegister = true;
					textArea.setText("Put your right index finger 3 times!");

				}
			}
		});

		btnIdentify.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				if(0 == mhDevice)
				{
					textArea.setText("Please press Open Sensor!");
					return;
				}
				if(bRegister)
				{
					enroll_idx = 0;
					bRegister = false;
				}
				if(!bIdentify)
				{
					bIdentify = true;
				}
			}
		});

		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.addWindowListener(new WindowAdapter(){

			@Override
			public void windowClosing(WindowEvent e) {
				FreeSensor();
			}
		});
	}

	private void FreeSensor()
	{
		mbStop = true;
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		if (0 != mhDB)
		{
			FingerprintSensorEx.DBFree(mhDB);
			mhDB = 0;
		}
		if (0 != mhDevice)
		{
			FingerprintSensorEx.CloseDevice(mhDevice);
			mhDevice = 0;
		}
		FingerprintSensorEx.Terminate();
	}

	public static void writeBitmap(byte[] imageBuf, int nWidth, int nHeight,
								   String path) throws IOException {
		java.io.FileOutputStream fos = new java.io.FileOutputStream(path);
		java.io.DataOutputStream dos = new java.io.DataOutputStream(fos);

		int w = (((nWidth+3)/4)*4);
		int bfType = 0x424d;
		int bfSize = 54 + 1024 + w * nHeight;
		int bfReserved1 = 0;
		int bfReserved2 = 0;
		int bfOffBits = 54 + 1024;

		dos.writeShort(bfType);
		dos.write(changeByte(bfSize), 0, 4);
		dos.write(changeByte(bfReserved1), 0, 2);
		dos.write(changeByte(bfReserved2), 0, 2);
		dos.write(changeByte(bfOffBits), 0, 4);

		int biSize = 40;
		int biWidth = nWidth;
		int biHeight = nHeight;
		int biPlanes = 1;
		int biBitcount = 8;
		int biCompression = 0;
		int biSizeImage = w * nHeight;
		int biXPelsPerMeter = 0;
		int biYPelsPerMeter = 0;
		int biClrUsed = 0;
		int biClrImportant = 0;

		dos.write(changeByte(biSize), 0, 4);
		dos.write(changeByte(biWidth), 0, 4);
		dos.write(changeByte(biHeight), 0, 4);
		dos.write(changeByte(biPlanes), 0, 2);
		dos.write(changeByte(biBitcount), 0, 2);
		dos.write(changeByte(biCompression), 0, 4);
		dos.write(changeByte(biSizeImage), 0, 4);
		dos.write(changeByte(biXPelsPerMeter), 0, 4);
		dos.write(changeByte(biYPelsPerMeter), 0, 4);
		dos.write(changeByte(biClrUsed), 0, 4);
		dos.write(changeByte(biClrImportant), 0, 4);

		for (int i = 0; i < 256; i++) {
			dos.writeByte(i);
			dos.writeByte(i);
			dos.writeByte(i);
			dos.writeByte(0);
		}

		byte[] filter = null;
		if (w > nWidth)
		{
			filter = new byte[w-nWidth];
		}

		for(int i=0;i<nHeight;i++)
		{
			dos.write(imageBuf, (nHeight-1-i)*nWidth, nWidth);
			if (w > nWidth)
				dos.write(filter, 0, w-nWidth);
		}
		dos.flush();
		dos.close();
		fos.close();
	}

	public static byte[] changeByte(int data) {
		return intToByteArray(data);
	}

	public static byte[] intToByteArray (final int number) {
		byte[] abyte = new byte[4];

		abyte[0] = (byte) (0xff & number);

		abyte[1] = (byte) ((0xff00 & number) >> 8);
		abyte[2] = (byte) ((0xff0000 & number) >> 16);
		abyte[3] = (byte) ((0xff000000 & number) >> 24);
		return abyte;
	}

	public static int byteArrayToInt(byte[] bytes) {
		int number = bytes[0] & 0xFF;

		number |= ((bytes[1] << 8) & 0xFF00);
		number |= ((bytes[2] << 16) & 0xFF0000);
		number |= ((bytes[3] << 24) & 0xFF000000);
		return number;
	}
	private class WorkThread extends Thread {
		@Override
		public void run() {
			super.run();
			int ret = 0;
			while (!mbStop) {
				templateLen[0] = 2048;
				if (0 == (ret = FingerprintSensorEx.AcquireFingerprint(mhDevice, imgbuf, template, templateLen)))
				{
					if (nFakeFunOn == 1)
					{
						byte[] paramValue = new byte[4];
						int[] size = new int[1];
						size[0] = 4;
						int nFakeStatus = 0;
						ret = FingerprintSensorEx.GetParameters(mhDevice, 2004, paramValue, size);
						nFakeStatus = byteArrayToInt(paramValue);
						System.out.println("ret = "+ ret +",nFakeStatus=" + nFakeStatus);
						if (0 == ret && (byte)(nFakeStatus & 31) != 31)
						{
							textArea.setText("Is a fake-finer?");
							return;
						}
					}
					OnCatpureOK(imgbuf);
					try {
						OnExtractOK(template, templateLen[0]);
					}catch(Exception e) {
						System.out.println(e.getMessage());
					}
				}
				try {
					Thread.sleep(500);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}

			}
		}

		private void runOnUiThread(Runnable runnable) {

		}
	}

	private void OnCatpureOK(byte[] imgBuf)
	{
		try {
			writeBitmap(imgBuf, fpWidth, fpHeight,  "fingerprint.bmp");

			btnImg.setIcon(new ImageIcon(ImageIO.read(new File("fingerprint.bmp"))));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static void insert(byte[] fingerprint, int fid) {

		String query = "INSERT INTO fingerprints (fingerprint_template,no)  VALUES  (?, ?)";

		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/fingerprint_sql_db?characterEncoding=latin1&useConfigs=maxPerformance","root","2612005");
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setBytes(1, fingerprint);
			pstmt.setInt(2, fid);
			pstmt.executeUpdate();


		}catch(Exception e){ System.out.println(e);}


	}




	private void OnExtractOK(byte[] template, int len )
	{
		if(bRegister)
		{
			int[] fid = new int[1];
			int[] score = new int [1];
			int ret = FingerprintSensorEx.DBIdentify(mhDB, template, fid, score);
			if (ret == 0)
			{
				textArea.setText("This finger is already registered by " + fid[0] + ", canceling registration");
				bRegister = false;
				enroll_idx = 0;
				return;
			}
			if (enroll_idx > 0 && FingerprintSensorEx.DBMatch(mhDB, regtemparray[enroll_idx-1], template) <= 0)
			{
				textArea.setText("Please press your finger three times for registration");
				return;
			}
			System.arraycopy(template, 0, regtemparray[enroll_idx], 0, 2048);
			enroll_idx++;
			if (enroll_idx == 3) {
				int[] _retLen = new int[1];
				_retLen[0] = 2048;
				byte[] regTemp = new byte[_retLen[0]];

				if (0 == (ret = FingerprintSensorEx.DBMerge(mhDB, regtemparray[0], regtemparray[1], regtemparray[2], regTemp, _retLen)) &&
						0 == (ret = FingerprintSensorEx.DBAdd(mhDB, iFid, regTemp))) {
					iFid++;
					cbRegTemp = _retLen[0];
					System.arraycopy(regTemp, 0, lastRegTemp, 0, cbRegTemp);

					System.out.println((regTemp));
					insert(regTemp, iFid);

					textArea.setText("registration completed");
				} else {
					textArea.setText("registration failed, error code=" + ret);
				}
				bRegister = false;
			} else {
				textArea.setText("You need to press " + (3 - enroll_idx) + " times the reader");
			}
		}
		else
		{
			if (bIdentify)
			{
				int[] fid = new int[1];
				int[] score = new int [1];
				int ret = FingerprintSensorEx.DBIdentify(mhDB, template, fid, score);
				if (ret == 0)
				{
					textArea.setText("Identification complete, user fid=" + fid[0] + ", score=" + score[0]);
					URL url;
					System.out.println(score[0]);
					if (score[0] >= 60){
						try{
							Class.forName("com.mysql.jdbc.Driver");
							Connection con=DriverManager.getConnection(
									"jdbc:mysql://localhost:3306/fingerprint_sql_db?characterEncoding=latin1&useConfigs=maxPerformance","root","2612005");
							Statement stmt=con.createStatement();
							ResultSet rs=stmt.executeQuery("select * from  fingerprints where fingerprint_template  = "+fid[0]+"");
							if(rs.next()){
								int resultadoid = rs.getInt("id");
								stmt.execute("INSERT INTO asistencia_usuarios (`id`,`fingerprint_template`) VALUES ("+fid[0]+", '"+resultadoid+"')");
								System.out.println("User data sent " + resultadoid +" with fingerprint value " + fid[0]);
							}



						}catch(Exception e){ System.out.println(e);}
					}else{
						textArea.setText("Incomplete identification, user fid=" + fid[0] + ", score=" + score[0] + " try again.");

					}

					try {
						url = new URL("http://localhost:4000/fingerprints/identificadorfingerprint_template/"+fid[0]+"");

						URLConnection con = url.openConnection();

						BufferedReader in = new BufferedReader(new InputStreamReader(
								con.getInputStream()));

						String linea;
						while ((linea = in.readLine()) != null) {
						}
					} catch (IOException e) {
						System.out.println(e.getMessage());
					}


					try {
						Socket s = new Socket("localhost", 6666);

						OutputStreamWriter out = new OutputStreamWriter(s.getOutputStream(), StandardCharsets.UTF_8);
						out.write(""+fid[0]);
						out.flush();
						out.close();


						InputStream input = s.getInputStream();
						BufferedReader reader = new BufferedReader(new InputStreamReader(input));
						String line = "works";
						System.out.println(line);

					} catch (IOException f) {
						System.out.println(f);

					}

				}
				else
				{
					textArea.setText("Identification failed, errcode=" + ret);
				}

			}
			else
			{
				if(cbRegTemp <= 0)
				{
					textArea.setText("Please register first!");
				}
				else
				{
					int ret = FingerprintSensorEx.DBMatch(mhDB, lastRegTemp, template);
					if(ret > 0)
					{
						textArea.setText("Verify succ, score=" + ret);
					}
					else
					{
						textArea.setText("Verify fail, ret=" + ret);
					}
				}
			}
		}
	}

	public static void main(String[] args) {

		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/fingerprint_sql_db?characterEncoding=latin1&useConfigs=maxPerformance","root","2612005");

			Statement stmt=con.createStatement();

		}catch(Exception e){ System.out.println(e);}

		new ZTKFingerPrint().launchFrame();
	}
}