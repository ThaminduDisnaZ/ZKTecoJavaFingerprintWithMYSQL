```markdown
# ZK9500 Fingerprint Reader Java Application

## Overview

This Java Swing application is designed to interact with a ZK9500 fingerprint reader. It provides functionalities for fingerprint enrollment (registration) and identification. The application captures fingerprint images, extracts fingerprint templates, and stores them in a MySQL database. It also supports fingerprint identification against the database and basic attendance tracking by sending user identification data to a local server.

## Features

- **Fingerprint Sensor Control:**
    - Open and close connection to the ZK9500 fingerprint sensor.
- **Fingerprint Enrollment:**
    - Captures fingerprint scans three times for robust template generation.
    - Merges the three scans into a single fingerprint template.
    - Stores the fingerprint template in a MySQL database along with a user ID.
- **Fingerprint Identification:**
    - Identifies users by matching scanned fingerprints against the templates stored in the database (1:N identification).
    - Displays user ID and matching score upon successful identification.
- **Image Capture and Display:**
    - Captures fingerprint images and displays them within the application.
- **Template Format Selection:**
    - Supports both ANSI and ISO fingerprint template formats via radio button selection.
- **Database Integration:**
    - Utilizes a MySQL database to store fingerprint templates and user IDs.
    - Includes basic SQL operations for data storage and retrieval.
- **Basic Attendance Tracking:**
    - Upon successful identification with a sufficient score, the application attempts to:
        - Insert attendance records into a local MySQL database table (`asistencia_usuarios`).
        - Send user ID data to a local HTTP server (e.g., `http://localhost:4000/fingerprints/identificadorfingerprint_template/{fid}`).
        - Send user ID data to a local socket server on port 6666.
- **Swing GUI:**
    - User-friendly graphical interface built with Java Swing for easy interaction.

## Prerequisites

Before running this application, ensure you have the following installed and set up:

- **ZK9500 Fingerprint Reader:**
    - You need a ZK9500 fingerprint sensor device.
    - Install the necessary drivers for your operating system to allow communication with the sensor.
- **Java Development Kit (JDK):**
    - Ensure you have a compatible JDK installed (preferably Java 8 or later).
- **MySQL Database Server:**
    - You need a running MySQL database server.
    - Create a database named `fingerprint_sql_db`.
- **MySQL Connector/J:**
    - Download the MySQL Connector/J JAR file. This is required for Java to connect to the MySQL database. You will need to include this JAR in your project's classpath.
- **ZKBioGo SDK (or Fingerprint Library):**
    - This application relies on the ZKBioGo SDK (or a similar library provided by ZKTeco) to interact with the fingerprint sensor. You will need to obtain the SDK and include the necessary JAR files (like `com.zkteco.biometric.*`) in your project's classpath.

## Setup and Installation

1. **Install Prerequisites:**
    - Install JDK, MySQL Server, and the ZK9500 fingerprint reader drivers as mentioned in the prerequisites section.
2. **Database Setup:**
    - Create a MySQL database named `fingerprint_sql_db`.
    - Run the following SQL script to create the necessary tables:

    ```sql
    CREATE DATABASE IF NOT EXISTS fingerprint_sql_db CHARACTER SET latin1 COLLATE latin1_swedish_ci;
    USE fingerprint_sql_db;

    CREATE TABLE IF NOT EXISTS fingerprints (
        id INT AUTO_INCREMENT PRIMARY KEY,
        fingerprint_template MEDIUMBLOB,
        no INT UNIQUE
    );

    CREATE TABLE IF NOT EXISTS asistencia_usuarios (
        id INT,
        fingerprint_template VARCHAR(255),
        timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
    ```
3. **Include MySQL Connector/J and ZKBioGo SDK:**
    - Add the MySQL Connector/J JAR file and the ZKBioGo SDK JAR files to your Java project's classpath. If you are using an IDE like IntelliJ IDEA or Eclipse, you can typically add external JARs to your project's dependencies.
4. **Clone the Repository (or Copy the Code):**
    - Clone this GitHub repository or copy the `ZTKFingerPrint.java` file into your Java project directory.
