alter table nf26pxxx.f_bdt_catalogue disable constraint f_bdt_catalogue_pk_isbn;
alter table nf26pxxx.f_bdt_date disable constraint f_bdt_date_pk_dat;
alter table nf26pxxx.f_bdt_magasin disable constraint f_bdt_magasin_pk_num_mag;
alter table nf26pxxx.f_bdt_ventes disable constraint f_bdt_ventes_fk_magasin;
alter table nf26pxxx.f_bdt_ventes disable constraint f_bdt_ventes_fk_dat;
alter table nf26pxxx.f_bdt_ventes disable constraint f_bdt_ventes_fk_produit;

drop index f_bdt_catalogue_idx_isbn;
drop index f_bdt_date_idx_dat;
drop index f_bdt_magasin_idx_num_mag;

insert into nf26pxxx.f_bdt_catalogue select * from nf26pxxx.f_bde_catalogue;

insert into nf26pxxx.f_bdt_date(dat) values (
   select dateAchat from nf26pxxx.f_bde_ventes
);

insert into nf26pxxx.f_bdt_magasin (
    num_mag,
    rayon_bs,
    rayon_r,
    dpt,
    dpt_nom,
    dpt_pop,
    rayonnage,
    rayonnage_ext
)
values (
    select
        magasin,
        bestseller,
        recent,
        dpt,
        nom,
        pop,
        rayonnage,
        rayonnage_ext
    from nf26pxxx.f_bdt_marketing_view market_view
    join nf26pxxx.f_bde_departement departement
    on departement.dpt = market_view.dpt
);

insert into nf26pxxx.f_bdt_ventes (
    magasin, 
    produit, 
    dat
)
values (
    select
        magasin,
        isbn,
        dateAchat
    from nf26pxxx.f_bde_ventes ventes
    join f_bde_marketing market
    on market.magasin = ventes.magasin
);

create unique index f_bdt_catalogue_idx_isbn on nf26pxxx.f_bdt_catalogue(isbn);
create unique index f_bdt_date_idx_dat on nf26pxxx.f_bdt_date(date);
create unique index f_bdt_magasin_idx_num_mag 
    on nf26pxxx.f_bdt_magasin(num_mag);

alter table nf26pxxx.f_bdt_catalogue enable constraint f_bdt_catalogue_pk_isbn;
alter table nf26pxxx.f_bdt_date enable constraint f_bdt_date_pk_dat;
alter table nf26pxxx.f_bdt_magasin enable constraint f_bdt_magasin_pk_num_mag;
alter table nf26pxxx.f_bdt_ventes enable constraint f_bdt_ventes_fk_dat;
alter table nf26pxxx.f_bdt_ventes enable constraint f_bdt_ventes_fk_produit;
alter table nf26pxxx.f_bdt_ventes enable constraint f_bdt_ventes_fk_magasin;

--test
