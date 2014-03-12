create or replace type nf26pxxx.f_bdt_date_type as object (
    dat varchar(255),
    member function getDate return date,
    member function getMois return integer,
    member function getTrimestre return integer,
    member function getJourSemaine return varchar(10),
    member function getSemaine return integer
);

drop table nf26pxxx.f_bdt_date;
create table nf26pxxx.f_bdt_date of nf26pxxx.f_bdt_date_type;

drop index f_bdt_date_dat_idx;
create unique index f_bdt_date_dat_idx on nf26pxxx.f_bdt_date(dat);

alter table nf26pxxx.f_bdt_date drop constraint f_bdt_date_pk_dat;
alter table nf26pxxx.f_bdt_date add constraint f_bdt_date_pk_dat
    primary key(dat);
