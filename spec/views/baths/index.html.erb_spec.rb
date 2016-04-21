require 'rails_helper'

RSpec.describe "baths/index", type: :view do
  before(:each) do
    assign(:baths, [
      Bath.create!(
        :amount_spent => 1.5,
        :ideal_amount => 1.5
      ),
      Bath.create!(
        :amount_spent => 1.5,
        :ideal_amount => 1.5
      )
    ])
  end

  it "renders a list of baths" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
