create view nf26p008.d_bde_occupation as select * from nf26.occupation;

prompt 
prompt premières lignes de d_bde_occupation
select * from nf26p008.d_bde_occupation where rownum <= 10;
prompt 
prompt count de d_bde_occupation
select count(*) from nf26p008.d_bde_occupation;
