User.create!([
  {email:"user1@gmail.com", password:"123456789", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-07-18 07:09:48", last_sign_in_at: "2017-07-18 07:09:48", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", is_active: true, is_admin: false},
  {email: "user2@gmail.com",password:"123456789", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2017-07-19 04:07:05", last_sign_in_at: "2017-07-19 03:55:32", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", is_active: true, is_admin: false}
])
Album.create!([
  {user_id: 1, title: "hinh anh em ", description: "hinh m", quality: 0, is_private: false, like_count: 0},
  {user_id: 1, title: "dá", description: "âsdas", quality: 0, is_private: false, like_count: 0},
  {user_id: 1, title: "dsadasdasdas", description: "dsadasda", quality: 0, is_private: false, like_count: 0},
  {user_id: 1, title: "dsdasdasdsadas", description: "dasda", quality: 0, is_private: false, like_count: 0},
  {user_id: 1, title: "dá", description: "dasdasda", quality: 0, is_private: false, like_count: 0},
  {user_id: 1, title: "dsadasdasdas", description: "dádas", quality: 0, is_private: false, like_count: 0},
  {user_id: 1, title: "dsadasdasdas", description: "dasdasda", quality: 0, is_private: false, like_count: 0},
  {user_id: 1, title: "dsadasdasdas", description: "dasdasda", quality: 0, is_private: false, like_count: 0},
  {user_id: 2, title: "demo", description: "dem", quality: 0, is_private: false, like_count: 0},
  {user_id: 2, title: "hinh anh con meo", description: "3 con thu1 2", quality: 0, is_private: false, like_count: 0}
])
Picture.create!([
  {album_id: 1, title: nil, description: nil, is_private: false, like_count: 0, image_file_name: "de.jpg", image_content_type: "image/jpeg", image_file_size: 9185, image_updated_at: "2017-07-18 09:10:30"},
  {album_id: 1, title: nil, description: nil, is_private: false, like_count: 0, image_file_name: "voi.jpg", image_content_type: "image/jpeg", image_file_size: 130279, image_updated_at: "2017-07-18 09:10:30"},
  {album_id: 10, title: nil, description: nil, is_private: false, like_count: 0, image_file_name: "cu.jpg", image_content_type: "image/jpeg", image_file_size: 7387, image_updated_at: "2017-07-19 03:23:07"},
  {album_id: 10, title: nil, description: nil, is_private: false, like_count: 0, image_file_name: "de.jpg", image_content_type: "image/jpeg", image_file_size: 9185, image_updated_at: "2017-07-19 03:23:07"},
  {album_id: 10, title: nil, description: nil, is_private: false, like_count: 0, image_file_name: "voi.jpg", image_content_type: "image/jpeg", image_file_size: 130279, image_updated_at: "2017-07-19 03:23:07"},
  {album_id: 1, title: "hinh con cuu` :D ", description: "con cu de thuong ghe", is_private: false, like_count: 0, image_file_name: "de.jpg", image_content_type: "image/jpeg", image_file_size: 9185, image_updated_at: "2017-07-19 03:46:46"},
  {album_id: 1, title: nil, description: nil, is_private: false, like_count: 0, image_file_name: "cu.jpg", image_content_type: "image/jpeg", image_file_size: 7387, image_updated_at: "2017-07-19 03:52:04"},
  {album_id: 1, title: nil, description: nil, is_private: false, like_count: 0, image_file_name: "de.jpg", image_content_type: "image/jpeg", image_file_size: 9185, image_updated_at: "2017-07-19 03:52:04"},
  {album_id: 1, title: nil, description: nil, is_private: false, like_count: 0, image_file_name: "voi.jpg", image_content_type: "image/jpeg", image_file_size: 130279, image_updated_at: "2017-07-19 03:52:04"},
  {album_id: 1, title: nil, description: nil, is_private: false, like_count: 0, image_file_name: "cu.jpg", image_content_type: "image/jpeg", image_file_size: 7387, image_updated_at: "2017-07-19 03:53:49"}
])
