require 'rails_helper'

feature 'User deletes an artist' do
  scenario 'they click the delete button on a show page' do
    Artist.create(name: 'Seal', image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    Artist.create(name: 'Flo-Rida', image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    Artist.create(name: 'David Guetta', image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit '/artists'
    click_on 'Seal'
    click_on 'Delete Artist'

    expect(page).to_not have_content('Seal')
    expect(current_path).to eq('/artists')
  end
end
