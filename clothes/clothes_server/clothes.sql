SET NAMES UTF8;
DROP DATABASE IF EXISTS clothes;
CREATE DATABASE clothes CHARSET=UTF8;
USE clothes;
CREATE TABLE clothes_user(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(10),
    truename VARCHAR(10),
    sex   char(2),
    city  VARCHAR(5),
    phone VARCHAR(11),
    email VARCHAR(16),
    upwd VARCHAR(32),
    rpwd VARCHAR(32)
);
INSERT INTO clothes_user VALUES('1','mint','薄荷',0,'成都',13033331966,'666@qq.com','666666','666666');
INSERT INTO clothes_user VALUES('','pb','皮皮',1,'上海',13033331967,'123@qq.com','123456','123456');

CREATE TABLE clothes_product(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(255),
    title VARCHAR(200),
    price DECIMAL(6,2),
    label VARCHAR(10)
);
INSERT INTO clothes_product VALUES('1','product1.jpg','大翻领设计H版型撞色领时尚外套CFAHFCO337','1472.00','FW19秋冬系列');
INSERT INTO clothes_product VALUES('','product2.png','轻薄羊绒假V领套头毛衫CSAHFOT003','1036.00','毛衫');
INSERT INTO clothes_product VALUES('','product3.png','独特设计宽松版型卫衣布裤CSAHFPP108','546.00','卫衣');
INSERT INTO clothes_product VALUES('','product3.png','独特设计宽松版型卫衣布上衣 CSAHFTT107','476.00','卫衣');
INSERT INTO clothes_product VALUES('','product4.png','1独特设计宽松版型风衣布薄褛CSAHFTC096','1008.00','风衣');
INSERT INTO clothes_product VALUES('','product4.png','2独特设计宽松版型风衣布薄褛CSAHFTC096','1008.00','风衣');
INSERT INTO clothes_product VALUES('','product4.png','3独特设计宽松版型风衣布薄褛CSAHFTC096','1008.00','风衣');
INSERT INTO clothes_product VALUES('','product4.png','4独特设计宽松版型风衣布薄褛CSAHFTC096','1008.00','风衣');
INSERT INTO clothes_product VALUES('','product4.png','5独特设计宽松版型风衣布薄褛CSAHFTC096','1008.00','风衣');
INSERT INTO clothes_product VALUES('','product4.png','6独特设计宽松版型风衣布薄褛CSAHFTC096','1008.00','风衣');
INSERT INTO clothes_product VALUES('','product4.png','7独特设计宽松版型风衣布薄褛CSAHFTC096','1008.00','风衣');
INSERT INTO clothes_product VALUES('','product4.png','8独特设计宽松版型风衣布薄褛CSAHFTC096','1008.00','风衣');
INSERT INTO clothes_product VALUES('','product4.png','9独特设计宽松版型风衣布薄褛CSAHFTC096','1008.00','风衣');
INSERT INTO clothes_product VALUES('','product4.png','10独特设计宽松版型风衣布薄褛CSAHFTC096','1008.00','风衣');
INSERT INTO clothes_product VALUES('','product4.png','11独特设计宽松版型风衣布薄褛CSAHFTC096','1008.00','风衣');
INSERT INTO clothes_product VALUES('','product4.png','12独特设计宽松版型风衣布薄褛CSAHFTC096','1008.00','风衣');
INSERT INTO clothes_product VALUES('','product4.png','13独特设计宽松版型风衣布薄褛CSAHFTC096','1008.00','风衣');
INSERT INTO clothes_product VALUES('','product4.png','14独特设计宽松版型风衣布薄褛CSAHFTC096','1008.00','风衣');
INSERT INTO clothes_product VALUES('','product4.png','15独特设计宽松版型风衣布薄褛CSAHFTC096','1008.00','风衣');
INSERT INTO clothes_product VALUES('','product4.png','16独特设计宽松版型风衣布薄褛CSAHFTC096','1008.00','风衣');
INSERT INTO clothes_product VALUES('','product5.png','宽松版型轻薄七分阔腿裤CSAHFPW016','686.00','FW19秋冬系列');
INSERT INTO clothes_product VALUES('','product5.png','1宽松版型轻薄圆领针织套头毛衫CSAHFOT015','399.00','毛衫');
INSERT INTO clothes_product VALUES('','product5.png','2宽松版型轻薄圆领针织套头毛衫CSAHFOT015','399.00','毛衫');
INSERT INTO clothes_product VALUES('','product5.png','3宽松版型轻薄圆领针织套头毛衫CSAHFOT015','399.00','毛衫');
INSERT INTO clothes_product VALUES('','product5.png','4宽松版型轻薄圆领针织套头毛衫CSAHFOT015','399.00','毛衫');
INSERT INTO clothes_product VALUES('','product5.png','5宽松版型轻薄圆领针织套头毛衫CSAHFOT015','399.00','毛衫');
INSERT INTO clothes_product VALUES('','product6.png','不规则下摆多层次感半截裙CSAHFKT091','476.00','FW19秋冬系列');
INSERT INTO clothes_product VALUES('','product7.png','1简约学院长袖卫衣布裤子CSAHFPP098','616.00','卫衣');
INSERT INTO clothes_product VALUES('','product7.png','2简约学院长袖卫衣布外套CSAHFJK097','896.00','卫衣');
INSERT INTO clothes_product VALUES('','product7.png','3简约学院长袖卫衣布裤子CSAHFPP098','616.00','卫衣');
INSERT INTO clothes_product VALUES('','product7.png','4简约学院长袖卫衣布外套CSAHFJK097','896.00','卫衣');
INSERT INTO clothes_product VALUES('','product7.png','5简约学院长袖卫衣布裤子CSAHFPP098','616.00','卫衣');
INSERT INTO clothes_product VALUES('','product7.png','6简约学院长袖卫衣布外套CSAHFJK097','896.00','卫衣');
INSERT INTO clothes_product VALUES('','product7.png','7简约学院长袖卫衣布裤子CSAHFPP098','616.00','卫衣');
INSERT INTO clothes_product VALUES('','product7.png','8简约学院长袖卫衣布外套CSAHFJK097','896.00','卫衣');
INSERT INTO clothes_product VALUES('','product8.jpg','1圆领前幅开叉修身版型T桖衫CSAHFTT254','340.00','FW19秋冬系列');
INSERT INTO clothes_product VALUES('','product9.jpg','2简约宽松版型设计修身开衩包臀裙CFAIFKT227','780.00','FW19秋冬系列');
INSERT INTO clothes_product VALUES('','product8.jpg','3圆领前幅开叉修身版型T桖衫CSAHFTT254','340.00','FW19秋冬系列');
INSERT INTO clothes_product VALUES('','product9.jpg','4简约宽松版型设计修身开衩包臀裙CFAIFKT227','780.00','FW19秋冬系列');
INSERT INTO clothes_product VALUES('','product8.jpg','5圆领前幅开叉修身版型T桖衫CSAHFTT254','340.00','FW19秋冬系列');
INSERT INTO clothes_product VALUES('','product9.jpg','6简约宽松版型设计修身开衩包臀裙CFAIFKT227','780.00','FW19秋冬系列');
INSERT INTO clothes_product VALUES('','product10.jpg','1简约圆领纯色宽松版型纯羊绒套头衫CSIFOT001','980.00','羊绒');
INSERT INTO clothes_product VALUES('','product11.jpg','2深V领宽松蝙蝠袖羊绒上衣CFAHFOT186','948.00','羊绒');
INSERT INTO clothes_product VALUES('','product12.jpg','3高领多重穿搭蝙蝠袖羊绒上衣CFAHFOT183','1668.00','羊绒');
INSERT INTO clothes_product VALUES('','product13.jpg','4深V领设计破边羊绒斗篷CFAHFOT136','1668.00','羊绒');
INSERT INTO clothes_product VALUES('','product10.jpg','5简约圆领纯色宽松版型纯羊绒套头衫CSIFOT001','980.00','羊绒');
INSERT INTO clothes_product VALUES('','product10.jpg','6简约圆领纯色宽松版型纯羊绒套头衫CSIFOT001','980.00','羊绒');
INSERT INTO clothes_product VALUES('','product11.jpg','6深V领宽松蝙蝠袖羊绒上衣CFAHFOT186','948.00','羊绒');
INSERT INTO clothes_product VALUES('','product12.jpg','7高领多重穿搭蝙蝠袖羊绒上衣CFAHFOT183','1668.00','羊绒');
INSERT INTO clothes_product VALUES('','product13.jpg','8深V领设计破边羊绒斗篷CFAHFOT136','1668.00','羊绒');
INSERT INTO clothes_product VALUES('','product10.jpg','9简约圆领纯色宽松版型纯羊绒套头衫CSIFOT001','980.00','羊绒');
INSERT INTO clothes_product VALUES('','product11.jpg','10深V领宽松蝙蝠袖羊绒上衣CFAHFOT186','948.00','羊绒');
INSERT INTO clothes_product VALUES('','product12.jpg','11高领多重穿搭蝙蝠袖羊绒上衣CFAHFOT183','1668.00','羊绒');
INSERT INTO clothes_product VALUES('','product13.jpg','12深V领设计破边羊绒斗篷CFAHFOT136','1668.00','羊绒');
INSERT INTO clothes_product VALUES('','product14.jpg','简约宽松版型直筒双排扣长款外套CFAIFCO238','3680.00','FW19秋冬系列');
INSERT INTO clothes_product VALUES('','product15.jpg','简约圆领设计撞色边线羊绒开衫CFAIFYS008','1780.00','羊绒');
INSERT INTO clothes_product VALUES('','product16.jpg','欧美风拼色设计减龄羊绒围巾CFAIFSF020','1980.00','羊绒');
INSERT INTO clothes_product VALUES('','product17.jpg','简约圆领设计拼接撞色纱线编织修身上衣CFAIFOT182','2380.00','FW19秋冬系列');
INSERT INTO clothes_product VALUES('','product18.jpg','简约连帽宽松版型短款外套CFAIFSF169','1280.00','FW19秋冬系列');
INSERT INTO clothes_product VALUES('','product19.jpg','双面色休闲设计学院风减龄针织上衣CFAIFOT023','1280.00','毛衫');
INSERT INTO clothes_product VALUES('','product20.jpg','简约双面色针织羊绒开衫CFAIFOT021','3180.00','羊绒');
INSERT INTO clothes_product VALUES('','product21.jpg','1简约圆领羊绒针织套头毛衣CFAIFOT007','1580.00','毛衫');
INSERT INTO clothes_product VALUES('','product21.jpg','2简约圆领羊绒针织套头毛衣CFAIFOT007','1580.00','毛衫');
INSERT INTO clothes_product VALUES('','product21.jpg','3简约圆领羊绒针织套头毛衣CFAIFOT007','1580.00','毛衫');
INSERT INTO clothes_product VALUES('','product21.jpg','4简约圆领羊绒针织套头毛衣CFAIFOT007','1580.00','毛衫');
INSERT INTO clothes_product VALUES('','product21.jpg','5简约圆领羊绒针织套头毛衣CFAIFOT007','1580.00','毛衫');

