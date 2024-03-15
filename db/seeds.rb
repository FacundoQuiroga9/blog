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
    content: Faker::Lorem.paragraphs(number: rand(3..6)).join("\n"),
    user_id: user.id,
    created_at: Faker::Time.backward(days: 60)
  )
end

puts "¡Se han creado 10 publicaciones sobre el Liverpool Football Club!"
