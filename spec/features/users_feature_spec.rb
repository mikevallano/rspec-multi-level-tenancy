require 'rails_helper'

feature "Can sign up a new user and account" do

  scenario "user can sign in, and is directed to their account subdomain" do
    switch_to_no_subdomain
    sign_in_user

    url = URI.parse(current_url)

    expect("#{url}").to eq("http://#{@subdomain}.lvh.me/")

    expect(page).to have_content("Signed in as: #{@email}")

  end

  scenario "user can sign up and is directed to the welcome page on their account subdomain" do
    switch_to_no_subdomain
    sign_up_with("tacoface@aol.com", "password", "tacoface")

    url = URI.parse(current_url)

    expect("#{url}").to eq("http://#{@subdomain}.lvh.me/welcome")
  end

end