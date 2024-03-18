DROP SCHEMA IF EXISTS socialLoginProject;
CREATE SCHEMA IF NOT EXISTS socialLoginProject DEFAULT CHARACTER SET utf8;
USE socialLoginProject;

DROP TABLE IF EXISTS socialLoginProject.user;

CREATE TABLE user (
    userId VARCHAR(60),
    userName VARCHAR(20),
    profileImg VARCHAR(200),
    created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    updated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
    PRIMARY KEY(userId)
);

INSERT INTO user (userId, userName, profileImg) VALUES
("sunny1", "서니1", "image1"),
("sunny2", "서니2", "image2"),
("sunny3", "서니3", "image3"),
("sunny4", "서니4", "image4"),
("sunny5", "서니5", "image5");

SELECT userId, userName FROM user ORDER BY created LIMIT 1;
SELECT userName FROM user WHERE userId='sunny5';
DELETE FROM user WHERE userName='서니5';
UPDATE user SET userId='sunny0' WHERE userName='서니5';