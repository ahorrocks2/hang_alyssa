player_list = [
  [ "Einstein", "http://pop.h-cdn.co/assets/cm/15/05/54cab1093129f_-_einstein_1010-md.jpg" ],
  [ "Diana Nyad", "http://a4.files.biography.com/image/upload/c_fill,cs_srgb,dpr_1.0,g_face,h_300,q_80,w_300/MTE5NDg0MDU1NDA5ODIxMTk5.jpg" ],
  [ "Santa", "http://cdn-jpg.allyou.com/sites/default/files/image/2014/01/300x300/i/2012/11/free-santa-photo-ictcrop-m.jpg" ],
  [ "Will Smith", "http://www.scified.com/sites_pics/2348620388449880.png" ],
  [ "Harry Potter", "http://pictures.directnews.co.uk/liveimages/cybercriminals+are+targeting+harry+potter+fans_3528_800232164_0_0_7049051_300.jpg"],
  [ "Socrates", "http://ksmleadership.com/wp-content/uploads/2013/07/socrates300.png"]
]

player_list.each do |name, url|
  Player.create( name: name, url: url )
end
