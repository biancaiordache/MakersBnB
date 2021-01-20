feature 'Viewing spaces' do
  scenario 'a user can view spaces' do
    Listing.create(name: 'Listing 1', description: 'Elegant Art Deco Home with Garden in Condesa', price: '100')
    Listing.create(name: 'Listing 2', description: 'Unique and Secluded AirShip with Breathtaking Highland Views', price: '200')
    Listing.create(name: 'Listing 3', description: 'Luxury City Center Loft on a Traffic-Free Street', price: '300')

    visit('/spaces')

    expect(page).to have_content "Listing 1"
    expect(page).to have_content "Listing 2"
    expect(page).to have_content "Listing 3"
  end
end
