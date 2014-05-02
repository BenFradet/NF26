create table nf26p008.d_dw_ventes (
    ticket_id varchar(9),
    date_id number,
    dat date,
    jolitre_id number,
    jolitre varchar(255),
    clerk_id number,
    clerk number,
    card_id number,
    card varchar(255)
);

create index d_dw_ventes_idx_dat on nf26p008.d_dw_ventes(dat);
create index d_dw_ventes_idx_jolitre on nf26p008.d_dw_ventes(jolitre);
create index d_dw_ventes_idx_clerk on nf26p008.d_dw_ventes(clerk);
create index d_dw_ventes_idx_card on nf26p008.d_dw_ventes(card);

alter table nf26p008.d_dw_ventes add constraint d_dw_ventes_fk_date
    foreign key (date_id) references nf26p008.d_dw_date(id);
alter table nf26p008.d_dw_ventes add constraint d_dw_ventes_fk_jolitre
    foreign key (jolitre_id) references nf26p008.d_dw_jolitre(id);
alter table nf26p008.d_dw_ventes add constraint d_dw_ventes_fk_clerk
    foreign key (clerk_id) references nf26p008.d_dw_clerk(id);
alter table nf26p008.d_dw_ventes add constraint d_dw_ventes_fk_card
    foreign key (card_id) references nf26p008.d_dw_card(id);
