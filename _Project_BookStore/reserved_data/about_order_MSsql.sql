CREATE DATABASE ShoppingMall 
GO

USE ShoppingMall

CREATE TABLE ordermain (
  orderNo NVARCHAR(50) NOT NULL,
  CONSTRAINT PK_orderNo primary key (orderNo),
  memberNo NVARCHAR(50) NOT NULL,
  recipient NVARCHAR(50) NOT NULL,  	  -- 收件人
  email NVARCHAR(100) NOT NULL,
  phoneNumber NVARCHAR(50) NOT NULL,
  paymentMethod NVARCHAR(10) NOT NULL,    -- 01 for 信用卡, 02 for 轉帳, 03 for 貨到付款
  paymentStatus NVARCHAR(10) NOT NULL,    -- 01 for 已付款, 02 for 未付款
  orderTotal MONEY NOT NULL,
  orderTime DATETIME NOT NULL,
  ShoppingEventId INT,
  DiscountEventId INT,
  FreeBieEventId INT,
  shippingNo NVARCHAR(50),
  orderCancel INT NOT NULL,               -- 1 for 存活, 2 for 已取消'
  )
  
CREATE TABLE orderitem (
  orderItemId INT NOT NULL,
  orderNo NVARCHAR(50) NOT NULL,
  CONSTRAINT PK_orderNo_orderItemId primary key (orderNo,orderItemId),
  productNo INT NOT NULL,                 -- 參考BookBean的bookId
  productName NVARCHAR(100) NOT NULL ,
  productPriceAtTheTime MONEY NOT NULL ,
  productQuantity INT NOT NULL,
  CONSTRAINT FK_orderitem_orderNo FOREIGN KEY (orderNo)
    REFERENCES ordermain (orderNo),
	)


CREATE TABLE shippingdata (
  orderNo NVARCHAR(50) NOT NULL,
  changeTime DATETIME NOT NULL,     -- 同訂單, 第一次與訂購時間一樣, 第二次則以當時修改時間為主
  CONSTRAINT PK_orderNo_changeTime primary key (orderNo,changeTime),
  address NVARCHAR(50) NOT NULL,
  shippingMethod NVARCHAR(10) NOT NULL,      -- 01 for 宅配到家, 02 for 到店取貨
  shippingStatus NVARCHAR(10) NULL,         -- null for 尚未發貨, 01 for 節點1, 02 for 節點2, 03 for 已送達地點, 目前設定如左
  orderNo_sort INT,                  -- 1 for 未修改, 2 for 修改1次, 3 for 修改2次, 最多修改2次
  CONSTRAINT FK_orderNo_shippingata FOREIGN KEY (orderNo) REFERENCES ordermain (orderNo)
  )
  
CREATE TABLE CartNo (
  KEY_DATE NVARCHAR(16) NOT NULL,
  CONSTRAINT PK_KEY_DATE primary key (KEY_DATE),
  SERNO INT NOT NULL
  )
GO

---------以下看情況導入----------

INSERT INTO ordermain(orderNo, memberNo, recipient, email, phoneNumber, paymentMethod, paymentStatus, orderTotal, orderTime, ShoppingEventId, DiscountEventId, FreeBieEventId, shippingNo, orderCancel)
VALUES
('20200312000121','11', 'aaa', 'test1@easyshopping.com', '0952329767', '01', '01', 1520, '20200312', null, null, null, '1234561', 1),
('20200320000122','13', 'bbb', 'test2@gmail.com', '0916739340', '02', '01', 1000, '20200320', null, null, null, '1234562', 1),
('20200410000123','20', 'ccc', 'test3@gmail.com', '0988289689', '01', '01', 2200, '20200410', null, null, null, '1234563', 1),
('20200521000124','11', 'aaa', 'test1@easyshopping.com', '0952329767', '01', '01', 3000, '20200521', null, null, null, '1234564', 2),
('20200521000125','11', 'ddd', 'test1@easyshopping.com', '0935773578', '03', '02', 1900, '20200523', null, null, null, '1234565', 1)

INSERT INTO orderitem(orderItemId, orderNo, productNo, productName, productPriceAtTheTime, productQuantity)
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
(2, '20200521000125', 15, '綠花椰菜', 45, 2)


INSERT INTO shippingdata(orderNo, changeTime, address, shippingMethod, shippingStatus, orderNo_sort)
VALUES
('20200312000121', '2020-03-12', 'TAIPEI', '01', null, null),
('20200312000121', '2020-03-13', 'KEELUNG', '01', '01', 1),
('20200320000122', '2020-03-20', 'TAIPEI', '02', '03', null),
('20200410000123', '2020-04-10', 'TAICHUNG', '01', '02', null),
('20200521000124', '2020-05-22', 'TAIPEI', '01', '02', null),
('20200521000125', '2020-05-24', 'TAIPEI', '02', null, null);
GO


