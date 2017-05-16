require 'spec_helper'

RSpec.describe Justimmo::Config do
  USERPASS = { username: 'user', password: 'pass' }.freeze

  it 'validates configuration' do
    expect { Justimmo::Config.new }.to raise_error(Justimmo::Config::ConfigurationError)
    expect { Justimmo::Config.new(USERPASS) }.not_to raise_error
  end

  it 'has default settings' do
    config = Justimmo::Config.new(USERPASS)

    expect(config.base_url).to eq('https://api.justimmo.at/rest')
    expect(config.api_ver).to eq(1)
    expect(config.debug?).to eq(false)
    expect(config.on_mapper_error).to eq(:mark)
  end

  it 'encodes credentials' do
    config = Justimmo::Config.new(USERPASS)

    expect(config.credentials).to eq('dXNlcjpwYXNz')
  end

  it 'returns an url based on version' do
    config = Justimmo::Config.new(USERPASS)

    expect(config.url).to eq('https://api.justimmo.at/rest/v1')

    config.api_ver = 2
    expect(config.url).to eq('https://api.justimmo.at/rest/v2')
  end

  it 'can set global config' do
    Justimmo::Config.configure(USERPASS)

    expect(Justimmo::Config.username).to eq(USERPASS[:username])
    expect(Justimmo::Config.password).to eq(USERPASS[:password])

    Justimmo::Config.clear

    expect(Justimmo::Config.username).to eq(nil)
    expect(Justimmo::Config.password).to eq(nil)
  end
end
