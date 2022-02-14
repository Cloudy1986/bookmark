feature 'Log in & out' do
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

  scenario 'user sees an error if they get their password wrong' do
    User.create(email: 'feature@example.com', password: '758485y4389')
    visit '/log-in'
    fill_in 'email', with: 'feature@example.com'
    fill_in 'password', with: 'jkdaiuireyt'
    click_button 'Log in'

    expect(page).not_to have_content 'Welcome feature@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user can log out' do
    User.create(email: 'test@example.com', password: 'password123')
    visit '/log-in'
    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'password123'
    click_button 'Log in'

    click_button('Log out')

    expect(page).to have_content 'Welcome to Bookmark Manager'
    expect(page).to have_content 'You have logged out.'
  end
end
