--question 1--
select d.jour_semaine, count(*) 
from f_dw_ventes v
join f_dw_date d on v.dat = d.dat
group by d.jour_semaine;

--question 2--
select avg(c)
from (
  select d.jour_semaine, count(*) as c
  from f_dw_ventes v
  join f_dw_date d on v.dat = d.dat
  group by d.jour_semaine
)
where jour_semaine <> 'samedi';

--question 3--
create or replace view nf26p008.f_ventes_par_jour_view as
select d.jour_semaine, count(*) as nb_ventes
from f_dw_ventes v
join f_dw_date d on v.dat = d.dat
group by d.jour_semaine;

create or replace view nf26p008.f_avg_ventes_hors_samedi_view as
select avg(c) as avg_nb_ventes_hors_samedi
from (
  select d.jour_semaine, count(*) as c
  from f_dw_ventes v
  join f_dw_date d on v.dat = d.dat
  group by d.jour_semaine
)
where jour_semaine <> 'samedi';

create or replace view nf26p008.f_ratio_samedi_view as
select ventes.jour_semaine, 
  (ventes.nb_ventes / moyenne.avg_nb_ventes_hors_samedi) as ratio
from nf26p008.f_ventes_par_jour_view ventes, 
  f_avg_ventes_hors_samedi_view moyenne
where ventes.jour_semaine = 'samedi';

--question 4--
create or replace view nf26p008.f_ventes_par_rayonnage as
select m.rayonnage, count(*) as nb_ventes
from nf26p008.f_dw_ventes v
join nf26p008.f_dw_magasin m on m.num_mag = v.magasin
group by m.rayonnage;

create or replace view nf26p008.f_magasins_par_rayonnage as 
select rayonnage, count(*) as nb_magasins
from nf26p008.f_dw_magasin
group by rayonnage;

create or replace view nf26p008.f_ventes_par_rayon_pond as
select r1 as ray, q1 as ventes, q2 as mag, round(q1/q2) as ventes_mag from
(select m.rayonnage AS r1, count(*) AS q1
from f_dw_ventes v, f_dw_magasin m
where v.magasin=m.num_mag
group by m.rayonnage),
(select m.rayonnage as r2, count(*) as q2
from f_dw_magasin m
group by m.rayonnage)
where r1=r2
order by ventes_mag desc;
