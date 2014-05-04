--ventes
alter table nf26p008.d_dw_ventes disable constraint d_dw_ventes_fk_date;
alter table nf26p008.d_dw_ventes disable constraint d_dw_ventes_fk_jolitre;
alter table nf26p008.d_dw_ventes disable constraint d_dw_ventes_fk_clerk;
alter table nf26p008.d_dw_ventes disable constraint d_dw_ventes_fk_card;

drop index d_dw_ventes_idx_dat;
drop index d_dw_ventes_idx_jolitre;
drop index d_dw_ventes_idx_clerk;
drop index d_dw_ventes_idx_card;

--card
alter table nf26p008.d_dw_card disable constraint d_dw_card_pk_card_id;
alter table nf26p008.d_dw_card disable constraint d_dw_card_cstr_fremen;
alter table nf26p008.d_dw_card disable constraint d_dw_card_cstr_high_spender;

drop index d_dw_card_idx_card_id;

--clerk
alter table nf26p008.d_dw_clerk disable constraint d_dw_clerk_pk_clerk_id;
alter table nf26p008.d_dw_clerk disable constraint d_dw_clerk_cstr_best_clerk;
alter table nf26p008.d_dw_clerk disable constraint d_dw_clerk_cstr_best_store;
alter table nf26p008.d_dw_clerk disable constraint d_dw_clerk_cstr_experience;

drop index d_dw_clerk_idx_clerk_id;

--date
alter table nf26p008.d_dw_date disable constraint d_dw_date_pk_dat;
alter table nf26p008.d_dw_date disable constraint d_dw_date_cstr_temp;

drop index d_dw_date_idx_dat;

--jolitre
alter table nf26p008.d_dw_jolitre disable constraint d_dw_jolitre_pk_jolitre_id;
alter table nf26p008.d_dw_jolitre disable constraint d_dw_jolitre_cstr_quality;
alter table nf26p008.d_dw_jolitre disable constraint
    d_dw_jolitre_cstr_best_seller;

drop index d_dw_jolitre_idx_jolitre_id;

--local variables
def minExperience = nf26p008.minExperience();
def maxExperience = nf26p008.maxExperience();

def minTemperature = nf26p008.minTemperature();
def maxTemperature = nf26p008.maxTemperature();

def minQuality = nf26p008.minQuality();
def maxQuality = nf26p008.maxQuality();

--inserts
insert into nf26p008.d_dw_ventes (
    ticket_id,
    dat,
    jolitre,
    clerk,
    card
)
select
    v.getTicket(),
    v.getDate(),
    v.getJolitre(),
    v.getClerk(),
    v.getCard()
from nf26p008.d_bdt_ventes v;
commit;

insert into nf26p008.d_dw_card (
    card_id,
    city,
    city_pop,
    sector,
    sector_surface,
    occupation,
    occupation_stat,
    house,
    house_stat,
    fremen,
    high_spender
)
select distinct
    ca.getCardId(),
    ca.getCity(),
    ca.getCityPop(),
    ca.getSector(),
    ca.getSectorSurface(),
    ca.getOccupation(),
    ca.getOccupationStat(),
    ca.getHouse(),
    ca.getHouseStat(),
    ca.isFremen(),
    ca.isHighSpender()
from nf26p008.d_bdt_card ca;
commit;

insert into nf26p008.d_dw_clerk (
    clerk_id,
    experience,
    store,
    store_city,
    store_city_pop,
    store_sector,
    store_sector_surface,
    best_clerk,
    best_store
)
select distinct
    cl.getClerkId(),
    cl.getExperience(minExperience, maxExperience),
    cl.getStore(),
    cl.getStoreCity(),
    cl.getStoreCityPop(),
    cl.getStoreSector(),
    cl.getStoreSectorSurface(),
    cl.isBestClerk(),
    cl.isBestStore()
from nf26p008.d_bdt_clerk cl;
commit;

insert into nf26p008.d_dw_date (
    dat,
    dow,
    doy,
    woy,
    moy,
    year,
    temperature
)
select distinct
    d.getDate(),
    d.getDow(),
    d.getDoy(),
    d.getWoy(),
    d.getMoy(),
    d.getYear(),
    d.getTemperature(minTemperature, maxTemperature)
from nf26p008.d_bdt_date d
where d.getDate() is not null;
commit;

insert into nf26p008.d_dw_jolitre (
    jolitre_id,
    quality,
    j_size,
    city,
    city_pop,
    sector,
    sector_surface,
    best_seller
)
select distinct
    j.getJolitreId(),
    j.getQuality(minQuality, maxQuality),
    j.getSize(),
    j.getCity(),
    j.getCityPop(),
    j.getSector(),
    j.getSectorSurface(),
    j.isBestSeller()
from nf26p008.d_bdt_jolitre j;
commit;

