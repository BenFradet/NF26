create table nf26p008.f_bde_ventes (
    ticketNumber varchar(255),
    dateAchat varchar(255),
    isbn varchar(255),
    magasin varchar(255)
)
organization external (
    type oracle_loader
    default directory nf26p008SourceData
    access parameters (
        records delimited by newline
        skip 0
        characterset UTF8
        badfile nf26p008Tmp:'importVentes.bad'
        logfile nf26p008Tmp:'importVentes.log'
        fields terminated by ';'
        optionally enclosed by '"'
    )
    location ('Fantastic')
)
reject limit 1;

select * from nf26p008.f_bde_ventes where rownum <= 10;

select count(*) from nf26p008.f_bde_ventes;
