drop table nf26p008.f_bdt_date;

create or replace type nf26p008.f_bdt_date_type as object (
    dat varchar(255),
    member function getDat return date,
    member function getMois return integer,
    member function getTrimestre return integer,
    member function getJourSemaine return varchar,
    member function getSemaine return integer
);
/
create table nf26p008.f_bdt_date of nf26p008.f_bdt_date_type;

create unique index f_bdt_date_dat_idx on nf26p008.f_bdt_date(dat);

alter table nf26p008.f_bdt_date add constraint f_bdt_date_pk_dat
    primary key(dat);
