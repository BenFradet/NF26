create view nf26p008.d_bde_occupation as select * from nf26.occupation;

select * from nf26p008.d_bde_occupation where rownum <= 10;
select count(*) from nf26p008.d_bde_occupation;
