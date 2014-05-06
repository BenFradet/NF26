create or replace type body nf26p008.d_bdt_jolitre_type
is
    member function getJolitreId return varchar
    is
    begin
        return trim(jolitre_id);
    end;

    member function getQuality (minimum in number, maximum in number) 
        return varchar
    is
        diff number;
    begin
        if self.quality is null then
            return 'undefined';
        elsif self.hasDuplicates() then
            return 'undefined';
        else
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

    member function getSize return number
    is
    begin
        if self.hasDuplicates() then
            return null;
        else
            return j_size;
        end if;
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
            select count(distinct jolitre.city_pop)
            into nb
            from nf26p008.d_bdt_jolitre jolitre
            where jolitre.city = self.city;
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
            select count(distinct jolitre.sector_surface)
            into nb
            from nf26p008.d_bdt_jolitre jolitre
            where jolitre.sector = self.sector;
            if nb > 1 then
                return null;
            else
                return sector_surface;
            end if;
        end if;
    end;

    member function isBestSeller return char
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
        from nf26p008.d_bdt_jolitre j
        where j.jolitre_id = self.jolitre_id;
        if nb > 1 then
            return true;
        else
            return false;
        end if;
    end;
end;
