require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  before do
    @category = FactoryBot.create(:category)
    @idea = FactoryBot.create(:idea)
  end

  describe 'POSTでcategory_nameがcategoriesのnameに存在する場合' do
    it 'ideasに登録する' do
      expect { post categories_path, params: { category_name: 'test_name1', body: 'test_body' } }
        .to change { Idea.count }.by(1)
      expect(response).to have_http_status(201)
    end

    it 'bodyがnilの場合,エラーを返す' do
      post categories_path, params: { category_name: 'test_name1', body: nil }
      expect(response).to have_http_status(422)
    end
  end

  describe 'POSTでcategory_nameがcategoriesのnameに存在しない場合' do
    it 'categoriesとideaの両方に登録する' do
      expect { post categories_path, params: { category_name: 'new_test_name', body: 'new_test_body' } }
        .to change { Category.count }.by(1).and change { Idea.count }.by(1)
      expect(response).to have_http_status(201)
    end
    it 'category_nameがnilの場合、エラーを返す' do
      post categories_path, params: { category_name: nil, body: 'new_test_body' }
      expect(response).to have_http_status(422)
    end
  end
end
