-- drop table t_shopping_order;
-- drop table t_shopping_cart;
-- drop table t_goods_detail_image;
-- drop table t_shopping_goods;
-- drop table t_shopping_member;

CREATE TABLE t_shopping_member(
	member_id VARCHAR(20),
	member_pw VARCHAR(20),
	member_name VARCHAR(50),
	member_gender VARCHAR(10),
	hp1 VARCHAR(20),
	hp2 VARCHAR(20),
	hp3 VARCHAR(20),
	tel1 VARCHAR(20),
	tel2 VARCHAR(20),
	tel3 VARCHAR(20),
	SMSSTS_YN VARCHAR(20),
	email1 VARCHAR(20),
	email2 VARCHAR(20),
	emailSTS_YN VARCHAR(30),
	member_birth_Y VARCHAR(20),
	member_birth_M VARCHAR(20),
	member_birth_D VARCHAR(20),
	member_birth_GN VARCHAR(40),
	ZIPCODE VARCHAR(20),
	ROADADDRESS VARCHAR(500),
	JIBUNADDRESS VARCHAR(500),
	NAMUJIADDRESS VARCHAR(500),
	joindate DATE DEFAULT SYSDATE(),
	del_YN VARCHAR(20),
	PRIMARY KEY(member_id)
);

CREATE TABLE t_shopping_goods (
	goods_id INT(20) NOT NULL,
	goods_sort VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_swedish_ci',
	goods_title VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_swedish_ci',
	goods_publisher VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_swedish_ci',
	goods_price INT(10) NULL DEFAULT NULL,
	goods_sales_price INT(10) NULL DEFAULT NULL,
	goods_point INT(10) NULL DEFAULT NULL,
	goods_published_date DATE NULL DEFAULT NULL,
	goods_color VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8_swedish_ci',
	goods_size VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8_swedish_ci',
	goods_delivery_price INT(10) NULL DEFAULT NULL,
	goods_delivery_date DATE NULL DEFAULT NULL,
	goods_status VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_swedish_ci',
	goods_intro VARCHAR(2000) NULL DEFAULT NULL COLLATE 'utf8_swedish_ci',
	goods_credate DATE NULL DEFAULT sysdate(),
	PRIMARY KEY (goods_id)
);

CREATE TABLE t_shopping_order(
	order_seq_num INT(20),
	order_id INT(20),
	member_id VARCHAR(50),
	goods_id INT(20),
	orderer_name varchar(50),
	goods_title VARCHAR(20),
	order_goods_qty INT(5),
	goods_sales_price INT(5),
	goods_fileName VARCHAR(60),
	receiver_name VARCHAR(50),
	receiver_hp1 VARCHAR(20),
	receiver_hp2 VARCHAR(20),
	receiver_hp3 VARCHAR(20),
	receiver_tel1 VARCHAR(20),
	receiver_tel2 varchar(20),
	receiver_tel3 varchar(20),
	delivery_address VARCHAR(500),
	delivery_method VARCHAR(40),
	delivery_message VARCHAR(300),
	gift_wrapping VARCHAR(20),
	pay_method VARCHAR(200),
	card_com_name VARCHAR(50),
	card_pay_month VARCHAR(20),
	pay_orderer_hp_num VARCHAR(20),
	delivery_state VARCHAR(30) DEFAULT 'delivery_prepared',
	pay_order_time DATE DEFAULT SYSDATE(),
	orderer_hp VARCHAR(50),
	PRIMARY KEY(order_seq_num),
	CONSTRAINT FK_goods_order FOREIGN KEY(goods_id) REFERENCES t_shopping_goods(goods_id),
	CONSTRAINT FK_member_order FOREIGN KEY(member_id) REFERENCES t_shopping_member(member_id)
);

CREATE TABLE t_goods_detail_image (
	image_id INT(20),
	goods_id INT(20),
	fileName VARCHAR(50),
	reg_id VARCHAR(20),
	fileType VARCHAR(40),
	creDate DATE DEFAULT SYSDATE(),
	PRIMARY KEY(image_id),
	CONSTRAINT FK_goods_image FOREIGN KEY(goods_id) REFERENCES t_shopping_goods(goods_id)
);

