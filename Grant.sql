#create users
CREATE user 'Malviyak'@'localhost' IDENTIFIED BY 'pwd'; # CurrentTreasurer
CREATE user 'Shibealm'@'localhost' IDENTIFIED BY 'pwd';  #Current chair
CREATE user 'NevilleB'@'localhost' IDENTIFIED BY 'pwd'; #Current PRO
CREATE user 'KateM'@'localhost' IDENTIFIED BY 'pwd'; #Current Secretary

#GRANT trasurer and chair right to transaction table
GRANT UPDATE,INSERT,DELETE,SELECT on Transaction To 'Malviyak'@'localhost';
GRANT UPDATE,INSERT,DELETE,SELECT on Transaction To 'Shibealm'@'localhost';

#PRO is repsonsible for adding society member and event details
GRANT UPDATE,INSERT,DELETE,SELECT on societymember To 'NevilleB'@'localhost';
GRANT UPDATE,INSERT,DELETE,SELECT on societyyear To 'NevilleB'@'localhost';
GRANT UPDATE,INSERT,DELETE,SELECT on Event To 'NevilleB'@'localhost';
GRANT UPDATE,INSERT,DELETE,SELECT on Event_type To 'NevilleB'@'localhost';
GRANT UPDATE,INSERT,DELETE,SELECT on organize To 'NevilleB'@'localhost';

#chair and secretary will also have access of PRO
GRANT UPDATE,INSERT,DELETE,SELECT on societymember To 'Shibealm'@'localhost';
GRANT UPDATE,INSERT,DELETE,SELECT on societyyear To 'Shibealm'@'localhost';
GRANT UPDATE,INSERT,DELETE,SELECT on Event To 'Shibealm'@'localhost';
GRANT UPDATE,INSERT,DELETE,SELECT on Event_type To 'Shibealm'@'localhost';
GRANT UPDATE,INSERT,DELETE,SELECT on organize To 'Shibealm'@'localhost';

GRANT UPDATE,INSERT,DELETE,SELECT on societymember To 'KateM'@'localhost' ;
GRANT UPDATE,INSERT,DELETE,SELECT on societyyear To 'KateM'@'localhost' ;
GRANT UPDATE,INSERT,DELETE,SELECT on Event To 'KateM'@'localhost' ;
GRANT UPDATE,INSERT,DELETE,SELECT on Event_type To 'KateM'@'localhost' ;
GRANT UPDATE,INSERT,DELETE,SELECT on organize To 'KateM'@'localhost' ;