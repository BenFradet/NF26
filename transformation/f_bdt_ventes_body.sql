create or replace type body nf26p062.f_bdt_ventes_type
is
    member function getMagasin retun char
    is
    begin
		IF SUBSTR(magasin,1,1)='M' and LENGTH(magasin) between 2 and 4 THEN
		  return magasin;
			
		ELSE return NULL;
		
		END IF;
    end;

    member function getProduit return char
    is
    begin
		IF LENGTH(produit)=13 THEN
			return produit;
			
		ELSE return NULL;
		
		END IF;
    end;

    member function getDat return date
    is
    begin
        if regexp_like(dat, '[0-9]{4}-[0-9]{2}-[0-9]{2}') then
          return to_date(dat, 'yyyy-mm-dd');
          
        else
          return null;
          
        end if;
    end;

    member function getTicket return varchar
    is
    begin
        return ticket;
    end;

end;
