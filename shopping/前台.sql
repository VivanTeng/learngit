delete 

--4.商品一级分类表 firstgoods
create table firstgoods(
firgoods_id varchar2(30),                 --商品一级类型ID,来自序列，自主生成，主键
firgoods_name Varchar(50),          --商品类型名称
firstgoods_des Varchar(50),           --商品类型描述
constraint firstgoods_firgoods_id_pk primary key(firgoods_id));
--添加商品一级分类firstgoods
create sequence firstgoods_id_seq
start with 10000 
increment by 1  
nomaxvalue  
nocycle  
nocache  
order; 
insert into firstgoods values(firstgoods_id_seq.nextval,'手机','电子产品');
insert into firstgoods values(firstgoods_id_seq.nextval,'数码','电子产品');
insert into firstgoods values(firstgoods_id_seq.nextval,'电脑','电子产品');
insert into firstgoods values(firstgoods_id_seq.nextval,'电视','电子产品');
insert into firstgoods values(firstgoods_id_seq.nextval,'空调','电子产品');
insert into firstgoods values(firstgoods_id_seq.nextval,'冰箱','电子产品');

select * from firstgoods
--5.商品二级分类表 secgoods
create table secgoods(
secgoods_id  varchar2(30),               --商品二级ID，主键，来自序列
firgoods_id  varchar2(30),                    --商品一级ID  外键
secgoods_name Varchar(50),          --商品二级名称
secgoods_des Varchar(200),      --商品二级描述
constraint secgoods_secgoods_id_pk primary key(secgoods_id ),
constraint secgoods_firgoods_id_fk foreign key(firgoods_id) references firstgoods(firgoods_id));
--添加商品二级分类secgoods
create sequence secgoods_id_seq
start with 10006 
increment by 1  
nomaxvalue  
nocycle  
nocache  
order; 
insert into secgoods values(secgoods_id_seq.nextval,10000,'小米max','小米手机');
insert into secgoods values(secgoods_id_seq.nextval,10000,'华为荣耀','华为手机');
insert into secgoods values(secgoods_id_seq.nextval,10001,'单反','数码相机');
insert into secgoods values(secgoods_id_seq.nextval,10002,'小米笔记本','小米电脑');
insert into secgoods values(secgoods_id_seq.nextval,10002,'华硕笔记本','华硕电脑');
insert into secgoods values(secgoods_id_seq.nextval,10003,'曲面电视','letv电视');
insert into secgoods values(secgoods_id_seq.nextval,10004,'节能空调','格力空调');
insert into secgoods values(secgoods_id_seq.nextval,10003,'超薄电视','HDR');
insert into secgoods values(secgoods_id_seq.nextval,10005,'海尔冰箱','Haier');

select * from secgoods
--6.商品信息表 goods
create table goods(
goods_id Number,       --商品ID  主键
goods_number Varchar2(32),--商品编号
goods_name  Varchar2(32),--商品名称
goods_describ Varchar2(32),--商品描述
secgoods_id varchar2(30),--二级分类ID    外键
goods_originprice Number,--商品市场价格
goods_salesprice Number,--商品优惠价格
goods_vipprice Number,--商品VIP价格
goods_sum Number,--商品数量
goods_keyword Varchar2(32),--关键字
goods_ontime Date,--产品录入时间
constraint goods_goods_id_pk primary key(goods_id),
constraint goods_secgoods_id_fk foreign key(secgoods_id) references secgoods(secgoods_id)
);
--添加商品信息goods
insert into goods values(1,1,'小米max','小米手机','10006',100,99,88,15,'小米',sysdate);
insert into goods values(200,100,'小米3','小米手机','10006',1000,99,88,15,'小米',sysdate);
insert into goods values(201,101,'小米4','小米手机','10006',1200,99,88,15,'小米',sysdate);
insert into goods values(202,102,'小米5','小米手机','10006',1400,99,88,15,'小米',sysdate);
insert into goods values(203,103,'小米6','小米手机','10006',1600,99,88,15,'小米',sysdate);
insert into goods values(204,104,'小米7','小米手机','10006',1800,99,88,15,'小米',sysdate);
insert into goods values(205,105,'小米8','小米手机','10006',2000,99,88,15,'小米',sysdate);
insert into goods values(206,106,'小米9','小米手机','10006',2400,99,88,15,'小米',sysdate);
insert into goods values(107,107,'小米10','小米手机','10006',3000,99,88,15,'小米',sysdate);
insert into goods values(108,108,'小米x','小米手机','10006',4000,99,88,15,'小米',sysdate);