CREATE TABLE t_shopping_cart (
	cart_id	INT(10),
	goods_id INT(10),
	member_id VARCHAR(20),
	del_YN VARCHAR(20) DEFAULT 'N',
	credate DATE DEFAULT SYSDATE(),
	cart_goods_qty INT(5) default 1,
	PRIMARY KEY(cart_id),
	CONSTRAINT FK_goods_cart FOREIGN KEY(goods_id) REFERENCES t_shopping_goods(goods_id),
	CONSTRAINT FK_member_cart FOREIGN KEY(member_id) REFERENCES t_shopping_member(member_id)
);



-- 상품 정보 테이블 --
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (314,'상의','BEEN-쭈리-맨투맨','FREE',31900,28710,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'회색','',3000,STR_TO_DATE('21/09/27','%y/%m/%d'),'top','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (315,'상의','달로-오버핏-기모-후드티','FREE',39900,35910,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'회색','',3000,STR_TO_DATE('21/09/27','%y/%m/%d'),'top','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (316,'상의','랜덤-와플스판-반집업','FREE',36900,33210,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'블랙','',3000,STR_TO_DATE('21/09/27','%y/%m/%d'),'top','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (317,'상의','로엔-베이직-면트윌-긴팔-셔츠','FREE',34900,31410,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'블랙','',3000,STR_TO_DATE('21/10/27','%y/%m/%d'),'top','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (318,'상의','리치몬드-스트링-기모-반집업','FREE',46900,42210,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'블랙','',3000,STR_TO_DATE('21/10/27','%y/%m/%d'),'top','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (319,'상의','립트-배색-브이넥-니트티','FREE',31900,28710,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'회색','',3000,STR_TO_DATE('21/10/27','%y/%m/%d'),'top','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (320,'상의','머스탱-필기체-긴팔티','FREE',28900,26010,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'브라운','',3000,STR_TO_DATE('21/10/27','%y/%m/%d'),'top','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (321,'상의','모어스-소프트-반폴라티','FREE',24900,22410,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'회색','',3000,STR_TO_DATE('21/10/27','%y/%m/%d'),'top','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (322,'상의','브론-기모-하프집업-맨투맨','FREE',34200,30780,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'브라운','',3000,STR_TO_DATE('21/10/27','%y/%m/%d'),'top','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (323,'상의','사각-골덴-스트링-긴팔티','FREE',44900,40410,2000,STR_TO_DATE('19/10/20','%y/%m/%d'),'흰색','',3000,STR_TO_DATE('21/10/27','%y/%m/%d'),'top','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (324,'상의','오디너리-트윌-겉기모-긴팔-셔츠','FREE',35900,32310,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'카키','',3000,STR_TO_DATE('21/10/27','%y/%m/%d'),'top','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (325,'상의','조지타운-기모-맨투맨','FREE',29900,26910,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'회색','',3000,STR_TO_DATE('21/10/27','%y/%m/%d'),'top','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (326,'상의','테니스게임-기모-맨투맨','FREE',29900,26910,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'흰색','',3000,STR_TO_DATE('21/10/27','%y/%m/%d'),'top','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (327,'상의','헤비-양기모-후드티','FREE',36900,33210,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'블루','',3000,STR_TO_DATE('21/10/27','%y/%m/%d'),'top','',STR_TO_DATE('21/07/06','%y/%m/%d'));

INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (421,'바지','기본-밑단-스트링-트레이닝-팬츠','FREE',35900,32310,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'네이비','',3000,STR_TO_DATE('21/10/30','%y/%m/%d'),'pants','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (422,'바지','뉴브-피치기모-스판-밴딩팬츠','FREE',44900,40410,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'브라운','',3000,STR_TO_DATE('21/10/30','%y/%m/%d'),'pants','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (423,'바지','레논-핀턱-와이드-슬랙스','FREE',36900,33210,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'회색','',3000,STR_TO_DATE('21/10/30','%y/%m/%d'),'pants','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (424,'바지','모젤-뒷밴딩-롱슬랙스','FREE',35900,32310,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'블랙','',3000,STR_TO_DATE('21/10/30','%y/%m/%d'),'pants','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (425,'바지','보이그-빈티지워싱-밴딩팬츠','FREE',39900,35910,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'회색','',3000,STR_TO_DATE('21/10/30','%y/%m/%d'),'pants','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (426,'바지','쉐어-루즈핏-밴딩-팬츠','FREE',29900,26910,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'회색','',3000,STR_TO_DATE('21/10/30','%y/%m/%d'),'pants','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (427,'바지','아처-워싱-밴딩-루즈핏-청바지','FREE',39900,35910,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'청색','',3000,STR_TO_DATE('21/10/30','%y/%m/%d'),'pants','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (428,'바지','엘스-밴딩-스판-데님팬츠','FREE',44900,40410,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'블랙','',3000,STR_TO_DATE('21/10/30','%y/%m/%d'),'pants','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (429,'바지','워즈-데미지-밴딩-청바지','FREE',42900,38610,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'청색','',3000,STR_TO_DATE('21/10/30','%y/%m/%d'),'pants','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (430,'바지','월러-카고-조거-슬랙스','FREE',38900,35010,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'블랙','',3000,STR_TO_DATE('21/10/30','%y/%m/%d'),'pants','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (431,'바지','젠블-옆밴딩-TR스판슬랙스','FREE',31900,28710,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'네이비','',3000,STR_TO_DATE('21/10/30','%y/%m/%d'),'pants','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (432,'바지','카고-밑단-스트링-트레이닝-팬츠','FREE',36900,33210,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'네이비','',3000,STR_TO_DATE('21/10/30','%y/%m/%d'),'pants','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (433,'바지','코데 보아털 조거 패츠','FREE',23900,21510,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'블랙','',3000,STR_TO_DATE('21/10/30','%y/%m/%d'),'pants','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (434,'바지','튜어스-생지-와이드-청바지','FREE',38900,35010,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'네이비','',3000,STR_TO_DATE('21/10/30','%y/%m/%d'),'pants','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (435,'바지','할로우-카고-데님-조거','FREE',41900,37710,1000,STR_TO_DATE('19/10/20','%y/%m/%d'),'청색','',3000,STR_TO_DATE('21/10/30','%y/%m/%d'),'pants','',STR_TO_DATE('21/07/06','%y/%m/%d'));

INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (550,'신발','10cm-소가죽-어글리-하이슈즈','FREE',49000,44100,2000,STR_TO_DATE('19/10/20','%y/%m/%d'),'흰색','',3000,STR_TO_DATE('21/11/03','%y/%m/%d'),'shoes','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (551,'신발','123라운드-클리퍼','FREE',56000,50400,2000,STR_TO_DATE('19/10/20','%y/%m/%d'),'블랙','',3000,STR_TO_DATE('21/11/03','%y/%m/%d'),'shoes','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (552,'신발','소가죽-화이트-스니커즈','FREE',62000,55800,2000,STR_TO_DATE('19/10/20','%y/%m/%d'),'흰색','',3000,STR_TO_DATE('21/11/03','%y/%m/%d'),'shoes','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (553,'신발','800-더블솔-더비슈지','FREE',59900,53910,2000,STR_TO_DATE('19/10/20','%y/%m/%d'),'블랙','',3000,STR_TO_DATE('21/11/03','%y/%m/%d'),'shoes','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (554,'신발','1003라운딩-블로퍼','FREE',54000,48600,2000,STR_TO_DATE('19/10/20','%y/%m/%d'),'블랙','',3000,STR_TO_DATE('21/11/03','%y/%m/%d'),'shoes','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (555,'신발','3005가죽-블로퍼','FREE',54000,48600,2000,STR_TO_DATE('19/10/20','%y/%m/%d'),'흰색','',3000,STR_TO_DATE('21/11/03','%y/%m/%d'),'shoes','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (556,'신발','8080-스퀘어토-소가죽-첼시부츠','FREE',74900,67410,2000,STR_TO_DATE('19/10/20','%y/%m/%d'),'블랙','',3000,STR_TO_DATE('21/11/03','%y/%m/%d'),'shoes','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (557,'신발','독일군-스니커즈','FREE',54900,49410,2000,STR_TO_DATE('19/10/20','%y/%m/%d'),'흰색','',3000,STR_TO_DATE('21/11/03','%y/%m/%d'),'shoes','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (558,'신발','모노-스니커즈','FREE',77000,69300,2000,STR_TO_DATE('19/10/20','%y/%m/%d'),'흰색','',3000,STR_TO_DATE('21/11/03','%y/%m/%d'),'shoes','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (559,'신발','베네싱-더비슈즈','FREE',114000,102600,3000,STR_TO_DATE('19/10/20','%y/%m/%d'),'블랙','',3000,STR_TO_DATE('21/11/03','%y/%m/%d'),'shoes','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (560,'신발','컨버스-스니커즈-뮬','FREE',39900,35910,2000,STR_TO_DATE('19/10/20','%y/%m/%d'),'블랙','',3000,STR_TO_DATE('21/11/03','%y/%m/%d'),'shoes','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (561,'신발','타비-컨버스','FREE',72000,64800,2000,STR_TO_DATE('19/10/20','%y/%m/%d'),'블랙','',3000,STR_TO_DATE('21/11/03','%y/%m/%d'),'shoes','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (562,'신발','토끼털-블로퍼','FREE',59000,53100,2000,STR_TO_DATE('19/10/20','%y/%m/%d'),'블랙','',3000,STR_TO_DATE('21/11/03','%y/%m/%d'),'shoes','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (563,'신발','포미르-더비슈즈','FREE',119000,107100,3000,STR_TO_DATE('19/10/20','%y/%m/%d'),'블랙','',3000,STR_TO_DATE('21/11/03','%y/%m/%d'),'shoes','',STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_shopping_goods(goods_id,goods_sort,goods_title,goods_publisher,goods_price,goods_sales_price,goods_point,goods_published_date,goods_color,goods_size,goods_delivery_price,goods_delivery_date,goods_status,goods_intro,goods_credate) VALUES (564,'신발','하이--1-스니커즈','FREE',54900,49410,2000,STR_TO_DATE('19/10/20','%y/%m/%d'),'블랙','',3000,STR_TO_DATE('21/11/03','%y/%m/%d'),'shoes','',STR_TO_DATE('21/07/06','%y/%m/%d'));


-- 이미지 상세 테이블 --
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (301,314,'BEEN-쭈리-맨투맨.jpg','admin','main_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (345,314,'BEEN-쭈리-맨투맨-상세.jpg','admin','detail_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (302,315,'달로-오버핏-기모-후드티.jpg','admin','main_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (346,315,'달로-오버핏-기모-후드티-상세.jpg','admin','detail_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (303,316,'랜덤-와플스판-반집업.jpg','admin','main_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (347,316,'랜덤-와플스판-반집업-상세.jpg','admin','detail_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (304,317,'로엔-베이직-면트윌-긴팔-셔츠.jpg','admin','main_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (348,317,'로엔-베이직-면트윌-긴팔-셔츠-상세.jpg','admin','detail_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (305,318,'리치몬드-스트링-기모-반집업.jpg','admin','main_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (349,318,'리치몬드-스트링-기모-반집업-상세.jpg','admin','detail_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (306,319,'립트-배색-브이넥-니트티.jpg','admin','main_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (350,319,'립트-배색-브이넥-니트티-상세.jpg','admin','detail_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (307,320,'머스탱-필기체-긴팔티.jpg','admin','main_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (351,320,'머스탱-필기체-긴팔티-상세.jpg','admin','detail_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (308,321,'모어스-소프트-반폴라티.jpg','admin','main_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (352,321,'모어스-소프트-반폴라티-상세.jpg','admin','detail_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (309,322,'브론-기모-하프집업-맨투맨.jpg','admin','main_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (353,322,'브론-기모-하프집업-맨투맨-상세.jpg','admin','detail_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (310,323,'사각-골덴-스트링-긴팔티.jpg','admin','main_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (354,323,'사각-골덴-스트링-긴팔티-상세.jpg','admin','detail_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (311,324,'오디너리-트윌-겉기모-긴팔-셔츠.jpg','admin','main_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (355,324,'오디너리-트윌-겉기모-긴팔-셔츠-상세.jpg','admin','detail_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (312,325,'조지타운-기모-맨투맨.jpg','admin','main_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (356,325,'조지타운-기모-맨투맨-상세.jpg','admin','detail_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (313,326,'테니스게임-기모-맨투맨.jpg','admin','main_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (357,326,'테니스게임-기모-맨투맨-상세.jpg','admin','detail_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (314,327,'헤비-양기모-후드티.jpg','admin','main_image', STR_TO_DATE('21/07/06','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (358,327,'헤비-양기모-후드티-상세.jpg','admin','detail_image', STR_TO_DATE('21/07/06','%y/%m/%d'));

INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (315,421,'기본-밑단-스트링-트레이닝-팬츠.jpg','admin','main_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (359,421,'기본-밑단-스트링-트레이닝-팬츠-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (316,422,'뉴브-피치기모-스판-밴딩팬츠.jpg','admin','main_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (360,422,'뉴브-피치기모-스판-밴딩팬츠-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (317,423,'레논-핀턱-와이드-슬랙스.jpg','admin','main_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (361,423,'레논-핀턱-와이드-슬랙스-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (318,424,'모젤-뒷밴딩-롱슬랙스.jpg','admin','main_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (362,424,'모젤-뒷밴딩-롱슬랙스-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (319,425,'보이그-빈티지워싱-밴딩팬츠.jpg','admin','main_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (363,425,'보이그-빈티지워싱-밴딩팬츠-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (320,426,'쉐어-루즈핏-밴딩-팬츠.jpg','admin','main_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (364,426,'쉐어-루즈핏-밴딩-팬츠-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (321,427,'아처-워싱-밴딩-루즈핏-청바지.jpg','admin','main_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (365,427,'아처-워싱-밴딩-루즈핏-청바지-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (322,428,'엘스-밴딩-스판-데님팬츠.jpg','admin','main_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (366,428,'엘스-밴딩-스판-데님팬츠-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (323,429,'워즈-데미지-밴딩-청바지.jpg','admin','main_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (367,429,'워즈-데미지-밴딩-청바지-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (324,430,'월러-카고-조거-슬랙스.jpg','admin','main_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (368,430,'월러-카고-조거-슬랙스-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (325,431,'젠블-옆밴딩-TR스판슬랙스.jpg','admin','main_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (369,431,'젠블-옆밴딩-TR스판슬랙스-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (326,432,'카고-밑단-스트링-트레이닝-팬츠.jpg','admin','main_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (370,432,'카고-밑단-스트링-트레이닝-팬츠-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (327,433,'코데 보아털 조거 패츠.jpg','admin','main_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (371,433,'코데 보아털 조거 패츠-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (328,434,'튜어스-생지-와이드-청바지.jpg','admin','main_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (372,434,'튜어스-생지-와이드-청바지-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (329,435,'할로우-카고-데님-조거.jpg','admin','main_image', STR_TO_DATE('21/08/02','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (373,435,'할로우-카고-데님-조거-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/02','%y/%m/%d'));

INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (330,550,'10cm-소가죽-어글리-하이슈즈.jpg','admin','main_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (374,550,'10cm-소가죽-어글리-하이슈즈-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (331,551,'123라운드-클리퍼.jpg','admin','main_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (375,551,'123라운드-클리퍼-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (332,552,'소가죽-화이트-스니커즈.jpg','admin','main_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (376,552,'소가죽-화이트-스니커즈-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (333,553,'800-더블솔-더비슈지.jpg','admin','main_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (377,553,'800-더블솔-더비슈지-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (334,554,'1003라운딩-블로퍼.jpg','admin','main_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (378,554,'1003라운딩-블로퍼-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (335,555,'3005가죽-블로퍼.jpg','admin','main_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (379,555,'3005가죽-블로퍼-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (336,556,'8080-스퀘어토-소가죽-첼시부츠.jpg','admin','main_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (380,556,'8080-스퀘어토-소가죽-첼시부츠-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (337,557,'독일군-스니커즈.jpg','admin','main_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (381,557,'독일군-스니커즈-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (338,558,'모노-스니커즈.jpg','admin','main_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (382,558,'모노-스니커즈-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (339,559,'베네싱-더비슈즈.jpg','admin','main_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (383,559,'베네싱-더비슈즈-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (340,560,'컨버스-스니커즈-뮬.jpg','admin','main_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (384,560,'컨버스-스니커즈-뮬-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (341,561,'타비-컨버스.jpg','admin','main_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (385,561,'타비-컨버스-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (342,562,'토끼털-블로퍼.jpg','admin','main_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (386,562,'토끼털-블로퍼-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (343,563,'포미르-더비슈즈.jpg','admin','main_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (387,563,'포미르-더비슈즈-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (344,564,'하이--1-스니커즈.jpg','admin','main_image', STR_TO_DATE('21/08/14','%y/%m/%d'));
INSERT INTO t_goods_detail_image(image_id, goods_id, fileName, reg_id, fileType, creDate) VALUES (388,564,'하이--1-스니커즈-상세.jpg','admin','detail_image', STR_TO_DATE('21/08/14','%y/%m/%d'));

-- 사용자 등록 --
Insert into T_SHOPPING_MEMBER (MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_GENDER,TEL1,TEL2,TEL3,HP1,HP2,HP3,SMSSTS_YN,EMAIL1,EMAIL2,EMAILSTS_YN,ZIPCODE,ROADADDRESS,JIBUNADDRESS,NAMUJIADDRESS,MEMBER_BIRTH_Y,MEMBER_BIRTH_M,MEMBER_BIRTH_D,MEMBER_BIRTH_GN,JOINDATE,DEL_YN) values ('admin','1212','어드민','101','02','1111','2222','010','1111','2222','Y','admin','test.com,non','Y','06253','서울 강남구 강남대로 298 (역삼동)','서울 강남구 역삼동 838','럭키빌딩 101호','2000','5','10','2',str_to_date('18/10/16','%y/%m/%d'),'N');
Insert into T_SHOPPING_MEMBER (MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_GENDER,TEL1,TEL2,TEL3,HP1,HP2,HP3,SMSSTS_YN,EMAIL1,EMAIL2,EMAILSTS_YN,ZIPCODE,ROADADDRESS,JIBUNADDRESS,NAMUJIADDRESS,MEMBER_BIRTH_Y,MEMBER_BIRTH_M,MEMBER_BIRTH_D,MEMBER_BIRTH_GN,JOINDATE,DEL_YN) values ('lee','1212','이병승','101','02','1111','2222','010','2222','3333','Y','lee','test.com,non','Y','13547','경기 성남시 분당구 고기로 25 (동원동)','경기 성남시 분당구 동원동 79-1','럭키빌딩 101호','2000','5','10','2',str_to_date('18/10/23','%y/%m/%d'),'N');


-- drop sequence ORDER_SEQ_NUM;
-- drop sequence SEQ_GOODS_ID;
-- drop sequence SEQ_IMAGE_ID;
-- drop sequence SEQ_ORDER_ID;

-- 시퀀스 작성 --
--  SQLINES DEMO 
-- SQLINES DEMO ***  ORDER_SEQ_NUM
--  SQLINES DEMO *** ------------------------------------

   CREATE SEQUENCE  `ORDER_SEQ_NUM`  MINVALUE 0 MAXVALUE 10000000 INCREMENT BY 1 START WITH 400 CACHE 20  NOCYCLE ;
--  SQLINES DEMO 
-- SQLINES DEMO ***  SEQ_GOODS_ID
--  SQLINES DEMO *** ------------------------------------

   CREATE SEQUENCE  `SEQ_GOODS_ID`  MINVALUE 100 MAXVALUE 1000000 INCREMENT BY 1 START WITH 400 CACHE 20 /* Warning: ORDER */  NOCYCLE ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO ***  SEQ_IMAGE_ID
--  SQLINES DEMO *** ------------------------------------

   CREATE SEQUENCE  `SEQ_IMAGE_ID`  MINVALUE 1 MAXVALUE 11111111 INCREMENT BY 1 START WITH 400 NOCACHE   NOCYCLE ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO ***  SEQ_ORDER_ID
--  SQLINES DEMO *** ------------------------------------

   CREATE SEQUENCE  `SEQ_ORDER_ID`  MINVALUE 0 MAXVALUE 10000000 INCREMENT BY 1 START WITH 400 NOCACHE  /* Warning: ORDER */  NOCYCLE ;