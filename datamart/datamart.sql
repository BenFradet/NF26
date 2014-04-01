create table nf26p008.f_dm_ticket_de_caisse (
  ticket varchar(255),
  nb_produits number,
  dat date,
  magasin char(4),
  indice_auteur number
);

alter table nf26p008.f_dm_ticket_de_caisse
add constraint f_dm_tdc_fk_dat
foreign key(dat) references nf26p008.f_dw_date(dat);

alter table nf26p008.f_dm_ticket_de_caisse
add constraint f_dm_tdc_fk_magasin
foreign key(magasin) references nf26p008.f_dw_magasin(num_mag);

insert into nf26p008.f_dm_ticket_de_caisse (
  ticket,
  nb_produits,
  dat,
  magasin
)
select
  v.ticket,
  count(*) as nb_ventes,
  v.dat,
  v.magasin
  from f_dw_ventes v
  group by v.ticket, v.dat, v.magasin
;

select m.rayonnage, avg(nb_produits)
from nf26p008.f_dm_ticket_de_caisse dm 
join nf26p008.f_dw_magasin m
on m.num_mag = dm.magasin
group by m.rayonnage;

select m.rayon_bs, avg(nb_produits)
from nf26p008.f_dm_ticket_de_caisse dm
join nf26p008.f_dw_magasin m
on m.num_mag = dm.magasin
group by m.rayon_bs;

select d.jour_semaine, avg(nb_produits)
from nf26p008.f_dm_ticket_de_caisse dm
join nf26p008.f_dw_date d
on dm.dat = d.dat
group by d.jour_semaine;

select d.semaine, avg(nb_produits)
from nf26p008.f_dm_ticket_de_caisse dm
join nf26p008.f_dw_date d
on dm.dat = d.dat
group by d.semaine
order by d.semaine;

alter table nf26p008.f_dm_ticket_de_caisse
  add indice_auteur number;
delete from nf26p008.f_dm_ticket_de_caisse;
insert into nf26p008.f_dm_ticket_de_caisse (
  ticket,
  nb_produits,
  dat,
  magasin,
  indice_auteur
)
select
  v.ticket,
  count(*),
  v.dat,
  v.magasin,
  1 - count(distinct p.auteur) / count(*)
  from nf26p008.f_dw_ventes v, nf26p008.f_dw_produit p
  where v.produit = p.isbn
  group by v.ticket, v.dat, v.magasin
;

select 
  d.jour_semaine, 
  round(avg(dm.indice_auteur), 3),
  round(avg(dm.nb_produits), 3)
from nf26p008.f_dm_ticket_de_caisse dm
join nf26p008.f_dw_date d
on d.dat = dm.dat
group by d.jour_semaine;

select 
  d.semaine, 
  round(avg(dm.indice_auteur), 3), 
  round(avg(dm.nb_produits), 3)
from nf26p008.f_dm_ticket_de_caisse dm
join nf26p008.f_dw_date d
on d.dat = dm.dat
group by d.semaine
order by d.semaine;

select 
  m.rayonnage, 
  round(avg(dm.indice_auteur), 3), 
  round(avg(dm.nb_produits), 3)
from nf26p008.f_dm_ticket_de_caisse dm
join nf26p008.f_dw_magasin m
on m.num_mag = dm.magasin
group by m.rayonnage;

select
  m.rayon_bs,
  round(avg(dm.indice_auteur), 3),
  round(avg(dm.nb_produits), 3)
from nf26p008.f_dm_ticket_de_caisse dm
join nf26p008.f_dw_magasin m
on m.num_mag = dm.magasin
group by m.rayon_bs;

select 
  m.rayon_r,
  round(avg(dm.indice_auteur), 3),
  round(avg(dm.nb_produits), 3)
from nf26p008.f_dm_ticket_de_caisse dm
join nf26p008.f_dw_magasin m
on m.num_mag = dm.magasin
group by m.rayon_r;

alter table nf26p008.f_dm_ticket_de_caisse
add indice_best_seller number;
delete from nf26p008.f_dm_ticket_de_caisse;
insert into nf26p008.f_dm_ticket_de_caisse (
  ticket,
  nb_produits,
  dat,
  magasin,
  indice_auteur,
  indice_best_seller
)
select
  v.ticket,
  count(*),
  v.dat,
  v.magasin,
  1 - count(distinct p.auteur) / count(*),
  sum(b.bs)
  from 
    nf26p008.f_dw_ventes v, 
    nf26p008.f_dw_produit p, 
    nf26p008.f_dw_best_seller b
  where v.produit = p.isbn and p.isbn = b.isbn
  group by v.ticket, v.dat, v.magasin
;

select 
  m.rayonnage, 
  round(avg(dm.indice_best_seller), 3), 
  round(avg(dm.nb_produits), 3)
from nf26p008.f_dm_ticket_de_caisse dm
join nf26p008.f_dw_magasin m
on m.num_mag = dm.magasin
group by m.rayonnage;

select
  m.rayon_bs,
  round(avg(dm.indice_best_seller), 3),
  round(avg(dm.nb_produits), 3)
from nf26p008.f_dm_ticket_de_caisse dm
join nf26p008.f_dw_magasin m
on m.num_mag = dm.magasin
group by m.rayon_bs;

select 
  m.rayon_r,
  round(avg(dm.indice_best_seller), 3),
  round(avg(dm.nb_produits), 3)
from nf26p008.f_dm_ticket_de_caisse dm
join nf26p008.f_dw_magasin m
on m.num_mag = dm.magasin
group by m.rayon_r;

select 
  d.jour_semaine, 
  round(avg(dm.indice_best_seller), 3),
  round(avg(dm.nb_produits), 3)
from nf26p008.f_dm_ticket_de_caisse dm
join nf26p008.f_dw_date d
on d.dat = dm.dat
group by d.jour_semaine;

select 
  d.semaine, 
  round(avg(dm.indice_best_seller), 3) as bs, 
  round(avg(dm.nb_produits), 3)
from nf26p008.f_dm_ticket_de_caisse dm
join nf26p008.f_dw_date d
on d.dat = dm.dat
group by d.semaine
order by bs desc;
