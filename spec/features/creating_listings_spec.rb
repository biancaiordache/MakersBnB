feature 'Adding a new listing' do
  scenario 'A user can add a listing to Spaces' do
    visit('/spaces/new')
    fill_in('name', with: 'Listing 1')
    fill_in('description', with: 'Elegant Art Deco Home with Garden in Condesa')
    fill_in('price', with: '100')
    click_button('List my space')

    expect(page).to have_content 'Listing 1'
  end
end
