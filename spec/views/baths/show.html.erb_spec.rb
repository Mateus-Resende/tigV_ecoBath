require 'rails_helper'

RSpec.describe "baths/show", type: :view do
  before(:each) do
    @bath = assign(:bath, Bath.create!(
      :amount_spent => 1.5,
      :ideal_amount => 1.5,
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1/)
  end
end
