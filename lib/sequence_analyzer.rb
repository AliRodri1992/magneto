# secuence_analyzer.rb
module SequenceAnalyzer
  def search_sequence(dna)
    puts 'Esto es un metodo desde lib'
    puts "SECUENCIA DE ADN:"
    multidimensional_adn = JSON.parse(dna).map(&:chars)
  end
end
