create or replace type body nf26p008.f_bdt_catalogue_type
is
    member function getIsbn retun varchar
    is
    begin
        return isbn;
    end;

    member function getTitre return varchar
    is
    begin
        return titre;
    end;

    member function getAuteur return varchar
    is
    begin
        return auteur;
    end;

    member function getLangue return char
    is
    begin
        return langue;
    end;

    member function getParution return char
    is
    begin
        return to_char(
            cast(to_timestamp_tz(parution, 'yyyy-mm-dd"T"hh24:mi:ss tzh:tzm')
                as date), 'YYYY');
    end;

    member function getEditeur return varchar
    is
    begin
        return editeur;
    end;

    --pourrait nlp et 
    --creer 10 fields genres
    --ou juste le premier
    --ou creer des combinaisons de genres (eg: "SF et Policier")
    member function getGenre return varchar
    is
    begin
        return genre;
    end;
end;
