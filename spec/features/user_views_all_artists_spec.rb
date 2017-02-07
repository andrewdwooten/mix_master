require 'rails_helper'

feature 'User views all artists' do
  scenario 'all artist names are present' do
    Artist.create(name: 'Bob Marley', image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    Artist.create(name: 'Frank Sinatra', image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    Artist.create(name: 'Barry Manilow', image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    Artist.create(name: 'Seal', image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    Artist.create(name: 'Flo-Rida', image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    Artist.create(name: 'David Guetta', image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit '/artists'
    expect(page).to have_content('Bob Marley')
    expect(page).to have_content('Frank Sinatra')
    expect(page).to have_content('Barry Manilow')
    expect(page).to have_content('Seal')
    expect(page).to have_content('Flo-Rida')
    expect(page).to have_content('David Guetta')

  end
end
