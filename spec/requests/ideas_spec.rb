require 'rails_helper'

RSpec.describe 'Ideas', type: :request do
  before do
    FactoryBot.create(:category, id: 10, name: 'test')
    FactoryBot.create(:idea, category_id: 10, body: 'body_test')
  end

  describe 'GETでcategory_nameが指定されている場合' do
    it 'category_nameがCategoryに1つある時、該当するものを返す' do
      get ideas_path, params: { category_name: 'test' }
      json = JSON.parse(response.body)
      expect(json.size).to eq 1
      expect(response).to have_http_status(200)
    end
    it 'category_nameがCategoryに複数ある時、該当するもの全てを返す' do
      FactoryBot.create(:idea, category_id: 10)
      get ideas_path, params: { category_name: 'test' }
      json = JSON.parse(response.body)
      expect(json.size).to eq 2
      expect(response).to have_http_status(200)
    end
    it 'category_nameがCategoryに無い時、404を返す' do
      get ideas_path, params: { category_name: 'new_test_name' }
      expect(response).to have_http_status(404)
    end
  end

  describe 'GETでcategory_nameが指定されていない場合' do
    it 'ideasを全て返す' do
      get ideas_path
      json = JSON.parse(response.body)
      expect(json.size).to eq Idea.count
      expect(response).to have_http_status(200)
    end
  end
end
