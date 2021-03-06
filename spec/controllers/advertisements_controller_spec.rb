require 'rails_helper'
include RandomData

RSpec.describe AdvertisementsController, :type => :controller do
 let(:my_adv){ Advertisement.create!(title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 99) }
  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "assigns [my_adv] to @advertisements" do
      get :index
      expect(assigns(:advertisements)).to eq([my_adv])
    end
  end
  
  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_adv.id}
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
      get :show, {id: my_adv.id}
      expect(response).to render_template :show
    end
    it "assigns my_adv to @advertisement" do
      get :show, {id: my_adv.id}
      expect(assigns(:advertisement)).to eq(my_adv)
    end
    
    describe "Get new" do
      it "returns http success" do
          get :new
          expect(response).to have_http_status(:success)
      end
      it "renders the #new view" do
          get :new
          expect(response).to render_template :new
      end
      it "instantiates @advertisement" do
          get :new
          expect(assigns(:advertisement)).not_to be_nil
      end
    end
    
     describe "POST create" do
 # #4
      it "increases the number of Post by 1" do
        expect{post :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 99}}.to change(Advertisement,:count).by(1)
      end
 
 # #5
      it "assigns the new advertisement to @advertisement" do
        post :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 99}
        expect(assigns(:advertisement)).to eq Advertisement.last
      end
 
 # #6
      it "redirects to the new post" do
        post :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 99}
        expect(response).to redirect_to Advertisement.last
      end
  end
  
 end
end
