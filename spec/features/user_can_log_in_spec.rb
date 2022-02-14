feature 'Log in' do
  scenario 'user can log in' do
    User.create(email: 'feature@example.com', password: '758485y4389')
    visit '/log-in'
    fill_in 'email', with: 'feature@example.com'
    fill_in 'password', with: '758485y4389'
    click_button 'Log in'

    expect(page).to have_content 'Welcome feature@example.com'
  end
end
