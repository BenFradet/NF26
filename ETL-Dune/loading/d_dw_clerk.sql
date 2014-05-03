create table nf26p008.d_dw_clerk (
    clerk_id number,
    experience varchar(255),
    store varchar(255),
    store_city varchar(255),
    store_city_pop number,
    store_sector varchar(255),
    store_sector_surface number,
    best_clerk char(1),
    best_store char(1)
);

create unique index d_dw_clerk_idx_clerk_id on nf26p008.d_dw_clerk(clerk_id);
alter table nf26p008.d_dw_clerk add constraint d_dw_clerk_pk_clerk_id
    primary key (clerk_id);

alter table nf26p008.d_dw_clerk add constraint d_dw_clerk_cstr_best_clerk
    check (best_clerk in ('Y', 'N'));
alter table nf26p008.d_dw_clerk add constraint d_dw_clerk_cstr_best_store
    check (best_store in ('Y', 'N'));
alter table nf26p008.d_dw_clerk add constraint d_dw_clerk_cstr_experience
    check (experience in ('undefined', 'experienced', 'average', 'newcomer'));
