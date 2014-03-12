create or replace type nf26pxxx.f_bdt_ventes_type as object (
    magasin char(4),
    produit char(13),
    dat char(10),
    member function getMagasin return char(4),
    member function getProduit return char(13),
    member function getDat return date
);

drop table nf26pxxx.f_bdt_ventes;
create table nf26pxxx.f_bdt_ventes of nf26pxxx.f_bdt_ventes_type;

alter table nf26pxxx.f_bdt_ventes drop constraint f_bdt_ventes_fk_magasin;
alter table nf26pxxx.f_bdt_ventes add constraint f_bdt_ventes_fk_magasin
    foreign key(magasin) references nf26pxxx.f_bdt_magasin(num_mag);

alter table nf26pxxx.f_bdt_ventes drop constraint f_bdt_ventes_fk_produit;
alter table nf26pxxx.f_bdt_ventes add constraint f_bdt_ventes_fk_produit
    foreign key(produit) references nf26pxxx.f_bdt_catalogue(isbn);

alter table nf26pxxx.f_bdt_ventes drop constraint f_bdt_ventes_fk_dat;
alter table nf26pxxx.f_bdt_ventes add constraint f_bdt_ventes_fk_dat
    foreing key(dat) references nf26pxxx.f_bdt_date(dat);
