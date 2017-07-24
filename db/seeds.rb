User.create!([
  {name: "Rick", email: "rick@gmail.com", encrypted_password: "$2a$11$WrkcsCw1YrCYdSqimLnQsOTNzMQOF79Y93QfGcma72Ua7h2MohCYa", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-07-24 04:29:35", last_sign_in_at: "2017-07-24 04:29:35", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", is_active: true, is_admin: false, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil, wallpaper_file_name: nil, wallpaper_content_type: nil, wallpaper_file_size: nil, wallpaper_updated_at: nil}
])
Album.create!([
  {user_id: 1, title: "Hình các con thú", description: "Con thú dễ thương :v ", quality: 6, is_private: false, like_count: 0}
])
Like.create!([
  {user_id: 1, likeable_type: "Picture", likeable_id: 1}
])
Picture.create!([
  {album_id: 1, title: nil, description: nil, is_private: false, like_count: 0, image_file_name: "de.jpg", image_content_type: "image/jpeg", image_file_size: 9185, image_updated_at: "2017-07-24 04:36:31"},
  {album_id: 1, title: nil, description: nil, is_private: false, like_count: 0, image_file_name: "voi.jpg", image_content_type: "image/jpeg", image_file_size: 130279, image_updated_at: "2017-07-24 04:36:31"},
  {album_id: 1, title: "Con cú dễ thương ghê", description: "", is_private: false, like_count: 0, image_file_name: "cu.jpg", image_content_type: "image/jpeg", image_file_size: 7387, image_updated_at: "2017-07-24 04:36:31"},
  {album_id: 1, title: nil, description: nil, is_private: false, like_count: 0, image_file_name: "cu.jpg", image_content_type: "image/jpeg", image_file_size: 7387, image_updated_at: "2017-07-24 04:37:43"},
  {album_id: 1, title: nil, description: nil, is_private: false, like_count: 0, image_file_name: "de.jpg", image_content_type: "image/jpeg", image_file_size: 9185, image_updated_at: "2017-07-24 04:37:43"},
  {album_id: 1, title: nil, description: nil, is_private: false, like_count: 0, image_file_name: "voi.jpg", image_content_type: "image/jpeg", image_file_size: 130279, image_updated_at: "2017-07-24 04:37:43"}
])
