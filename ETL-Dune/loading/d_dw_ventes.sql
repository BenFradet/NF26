create table nf26p008.d_dw_ventes (
    ticket_id varchar(9),
    dat date,
    jolitre varchar(255),
    clerk number,
    card varchar(255)
);

alter table nf26p008.d_dw_ventes add constraint d_dw_ventes_fk_date
    foreign key(dat) references nf26p008.d_dw_date(dat);

alter table nf26p008.d_dw_ventes add constraint d_dw_ventes_fk_jolitre
    foreign key(jolitre) references nf26p008.d_dw_jolitre(jolitre_id);

alter table nf26p008.d_dw_ventes add constraint d_dw_ventes_fk_clerk
    foreign key(clerk) references nf26p008.d_dw_clerk(clerk_id);

alter table nf26p008.d_dw_ventes add constraint d_dw_ventes_fk_card
    foreign key(card) references nf26p008.d_dw_card(card_id);
