require 'rails_helper'

RSpec.describe 'Api::V1::DnaAnalizers', type: :request do
  let!(:dna_analizer1) { create(:dna_analizer, dna: "'['AGGA','AACT','ACAT','AAAA']'", is_mutant: true) }
  let!(:dna_analizer2) { create(:dna_analizer, dna: "['ATGCGA','CAGTGC','TTATGT','AGAAGG','CCCCTA','TCACTG']", is_mutant: true) }
  let!(:dna_analizer3) { create(:dna_analizer, dna: '["ATGCGAC","CAGTGCA","TTATGTT","AGAAGGC","CCCCTAA","TCACTGA"]', is_mutant: true) }
  let!(:dna_analizer4) { create(:dna_analizer, dna: '["AAAAC","TTTAC","ATCAC","CCGAC","TTCAG"]', is_mutant: true) }
  let!(:dna_analizer5) { create(:dna_analizer, dna: '["AAAA","TTTT","ATCG","CCGT"]', is_mutant: true) }
  let!(:dna_analizer6) { create(:dna_analizer, dna: '["ATAC","CGGA","GTAC","TTCA"]', is_mutant: false) }
  let!(:dna_analizer7) { create(:dna_analizer, dna: '["ATAC","CGGA","GTAC","TTCA"]', is_mutant: false) }
  let!(:dna_analizer8) { create(:dna_analizer, dna: '["ATAC","CGGA","GTAC","TTCA"]', is_mutant: false) }
  let!(:dna_analizer9) { create(:dna_analizer, dna: '["ATAC","CGGA","GTAC","TTCA"]', is_mutant: false) }
  let!(:dna_analizer10) { create(:dna_analizer, dna: '["ATAC","CGGA","GTAC","TTCA"]', is_mutant: false) }

  path '/api/v1/stats', type: :request do
    get('list stats') do
      response(200, 'successful') do
        tags 'Stats'
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
      end
    end
  end

  describe 'POST /mutant' do
    it 'returns an HTTP 200-OK, in case of verifying if it is mutant' do
      post '/api/v1/mutant'
      expect(response).to have_http_status(:success)
    end
  end
end
