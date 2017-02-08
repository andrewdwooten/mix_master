require 'rails_helper'

describe "User cannot create a song without a title" do
  scenario "they see an error" do
    artist = create(:artist)
    song_title = 'One Love'

    visit artist_path(artist)
    click_on "New Song"
    click_on "Create Song"

    expect(page).to have_content "Title can't be blank"
  end
end
