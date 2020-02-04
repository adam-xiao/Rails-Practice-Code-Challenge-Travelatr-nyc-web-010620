class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age,  numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def total_likes
        self.posts.sum { |post| post.likes }
    end
    
    def most_likes
        self.posts.max_by{ |post| post.likes }
    end

    def top_five
        destination_posts = self.posts.destination_id
        freq = destination_posts.reduce(Hash.new(0)) { |k,v| k[v] += 1; k }
        destination_posts.max_by(5) { |v| freq[v] }
    end
end
