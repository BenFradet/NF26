create or replace type nf26p008.f_bdt_ventes_type as object (
    magasin varchar(4),
    produit varchar(13),
    dat varchar(10),
    ticket varchar(50),
    member function getMagasin return varchar,
    member function getProduit return char,
    member function getDat return date,
    member function getTicket return varchar
);
/
create table nf26p008.f_bdt_ventes of nf26p008.f_bdt_ventes_type;
