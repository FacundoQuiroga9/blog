Post.destroy_all

user = User.first

post_titles = [
  "La historia del Liverpool FC",
  "Los mejores jugadores en la historia del Liverpool",
  "Análisis táctico del Liverpool de Klopp",
  "La rivalidad entre el Liverpool y el Manchester United",
  "El estadio de Anfield: El hogar del Liverpool FC",
  "Las conquistas europeas del Liverpool",
  "El renacimiento del Liverpool bajo Jürgen Klopp",
  "Los mejores momentos de la temporada del Liverpool",
  "Los ídolos y leyendas del Liverpool FC",
  "El futuro del Liverpool: Expectativas y desafíos"
]

post_titles.each do |title|
  post = Post.create(
    title: title,
    description: "Esta es una publicación de prueba",
    user: user,
    created_at: Faker::Time.backward(days: 60)
  )

  # Asegúrate de que el post se ha creado correctamente antes de intentar adjuntar la imagen
  if post.persisted?
    filename = I18n.transliterate(title).parameterize
    file_path = Rails.root.join('public', 'images', 'posts', "#{filename}.jpg")
    if File.exist?(file_path)
      file = File.open(file_path)
      post.image.attach(io: file, filename: "#{filename}.jpg", content_type: 'image/jpeg')
      file.close
    else
      puts "Archivo no encontrado: #{file_path}"
    end
  end
end

puts "¡Se han creado 10 publicaciones sobre el Liverpool Football Club!"

Player.destroy_all

