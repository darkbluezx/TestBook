CREATE SCHEMA `ShoppingMall` ;

CREATE TABLE `ShoppingMall`.`ordermain` (
  `orderNo` VARCHAR(100) NOT NULL,
  `memberNo` VARCHAR(100) NOT NULL,
  `recipient` VARCHAR(100) NOT NULL COMMENT '收件人',
  `email` VARCHAR(200) NOT NULL,
  `phoneNumber` VARCHAR(100) NOT NULL,
  `paymentMethod` VARCHAR(10) NOT NULL COMMENT '01 for 信用卡\n02 for 轉帳\n03 for 貨到付款',
  `paymentStatus` VARCHAR(10) NOT NULL COMMENT '01 for 已付款\n02 for 未付款',
  `orderTotal` DECIMAL(15,2) NOT NULL,
  `orderTime` DATETIME NOT NULL,
  `ShoppingEventId` INT,
  `DiscountEventId` INT,
  `FreeBieEventId` INT,
  `shippingNo` VARCHAR(100),
  `orderCancel` INT NOT NULL COMMENT '1 for 存活\n2 for 已取消',
  PRIMARY KEY (`orderNo`));
  
  
CREATE TABLE `ShoppingMall`.`orderitem` (
  `orderItemId` INT NOT NULL,
  `orderNo` VARCHAR(100) NOT NULL,
  `productNo` INT NOT NULL COMMENT '參考BookBean的bookId',
  `productName` VARCHAR(200) NOT NULL ,
  `productPriceAtTheTime` DECIMAL(15,2) NOT NULL ,
  `productQuantity` INT NOT NULL,
  PRIMARY KEY (`orderItemId`, `orderNo`),
  INDEX `orderNo_idx` (`orderNo` ASC) VISIBLE,
  CONSTRAINT `orderNo_orderItem`
    FOREIGN KEY (`orderNo`)
    REFERENCES `ShoppingMall`.`ordermain` (`orderNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `ShoppingMall`.`shippingdata` (
  `orderNo` VARCHAR(100) NOT NULL,
  `changeTime` DATETIME NOT NULL COMMENT '同訂單\n第一次與訂購時間一樣\n第二次則以當時修改時間為主\n',
  `address` VARCHAR(100) NOT NULL,
  `shippingMethod` VARCHAR(10) NOT NULL COMMENT '01 for 宅配到家\n 02 for 到店取貨',
  `shippingStatus` VARCHAR(10) NULL COMMENT 'null for 尚未發貨\n 01 for 節點1\n 02 for 節點2\n 03 for 已送達地點\n目前設定如左',
  `orderNo_sort` INT COMMENT '1 for 未修改\n 2 for 修改1次\n 3 for 修改2次\n 最多修改2次',
  
  CONSTRAINT `orderNo_shippingata`
    FOREIGN KEY (`orderNo`)
    REFERENCES `ShoppingMall`.`ordermain` (`orderNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
CREATE TABLE `ShoppingMall`.`CartNo` (
  `KEY_DATE` VARCHAR(32) NOT NULL,
  SERNO INT NOT NULL,
  PRIMARY KEY (`KEY_DATE`));

INSERT INTO `ShoppingMall`.`ordermain`
(`orderNo`,`memberNo`, `recipient`, `email`, `phoneNumber`, `paymentMethod`,`paymentStatus`,`orderTotal`,`orderTime`, `ShoppingEventId`, `DiscountEventId`, `FreeBieEventId`, `shippingNo`, `orderCancel`)
VALUES
('20200312000121','11', 'aaa', 'test1@easyshopping.com', '0952329767', '01', '01', 1520, '20200312', null, null, null, '1234561', 1),
('20200320000122','13', 'bbb', 'test2@gmail.com', '0916739340', '02', '01', 1000, '20200320', null, null, null, '1234562', 1),
('20200410000123','20', 'ccc', 'test3@gmail.com', '0988289689', '01', '01', 2200, '20200410', null, null, null, '1234563', 1),
('20200521000124','11', 'aaa', 'test1@easyshopping.com', '0952329767', '01', '01', 3000, '20200521', null, null, null, '1234564', 2),
('20200521000125','11', 'ddd', 'test1@easyshopping.com', '0935773578', '03', '02', 1900, '20200523', null, null, null, '1234565', 1);

INSERT INTO `ShoppingMall`.`orderitem`
(`orderItemId`,`orderNo`,`productNo`,`productName`,`productPriceAtTheTime`,`productQuantity`)
VALUES
(1, '20200312000121', 4, '哈哈', 350,2),
(2, '20200312000121', 3, '推演123', 350, 3),
(3, '20200312000121', 2, '深入淺出網站設計', 480, 1),
(4, '20200312000121', 1, 'FLASHCS4互動網頁設計', 550, 4),
(1, '20200320000122', 5, '挖喔123', 350, 7),
(2, '20200320000122', 6, '紅葡萄柚', 120, 1),
(1, '20200410000123', 8, '白花椰菜', 50, 4),
(2, '20200410000123', 7, '黃葡萄柚', 120, 5),
(3, '20200410000123', 9, '草莓', 100, 2),
(1, '20200521000124', 11, '香蕉', 20, 2),
(2, '20200521000124', 13, '柑橘', 23, 2),
(3, '20200521000124', 12, '奇異果', 80, 2),
(4, '20200521000124', 10, '紅蘿蔔', 50, 2),
(1, '20200521000125', 14, '茄子', 15, 2),
(2, '20200521000125', 15, '綠花椰菜', 45, 2);


INSERT INTO `ShoppingMall`.`shippingdata`
(`orderNo`,`changeTime`,`address`,`shippingMethod`,`shippingStatus`,`orderNo_sort`)
VALUES
('20200312000121', '20200312', 'TAIPEI', '01', null, null),
('20200312000121', '20200313', 'KEELUNG', '01', '01', 1),
('20200320000122', '20200320', 'TAIPEI', '02', '03', null),
('20200410000123', '20200410', 'TAICHUNG', '01', '02', null),
('20200521000124', '20200522', 'TAIPEI', '01', '02', null),
('20200521000125', '20200524', 'TAIPEI', '02', null, null);


