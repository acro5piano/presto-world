require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :age => 2,
        :educational_background => "Educational Background",
        :vision => "Vision",
        :strength => "Strength",
        :shift_id => 3
      ),
      User.create!(
        :name => "Name",
        :age => 2,
        :educational_background => "Educational Background",
        :vision => "Vision",
        :strength => "Strength",
        :shift_id => 3
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Educational Background".to_s, :count => 2
    assert_select "tr>td", :text => "Vision".to_s, :count => 2
    assert_select "tr>td", :text => "Strength".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
