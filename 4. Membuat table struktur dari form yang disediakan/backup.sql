SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `idregion` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cityregion`(`idregion` ASC) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE,
  CONSTRAINT `cityregion` FOREIGN KEY (`idregion`) REFERENCES `region` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES (1, 1, 'Kabupaten Ciamis');
INSERT INTO `city` VALUES (2, 1, 'Kota Bandung');
INSERT INTO `city` VALUES (3, 1, 'Kota Cimahi');

-- ----------------------------
-- Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(56) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `countrycode` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Kode telepon',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES (1, 'Indonesia', '+62');
INSERT INTO `country` VALUES (2, 'Vietnam', '+84');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `idcountry` int NOT NULL COMMENT 'country code nomor hp',
  `phone` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Contoh 851xxxxxxxx',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Panjang 40 karena disimulasikan dihash menggunakan sha1',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customerphonecountry`(`idcountry` ASC) USING BTREE,
  CONSTRAINT `customerphonecountry` FOREIGN KEY (`idcountry`) REFERENCES `country` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, 'Chandika Nurdiansyah', 1, '85155401220', 'chandika7d@gmail.com', '7288edd0fc3ffcbe93a0cf06e3568e28521687bc');
INSERT INTO `customer` VALUES (2, 'Hana Dewi Fitriyani', 1, '85123113524', 'hanaf@gmail.com', '3e43a51a0f28d0b5cfa34338f4bf62e07ed67c74');

-- ----------------------------
-- Table structure for driver
-- ----------------------------
DROP TABLE IF EXISTS `driver`;
CREATE TABLE `driver`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `idcountry` int NOT NULL COMMENT 'contry code nomor hp',
  `phone` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `idcity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `driverphonecountry`(`idcountry` ASC) USING BTREE,
  INDEX `driverdomicilecity`(`idcity` ASC) USING BTREE,
  CONSTRAINT `driverdomicilecity` FOREIGN KEY (`idcity`) REFERENCES `city` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `driverphonecountry` FOREIGN KEY (`idcountry`) REFERENCES `country` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of driver
-- ----------------------------
INSERT INTO `driver` VALUES (1, 'Hili Aziz', 1, '8234213424564', 'hilm@gmail.comi', '3e43a51a0f28d0b5cfa34338f4bf62e07ed67c74', 2);
INSERT INTO `driver` VALUES (2, 'Budi M Ynus', 1, '8123145231234', 'budi@gmail.com', '3e43a51a0f28d0b5cfa34338f4bf62e07ed67c74', 3);

-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `addressname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lat` decimal(18, 15) NOT NULL,
  `lon` decimal(18, 15) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location` VALUES (1, 'STIKES MUHAMMADIAH CIAMIS', 'Jl. K.H. Ahmad Dahlan No. 20, Ciamis, Kec. Ciamis, Kabupaten Ciamis, Jawa Barat 46216 ', 0.123142342343423, 102.123421352230000);
INSERT INTO `location` VALUES (2, 'Caudio', 'Jl. Pasirluyu Rt.02 Rw.05 Pasirluyu, Kec. Regol, Kota Bandung, Jawa Barat 40254 ', 0.546714233453423, 103.237826349827300);
INSERT INTO `location` VALUES (3, 'denaraolshop', 'Sukabungah, Kec. Sukajadi, Kota Bandung, Jawa Barat 40162', -6.895772990663756, 107.594104907964690);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `orderdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idcustomer` int NOT NULL,
  `iddriver` int NOT NULL,
  `idvehicle` int NOT NULL,
  `distance` decimal(3, 1) NOT NULL COMMENT 'satuan km',
  `pickupdate` timestamp NULL DEFAULT NULL,
  `idpickup` int NOT NULL COMMENT 'dari tabel location',
  `dropdate` timestamp NULL DEFAULT NULL,
  `iddrop` int NOT NULL COMMENT 'dari tabel location',
  `appservicefee` int NOT NULL,
  `tripfare` int NOT NULL,
  `discount` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pickuplocation`(`idpickup` ASC) USING BTREE,
  INDEX `droplocation`(`iddrop` ASC) USING BTREE,
  INDEX `ordervechile`(`idvehicle` ASC) USING BTREE,
  INDEX `orderdriver`(`iddriver` ASC) USING BTREE,
  INDEX `ordercustomer`(`idcustomer` ASC) USING BTREE,
  CONSTRAINT `droplocation` FOREIGN KEY (`iddrop`) REFERENCES `location` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ordercustomer` FOREIGN KEY (`idcustomer`) REFERENCES `customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orderdriver` FOREIGN KEY (`iddriver`) REFERENCES `driver` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ordervechile` FOREIGN KEY (`idvehicle`) REFERENCES `vehicle` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pickuplocation` FOREIGN KEY (`idpickup`) REFERENCES `location` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('RB-137786-24-20824', '2023-04-16 03:37:15', 1, 1, 1, 7.3, '2023-04-16 15:42:02', 2, '2023-04-16 16:18:17', 3, 3000, 18500, 0);

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `idorder` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `idpaymentmethod` int NULL DEFAULT NULL,
  `amout` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `paymentmethod`(`idpaymentmethod` ASC) USING BTREE,
  INDEX `orderpayment`(`idorder` ASC) USING BTREE,
  CONSTRAINT `paymentmethod` FOREIGN KEY (`idpaymentmethod`) REFERENCES `paymentmethod` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orderpayment` FOREIGN KEY (`idorder`) REFERENCES `order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES (1, 'RB-137786-24-20824', 2, 21500);

