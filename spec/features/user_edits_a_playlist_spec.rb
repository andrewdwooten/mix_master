require 'rails_helper'

describe "User edits a playlist" do
  scenario "User sees updated playlist information" do
    playlist1 = create(:playlist)
    artist = create(:artist)
    song = Song.create(title: 'AwesomeSauce', artist: artist)
    playlist1.songs << song

    replacement_song = create(:song)

    visit playlist_path(playlist1)
    click_on "Edit"
    fill_in "playlist_name", with: "Party Mix"
    uncheck("song-#{song.id}")
    check("song-#{replacement_song.id}")
    click_on "Update Playlist"

    expect(page).to have_content "Party Mix"
    expect(page).to have_content replacement_song.title
    expect(page).to_not have_content song.title
  end
end
