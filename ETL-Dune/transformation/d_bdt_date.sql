create or replace type nf26p008.d_bdt_date_type as object (
    id number,
    dat varchar(255),
    temperature varchar(255),
    member function getId return number,
    member function getDate return date,
    member function getDow return varchar,
    member function getDoy return number,
    member function getWoy return number,
    member function getMoy return number,
    member function getYear return number,
    member function getTemperature return varchar,
    member function maxTemperature return number,
    member function minTemperature return number,
    member function toNumber (str in varchar) return number
);
/
create table nf26p008.d_bdt_date of nf26p008.d_bdt_date_type;

create unique index d_bdt_date_idx_id on nf26p008.d_bdt_date(id);
alter table nf26p008.d_bdt_date add constraint d_bdt_date_pk_id
    primary key (id);

create sequence d_bdt_date_seq start with 1 increment by 1;

create or replace trigger d_bdt_date_trigger
before insert on nf26p008.d_bdt_date
referencing new as new
for each row
    begin
        select d_bdt_date_seq.nextval
        into :new.id
        from dual;
    end;
/
