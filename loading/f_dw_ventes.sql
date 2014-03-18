drop table nf26p008.f_dw_ventes;

create table nf26p008.f_dw_ventes (
    magasin char(4),
    dat date,
    produit char(13)
);

alter table nf26p008.f_dw_ventes add constraint f_dw_ventes_fk_magasin
    foreign key(magasin) references nf26p008.f_dw_magasin(num_mag);

alter table nf26p008.f_dw_ventes add constraint f_dw_ventes_fk_produit
    foreign key(produit) references nf26p008.f_dw_produit(isbn);

alter table nf26p008.f_dw_ventes add constraint f_dw_ventes_fk_dat
    foreign key(dat) references nf26p008.f_dw_date(dat);
