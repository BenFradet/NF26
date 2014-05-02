create or replace type nf26p008.d_bdt_clerk_type as object (
    clerk_id varchar(255),
    experience number,
    store varchar(255),
    store_city varchar(255),
    store_city_pop number,
    store_sector varchar(255),
    store_sector_surface number,
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
