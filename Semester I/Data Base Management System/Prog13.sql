create table salesmen (
    smno varchar2(6) primary key,  -- Salesman number as primary key
    name varchar2(50) not null,    -- Name of the salesman (not null)
    act_sales_amt number(16,2),    -- Actual sales amount
    tgt_sales_amt number(16,2)     -- Target sales amount
);

create table salescommission (
    smno varchar2(6),             -- Salesman number (foreign key reference to salesmen.smno)
    name varchar2(50) not null,   -- Name of the salesman (not null)
    dos date,                     -- Date of sale (or the date when commission was calculated)
    comm number(14,2)             -- Commission amount
);

-- drop trigger salesman_trig;
-- drop trigger salesman_trig_del;

create or replace trigger salesmen_trig
before insert or update on salesmen
for each row
when (new.act_sales_amt > new.tgt_sales_amt) -- Trigger only if actual sales > target sales
begin
    declare
        comm salescommission.comm%type;
        less_than_fixed exception;
        na salesmen.name%type;
    begin
        -- Determine commission based on actual sales amount
        if :new.act_sales_amt > 25000 then
            comm := :new.act_sales_amt * 0.35;
        elsif :new.act_sales_amt > 20000 and :new.act_sales_amt <= 25000 then
            comm := :new.act_sales_amt * 0.25;
        elsif :new.act_sales_amt > 15000 and :new.act_sales_amt <= 20000 then
            comm := :new.act_sales_amt * 0.15;
        elsif :new.act_sales_amt > 10000 and :new.act_sales_amt <= 15000 then
            comm := :new.act_sales_amt * 0.10;
        else
            raise less_than_fixed;  -- Raise an exception if actual sales is too low
        end if;

        -- Insert commission details if inserting a new record
        if inserting then
            insert into salescommission values (:new.smno, :new.name, sysdate, comm);
            dbms_output.put_line('RECORD INSERTED INTO SALESCOMMISSION TABLE');
        end if;

        -- Handle updates to existing records
        if updating then
            select name into na from salescommission where smno = :new.smno;
            delete from salescommission where smno = :new.smno; -- Remove old commission
            insert into salescommission values (:new.smno, :new.name, sysdate, comm); -- Insert updated commission
            dbms_output.put_line('RECORD UPDATED IN SALESCOMMISSION TABLE');
        end if;
    exception
        when less_than_fixed then
            dbms_output.put_line('Salesman no.: ' || :new.smno || ' is not entitled to get commission');
        when no_data_found then
            dbms_output.put_line('The Salesman ' || na || ' is not found in the salescommission table');
    end;
end salesmen_trig;
/

create or replace trigger salesmen_trig_del
after delete on salesmen
for each row
begin
    declare
        na salesmen.name%type;
    begin
        -- Delete the related commission record when a salesman is deleted
        if deleting then
            select name into na from salescommission where smno = :old.smno;
            delete from salescommission where smno = :old.smno;
            dbms_output.put_line('RECORD DELETED FROM SALESCOMMISSION TABLE');
        end if;
    exception
        when no_data_found then
            dbms_output.put_line('Salesman no.: ' || :old.smno || ' is not found in the salescommission table');
    end;
end salesmen_trig_del;
/

insert into salesmen values('SM01', 'Rajesh', 18900, 10000);

select * from salesmen;
select * from salescommission;

update salesmen set act_sales_amt = 18900, tgt_sales_amt = 10000 where smno = 'SM01';
update salesmen set act_sales_amt = 18900 where smno = 'SM01';

delete from salesmen where smno = 'SM02';