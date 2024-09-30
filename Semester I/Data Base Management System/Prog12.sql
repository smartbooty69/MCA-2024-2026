-- Main table for storing student data
create table student2 (
    Rno varchar2(10),
    Name varchar2(35) not null,
    Sub1 number(3),
    Sub2 number(3),
    Sub3 number(3),
    Sub4 number(3),
    Sub5 number(3),
    Average number(6,2),
    Result varchar2(10),
    Grade varchar2(30),
    constraint pk_student primary key (Rno)
);

-- Table for storing data of students who passed
create table student2pass (
    Rno varchar2(10),
    Name varchar2(35) not null,
    Sub1 number(3),
    Sub2 number(3),
    Sub3 number(3),
    Sub4 number(3),
    Sub5 number(3),
    Average number(6,2),
    Result varchar2(10),
    Grade varchar2(30),
    constraint pk_student_pass primary key (Rno)
);

-- Table for storing data of students who failed
create table student2fail (
    Rno varchar2(10),
    Name varchar2(35) not null,
    Sub1 number(3),
    Sub2 number(3),
    Sub3 number(3),
    Sub4 number(3),
    Sub5 number(3),
    Average number(6,2),
    Result varchar2(10),
    Grade varchar2(30),
    constraint pk_student_fail primary key (Rno)
);

create or replace trigger student_trig 
before insert or update on student2 
for each row 
begin 
    declare 
        res student2.result%type;
        per student2.average%type;
        gra student2.grade%type;
    begin
        -- Remove any previous records of the student from pass/fail tables
        delete from student2pass where rno = :new.rno;
        delete from student2fail where rno = :new.rno;

        -- Insert or update action
        if inserting or updating then
            -- Check if the student passed (all subjects >= 40)
            if (:new.sub1 >= 40 and :new.sub2 >= 40 and :new.sub3 >= 40 and :new.sub4 >= 40 and :new.sub5 >= 40) then
                res := 'PASS';
                -- Calculate the average
                per := (:new.sub1 + :new.sub2 + :new.sub3 + :new.sub4 + :new.sub5) / 5;

                -- Assign grade based on the average
                if per >= 75 then
                    gra := 'FIRST CLASS WITH DISTINCTION';
                elsif per < 75 and per >= 60 then
                    gra := 'FIRST CLASS';
                elsif per < 60 and per >= 50 then
                    gra := 'SECOND CLASS';
                else
                    gra := 'THIRD CLASS';
                end if;

                -- Update student table with result, average, and grade
                update student2 set result = res, average = per, grade = gra where rno = :new.rno;

                -- Insert the record into the student2pass table
                insert into student2pass values (:new.rno, :new.name, :new.sub1, :new.sub2, :new.sub3, :new.sub4, :new.sub5, per, res, gra);
                dbms_output.put_line('RECORD UPDATED AND INSERTED INTO STUDENT2PASS');
            else
                -- If the student failed
                res := 'FAIL';
                update student2 set result = res where rno = :new.rno;

                -- Insert the record into the student2fail table
                insert into student2fail values (:new.rno, :new.name, :new.sub1, :new.sub2, :new.sub3, :new.sub4, :new.sub5, per, res, gra);
                dbms_output.put_line('RECORD UPDATED AND INSERTED INTO STUDENT2FAIL');
            end if;
        end if;
    exception
        when no_data_found then
            dbms_output.put_line('No records found!');
    end;
end student_trig;
/

create or replace trigger student_trig_del 
after delete on student2 
for each row 
begin
    -- Remove the record from the student2pass or student2fail table based on the student rno
    delete from student2pass where rno = :old.rno;
    delete from student2fail where rno = :old.rno;
    dbms_output.put_line('RECORD DELETED FROM STUDENT2PASS AND STUDENT2FAIL');
end student_trig_del;
/

-- -- Insert a student record (prompting for input values)
-- insert into student2(Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5) 
-- values ('&Rno', '&Name', &Sub1, &Sub2, &Sub3, &Sub4, &Sub5);

-- -- View the student2 table
-- set linesize 180;
-- select * from student2;

-- -- View the student2pass table (students who passed)
-- select * from student2pass;

-- -- View the student2fail table (students who failed)
-- select * from student2fail;

