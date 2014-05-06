create or replace type body nf26p008.d_bdt_clerk_type
is
    member function getClerkId return number
    is
    begin
        return to_number(clerk_id);
    end;

    member function getExperience (minimum in number, maximum in number)
        return varchar
    is
        diff number;
    begin
        if self.experience is null then
            return 'undefined';
        elsif self.hasDuplicates() then
            return 'undefined';
        else
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

    member function getStore return varchar
    is
    begin
        if self.hasDuplicates() then
            return 'undefined';
        else
            return store;
        end if;
    end;

    member function getStoreCity return varchar
    is
    begin
        if self.hasDuplicates() then
            return 'undefined';
        else
            return store_city;
        end if;
    end;

    member function getStoreCityPop return number
    is
        nb number;
    begin
        if self.hasDuplicates() then
            return null;
        else
            select count(distinct clerk.store_city_pop)
            into nb
            from nf26p008.d_bdt_clerk clerk
            where clerk.store_city = self.store_city;
            if nb > 1 then
                return null;
            else
                return store_city_pop;
            end if;
        end if;
    end;

    member function getStoreSector return varchar
    is
    begin
        if self.hasDuplicates() then
            return 'undefined';
        else
            return store_sector;
        end if;
    end;

    member function getStoreSectorSurface return number
    is
        nb number;
    begin
        if self.hasDuplicates() then
            return null;
        else
            select count(distinct clerk.store_sector_surface)
            into nb
            from nf26p008.d_bdt_clerk clerk
            where clerk.store_sector = self.store_sector;
            if nb > 1 then
                return null;
            else
                return store_sector_surface;
            end if;
        end if;
    end;

    member function isBestClerk return char
    is
    begin
        return 'N';
    end;

    member function isBestStore return char
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
        from nf26p008.d_bdt_clerk clerk
        where clerk.clerk_id = self.clerk_id;
        if nb > 1 then
            return true;
        else
            return false;
        end if;
    end;
end;
