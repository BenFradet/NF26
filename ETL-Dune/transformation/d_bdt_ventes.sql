create or replace type nf26p008.d_bdt_ventes_type as object (
    ticket_id varchar(255),
    dat varchar(255),
    jolitre varchar(255),
    clerk number,
    card varchar(255),
    sale_price number
    member function getTicket return varchar,
    member function getDate return date,
    member function getJolitre return varchar,
    member function getClerk return number,
    member function getCard return char,
    member function getSalePrice return number
);
/
create table nf26p008.d_bdt_ventes of nf26p008.d_bdt_ventes_type;
