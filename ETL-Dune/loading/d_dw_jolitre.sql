create table nf26p008.d_dw_jolitre (
    id number,
    jolitre_id varchar(255),
    quality varchar(255),
    j_size number,
    city varchar(255),
    city_pop number,
    sector varchar(255),
    sector_surface number,
    best_seller char(1),
    information varchar(255)
);

create unique index d_dw_jolitre_idx_id on nf26p008.d_dw_jolitre(id);
alter table nf26p008.d_dw_jolitre add constraint d_dw_jolitre_pk_id
    primary key (id);
create unique index d_dw_jolitre_idx_jolitre_id 
    on nf26p008.d_dw_jolitre(jolitre_id);
alter table nf26p008.d_dw_jolitre add constraint d_dw_jolitre_unique_jolitre_id
    unique (jolitre_id);

alter table nf26p008.d_dw_jolitre add constraint d_dw_jolitre_cstr_quality
    check (quality in ('good', 'medium', 'bad'));
alter table nf26p008.d_dw_jolitre add constraint d_dw_jolitre_cstr_best_seller
    check (best_seller in ('Y', 'N'));
