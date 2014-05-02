create or replace type nf26p008.d_bdt_clerk_type as object (
    id number,
    clerk_id varchar(255),
    experience number,
    store varchar(255),
    store_city varchar(255),
    store_city_pop number,
    store_sector varchar(255),
    store_sector_surface number,
    member function getId return number,
    member function getClerkId return number,
    member function getExperience return varchar,
    member function maxExperience return number,
    member function minExperience return number,
    member function getStore return varchar,
    member function getStoreCity return varchar,
    member function getStoreCityPop return number,
    member function getStoreSector return varchar,
    member function getStoreSectorSurface return number,
    member function isBestClerk return char,
    member function isBestStore return char
);
/
create table nf26p008.d_bdt_clerk of nf26p008.d_bdt_clerk_type;

create unique index d_bdt_clerk_idx_id on nf26p008.d_bdt_clerk(id);
alter table nf26p008.d_bdt_clerk add constraint d_bdt_clerk_pk_id
    primary key (id);

create sequence d_bdt_clerk_seq start with 1 increment by 1;

create or replace trigger d_bdt_clerk_trigger
before insert on nf26p008.d_bdt_clerk
referencing new as new
for each row
    begin
        select d_bdt_clerk_seq.nextval
        into :new.id
        from dual;
    end;
/
