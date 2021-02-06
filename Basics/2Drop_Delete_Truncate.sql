Create database student;

use student;
create table student(id int,name varchar(40),email varchar(80),password varchar(40));

INSERT STUDENT 
VALUES 
(2,'CDE','abc@gmail.com',1234);

SET SQL_SAFE_UPDATES = 0;
DROP TABLE  STUDENT ;

select * from student;
COMMIT;