insert into goods values(2,2,'华为荣耀','华为手机','10007',100,99,88,15,'华为',sysdate);
insert into goods values(3,3,'单反','数码相机','10008',100,99,88,15,'相机',sysdate);
insert into goods values(4,4,'小米笔记本','小米电脑','10009',100,99,88,15,'小米',sysdate);
insert into goods values(5,5,'华硕笔记本','华硕电脑','10010',100,99,88,15,'华硕',sysdate);
insert into goods values(6,6,'曲面电视','letv电视','10011',100,99,88,15,'曲面',sysdate);
insert into goods values(7,7,'超薄电视','HDR','10013',100,99,88,15,'超薄',sysdate);
insert into goods values(8,8,'节能空调','格力空调','10012',100,99,88,15,'节能',sysdate);
insert into goods values(9,9,'海尔冰箱','Haier','10014',100,99,88,15,'海尔',sysdate);

select * from goods
--7.图片表 picture
create table picture
(picture_id Number,--图片Id      主键
goods_id  number, --商品id 外键
picture_url Varchar(200),--图片路径
constraint picture_picture_id_pk primary key(picture_id),
constraint picture_goods_id_fk foreign key(goods_id) references goods(goods_id));

--添加图片信息picture
create sequence picture_picture_id_seq
start with 1
increment by 1  
nomaxvalue  
nocycle  
nocache  
order; 
insert into picture values(picture_picture_id_seq.nextval,1,'*.jsp');
insert into picture values(picture_picture_id_seq.nextval,2,'*.jsp');
insert into picture values(picture_picture_id_seq.nextval,3,'*.jsp');
insert into picture values(picture_picture_id_seq.nextval,4,'*.jsp');
insert into picture values(picture_picture_id_seq.nextval,5,'*.jsp');
insert into picture values(picture_picture_id_seq.nextval,6,'*.jsp');
insert into picture values(picture_picture_id_seq.nextval,7,'*.jsp');
insert into picture values(picture_picture_id_seq.nextval,8,'*.jsp');
insert into picture values(picture_picture_id_seq.nextval,100,'theme/img/mi/mi1.jpg');
insert into picture values(picture_picture_id_seq.nextval,101,'theme/img/mi/mi2.jpg');
insert into picture values(picture_picture_id_seq.nextval,102,'theme/img/mi/003.jpg');
insert into picture values(picture_picture_id_seq.nextval,103,'theme/img/mi/004.jpg');
insert into picture values(picture_picture_id_seq.nextval,104,'theme/img/mi/005.jpg');
insert into picture values(picture_picture_id_seq.nextval,105,'theme/img/mi/006.jpg');
insert into picture values(picture_picture_id_seq.nextval,106,'theme/img/mi/007.jpg');
insert into picture values(picture_picture_id_seq.nextval,107,'theme/img/mi/008.jpg');
insert into picture values(picture_picture_id_seq.nextval,108,'theme/img/mi/009.jpg');


select * from picture;
--8.用户表 userinfo
create table userinfo(
user_id Number,--用户ID   主键
user_name Varchar2(50),--用户名
user_password Varchar2(32),--用户密码
user_realName Varchar2(50),--用户真实姓名
user_sex Varchar2(10),--用户性别
user_identity Varchar2(20),--用户身份证
user_birth Date,--用户出生日期
user_phone varchar2(20),--手机号码
user_email Varchar2(50),--用户邮箱
address Varchar2(50),--用户地址 
user_point Number,--用户积分
user_createTime Date,--用户注册时间
constraint userinfo_user_id_pk primary key(user_id)
);

