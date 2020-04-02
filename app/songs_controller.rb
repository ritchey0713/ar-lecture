# CRUD OPS 

#SHOW action 
#UPDATE 
#DELETE 

class SongsController 

  def self.run 
    puts "Hello!"
    self.options
  end

  def self.options 
    puts "What do you want to do?"
    input = gets.strip
    case input 
      when "create song"
        self.create_song 
      
      when "create genre"
        self.create_genre
        
      when "list songs"
        self.list_songs
        
      when "list genres"
        self.list_genres
    end 
    self.options
  end 

  def self.create_song
    puts "list song title, artist name, and rating"
    input = gets.strip 
    song_name, artist_name, rating = input.split(", ")
    song = Song.create(title: song_name, artist: artist_name, rating: rating)
    puts "#{song.title} by #{song.artist} with a rating of #{song.rating}"
  end 

  def self.create_genre
    puts "what is the genre name?"
    input = gets.strip 
    genre = Genre.new(name: input)
    genre.save 
    puts "a new genre called #{genre.name} was saved!"
  end 

  def self.list_songs 
    Song.all.each do |song|
      puts "#{song.id}: #{song.title} by #{song.artist} with a rating of #{song.rating}"
    end 
    puts "Options include: show, update, delete"
    input = gets.strip
    if input.downcase == "show"
      id = gets.strip
      self.show_song(id)
    elsif input.downcase == "update"
      id = gets.strip 
      self.update_song(id)
    elsif input.downcase == "delete"
      id = gets.strip 
      self.delete_song(id)
    end 
  end 

  def self.show_song(id)
    song = Song.find(id)
    if song 
      puts "#{song.title} by #{song.artist} with a rating of #{song.rating}"
    end 
  end 

  def self.update_song(id)
    song = Song.find_by(id: id)
    puts "what are we gonna update?"
    input = gets.strip 
    hash_key, hash_value = input.split(", ")
    update_hash = {
      hash_key => hash_value
    }
    
    if hash_value
      song.update(update_hash)
      puts "updated #{hash_key} to #{hash_value}"
      puts "#{song.title} by #{song.artist} with a rating of #{song.rating}"
    end 
  end 

  def self.delete_song(id)
    song = Song.find(id)
    song.destroy
  end 

  def self.list_genres
    Genre.all.each do |genre|
      puts "#{genre.id}: #{genre.name}"
    end 
    puts "Options include: show, update, delete"
    input = gets.strip
    if input.downcase == "show"
      id = gets.strip
      self.show_genre(id)
    elsif input.downcase == "update"
      id = gets.strip 
      self.update_genre(id)
    elsif input.downcase == "delete"
      id = gets.strip 
      self.delete_song(id)
    end 
  end 

  def self.show_genre(id)
    genre = Genre.find(id)
    puts "Genre: #{genre.name}"
    puts "SONGS: "
    genre.songs.each do |song|
      puts "#{song.title} by #{song.artist} with a rating of #{song.rating}"
    end
    puts "Options include: view song, create song"
    input = gets.strip 
    if input == "view song"
      self.show_song(id) 
    elsif input == "create song"
      puts "song info"
      input = gets.strip
      song_name, artist_name, rating = input.split(", ")
      genre.songs.build(title: song_name, artist: artist_name, rating: rating).save
      puts genre.songs[-1].title
      # Song.new(title: "a new song", genre_id: 1)
    end 
  end 

  def self.update_genre(id)
    genre = Genre.find_by(id: id)
    puts "what are we gonna update?"
    input = gets.strip 
    hash_key, hash_value = input.split(", ")
    update_hash = {
      hash_key => hash_value
    }
    
    if hash_value
      genre.update(update_hash)
      puts "updated #{hash_key} to #{hash_value}"
      puts "#{genre.name}"
    end 
  end 

  def self.delete_genre(id)
    genre = Genre.find(id)
    genre.destroy
  end 

  
end 