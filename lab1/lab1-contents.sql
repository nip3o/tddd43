
INSERT INTO `Expert` (`id`, `name`, `email`)
VALUES
	(1,'Niclas Olofsson','nicol271@student.liu.se'),
	(2,'Holger Grenquist','holger@grenquist.se');
    (3,'Arne Anka','arne@anka.se');


INSERT INTO `ExpertArea` (`id`, `description`, `parent`)
VALUES
	(1,'Computer Science',NULL),
	(2,'Databases',1),
	(3,'SQL',2),
	(4,'Programming',1);

INSERT INTO `Expertise` (`expert`, `expertArea`)
VALUES
	(1,3),
	(2,4);

INSERT INTO `Recommendation` (`id`, `justification`, `authorExpert`, `recommendedExpert`)
VALUES
	(1,'He has completed the TDDD43 LAB 1',2,1),
    (2,'Has given me a bar of chocolate',3,2);
