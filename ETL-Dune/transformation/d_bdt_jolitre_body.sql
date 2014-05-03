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
        nb number;
    begin
        select count(distinct quality)
        into nb
        from nf26p008.d_bdt_jolitre
        where jolitre_id = self.jolitre_id;
        if self.quality is null then
            return 'undefined';
        elsif nb > 1 then
            return 'undefined';
        else
            minimum := 10;
            maximum := 75;
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

    --member function minQuality return number
    --is
    --    minimum number;
    --begin
    --    select min(quality)
    --    into minimum
    --    from nf26p008.d_bdt_jolitre;
    --    return minimum;
    --end;

    --member function maxQuality return number
    --is
    --    maximum number;
    --begin
    --    select max(quality)
    --    into maximum
    --    from nf26p008.d_bdt_jolitre;
    --    return maximum;
    --end;

    member function getSize return number
    is
        nb number;
    begin
        select count(distinct j_size)
        into nb
        from nf26p008.d_bdt_jolitre
        where jolitre_id = self.jolitre_id;
        if nb > 1 then
            return null;
        else
            return j_size;
        end if;
    end;

    member function getCity return varchar
    is
        nb number;
    begin
        select count(distinct city)
        into nb
        from nf26p008.d_bdt_jolitre
        where jolitre_id = self.jolitre_id;
        if nb > 1 then
            return 'undefined';
        else
            return city;
        end if;
    end;

    member function getCityPop return number
    is
    begin
        if self.getCity() like 'undefined' then
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
        from nf26p008.d_bdt_jolitre
        where jolitre_id = self.jolitre_id;
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

    member function isBestSeller return char
    is
    begin
        return 'N';
    end;
    --member function isBestSeller return char
    --is
    --    tmpJolitreId varchar(255);
    --    tmpChar char(1);
    --begin
    --    if self.jolitre_id is null or length(self.jolitre_id) = 0 then
    --        return 'N';
    --    elsif self.hasDuplicates() then
    --        return 'N';
    --    else
    --        tmpChar := 'N';
    --        for r in (
    --                select jolitre from (
    --                    select count(*) as co, jolitre
    --                    from nf26p008.d_bdt_ventes
    --                    group by jolitre 
    --                    order by co desc
    --                )
    --                where rownum <= 11) loop
    --            if r.jolitre like self.jolitre_id then
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
        from nf26p008.d_bdt_jolitre
        where jolitre_id = self.jolitre_id;
        if nb > 1 then
            return true;
        else
            return false;
        end if;
    end;
end;
