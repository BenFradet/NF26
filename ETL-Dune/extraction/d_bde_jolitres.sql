create table nf26p008.d_bde_jolitres (
    jolitre_ref varchar(255),
    quality varchar(255),
    taille varchar(255),
    city_prod varchar(255),
    sector varchar(255)
)
organization external (
    type oracle_loader
    default directory nf26p008Source
    access parameters (
        records delimited by newline
        skip 0
        characterset UTF8
        badfile nf26p008Tmp:'importJolitres.bad'
        logfile nf26p008Tmp:'importJolitres.log'
        fields terminated by ';'
        optionally enclosed by '"'
    )
    location ('Jolitres')
)
reject limit 1;

prompt premières lignes de d_bde_jolitres
select * from nf26p008.d_bde_jolitres where rownum <= 10;
prompt count de d_bde_jolitres
select count(*) from nf26p008.d_bde_jolitres;
