require 'rails_helper'

RSpec.describe 'Admin::V1::Categories as :client', type: :request do
  let(:user) { create(:user, profile: :client) }

  context 'GET /categories' do
    let(:url) { '/admin/v1/categories' }
    let!(:categories) { create_list(:category, 5) }

    before(:each) { get url, headers: auth_header(user) }
    include_examples 'forbidden access' # com essa chamada estamos incluido os it do arquivo forbidden_access_example.rb
  end

  context 'GET /categories/:id' do
    let(:url) { "/admin/v1/categories/#{category.id}" }
    let!(:category) { create(:category) }

    before(:each) { get url, headers: auth_header(user) }
    include_examples 'forbidden access' # com essa chamada estamos incluido os it do arquivo forbidden_access_example.rb
  end

  context 'POST /categories' do
    let(:url) { '/admin/v1/categories' }

    before(:each) { post url, headers: auth_header(user) }
    include_examples 'forbidden access' # com essa chamada estamos incluido os it do arquivo forbidden_access_example.rb
  end

  context 'PATCH /categories/:id' do
    let(:category) { create(:category) }
    let(:url) { "/admin/v1/categories/#{category.id}" }

    before(:each) { patch url, headers: auth_header(user) }
    include_examples 'forbidden access' # com essa chamada estamos incluido os it do arquivo forbidden_access_example.rb
  end

  context 'DELETE /categories/:id' do
    let(:category) { create(:category) }
    let(:url) { "/admin/v1/categories/#{category.id}" }

    before(:each) { delete url, headers: auth_header(user) }
    include_examples 'forbidden access' # com essa chamada estamos incluido os it do arquivo forbidden_access_example.rb
  end
end
