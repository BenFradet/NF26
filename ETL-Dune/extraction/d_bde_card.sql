create table nf26p008.d_bde_card (
    card_number varchar(255),
    address varchar(255),
    sector varchar(255),
    occupation varchar(255),
    house varchar(255)
)
organization external (
    type oracle_loader
    default directory nf26p008Source
    access parameters (
        records delimited by newline
        skip 0
        characterset UTF8
        badfile nf26p008Tmp:'importCard.bad'
        logfile nf26p008Tmp:'importCard.log'
        fields terminated by ';'
        optionally enclosed by '"'
    )
    location ('Card')
)
reject limit 1;

select * from nf26p008.d_bde_card where rownum <= 10;
select count(*) from nf26p008.d_bde_card;
