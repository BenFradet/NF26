alter table nf26p008.f_bdt_ventes disable constraint f_bdt_ventes_fk_magasin;
alter table nf26p008.f_bdt_ventes disable constraint f_bdt_ventes_fk_dat;
alter table nf26p008.f_bdt_ventes disable constraint f_bdt_ventes_fk_produit;
alter table nf26p008.f_bdt_catalogue disable constraint f_bdt_catalogue_pk_isbn;
alter table nf26p008.f_bdt_date disable constraint f_bdt_date_pk_dat;
alter table nf26p008.f_bdt_magasin disable constraint f_bdt_magasin_pk_num_mag;

drop index f_bdt_catalogue_isbn_idx;
drop index f_bdt_date_dat_idx;
drop index f_bdt_magasin_num_mag_idx;

insert into nf26p008.f_bdt_catalogue select * from nf26p008.f_bde_catalogue;

insert into nf26p008.f_bdt_date(dat)
   select distinct dateAchat from nf26p008.f_bde_ventes;

insert into nf26p008.f_bdt_magasin (
    num_mag,
    rayon_bs,
    rayon_r,
    dpt,
    dpt_nom,
    dpt_pop,
    rayonnage,
    rayonnage_ext
)
select
    market_view.magasin,
    market_view.bestseller,
    market_view.recent,
    departement.dpt,
    departement.nom,
    departement.pop,
    market_view.rayonnage,
    market_view.rayonnage_ext
from nf26p008.f_bdt_marketing_view market_view
join nf26p008.f_bde_departement departement
on departement.dpt = market_view.dpt
;

insert into nf26p008.f_bdt_ventes (
    magasin, 
    produit, 
    dat,
    ticket
)
select
    market.magasin,
    ventes.isbn,
    ventes.dateAchat,
    ventes.ticketnumber
from nf26p008.f_bde_ventes ventes
join f_bde_marketing market
on market.magasin = ventes.magasin
;
--peut etre sans join

create unique index f_bdt_catalogue_idx_isbn on nf26p008.f_bdt_catalogue(isbn);
create unique index f_bdt_date_idx_dat on nf26p008.f_bdt_date(dat);
create unique index f_bdt_magasin_idx_num_mag 
    on nf26p008.f_bdt_magasin(num_mag);

alter table nf26p008.f_bdt_catalogue enable constraint f_bdt_catalogue_pk_isbn;
alter table nf26p008.f_bdt_date enable constraint f_bdt_date_pk_dat;
alter table nf26p008.f_bdt_magasin enable constraint f_bdt_magasin_pk_num_mag;
alter table nf26p008.f_bdt_ventes enable constraint f_bdt_ventes_fk_dat;
alter table nf26p008.f_bdt_ventes enable constraint f_bdt_ventes_fk_produit;
alter table nf26p008.f_bdt_ventes enable constraint f_bdt_ventes_fk_magasin;
--problemes avec les deux dernières ce qui est dans ventes
--n'est pas dans les autres tables

select * from nf26p008.f_bdt_ventes where rownum <= 10;
select count(*) from nf26p008.f_bdt_ventes;

select * from nf26p008.f_bdt_date where rownum <= 10;
select count(*) from nf26p008.f_bdt_date;

select * from nf26p008.f_bdt_catalogue where rownum <= 10;
select count(*) form nf26p008.f_bdt_catalogue;
