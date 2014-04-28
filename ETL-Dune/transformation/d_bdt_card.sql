create or replace type nf26p008.d_bdt_card_type as object (
    card_id varchar(255),
    first_name varchar(255),
    --dunno
    yob varchar(255),
    --
    city varchar(255),
    city_pop number,
    sector varchar(255),
    sector_surface number,
    gender varchar(255),
    occupation varchar(255),
    occupation_stat number,
    house varchar(255),
    house_stat number,
    --dunno
    fremen varchar(255),
    --
    member function getCardId return char,
    member function getFirstName return varchar,
    member function getYob return number,
    member function getCity return varchar,
    member function getCityPop return number,
    member function getSector return varchar,
    member function getSectorSurface return number,
    member function getGender return char,
    member function getOccupation return varchar,
    member function getOccupationStat return number,
    member function getHouse return varchar,
    member function getHouseStat return number,
    member function getFremen return char,
    member function isHighSpender return char
);
/
create table nf26p008.d_bdt_card of nf26p008.d_bdt_card_type;
