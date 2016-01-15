prompt PL/SQL Developer import file
prompt Created on 2014年1月14日 by Administrator
set feedback off
set define off
prompt Dropping ACTIVITY...
drop table ACTIVITY cascade constraints;
prompt Dropping CUSTINFO...
drop table CUSTINFO cascade constraints;
prompt Dropping CUSTLOST...
drop table CUSTLOST cascade constraints;
prompt Dropping DICTIONARY...
drop table DICTIONARY cascade constraints;
prompt Dropping LINKMAN...
drop table LINKMAN cascade constraints;
prompt Dropping ORDERDETAIL...
drop table ORDERDETAIL cascade constraints;
prompt Dropping ORDERS...
drop table ORDERS cascade constraints;
prompt Dropping POWER...
drop table POWER cascade constraints;
prompt Dropping PRODUCT...
drop table PRODUCT cascade constraints;
prompt Dropping ROLE...
drop table ROLE cascade constraints;
prompt Dropping SALECHANCE...
drop table SALECHANCE cascade constraints;
prompt Dropping SALEPLAN...
drop table SALEPLAN cascade constraints;
prompt Dropping SERVICE...
drop table SERVICE cascade constraints;
prompt Dropping STORAGE...
drop table STORAGE cascade constraints;
prompt Dropping USERS...
drop table USERS cascade constraints;
prompt Creating ACTIVITY...
create table ACTIVITY
(
  aid      NUMBER not null,
  custno   VARCHAR2(100),
  custname VARCHAR2(200),
  actdate  DATE,
  place    VARCHAR2(200),
  title    VARCHAR2(500),
  actdesc  VARCHAR2(500),
  remark   VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACTIVITY
  add constraint PK_ACT primary key (AID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CUSTINFO...
create table CUSTINFO
(
  custno       VARCHAR2(50) not null,
  name         VARCHAR2(100),
  region       VARCHAR2(50),
  managerno    NUMBER,
  cust_manager VARCHAR2(50),
  satisfy      VARCHAR2(30),
  credit       VARCHAR2(30),
  cust_addr    VARCHAR2(200),
  zip          VARCHAR2(10),
  tel          VARCHAR2(50),
  fax          VARCHAR2(50),
  website      VARCHAR2(100),
  licence      VARCHAR2(50),
  chieftain    VARCHAR2(50),
  bankroll     NUMBER,
  turnover     NUMBER,
  bank         VARCHAR2(200),
  account      VARCHAR2(50),
  local_tax    VARCHAR2(50),
  national_tax VARCHAR2(50),
  status       NUMBER,
  levellabel   VARCHAR2(50),
  id           NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table CUSTINFO
  add constraint PK_CUST primary key (CUSTNO)
  disable;

prompt Creating CUSTLOST...
create table CUSTLOST
(
  lostid        NUMBER not null,
  lostno        VARCHAR2(50),
  lostname      VARCHAR2(100),
  lostmanager   VARCHAR2(50),
  lastorderdate DATE,
  lostdate      DATE,
  delay         VARCHAR2(1000),
  reason        VARCHAR2(1000),
  status        VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table CUSTLOST
  add constraint PK_LOST primary key (LOSTID)
  disable;

prompt Creating DICTIONARY...
create table DICTIONARY
(
  dict_id     NUMBER not null,
  dict_type   VARCHAR2(50) not null,
  dict_item   VARCHAR2(50) not null,
  dict_value  VARCHAR2(50) not null,
  dict_isedit NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );

prompt Creating LINKMAN...
create table LINKMAN
(
  id       NUMBER not null,
  custno   VARCHAR2(50),
  custname VARCHAR2(100),
  name     VARCHAR2(20),
  sex      VARCHAR2(6),
  position VARCHAR2(20),
  tel      VARCHAR2(30),
  mobile   VARCHAR2(30),
  remark   VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table LINKMAN
  add constraint PK_LINKMAN primary key (ID)
  disable;

prompt Creating ORDERDETAIL...
create table ORDERDETAIL
(
  did     NUMBER not null,
  orderid NUMBER,
  prodid  NUMBER,
  count   NUMBER,
  unit    VARCHAR2(10),
  total   NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDERDETAIL
  add constraint PK_DETAIL primary key (DID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ORDERS...
create table ORDERS
(
  oid      NUMBER not null,
  custno   VARCHAR2(50),
  custname VARCHAR2(100),
  odate    VARCHAR2(50),
  address  VARCHAR2(200),
  status   NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table ORDERS
  add constraint PK_ORDER primary key (OID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating POWER...
create table POWER
(
  powerid   VARCHAR2(100) not null,
  powerdesc VARCHAR2(500),
  url       VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table POWER
  add constraint PK_POWER primary key (POWERID)
  disable;

prompt Creating PRODUCT...
create table PRODUCT
(
  id     NUMBER not null,
  name   VARCHAR2(50),
  typeno VARCHAR2(50),
  grades VARCHAR2(20),
  batch  VARCHAR2(20),
  unit   VARCHAR2(20),
  price  NUMBER,
  remark VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );

prompt Creating ROLE...
create table ROLE
(
  id       NUMBER not null,
  rolename VARCHAR2(20),
  roledesc VARCHAR2(400)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table ROLE
  add constraint FK_ROLE primary key (ID)
  disable;

prompt Creating SALECHANCE...
create table SALECHANCE
(
  id          NUMBER not null,
  name        VARCHAR2(50) not null,
  resume      VARCHAR2(100),
  linkman     VARCHAR2(30),
  tel         VARCHAR2(30),
  createman   VARCHAR2(30),
  assignman   VARCHAR2(30),
  assigntime  DATE,
  chancefrom  VARCHAR2(30),
  chancedesc  VARCHAR2(50),
  probability NUMBER,
  createtime  DATE,
  status      NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table SALECHANCE
  add constraint PK_CHANCE primary key (ID)
  disable;

prompt Creating SALEPLAN...
create table SALEPLAN
(
  planid      NUMBER not null,
  time        DATE,
  plancontent VARCHAR2(200),
  result      VARCHAR2(100),
  status      VARCHAR2(20),
  chanceid    NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table SALEPLAN
  add constraint PK_PLAN primary key (PLANID)
  disable;

prompt Creating SERVICE...
create table SERVICE
(
  sid        NUMBER not null,
  type       VARCHAR2(30),
  title      VARCHAR2(500),
  custno     VARCHAR2(50),
  custname   VARCHAR2(100),
  status     VARCHAR2(10),
  srequest   VARCHAR2(3000),
  creater    VARCHAR2(50),
  createdate VARCHAR2(50),
  dueto      VARCHAR2(30),
  duetime    DATE,
  sdeal      VARCHAR2(3000),
  dealer     VARCHAR2(30),
  dealdate   DATE,
  result     VARCHAR2(500),
  satisfy    VARCHAR2(30)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table SERVICE
  add constraint PK_SERV primary key (SID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating STORAGE...
create table STORAGE
(
  id         NUMBER not null,
  prod_id    NUMBER not null,
  ware_house VARCHAR2(50) not null,
  ware       VARCHAR2(50) not null,
  count      NUMBER not null,
  remark     VARCHAR2(200),
  prod_name  VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table STORAGE
  add constraint ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating USERS...
create table USERS
(
  id       NUMBER not null,
  uname    VARCHAR2(20),
  upwd     VARCHAR2(20),
  roleid   NUMBER,
  realname VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table USERS
  add constraint PK_USERS primary key (ID)
  disable;

prompt Loading ACTIVITY...
insert into ACTIVITY (aid, custno, custname, actdate, place, title, actdesc, remark)
values (1, 'KH140108213254522', '金达集团', to_date('09-01-2014', 'dd-mm-yyyy'), '沈阳中街国际酒店', '交易', '交易1000万华硕笔记本', '成功交易');
insert into ACTIVITY (aid, custno, custname, actdate, place, title, actdesc, remark)
values (2, 'KH140108213254522', '金达集团', to_date('09-01-2014', 'dd-mm-yyyy'), '北京国宾馆', '洽谈业务', '与战略合作伙伴洽谈2014年业务。', '为期三天');
insert into ACTIVITY (aid, custno, custname, actdate, place, title, actdesc, remark)
values (3, 'KH140108212917544', '数码专卖店', to_date('09-01-2014', 'dd-mm-yyyy'), '沈阳迎宾宴会厅', '洽谈笔记本销售业务', '订购华硕笔记本、苹果笔记本', '谈妥');
commit;
prompt 3 records loaded
prompt Loading CUSTINFO...
insert into CUSTINFO (custno, name, region, managerno, cust_manager, satisfy, credit, cust_addr, zip, tel, fax, website, licence, chieftain, bankroll, turnover, bank, account, local_tax, national_tax, status, levellabel, id)
values ('KH140108213254522', '金达集团', '东北', null, '东风', '☆☆☆', '☆☆☆', null, null, '15236366363', null, null, null, null, null, null, null, null, null, null, 0, '普通客户', 17);
insert into CUSTINFO (custno, name, region, managerno, cust_manager, satisfy, credit, cust_addr, zip, tel, fax, website, licence, chieftain, bankroll, turnover, bank, account, local_tax, national_tax, status, levellabel, id)
values ('KH140108213303482', '三好街电子城', '中南', null, '王伟', '☆☆', '☆☆', null, null, '15888888888', null, null, null, null, null, null, null, null, null, null, 0, '合作伙伴', 18);
insert into CUSTINFO (custno, name, region, managerno, cust_manager, satisfy, credit, cust_addr, zip, tel, fax, website, licence, chieftain, bankroll, turnover, bank, account, local_tax, national_tax, status, levellabel, id)
values ('KH140108213306708', '正创科技', '山东', null, '儿童', '☆☆☆☆☆', '☆☆☆☆☆', null, null, '15244448888', null, null, null, null, null, null, null, null, null, null, 0, '合作伙伴', 19);
insert into CUSTINFO (custno, name, region, managerno, cust_manager, satisfy, credit, cust_addr, zip, tel, fax, website, licence, chieftain, bankroll, turnover, bank, account, local_tax, national_tax, status, levellabel, id)
values ('KH140109104147434', '金鑫科技', '北京', null, '金鑫', '☆☆☆', '☆☆☆', null, null, '15266663333', null, null, null, null, null, null, null, null, null, null, 0, '大客户', 21);
insert into CUSTINFO (custno, name, region, managerno, cust_manager, satisfy, credit, cust_addr, zip, tel, fax, website, licence, chieftain, bankroll, turnover, bank, account, local_tax, national_tax, status, levellabel, id)
values ('KH140108195230369', '金达集团', null, null, '东风', '☆☆', '☆☆☆', null, null, '15236366363', null, null, null, null, null, null, null, null, null, null, 0, '大客户', 12);
insert into CUSTINFO (custno, name, region, managerno, cust_manager, satisfy, credit, cust_addr, zip, tel, fax, website, licence, chieftain, bankroll, turnover, bank, account, local_tax, national_tax, status, levellabel, id)
values ('KH140109104151190', '的萨菲', ' ', null, '圣达菲', '☆', '☆☆', null, null, '15266669999', null, null, null, null, null, null, null, null, null, null, 0, '重点开发客户', 22);
insert into CUSTINFO (custno, name, region, managerno, cust_manager, satisfy, credit, cust_addr, zip, tel, fax, website, licence, chieftain, bankroll, turnover, bank, account, local_tax, national_tax, status, levellabel, id)
values ('KH140109104142566', '摩登公司', null, null, '赵鹏', '☆☆☆', '☆☆☆', null, null, '15233336666', null, null, null, null, null, null, null, null, null, null, 0, '普通客户', 20);
insert into CUSTINFO (custno, name, region, managerno, cust_manager, satisfy, credit, cust_addr, zip, tel, fax, website, licence, chieftain, bankroll, turnover, bank, account, local_tax, national_tax, status, levellabel, id)
values ('KH14011410350245', 'sdfs', '山东', null, '东风公司', '☆☆☆☆', '☆☆☆', 'fsdfsdffsd', null, '15233336666', null, null, null, 'sdfsd', null, null, null, null, null, null, 0, '合作伙伴', 23);
insert into CUSTINFO (custno, name, region, managerno, cust_manager, satisfy, credit, cust_addr, zip, tel, fax, website, licence, chieftain, bankroll, turnover, bank, account, local_tax, national_tax, status, levellabel, id)
values ('KH140108212917544', '数码专卖店', '北京', null, '关于', '☆☆☆☆', '☆☆☆☆', '北京朝阳街', null, '15266663333', null, null, null, '张飞', null, null, null, null, null, null, 0, '战略合作伙伴', 16);
commit;
prompt 9 records loaded
prompt Loading CUSTLOST...
insert into CUSTLOST (lostid, lostno, lostname, lostmanager, lastorderdate, lostdate, delay, reason, status)
values (2, 'KH140108213309566', '萨顶公司', '萨顶顶', to_date('06-07-2013', 'dd-mm-yyyy'), to_date('01-01-2014', 'dd-mm-yyyy'), '联系不上', '原因不详', '已经流失');
insert into CUSTLOST (lostid, lostno, lostname, lostmanager, lastorderdate, lostdate, delay, reason, status)
values (3, 'KH140108534536787', '随便公司', '随便', to_date('06-08-2013', 'dd-mm-yyyy'), null, '继续联系<br/><br/>尽量满足客户需求<br/><br/>加强售后服务<br/><br/>erre', null, '暂缓流失');
insert into CUSTLOST (lostid, lostno, lostname, lostmanager, lastorderdate, lostdate, delay, reason, status)
values (4, 'KH140108534539876', '吉祥公司', '中正', to_date('06-08-2013', 'dd-mm-yyyy'), to_date('14-01-2014 10:36:58', 'dd-mm-yyyy hh24:mi:ss'), '继续联系<br/><br/>满足客户需求', 'fsdf', '已经流失');
insert into CUSTLOST (lostid, lostno, lostname, lostmanager, lastorderdate, lostdate, delay, reason, status)
values (5, 'KH140108534535679', '东方电脑', '胡闹', to_date('06-08-2013', 'dd-mm-yyyy'), null, '继续联系', null, '预警');
insert into CUSTLOST (lostid, lostno, lostname, lostmanager, lastorderdate, lostdate, delay, reason, status)
values (6, 'KH140108534575678', '数码科技', '掌柜', to_date('06-08-2013', 'dd-mm-yyyy'), null, '继续联系', null, '预警');
insert into CUSTLOST (lostid, lostno, lostname, lostmanager, lastorderdate, lostdate, delay, reason, status)
values (1, 'KH140108213306708', '正创科技', '童心', to_date('01-07-2013', 'dd-mm-yyyy'), to_date('10-01-2014 10:11:43', 'dd-mm-yyyy hh24:mi:ss'), '加紧继续联系', '联系不上', '已经流失');
insert into CUSTLOST (lostid, lostno, lostname, lostmanager, lastorderdate, lostdate, delay, reason, status)
values (7, 'KH140108213306708', '数码科技', '张仃', to_date('01-07-2013', 'dd-mm-yyyy'), to_date('01-01-2014', 'dd-mm-yyyy'), null, '公司转型', '已经流失');
insert into CUSTLOST (lostid, lostno, lostname, lostmanager, lastorderdate, lostdate, delay, reason, status)
values (8, 'KH140108213306708', '数式科技', '刘欢', to_date('01-07-2013', 'dd-mm-yyyy'), to_date('01-01-2013', 'dd-mm-yyyy'), null, '公司搬迁', '已经流失');
insert into CUSTLOST (lostid, lostno, lostname, lostmanager, lastorderdate, lostdate, delay, reason, status)
values (9, 'KH140108213306708', '浪潮科技', '马新', to_date('01-07-2013', 'dd-mm-yyyy'), to_date('01-01-2014', 'dd-mm-yyyy'), null, '公司倒闭', '已经流失');
insert into CUSTLOST (lostid, lostno, lostname, lostmanager, lastorderdate, lostdate, delay, reason, status)
values (10, 'KH140108213306708', '金马科技', '金贵', to_date('01-07-2013', 'dd-mm-yyyy'), to_date('01-01-2013', 'dd-mm-yyyy'), null, '公司转型', '已经流失');
commit;
prompt 10 records loaded
prompt Loading DICTIONARY...
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (231, '地区', '河北', '河北', 1);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (201, '地区', '山东', '山东', 1);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (101, '服务类型', '咨询', '咨询', 1);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (102, '服务类型', '建议', '建议', 1);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (103, '服务类型', '投诉', '投诉', 1);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (202, '地区', '北京', '北京', 1);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (203, '地区', '东北', '东北', 1);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (204, '地区', '中南', '中南', 1);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (205, '地区', '上海', '上海', 1);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (301, '客户等级', '普通客户', '1', 0);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (302, '客户等级', '重点开发客户', '2', 0);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (303, '客户等级', '大客户', '3', 0);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (304, '客户等级', '合作伙伴', '4', 0);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (305, '客户等级', '战略合作伙伴', '5', 0);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (401, '客户信用度', '☆', '1', 0);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (402, '客户信用度', '☆☆', '2', 0);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (403, '客户信用度', '☆☆☆', '3', 0);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (404, '客户信用度', '☆☆☆☆', '4', 0);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (405, '客户信用度', '☆☆☆☆☆', '5', 0);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (501, '客户满意度', '☆', '1', 0);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (502, '客户满意度', '☆☆', '2', 0);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (503, '客户满意度', '☆☆☆', '3', 0);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (504, '客户满意度', '☆☆☆☆', '4', 0);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (505, '客户满意度', '☆☆☆☆☆', '5', 0);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (601, '客户流失状态', '预警', '1', 0);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (602, '客户流失状态', '暂缓流失', '2', 0);
insert into DICTIONARY (dict_id, dict_type, dict_item, dict_value, dict_isedit)
values (603, '客户流失状态', '已经流失', '3', 0);
commit;
prompt 27 records loaded
prompt Loading LINKMAN...
insert into LINKMAN (id, custno, custname, name, sex, position, tel, mobile, remark)
values (4, 'KH140108213254522', '金达集团', '东风', '男', '经理', '024-88889999', '15236366363', null);
insert into LINKMAN (id, custno, custname, name, sex, position, tel, mobile, remark)
values (5, 'KH140108213303482', '三好街电子城', '王伟', '男', '经理', null, '15888888888', null);
insert into LINKMAN (id, custno, custname, name, sex, position, tel, mobile, remark)
values (6, 'KH140108213306708', '正在创建中', '儿童', '男', '经理', null, '15244448888', null);
insert into LINKMAN (id, custno, custname, name, sex, position, tel, mobile, remark)
values (1, 'KH140108195428579', '三好街电子城', '王伟', '男', '经理', '024-72525555', '15844445555', '暂无');
insert into LINKMAN (id, custno, custname, name, sex, position, tel, mobile, remark)
values (13, 'KH140109104151190', '的萨菲', '圣达菲', '男', '经理', null, '15266669999', null);
insert into LINKMAN (id, custno, custname, name, sex, position, tel, mobile, remark)
values (11, 'KH140109104142566', 'ttt', 'tt', '男', '经理', null, '15233336666', null);
insert into LINKMAN (id, custno, custname, name, sex, position, tel, mobile, remark)
values (12, 'KH140109104147434', 'tt', 'tt', '男', '经理', null, '15266663333', null);
insert into LINKMAN (id, custno, custname, name, sex, position, tel, mobile, remark)
values (14, 'KH140108213306708', '正在创建中', '飞', '男', ' 飞', '2', null, null);
insert into LINKMAN (id, custno, custname, name, sex, position, tel, mobile, remark)
values (15, 'KH140108212917544', 'fsdf', '测试', '男', '测试', '024-99996666', '15233336666', '99');
insert into LINKMAN (id, custno, custname, name, sex, position, tel, mobile, remark)
values (3, 'KH140108212917544', 'fsdf', '关于', '男', '经理', '024-88888888', '15266663333', '888');
insert into LINKMAN (id, custno, custname, name, sex, position, tel, mobile, remark)
values (17, 'KH14011410350245', 'sdfs', '东风公司', '女', '经理', null, '15233336666', null);
insert into LINKMAN (id, custno, custname, name, sex, position, tel, mobile, remark)
values (16, 'KH140108213254522', '金达集团', '藏民', '男', '经理', '02488889999', '18566669999', '888');
commit;
prompt 12 records loaded
prompt Loading ORDERDETAIL...
insert into ORDERDETAIL (did, orderid, prodid, count, unit, total)
values (1, 7, 3, 5, '台', 19440);
insert into ORDERDETAIL (did, orderid, prodid, count, unit, total)
values (2, 7, 5, 6, '台', 50028);
insert into ORDERDETAIL (did, orderid, prodid, count, unit, total)
values (3, 4, 7, 3, '台', 24500);
insert into ORDERDETAIL (did, orderid, prodid, count, unit, total)
values (4, 13, 8, 4, '台', 39988);
commit;
prompt 4 records loaded
prompt Loading ORDERS...
insert into ORDERS (oid, custno, custname, odate, address, status)
values (1, 'KH140108213254522', '金达集团', '2013年01月03日', '山西孝义', 0);
insert into ORDERS (oid, custno, custname, odate, address, status)
values (2, 'KH140108213254522', '金达集团', '2014年01月03日', '山西孝义', 0);
insert into ORDERS (oid, custno, custname, odate, address, status)
values (3, 'KH140108213254522', '金达集团', '2012年01月03日', '山西孝义', 0);
insert into ORDERS (oid, custno, custname, odate, address, status)
values (4, 'KH140108213254522', '金达集团', '2014年01月03日', '山西孝义', 1);
insert into ORDERS (oid, custno, custname, odate, address, status)
values (5, 'KH140108213254522', '金达集团', '2013年01月03日', '山西孝义', 0);
insert into ORDERS (oid, custno, custname, odate, address, status)
values (6, 'KH140108213254522', '金达集团', '2013年01月03日', '山西孝义', 0);
insert into ORDERS (oid, custno, custname, odate, address, status)
values (7, 'KH140108212917544', '数码专卖店', '2013年01月03日', '沈阳三好街', 1);
insert into ORDERS (oid, custno, custname, odate, address, status)
values (8, 'KH140108212917544', '数码专卖店', '2014年01月03日', '沈阳三好街', 0);
insert into ORDERS (oid, custno, custname, odate, address, status)
values (9, 'KH140108212917544', '数码专卖店', '2012年01月03日', '沈阳三好街', 0);
insert into ORDERS (oid, custno, custname, odate, address, status)
values (10, 'KH140108212917544', '数码专卖店', '2013年01月03日', '沈阳三好街', 0);
insert into ORDERS (oid, custno, custname, odate, address, status)
values (11, 'KH140108212917544', '数码专卖店', '2014年01月03日', '沈阳三好街', 0);
insert into ORDERS (oid, custno, custname, odate, address, status)
values (12, 'KH140108212917544', '数码专卖店', '2013年01月03日', '沈阳三好街', 0);
insert into ORDERS (oid, custno, custname, odate, address, status)
values (13, 'KH140108213306708', '正创科技', '2012年01月03日', '山东', 1);
commit;
prompt 13 records loaded
prompt Loading POWER...
insert into POWER (powerid, powerdesc, url)
values ('1', '销售机会管理', 'sale');
insert into POWER (powerid, powerdesc, url)
values ('2', '客户开发计划', 'plan');
insert into POWER (powerid, powerdesc, url)
values ('3', '客户信息管理', 'cust,linkman,activity,orders');
insert into POWER (powerid, powerdesc, url)
values ('4', '客户流失管理', 'lost');
insert into POWER (powerid, powerdesc, url)
values ('5', '服务创建', 'service');
insert into POWER (powerid, powerdesc, url)
values ('6', '服务处理', 'service');
insert into POWER (powerid, powerdesc, url)
values ('7', '客户贡献分析', 'rept');
insert into POWER (powerid, powerdesc, url)
values ('8', '客户构成分析', 'rept');
insert into POWER (powerid, powerdesc, url)
values ('9', '客户服务分析', 'rept');
insert into POWER (powerid, powerdesc, url)
values ('10', '客户流失分析', 'rept');
insert into POWER (powerid, powerdesc, url)
values ('11', '数据字典管理', 'dictionary');
insert into POWER (powerid, powerdesc, url)
values ('12', '查询产品信息', 'product');
insert into POWER (powerid, powerdesc, url)
values ('13', '查询库存', 'storage');
insert into POWER (powerid, powerdesc, url)
values ('14', '用户管理', 'user');
insert into POWER (powerid, powerdesc, url)
values ('15', '角色管理', 'role');
commit;
prompt 15 records loaded
prompt Loading PRODUCT...
insert into PRODUCT (id, name, typeno, grades, batch, unit, price, remark)
values (3, '华硕笔记本', 'X550', 'i5', '201301', '台', 3888, null);
insert into PRODUCT (id, name, typeno, grades, batch, unit, price, remark)
values (1, '华硕笔记本', 'X660', 'i6', '201401', '台', 4888, null);
insert into PRODUCT (id, name, typeno, grades, batch, unit, price, remark)
values (2, '华硕笔记本', 'X770', 'i7', '201401', '台', 5888, null);
insert into PRODUCT (id, name, typeno, grades, batch, unit, price, remark)
values (4, '苹果笔记本', 'A521', 'A3', '201305', '台', 6888, '走私进口');
insert into PRODUCT (id, name, typeno, grades, batch, unit, price, remark)
values (5, '苹果笔记本', 'A522', 'A4', '201306', '台', 8338, '走私进口');
insert into PRODUCT (id, name, typeno, grades, batch, unit, price, remark)
values (6, '苹果笔记本', 'A523', 'A5', '201307', '台', 8688, '走私进口');
insert into PRODUCT (id, name, typeno, grades, batch, unit, price, remark)
values (7, '苹果笔记本', 'A524', 'A6', '201308', '台', 8898, '走私进口');
insert into PRODUCT (id, name, typeno, grades, batch, unit, price, remark)
values (8, '苹果笔记本', 'A525', 'A7', '201401', '台', 9998, '走私进口');
insert into PRODUCT (id, name, typeno, grades, batch, unit, price, remark)
values (9, '三星笔记本', 'S201', 'S1', '201305', '台', 4888, '走私进口');
insert into PRODUCT (id, name, typeno, grades, batch, unit, price, remark)
values (10, '三星笔记本', 'S202', 'S2', '201306', '台', 5388, '走私进口');
insert into PRODUCT (id, name, typeno, grades, batch, unit, price, remark)
values (11, '三星笔记本', 'S203', 'S3', '201307', '台', 5688, '走私进口');
insert into PRODUCT (id, name, typeno, grades, batch, unit, price, remark)
values (12, '三星笔记本', 'S24', 'S4', '201308', '台', 6000, '走私进口');
commit;
prompt 12 records loaded
prompt Loading ROLE...
insert into ROLE (id, rolename, roledesc)
values (1, '董事长', 'sale,plan,cust,linkman,activity,orders,lost,service,rept,dictionary,product,storage,user,role');
insert into ROLE (id, rolename, roledesc)
values (2, '总经理', 'sale, plan, cust,linkman,activity,orders, lost, service, service, rept, rept, rept, rept, dictionary, product, storage, user, role');
insert into ROLE (id, rolename, roledesc)
values (8, '客服', 'service');
insert into ROLE (id, rolename, roledesc)
values (6, '前台', 'service,rept,product,storage');
insert into ROLE (id, rolename, roledesc)
values (7, '售后服务', 'service');
insert into ROLE (id, rolename, roledesc)
values (3, '主管', 'sale,plan,cust,linkman,activity,orders,lost,service,rept,dictionary,product,storage,user,role');
insert into ROLE (id, rolename, roledesc)
values (4, '主任', 'sale,plan,cust,linkman,activity,orders,lost,service,rept,dictionary,product,storage,user,role');
insert into ROLE (id, rolename, roledesc)
values (5, '业务员', 'cust,linkman,activity,orders,lost,service,rept,product,storage');
commit;
prompt 8 records loaded
prompt Loading SALECHANCE...
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (29, '法撒旦', '发生大', '发生大', '15555555555', '刘备', '未指派', null, '撒地方', '的萨菲', 20, to_date('07-01-2014', 'dd-mm-yyyy'), 0);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (30, 'ttt', 'ttt', 't', '15244445555', '刘备', '未指派', null, 'ertre', 't', 20, to_date('07-01-2014', 'dd-mm-yyyy'), 0);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (31, '1111发生大', '的萨菲', ' 的萨菲', '15366669999', '刘备', '未指派', null, '发生大幅', '的萨菲', 20, to_date('07-01-2014', 'dd-mm-yyyy'), 0);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (32, '撒地方', '的萨菲', '树大招风', '15200003333', '刘备', '未指派', null, '撒地方', '撒地方', 20, to_date('07-01-2014', 'dd-mm-yyyy'), 0);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (33, '111119', '111111', '111111', '15233369998', '刘备', '未指派', null, '说地方撒旦', '111111', 19, to_date('07-01-2014', 'dd-mm-yyyy'), 0);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (34, 'wwww', 'wwww', 'www', '15233336666', '刘备', '张五', null, 'wwww', 'wwww', 20, to_date('06-01-2014', 'dd-mm-yyyy'), 0);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (35, '333', '33333333333', '3333333', '15333333333', '刘备', '关平', to_date('06-01-2014 14:58:41', 'dd-mm-yyyy hh24:mi:ss'), '3333333', '3333333333', 33, to_date('06-01-2014', 'dd-mm-yyyy'), 0);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (36, '9', 'fasd', 'fsa', '13999999999', '孔明', '张七', to_date('06-01-2014 15:04:02', 'dd-mm-yyyy hh24:mi:ss'), 'sdaf', 'fsda', 9, to_date('06-01-2014', 'dd-mm-yyyy'), 1);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (41, '撒地方', '让他', '二', '15233225555', '刘备', '未指派', to_date('12-01-2014 11:28:37', 'dd-mm-yyyy hh24:mi:ss'), '梵蒂冈', '威尔二', 28, to_date('12-01-2014 11:28:37', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (2, '科技数码', '有意购买苹果电脑', '张飞', '15035356565', '刘备', '魏延', to_date('30-11-2013 19:42:14', 'dd-mm-yyyy hh24:mi:ss'), '电视广告', '需求量大，客户稳定，信誉度高', 85, to_date('25-11-2013', 'dd-mm-yyyy'), 2);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (27, '三大数码', '发生的', '的萨菲', '15244447777', '刘备', '未指派', null, '圣达菲', '三大飞', 20, to_date('27-11-2013 20:33:57', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (25, '数码圣达菲', '三大', '地方撒', '15233336666', '刘备', '未指派', null, 'sdf', '三大啊', 20, to_date('27-11-2013 20:33:01', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (12, '正在创建中', '还没想好', '儿童', '15244448888', '刘备', '庞统', to_date('08-01-2014 10:52:50', 'dd-mm-yyyy hh24:mi:ss'), '挺讨厌', '儿童', 20, to_date('08-01-2013', 'dd-mm-yyyy'), 1);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (26, '数码的', '发生的', '范德萨', '15266663333', '刘备', '未指派', null, '的萨菲', '的萨菲', 20, to_date('27-11-2013 20:33:37', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (28, '的萨菲数码', '发点', '的萨菲', '15222222222', '刘备', '未指派', null, '阿方索', '圣达菲', 20, to_date('27-11-2013 20:34:16', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (37, 'wer', 'wer', 'wer', '15233336666', '刘备', '未指派', to_date('07-01-2014 10:52:35', 'dd-mm-yyyy hh24:mi:ss'), 'er', 'r', 2, to_date('07-01-2014 10:52:35', 'dd-mm-yyyy hh24:mi:ss'), 2);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (14, 'sdfs', '有意购买。。。。。', '东风公司', '15233336666', '刘备', '未指派', to_date('12-01-2014 12:13:06', 'dd-mm-yyyy hh24:mi:ss'), 'fdfsd', '发生的', 55, to_date('08-01-2013', 'dd-mm-yyyy'), 1);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (15, '发生的', '有意购买', '飞洒', '15244488883', '刘备', '未指派', null, '飞洒地方', '发生的', 20, to_date('26-11-2013 09:31:46', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (16, '的萨菲', '有意购买', '圣达菲', '15266669999', '刘备', '未指派', null, '的撒', '圣达菲', 30, to_date('26-11-2013 10:26:10', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (17, '打分', '有意购买', '法撒旦', '15244449999', '刘备', '未指派', null, '三大发生的', '法撒旦', 75, to_date('26-11-2013 09:32:36', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (18, 'wertwe', 'fsdsdf', 'fsdfs', '15636366363', '刘备', '未指派', to_date('14-01-2014 10:34:07', 'dd-mm-yyyy hh24:mi:ss'), 'sdfsd', 'sdfsd', 20, to_date('26-11-2013', 'dd-mm-yyyy'), 0);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (19, 'ttt', 'tt', 'tt', '15233336666', '刘备', '未指派', null, 'ttt', 'tt', 20, to_date('07-01-2014', 'dd-mm-yyyy'), 1);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (20, 'tttt', 'ttt', 'tt', '15556669998', '刘备', '未指派', null, 'ttttt', 'tt', 20, to_date('26-11-2013 12:28:57', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (21, 'tt', 'tt', 'tt', '15266663333', '刘备', '未指派', null, 'tttt', 'tt', 20, to_date('26-11-2013 12:04:07', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (22, 'ttttt', 'tt', 'tt', '15633333555', '刘备', '未指派', null, 'ttttt', 'ttt', 20, to_date('26-11-2013 12:04:21', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (23, 'ttt', 'ttt', 'ttt', '15222222223', '刘备', '未指派', null, 'ttt', 'ttt', 30, to_date('27-11-2013 09:54:07', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (24, 't', 't', 't', '15233336666', '刘备', '未指派', null, 't', 't', 2, to_date('27-11-2013 10:02:09', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (6, '金达集团', '有意购买尼康数码相机', '东风', '15236366363', '刘备', '貂蝉', to_date('08-01-2014 10:53:59', 'dd-mm-yyyy hh24:mi:ss'), '飞洒', '需求量大', 88, to_date('07-01-2013', 'dd-mm-yyyy'), 1);
insert into SALECHANCE (id, name, resume, linkman, tel, createman, assignman, assigntime, chancefrom, chancedesc, probability, createtime, status)
values (9, '三好街电子城', '需要大量电脑耗材', '王伟', '15888888888', '刘备', '未指派', to_date('08-01-2014 19:38:46', 'dd-mm-yyyy hh24:mi:ss'), '报纸、海报', '需求量大，客户稳定', 90, to_date('08-01-2013', 'dd-mm-yyyy'), 1);
commit;
prompt 29 records loaded
prompt Loading SALEPLAN...
insert into SALEPLAN (planid, time, plancontent, result, status, chanceid)
values (2, to_date('10-01-2014', 'dd-mm-yyyy'), '拜访', 'aaa', null, 36);
insert into SALEPLAN (planid, time, plancontent, result, status, chanceid)
values (3, to_date('15-01-2014', 'dd-mm-yyyy'), '再次拜访', 'bbb', null, 36);
insert into SALEPLAN (planid, time, plancontent, result, status, chanceid)
values (22, to_date('07-01-2014', 'dd-mm-yyyy'), '推荐产品', '一般', null, 2);
insert into SALEPLAN (planid, time, plancontent, result, status, chanceid)
values (20, to_date('09-01-2014', 'dd-mm-yyyy'), '推荐产品', '好', null, 1);
insert into SALEPLAN (planid, time, plancontent, result, status, chanceid)
values (18, to_date('07-01-2014', 'dd-mm-yyyy'), '上门拜访', '很好', null, 1);
insert into SALEPLAN (planid, time, plancontent, result, status, chanceid)
values (21, to_date('11-01-2014', 'dd-mm-yyyy'), '签订合同', '非常好', null, 1);
insert into SALEPLAN (planid, time, plancontent, result, status, chanceid)
values (23, to_date('08-01-2014', 'dd-mm-yyyy'), '推荐产品', '一般', null, 2);
insert into SALEPLAN (planid, time, plancontent, result, status, chanceid)
values (25, to_date('06-01-2014', 'dd-mm-yyyy'), 'sdf', null, null, 13);
insert into SALEPLAN (planid, time, plancontent, result, status, chanceid)
values (15, to_date('07-01-2014', 'dd-mm-yyyy'), '22', 'aaa', null, 37);
insert into SALEPLAN (planid, time, plancontent, result, status, chanceid)
values (10, to_date('05-02-2014', 'dd-mm-yyyy'), 'sffsdf', 'ccc', null, 37);
insert into SALEPLAN (planid, time, plancontent, result, status, chanceid)
values (14, to_date('07-01-2014', 'dd-mm-yyyy'), '是滴是滴', 'ddd', null, 37);
insert into SALEPLAN (planid, time, plancontent, result, status, chanceid)
values (17, to_date('09-01-2014', 'dd-mm-yyyy'), '签合同', '很好', null, 12);
insert into SALEPLAN (planid, time, plancontent, result, status, chanceid)
values (27, to_date('14-01-2014', 'dd-mm-yyyy'), 'sdfsd', 'fsdfsd', null, 14);
insert into SALEPLAN (planid, time, plancontent, result, status, chanceid)
values (24, to_date('08-01-2014', 'dd-mm-yyyy'), '谈合同', '谈妥', null, 6);
commit;
prompt 14 records loaded
prompt Loading SERVICE...
insert into SERVICE (sid, type, title, custno, custname, status, srequest, creater, createdate, dueto, duetime, sdeal, dealer, dealdate, result, satisfy)
values (2, '咨询', '咨询产品信息', 'KH140108245654456', '萨菲公司', '已分配', '询问产品的价格', '刘备', '2013年01月01日', '张蕾', to_date('12-01-2014 12:57:50', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, null, null);
insert into SERVICE (sid, type, title, custno, custname, status, srequest, creater, createdate, dueto, duetime, sdeal, dealer, dealdate, result, satisfy)
values (5, '投诉', '投诉服务', 'KH140167856456588', '缘定公司', '新创建', '投诉服务态度不好', '刘备', '2014年01月05日', '刘丹', to_date('12-01-2014 12:40:58', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, null, null);
insert into SERVICE (sid, type, title, custno, custname, status, srequest, creater, createdate, dueto, duetime, sdeal, dealer, dealdate, result, satisfy)
values (1, '咨询', '咨询产品信息', 'KH140108245656562', '金达集团', '已分配', '详细询问产品的价格、规格、性能等', '刘备', '2014年01月07日', '张蕾', to_date('12-01-2014 12:56:50', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, null, null);
insert into SERVICE (sid, type, title, custno, custname, status, srequest, creater, createdate, dueto, duetime, sdeal, dealer, dealdate, result, satisfy)
values (6, '建议', '客户建议', 'KH140108286765546', '默默公司', '新创建', '建议引进新产品', '刘备', '2014年01月09日', '刘丹', to_date('12-01-2014 12:55:53', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, null, null);
insert into SERVICE (sid, type, title, custno, custname, status, srequest, creater, createdate, dueto, duetime, sdeal, dealer, dealdate, result, satisfy)
values (8, '咨询', '咨询', 'KH35435465464754', '自然公司', '新创建', '咨询服务', '刘备', '2014年01月10日', '张蕾', to_date('12-01-2014 12:56:11', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, null, null);
insert into SERVICE (sid, type, title, custno, custname, status, srequest, creater, createdate, dueto, duetime, sdeal, dealer, dealdate, result, satisfy)
values (4, '投诉', '投诉服务', 'KH140108214535654', '某某公司', '已归档', '投诉服务态度不好', '刘备', '2014年01月10日', '刘丹', to_date('14-01-2014 10:37:37', 'dd-mm-yyyy hh24:mi:ss'), 'sfdfgfd', '刘备', to_date('14-01-2014', 'dd-mm-yyyy'), 'sdfdsf', '☆☆☆');
insert into SERVICE (sid, type, title, custno, custname, status, srequest, creater, createdate, dueto, duetime, sdeal, dealer, dealdate, result, satisfy)
values (9, '投诉', '投诉', 'KH002444100004444', '嘉陵公司', '新创建', '服务不满意', '刘备', '2014年01月10日', null, null, null, null, null, null, null);
commit;
prompt 7 records loaded
prompt Loading STORAGE...
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (1, 50, 'LNXKNM', 'GIVNW', 526, 'PBMIJQ', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (2, 53, 'QRGKEZ', 'EEGLN', 800, 'QMMDSZ', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (3, 27, 'NBCXDW', 'TKEAW', 357, 'CGJLQK', 'B51冲锋枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (4, 68, 'CQYABY', 'IAZGO', 330, 'AKMNRN', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (5, 41, 'ROEVNH', 'NUYLA', 183, 'PTRZIL', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (6, 37, 'DWJLBK', 'ONKAP', 671, 'AAVGFJ', 'B51冲锋枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (7, 14, 'TZNYNQ', 'TXORM', 753, 'QKBZMB', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (8, 14, 'SFOWEV', 'ZHHKZ', 893, 'KZVKWT', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (9, 61, 'HASWID', 'VBODB', 144, 'OMTGIO', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (69, 76, 'TYZGRD', 'EQVWI', 269, 'PXKONS', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (70, 84, 'AKRUVY', 'HJESM', 554, 'DOGSZN', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (71, 13, 'WPTUVQ', 'NZUYB', 946, 'LUIYPS', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (72, 24, 'ILKQTU', 'KCBGC', 49, 'GEHMRR', 'B51冲锋枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (73, 93, 'ROTAGU', 'ZBLDV', 788, 'OEJEWQ', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (74, 99, 'VVCTOG', 'YFOPC', 729, 'ZNJSMD', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (75, 40, 'LCXQEQ', 'FQHXX', 176, 'DHTKNX', '95式冲锋枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (76, 51, 'ZOVXSB', 'YNOGS', 551, 'VGTGEM', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (77, 2, 'TAMEDI', 'WJNGX', 16, 'IHIACN', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (78, 6, 'KELJTM', 'OREJP', 323, 'MLZBQI', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (79, 42, 'ELYZZW', 'VOTQJ', 318, 'ELPVUF', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (80, 57, 'DIMYEV', 'ZFZRR', 691, 'MMANAG', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (81, 3, 'ACKWWV', 'QYLCS', 25, 'DKDGPA', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (82, 41, 'DZQNNB', 'FRWJL', 473, 'QYEBLZ', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (83, 94, 'LJHNAJ', 'JUXHN', 885, 'EMRUOC', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (84, 31, 'BSFHCP', 'JGTLD', 341, 'PPWNKM', 'B51冲锋枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (85, 35, 'LKVOCV', 'IAFAS', 235, 'FUQGAA', 'B51冲锋枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (86, 73, 'NHLMSJ', 'NDAHQ', 817, 'CFJQKW', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (87, 7, 'FMCHPM', 'OCKJP', 341, 'KUWYBU', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (88, 92, 'YPKMEC', 'KJJQC', 855, 'WTDHIA', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (89, 84, 'OWCZWO', 'VEPXX', 121, 'IGUIFI', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (90, 91, 'MQGOKY', 'DNXRK', 640, 'LVEUUN', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (91, 42, 'OBBANS', 'PLLBF', 673, 'QYOOGN', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (92, 2, 'QWNYLP', 'LBRXV', 657, 'JKGJLE', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (93, 22, 'RZMEVE', 'VGZXY', 835, 'URHLWE', 'B51冲锋枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (94, 50, 'CRLNGV', 'VIODV', 146, 'GOTRVU', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (95, 72, 'TXJOGV', 'IEGNO', 911, 'JAWSMM', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (96, 83, 'VSYAZM', 'OQPRP', 381, 'BJGSTY', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (97, 3, 'PUUJTR', 'PAOPT', 409, 'OJUUSG', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (98, 47, 'AEYLSG', 'QTHRH', 56, 'MMGWPN', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (99, 28, 'YOPGYF', 'ZLKCI', 827, 'GWSJTW', 'B51冲锋枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (100, 40, 'OQLZQM', 'AWPZC', 648, 'TJHMLF', '95式冲锋枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (10, 95, 'UFXPQH', 'OMWQJ', 32, 'IZFYLW', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (11, 5, 'PLIXCV', 'TDGFY', 946, 'QQTIGO', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (12, 56, 'FTYNVK', 'OJAPK', 511, 'JSQLBQ', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (13, 97, 'AVVFND', 'NKSHX', 524, 'KSKJWA', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (14, 1, 'RXSGGM', 'YWJAH', 613, 'UECUBJ', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (15, 28, 'IFDIBT', 'SZTKJ', 715, 'IITWFN', 'B51冲锋枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (16, 77, 'RONKDE', 'WJRPU', 972, 'SOAIBL', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (17, 60, 'SZQWRE', 'RUDVI', 940, 'UJOUKN', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (18, 8, 'MAQORS', 'IKSUT', 925, 'MWWKLW', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (19, 25, 'HOZMUD', 'BDOKF', 652, 'MISZHK', 'B51冲锋枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (20, 32, 'BPLYPG', 'ASSJQ', 607, 'WJKZXP', 'B51冲锋枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (21, 5, 'UDBYZW', 'BMTFX', 178, 'XZWUWN', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (22, 57, 'RFETRA', 'XUFOB', 379, 'NDJJHX', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (23, 63, 'YRVDEQ', 'SGKLK', 921, 'BFBISV', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (24, 5, 'VENYKA', 'WOGMV', 614, 'VLRRTI', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (25, 90, 'LECKVW', 'KPKCI', 160, 'ENVVBY', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (26, 54, 'JKRMIC', 'WDBRK', 104, 'NNVFWS', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (27, 59, 'DINIAT', 'UHRRU', 994, 'ABKUFN', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (28, 5, 'GMNGND', 'XXOBX', 130, 'YEOHOC', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (29, 19, 'ZDZWWD', 'DCEIB', 557, 'BSKYDG', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (30, 24, 'KXBQYG', 'VFBOD', 260, 'KYFKXJ', 'B51冲锋枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (31, 62, 'PLWEMY', 'GLVGF', 399, 'YEQTCG', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (32, 97, 'EYLHKM', 'CNLML', 324, 'AJZLSJ', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (33, 14, 'NMEMGE', 'GEWJQ', 900, 'JIIQAC', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (34, 53, 'JQYJOL', 'FFRCI', 320, 'DFHTFI', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (35, 20, 'PDUCAX', 'UVCJC', 900, 'ICQTSY', 'B51冲锋枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (36, 66, 'JEIMOI', 'BRJCS', 531, 'YUUENH', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (37, 44, 'TLYNCO', 'UTBAC', 868, 'RXOVTY', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (38, 20, 'LLCQIT', 'WDGLQ', 541, 'KFQMTY', 'B51冲锋枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (39, 95, 'CNPKYI', 'GRNHW', 981, 'GQQXTN', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (40, 32, 'BUNEID', 'GRPQP', 859, 'QIJJDT', 'B51冲锋枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (41, 72, 'UEQQVK', 'XCNHX', 523, 'SHHCHF', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (42, 76, 'HAOXDH', 'WRFDZ', 363, 'KBKDEM', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (43, 70, 'QRQBUJ', 'WYSDW', 92, 'QJSRVB', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (44, 2, 'HWYKHN', 'PSBRE', 978, 'YUXGOQ', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (45, 86, 'NPGDYI', 'PVRFM', 79, 'RADWZD', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (46, 27, 'ICLOVW', 'MBDQH', 228, 'FHCFZP', 'B51冲锋枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (47, 45, 'UBMZRJ', 'BUAYB', 56, 'GJAFSK', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (48, 9, 'HGPPVB', 'ZHRBH', 455, 'XXLDYS', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (49, 13, 'GPUYNH', 'MQMYP', 385, 'KMOFHV', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (50, 5, 'URSRMS', 'YKEZY', 471, 'GUMIQO', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (51, 74, 'FCTRJS', 'DPNSS', 963, 'FUQKQY', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (52, 53, 'EDNFYX', 'HLYAZ', 206, 'TIAMKM', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (53, 81, 'HFFKXQ', 'ZQICF', 314, 'RLDURC', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (54, 39, 'EPJRJJ', 'WTFJS', 590, 'YPVJLV', 'B51冲锋枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (55, 9, 'DOACPD', 'KDTXW', 724, 'FCTEEQ', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (56, 6, 'ZPHIOO', 'XYPTM', 547, 'HISFZI', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (57, 2, 'NLGFPZ', 'HDWTO', 639, 'VZSDQS', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (58, 45, 'ZRJQYL', 'CPCSN', 97, 'HPKWQY', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (59, 88, 'KFHDOT', 'OMQEA', 782, 'RXIYZZ', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (60, 53, 'VHHNJK', 'MDLHT', 863, 'DIYWAS', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (61, 25, 'VGDMWH', 'ZBMBG', 131, 'GEYLGV', 'B51冲锋枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (62, 66, 'LOVNKP', 'ZDWUK', 156, 'EECLKD', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (63, 30, 'IZLQPK', 'PFFDY', 995, 'KLVFRL', 'B51冲锋枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (64, 22, 'HIRRDF', 'REROJ', 468, 'GKSMGV', 'B51冲锋枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (65, 18, 'ASOOZN', 'HPPVP', 408, 'KTBVLO', 'AK47步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (66, 62, 'PIDTBL', 'QVKGG', 603, 'VYFZEV', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (67, 63, 'GHZVBO', 'LPEXU', 40, 'IUKPGM', 'C71狙击步枪');
insert into STORAGE (id, prod_id, ware_house, ware, count, remark, prod_name)
values (68, 34, 'JYFTXL', 'OBPPF', 396, 'ICLJRE', 'B51冲锋枪');
commit;
prompt 100 records loaded
prompt Loading USERS...
insert into USERS (id, uname, upwd, roleid, realname)
values (20, 'test4', 'test4', 4, 'test4');
insert into USERS (id, uname, upwd, roleid, realname)
values (21, '撒地方', '三大', 4, '发生的');
insert into USERS (id, uname, upwd, roleid, realname)
values (22, '的萨菲', '发生的', 4, '发生的');
insert into USERS (id, uname, upwd, roleid, realname)
values (1, 'admin', 'admin', 1, '刘备');
insert into USERS (id, uname, upwd, roleid, realname)
values (2, 'manage', 'manage', 2, '关羽');
insert into USERS (id, uname, upwd, roleid, realname)
values (3, 'console', 'console', 3, '张飞');
insert into USERS (id, uname, upwd, roleid, realname)
values (4, 'kongming', 'zhuge', 2, '孔明');
insert into USERS (id, uname, upwd, roleid, realname)
values (5, 'zhaoyun', 'zhaoyun', 3, '赵云');
insert into USERS (id, uname, upwd, roleid, realname)
values (6, 'pangtong', 'pangtong', 5, '庞统');
insert into USERS (id, uname, upwd, roleid, realname)
values (7, 'weiyan', 'weiyan', 5, '魏延');
insert into USERS (id, uname, upwd, roleid, realname)
values (8, 'diaochan', 'diaochan', 5, '貂蝉');
insert into USERS (id, uname, upwd, roleid, realname)
values (9, 'test1', 'test1', 5, '张三');
insert into USERS (id, uname, upwd, roleid, realname)
values (10, 'test2', 'test2', 5, '张四');
insert into USERS (id, uname, upwd, roleid, realname)
values (11, 'test3', 'test3', 5, '张五');
insert into USERS (id, uname, upwd, roleid, realname)
values (16, 'zhangliu', 'zhangliu', 5, '张六');
insert into USERS (id, uname, upwd, roleid, realname)
values (13, 'zhangbao', 'zhangbao', 5, '张苞');
insert into USERS (id, uname, upwd, roleid, realname)
values (40, 'kf001', 'kf001', 7, '刘丹');
insert into USERS (id, uname, upwd, roleid, realname)
values (18, 'zhangqi', 'zhangqi', 5, '张七');
insert into USERS (id, uname, upwd, roleid, realname)
values (19, 'zhangjiu', 'zhangjiu', 5, '张九');
insert into USERS (id, uname, upwd, roleid, realname)
values (41, 'kf002', 'kf002', 7, '张蕾');
insert into USERS (id, uname, upwd, roleid, realname)
values (42, 'kf003', 'kf003', 7, '王晨');
insert into USERS (id, uname, upwd, roleid, realname)
values (15, 'guanping', 'guangping', 5, '关平');
commit;
prompt 22 records loaded
set feedback on
set define on
prompt Done.
