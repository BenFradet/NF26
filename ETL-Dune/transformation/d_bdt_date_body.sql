create or replace type body nf26p008.f_bdt_date_type
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

    member function getTemperature return number
    is
    begin
        return temperature;
    end;
end;