--添加用户表userinfo
create sequence userinfo_user_id_seq
start with 10000
increment by 1  
nomaxvalue  
nocycle  
nocache  
order; 
insert into userinfo values
(userinfo_user_id_seq.nextval,'haha','123','小明','男','14703199701252005',
to_date('25-1月-1997'),'13835901122','404567444@qq.com','北京市大兴区','0',to_date('10-7月-2006'));
insert into userinfo values
(userinfo_user_id_seq.nextval,'xixi','123','小红','女','14703199701252077',
to_date('24-5月-1997'),'13835901156','4092887344','北京市大兴区','0',to_date('10-7月-2006'));
insert into userinfo values
(userinfo_user_id_seq.nextval,'xiaohai','123','小蓝','女','14703199701252055',
to_date('4-1月-1997'),'13835901104','409877454','北京市大兴区','0',to_date('10-7月-2006'));
insert into userinfo values
(userinfo_user_id_seq.nextval,'sj','123','小杰','男','14703199701252066',
to_date('27-2月-1997'),'13835901103','129777444','北京市大兴区','0',to_date('10-7月-2006'));

select * from userInfo;
delete userInfo where user_id=30



--10.用户收货地址表 receiveaddress
create table receiveaddress(
address_id Number,--地址ID   主键
user_id Number,--用户id    外键
Recipient_name Varchar2(50),--收货人姓名
Recipient_phone Number,--收货人手机号
address_code Number,--邮编
address_province Varchar2(20),--省
address_city Varchar2(50),--市
address_county Varchar2(50),--区、县
address_detailed  Varchar2(200),--详细地址
constraint receiveaddress_address_id_pk primary key(address_id),
constraint receiveaddress_user_id_fk foreign key(user_id) references userinfo(user_id));

create sequence receive_address_id_seq
start with 1
increment by 1  
nomaxvalue  
nocycle  
nocache  
order; 
insert into receiveaddress values(receive_address_id_seq.nextval,9,'haha',13835901122,044000,'山西省','运城市','临近县','我家');
insert into receiveaddress values(receive_address_id_seq.nextval,9,'haha',13835901156,567696,'北京省','朝阳区','大岭','我家');
insert into receiveaddress values(receive_address_id_seq.nextval,9,'haha',13835901104,043300,'黑龙江省','吉林市','大湖','我家');
insert into receiveaddress values(receive_address_id_seq.nextval,9,'haha',13835901103,586969,'山东省','夏海市','哈哈','我家');
insert into receiveaddress values(receive_address_id_seq.nextval,49,'乔博辉',13835901103,586969,'山东省','夏海市','武城县','四川省凉山州冕宁县哈哈河坝爱曦小学');
insert into receiveaddress values(receive_address_id_seq.nextval,49,'刘佳明',13835365012,500000,'山西省','武陵市','屁屁县','四川省南充市嘉陵区桥龙乡义工希望小学');
insert into receiveaddress values(receive_address_id_seq.nextval,49,'滕志林',13859602415,636969,'河北省','流霞市','瓜子巷','青海省化隆县民族中学英语教研组');
insert into receiveaddress values(receive_address_id_seq.nextval,49,'武宝铜',13835510545,896969,'河南省','很美市','皮辊县','甘肃省佛经结缘慈善中心');

select * from receiveaddress


--14.创建购物车表 shopcart
create table shopcart
(shopcart_id       Number,--购物车id  主键
user_id           Number,--用户id    外键
money             Number,--总计价格
constraint shopcart_shopcart_id_pk primary key(shopcart_id),
constraint shopcart_user_id_fk foreign key(user_id) references userinfo(user_id)
);
--添加购物车shopcart
create sequence shopcart_shopcart_id_seq
start with 10000
increment by 1  
nomaxvalue  
nocycle  
nocache  
order; 
insert into shopcart values(shopcart_shopcart_id_seq.nextval,49,200);
insert into shopcart values(shopcart_shopcart_id_seq.nextval,10001,300);
insert into shopcart values(shopcart_shopcart_id_seq.nextval,10002,400);
insert into shopcart values(shopcart_shopcart_id_seq.nextval,10003,500);
insert into shopcart values(shopcart_shopcart_id_seq.nextval,10003,500);
insert into shopcart values(shopcart_shopcart_id_seq.nextval,10003,500);
insert into shopcart values(shopcart_shopcart_id_seq.nextval,10003,500);
insert into shopcart values(shopcart_shopcart_id_seq.nextval,10003,500);

select * from shopcart

