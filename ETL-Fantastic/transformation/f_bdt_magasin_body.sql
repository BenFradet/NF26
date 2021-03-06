create or replace type body nf26p008.f_bdt_magasin_type
is
    member function getNumMag return varchar
    is
    begin
        return num_mag;
    end;

    member function getRayonBs return char
    is
    begin
        return rayon_bs;
    end;

    member function getRayonRecent return char
    is
    begin
        return rayon_r;
    end;

    member function getDpt return char
    is
    begin
        return dpt;
    end;

    member function getDptNom return varchar
    is
    begin
        return dpt_nom;
    end;

    member function getDptPop return number
    is
    begin
        return floor(dpt_pop / 100000.0);
    end;

    member function getRayonnage return char
    is
    begin
        return substr(rayonnage,1,1);
    end;
    member function getRayonnageExt return varchar
    is
    begin
        return rayonnage_ext;
    end;
end;
