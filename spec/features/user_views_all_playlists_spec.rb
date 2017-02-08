require 'rails_helper'

describe 'User views all playlists' do
  scenario "they see the page for all playlists" do
    playlist1 = create(:playlist)
    playlist2 = create(:playlist)

    visit playlists_path

    expect(page).to have_content playlist1.name
    expect(page).to have_content playlist2.name
    expect(page).to have_link playlist1.name, href: playlist_path(playlist1)
    expect(page).to have_link playlist2.name, href: playlist_path(playlist2)
  end
end
