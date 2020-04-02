# t.string "title"
# t.string "artist"
# t.integer "rating"
# t.boolean "is_popular"

Song.create(title: "another song", artist: "artist", rating: 10, is_popular: true)
Song.create(title: "song 1", artist: "artist 1", rating: 6, is_popular: false)
Song.create(title: "song 2", artist: "artist 2", rating: 10, is_popular: false)
Song.create(title: "song 3", artist: "artist 2", rating: 5, is_popular: false)
Song.create(title: "song 4", artist: "artist 2", rating: 7, is_popular: false)
Song.create(title: "song 5", artist: "artist 2", rating: 7, is_popular: false)
Song.create(title: "song 6", artist: "artist 2", rating: 7, is_popular: false)
Song.create(title: "song 7", artist: "artist 3", rating: 7, is_popular: true)
Song.create(title: "song 8", artist: "artist 4", rating: 1, is_popular: true)
Song.create(title: "song 9", artist: "artist 2", rating: 0, is_popular: true)
Song.create(title: "song 10", artist: "artist 1", rating: 2, is_popular: true)
Song.create(title: "song 11", artist: "artist", rating: 4, is_popular: true)

Genre.create(name: "rap")
Genre.create(name: "rock")
Genre.create(name: "jazz")
