module FeatureHelpers
  def sign_up_with(email, password)
    visit root_path

    click_link 'Sign Up'

    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    click_link_or_button 'Sign up'
  end

  def sign_in_user
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  def create_account
    click_link 'Accounts'
    click_link 'New Account'
    fill_in 'Name', with: 'zorro'
    fill_in 'Subdomain', with: 'looming'
    click_button "Create Account"
  end
end