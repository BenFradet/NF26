create table nf26p008.f_bde_departement (
    dpt varchar(255),
    nom varchar(255),
    pop integer
)
organization external (
    type oracle_loader
    default directory nf26p008Source
    access parameters (
        records delimited by newline
        skip 0
        characterset UTF8
        badfile nf26p008Tmp:'importDepartement.bad'
        logfile nf26p008Tmp:'importDepartement.log'
        fields terminated by ';'
    )
    location ('departementsInsee2003.txt')
)
reject limit 1;

select * from nf26p008.f_bde_departement where rownum <= 10;

select count(*) from nf26p008.f_bde_departement;
