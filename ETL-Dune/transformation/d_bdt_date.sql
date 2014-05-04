create or replace type nf26p008.d_bdt_date_type as object (
    dat varchar(255),
    temperature varchar(255),
    member function getDate return date,
    member function getDow return varchar,
    member function getDoy return number,
    member function getWoy return number,
    member function getMoy return number,
    member function getYear return number,
    member function getTemperature (minimum in number, maximum in number) return varchar,
    member function toNumber (str in varchar) return number,
    member function hasDuplicates return boolean
);
/
create table nf26p008.d_bdt_date of nf26p008.d_bdt_date_type;
