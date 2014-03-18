drop table nf26p008.f_dw_produit;
create table nf26p008.f_dw_produit (
    isbn varchar(13),
    titre varchar(255),
    langue char(3),
    genre varchar(20),
    auteur varchar(255),
    editeur varchar(50),
    parution char(4)
);

create unique index f_dw_produit_idx_isbn on nf26p008.f_dw_produit(isbn);

alter table nf26p008.f_dw_produit add constraint f_dw_produit_pk_isbn
    primary key(isbn);
