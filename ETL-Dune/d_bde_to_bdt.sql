insert into nf26p008.d_bdt_card (
    card_id,
    city,
    city_pop,
    sector,
    sector_surface,
    occupation,
    occupation_stat,
    house,
    house_stat
)
select
    card.card_number,
    card.address,
    city.population,
    card.sector,
    sector.surface,
    card.occupation,
    occup.stats,
    card.house,
    house.stats
from nf26p008.d_bde_card card
join nf26p008.d_bde_cities city on card.address = city.city
join nf26p008.d_bde_sectors sector on card.sector = sector.sector
join nf26p008.d_bde_house house on card.house = house.house
join nf26p008.d_bde_occupation occup on card.occupation = occup.occupation;
commit;

insert into nf26p008.d_bdt_clerk (
    clerk_id,
    experience,
    store,
    store_city,
    store_city_pop,
    store_sector,
    store_sector_surface
)
select
    clerk.clerk_id,
    clerk.experience,
    clerk.store,
    store.city,
    city.population,
    store.sector,
    sector.surface
from nf26p008.d_bde_clerk clerk
join nf26p008.d_bde_store store on clerk.store = store.store_id
join nf26p008.d_bde_cities city on store.city = city.city
join nf26p008.d_bde_sectors sector on store.sector = sector.sector;
commit;

insert into nf26p008.d_bdt_date (
    dat,
    temperature
)
select
    v.dat,
    t.temperature
from nf26p008.d_bde_dune_corp v
join nf26p008.d_bde_temperature t
on t.dat = v.dat;
commit;

insert into nf26p008.d_bdt_jolitre (
    jolitre_id,
    quality,
    j_size,
    city,
    city_pop,
    sector,
    sector_surface
)
select
    jolitre.jolitre_ref,
    jolitre.quality,
    jolitre.taille,
    jolitre.city_prod,
    city.population,
    jolitre.sector,
    sector.surface
from nf26p008.d_bde_jolitres jolitre
join nf26p008.d_bde_cities city on jolitre.city_prod = city .city
join nf26p008.d_bde_sectors sector on jolitre.sector = sector.sector;
commit;

insert into nf26p008.d_bdt_ventes (
    ticket_id,
    dat,
    jolitre,
    clerk,
    card
)
select
    dune.ticket_number,
    dune.dat,
    dune.jolitre,
    dune.clerk,
    dune.card_number
from nf26p008.d_bde_dune_corp dune;
commit;

--exceptions if constraints

select * from nf26p008.d_bdt_card where rownum <= 10;
select count(*) from nf26p008.d_bdt_card;

select * from nf26p008.d_bdt_clerk where rownum <= 10;
select count(*) from nf26p008.d_bdt_clerk;

select * from nf26p008.d_bdt_date where rownum <= 10;
select count(*) from nf26p008.d_bdt_date;

select * from nf26p008.d_bdt_jolitre where rownum <= 10;
select count(*) from nf26p008.d_bdt_jolitre;

select * from nf26p008.d_bdt_ventes where rownum <= 10;
select count(*) from nf26p008.d_bdt_ventes;