--15.创建购物车明细表 shopcartdetails
create table shopcartdetails
(shopcart_id       Number,--购物车id  外键
goods_id         Number,--商品ID   外键
buy_number       Number,--购买商品数量
buy_money         Number,--商品价格  Buy_number*商品表对应的价格。
constraint shopcartdetails_shopcart_id_pk foreign key(shopcart_id) references shopcart(shopcart_id),
constraint shopcartdetails_goods_id_fk foreign key(goods_id) references goods(goods_id)
);

--添加购物车明细shopcartdetails
insert into shopcartdetails values(10000,1,2,200);
insert into shopcartdetails values(10001,2,3,300);
insert into shopcartdetails values(10002,3,4,400);
insert into shopcartdetails values(10003,4,5,500);
insert into shopcartdetails values(10004,100,5,500);
insert into shopcartdetails values(10004,101,7,500);
insert into shopcartdetails values(10004,102,2,500);

--16.创建订单状态表 orderstate
create table orderstate
(state_id        Number,--订单状态ID  主键
state_name      Varchar2(32),--订单状态名称
state_describ        Varchar2(32),--订单状态描述
constraint orderstate_state_id_pk primary key(state_id)
);
--添加订单状态orderstate
create sequence orderstate_state_id_seq
start with 10000
increment by 1  
nomaxvalue  
nocycle  
nocache  
order; 
insert into orderstate values(orderstate_state_id_seq.nextval,'待出仓','待出仓');
insert into orderstate values(orderstate_state_id_seq.nextval,'待揽件','待揽件');
insert into orderstate values(orderstate_state_id_seq.nextval,'已发货','已发货');
insert into orderstate values(orderstate_state_id_seq.nextval,'待收件','待收件');
insert into orderstate values(orderstate_state_id_seq.nextval,'已收件','已收件');

select * from orderstate
--17.创建订单记录表 orderrecord
create table orderrecord
(order_id              Number,--订单Id   主键
user_id                Number,--用户Id   外键
address_id            Number,--送货地址  外键
goods_id             Number,--商品ID   外键
goods_sum              Number,--商品数量
order_deliverytype    Varchar2(50),--配送方式
state_id              Number,--订单状态  外键
order_time            Date,--下单时间
constraint orderrecord_order_id_pk primary key(order_id),
constraint orderrecord_user_id_fk foreign key(user_id) references userinfo(user_id),
constraint orderrecord_address_id_fk foreign key(address_id) references receiveaddress(address_id),
constraint orderrecord_goods_id_fk foreign key(goods_id) references goods(goods_id),
constraint orderrecord_state_id_fk foreign key(state_id) references orderstate(state_id));

--添加订单记录orderrecord
create sequence orderrecord_order_id_seq
start with 10000
increment by 1  
nomaxvalue  
nocycle  
nocache; 
insert into orderrecord values(orderrecord_order_id_seq.nextval,10000,10000,1,2,'飞送',10003,sysdate);
insert into orderrecord values(orderrecord_order_id_seq.nextval,10001,10001,2,3,'美团送',10004,sysdate);
insert into orderrecord values(orderrecord_order_id_seq.nextval,10002,10002,3,4,'饿了吗送',10001,sysdate);
insert into orderrecord values(orderrecord_order_id_seq.nextval,10003,10003,4,5,'陆地送',10000,sysdate);

insert into orderrecord values(orderrecord_order_id_seq.nextval,49,22,101,2,'顺丰',10000,sysdate);
insert into orderrecord values(orderrecord_order_id_seq.nextval,49,23,102,1,'京东',10001,sysdate);
insert into orderrecord values(orderrecord_order_id_seq.nextval,49,24,103,4,'巴东',10002,sysdate);
insert into orderrecord values(orderrecord_order_id_seq.nextval,49,25,104,3,'顺丰',10003,sysdate);
insert into orderrecord values(orderrecord_order_id_seq.nextval,49,25,104,3,'顺丰',10003,to_date('2018/1/23 12:12:12','yyyy-mm-dd hh24:mi:ss'));

select * from orderrecord

