begin
    for c in (select type_name from user_types) loop
    execute immediate ('drop type nf26p008.' || c.type_name || ' force');
    end loop;
end;
/
begin
    for c in 
        (select object_name from user_objects where object_type='TABLE') loop
    execute immediate ('drop table nf26p008.' || c.object_name || 
        ' cascade constraints');
    end loop;
end;
/
