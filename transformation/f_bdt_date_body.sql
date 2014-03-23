create or replace type body nf26p008.f_bdt_date_type
is
    member function getDat return date
    is
    begin
        return to_date(dat, 'yyyy-mm-dd');
    end;

    member function getJourSemaine return varchar
    is
    begin
        return to_char(self.getDat(), 'fmday');
    end;

    member function getSemaine return integer
    is
    begin
        return to_char(self.getDat(), 'ww');
    end;

    member function getMois return integer
    is
    begin
        return to_char(self.getDat(), 'mm');
    end;

    member function getTrimestre return number
    is
    begin
        return ceil(to_char(self.getDat(), 'mm') / 3);
    end;
end;