create view order_record_view(order_id,user_id,user_name,user_phone,Recipient_name,Recipient_phone,delivery_address,goods_id,goods_name,goods_sum,order_deliverytype,state_id,order_time) 
as select o.order_id,u.user_id,u.user_name,u.user_phone,r.recipient_name,r.recipient_phone,r.address_province||''||r.address_city||''||r.address_county||''||r.address_detailed delivery_address,g.goods_id,g.goods_name,g.goods_sum,o.order_deliverytype,o.state_id,o.order_time
from goods g,userinfo u,receiveaddress r,orderrecord o
where g.goods_id=o.goods_id and u.user_id=o.user_id and r.address_id=o.address_id 
group by o.order_id,u.user_id,u.user_name,u.user_phone,r.recipient_name,r.recipient_phone,r.address_province,r.address_city,r.address_county,r.address_detailed,g.goods_id,g.goods_name,g.goods_sum,o.order_deliverytype,o.state_id,o.order_time

select 

--18.创建订单详情表
create table orderdetailed(
goods_id number,   --商品id
order_id number,   --订单id
goods_sum number   --商品数量
)

insert into orderdetailed values(101,10016,2);
insert into orderdetailed values(102,10016,1);
insert into orderdetailed values(103,10017,1);
insert into orderdetailed values(104,10018,8);
insert into orderdetailed values(105,10018,4);
insert into orderdetailed values(106,10018,6);
insert into orderdetailed values(107,10019,3);
insert into orderdetailed values(101,10023,2);
insert into orderdetailed values(102,10023,1);


select g.*,p.picture_url
from goods g,picture p 
where g.goods_id=p.goods_id and g.goods_id= 100

select g.*,p.picture_url 
from goods g,picture p 
where g.goods_id=p.goods_id and g.goods_id= 100;

--创建购物车视图
create or replace view shopcart_view as
(select  u.user_id,g.goods_name,g.goods_salesprice,d.buy_number,d.shopcart_id,u.user_point,g.goods_id,g.goods_describ
from userinfo u,goods g,shopcart s,shopcartdetails d
where u.user_id=s.user_id and s.shopcart_id=d.shopcart_id and d.goods_id=g.goods_id);

--查询视图
select goods_id,goods_name,goods_salesprice,buy_number,shopcart_id,goods_describ,sum(buy_number) by_number 
from shopcart_view where user_id=49  
group by goods_id,goods_name,goods_salesprice,buy_number,shopcart_id,goods_describ

--查询订单页数据

--12.创建收藏夹表 collection
create table collection
(collection_id     Number,--收藏夹ID  主键
 user_id           Number,--用户id    外键
 constraint collection_collection_id_pk primary key(collection_id),
 constraint collection_user_id_fk foreign key(user_id) references userinfo(user_id));
 --添加创建收藏夹collection
create sequence collection_collection_id_seq
start with 10000
increment by 1  
nomaxvalue  
nocycle  
nocache  
order; 
insert into collection values(collection_collection_id_seq.nextval,49);
insert into collection values(collection_collection_id_seq.nextval,10001);
insert into collection values(collection_collection_id_seq.nextval,10002);
insert into collection values(collection_collection_id_seq.nextval,10003);

select * from collection
--13创建收藏夹明细表 collectdetail
create table collectdetail
(collection_id	   Number,--收藏夹ID  外键
 goods_id	         Number,--商品ID   外键
 collection_time	 Date,--收藏时间
 constraint collectdetail_goods_id_fk foreign key(goods_id) references goods(goods_id),
 constraint collectdetail_collection_id_fk foreign key(collection_id) references collection(collection_id));
 
-- 添加创建收藏夹明细collectdetail
insert into collectdetail values(10000,101,sysdate);
insert into collectdetail values(10000,102,sysdate);
insert into collectdetail values(10000,103,sysdate);
insert into collectdetail values(10000,104,sysdate);

create or replace view shopcart_view as
(select  u.user_id,g.goods_name,g.goods_salesprice,d.buy_number,d.shopcart_id,u.user_point,g.goods_id,g.goods_describ
from userinfo u,goods g,shopcart s,shopcartdetails d
where u.user_id=s.user_id and s.shopcart_id=d.shopcart_id and d.goods_id=g.goods_id);

select goods_id,goods_name,goods_salesprice,buy_number,shopcart_id,goods_describ,sum(buy_number) by_number from shopcart_view where user_id=?  group by goods_id,goods_name,goods_salesprice,buy_number,shopcart_id,goods_describ