-- ----------------------------
-- Table structure for paymentmethod
-- ----------------------------
DROP TABLE IF EXISTS `paymentmethod`;
CREATE TABLE `paymentmethod`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paymentmethod
-- ----------------------------
INSERT INTO `paymentmethod` VALUES (1, 'Cash');
INSERT INTO `paymentmethod` VALUES (2, 'Gopay');
INSERT INTO `paymentmethod` VALUES (3, 'Gopay Coin');

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `idcountry` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `regioncountry`(`idcountry` ASC) USING BTREE,
  CONSTRAINT `regioncountry` FOREIGN KEY (`idcountry`) REFERENCES `country` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of region
-- ----------------------------
INSERT INTO `region` VALUES (1, 1, 'Jawa Barat');
INSERT INTO `region` VALUES (2, 1, 'DKI Jakarta');

-- ----------------------------
-- Table structure for ridetype
-- ----------------------------
DROP TABLE IF EXISTS `ridetype`;
CREATE TABLE `ridetype`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `kmfee` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ridetype
-- ----------------------------
INSERT INTO `ridetype` VALUES (1, 'GoRide', 2500);
INSERT INTO `ridetype` VALUES (2, 'GoCar', 6000);
INSERT INTO `ridetype` VALUES (3, 'GoCar Protect+', 7000);
INSERT INTO `ridetype` VALUES (4, 'GoCar (L)', 7000);
INSERT INTO `ridetype` VALUES (5, 'GoBluebird', 10000);

-- ----------------------------
-- Table structure for vehicle
-- ----------------------------
DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE `vehicle`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `iddriver` int NOT NULL,
  `ridetype` int NOT NULL,
  `idvehiclebrand` int NOT NULL,
  `platenumber` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `drivervechile`(`iddriver` ASC) USING BTREE,
  INDEX `vechilebrand`(`idvehiclebrand` ASC) USING BTREE,
  INDEX `vechileridetype`(`ridetype` ASC) USING BTREE,
  CONSTRAINT `drivervechile` FOREIGN KEY (`iddriver`) REFERENCES `driver` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `vechilebrand` FOREIGN KEY (`idvehiclebrand`) REFERENCES `vehiclebrand` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `vechileridetype` FOREIGN KEY (`ridetype`) REFERENCES `ridetype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vehicle
-- ----------------------------
INSERT INTO `vehicle` VALUES (1, 1, 1, 3, 'Z3386IN', '2023-05-12 01:24:50');
INSERT INTO `vehicle` VALUES (2, 2, 4, 2, 'D1801AJ\"Q', '2023-05-11 06:43:29');

-- ----------------------------
-- Table structure for vehiclebrand
-- ----------------------------
DROP TABLE IF EXISTS `vehiclebrand`;
CREATE TABLE `vehiclebrand`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `brand` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vehiclebrand
-- ----------------------------
INSERT INTO `vehiclebrand` VALUES (1, 'Fomo', 'Wuling');
INSERT INTO `vehiclebrand` VALUES (2, 'Sigra', 'Daihatsu');
INSERT INTO `vehiclebrand` VALUES (3, 'Scoopy', 'Honda');
INSERT INTO `vehiclebrand` VALUES (4, 'Vario 150', 'Honda');

SET FOREIGN_KEY_CHECKS = 1;