5. **Compile the Java Code:**
    - Compile the `ZTKFingerPrint.java` file using a Java compiler. For example:
      ```bash
      javac ZTKFingerPrint.java
      ```
6. **Run the Application:**
    - Execute the compiled Java code. Make sure the MySQL server is running and the ZK9500 sensor is connected to your computer.
      ```bash
      java ZK9500FingerPrint.ZTKFingerPrint
      ```

## Usage

1. **Open Sensor:**
   - Click the "Open" button to initialize and connect to the fingerprint sensor. The application will attempt to load existing fingerprint templates from the database into memory.
2. **Enroll Fingerprint:**
   - Click the "Enroll" button.
   - Follow the instructions in the text area to place the same finger on the sensor three times.
   - After three successful scans, the fingerprint template will be generated, stored in the database, and assigned a new user ID.
3. **Identify Fingerprint:**
   - Click the "Identify" button.
   - Place a finger on the sensor.
   - The application will attempt to identify the fingerprint against the database.
   - If a match is found with a sufficient score, the user ID and score will be displayed, and attendance tracking actions will be triggered (database insert, HTTP request, socket communication).
   - If no match or a low score match is found, an identification failure message will be displayed.
4. **Close Sensor:**
   - Click the "Close" button to disconnect from the fingerprint sensor and release resources.
5. **Template Format:**
   - You can select either "ANSI" or "ISO" template format using the radio buttons before opening the sensor. ANSI is selected by default.

**User Interface Elements:**

- **Buttons:**
    - **Open:** Initializes and opens the fingerprint sensor.
    - **Enroll:** Starts the fingerprint enrollment process.
    - **Identify:** Starts the fingerprint identification process.
    - **Close:** Closes the fingerprint sensor connection.
    - **btnImg:** (Image Button) Displays the captured fingerprint image.
- **Radio Buttons:**
    - **ANSI:** Select ANSI fingerprint template format.
    - **ISO:** Select ISO fingerprint template format.
- **Text Area:**
    - Displays status messages, instructions, and identification results.

## Configuration

- **Database Connection:**
    - The database connection parameters (JDBC URL, username, password) are hardcoded in the `main` method and within the `insert` and `OnExtractOK` methods. You may need to modify these to match your MySQL database setup.
    ```java
    DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/fingerprint_sql_db?characterEncoding=latin1&useConfigs=maxPerformance","root","2612005");
    ```
    **Important:** For production environments, it's highly recommended to externalize these credentials (e.g., using configuration files or environment variables) instead of hardcoding them directly in the source code for security reasons.
- **Server URLs and Ports:**
    - The HTTP server URL (`http://localhost:4000/fingerprints/identificadorfingerprint_template/{fid}`) and socket server port (6666) are also hardcoded. Modify these if your local servers are running on different addresses or ports.

## Troubleshooting

- **Sensor Not Opening / "Init failed!" or "No devices connected!":**
    - Ensure the ZK9500 fingerprint sensor is properly connected to your computer.
    - Verify that you have installed the correct drivers for the sensor.
    - Double-check if the ZKBioGo SDK libraries are correctly included in your project's classpath.
- **Database Connection Errors:**
    - Make sure the MySQL server is running.
    - Verify the database connection parameters (URL, username, password) in the code are correct for your MySQL setup.
    - Ensure the MySQL Connector/J JAR is correctly included in your project.
- **Fingerprint Enrollment or Identification Failures:**
    - Ensure you are placing your finger correctly on the sensor and applying consistent pressure.
    - Clean the sensor surface if it is dirty or smudged.
    - If enrollment consistently fails, ensure the ZKBioGo SDK and sensor are working correctly by testing with any example applications provided with the SDK.

## Contributing

Contributions to improve this application are welcome! Feel free to fork the repository, make your changes, and submit pull requests.

## License

[Specify your project license here, e.g., MIT License, Apache 2.0, etc. If you are not using a license, you can state "This project is not licensed." ]

## Author

[Your Name / Organization Name]
[Your Contact Information (Optional)]

---

**Disclaimer:** This application is provided as is, for educational and demonstration purposes. It may require further development and testing for use in production environments. Please ensure you understand the security implications of fingerprint-based authentication and take appropriate measures for your specific use case.
```
