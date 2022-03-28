class Api::V1::DnaAnalizersController < ApplicationController
  include SequenceAnalyzer
  before_action :initialize_or_find, only: %i[mutant]

  def mutant
    if @dna_analizer.save
      if @dna_analizer
        render json: { is_mutant:  @dna_analizer.is_mutant, status: :ok, code: '200' }
      else
        render json: { is_mutant:  @dna_analizer.is_mutant, status: :forbidden, code: '403' }
      end
    else
      render json: @dna_analizer.errors, status: :unprocessable_entity, code: '422'
    end
  end

  def stats
    count_mutant_dna = count_mutant_dna(DnaAnalizer.all)
    count_human_dna = count_human_dna(DnaAnalizer.all)
    render json: { count_mutant_dna: count_mutant_dna,
                   count_human_dna: count_human_dna,
                   ratio: ratio(count_human_dna, count_mutant_dna), status: :ok, code: '200' }
  end

  private

  def initialize_or_find
    @dna_analizer = DnaAnalizer.find_by(dna: params[:dna])
    @dna_analizer = DnaAnalizer.new(dna: params[:dna]) if @dna_analizer.nil?
  end
end
