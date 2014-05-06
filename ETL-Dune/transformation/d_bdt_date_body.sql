create or replace type body nf26p008.d_bdt_date_type
is
    member function getDate return date
    is
    begin
        if regexp_like(dat, '[0-9]{4}-[0-9]{2}-[0-9]{2}') then
            return to_date(dat, 'yyyy-mm-dd');
        else
            return null;
        end if;
    end;

    member function getDow return varchar
    is
    begin
        return to_char(self.getDate(), 'fmday');
    end;

    member function getDoy return number
    is
    begin
        return to_char(self.getDate(), 'ddd');
    end;

    member function getWoy return number
    is
    begin
        return to_char(self.getDate(), 'ww');
    end;

    member function getMoy return number
    is
    begin
        return to_char(self.getDate(), 'mm');
    end;

    member function getYear return number
    is
    begin
        return to_char(self.getDate(), 'yyyy');
    end;

    member function getTemperature (minimum in number, maximum in number) 
        return varchar
    is
        diff number;
        temp number;
    begin
        if self.toNumber(self.temperature) is null then
            return 'undefined';
        elsif self.hasDuplicates() then
            return 'undefined';
        else
            diff := maximum - minimum;
            temp := self.toNumber(self.temperature);
            dbms_output.put_line(diff);
            dbms_output.put_line(temp);
            if temp is null then
                --should be useless
                return 'undefined';
            elsif temp < minimum + diff / 4 then
                return 'cold';
            elsif temp < minimum + diff / 2 then
                return 'ratherCold';
            elsif temp < minimum + 3 * diff / 4 then
                return 'ratherHot';
            else
                return 'hot';
            end if;
        end if;
    end;

    member function toNumber (str in varchar) return number
    is
        num number;
    begin
        begin
            num := to_number(str);
        exception
        when others then
            num := null;
        end;
        return num;
    end;

    member function hasDuplicates return boolean
    is
        nb number;
    begin
        select count(*)
        into nb
        from nf26p008.d_bdt_date d
        where self.dat = d.dat;
        if nb > 1 then
            return true;
        else
            return false;
        end if;
    end;
end;
