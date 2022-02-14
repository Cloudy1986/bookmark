feature 'Log in' do
  scenario 'user can log in' do
    User.create(email: 'feature@example.com', password: '758485y4389')
    visit '/log-in'
    fill_in 'email', with: 'feature@example.com'
    fill_in 'password', with: '758485y4389'
    click_button 'Log in'

    expect(page).to have_content 'Welcome feature@example.com'
  end

  scenario 'user sees an error if they get their email wrong' do
    User.create(email: 'feature@example.com', password: '758485y4389')
    visit '/log-in'
    fill_in 'email', with: 'wrong@example.com'
    fill_in 'password', with: '758485y4389'
    click_button 'Log in'

    expect(page).not_to have_content 'Welcome feature@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end
end
