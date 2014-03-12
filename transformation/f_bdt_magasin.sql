drop view f_bdt_marketing_view;
create view f_bdt_marketing_view as select case when to_number(dpt) < 10 
    then
        '0' || to_number(dpt)
    else
        dpt
    end
    as dpt, magasin, rayonnage, rayonnage_ext, bestseller, recent
    from f_bde_marketing;

create or replace type f_bdt_magasin_type as object (
    num_mag varchar(4),
    rayon_bs char(1),
    rayon_r char(1),
    dpt char(2),
    dpt_nom varchar(50),
    population integer,
    rayonnage char(1),
    rayonnage_ext varchar(10),
    member function getNumMag return varchar,
    member function getRayonBs return char,
    member function getRayonRecent return char,
    member function getDpt return char,
    member function getDptNom return varchar,
    member function getPopulation return integer,
    member function getRayonnage return char,
    member function getRayonnageExt return varchar
)

drop table nf26pxxx.f_bdt_magasin
