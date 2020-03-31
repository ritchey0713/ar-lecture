class Song < ActiveRecord::Base
  belongs_to :genre

  def self.get_popular_songs
    self.where('is_popular = ?', true)
  end 

def self.get_highest_rated 
  self.where('rating > ?', 9).first
end 

def self.order_by_highest_rating 
  self.order(rating: :desc)
end 

def self.add_all_rating
  self.sum(:rating)
end 

def get_ratings_by_user_input(input)
  self.where('rating = ?', input)
end 


end 

## common AR methods 

# song.save

# Song.create

# Song.all 

# Song.first 

# Song.find(7) 

# Song.find_by(title: "new song")