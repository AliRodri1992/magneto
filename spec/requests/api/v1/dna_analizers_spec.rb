require 'swagger_helper'

RSpec.describe 'api/v1/stats', type: :request do
  get 'Retrieves all dna statistics' do
    tags 'STATS'

    response '200', 'Stats found' do
      before { create_list(:dna_analizer, 2) } # if you have a factory to create models (cf gem FactoryBot)

      include_context 'with integration test'
    end
  end
end