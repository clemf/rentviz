require 'rails_helper'

describe ThreetapsWrapper, :vcr => true do
  it 'returns posts when given correct parameters' do
    result = ThreetapsWrapper.search(metro_code: 'USA-POR',
                                     category: 'RHFR',
                                     retvals: 'price')
    parsed_result = JSON.parse result
    expect(parsed_result['postings'].count).to eq 10
  end
end
