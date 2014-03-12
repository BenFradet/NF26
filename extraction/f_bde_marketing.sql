drop table nf26pxxx.f_bde_marketing;

create table nf26pxxx.f_bde_marketing (
    dpt varchar(255),
    magasin varchar(255),
    rayonnage char(255),
    rayonnage_ext varchar(255),
    bestseller char(1),
    recent char(1)
)
organization external (
    type oracle_loader
    default directory nf26pxxxSource
    access parameters (
        records delimited by newline
        skip 1
        characterset UTF8
        badfile nf26pxxxTmp:'importMarketing.bad'
        logfile nf26pxxxTmp:'importMarketing.log'
        fields terminated by ';'
    )
    location ('marketing.csv')
);

select * from nf26pxxx.f_bde_marketing where rownum <= 10;

select count(*), from nf26pxxx.f_bde_marketing;
