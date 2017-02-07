require 'rails_helper'

feature 'User edits an artist' do
  scenario 'they can edit an artists information' do
    Artist.create(name: 'Frank Sinatra', image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    Artist.create(name: 'Flo-Rida', image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit '/artists/5'
    click_on 'Update Artist'
    fill_in 'artist_name', with: 'Dean Martin'
    fill_in 'artist_image_path', with: 'new_image_path'
    click_on 'Update Artist'

    expect(page).to have_content('Dean Martin')
    expect(page).to have_css("img[src='new_image_path']")
    expect(current_path).to eql('/artists/5')
  end
end
