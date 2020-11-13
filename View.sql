CREATE VIEW committee_member_name_with_position AS
SELECT student_id,fname,lname,Position FROM societymember,committee
WHERE Student_id = S_id;

SHOW CREATE VIEW committee_member_name_with_position;
SELECT * FROM committee_member_name_with_position;