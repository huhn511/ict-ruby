require 'spec_helper'

describe Ict do

  before do
    @api = Ict::Api.new({url: "http://localhost:2187", password: 'testtest'})
  end

  context 'getConfig' do

    it 'should return a config object' do
      response = @api.getConfig()

      expect(response).not_to be("")
      expect(response).not_to be(false)
      expect(response).to include("max_heap_size", "round_duration", "max_forward_delay",
        "anti_spam_abs", "gui_port", "tangle_capacity", "gui_password", "port", "neighbors",
        "name", "host", "gui_enabled", "min_forward_delay")

    end

  end

end
