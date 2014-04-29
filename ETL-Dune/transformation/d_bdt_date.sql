create or replace type nf26p008.d_bdt_date_type as object (
    dat varchar(255),
    --seg
    temperature number,
    member function getDate return date,
    member function getDow return varchar,
    member function getDoy return number,
    member function getWoy return number,
    member function getMoy return varchar,
    member function getYear return number,
    member function getTemperature return number
);
/
create table nf26p008.d_bdt_date of nf26p008.d_bdt_date_type;
