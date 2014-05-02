create or replace type body nf26p008.d_bdt_clerk_type
is
    member function getId return number
    is
    begin
        return id;
    end;

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
    begin
        if self.experience is null then
            return 'undefined';
        else
            maximum := self.maxExperience();
            minimum := self.minExperience();
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

    member function maxExperience return number
    is
        maximum number;
    begin
        select max(experience)
        into maximum
        from nf26p008.d_bdt_clerk;
        return maximum;
    end;    

    member function minExperience return number
    is
        minimum number;
    begin
        select min(experience)
        into minimum
        from nf26p008.d_bdt_clerk;
        return minimum;
    end;

    member function getStore return varchar
    is
    begin
        return store;
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
        tmpClerkId varchar(255);
        tmpChar char(1);
        cursor c
        is select clerk from (
            select count(*) as co, clerk
            from nf26p008.d_bdt_ventes
            group by clerk
            order by co desc
        )
        where rownum <= 11;
    begin
        if self.clerk_id is null or length(self.clerk_id) = 0 then
            return 'N';
        else
            tmpChar := 'N';
            open c;
            loop
                fetch c into tmpClerkId;
                exit when c%notfound;
                exit when tmpChar like 'Y';
                if self.clerk_id like tmpClerkId then
                    tmpChar := 'Y';
                end if;
            end loop;
            close c;
            return tmpChar;
        end if;
    end;

    member function isBestStore return char
    is
        tmpStoreId varchar(255);
        tmpChar char(1);
        cursor c
        is select store from (
            select count(*) as co, store
            from nf26p008.d_bdt_ventes ventes
            join nf26p008.d_bdt_clerk clerk on ventes.clerk like clerk.clerk_id
            group by store
            order by co desc
        )
        where rownum <= 10;
    begin
        if self.store is null or length(self.store) = 0 then
            return 'N';
        else
            tmpChar := 'N';
            open c;
            loop
                fetch c into tmpStoreId;
                exit when c%notfound;
                exit when tmpChar like 'Y';
                if self.store like tmpStoreId then
                    tmpChar := 'Y';
                end if;
            end loop;
            close c;
            return tmpChar;
        end if;
    end;
end;
