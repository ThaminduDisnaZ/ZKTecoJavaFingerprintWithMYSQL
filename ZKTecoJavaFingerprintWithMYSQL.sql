-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.39 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for fingerprint_sql_db
CREATE DATABASE IF NOT EXISTS `fingerprint_sql_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fingerprint_sql_db`;

-- Dumping structure for table fingerprint_sql_db.fingerprints
CREATE TABLE IF NOT EXISTS `fingerprints` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fingerprint_template` blob,
  `no` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fingerprint_sql_db.fingerprints: ~6 rows (approximately)
INSERT INTO `fingerprints` (`id`, `fingerprint_template`, `no`) VALUES
	(7, _binary 0x4c515352323200000512100505050709ced000002913760000000084212e9312af01910ca2000f00a919a2017c009a0faa00c41217006e00e000640bc512fa01d50c9500c201951dbb015700230b8a00dc129f0c3d00a700d80e45128b01fc0fab00e901fc1d5c013d00000f770018120d0b6e001000be0b11134b005909ae005b00341d9b01cc00940b17009612b10ec3007300eb0acd126901a30d50006e00161ff1018000bd0f3800cd12c20ef100e6000d0fc8121100dd0f11011d004e1e2c018a0004056b002c12120ed3004401b30f5b121101fb0290005800941db601c900b70d5b00e612e6095d00b500d407e7127a01b30f52005900071f5001d8009c0d39008d12c30c6d005f00cb0fa4121e00860ff0009000b913900130000f0f5f003213870e1f0113010b0e00134600650fa1011c632fee4d1bd5f51dc61b6c1f7b3f0b0506ae74177e6b16a38d6a04d5fa83f327551c0ebea91e9b448294e5b78ad005eefc778e681f501f292305f960feccf12c75f175326b77f647155285c0fbe2fe76eb8092266d577cb1f4368eaaf5b8a2d2a0069921ea20bce8dea9ff82857ff5219d040e5e7c30774482ffe234118904f5f918fc541e2f0cd97b0efcba038f16ab7c2bf54d0acfe7124ad08aa6856f7fb809affa93073c0be60462f0a66e0e10c799858003ff9afd2000f260c6fa8c0d40352bd05556613ebf310c1288ff2113ddf8e007e4e1c4f1ede6210a9501f7eeb38c59045113f31727004e028b77218c8002ace9170b0603361baffc5b141295e58dc50272f8fa64066a6b87250c5af1f689ef7e5c75f71fc4050e50534b15000000a9ec6436b7c0bd747aac25a4255400039a219109c5c20e81c45fc4fec30ac5c8169e9567ffff07006e1b85d26ac10b00a8284c7f71ec9e0400e248303b541a12ae2c1ac2fffcf5554f543dfcfdc0fdc1eb3d0c12922e062930fecc008e2281756ac11500573415d2fffeffff2f3f05fe56ef340200dd3613320805723afc41ff3605c55845688208006041030530c4e8c00400f94d3d9104041159413d0300f19e3dc517016e5d06fe31c30062727bc0c1640500aa62152f18012364e22bf4fffbed41fcc2feffff84c0260501276aed54fe3afefbed34fe3e35ff26dc00cf7928fefffec04f8afefbecfcfcfffec0ff3bc0fad213000c6e46c0a83d4fd2fffc330300c7b029fb1101c3762bff16c5a7853041fe31fefdf938fdfaedffffc1c1ffc0d701169242c03e47c04738fe350e011f82ed43343b3efbd22ffefefcfafc39ff2cd30e012385fdc106312d23300900f2863a04fefad33513004388f7fefefbecc1fffefd17f93bc00d122f8d00fd9422c000f99c362e0400248fc956011226980c4a1500119934274025fdffffff3b3ffad30801549afdc038fec4e9260900289f163b535c1401559f09c2c038ff0112aea229270401dea34c7f0e0126a71ac08667c57da0060054a70c063bf9140161b306c2fedb050578ba08c3f8c204c581c539c4c70c0121c08cc05d2a340200b7cf4f3e11043ace4d623efefffdfefaeec30c010eda50044c2f22fe100113da49813bfb294536070054dde5767316002ae3494d08c546f308757907105615d6c075d10d102b1353c1052b39270c101d1a53ff05fc523c6d021047587a05031541276cfe061058e70cfad05806112a2b4f05ffc5ecfe0710592d0694c10d02d24374ff3e38c610725908c30510d348b52b0f03024860fffe2e073a0103124d573d0310bd520cd00511605f7d66c0108a757cc2fac14442c4010512011700000000c7180512010100004542000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '1'),
	(8, _binary 0x4d3d535232320000047e810505050709ced00000287f7600000000849525967eb90163049b00600059758f01e500710da400d07e0a095500a8007d0f7b7e7e01cf0f7800d4018c7349017e00c60df4008e7eb4065400370150056d7e4f00030cb8009101627179016301ff0f5b00bc7e580d7900a10078099c7ee301600d88003600e579bc01d100d00f0800bc7e500e71007000800fd17e8b014c0f9a0091005671c6014b00500dbd00297e590eb1002800980a757eae01b8016b001600ee7b89019400ce0cb700f47ef0087a00f90056085c7ef401a20a9e00a8004a714f016f00450d3300df7e500e4a0047008f0f987e58007701f400f20157711d0ef109bea998057183c09304136190b4e3745da31dc269d50307fd7a89548ce102fa1578f6b6e7cfa8898029136b83bd8daf73ebfc0e940a0d17e4a4062270878d50f397150a1629ff7a89e26eac85e0fc468a19046cf1e62395f2818286ceb470152e24f38a804e7ae7728efefa05b3f85d797b0162057efdcb03a7f3ac062f7a960cdaf6ab0052054b77961027fe4e0ebe0da7789cfd5503d655d1e3ca865f34151161021472b41d9413095390a718b43570d8b2aa99e61128fe9aff8b828d803e015b92cb7cba82e3077606e6f57ff80012827993755aefeb79a2de8aedcf63da01075a5058240a0100c5ddb4481e67a0b7ed481af78d5e3900027322afc600837a75c3220061189b7292bfc05d717cc6c604c3c5bcc3ffc2c05b54ce00a57b6ac2fe6e80c1c2008b77686784150058ca56f9bdffc58485c1ff416fc77301ba1369c1c1b5c173060c01cd1f5ac23bc0c6bf6ac1200a00bde050fa81c36c720b00aee260c4bcfec3787f09000d38538182570800b22b9fffc783c37a0e00772fa5c2c681c2c0c0c2c0c23ac4c17001e13a57c07705554bbc1c01e7425c8baec0553dfffefcfdfefc05fcc481fec1ffc00c00824748bf85c0c0c0c281ca00483447fec1896eff00c9c2800e01c44c567e04ffc44ec0fac3f41d00234c54be6afec15557ff3afef983fffc33c0ff4bcc00eb32516a64c00500ed4e441207019957505a070404f49adb7f1b00f29b4cc42743ff56feff463bfff880fcc0fdc0c018c5f96d374265ff52fe443b3b278004015071437ec0006b0b48900d002278f5c0c4816fc1c1c19818c5ff7e2ec16354c0c0c0fbfffb80ffc0fbfe360ac51f864effc35a761801c08354bec163ff45ff47fdfe2ebefe0700d58e500442117f06924cc0fec196c041463dfe2a05010b6649fa120e0183b883f8382e32384d11009d136404fec1bec17980c1910ec40fb232445553c04c04c591bf22fcc107009fbb92c0f9befaf91400cebb893ec4453afc28fe540ac520c2537576960d01120850c4264bfec1401100e5d434f770c3c3c4c1c14dc0097f17da4fc0ff5b05ffc4bf510e00f2de5698545054fe0d00f8de4c3bc0c4be47c13407011b2c50641e0b101e0157c19f68fb76101e0d4cfd6a9b0515622652650310478413c67911f139565730c010f2444d370710484bd3c271bc081148570fc004fdc7bb950610205d0607fe327d119a5d6dfd008142057f010100160000c5000666010100000000804200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '2'),
	(9, _binary 0x4f5d535232320000061e1e0505050709ced000002a1f760000000085353b8f1ec30162099a000a0067127201ab00f20b4c00e61edf0d8a007f003e07dc1eb401c10fc4002800d0114d01d800a90d9300f21e910e3900bf00730ea91e1d00e30f9d0095007611f301ef00df0f28006f1e2504f1000d01270f0c1ff701610d10000a00a5150a002101e80e89004e1ffc0e000148012f0da11ebc01ae0cab0071003c13b801b700ab0d4b008b1e020b8000f200be0b561eb001c50d9500ab00fd1585010601720c86009c1ec80c9e005a00380b9b1e20006c0f30006600c51344010701910fde00cf1eb10f1301b700140e6a1e3900f10f2e00e9018b116e015201790f4c00141e770d1a004f01cc0d871ebe016906b0000100b312850198000106b400e41e8f0dc8008900570f911e6f01ff0bb400aa0015116b017200e6072400e01ed90ebe005b00ba0ffb1ecf01d20fed00ba00a41b75014c00ee0fda009e1ec30dec005100dc0fab1e2f017b0fa400d9007f11d801280012090f00121e8c07acfa3901a784bf1ff8b78186b58aa8f2b48ef464857e21527cf85b1f60fc3e18daf3f70fa41e5a21aff80a18bbf4e4004c03a6e8da0470f37be9f30d15793370b60d4a695b715e7435096882e0e29c871d0ec394a704bce28380ad8682811393cee9cfeebbe2360823025c95730c92852272a70649155e8aa477ecfb00059e91509179845d70e8f84fe33009dd044a081c9d3b17a8ef69ff25138b0582e3dc005902c9f9f709d0882408e5073a09858fd71fd4070989b6fd427e531facfcf10fcd028307b1f63d0ec6fca6efd700350cf672cd7bfef5ba864c981393caffc58b537de11118fe27fc5b8b8b7e75134e7a240ac17af7086e15a40d817c5d0018124f151417f1b25e005380e0eca6150005510518054788f0160e18aaeda3fa9cf1bcf822048e09906e809a93108e00fef5d7fda79c57139f88de0a5382a4edd400c2f9eb0c60f61015aa79b5055a0e2ff2331f940602ee15862f9b98e5187f6e165616bafef969fe75af070105c51474411202020093c98b229c8184e677c2c7ade555071d0925de0600c0c4104fe10401e0020c49c100a31d0d3d0c009004b884c6696e1b00871474b98bc69dc0c0fec5c09646c49c0b01ca178645c43bc28dddc0c1c08bc273c000d5060d4b0c00a41946c461dfc3c1c26c0400691d0f470e01a51f77694184c6600401db2609fe05c0001e402862c2ff95c000df3517c0600900abf47a82dc750c00764ce7384635e1c32808009b4eb2c28a9f050155874f88c300a551fc32fe0300f2961cf91b019d5470780ec5c45a11fffefdc3f9ffeeff3c1201bd5d7d6cc1048c831301166a43c1ff4c7c8a0a01486ad3fe3ef0fffddc327a24160097aff7f9e1fdc1fcc0fdfd38fff9e1fefeffc0ffc13bc00e1e116a46c2fec307600b1eb96f09fdfffe39fcc6e3fec1ffc006004a706dde900500327149ac0706567357c280c207c5b6750efffefdfcfd09c4027823c0ff322f05004b81f2e32b1000576fe004fe37defefffffe2f4ac001098642fc471701185243fbdffc425b44fec28546c602019087f7fdfd3bffffe1fdc1fec0413e05fec6e3c1ffffff300ec5918a1efcfefdfbfcfd05fec6e02e0400898d7006c2c618018695f7fdfcda0307399852ff0400805e64901b01899bfd2007c543a72376a8040008a2f17b081e62a5d7fffeffe9fffbe0fcfcfe0500776eebfa02060029ab5cc005580a1e07b42dc077800056051e8db77ac4080097b83cdac5c2c5c7c405c5d9bd51c1500c00b9bd8ac028e1ffc1ff370601e3be58df42020085c35c3f0506b7c248240600200a27c7dd87060007d124af8d171f23d05effc1fe0468c6de5542060007e1e77cc70e002ae964c0c10545f9dec1feff53060019ec5ce1520a0008ef244c90961d017df07afe0dc5c1f442c1ffff464f38ca00ebeb5d4544ff4738c60101e865c00d0129f8a16455544302010bf95c3a0b1617011b7cc1c2830704173505614c03112bd767c61511ed13624a4c3a6c050e0b1b16c204105f206b47091024236d78054e050e0d2513c2051058246fde2e06110627640554c71a10282b6b5e08d50d2b0888c18b041123f267c6e004110c3d06ffa104170145664708100a8010c5e170c144420101c5000608010100000218c500061e010145420000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '4'),
	(10, _binary 0x4d8553523232000004c6c40505050709ced0000028c77600000000845d2b94c6be01ef0fb1002f00fbcdd101a0007e0f5d0000c767058e00fe002d05f4c6ca01140b6f00c801decaa6016900650e590021c7610c6a007200240ff3c616009d0db1008d00f2c983014700e90fce0138c6100da7000c00290bb9c6c801730fcd0019000bcdb8019000770e6e0080c6670ca00003012f04a4c67501e90edb00ca011fc80100c5009305030027c7020e57007700990c89c63900e00e4e00ae00daca9d014501f00f1f0063c73205ad00a2003f0eaec6fb01660693004f00ebc96401bb00df0cbd0005c75a0b9c0013013704ecc605001e07cd00de017fc946019f005c0f97001cc7d20ecb003701e40f2fc6a901df0c7000fa00dbc9e9012100000fb7f612d59a7dd198da14b7f099cd8384560f147e758355b2b186a501158e9880dec0eea081801a0853f570b95402ea71e171b88266b614842907b7f44c8275416326da910f0c1e0c2dcb9af5ef080a132e1fdb69cefaa3efef07f4665ab3bf7a159ee210a7feadd7607f21fb39f1047d95bc11877887e1f8b587c543ecfe49fcc9a10c1b65465e878b175c8b70e5652dc881197d760378f1794473f3c984adff2e8529d7539187d00315264707f560874694867db97fe9ae8400898a690b77f54640a7f22f038180e4762e32448d5908d19500048d44c7a4647be9618c5f9db9477ff603a2f85f7b9b29142025ab320b5087abc58286b5f9e7013a029a35ea0e0f17ffbb3afde3c1000700072857f1231cc1bed33e1aabaabade6276e3a920440102b71ee4c80186006bc2c33a494307c1c110009b00aec18794c1fc705b07006e006639c0680c00f20443c4c538c2fec372c00bc56d03a666c1536c08009b095838c0c353110106ca7d7606c1886762c003c4091845c30900e12177a2c24ac201e82409c2fdd50111fe88fe8380c15106c0c5cc01b046edfe33fec00dc6b24dfa3d35c0c300af8b71c1870a00ada3f4fafdc1ff460f00a5a26d7cbdc063c06106008f705aa2c01a011a719a07ff8d4278537064c0c005c3fac0015575606dc0ce00a7b0f5c0fdfeff40fd0f045d7666c1c074c10565c5bb0701597857463a0404a0795d5c0900b040fa2d07fc4a0c00948822fdc4ec3cc1ff05008f4a64c4b50901c08f063e3b5b02c6a5916d70c111c5b997b2c3c0596fc073045a07c6cf9c89c50500819f640684070049a15780c102c6d7a00c40fd03c5cea6bbc10e00a6a77046c0740454c0ff0a009279e937ef38080061c15c04c06e90080193c2edff3bfff98209018bc462c00766c6c901bcc87d976205c2c539c0c1c10f00e90c8c6e03c1c0c3c0c0c1076507c6f0ce17c106000adf0dedfc0600b2e7f43efffaf20c000ae997ff0493c0b3740200aced7006080472effc28ff3307c5b0fd3bfcffffffff15c40afd62c2fec299c56906fffb07c06bff0510ecc01efb9c0811990760ff048342c311d70c90c29fc010dac9174007106c1392c166070411dc141ec005ff0fd69f16f4c0fcfd3bfec53840091096186442c250c211511c56c1c0ce10cfda817da35104100c2308ee0811c5358cc501c361040711cd3617fd053f01d6cd3a203809105847edda29fe1010f85c6c69c749c5c069c1c009d5d25e62c2afc45f03106c5e6d0706118572de3e3ffa4084000000000016c50004c6031900000000c500418400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '6'),
	(11, _binary 0x4c9b53523232000005d8dc0505050709ced0000029d97600000000856f3988d8c701330f6d007e0091d75901da0053079100ced85e0864009e004b0f3dd8dc01480f9600e50153d53201c1005d0d6f0036d94d0ed7009600ee0f7fd83c00770f140002005fd5270118012b0bdd0017d9320ad4003e01fe0f1bd833002c0c550084008bd702004801210d4c0010d8970e7f00e000f80f79d8f601550f9b003e003bd7b501f100380fff00e2d83a0d4100a600b00e57d81100fd0dce00c80133d75f013101f00fa00074d88e0f2100fc00f00ee9d8a301290f4300b7000ed565015301ef0fc201b3d8300ee1003e01f40f23d85100ad0f9e00e6001ed7c4011100990b6400c2d8330e5f00c70043096ad8ff01770d4b00280014d279011f01710df800b7d86f0fa1008700ed0f2dd8ba01ee0dea0020002cd7520176008b0d1a0009d92f0e1f009b00a90bfcd8e501a90f05010400b4d739014401a80f3f0070d8a80ef9004f01e1090cd954012a0f0601f400a2d75000a2f8dea1941153eca309e5f4fdcd40461103580d0acc26fcaf193fd2710e553af1ef8c0fab3cf318b873fdf19817d0234312afd46d06fe84e6decb099a886a88d46e27243f16e5f8a103c8fb58d01c038608440f9f1ad72b20028a806e84e201465d3604c8ffeef12ee800a6eafe4f0b89eadf0c9f1198e1f11a3218f00bcf308be8b9ff6a063e08f92f542caa08580ba71877506f88b60d3eed8c08ebda260da2787a800f016cdd738432039d06400f3724ec0372f97e7a448073a5ba9872784e01e6489d5beb089f88d0fbac0f5bc9bc078a8097863886535fd68e568367073ef7d4d9b7f67ffc6c2b18f54cedf425de3d767d38d94c1a0ccb121c4efcbf80e5236c10818267fe2e9b9e23a9928182fd969080a326337a8180edfde3ffd4201f072b844a80e7f937da5481a6f9337c5d831bd1778b41fe727c03bbaf5926813b80440730f7eb32ab801685b303d37d26db6e12af779fddd0fce1d8000700133c4c851d01d8de793c30e4b85d73a4549ce1204901021f25bedb016e0013fe11c59505cb4ffc4cc030870409052801234078fe07c5fd05f8fffeff760400a50112b40801bf011c439dff00d8e30020370b0017021b27fe68fd5c0d0040031626c056c0434018c5540dcb5bfefe5b4ac005606c94140145100cfd98c0c527c1fe55ffc156f20f05981b125854c0c03b56fad201a02213ff40044312d83024092fc04705c03b86c1c172c211005b2627b54353ff525304c52d2ad13905002538068411058345124c54c0460555c4d4011e46fafd3e3ac0fb8b1d011653f7fe3bff3b27fe4eff5bc0c005ff5ebec204010d57223a4a03d9065930c25607c512642c2f4508000a722efe2cee04013d7283c2500f05b3751b54fe583d04c0c5cc01587a10404005c1fb26c04658ff06003b7a22186a1300a588203a3e6727c16cc0c1701ac50d8c31fffffd3b4fff05fe3b9253fc2c1200a04f29c51854596755821dc50b9031fffe2738ff3fee53fbf6c1fdfffcff07d5475c46c0fcff410c001f962126fec353c15407c5d59df548c1c00800625b93c75e940b00eea72905c15f18fcfe060041a8b2c2c691050142b1fdfd381705deb6e341fcfffd04fcfa27fffcc2fefffe3bfdfa24fc0b006cb79e0688c61c6d070109b82d40fe06d871be24fd0700e6c15b1ac3c35b0c002f0664a5bdc45810005ec54cc4c319c0c5c3c2c1c305c0c11ac5020052c971030c057bcb314173c0c038ff06d813ca57c20a0049cb3118fe41fc3807009fce1f23f8f5f8f5070097d0651ec2c5c5c50800fdde5271c376050083e2f2c018d001ece6223758cd00ed302cc0c058c308c538ec9894c1af04003e2c3a9ede01feea295bfed20049291dc7c6c7c4c406c1c31bc4c3c2c1c3ff06c4fa19c0c00900b4f3f2c0c5933c050078f95038f900d87ef846fcfcfbce00272536c3c3ff7ac46e110543fc3b4027fefd3fc1f8f0fe0410e10e31b10415090e35600410cbd5375cde11091a3159c1c31090fb4dfc2e051009f43470dc111e342d7804d5a83291270144420101c50005ce010100000218c50005d801014542000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '8'),
	(12, _binary 0x4d675352323200000424280505050709ced00000282576000000008333229524cc013e06bd0001003f2b7c01a0005f09b4000225230e900021012b0dd72416004a06f10065002e2b7f016300000fab0041259d0ece004d01210250244c009b0c7200f500f82d9301b9005e016a00a724920ed200c700fd0f5c24d701450f4b001f004f2b71017d006e0fb2006a24720ebb0040011d05ef2469019f0fa5009d01f02c76014700fd0eb900dc243d0bce00e800810fd524ab01300fe2002c00382b4e01a700590f3200ca2435069f006500440fd0243600c70192009d018c228c0145007d0a96004a259a0805e1b106ff074921230df6a9460013f19b2c7f372be80fdef7cef771ae187684f3084a74ced992f9b3f5d88ffc07d2b058025903fa16ac1e312a13f24400d9032a17b926a380bffd652103000ee9f7641e59563508fd0d2f8ff5b1fc3e0932ec2d2c3611fbf5e5fc2f704235e5766104ce7a04f699370be51f763373a22309496f1d82138182f802bddb3003caf91ee284090628ef0b91fbaef48309cddd2308f60623fca6146b35abf8d6fe0b0c4780aa217b1305e62df3bf7cfdb18fefe7b081829f7da6a5c501d903ef1736dafbc20000040b455084140c240163b97c2ad1099d75ab9896e8203a01c73d19500f01860dfac104fcffe5fec1fefdc1c0060504ca1923ff461000b51cf4dafec0fffcff3b91c3f93401742cf73efef4c03a4013015f2de9318a29fbe4ff69c00b0075f7fd480d3f0c00944606f653fb60c10f004d49edf3fe4511580500724977af13046d60ec363bff3591ff5722017b6577c1c0410d04816712ff442bffbe0704526c76c1c1c2ff060504d46c25c0591100fe72e9e4feff5effff2b3a4603246f7d74887812c57678d33126c0fffe5387ff03246f806bc181c0cb0088acfcfcfdfd30fe05c0402801858b7ac3c3057f85db0b018c8e0324fe4a0824858e6d866d7f0519040ba0db30fffec13b3b356454feffc1fe05c57ba5468a0500f5a127910b0489a39bc4a0c385070504d4a22c641100ce63a7c5e6c39ac0966276c200498e5b65760500d06b34c5600801d5ae2d4491ff072490bc6bc61c007ebeb4e1c3c3c4c5c379b4c28ae4c5a98c8705007ec63edb320410b606563b1f1a24c0c737fffeff3a2efadf21fefdc0fdff3afff9dafafdfdfbfdfe3b0704f7c835ffff450fc555dd6881c0c294979dcb005efd476ec296c1c306c3c62211bf29d7c099c3007eff47c2c3c4c903c57fdf19c30f0048dd50aac396ac730b004ddd4c0479c6e77d0600a6daba01cdc3e0c41300abeac906c2c1e2c2c6c3c2c2c106c3c6ecc4c20400e1ecf8650034e22140fbff05c5e5e813fe540410ae059f290734730b27c20710e80d42e2ff9f0610320df897c42111ce3750fa37c81033611fc25c7ec1c13ac501345d4f107c03100d5169da05113e590c5f81420525010100160000c500063c010100000000804200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '10');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
