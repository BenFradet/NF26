drop view nf26pxxx.f_bde_catalogue;

create view nf26pxxx.f_bde_catalogue as select * from nf26.catalogue;

select * from nf26pxxx.f_bde_catalogue where rownum <= 10;

select count(*) from nf26pxxx.f_bde_catalogue;
