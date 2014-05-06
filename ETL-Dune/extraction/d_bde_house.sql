create view nf26p008.d_bde_house as select * from nf26.house;

prompt premières lignes de d_bde_house
select * from nf26p008.d_bde_house where rownum <= 10;
prompt count de d_bde_house
select count(*) from nf26p008.d_bde_house;
