alter table nf26p008.f_dw_ventes disable constraint f_dw_ventes_fk_magasin;
alter table nf26p008.f_dw_ventes disable constraint f_dw_ventes_fk_produit;
alter table nf26p008.f_dw_ventes disable constraint f_dw_ventes_fk_dat;

alter table nf26p008.f_dw_date disable constraint f_dw_date_pk_dat;
alter table nf26p008.f_dw_magasin disable constraint f_dw_magasin_pk_num_mag;
alter table nf26p008.f_dw_produit disable constraint f_dw_produit_pk_isbn;

drop index f_dw_date_idx_dat;
drop index f_dw_magasin_idx_num_mag;
drop index f_dw_produit_idx_isbn;

insert into nf26p008.f_dw_ventes (
    magasin,
    dat,
    produit,
    ticket
)
select
    v.getMagasin(),
    v.getDat(),
    v.getProduit(),
    v.getTicket()
from nf26p008.f_bdt_ventes v
;
commit;

insert into nf26p008.f_dw_magasin (
    num_mag,
    rayon_bs,
    rayon_r,
    dpt,
    dpt_nom,
    dpt_pop,
    rayonnage
)
    select
        m.getNumMag(),
        m.getRayonBs(),
        m.getRayonRecent(),
        m.getDpt(),
        m.getDptNom(),
        m.getDptPop(),
        m.getRayonnage()
    from nf26p008.f_bdt_magasin m
;
commit;

insert into nf26p008.f_dw_produit (
    isbn,
    titre,
    langue,
    genre,
    auteur,
    editeur,
    parution
)
    select
        p.getIsbn(),
        p.getTitre(),
        p.getLangue(),
        p.getGenre(),
        p.getAuteur(),
        p.getEditeur(),
        p.getParution()
   from nf26p008.f_bdt_catalogue p
;
commit;

insert into nf26p008.f_dw_date (
    dat,
    jour_semaine,
    mois,
    semaine,
    trimestre
)
    select distinct
        d.getDat(),
        d.getJourSemaine(),
        d.getMois(),
        d.getSemaine(),
        d.getTrimestre()
    from nf26p008.f_bdt_date d
    where d.getDat() is not null
;
commit;

create unique index f_dw_produit_idx_isbn on nf26p008.f_dw_produit(isbn);
create unique index f_dw_magasin_idx_num_mag on nf26p008.f_dw_magasin(num_mag);
create unique index f_dw_date_idx_dat on nf26p008.f_dw_date(dat);

alter table nf26p008.f_dw_date enable constraint f_dw_date_pk_dat
    exceptions into nf26p008.exceptions;
alter table nf26p008.f_dw_magasin enable constraint f_dw_magasin_pk_num_mag
    exceptions into nf26p008.exceptions;
alter table nf26p008.f_dw_produit enable constraint f_dw_produit_pk_isbn
    exceptions into nf26p008.exceptions;

alter table nf26p008.f_dw_ventes enable constraint f_dw_ventes_fk_magasin
    exceptions into nf26p008.exceptions;
alter table nf26p008.f_dw_ventes enable constraint f_dw_ventes_fk_produit
    exceptions into nf26p008.exceptions;
alter table nf26p008.f_dw_ventes enable constraint f_dw_ventes_fk_dat
    exceptions into nf26p008.exceptions;

select count(*) from nf26p008.exceptions;

select * from nf26p008.f_dw_ventes where rownum <= 10;
select count(*) from nf26p008.f_dw_ventes;

select * from nf26p008.f_dw_date where rownum <= 10;
select count(*) from nf26p008.f_dw_date;

select * from nf26p008.f_dw_magasin where rownum <= 10;
select count(*) from nf26p008.f_dw_magasin;

select * from nf26p008.f_dw_produit where rownum <= 10;
select count(*) from nf26p008.f_dw_produit;
