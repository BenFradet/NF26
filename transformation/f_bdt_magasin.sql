create or replace type nf26pxxx.f_bdt_magasin_type as object (
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
);

drop table nf26pxxx.f_bdt_magasin;
create table nf26pxxx.f_bdt_magasin of nf26pxxx.f_bdt_magasin_type;

drop index f_bdt_magasin_num_mag_idx;
create unique index f_bdt_magasin_num_mag_idx 
    on nf26pxxx.f_bdt_magasin(num_mag);

alter table nf26pxxx.f_bdt_magasin drop constraint f_bdt_magasin_pk_num_mag;
alter table nf26pxxx.f_bdt_magasin add constraint f_bdt_magasin_pk_num_mag
    primary key(num_mag);
