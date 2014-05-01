create table nf26p008.d_dw_card (
    card_id number,
    city varchar(255),
    city_pop number,
    sector varchar(255),
    sector_surface number,
    occupation varchar(255),
    occupation_stat number,
    house varchar(255),
    house_stat number,
    fremen char(1),
    high_spender char(1)
);

create unique index d_dw_card_idx_card_id on nf26p008.d_dw_card(card_id);
alter table nf26p008.d_dw_card add constraint d_dw_card_pk_card_id
    primary key(card_id);

alter table nf26p008.d_dw_card add constraint d_dw_card_cstr_fremen
    check (fremen in ('Y', 'N'));
alter table nf26p008.d_dw_card add constraint d_dw_card_cstr_high_spender
    check (high_spender in ('Y', 'N'));
alter table nf26p008.d_dw_card add constraint d_dw_card_cstr_occup_stat
    check (occupation_stat <= 100 and occupation_stat >= 0);
alter table nf26p008.d_dw_card add constraint d_dw_card_cstr_house_stat
    check (house_stat <= 100 and house_stat >= 0);
