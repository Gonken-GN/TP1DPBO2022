/*
 Navicat Premium Data Transfer

 Source Server         : mykoneksi
 Source Server Type    : MySQL
 Source Server Version : 100422
 Source Host           : localhost:3306
 Source Schema         : db_tp1

 Target Server Type    : MySQL
 Target Server Version : 100422
 File Encoding         : 65001

 Date: 31/03/2022 20:59:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for autor
-- ----------------------------
DROP TABLE IF EXISTS `autor`;
CREATE TABLE `autor`  (
  `id_autor` bigint NOT NULL AUTO_INCREMENT,
  `nama_autor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jumlah_buku` bigint NULL DEFAULT NULL,
  `img_autor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_autor`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of autor
-- ----------------------------
INSERT INTO `autor` VALUES (101, 'Sir Arthur Conan Doyle', 24, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FArthur_Conan_Doyle&psig=AOvVaw1saXhgn4nFHUr80joIo27v&ust=1648036362046000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJCfkoHU2fYCFQAAAAAdAAAAABAD');
INSERT INTO `autor` VALUES (102, 'William Stalling', 40, 'https://www.google.com/url?sa=i&url=http%3A%2F%2Findependent.academia.edu%2Fstallingswilliam&psig=AOvVaw2Vspkc82WrMbyxCxglT7uO&ust=1648036886920000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCOjvs_vV2fYCFQAAAAAdAAAAABAg');
INSERT INTO `autor` VALUES (103, 'Gonken', 2, 'www.bebas.com');
INSERT INTO `autor` VALUES (104, 'Bebas', 343, 'www.gelo.com');
INSERT INTO `autor` VALUES (105, 'asta', 123, 'bebas');
INSERT INTO `autor` VALUES (107, 'Sir Arthur Conan Doyle', 191, '343');
INSERT INTO `autor` VALUES (108, 'bebas', 123, 'bebas');

-- ----------------------------
-- Table structure for buku
-- ----------------------------
DROP TABLE IF EXISTS `buku`;
CREATE TABLE `buku`  (
  `id_buku` bigint NOT NULL AUTO_INCREMENT,
  `img_buku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `penerbit_buku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `autor_buku` bigint NOT NULL,
  `Desc_buku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_buku`) USING BTREE,
  INDEX `foreign`(`autor_buku` ASC) USING BTREE,
  CONSTRAINT `foreign` FOREIGN KEY (`autor_buku`) REFERENCES `autor` (`id_autor`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of buku
-- ----------------------------
INSERT INTO `buku` VALUES (1, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Febooks.gramedia.com%2Fid%2Fbuku%2Fsherlock-holmes-koleksi-kasus-1&psig=AOvVaw3CWeLAsxbfj3PWHVeQYYfs&ust=1648036229067000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCNjqscLT2fYCFQAAAAAdAAAAABAD', 'Gramedia Pustaka Utama', 101, 'Novel');
INSERT INTO `buku` VALUES (3, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fshopee.co.id%2FBuku-OPERATING-SYSTEMS-internals-and-design-principles-9TH-WILLIAM-STALLING-i.188609865.7604467643&psig=AOvVaw3wimbZKOvOGtShnA2z2a_7&ust=1648037101529000&source=images&cd=vfe&ved=0CAsQjRxqFw', 'Gramedia Pustaka', 102, 'Textbook');
INSERT INTO `buku` VALUES (5, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.gramedia.com%2Fapi%2Famp%2Fproduct%2Fsherlock-holmes-a-study-in-scarlet%2F&psig=AOvVaw2hSlg3jNTBHmczxKePqAdH&ust=1648037481914000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCLCZ1prY2fYCFQAAAAAdAAAAABAD', 'Gramedia Pustaka', 101, 'Novel');
INSERT INTO `buku` VALUES (6, 'www.bebas.com', 'gonken', 103, 'Novel');
INSERT INTO `buku` VALUES (8, 'Bebas', 'bebas123', 101, 'Novel');

SET FOREIGN_KEY_CHECKS = 1;
