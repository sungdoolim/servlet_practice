create table codedata(code_num number(37),code varchar(100),id varchar(30));
select * from codedata;

create sequence data_seq
start with 1
increment by 1
nocache;
