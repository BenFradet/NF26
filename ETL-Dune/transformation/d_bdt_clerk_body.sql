create or replace type body nf26p008.d_bdt_clerk_type
is
    member function getClerkId return number
    is
    begin
        return clerk_id;
    end;

    member function getName return varchar
    is
    begin
        return name;
    end;

    member function getExperience return number
    is
    begin
        return experience;
    end;

    member function getGender return char
    is
    begin
        return gender;
    end;

    member function getStore return varchar
    is
    begin
        return store;
    end;

    member function getStoreDop return date
    is
    begin
        if regexp_like(dat, '[0-9]{4}-[0-9]{2}-[0-9]{2}') then
            return to_date(store_dop, 'yyyy-mm-dd');
        else
            return null;
        end if;
    end;

    member function getStoreYop return number
    is
    begin
        return to_number(self.getStoreDop(), 'YYYY');
    end;

    member function getStoreCity return varchar
    is
    begin
        return store_city;
    end;

    member function getStoreCityPop return number
    is
    begin
        return store_city_pop;
    end;

    member function getStoreSector return varchar
    is
    begin
        return store_sector;
    end;

    member function getStoreSectorSurface return number
    is
    begin
        return store_sector_surface;
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
end;
