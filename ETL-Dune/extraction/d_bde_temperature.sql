create table nf26p008.d_bde_temperature (
    dat varchar(255),
    temperature varchar(255)
)
organization external (
    type oracle_loader
    default directory nf26p008Source
    access parameters (
        records delimited by newline
        skip 0
        characterset UTF8
        badfile nf26p008Tmp:'importTemperature.bad'
        logfile nf26p008Tmp:'importTemperature.log'
        fields terminated by ';'
        optionally enclosed by '"'
    )
    location ('Temperature.txt')
)
reject limit 1;

select * from nf26p008.d_bde_temperature where rownum <= 10;
select count(*) from nf26p008.d_bde_temperature;