CREATE TABLE clothes_pic(
    lid INT PRIMARY KEY AUTO_INCREMENT,
    lg1 VARCHAR(255),
    sm1 VARCHAR(255),
    lg2 VARCHAR(255),
    sm2 VARCHAR(255),
    lg3 VARCHAR(255),
    sm3 VARCHAR(255),
    lg4 VARCHAR(255),
    sm4 VARCHAR(255),
    lg5 VARCHAR(255),
    sm5 VARCHAR(255)
);
INSERT INTO clothes_pic VALUES(1,'d1_lg1.jpg','d1_sm1.jpg','d1_lg2.jpg','d1_sm2.jpg','d1_lg3.jpg','d1_sm3.jpg','d1_lg4.jpg','d1_sm4.jpg','d1_lg5.jpg','d1_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d2_lg1.png','d2_sm1.png','d2_lg2.png','d2_sm2.png','d2_lg3.png','d2_sm3.png','d2_lg4.png','d2_sm4.png','d2_lg5.png','d2_sm5.png');
INSERT INTO clothes_pic VALUES('','d3_lg1.jpg','d3_sm1.jpg','d3_lg2.jpg','d3_sm2.jpg','d3_lg3.jpg','d3_sm3.jpg','d3_lg4.jpg','d3_sm4.jpg','d3_lg5.jpg','d3_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d1_lg1.jpg','d1_sm1.jpg','d1_lg2.jpg','d1_sm2.jpg','d1_lg3.jpg','d1_sm3.jpg','d1_lg4.jpg','d1_sm4.jpg','d1_lg5.jpg','d1_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d2_lg1.png','d2_sm1.png','d2_lg2.png','d2_sm2.png','d2_lg3.png','d2_sm3.png','d2_lg4.png','d2_sm4.png','d2_lg5.png','d2_sm5.png');
INSERT INTO clothes_pic VALUES('','d3_lg1.jpg','d3_sm1.jpg','d3_lg2.jpg','d3_sm2.jpg','d3_lg3.jpg','d3_sm3.jpg','d3_lg4.jpg','d3_sm4.jpg','d3_lg5.jpg','d3_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d1_lg1.jpg','d1_sm1.jpg','d1_lg2.jpg','d1_sm2.jpg','d1_lg3.jpg','d1_sm3.jpg','d1_lg4.jpg','d1_sm4.jpg','d1_lg5.jpg','d1_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d2_lg1.png','d2_sm1.png','d2_lg2.png','d2_sm2.png','d2_lg3.png','d2_sm3.png','d2_lg4.png','d2_sm4.png','d2_lg5.png','d2_sm5.png');
INSERT INTO clothes_pic VALUES('','d3_lg1.jpg','d3_sm1.jpg','d3_lg2.jpg','d3_sm2.jpg','d3_lg3.jpg','d3_sm3.jpg','d3_lg4.jpg','d3_sm4.jpg','d3_lg5.jpg','d3_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d1_lg1.jpg','d1_sm1.jpg','d1_lg2.jpg','d1_sm2.jpg','d1_lg3.jpg','d1_sm3.jpg','d1_lg4.jpg','d1_sm4.jpg','d1_lg5.jpg','d1_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d2_lg1.png','d2_sm1.png','d2_lg2.png','d2_sm2.png','d2_lg3.png','d2_sm3.png','d2_lg4.png','d2_sm4.png','d2_lg5.png','d2_sm5.png');
INSERT INTO clothes_pic VALUES('','d3_lg1.jpg','d3_sm1.jpg','d3_lg2.jpg','d3_sm2.jpg','d3_lg3.jpg','d3_sm3.jpg','d3_lg4.jpg','d3_sm4.jpg','d3_lg5.jpg','d3_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d1_lg1.jpg','d1_sm1.jpg','d1_lg2.jpg','d1_sm2.jpg','d1_lg3.jpg','d1_sm3.jpg','d1_lg4.jpg','d1_sm4.jpg','d1_lg5.jpg','d1_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d2_lg1.png','d2_sm1.png','d2_lg2.png','d2_sm2.png','d2_lg3.png','d2_sm3.png','d2_lg4.png','d2_sm4.png','d2_lg5.png','d2_sm5.png');
INSERT INTO clothes_pic VALUES('','d3_lg1.jpg','d3_sm1.jpg','d3_lg2.jpg','d3_sm2.jpg','d3_lg3.jpg','d3_sm3.jpg','d3_lg4.jpg','d3_sm4.jpg','d3_lg5.jpg','d3_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d1_lg1.jpg','d1_sm1.jpg','d1_lg2.jpg','d1_sm2.jpg','d1_lg3.jpg','d1_sm3.jpg','d1_lg4.jpg','d1_sm4.jpg','d1_lg5.jpg','d1_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d2_lg1.png','d2_sm1.png','d2_lg2.png','d2_sm2.png','d2_lg3.png','d2_sm3.png','d2_lg4.png','d2_sm4.png','d2_lg5.png','d2_sm5.png');
INSERT INTO clothes_pic VALUES('','d3_lg1.jpg','d3_sm1.jpg','d3_lg2.jpg','d3_sm2.jpg','d3_lg3.jpg','d3_sm3.jpg','d3_lg4.jpg','d3_sm4.jpg','d3_lg5.jpg','d3_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d1_lg1.jpg','d1_sm1.jpg','d1_lg2.jpg','d1_sm2.jpg','d1_lg3.jpg','d1_sm3.jpg','d1_lg4.jpg','d1_sm4.jpg','d1_lg5.jpg','d1_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d2_lg1.png','d2_sm1.png','d2_lg2.png','d2_sm2.png','d2_lg3.png','d2_sm3.png','d2_lg4.png','d2_sm4.png','d2_lg5.png','d2_sm5.png');
INSERT INTO clothes_pic VALUES('','d3_lg1.jpg','d3_sm1.jpg','d3_lg2.jpg','d3_sm2.jpg','d3_lg3.jpg','d3_sm3.jpg','d3_lg4.jpg','d3_sm4.jpg','d3_lg5.jpg','d3_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d1_lg1.jpg','d1_sm1.jpg','d1_lg2.jpg','d1_sm2.jpg','d1_lg3.jpg','d1_sm3.jpg','d1_lg4.jpg','d1_sm4.jpg','d1_lg5.jpg','d1_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d2_lg1.png','d2_sm1.png','d2_lg2.png','d2_sm2.png','d2_lg3.png','d2_sm3.png','d2_lg4.png','d2_sm4.png','d2_lg5.png','d2_sm5.png');
INSERT INTO clothes_pic VALUES('','d3_lg1.jpg','d3_sm1.jpg','d3_lg2.jpg','d3_sm2.jpg','d3_lg3.jpg','d3_sm3.jpg','d3_lg4.jpg','d3_sm4.jpg','d3_lg5.jpg','d3_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d1_lg1.jpg','d1_sm1.jpg','d1_lg2.jpg','d1_sm2.jpg','d1_lg3.jpg','d1_sm3.jpg','d1_lg4.jpg','d1_sm4.jpg','d1_lg5.jpg','d1_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d2_lg1.png','d2_sm1.png','d2_lg2.png','d2_sm2.png','d2_lg3.png','d2_sm3.png','d2_lg4.png','d2_sm4.png','d2_lg5.png','d2_sm5.png');
INSERT INTO clothes_pic VALUES('','d3_lg1.jpg','d3_sm1.jpg','d3_lg2.jpg','d3_sm2.jpg','d3_lg3.jpg','d3_sm3.jpg','d3_lg4.jpg','d3_sm4.jpg','d3_lg5.jpg','d3_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d1_lg1.jpg','d1_sm1.jpg','d1_lg2.jpg','d1_sm2.jpg','d1_lg3.jpg','d1_sm3.jpg','d1_lg4.jpg','d1_sm4.jpg','d1_lg5.jpg','d1_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d2_lg1.png','d2_sm1.png','d2_lg2.png','d2_sm2.png','d2_lg3.png','d2_sm3.png','d2_lg4.png','d2_sm4.png','d2_lg5.png','d2_sm5.png');
INSERT INTO clothes_pic VALUES('','d3_lg1.jpg','d3_sm1.jpg','d3_lg2.jpg','d3_sm2.jpg','d3_lg3.jpg','d3_sm3.jpg','d3_lg4.jpg','d3_sm4.jpg','d3_lg5.jpg','d3_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d1_lg1.jpg','d1_sm1.jpg','d1_lg2.jpg','d1_sm2.jpg','d1_lg3.jpg','d1_sm3.jpg','d1_lg4.jpg','d1_sm4.jpg','d1_lg5.jpg','d1_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d2_lg1.png','d2_sm1.png','d2_lg2.png','d2_sm2.png','d2_lg3.png','d2_sm3.png','d2_lg4.png','d2_sm4.png','d2_lg5.png','d2_sm5.png');
INSERT INTO clothes_pic VALUES('','d3_lg1.jpg','d3_sm1.jpg','d3_lg2.jpg','d3_sm2.jpg','d3_lg3.jpg','d3_sm3.jpg','d3_lg4.jpg','d3_sm4.jpg','d3_lg5.jpg','d3_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d1_lg1.jpg','d1_sm1.jpg','d1_lg2.jpg','d1_sm2.jpg','d1_lg3.jpg','d1_sm3.jpg','d1_lg4.jpg','d1_sm4.jpg','d1_lg5.jpg','d1_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d2_lg1.png','d2_sm1.png','d2_lg2.png','d2_sm2.png','d2_lg3.png','d2_sm3.png','d2_lg4.png','d2_sm4.png','d2_lg5.png','d2_sm5.png');
INSERT INTO clothes_pic VALUES('','d3_lg1.jpg','d3_sm1.jpg','d3_lg2.jpg','d3_sm2.jpg','d3_lg3.jpg','d3_sm3.jpg','d3_lg4.jpg','d3_sm4.jpg','d3_lg5.jpg','d3_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d1_lg1.jpg','d1_sm1.jpg','d1_lg2.jpg','d1_sm2.jpg','d1_lg3.jpg','d1_sm3.jpg','d1_lg4.jpg','d1_sm4.jpg','d1_lg5.jpg','d1_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d2_lg1.png','d2_sm1.png','d2_lg2.png','d2_sm2.png','d2_lg3.png','d2_sm3.png','d2_lg4.png','d2_sm4.png','d2_lg5.png','d2_sm5.png');
INSERT INTO clothes_pic VALUES('','d3_lg1.jpg','d3_sm1.jpg','d3_lg2.jpg','d3_sm2.jpg','d3_lg3.jpg','d3_sm3.jpg','d3_lg4.jpg','d3_sm4.jpg','d3_lg5.jpg','d3_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d1_lg1.jpg','d1_sm1.jpg','d1_lg2.jpg','d1_sm2.jpg','d1_lg3.jpg','d1_sm3.jpg','d1_lg4.jpg','d1_sm4.jpg','d1_lg5.jpg','d1_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d2_lg1.png','d2_sm1.png','d2_lg2.png','d2_sm2.png','d2_lg3.png','d2_sm3.png','d2_lg4.png','d2_sm4.png','d2_lg5.png','d2_sm5.png');
INSERT INTO clothes_pic VALUES('','d3_lg1.jpg','d3_sm1.jpg','d3_lg2.jpg','d3_sm2.jpg','d3_lg3.jpg','d3_sm3.jpg','d3_lg4.jpg','d3_sm4.jpg','d3_lg5.jpg','d3_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d1_lg1.jpg','d1_sm1.jpg','d1_lg2.jpg','d1_sm2.jpg','d1_lg3.jpg','d1_sm3.jpg','d1_lg4.jpg','d1_sm4.jpg','d1_lg5.jpg','d1_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d2_lg1.png','d2_sm1.png','d2_lg2.png','d2_sm2.png','d2_lg3.png','d2_sm3.png','d2_lg4.png','d2_sm4.png','d2_lg5.png','d2_sm5.png');
INSERT INTO clothes_pic VALUES('','d3_lg1.jpg','d3_sm1.jpg','d3_lg2.jpg','d3_sm2.jpg','d3_lg3.jpg','d3_sm3.jpg','d3_lg4.jpg','d3_sm4.jpg','d3_lg5.jpg','d3_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d1_lg1.jpg','d1_sm1.jpg','d1_lg2.jpg','d1_sm2.jpg','d1_lg3.jpg','d1_sm3.jpg','d1_lg4.jpg','d1_sm4.jpg','d1_lg5.jpg','d1_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d2_lg1.png','d2_sm1.png','d2_lg2.png','d2_sm2.png','d2_lg3.png','d2_sm3.png','d2_lg4.png','d2_sm4.png','d2_lg5.png','d2_sm5.png');
INSERT INTO clothes_pic VALUES('','d3_lg1.jpg','d3_sm1.jpg','d3_lg2.jpg','d3_sm2.jpg','d3_lg3.jpg','d3_sm3.jpg','d3_lg4.jpg','d3_sm4.jpg','d3_lg5.jpg','d3_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d1_lg1.jpg','d1_sm1.jpg','d1_lg2.jpg','d1_sm2.jpg','d1_lg3.jpg','d1_sm3.jpg','d1_lg4.jpg','d1_sm4.jpg','d1_lg5.jpg','d1_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d2_lg1.png','d2_sm1.png','d2_lg2.png','d2_sm2.png','d2_lg3.png','d2_sm3.png','d2_lg4.png','d2_sm4.png','d2_lg5.png','d2_sm5.png');
INSERT INTO clothes_pic VALUES('','d3_lg1.jpg','d3_sm1.jpg','d3_lg2.jpg','d3_sm2.jpg','d3_lg3.jpg','d3_sm3.jpg','d3_lg4.jpg','d3_sm4.jpg','d3_lg5.jpg','d3_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d1_lg1.jpg','d1_sm1.jpg','d1_lg2.jpg','d1_sm2.jpg','d1_lg3.jpg','d1_sm3.jpg','d1_lg4.jpg','d1_sm4.jpg','d1_lg5.jpg','d1_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d2_lg1.png','d2_sm1.png','d2_lg2.png','d2_sm2.png','d2_lg3.png','d2_sm3.png','d2_lg4.png','d2_sm4.png','d2_lg5.png','d2_sm5.png');
INSERT INTO clothes_pic VALUES('','d3_lg1.jpg','d3_sm1.jpg','d3_lg2.jpg','d3_sm2.jpg','d3_lg3.jpg','d3_sm3.jpg','d3_lg4.jpg','d3_sm4.jpg','d3_lg5.jpg','d3_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d1_lg1.jpg','d1_sm1.jpg','d1_lg2.jpg','d1_sm2.jpg','d1_lg3.jpg','d1_sm3.jpg','d1_lg4.jpg','d1_sm4.jpg','d1_lg5.jpg','d1_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d2_lg1.png','d2_sm1.png','d2_lg2.png','d2_sm2.png','d2_lg3.png','d2_sm3.png','d2_lg4.png','d2_sm4.png','d2_lg5.png','d2_sm5.png');
INSERT INTO clothes_pic VALUES('','d3_lg1.jpg','d3_sm1.jpg','d3_lg2.jpg','d3_sm2.jpg','d3_lg3.jpg','d3_sm3.jpg','d3_lg4.jpg','d3_sm4.jpg','d3_lg5.jpg','d3_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d1_lg1.jpg','d1_sm1.jpg','d1_lg2.jpg','d1_sm2.jpg','d1_lg3.jpg','d1_sm3.jpg','d1_lg4.jpg','d1_sm4.jpg','d1_lg5.jpg','d1_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d2_lg1.png','d2_sm1.png','d2_lg2.png','d2_sm2.png','d2_lg3.png','d2_sm3.png','d2_lg4.png','d2_sm4.png','d2_lg5.png','d2_sm5.png');
INSERT INTO clothes_pic VALUES('','d3_lg1.jpg','d3_sm1.jpg','d3_lg2.jpg','d3_sm2.jpg','d3_lg3.jpg','d3_sm3.jpg','d3_lg4.jpg','d3_sm4.jpg','d3_lg5.jpg','d3_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d1_lg1.jpg','d1_sm1.jpg','d1_lg2.jpg','d1_sm2.jpg','d1_lg3.jpg','d1_sm3.jpg','d1_lg4.jpg','d1_sm4.jpg','d1_lg5.jpg','d1_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d2_lg1.png','d2_sm1.png','d2_lg2.png','d2_sm2.png','d2_lg3.png','d2_sm3.png','d2_lg4.png','d2_sm4.png','d2_lg5.png','d2_sm5.png');
INSERT INTO clothes_pic VALUES('','d3_lg1.jpg','d3_sm1.jpg','d3_lg2.jpg','d3_sm2.jpg','d3_lg3.jpg','d3_sm3.jpg','d3_lg4.jpg','d3_sm4.jpg','d3_lg5.jpg','d3_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d1_lg1.jpg','d1_sm1.jpg','d1_lg2.jpg','d1_sm2.jpg','d1_lg3.jpg','d1_sm3.jpg','d1_lg4.jpg','d1_sm4.jpg','d1_lg5.jpg','d1_sm5.jpg');
INSERT INTO clothes_pic VALUES('','d2_lg1.png','d2_sm1.png','d2_lg2.png','d2_sm2.png','d2_lg3.png','d2_sm3.png','d2_lg4.png','d2_sm4.png','d2_lg5.png','d2_sm5.png');
INSERT INTO clothes_pic VALUES('','d3_lg1.jpg','d3_sm1.jpg','d3_lg2.jpg','d3_sm2.jpg','d3_lg3.jpg','d3_sm3.jpg','d3_lg4.jpg','d3_sm4.jpg','d3_lg5.jpg','d3_sm5.jpg');

CREATE TABLE clothes_cart(
    id INT PRIMARY KEY AUTO_INCREMENT,
    uid INT,
    pid INT,
    price DECIMAL(6,2),
    title VARCHAR(200),
    count INT,
    img VARCHAR(255)
);