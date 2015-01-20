json.comment do
  json.comment @comment.comment
  json.user do
    json.email @comment.user.email
  end
  json.post_id @comment.post_id
end