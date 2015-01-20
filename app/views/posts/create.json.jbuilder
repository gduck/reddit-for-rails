json.post do
  json.id @post.id
  json.title @post.title
  json.url @post.url
  json.link url_for(post_path(@post))
  json.useremail @post.user.email
  json.createdat @post.created_at
end