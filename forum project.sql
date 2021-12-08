CREATE TABLE `role` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `role_name` varchar(255)
);

CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `full_name` varchar(255),
  `username` varchar(255),
  `password` varchar(255),
  `email` varchar(255),
  `role` int,
  `status` varchar(255) COMMENT 'active/banned/inactive',
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `user_profile` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `profil_pict_path` varchar(255),
  `bio` varchar(255),
  `folowing` varchar(255) COMMENT 'array/object berisi id user yang difollow',
  `followers` varchar(255) COMMENT 'array/object berisi id user yang ngefollow',
  `threads` varchar(255) COMMENT 'array/object berisi id thread yang dibuat',
  `reputation` int COMMENT 'reputasi user dalam forum, nanti faktor yg mempengaruhi can be up to discuss'
);

CREATE TABLE `user_interaction` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_user` int,
  `id_comment` int COMMENT 'berisi id comment yang dipost oleh user',
  `id_liked_thread_by_user` int COMMENT 'berisi id thread yang dilike user',
  `id_liked_comment_by_user` int COMMENT 'berisi id comment yang dilike user'
);

CREATE TABLE `comment` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `thread_id` int,
  `comment` text,
  `liked_by` int COMMENT 'array obj user_id',
  `created_at` timestamp
);

CREATE TABLE `thread` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `kategori_id` int,
  `thread` text,
  `liked_by` int COMMENT 'array obj user_id',
  `created_at` timestamp
);

CREATE TABLE `kategori` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nama_kategori` varchar(255)
);

ALTER TABLE `users` ADD FOREIGN KEY (`role`) REFERENCES `role` (`id`);

ALTER TABLE `user_profile` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `user_interaction` ADD FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

ALTER TABLE `comment` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `comment` ADD FOREIGN KEY (`thread_id`) REFERENCES `thread` (`id`);

ALTER TABLE `thread` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `thread` ADD FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`);
