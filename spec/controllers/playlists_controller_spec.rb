require 'rails_helper'

describe PlaylistsController, type: :controller do
  context 'with valid params' do
    describe 'POST #create' do
      it 'creates a new playlist' do
        expect {
          post :create, {:playlist => attributes_for(:playlist)}
        }.to change(Playlist, :count).by (1)
      end

      it 'assigns a newly created playlist to @playlist' do
        post :create, {:playlist => attributes_for(:playlist)}
        expect(assigns(:playlist)).to be_a(Playlist)
        expect(assigns(:playlist)).to be_persisted
      end

      it 'redirects to the created playlist' do
        post :create, {:playlist => attributes_for(:playlist)}
        expect(response).to redirect_to(Playlist.last)
      end
    end
  end

  context 'with invalid params' do
    describe 'POST # create' do
      it 'assigns the playlist to @playlist' do
        post :create, {:playlist => attributes_for(:playlist, name: nil)}
        expect(assigns(:playlist)).to be_a_new(Playlist)
      end

      it 'it re-renders the new template' do
        post :create, {:playlist => attributes_for(:playlist, name: nil)}
        expect(response).to redirect_to new_playlist_path
      end
    end
  end

  context 'with valid params' do
    describe 'PUT #update' do
      it 'updates correct playlist' do
        playlist = create(:playlist)
        put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: 'New Beats')}
        playlist.reload
        expect(playlist.name).to eql('New Beats')
      end

      it 'assigns the selected playlist to @playlist' do
        playlist = create(:playlist)
        put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: 'New Beats')}
        playlist.reload
        expect(assigns(:playlist)).to eq(playlist)
      end

      it 'redirects to playlist show' do
        playlist = create(:playlist)
        put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: 'New Beats')}
        expect(response).to redirect_to(playlist)
      end
    end
  end

  context 'with invalid params' do
    describe 'put #update' do
      it 'assigns the playlist to @ playlist' do
        playlist = create(:playlist)
        put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: nil)}
        expect(assigns(:playlist)).to eq(playlist)
      end
      it 'redirects to playlist show page' do
        playlist = create(:playlist)
        put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: nil)}
        expect(response).to redirect_to(playlist)
      end
    end
  end
end
