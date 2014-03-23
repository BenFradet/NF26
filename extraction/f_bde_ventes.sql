drop table nf26pxxx.f_bde_ventes;

create table nf26pxxx.f_bde_ventes (
    ticketNumber varchar(255),
    dateAchat varchar(255),
    isbn varchar(255),
    magasin varchar(255)
)
organization external (
    type oracle_loader
    default directory nf26pxxxSourceData
    access parameters (
        records delimited by newline
        skip 0
        characterset UTF8
        badfile nf26pxxxTmp:'importVentes.bad'
        logfile nf26pxxxTmp:'importVentes.log'
        fields terminated by ';'
        optionally enclosed by '"'
    )
    location ('Fantastic')
)
reject limit 1;

select * from nf26pxxx.f_bde_ventes where rownum <= 10;

select count(*) nf26pxxx.f_bde_ventes;
