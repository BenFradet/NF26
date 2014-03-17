drop table nf26p008.f_bdt_ventes;

create or replace type nf26p008.f_bdt_ventes_type as object (
    magasin varchar(4),
    produit varchar(13),
    dat varchar(10),
    ticket varchar(50),
    member function getMagasin return char,
    member function getProduit return char,
    member function getDat return date,
    member function getTicket return varchar
);

create table nf26p008.f_bdt_ventes of nf26p008.f_bdt_ventes_type;

alter table nf26p008.f_bdt_ventes add constraint f_bdt_ventes_fk_magasin
    foreign key(magasin) references nf26p008.f_bdt_magasin(num_mag);

alter table nf26p008.f_bdt_ventes add constraint f_bdt_ventes_fk_produit
    foreign key(produit) references nf26p008.f_bdt_catalogue(isbn);

alter table nf26p008.f_bdt_ventes add constraint f_bdt_ventes_fk_dat
    foreign key(dat) references nf26p008.f_bdt_date(dat);
