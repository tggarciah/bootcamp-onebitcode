require 'rails_helper'

RSpec.describe 'Admin::V1::Licenses as :client', type: :request do
  let(:user) { create(:user, profile: :client) }
  let(:game) { create(:game) }

  context 'GET /games/:game_id/licenses' do
    let(:url) { "/admin/v1/games/#{game.id}/licenses" }
    let!(:licenses) { create_list(:license, 5, game: game) }

    before(:each) { get url, headers: auth_header(user) }
    include_examples 'forbidden access' # com essa chamada estamos incluido os it do arquivo forbidden_access_example.rb
  end

  context 'POST /games/:game_id/licenses' do
    let(:url) { "/admin/v1/games/#{game.id}/licenses" }

    before(:each) { post url, headers: auth_header(user) }
    include_examples 'forbidden access' # com essa chamada estamos incluido os it do arquivo forbidden_access_example.rb
  end

  context 'GET /licenses/:id' do
    let(:url) { "/admin/v1/licenses/#{license.id}" }
    let!(:license) { create(:license) }

    before(:each) { get url, headers: auth_header(user) }
    include_examples 'forbidden access' # com essa chamada estamos incluido os it do arquivo forbidden_access_example.rb
  end

  context 'PATCH /licenses/:id' do
    let(:license) { create(:license) }
    let(:url) { "/admin/v1/licenses/#{license.id}" }

    before(:each) { patch url, headers: auth_header(user) }
    include_examples 'forbidden access' # com essa chamada estamos incluido os it do arquivo forbidden_access_example.rb
  end

  context 'DELETE /licenses/:id' do
    let(:license) { create(:license) }
    let(:url) { "/admin/v1/licenses/#{license.id}" }

    before(:each) { delete url, headers: auth_header(user) }
    include_examples 'forbidden access' # com essa chamada estamos incluido os it do arquivo forbidden_access_example.rb
  end
end
