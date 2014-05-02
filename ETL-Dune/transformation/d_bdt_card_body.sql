create or replace type body nf26p008.d_bdt_card_type
is
    member function getCardId return varchar
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

    member function isFremen return char
    is
    begin
        if self.house like 'fremen' then
            return 'Y';
        else
            return 'N';
        end if;
    end;

    member function isHighSpender return char
    is
        tmpCardId varchar(255);
        tmpChar char(1);
        cursor c
        is select card from (
            select count(*) as co, card
            from nf26p008.d_bdt_ventes
            group by card
            order by co desc
        )
        where rownum <= 11;
    begin
        if self.card_id is null or length(self.card_id) = 0 then
            return 'N';
        else
            tmpChar := 'N';
            open c;
            loop
                fetch c into tmpCardId;
                exit when c%notfound;
                exit when tmpChar like 'Y';
                if self.card_id like tmpCardId then
                    tmpChar := 'Y';
                end if;
            end loop;
            close c;
            return tmpChar;
        end if;
    end;
end;
