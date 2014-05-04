create or replace function nf26p008.toNumber (str in varchar) return number
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
/
create or replace function nf26p008.maxTemperature return number
is
    maximum number;
begin
    select max(toNumber(temperature))
    into maximum
    from nf26p008.d_bdt_date;
    return maximum;
end;
/
create or replace function nf26p008.minTemperature return number
is
    minimum number;
begin
    select min(toNumber(temperature))
    into minimum
    from nf26p008.d_bdt_date;
    return minimum;
end;
/
create or replace function nf26p008.maxExperience return number
is
    maximum number;
begin
    select max(experience)
    into maximum
    from nf26p008.d_bdt_clerk;
    return maximum;
end;
/
create or replace function nf26p008.minExperience return number
is
    minimum number;
begin
    select min(experience)
    into minimum
    from nf26p008.d_bdt_clerk;
    return minimum;
end;
/
create or replace function nf26p008.maxQuality return number
is
    maximum number;
begin
    select max(quality)
    into maximum
    from nf26p008.d_bdt_jolitre;
    return maximum;
end;
/
create or replace function nf26p008.minQuality return number
is
    minimum number;
begin
    select min(quality)
    into minimum
    from nf26p008.d_bdt_jolitre;
    return minimum;
end;
/
