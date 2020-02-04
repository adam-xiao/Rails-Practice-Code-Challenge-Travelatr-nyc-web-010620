class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent
        self.posts.last(5)
    end

    def most_likes
        self.posts.max_by{ |post| post.likes }
    end

    def avg_age
        dest_bloggers = self.bloggers.uniq
        dest_bloggers.sum{ |blogger| blogger.age } / dest_bloggers.size.to_f
    end

end
