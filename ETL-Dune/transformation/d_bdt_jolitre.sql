create or replace type nf26p008.d_bdt_jolitre_type as object (
    jolitre_id varchar(255),
    quality varchar(255),
    j_size varchar(255),
    city varchar(255),
    city_pop number,
    sector varchar(255),
    sector_surface number,
    member function getJolitreId return varchar,
    --segmentations
    member function getQuality return varchar,
    --
    member function getSize return varchar,
    member function getCity return varchar,
    member function getCityPop return number,
    member function getSector return varchar,
    member function getSectorSurface return number,
    member function isBestSeller return char
);
/
create table nf26p008.d_bdt_jolitre of nf26p008.d_bdt_jolitre_type;