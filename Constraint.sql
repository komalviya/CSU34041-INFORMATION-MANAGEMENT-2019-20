ALTER TABLE transaction
ADD CONSTRAINT Committee_member_check CHECK(Committee_member IN ('y','n'));

ALTER TABLE SocietyYear
ADD CONSTRAINT Member_count_check CHECK(Member_count > 0 or Member_count=0);

ALTER TABLE SocietyMember
ADD CONSTRAINT Course_year_check CHECK(Course_year>0 AND Course_year<10);

ALTER TABLE SocietyYear
ADD CONSTRAINT year_check CHECK(year<3000 AND year>2000);