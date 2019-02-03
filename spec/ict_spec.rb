require 'spec_helper'

describe Ict do

  before do
    @api = Ict::Api.new()
  end

  context 'getConfig' do

    it 'should return a config object' do
      response = @api.getConfig()
      pp response
      expect(response).not_to be("")
      expect(response).not_to be(nil)

    end

  end

end
