feature 'Sign up' do
  scenario 'user can sign up' do
    visit '/sign-up'
    fill_in 'email', with: 'mark@example.com'
    fill_in 'password', with: '123456'
    click_button 'Sign up'
    
    expect(page).to have_content 'Welcome mark@example.com'
  end
end
