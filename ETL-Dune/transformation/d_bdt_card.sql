create or replace type nf26p008.d_bdt_card_type as object (
    id number,
    card_id varchar(255),
    city varchar(255),
    city_pop number,
    sector varchar(255),
    sector_surface number,
    occupation varchar(255),
    occupation_stat number,
    house varchar(255),
    house_stat number,
    member function getId return number,
    member function getCardId return varchar,
    member function getCity return varchar,
    member function getCityPop return number,
    member function getSector return varchar,
    member function getSectorSurface return number,
    member function getOccupation return varchar,
    member function getOccupationStat return number,
    member function getHouse return varchar,
    member function getHouseStat return number,
    member function isFremen return char,
    member function isHighSpender return char
);
/
create table nf26p008.d_bdt_card of nf26p008.d_bdt_card_type;

create unique index d_bdt_card_idx_id on nf26p008.d_bdt_card(id);
alter table nf26p008.d_bdt_card add constraint d_bdt_card_pk_id
    primary key (id);

create sequence d_bdt_card_seq start with 1 increment by 1;

create or replace trigger d_bdt_card_trigger
before insert on nf26p008.d_bdt_card
referencing new as new
for each row
    begin
        select d_bdt_card_seq.nextval
        into :new.id
        from dual;
    end;
/
