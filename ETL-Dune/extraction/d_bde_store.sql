create table nf26p008.d_bde_store (
    store_id varchar(255),
    city varchar(255),
    sector varchar(255)
)
organization external (
    type oracle_loader
    default directory nf26p008Source
    access parameters (
        records delimited by newline
        skip 0
        characterset UTF8
        badfile nf26p008Tmp:'importStore.bad'
        logfile nf26p008Tmp:'importStore.log'
        fields terminated by ';'
        optionally enclosed by '"'
    )
    location ('Store.csv')
)
reject limit 1;

prompt premières lignes de d_bde_store
select * from nf26p008.d_bde_store where rownum <= 10;
prompt count de d_bde_store
select count(*) from nf26p008.d_bde_store;
