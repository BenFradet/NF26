create view nf26p008.f_bde_catalogue as select * from nf26.catalogue;

select * from nf26p008.f_bde_catalogue where rownum <= 10;

select count(*) from nf26p008.f_bde_catalogue;
