create table nf26p008.d_bde_cities (
    city varchar(255),
    population integer,
    sector varchar(255)
)
organization external (
    type oracle_loader
    default directory nf26p008Source
    access parameters (
        records delimited by newline
        skip 0
        characterset UTF8
        badfile nf26p008Tmp:'importCities.bad'
        logfile nf26p008Tmp:'importCities.log'
        fields terminated by ';'
        optionally enclosed by '"'
    )
    location ('ArrakisCities_gov')
)
reject limit 1;

prompt premières lignes de d_bde_cities
select * from nf26p008.d_bde_cities where rownum <= 10;
prompt count de d_bde_cities
select count(*) from nf26p008.d_bde_cities;
