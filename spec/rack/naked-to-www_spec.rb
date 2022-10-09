# frozen_string_literal: true

RSpec.describe Rack::NakedToWww do
  let(:http_host) { "dotenv.org" }

  let(:env) do
    {
      "HTTP_HOST" => http_host
    }
  end

  let(:app) { double("call") }

  let(:instance) { ::Rack::NakedToWww.new(app) }

  it "has a version number" do
    expect(Rack::NakedToWww::VERSION).not_to be nil
  end

  describe "#naked" do
    it "returns true" do
      result = instance.send(:naked?, env)

      expect(result).to eql(true)
    end

    context "when domain is not naked" do
      let(:http_host) { "www.dotenv.org" }

      it "returns false" do
        result = instance.send(:naked?, env)

        expect(result).to eql(false)
      end
    end

    context "other domain" do
      let(:http_host) { "ui.dotenv.org" }

      it "returns false" do
        result = instance.send(:naked?, env)

        expect(result).to eql(false)
      end
    end
  end
end
