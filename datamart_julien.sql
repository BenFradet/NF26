create table nf26p062.data_mart (
ticket varchar(255),
magasin char(4),
dat date,
qte integer,
ind_auteur integer,
ind_editeur integer);

create index dm_ix_ticket on nf26p062.data_mart (ticket);

alter table nf26p062.data_mart add constraint f_dm_fk_magasin
    foreign key(magasin) references nf26p062.f_dw_magasin(num_mag);

alter table nf26p062.data_mart add constraint f_dm_fk_ticket
    foreign key(ticket) references nf26p062.f_dw_produit(ticket);

alter table nf26p062.data_mart add constraint f_dm_fk_dat
    foreign key(dat) references nf26p062.f_dw_date(dat);
    
    ------------------------
    
alter table nf26p062.data_mart disable constraint f_dm_fk_dat;
alter table nf26p062.data_mart disable constraint f_dm_fk_ticket;
alter table nf26p062.data_mart disable constraint f_dm_fk_magasin;

drop index dm_ix_ticket;

insert into nf26p062.data_mart (
ticket,
magasin,
dat,
qte,
ind_auteur,
ind_editeur)
select r1.ticket,
r1.magasin,
r1.dat,
r1.qte,
r2.ind_auteur,
r2.ind_editeur
from
(select ticket, magasin, dat, count(*) as qte
FROM f_dw_ventes
GROUP BY ticket, magasin, dat
) r1,
(SELECT ticket, p.auteur, count(*) as a
FROM f_dw_ventes v JOIN f_dw_produit p
ON v.produit=p.isbn
GROUP BY ticket, p.auteur
) r2
WHERE r1.ticket = r2.ticket
GROUP BY r1.ticket, r1.mag, r1.dat;








