# secuence_analyzer.rb
module SequenceAnalyzer
  def search_sequence(dna)
    multidimensional_adn = JSON.parse(dna).map(&:chars)
    count_mutant_sequence = 0
    (0..multidimensional_adn.size - 1).each do |i|
      (0..multidimensional_adn[i].size - 1).each do |j|
        count_mutant_sequence += 1 if horizontal_processor(i, j, multidimensional_adn[i][j], multidimensional_adn)
        count_mutant_sequence += 1 if vertical_processor(i, j, multidimensional_adn[i][j], multidimensional_adn)
        count_mutant_sequence += 1 if diagonal_processor(i, j, multidimensional_adn[i][j], multidimensional_adn)
        count_mutant_sequence += 1 if diagonal_inverter_processor(i, j, multidimensional_adn)
      end
    end

    Rails.logger.debug 'Contador'
    Rails.logger.debug count_mutant_sequence
    count_mutant_sequence > 1
  end

  def horizontal_processor(i, j, value_to_check, dna)
    (1..3).each do |x|
      return false if j + x > dna.size - 1

      return false if dna[i][j + x] != value_to_check
    end
    true
  end

  def vertical_processor(i, j, value_to_check, dna)
    (1..3).each do |y|
      return false if i + y > dna.size - 1

      return false if dna[i + y][j] != value_to_check
    end
    true
  end

  def diagonal_processor(i, j, value_to_check, dna)
    (1..3).each do |x|
      return false if j + x > dna.size - 1 || i + x > dna.size - 1
      return false if dna[i + x][j + x] != value_to_check
    end
    true
  end

  def diagonal_inverter_processor(i, j, dna)
    value_to_check = dna[3][j]
    (1..3).each do |x|
      return false if x > dna.size - 1 || (i - x).negative?

      return false if dna[i - x][j + x] != value_to_check
    end
    true
  end

  def count_mutant_dna(dnas)
    count_mutant = 0
    dnas.each do |dna|
      count_mutant += 1 if dna.is_mutant == true
    end
    count_mutant
  end

  def count_human_dna(dnas)
    count_human = 0
    dnas.each do |dna|
      count_human += 1 if dna.is_mutant == false
    end
    count_human
  end

  def ratio(count_human_dna, count_mutant_dna)
    format('%.2f', Float(count_mutant_dna) / Float(count_human_dna))
  end
end
