DROP PROCEDURE disp_fee;
DELIMITER //
CREATE PROCEDURE disp_fee
(id INTEGER )
BEGIN
  SELECT * FROM societyYear
  WHERE year = id;
END //
DELIMITER ;
CALL disp_fee(2019);

#DROP PROCEDURE disp_member;
#proceduere to dispay students for a specific society year
DELIMITER //
CREATE PROCEDURE disp_member
(disp_member_year INTEGER )
BEGIN
  SELECT * FROM societymember
  WHERE society_year = disp_member_year;
END //
DELIMITER ;
CALL disp_member(2019);

#proceduere to dispay committee for a specific society year
DROP PROCEDURE disp_committee;
#proceduere to dispay committee for a specific sosciety year
DELIMITER //
CREATE PROCEDURE disp_committee
(disp_committee_year INTEGER )
BEGIN
  SELECT committee.C_id, committee.position, societymember.S_id,societymember.fname
  FROM societymember
  INNER JOIN committee ON committee.student_id = societymember.S_id and societymember.Society_year = disp_committee_year;
END //
DELIMITER ;
CALL disp_committee(2019);