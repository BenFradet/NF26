drop table nf26pxxx.f_dw_date;
create table nf26pxxx.f_dw_date (
    dat dat,
    jour_semaine varchar(10),
    mois number(2),
    semaine number(2),
    trimestre number(1)
);

drop index f_dw_date_idx_dat;
create unique index f_dw_date_idx_dat on nf26pxxx.f_dw_date(dat);

alter table nf26pxxx.f_dw_date drop constraint f_dw_date_pk_dat;
alter table nf26pxxx.f_dw_date add constraint f_dw_date_pk_dat
    primary key(dat);
