puts 'Gerando heroes...'

5.times do |i|
  Hero.create(
    name: ["wolverine", "bishop", "morfo"].sample ,
    description: "heroi marvel"
    )
end

puts 'heroes gerados com sucesso!'