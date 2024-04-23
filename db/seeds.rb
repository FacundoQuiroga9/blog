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
  {name: "Steven Gerrard", birthday: "30/05/1980", games: 1, goals: 0, debut: "29/11/1998", description: "Steven George Gerrard es un exfutbolista y entrenador inglés. Jugaba de centrocampista y su último equipo fue Los Angeles Galaxy de la Major League Soccer de Estados Unidos. Es considerado uno de los mejores centrocampistas de la historia del fútbol."},
  {name: "Kenny Dalglish", birthday: "04/03/1951", games: 2, goals: 50, debut: "20/08/1977", description: "Kenneth Mathieson Dalglish, más conocido como Kenny Dalglish, es un exfutbolista y entrenador escocés. Jugaba de delantero y su último equipo fue el Liverpool Football Club de la Premier League de Inglaterra. Es considerado uno de los mejores futbolistas escoceses de la historia."},
  {name: "Ian Rush", birthday: "20/10/1961", games: 3, goals: 40, debut: "13/12/1980", description: "Ian James Rush, más conocido como Ian Rush, es un exfutbolista galés. Jugaba de delantero y su último equipo fue el Sydney Olympic de la National Soccer League de Australia. Es considerado uno de los mejores delanteros de la historia del fútbol galés."},
  {name: "Jamie Carragher", birthday: "28/01/1978", games: 4, goals: 30, debut: "08/01/1997", description: "James Lee Duncan Carragher, más conocido como Jamie Carragher, es un exfutbolista y comentarista deportivo inglés. Jugaba de defensa y su último equipo fue el Liverpool Football Club de la Premier League de Inglaterra. Es considerado uno de los mejores defensas de la historia del fútbol inglés."},
  {name: "Michael Owen", birthday: "14/12/1979", games: 5, goals: 20, debut: "06/05/1997", description: "Michael James Owen, más conocido como Michael Owen, es un exfutbolista y comentarista deportivo inglés. Jugaba de delantero y su último equipo fue el Stoke City Football Club de la Premier League de Inglaterra. Es considerado uno de los mejores delanteros de la historia del fútbol inglés."},
  {name: "Robbie Fowler", birthday: "09/04/1975", games: 6, goals: 10, debut: "22/09/1993", description: "Robert Bernard Fowler, más conocido como Robbie Fowler, es un exfutbolista y entrenador inglés. Jugaba de delantero y su último equipo fue el Perth Glory Football Club de la A-League de Australia. Es considerado uno de los mejores delanteros de la historia del fútbol inglés."},
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
