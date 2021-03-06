CREATE TABLE users (id INT PRIMARY KEY AUTO_INCREMENT, user_name VARCHAR(255) UNIQUE NOT NULL,
 passwd VARCHAR(255) NOT NULL, role_id INT NOT NULL);

CREATE TABLE auth_roles (id INT PRIMARY KEY AUTO_INCREMENT, role_name VARCHAR(255));

ALTER TABLE users ADD CONSTRAINT fk_users_auth_roles_role_id FOREIGN KEY (role_id) REFERENCES auth_roles(id);

CREATE TABLE blogs (id INT PRIMARY KEY AUTO_INCREMENT, title VARCHAR(1047) NOT NULL, content TEXT NOT NULL, create_time DATE NOT NULL,
 comment_count INT DEFAULT 0 COMMENT '评论数', upvote_count INT DEFAULT 0 COMMENT '点赞数', watch_count INT DEFAULT 0 COMMENT '查看数',
 lable VARCHAR(255) COMMENT '标签，存储形式 aaa,bbb,ccc', recommend INT DEFAULT 0 COMMENT '推荐权值，越大越往前', user_id INT NOT NULL);
 
 ALTER TABLE blogs ADD CONSTRAINT fk_blogs_users_user_id FOREIGN KEY (user_id) REFERENCES users(id);
 
 CREATE TABLE comments(id INT PRIMARY KEY AUTO_INCREMENT, content VARCHAR(1047) COMMENT '评论内容' NOT NULL, user_id INT NOT NULL, 
 blog_id INT NOT NULL COMMENT '博客id', create_time DATETIME NOT NULL);
 
 ALTER TABLE comments ADD CONSTRAINT fk_comments_blogs_blog_id FOREIGN KEY (blog_id) REFERENCES blogs(id);
 
 ALTER TABLE comments ADD CONSTRAINT fk_comments_users_user_id FOREIGN KEY (user_id) REFERENCES users(id);

  INSERT INTO `blog`.`blogs`(`id`,`title`,`content`,`create_time`,`comment_count`,`upvote_count`,`watch_count`,`lable`,`recommend`,`user_id`) 
 VALUES ( NULL,'第一篇博客','第一篇博客的内容','2017-03-04','0','0','0','哈哈','0','1');