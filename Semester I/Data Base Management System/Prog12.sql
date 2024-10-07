CREATE TABLE STUDENT2 (
    RNO VARCHAR2(10),
    NAME VARCHAR2(35) NOT NULL,
    SUB1 NUMBER(3),
    SUB2 NUMBER(3),
    SUB3 NUMBER(3),
    SUB4 NUMBER(3),
    SUB5 NUMBER(3),
    AVERAGE NUMBER(6, 2),
    RESULT VARCHAR2(10),
    GRADE VARCHAR2(30),
    CONSTRAINT PK_STUDENT PRIMARY KEY (RNO)
);

CREATE TABLE STUDENT2PASS (
    RNO VARCHAR2(10),
    NAME VARCHAR2(35) NOT NULL,
    SUB1 NUMBER(3),
    SUB2 NUMBER(3),
    SUB3 NUMBER(3),
    SUB4 NUMBER(3),
    SUB5 NUMBER(3),
    AVERAGE NUMBER(6, 2),
    RESULT VARCHAR2(10),
    GRADE VARCHAR2(30),
    CONSTRAINT PK_STUDENT_PASS PRIMARY KEY (RNO)
);

CREATE TABLE STUDENT2FAIL (
    RNO VARCHAR2(10),
    NAME VARCHAR2(35) NOT NULL,
    SUB1 NUMBER(3),
    SUB2 NUMBER(3),
    SUB3 NUMBER(3),
    SUB4 NUMBER(3),
    SUB5 NUMBER(3),
    AVERAGE NUMBER(6, 2),
    RESULT VARCHAR2(10),
    GRADE VARCHAR2(30),
    CONSTRAINT PK_STUDENT_FAIL PRIMARY KEY (RNO)
);

CREATE OR REPLACE TRIGGER STUDENT_TRIG BEFORE
    INSERT OR
        UPDATE ON STUDENT2 FOR EACH ROW
    BEGIN
        DECLARE
            RES STUDENT2.RESULT%TYPE;
            PER STUDENT2.AVERAGE%TYPE;
            GRA STUDENT2.GRADE%TYPE;
        BEGIN
            DELETE FROM STUDENT2PASS
            WHERE
                RNO = :NEW.RNO;
            DELETE FROM STUDENT2FAIL
            WHERE
                RNO = :NEW.RNO;
            IF INSERTING OR UPDATING THEN
                IF (:NEW.SUB1 >= 40
                AND :NEW.SUB2 >= 40
                AND :NEW.SUB3 >= 40
                AND :NEW.SUB4 >= 40
                AND :NEW.SUB5 >= 40) THEN
                    RES := 'PASS';
                    PER := (:NEW.SUB1 + :NEW.SUB2 + :NEW.SUB3 + :NEW.SUB4 + :NEW.SUB5) / 5;
                    IF PER >= 75 THEN
                        GRA := 'FIRST CLASS WITH DISTINCTION';
                    ELSIF PER < 75 AND PER >= 60 THEN
                        GRA := 'FIRST CLASS';
                    ELSIF PER < 60 AND PER >= 50 THEN
                        GRA := 'SECOND CLASS';
                    ELSE
                        GRA := 'THIRD CLASS';
                    END IF;
                    UPDATE STUDENT2
                    SET
                        RESULT = RES,
                        AVERAGE = PER,
                        GRADE = GRA
                    WHERE
                        RNO = :NEW.RNO;
                    INSERT INTO STUDENT2PASS VALUES (
                        :NEW.RNO,
                        :NEW.NAME,
                        :NEW.SUB1,
                        :NEW.SUB2,
                        :NEW.SUB3,
                        :NEW.SUB4,
                        :NEW.SUB5,
                        PER,
                        RES,
                        GRA
                    );
                    DBMS_OUTPUT.PUT_LINE('RECORD UPDATED AND INSERTED INTO STUDENT2PASS');
                ELSE
                    RES := 'FAIL';
                    UPDATE STUDENT2
                    SET
                        RESULT = RES
                    WHERE
                        RNO = :NEW.RNO;
                    INSERT INTO STUDENT2FAIL VALUES (
                        :NEW.RNO,
                        :NEW.NAME,
                        :NEW.SUB1,
                        :NEW.SUB2,
                        :NEW.SUB3,
                        :NEW.SUB4,
                        :NEW.SUB5,
                        PER,
                        RES,
                        GRA
                    );
                    DBMS_OUTPUT.PUT_LINE('RECORD UPDATED AND INSERTED INTO STUDENT2FAIL');
                END IF;
            END IF;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('No records found!');
        END;
    END STUDENT_TRIG;
/

CREATE OR REPLACE TRIGGER STUDENT_TRIG_DEL AFTER
    DELETE ON STUDENT2 FOR EACH ROW
BEGIN
    DELETE FROM STUDENT2PASS
    WHERE
        RNO = :OLD.RNO;
    DELETE FROM STUDENT2FAIL
    WHERE
        RNO = :OLD.RNO;
    DBMS_OUTPUT.PUT_LINE('RECORD DELETED FROM STUDENT2PASS AND STUDENT2FAIL');
END STUDENT_TRIG_DEL;
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