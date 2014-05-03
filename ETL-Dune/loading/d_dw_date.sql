create table nf26p008.d_dw_date (
    dat date,
    dow varchar(255),
    doy number,
    woy number,
    moy number,
    year number,
    temperature varchar(255)
);

create unique index d_dw_date_idx_dat on nf26p008.d_dw_date(dat);
alter table nf26p008.d_dw_date add constraint d_dw_date_pk_dat
    primary key (dat);

alter table nf26p008.d_dw_date add constraint d_dw_date_cstr_temp
    check (temperature in 
        ('undefined', 'cold', 'ratherCold', 'ratherHot', 'hot'));
