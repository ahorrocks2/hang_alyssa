player_list = [
  [ "Einstein", "https://upload.wikimedia.org/wikipedia/commons/6/6f/Einstein-formal_portrait-35.jpg" ],
  [ "Diana Nyad", "http://whosyourshero.com/uploads/3/2/8/2/3282081/1534645_orig.jpg" ],
  [ "Santa", "http://mattfradd.com/wp-content/uploads/2013/12/santaclaus.jpg" ],
  [ "Will Smith", "http://b-i.forbesimg.com/scottmendelson/files/2013/06/i_am_legend_movie_image_will_smith__2_.jpg" ],
  [ "Harry Potter", "http://vignette2.wikia.nocookie.net/harrypotter/images/0/05/Harry_Potter_Scar.png/revision/latest?cb=20131023082955"],
  [ "Socrates", "http://media-2.web.britannica.com/eb-media/69/75569-004-3B260631.jpg"]
]

player_list.each do |name, url|
  Player.create( name: name, url: url )
end
