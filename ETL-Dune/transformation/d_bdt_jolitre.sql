create or replace type nf26p008.d_bdt_jolitre_type as object (
    id number,
    jolitre_id varchar(255),
    quality varchar(255),
    j_size varchar(255),
    city varchar(255),
    city_pop number,
    sector varchar(255),
    sector_surface number,
    member function getId return number,
    member function getJolitreId return varchar,
    --segmentations
    member function getQuality return varchar,
    --
    member function getSize return number,
    member function getCity return varchar,
    member function getCityPop return number,
    member function getSector return varchar,
    member function getSectorSurface return number,
    member function isBestSeller return char
);
/
create table nf26p008.d_bdt_jolitre of nf26p008.d_bdt_jolitre_type;

create unique index d_bdt_jolitre_idx_id on nf26p008.d_bdt_jolitre(id);
alter table nf26p008.d_bdt_jolitre add constraint d_bdt_jolitre_pk_id
    primary key (id);

create sequence d_bdt_jolitre_seq start with 1 increment by 1;

create or replace trigger d_bdt_jolitre_trigger
before insert on nf26p008.d_bdt_jolitre
referencing new as new
for each row
    begin
        select d_bdt_jolitre_seq.nextval
        into :new.id
        from dual;
    end;
/
