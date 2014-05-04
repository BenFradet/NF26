create or replace type nf26p008.d_bdt_clerk_type as object (
    clerk_id varchar(255),
    experience number,
    store varchar(255),
    store_city varchar(255),
    store_city_pop number,
    store_sector varchar(255),
    store_sector_surface number,
    member function getClerkId return number,
    member function getExperience (minimum in number, maximum in number)
        return varchar,
    member function getStore return varchar,
    member function getStoreCity return varchar,
    member function getStoreCityPop return number,
    member function getStoreSector return varchar,
    member function getStoreSectorSurface return number,
    member function isBestClerk return char,
    member function isBestStore return char,
    member function hasDuplicates return boolean
);
/
create table nf26p008.d_bdt_clerk of nf26p008.d_bdt_clerk_type;
