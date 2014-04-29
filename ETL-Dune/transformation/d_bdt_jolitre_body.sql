create or replace type body nf26p008.d_bdt_jolitre_type
is
    member function getJolitreId return varchar
    is
    begin
        return jolitre_id;
    end;

    member function getColor return varchar
    is
    begin
        return color;
    end;

    member function getPrice return number
    is
    begin
        return price;
    end;

    member function getQuality return varchar
    is
    begin
        return quality;
    end;

    member function getSize return number
    is
    begin
        return size;
    end;

    member function getType return varchar
    is
    begin
        return type;
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
    begin
        return 'N';
    end;
end;
