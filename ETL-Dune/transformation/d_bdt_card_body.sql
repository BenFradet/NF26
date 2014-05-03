create or replace type body nf26p008.d_bdt_card_type
is
    member function getCardId return varchar
    is
    begin
        return card_id;
    end;

    member function getCity return varchar
    is
        nb number;
    begin
        select count(distinct city)
        into nb
        from nf26p008.d_bdt_card
        where card_id = self.card_id;
        if nb > 1 then
            return 'undefined';
        else
            return city;
        end if;
    end;

    member function getCityPop return number
    is
    begin
        if self.getCity like 'undefined' then
            return null;
        else
            return city_pop;
        end if;
    end;

    member function getSector return varchar
    is
        nb number;
    begin
        select count(distinct sector)
        into nb
        from nf26p008.d_bdt_card
        where card_id = self.card_id;
        if nb > 1 then
            return 'undefined';
        else
            return sector;
        end if;
    end;

    member function getSectorSurface return number
    is
    begin
        if self.getSector() like 'undefined' then
            return null;
        else
            return sector_surface;
        end if;
    end;

    member function getOccupation return varchar
    is
        nb number;
    begin
        select count(distinct occupation)
        into nb
        from nf26p008.d_bdt_card
        where card_id = self.card_id;
        if nb > 1 then
            return 'undefined';
        else
            return occupation;
        end if;
    end;

    member function getOccupationStat return number
    is
    begin
        if self.getOccupation() like 'undefined' then
            return null;
        else
            return occupation_stat;
        end if;
    end;

    member function getHouse return varchar
    is
        nb number;
    begin
        select count(distinct house)
        into nb
        from nf26p008.d_bdt_card
        where card_id = self.card_id;
        if nb > 1 then
            return 'undefined';
        else
            return house;
        end if;
    end;

    member function getHouseStat return number
    is
    begin
        if self.getHouse() like 'undefined' then
            return null;
        else
            return house_stat;
        end if;
    end;

    member function isFremen return char
    is
    begin
        if self.getHouse() like 'fremen' then
            return 'Y';
        else
            return 'N';
        end if;
    end;

    member function isHighSpender return char
    is
    begin
        return 'N';
    end;
    --member function isHighSpender return char
    --is
    --    tmpCardId varchar(255);
    --    tmpChar char(1);
    --begin
    --    if self.hasDuplicates() then
    --        return 'N';
    --    elsif self.card_id is null or length(self.card_id) = 0 then
    --        return 'N';
    --    else
    --        tmpChar := 'N';
    --        for r in (
    --                select card from (
    --                    select count(*) as co, card
    --                    from nf26p008.d_bdt_ventes
    --                    group by card
    --                    order by co desc
    --                )
    --                where rownum <= 11) loop
    --            if r.card like self.card_id then
    --                tmpChar := 'Y';
    --                exit;
    --            end if;
    --        end loop;
    --        return tmpChar;
    --    end if;
    --end;


    member function hasDuplicates return boolean
    is
        nb number;
    begin
        select count(*)
        into nb
        from nf26p008.d_bdt_card
        where card_id = self.card_id;
        if nb > 1 then
            return true;
        else
            return false;
        end if;
    end;
end;
