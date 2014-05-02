create or replace type body nf26p008.d_bdt_jolitre_type
is
    member function getJolitreId return varchar
    is
    begin
        return jolitre_id;
    end;

    member function getQuality return varchar
    is
        diff number;
        minimum number;
        maximum number;
    begin
        if self.quality is null then
            return 'undefined';
        else
            minimum := self.minQuality();
            maximum := self.maxQuality();
            diff := maximum - minimum;
            if self.quality < minimum + diff / 3 then
                return 'bad';
            elsif self.quality < minimum + diff * 2 / 3 then
                return 'average';
            else
                return 'good';
            end if;
        end if;
    end;

    member function minQuality return number
    is
        minimum number;
    begin
        select min(quality)
        into minimum
        from nf26p008.d_bdt_jolitre;
        return minimum;
    end;

    member function maxQuality return number
    is
        maximum number;
    begin
        select max(quality)
        into maximum
        from nf26p008.d_bdt_jolitre;
        return maximum;
    end;

    member function getSize return number
    is
    begin
        return j_size;
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

    member function isBestSeller return char
    is
        tmpJolitreId varchar(255);
        tmpChar char(1);
        cursor c
        is select jolitre from (
            select count(*) as co, jolitre
            from nf26p008.d_bdt_ventes
            group by jolitre
            order by co desc
        )
        where rownum <= 11;
    begin
        if self.jolitre_id is null or length(self.jolitre_id) = 0 then
            return 'N';
        else
            tmpChar := 'N';
            open c;
            loop
                fetch c into tmpJolitreId;
                exit when c%notfound;
                exit when tmpChar like 'Y';
                if self.jolitre_id like tmpJolitreId then
                    tmpChar := 'Y';
                end if;
            end loop;
            close c;
            return tmpChar;
        end if;
    end;
end;
