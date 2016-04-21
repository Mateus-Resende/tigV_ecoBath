require 'rails_helper'

RSpec.describe "baths/edit", type: :view do
  before(:each) do
    @bath = assign(:bath, Bath.create!(
      :amount_spent => 1.5,
      :ideal_amount => 1.5
    ))
  end

  it "renders the edit bath form" do
    render

    assert_select "form[action=?][method=?]", bath_path(@bath), "post" do

      assert_select "input#bath_amount_spent[name=?]", "bath[amount_spent]"

      assert_select "input#bath_ideal_amount[name=?]", "bath[ideal_amount]"
    end
  end
end
