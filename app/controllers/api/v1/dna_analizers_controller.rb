class Api::V1::DnaAnalizersController < ApplicationController
  before_action :initialize_or_find, only: %i[mutant]
  def mutant
    if @dna_analizer.save
      render json: @dna_analizer, status: :ok, code: '200'
    else
      render json: @dna_analizer.errors, status: :unprocessable_entity, code: '422'
    end
  end

  def stat; end

  private

  def initialize_or_find
    @dna_analizer = DnaAnalizer.find_by(dna: params[:dna])
    @dna_analizer = DnaAnalizer.new(dna: params[:dna]) if @dna_analizer.nil?
  end
end
