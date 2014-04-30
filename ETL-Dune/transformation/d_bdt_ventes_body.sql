create or replace type body nf26p008.d_bdt_ventes_type
is
    member function getTicket return varchar
    is
    begin
        return ticket_id;
    end;

    member function getDate return date
    is
    begin
        if regexp_like(dat, '[0-9]{4}-[0-9]{2}-[0-9]{2}') then
            return to_date(dat, 'yyyy-mm-dd');
        else
            return null;
        end if;
    end;

    member function getJolitre return varchar
    is
    begin
        return jolitre;
    end;

    member function getClerk return number
    is
    begin
        return clerk;
    end;

    member function getCard return char
    is
    begin
        return card;
    end;
end;
