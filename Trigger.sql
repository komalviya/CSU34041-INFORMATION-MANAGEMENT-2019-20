#TRIGEER FOR REFERENTIAL INTEGRITY
delimiter //
CREATE TRIGGER Update_S_id_reference
BEFORE DELETE ON SocietyMember
FOR EACH ROW
BEGIN
    DELETE FROM committee
    WHERE Student_id = OLD.s_id;
END ;
//

delimiter //
CREATE TRIGGER Update_C_id
BEFORE DELETE ON committee
FOR EACH ROW
BEGIN
    DELETE FROM transaction
    WHERE transaction.C_id = OLD.C_id;
	DELETE FROM organize
    WHERE organize.C_id = OLD.C_id;
END ;
//

delimiter //
CREATE TRIGGER Update_E_id
BEFORE DELETE ON event
FOR EACH ROW
BEGIN
    DELETE FROM event_type
    WHERE event_type.E_id = OLD.E_id;
    DELETE FROM organize
    WHERE organize.E_id = OLD.E_id;
    DELETE FROM Event_Collaboration
    WHERE Event_Collaboration.E_id = OLD.E_id;
END ;
//

#Trigger for keeping track of count of society members
DROP TRIGGER Member_count_increase;
delimiter //
CREATE TRIGGER Member_count_increase
BEFORE INSERT ON societymember
FOR EACH ROW
BEGIN
    UPDATE SocietyYear
    SET Member_count = Member_count+1
    WHERE SocietyYear.year = NEW.Society_year;
END ;
//
DROP TRIGGER Member_count_decrease;
delimiter //
CREATE TRIGGER Member_count_decrease
BEFORE DELETE ON societymember
FOR EACH ROW
BEGIN
	#DECLARE id INTEGER;
	#SET @id = NEW.Society_year;
    UPDATE SocietyYear
    SET Member_count = Member_count-1
    WHERE SocietyYear.year = OLD.Society_year;
END ;
//

SET @id = 0;
SET @id =NULL;
SET @total_amount= 0;
DROP TRIGGER Update_total_transaction;
delimiter //
CREATE TRIGGER Update_total_transaction
BEFORE INSERT ON transaction
FOR EACH ROW
BEGIN
	SET @total_amount = @total_amount + NEW.Amount;
END ;
//
SELECT @total_amount;
