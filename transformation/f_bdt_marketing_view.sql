drop view nf26p008.f_bdt_marketing_view;
create view nf26p008.f_bdt_marketing_view as
select
    case when to_number(dpt) < 10 then
        '0' || to_number(dpt)
    else
        dpt
    end
    as dpt, magasin, rayonnage, rayonnage_ext, bestseller, recent
from nf26p008.f_bde_marketing;
