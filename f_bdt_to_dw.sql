--desactivation des contraintes et index dans f_dw_*


insert into nf26pxxx.f_dw_ventes (
    magasin,
    dat,
    produit
)
values (
    select
        v.getMagasin(),
        v.getDat(),
        v.getProduit()
    from nf26pxxx.f_bdt_ventes as v
);

insert into nf26pxxx.f_dw_magasin (
    num_mag,
    rayon_bs,
    rayon_r,
    dpt,
    dpt_nom,
    dpt_pop,
    rayonnage
)
values (
    select
        m.getNumMag(),
        m.getRayonBs(),
        m.getRayonRecent(),
        m.getDpt(),
        m.getDptNom(),
        m.getDptPop(),
        m.getRayonnage()
    from nf26pxxx.f_bdt_magasin as m
);

insert into nf26pxxx.f_dw_produit (
    isbn,
    titre,
    langue,
    genre,
    auteur,
    editeur,
    parution
)
values (
    select
        p.getIsbn(),
        p.getTitre(),
        p.getLangue(),
        p.getGenre(),
        p.getAuteur(),
        p.getEditeur(),
        p.getParution()
   from nf26pxxx.f_bdt_produit as p
);

insert into nf26pxxx.f_dw_date (
    dat,
    jour_semaine,
    mois,
    semaine,
    trimestre
)
values (
    select distinct
        d.getDat(),
        d.getJourSemaine(),
        d.getMois(),
        d.getSemaine(),
        d.getTrimestre()
    from nf26pxxx.f_bdt_date as d
);

--reenable constraints and indexes

--test
