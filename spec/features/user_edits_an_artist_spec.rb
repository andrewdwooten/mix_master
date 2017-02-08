require 'rails_helper'

feature 'User edits an artist' do
  scenario 'they can edit an artists information' do
    artist = create(:artist)
    
    visit '/artists/7'
    click_on 'Update Artist'
    fill_in 'artist_name', with: 'Dean Martin'
    fill_in 'artist_image_path', with: 'new_image_path'
    click_on 'Update Artist'

    expect(page).to have_content('Dean Martin')
    expect(page).to have_css("img[src='new_image_path']")
    expect(current_path).to eql('/artists/7')
  end
end
