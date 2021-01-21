feature 'Registrations' do
  scenario 'User can sign up' do
    visit('/users/new')
    fill_in('email', with: 'test@example.com')
    fill_in('Password', with: 'password123')
    click_button('Sign up')

    expect(page).to have_content('Welcome, test@example.com')
  end
end