players = [
  {name: "Steven Gerrard", birthday: "30/05/1980", games: 1, goals: 0, debut: "29/11/1998", description: "Steven George Gerrard es un exfutbolista y entrenador inglés. Jugaba de centrocampista y su último equipo fue Los Angeles Galaxy de la Major League Soccer de Estados Unidos. Es considerado uno de los mejores centrocampistas de la historia del fútbol."},
  {name: "Kenny Dalglish", birthday: "04/03/1951", games: 2, goals: 50, debut: "20/08/1977", description: "Kenneth Mathieson Dalglish, más conocido como Kenny Dalglish, es un exfutbolista y entrenador escocés. Jugaba de delantero y su último equipo fue el Liverpool Football Club de la Premier League de Inglaterra. Es considerado uno de los mejores futbolistas escoceses de la historia."},
  {name: "Ian Rush", birthday: "20/10/1961", games: 3, goals: 40, debut: "13/12/1980", description: "Ian James Rush, más conocido como Ian Rush, es un exfutbolista galés. Jugaba de delantero y su último equipo fue el Sydney Olympic de la National Soccer League de Australia. Es considerado uno de los mejores delanteros de la historia del fútbol galés."},
  {name: "Jamie Carragher", birthday: "28/01/1978", games: 4, goals: 30, debut: "08/01/1997", description: "James Lee Duncan Carragher, más conocido como Jamie Carragher, es un exfutbolista y comentarista deportivo inglés. Jugaba de defensa y su último equipo fue el Liverpool Football Club de la Premier League de Inglaterra. Es considerado uno de los mejores defensas de la historia del fútbol inglés.", image: "https://res.cloudinary.com/dqfz2zvzv/image/upload/v1623680134/football-players/jamie-carragher.jpg"},
  {name: "Michael Owen", birthday: "14/12/1979", games: 5, goals: 20, debut: "06/05/1997", description: "Michael James Owen, más conocido como Michael Owen, es un exfutbolista y comentarista deportivo inglés. Jugaba de delantero y su último equipo fue el Stoke City Football Club de la Premier League de Inglaterra. Es considerado uno de los mejores delanteros de la historia del fútbol inglés."},
  {name: "Robbie Fowler", birthday: "09/04/1975", games: 6, goals: 10, debut: "22/09/1993", description: "Robert Bernard Fowler, más conocido como Robbie Fowler, es un exfutbolista y entrenador inglés. Jugaba de delantero y su último equipo fue el Perth Glory Football Club de la A-League de Australia. Es considerado uno de los mejores delanteros de la historia del fútbol inglés."},
  {name: "Fernando Torres", birthday: "20/03/1984", games: 7, goals: 5, debut: "28/07/2007", description: "Fernando José Torres Sanz, más conocido como Fernando Torres, es un exfutbolista español. Jugaba de delantero y su último equipo fue el Sagan Tosu de la J1 League de Japón. Es considerado uno de los mejores delanteros de la historia del fútbol español."},
  {name: "Luis Suárez", birthday: "24/01/1987", games: 8, goals: 3, debut: "02/02/2011", description: "Luis Alberto Suárez Díaz, más conocido como Luis Suárez, es un futbolista uruguayo. Juega de delantero y su equipo actual es el Atlético de Madrid de la LaLiga de España. Es considerado uno de los mejores delanteros de la historia del fútbol uruguayo."},
  {name: "Mohamed Salah", birthday: "15/06/1992", games: 9, goals: 2, debut: "12/08/2017", description: "Mohamed Salah Hamed Mahrous Ghaly, más conocido como Mohamed Salah, es un futbolista egipcio. Juega de delantero y su equipo actual es el Liverpool Football Club de la Premier League de Inglaterra. Es considerado uno de los mejores delanteros de la historia del fútbol egipcio."},
  {name: "Virgil van Dijk", birthday: "08/07/1991", games: 10, goals: 1, debut: "12/01/2018", description: "Virgil van Dijk es un futbolista neerlandés. Juega de defensa y su equipo actual es el Liverpool Football Club de la Premier League de Inglaterra. Es considerado uno de los mejores defensas de la historia del fútbol neerlandés."},
  {name: "Alisson", birthday: "02/10/1992", games: 11, goals: 0, debut: "12/08/2018", description: "Alisson Ramsés Becker, más conocido como Alisson, es un futbolista brasileño. Juega de portero y su equipo actual es el Liverpool Football Club de la Premier League de Inglaterra. Es considerado uno de los mejores porteros de la historia del fútbol brasileño."},
  {name: "Sadio Mané", birthday: "10/04/1992", games: 12, goals: 0, debut: "14/08/2016", description: "Sadio Mané es un futbolista senegalés. Juega de delantero y su equipo actual es el Liverpool Football Club de la Premier League de Inglaterra. Es considerado uno de los mejores delanteros de la historia del fútbol senegalés."},
  {name: "Roberto Firmino", birthday: "02/10/1991", games: 13, goals: 0, debut: "12/08/2015", description: "Roberto Firmino Barbosa de Oliveira, más conocido como Roberto Firmino, es un futbolista brasileño. Juega de delantero y su equipo actual es el Liverpool Football Club de la Premier League de Inglaterra. Es considerado uno de los mejores delanteros de la historia del fútbol brasileño."},
  {name: "Trent Alexander-Arnold", birthday: "07/10/1998", games: 14, goals: 0, debut: "25/10/2016", description: "Trent Alexander-Arnold es un futbolista inglés. Juega de defensa y su equipo actual es el Liverpool Football Club de la Premier League de Inglaterra. Es considerado uno de los mejores defensas de la historia del fútbol inglés."},
  {name: "Andrew Robertson", birthday: "11/03/1994", games: 15, goals: 0, debut: "26/08/2017", description: "Andrew Robertson es un futbolista escocés. Juega de defensa y su equipo actual es el Liverpool Football Club de la Premier League de Inglaterra. Es considerado uno de los mejores defensas de la historia del fútbol escocés."},
  {name: "Jordan Henderson", birthday: "17/06/1990", games: 16, goals: 0, debut: "15/08/2011", description: "Jordan Henderson es un futbolista inglés. Juega de centrocampista y su equipo actual es el Liverpool Football Club de la Premier League de Inglaterra. Es considerado uno de los mejores centrocampistas de la historia del fútbol inglés."},
  {name: "Georginio Wijnaldum", birthday: "11/11/1990", games: 17, goals: 0, debut: "14/08/2016", description: "Georginio Wijnaldum es un futbolista neerlandés. Juega de centrocampista y su equipo actual es el Liverpool Football Club de la Premier League de Inglaterra. Es considerado uno de los mejores centrocampistas de la historia del fútbol neerlandés."},
  {name: "James Milner", birthday: "04/01/1986", games: 18, goals: 0, debut: "13/08/2002", description: "James Milner es un futbolista inglés. Juega de centrocampista y su equipo actual es el Liverpool Football Club de la Premier League de Inglaterra. Es considerado uno de los mejores centrocampistas de la historia del fútbol inglés."},
  {name: "Xabi Alonso", birthday: "25/11/1981", games: 19, goals: 0, debut: "15/08/2004", description: "Xabier Alonso Olano, más conocido como Xabi Alonso, es un exfutbolista y entrenador español. Jugaba de centrocampista y su último equipo fue el Bayern de Múnich de la Bundesliga de Alemania. Es considerado uno de los mejores centrocampistas de la historia del fútbol español."},
  {name: "Dietmar Hamann", birthday: "27/08/1973", games: 20, goals: 0, debut: "09/08/1999", description: "Dietmar Johann Wolfgang Hamann, más conocido como Dietmar Hamann, es un exfutbolista y entrenador alemán. Jugaba de centrocampista y su último equipo fue el Milton Keynes Dons Football Club de la League One de Inglaterra. Es considerado uno de los mejores centrocampistas de la historia del fútbol alemán."},
  {name: "John Barnes", birthday: "07/11/1963", games: 21, goals: 0, debut: "15/08/1987", description: "John Charles Bryan Barnes, más conocido como John Barnes, es un exfutbolista y entrenador jamaicano-británico. Jugaba de centrocampista y su último equipo fue el Charlton Athletic Football Club de la League One de Inglaterra. Es considerado uno de los mejores centrocampistas de la historia del fútbol jamaicano-británico."},
  {name: "Ian Callaghan", birthday: "10/04/1942", games: 22, goals: 0, debut: "16/04/1960", description: "Ian Robert Callaghan, más conocido como Ian Callaghan, es un exfutbolista inglés. Jugaba de centrocampista y su último equipo fue el Swansea City Association Football Club de la Football League Championship de Inglaterra. Es considerado uno de los mejores centrocampistas de la historia del fútbol inglés."},
  {name: "Ray Clemence", birthday: "05/08/1948", games: 23, goals: 0, debut: "15/08/1967", description: "Raymond Neal Clemence, más conocido como Ray Clemence, es un exfutbolista y entrenador inglés. Jugaba de portero y su último equipo fue el Tottenham Hotspur Football Club de la Premier League de Inglaterra. Es considerado uno de los mejores porteros de la historia del fútbol inglés."},
  {name: "Bruce Grobbelaar", birthday: "06/10/1957", games: 24, goals: 0, debut: "29/08/1981", description: "Bruce David Grobbelaar, más conocido como Bruce Grobbelaar, es un exfutbolista y entrenador zimbabuense. Jugaba de portero y su último equipo fue el Glasshoughton Welfare Association Football Club de la Northern Counties East Football League de Inglaterra. Es considerado uno de los mejores porteros de la historia del fútbol zimbabuense."},
  {name: "Emlyn Hughes", birthday: "28/08/1947", games: 25, goals: 0, debut: "15/08/1967", description: "Emlyn Walter Hughes, más conocido como Emlyn Hughes, es un exfutbolista y entrenador inglés. Jugaba de defensa y su último equipo fue el Rotherham United Football Club de la League One de Inglaterra. Es considerado uno de los mejores defensas de la historia del fútbol inglés."},
  {name: "Phil Neal", birthday: "20/02/1951", games: 26, goals: 0, debut: "15/08/1974", description: "Philip George Neal, más conocido como Phil Neal, es un exfutbolista y entrenador inglés. Jugaba de defensa y su último equipo fue el Bolton Wanderers Football Club de la League One de Inglaterra. Es considerado uno de los mejores defensas de la historia del fútbol inglés."},
  {name: "Alan Hansen", birthday: "13/06/1955", games: 27, goals: 0, debut: "15/08/1977", description: "Alan David Hansen, más conocido como Alan Hansen, es un exfutbolista y entrenador escocés. Jugaba de defensa y su último equipo fue el Partick Thistle Football Club de la Scottish Premiership de Escocia. Es considerado uno de los mejores defensas de la historia del fútbol escocés."},
  {name: "Mark Lawrenson", birthday: "02/06/1957", games: 28, goals: 0, debut: "15/08/1981", description: "Mark Thomas Lawrenson, más conocido como Mark Lawrenson, es un exfutbolista y comentarista deportivo inglés. Jugaba de defensa y su último equipo fue el Tampa Bay Rowdies de la North American Soccer League de Estados Unidos. Es considerado uno de los mejores defensas de la historia del fútbol inglés."},
  {name: "Tommy Smith", birthday: "05/04/1945", games: 29, goals: 0, debut: "15/08/1962", description: "Thomas Smith, más conocido como Tommy Smith, es un exfutbolista y entrenador inglés. Jugaba de defensa y su último equipo fue el Swansea City Association Football Club de la Football League Championship de Inglaterra. Es considerado uno de los mejores defensas de la historia del fútbol inglés."},
  {name: "Ron Yeats", birthday: "15/11/1937", games: 30, goals: 0, debut: "15/08/1961", description: "Ronald Yeats, más conocido como Ron Yeats, es un exfutbolista y entrenador escocés. Jugaba de defensa y su último equipo fue el Tranmere Rovers Football Club de la League Two de Inglaterra. Es considerado uno de los mejores defensas de la historia del fútbol escocés."},
]

players.each do |player_data|
  player = Player.create!(
    name: player_data[:name],
    birthday: player_data[:birthday],
    games: player_data[:games],
    goals: player_data[:goals],
    debut: player_data[:debut],
    description: player_data[:description]
  )

  if player.persisted?
    filename = I18n.transliterate(player.name).parameterize
    file_path = Rails.root.join('public', 'images', 'players', "#{filename}.jpg")
    if File.exist?(file_path)
      file = File.open(file_path)
      player.photo.attach(io: file, filename: "#{filename}.jpg", content_type: 'image/jpeg')
      file.close
    else
      puts "Archivo no encontrado: #{file_path}"
    end
  end
end

puts "¡Se han creado #{players.length} jugadores con imágenes asociadas!"
