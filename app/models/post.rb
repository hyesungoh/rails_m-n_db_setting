class Post < ActiveRecord::Base
    # 댓글이 있다면 ?
    # has_many :comments, dependent: :destroy
    has_and_belongs_to_many :hashtags
end
