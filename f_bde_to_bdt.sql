prompt
prompt enleve les indexes et constraints
alter table nf26p008.f_bdt_catalogue disable constraint f_bdt_catalogue_pk_isbn;
alter table nf26p008.f_bdt_magasin disable constraint f_bdt_magasin_pk_num_mag;

drop index f_bdt_catalogue_isbn_idx;
drop index f_bdt_magasin_num_mag_idx;

prompt
prompt rempli la table f_bdt_catalogue
insert into nf26p008.f_bdt_catalogue select * from nf26p008.f_bde_catalogue;
commit;

prompt
prompt rempli la table f_bdt_date
insert into nf26p008.f_bdt_date(dat)
   select dateAchat from nf26p008.f_bde_ventes;
commit;

prompt
prompt rempli la table f_bdt_magasin
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
on departement.dpt = market_view.dpt;
commit;

prompt
prompt rempli la table f_bdt_ventes
insert into nf26p008.f_bdt_ventes (
    magasin, 
    produit, 
    dat,
    ticket
)
select
    magasin,
    isbn,
    dateAchat,
    ticketnumber
from nf26p008.f_bde_ventes ventes;
commit;

prompt
prompt recree les indexes et les constraints
create unique index f_bdt_catalogue_idx_isbn on nf26p008.f_bdt_catalogue(isbn);
create unique index f_bdt_magasin_idx_num_mag 
    on nf26p008.f_bdt_magasin(num_mag);

alter table nf26p008.f_bdt_catalogue enable constraint f_bdt_catalogue_pk_isbn
    exceptions into nf26p008.exceptions;
alter table nf26p008.f_bdt_magasin enable constraint f_bdt_magasin_pk_num_mag
    exceptions into nf26p008.exceptions;

prompt
prompt count(*) de exceptions
select count(*) from nf26p008.exceptions;

prompt
prompt 10 premieres lignes de f_bdt_ventes;
select * from nf26p008.f_bdt_ventes where rownum <= 10;
prompt count(*) de f_bdt_ventes
select count(*) from nf26p008.f_bdt_ventes;

prompt
prompt 10 premieres lignes de f_bdt_date
select * from nf26p008.f_bdt_date where rownum <= 10;
prompt count(*) de f_bdt_date
select count(*) from nf26p008.f_bdt_date;

prompt
prompt 10 premieres lignes de f_bdt_catalogue
select * from nf26p008.f_bdt_catalogue where rownum <= 10;
prompt count(*) de f_bdt_catalogue
select count(*) from nf26p008.f_bdt_catalogue;
