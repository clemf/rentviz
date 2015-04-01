require 'rails_helper'

describe "the search rentals process" do
  it "searches for rents" do
    visit rentals_path
    select 'Portland',
    click_on 'Search'
    expect(page).to have_content 'Rentals'
