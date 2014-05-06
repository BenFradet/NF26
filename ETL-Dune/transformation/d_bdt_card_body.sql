create or replace type body nf26p008.d_bdt_card_type
is
    member function getCardId return varchar
    is
    begin
        return trim(card_id);
    end;

    member function getCity return varchar
    is
    begin
        if self.hasDuplicates() then
            return 'undefined';
        else
            return city;
        end if;
    end;

    member function getCityPop return number
    is
        nb number;
    begin
        if self.hasDuplicates() then
            return null;
        else
            select count(distinct card.city_pop)
            into nb
            from nf26p008.d_bdt_card card
            where card.city = self.city;
            if nb > 1 then
                return null;
            else
                return city_pop;
            end if;
        end if;
    end;

    member function getSector return varchar
    is
    begin
        if self.hasDuplicates() then
            return 'undefined';
        else
            return sector;
        end if;
    end;

    member function getSectorSurface return number
    is
        nb number;
    begin
        if self.hasDuplicates() then
            return null;
        else
            select count(distinct card.sector_surface)
            into nb
            from nf26p008.d_bdt_card card
            where card.sector = self.sector;
            if nb > 1 then
                return null;
            else
                return sector_surface;
            end if;
        end if;
    end;

    member function getOccupation return varchar
    is
    begin
        if self.hasDuplicates() then
            return 'undefined';
        else
            return occupation;
        end if;
    end;

    member function getOccupationStat return number
    is
    begin
        if self.hasDuplicates() then
            return null;
        else
            return occupation_stat;
        end if;
    end;

    member function getHouse return varchar
    is
    begin
        if self.hasDuplicates() then
            return 'undefined';
        else
            return house;
        end if;
    end;

    member function getHouseStat return number
    is
    begin
        if self.hasDuplicates() then
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

    member function hasDuplicates return boolean
    is
        nb number;
    begin
        select count(*)
        into nb
        from nf26p008.d_bdt_card card
        where card.card_id = self.card_id;
        if nb > 1 then
            return true;
        else
            return false;
        end if;
    end;
end;
