create table nf26p008.d_bde_sectors (
    sector varchar(255),
    surface integer,
)
organization external (
    type oracle_loader
    default directory nf26p008Source
    access parameters (
        records delimited by newline
        skip 0
        characterset UTF8
        badfile nf26p008Tmp:'importSectors.bad'
        logfile nf26p008Tmp:'importSectors.log'
        fields terminated by ';'
        optionally enclosed by '"'
    )
    location ('ArrakisSectors_gov')
)
reject limit 1;

select * from nf26p008.d_bde_sectors where rownum <= 10;
select count(*) from nf26p008.d_bde_sectors;
