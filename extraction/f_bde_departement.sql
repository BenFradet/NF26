drop table nf26pxxx.f_bde_departement;

create table nf26pxxx.f_bde_departement (
    dpt varchar(255),
    nom varchar(255),
    pop integer
)
organization external (
    type oracle_loader
    default directory nf26pxxxSource
    access parameters (
        records delimited by newline
        skip 0
        characterset UTF8
        badfile nf26pxxxTmp:'importDepartement.bad'
        logfile nf26pxxxTmp:'importDepartement.log'
        fields terminated by ';'
    )
    location ('departementsInsee2003.txt')
)
reject limit 1;

select * from nf26pxxx.f_bde_departement where rownum <= 10;

select count(*) from nf26pxxx.f_bde_departement;
