create table nf26p008.f_bde_marketing (
    dpt varchar(255),
    magasin varchar(255),
    rayonnage char(255),
    rayonnage_ext varchar(255),
    bestseller char(1),
    recent char(1)
)
organization external (
    type oracle_loader
    default directory nf26p008Source
    access parameters (
        records delimited by newline
        skip 1
        characterset UTF8
        badfile nf26p008Tmp:'importMarketing.bad'
        logfile nf26p008Tmp:'importMarketing.log'
        fields terminated by ';'
    )
    location ('marketing.csv')
)
reject limit 1;

select * from nf26p008.f_bde_marketing where rownum <= 10;

select count(*) from nf26p008.f_bde_marketing;
