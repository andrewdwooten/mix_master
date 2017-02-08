require 'rails_helper'

describe ArtistsController, type: :controller do
  describe 'GET #index' do
    it 'assigns all artists to @artists and renders the index template' do
      artist = create(:artist)

      get(:index)

      expect(assigns(:artists)).to eq([artist])
      expect(response).to render_template("index")
    end
  end

  describe 'GET #show' do
    it 'assigns the requested artist to at artist and renders the show template' do
      artist = create(:artist)

      get(:show, {:id => artist.to_param})

      expect(assigns(:artist)).to eq(artist)
      expect(response).to render_template("show")
    end
  end

  describe 'GET #new' do
    it 'assigns a new artist to @artist and renders the new template' do
      get(:new)

      expect(assigns(:artist)).to be_a_new(Artist)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested artist to @artist and renders the edit template' do
      artist = create(:artist)

      get(:edit, {:id => artist.to_param})

      expect(assigns(:artist)).to eq(artist)
      expect(response).to render_template("edit")
    end
  end

  describe 'POST #create' do
    context 'with valid params' do

      it 'creates a new artist' do
        expect {
          post :create, {:artist => attributes_for(:artist)}
        }.to change(Artist, :count).by (1)
      end

      it 'assigns a newly created artist to @artist' do
        post :create, {:artist => attributes_for(:artist)}
        expect(assigns(:artist)).to be_a(Artist)
        expect(assigns(:artist)).to be_persisted
      end

      it 'redirects to the created artist' do
        post :create, {:artist => attributes_for(:artist)}
        expect(response).to redirect_to(Artist.last)
      end
    end

    context 'with invalid params' do

      it 'assigns a newly created but unsaved artist to @artist' do
        post :create, {:artist => attributes_for(:artist, name: nil)}
        expect(assigns(:artist)).to be_a_new(Artist)
      end

      it 're-renders the new template' do
        post :create, {:artist => attributes_for(:artist, name: nil)}
        expect(response).to render_template("new")
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested artist' do
        artist = create(:artist)
        put :update, {:id => artist.to_param, :artist => attributes_for(:artist, name: 'New Name')}
        artist.reload
        expect(artist.name).to eql('New Name')
      end

      it 'assigns the selected artist to @artist' do
        artist = create(:artist)
        put :update, {:id => artist.to_param, :artist => attributes_for(:artist, name: 'New Name')}
        expect(assigns(:artist)).to eq(artist)
      end

      it 'redirects to the artist show' do
        artist = create(:artist)
        put :update, {:id => artist.to_param, :artist => attributes_for(:artist, name: 'New Name')}
        expect(response).to redirect_to(artist)
      end
    end

    context 'with invalid params' do
      it 'assigns the artist to @artist' do
        artist = create(:artist)
        put :update, {:id => artist.to_param, :artist => attributes_for(:artist, name: nil)}
        expect(assigns(:artist)).to eq(artist)
      end

      it 're-renders the edit template' do
        artist = create(:artist)
        put :update, {:id => artist.to_param, :artist => attributes_for(:artist, name: nil)}
        expect(response).to redirect_to artist_path(artist)
      end
    end
  end
  describe "DELETE #destroy" do
    it 'following destruction render to artist index' do
      artist = create(:artist)
      delete :destroy, {:id => artist.to_param, :artist => attributes_for(:artist)}
      expect(response).to redirect_to artists_path
    end

    it 'destroys the selected artist' do
      artist = create(:artist)
        expect {
          delete :destroy, {:id => artist.to_param}
        }.to change(Artist, :count).by (-1)
    end
  end
end
