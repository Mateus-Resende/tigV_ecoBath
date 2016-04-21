require 'rails_helper'

RSpec.describe "baths/new", type: :view do
  before(:each) do
    assign(:bath, Bath.new(
      :amount_spent => 1.5,
      :ideal_amount => 1.5
    ))
  end

  it "renders new bath form" do
    render

    assert_select "form[action=?][method=?]", baths_path, "post" do

      assert_select "input#bath_amount_spent[name=?]", "bath[amount_spent]"

      assert_select "input#bath_ideal_amount[name=?]", "bath[ideal_amount]"
    end
  end
end
