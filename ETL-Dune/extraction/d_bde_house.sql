create view nf26p008.d_bde_house as select * from nf26.house;

select * from nf26p008.d_bde_house where rownum <= 10;
select count(*) from nf26p008.d_bde_house;
