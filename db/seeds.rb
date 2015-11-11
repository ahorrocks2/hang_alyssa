player_list = [
  [ "Jackie Chan", "http://cdn.pastemagazine.com/www/articles/Jackie%20Chan.jpg" ],
  [ "Diana Nyad", "http://a4.files.biography.com/image/upload/c_fill,cs_srgb,dpr_1.0,g_face,h_300,q_80,w_300/MTE5NDg0MDU1NDA5ODIxMTk5.jpg" ],
  [ "Kanye West", "http://imh.ulximg.com/image/300x300/artist/1392767355_2048795ba3f4dc991a1fc473b51f1d8b.jpg/aaf8bc7f6eab3f73df8d833d2c07308c/1392767355_kanye_west_46.jpg" ],
  [ "Harry Potter", "http://pictures.directnews.co.uk/liveimages/cybercriminals+are+targeting+harry+potter+fans_3528_800232164_0_0_7049051_300.jpg"],
  [ "Socrates", "http://ksmleadership.com/wp-content/uploads/2013/07/socrates300.png"],
  [ "Beyonce", "http://blogs-images.forbes.com/lancemadden/files/2012/10/Beyonce.jpg" ]
]

player_list.each do |name, url|
  Player.create( name: name, url: url )
end
