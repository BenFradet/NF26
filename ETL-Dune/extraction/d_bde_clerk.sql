create table nf26p008.d_bde_clerk (
    clerk_id varchar(255),
    experience varchar(255),
    store varchar(255)
)
organization external (
    type oracle_loader
    default directory nf26p008Source
    access parameters (
        records delimited by newline
        skip 0
        characterset UTF8
        badfile nf26p008Tmp:'importClerk.bad'
        logfile nf26p008Tmp:'importClerk.log'
        fields terminated by ';'
        optionally enclosed by '"'
    )
    location ('Clerk.csv')
)
reject limit 1;

prompt 
prompt premieres lignes dans d_bde_clerk
select * from nf26p008.d_bde_clerk where rownum <= 10;
prompt 
prompt count de d_bde_clerk
select count(*) from nf26p008.d_bde_clerk;
