drop table nf26pxxx.f_dw_magasin;
create table nf26pxxx.f_dw_magasin (
    num_mag char(4),
    rayon_bs char(1),
    rayon_r char(1),
    dpt char(2),
    dpt_nom varchar(50),
    dpt_pop number(2),
    rayonnage char(1)
);

drop index f_dw_magasin_idx_num_mag;
create unique index f_dw_magasin_idx_num_mag on nf26pxxx.f_dw_magasin(num_mag);

alter table nf26pxxx.f_dw_magasin drop constraint f_dw_magasin_pk_num_mag;
alter table nf26pxxx.f_dw_magasin add constraint f_dw_magasin_pk_num_mag
    primary key(num_mag);
