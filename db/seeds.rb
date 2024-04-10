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

# Crear las publicaciones
post_titles.each do |title|
  Post.create(
    title: title,
    user_id: user.id,
    created_at: Faker::Time.backward(days: 60)
  )
end

puts "¡Se han creado 10 publicaciones sobre el Liverpool Football Club!"

Player.destroy_all

players = [
  {name: "Steven Gerrard", birthday: "30/05/1980", games: 710, goals: 186, debut: "29/11/1998", description: "Steven George Gerrard es un exfutbolista y entrenador inglés. Jugaba de centrocampista y su último equipo fue Los Angeles Galaxy de la Major League Soccer de Estados Unidos. Es considerado uno de los mejores centrocampistas de la historia del fútbol."},
  {name: "Kenny Dalglish", birthday: "04/03/1951", games: 515, goals: 172, debut: "20/08/1977", description: "Kenneth Mathieson Dalglish, más conocido como Kenny Dalglish, es un exfutbolista y entrenador escocés. Jugaba de delantero y su último equipo fue el Liverpool Football Club de la Premier League de Inglaterra. Es considerado uno de los mejores futbolistas escoceses de la historia."},
  {name: "Ian Rush", birthday: "20/10/1961", games: 660, goals: 346, debut: "13/12/1980", description: "Ian James Rush, más conocido como Ian Rush, es un exfutbolista galés. Jugaba de delantero y su último equipo fue el Sydney Olympic de la National Soccer League de Australia. Es considerado uno de los mejores delanteros de la historia del fútbol galés."},
  {name: "Jamie Carragher", birthday: "28/01/1978", games: 737, goals: 5, debut: "08/01/1997", description: "James Lee Duncan Carragher, más conocido como Jamie Carragher, es un exfutbolista y comentarista deportivo inglés. Jugaba de defensa y su último equipo fue el Liverpool Football Club de la Premier League de Inglaterra. Es considerado uno de los mejores defensas de la historia del fútbol inglés."},
  {name: "Michael Owen", birthday: "14/12/1979", games: 326, goals: 158, debut: "06/05/1997", description: "Michael James Owen, más conocido como Michael Owen, es un exfutbolista y comentarista deportivo inglés. Jugaba de delantero y su último equipo fue el Stoke City Football Club de la Premier League de Inglaterra. Es considerado uno de los mejores delanteros de la historia del fútbol inglés."},
  {name: "Robbie Fowler", birthday: "09/04/1975", games: 369, goals: 183, debut: "22/09/1993", description: "Robert Bernard Fowler, más conocido como Robbie Fowler, es un exfutbolista y entrenador inglés. Jugaba de delantero y su último equipo fue el Perth Glory Football Club de la A-League de Australia. Es considerado uno de los mejores delanteros de la historia del fútbol inglés."},
  {name: "Fernando Torres", birthday: "20/03/1984", games: 212, goals: 81, debut: "11/08/2007", description: "Fernando José Torres Sanz, más conocido como Fernando Torres, es un exfutbolista español. Jugaba de delantero y su último equipo fue el Sagan Tosu de Japan. Es considerado uno de los mejores delanteros de la historia del fútbol español."},
  {name: "Luis Suárez", birthday: "24/01/1987", games: 133, goals: 82, debut: "02/02/2011", description: "Luis Alberto Suárez Díaz, más conocido como Luis Suárez, es un futbolista uruguayo. Juega de delantero y su equipo actual es el Atlético de Madrid de la Primera División de España. Es considerado uno de los mejores delanteros de la historia del fútbol uruguayo."},
  {name: "Mohamed Salah", birthday: "15/06/1992", games: 206, goals: 127, debut: "12/08/2017", description: "Mohamed Salah Hamed Mahrous Ghaly, más conocido como Mohamed Salah, es un futbolista egipcio. Juega de delantero y su equipo actual es el Liverpool Football Club de la Premier League de Inglaterra. Es considerado uno de los mejores delanteros de la historia del fútbol egipcio."},
  {name: "Sadio Mané", birthday: "10/04/1992", games: 177, goals: 97, debut: "14/08/2016", description: "Sadio Mané es un futbolista senegalés. Juega de delantero y su equipo actual es el Liverpool Football Club de la Premier League de Inglaterra. Es considerado uno de los mejores delanteros de la historia del fútbol senegalés."},
  {name: "Virgil van Dijk", birthday: "08/07/1991", games: 130, goals: 13, debut: "12/01/2018", description: "Virgil van Dijk es un futbolista neerlandés. Juega de defensa y su equipo actual es el Liverpool Football Club de la Premier League de Inglaterra. Es considerado uno de los mejores defensas de la historia del fútbol neerlandés."},
  {name: "Alisson", birthday: "02/10/1992", games: 130, goals: 0, debut: "12/08/2018", description: "Alisson Ramses Becker, más conocido como Alisson, es un futbolista brasileño. Juega de portero y su equipo actual es el Liverpool Football Club de la Premier League de Inglaterra. Es considerado uno de los mejores porteros de la historia del fútbol brasileño."},
]

begin
  # Crear los jugadores
  players.each do |player|
    Player.create!(
      name: player[:name],
      birthday: player[:birthday],
      games: player[:games],
      goals: player[:goals],
      debut: player[:debut],
      description: player[:description],
      photo: player[:photo]
    )
  end

  puts "¡Se han creado #{players.length} jugadores!"
rescue StandardError => e
  puts "Error al crear jugadores: #{e.message}"
end
