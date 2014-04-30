create or replace type body nf26p008.d_bdt_card_type
is
    member function getCardId return char
    is
    begin
        return card_id;
    end;

    member function getCity return varchar
    is
    begin
        return city;
    end;

    member function getCityPop return number
    is
    begin
        return city_pop;
    end;

    member function getSector return varchar
    is
    begin
        return sector;
    end;

    member function getSectorSurface return number
    is
    begin
        return sector_surface;
    end;

    member function getOccupation return varchar
    is
    begin
        return occupation;
    end;

    member function getOccupationStat return number
    is
    begin
        return occupation_stat;
    end;

    member function getHouse return varchar
    is
    begin
        return house;
    end;

    member function getHouseStat return number
    is
    begin
        return house_stat;
    end;

    member function isFremen return varchar
    is
    begin
        return 'N';
    end;

    member function isHighSpender return char
    is
    begin
        return 'N';
    end;
end;