--agregated facts as attributes
update nf26p008.d_dw_card
set high_spender = 'Y'
where card_id in (
    select card from (
        select count(*) as co, card
        from nf26p008.d_dw_ventes
        group by card
        order by co desc
    )
    where rownum <= 11
);

update nf26p008.d_dw_jolitre
set best_seller = 'Y'
where jolitre_id in (
    select jolitre from (
        select count(*) as co, jolitre
        from nf26p008.d_dw_ventes
        group by jolitre
        order by co desc
    )
    where rownum <= 11
);

update nf26p008.d_dw_clerk
set best_clerk = 'Y'
where clerk_id in (
    select clerk from (
        select count(*) as co, clerk
        from nf26p008.d_dw_ventes
        group by clerk
        order by co desc
    )
    where rownum <= 11
);

update nf26p008.d_dw_clerk
set best_store = 'Y'
where store in (
    select store from (
        select count(*) as co, clerk.store
        from nf26p008.d_dw_ventes ventes
        left join nf26p008.d_dw_clerk clerk on clerk.clerk_id = ventes.clerk
        group by clerk.store
        order by co desc
    )
    where store is not null and store not like 'undefined' and rownum <= 10
);

--card
create unique index d_dw_card_idx_card_id on nf26p008.d_dw_card(card_id);

alter table nf26p008.d_dw_card enable constraint d_dw_card_pk_card_id
    exceptions into nf26p008.d_exceptions;
alter table nf26p008.d_dw_card enable constraint d_dw_card_cstr_fremen
    exceptions into nf26p008.d_exceptions;
alter table nf26p008.d_dw_card enable constraint d_dw_card_cstr_high_spender
    exceptions into nf26p008.d_exceptions;

--clerk
create unique index d_dw_clerk_idx_clerk_id on nf26p008.d_dw_clerk(clerk_id);

alter table nf26p008.d_dw_clerk enable constraint d_dw_clerk_pk_clerk_id
    exceptions into nf26p008.d_exceptions;
alter table nf26p008.d_dw_clerk enable constraint d_dw_clerk_cstr_best_clerk
    exceptions into nf26p008.d_exceptions;
alter table nf26p008.d_dw_clerk enable constraint d_dw_clerk_cstr_best_store
    exceptions into nf26p008.d_exceptions;
alter table nf26p008.d_dw_clerk enable constraint d_dw_clerk_cstr_experience
    exceptions into nf26p008.d_exceptions;

--date
create unique index d_dw_date_idx_dat on nf26p008.d_dw_date(dat);

alter table nf26p008.d_dw_date enable constraint d_dw_date_pk_dat
    exceptions into nf26p008.d_exceptions;
alter table nf26p008.d_dw_date enable constraint d_dw_date_cstr_temp
    exceptions into nf26p008.d_exceptions;

--jolitre
create unique index d_dw_jolitre_idx_jolitre_id 
    on nf26p008.d_dw_jolitre(jolitre_id);

alter table nf26p008.d_dw_jolitre enable constraint d_dw_jolitre_pk_jolitre_id
    exceptions into nf26p008.d_exceptions;
alter table nf26p008.d_dw_jolitre enable constraint d_dw_jolitre_cstr_quality
    exceptions into nf26p008.d_exceptions;
alter table nf26p008.d_dw_jolitre enable constraint
    d_dw_jolitre_cstr_best_seller exceptions into nf26p008.d_exceptions;

--ventes
create index d_dw_ventes_idx_dat on nf26p008.d_dw_ventes(dat);
create index d_dw_ventes_idx_jolitre on nf26p008.d_dw_ventes(jolitre);
create index d_dw_ventes_idx_clerk on nf26p008.d_dw_ventes(clerk);
create index d_dw_ventes_idx_card on nf26p008.d_dw_ventes(card);

alter table nf26p008.d_dw_ventes enable constraint d_dw_ventes_fk_date
    exceptions into nf26p008.d_exceptions;
alter table nf26p008.d_dw_ventes enable constraint d_dw_ventes_fk_jolitre
    exceptions into nf26p008.d_exceptions;
alter table nf26p008.d_dw_ventes enable constraint d_dw_ventes_fk_clerk
    exceptions into nf26p008.d_exceptions;
alter table nf26p008.d_dw_ventes enable constraint d_dw_ventes_fk_card
    exceptions into nf26p008.d_exceptions;

--test
select count(*) from nf26p008.d_exceptions;

select * from nf26p008.d_dw_ventes where rownum <= 10;
select count(*) from nf26p008.d_dw_ventes;

select * from nf26p008.d_dw_date where rownum <= 10;
select count(*) from nf26p008.d_dw_date;

select * from nf26p008.d_dw_jolitre where rownum <= 10;
select count(*) from nf26p008.d_dw_jolitre;

select * from  nf26p008.d_dw_clerk where rownum <= 10;
select count(*) from nf26p008.d_dw_clerk;

select * from nf26p008.d_dw_card where rownum <= 10;
select count(*) from nf26p008.d_dw_card;
