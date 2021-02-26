CREATE OR REPLACE TRIGGER t_member_delivery
AFTER INSERT ON member
FOR EACH ROW
DECLARE
BEGIN
  IF INSERTING THEN 
    insert into delivery values (s_delivery.nextval, :NEW.mno, :NEW.addr, :NEW.addr_detail, :NEW.name, :NEW.phone, 'y', sysdate);
  END IF;
END;
/