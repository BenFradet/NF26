create table nf26p008.d_dw_date (
    id number not null,
    dat date,
    dow varchar(255),
    doy number,
    woy number,
    moy number,
    year number,
    temperature varchar(255),
    information varchar(255)
);

create unique index d_dw_date_idx_id on nf26p008.d_dw_date(id);
alter table nf26p008.d_dw_date add constraint d_dw_date_pk_id
    primary key (id);
create unique index d_dw_date_idx_dat on nf26p008.d_dw_date(dat);
alter table nf26p008.d_dw_date add constraint d_dw_date_unique_dat
    unique (dat);

alter table nf26p008.d_dw_date add constraint d_dw_card_cstr_temp
    check (temperature in 
        ('undefined', 'cold', 'ratherCold', 'ratherHot', 'hot'));
alter table nf26p008.d_dw_date add constraint d_dw_card_cstr_dow
    check (dow in ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday',
            'Saturday', 'Sunday'));
alter table nf26p008.d_dw_date add constraint d_dw_card_cstr_doy
    check (doy >= 1 and doy <= 366);
alter table nf26p008.d_dw_date add constraint d_dw_card_cstr_woy
    check (woy >= 1 and woy <= 53);
alter table nf26p008.d_dw_date add constraint d_dw_card_cstr_moy
    check (moy >= 1 and moy <= 12);
