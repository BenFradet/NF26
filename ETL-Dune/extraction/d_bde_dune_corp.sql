create table nf26p008.d_bde_dune_corp (
    ticket_number varchar(255),
    dat varchar(255),
    clerk varchar(255),
    card_number varchar(255),
    jolitre varchar(255)
)
organization external (
    type oracle_loader
    default directory nf26p008Source
    access parameters (
        records delimited by newline
        skip 0
        characterset UTF8
        badfile nf26p008Tmp:'importDuneCorp.bad'
        logfile nf26p008Tmp:'importDuneCorp.log'
        fields terminated by ';'
        optionally enclosed by '"'
    )
    location ('DuneCorp')
)
reject limit 1;

select * from nf26p008.d_bde_dune_corp where rownum <= 10;
select count(*) from nf26p008.d_bde_dune_corp;
