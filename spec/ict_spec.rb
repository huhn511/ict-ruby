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

  context 'setConfig' do

    it 'should return true with valid config' do


      new_name = "new ict #{rand(1...42)}"

      new_valid_config = {
         :max_heap_size => "0.7",
         :round_duration => 60000,
         :max_forward_delay => 200,
         :anti_spam_abs => 1000,
         :gui_port => 2187,
         :tangle_capacity => 10000,
         :gui_password => "",
         :port => 1337,
         :neighbors => [""],
         :name => new_name,
         :host => "localhost",
         :gui_enabled => true,
         :min_forward_delay => 0
       }.to_json

      response = @api.setConfig(config: new_valid_config)

      expect(response).to eq({})

      response = @api.getConfig()
      expect(response["name"]).to eq(new_name)
    end

    it 'should return false with invalid config' do
      new_invalid_config = {
        invalid_attribute: "invalid_value"
      }
      response = @api.setConfig(new_invalid_config)

      expect(response).to eq({})
    end

  end

end
