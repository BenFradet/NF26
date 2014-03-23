drop table nf26p008.f_bdt_date;

create or replace type nf26p008.f_bdt_date_type as object (
    dat varchar(255),
    member function getDat return date,
    member function getMois return number,
    member function getTrimestre return number,
    member function getJourSemaine return varchar,
    member function getSemaine return number
);
/
create table nf26p008.f_bdt_date of nf26p008.f_bdt_date_type;
