create or replace type body nf26p008.d_bdt_clerk_type
is
    member function getClerkId return number
    is
    begin
        return to_number(clerk_id);
    end;

    member function getExperience return varchar
    is
        diff number;
        minimum number;
        maximum number;
        nb number;
    begin
        select count(distinct experience)
        into nb
        from nf26p008.d_bdt_clerk
        where clerk_id = self.clerk_id;
        if self.experience is null then
            return 'undefined';
        elsif nb > 1 then
            return 'undefined';
        else
            maximum := 0;
            minimum := 90;
            diff := maximum - minimum;
            if self.experience < minimum + diff / 3 then
                return 'newcomer';
            elsif self.experience < minimum + diff * 2 / 3 then
                return 'average';
            else
                return 'experienced';
            end if;
        end if;
    end;

    --member function maxExperience return number
    --is
    --    maximum number;
    --begin
    --    select max(experience)
    --    into maximum
    --    from nf26p008.d_bdt_clerk;
    --    return maximum;
    --end;    

    --member function minExperience return number
    --is
    --    minimum number;
    --begin
    --    select min(experience)
    --    into minimum
    --    from nf26p008.d_bdt_clerk;
    --    return minimum;
    --end;

    member function getStore return varchar
    is
        nb number;
    begin
        select count(distinct store)
        into nb
        from nf26p008.d_bdt_clerk
        where clerk_id = self.clerk_id;
        if nb > 1 then
            return 'undefined';
        else
            return store;
        end if;
    end;

    member function getStoreCity return varchar
    is
        nb number;
    begin
        select count(distinct store_city)
        into nb
        from nf26p008.d_bdt_clerk
        where clerk_id = self.clerk_id;
        if nb > 1 then
            return 'undefined';
        else
            return store_city;
        end if;
    end;

    member function getStoreCityPop return number
    is
    begin
        if self.getStoreCity() like 'undefined' then
            return null;
        else
            return store_city_pop;
        end if;
    end;

    member function getStoreSector return varchar
    is
        nb number;
    begin
        select count(distinct store_sector)
        into nb
        from nf26p008.d_bdt_clerk
        where clerk_id = self.clerk_id;
        if nb > 1 then
            return 'undefined';
        else
            return store_sector;
        end if;
    end;

    member function getStoreSectorSurface return number
    is
    begin
        if self.getStoreSector() like 'undefined' then
            return null;
        else
            return store_sector_surface;
        end if;
    end;

    member function isBestClerk return char
    is
    begin
        return 'N';
    end;
    --member function isBestClerk return char
    --is
    --    tmpClerkId varchar(255);
    --    tmpChar char(1);
    --begin
    --    if self.clerk_id is null or length(self.clerk_id) = 0 then
    --        return 'N';
    --    elsif self.hasDuplicates() then
    --        return 'N';
    --    else
    --        tmpChar := 'N';
    --        for r in (
    --                select clerk from (
    --                    select count(*) as co, clerk
    --                    from nf26p008.d_bdt_ventes
    --                    group by clerk
    --                    order by co desc
    --                )
    --                where rownum <= 11) loop
    --            if r.clerk like self.clerk_id then
    --                tmpChar := 'Y';
    --                exit;
    --            end if;
    --        end loop;
    --        return tmpChar;
    --    end if;
    --end;

    member function isBestStore return char
    is
    begin
        return 'N';
    end;
    --member function isBestStore return char
    --is
    --    tmpStoreId varchar(255);
    --    tmpChar char(1);
    --begin
    --    if self.store is null or length(self.store) = 0 then
    --        return 'N';
    --    elsif self.getStore() like 'undefined' then
    --        return 'N';
    --    else
    --        tmpChar := 'N';
    --        for r in (
    --                select store from (
    --                    select count(*) as co, store
    --                    from nf26p008.d_bdt_ventes
    --                    group by store
    --                    order by co desc
    --                )
    --                where rownum <= 10) loop
    --            if r.store like self.store then
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
        from nf26p008.d_bdt_clerk
        where clerk_id = self.clerk_id;
        if nb > 1 then
            return true;
        else
            return false;
        end if;
    end;
end;
