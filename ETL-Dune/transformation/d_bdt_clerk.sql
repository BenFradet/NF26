create or replace type nf26p008.d_bdt_clerk_type as object (
    clerk_id number,
    name varchar(255),
    experience number,
    gender varchar(255),
    store varchar(255),
    store_dop varchar(255),
    store_yop varchar(255),
    store_city varchar(255),
    store_city_pop number,
    store_sector varchar(255),
    store_sector_surface number,
    member function getClerkId return number,
    member function getName return varchar,
    member function getExperience return number,
    member function getGender return char,
    member function getStore return varchar,
    member function getStoreDop return date,
    member function getStoreYop return number,
    member function getStoreCity return varchar,
    member function getStoreCityPop return number,
    member function getStoreSector return varchar,
    member function getStoreSectorSurface return number,
    member function isBestClerk return char,
    member function isBestStore return char
);
/
create table nf26p008.d_bdt_clerk of nf26p008.d_bdt_clerk_type;
