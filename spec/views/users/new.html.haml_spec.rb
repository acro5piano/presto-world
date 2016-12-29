require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :name => "MyString",
      :age => 1,
      :educational_background => "MyString",
      :vision => "MyString",
      :strength => "MyString",
      :shift_id => 1
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_name[name=?]", "user[name]"

      assert_select "input#user_age[name=?]", "user[age]"

      assert_select "input#user_educational_background[name=?]", "user[educational_background]"

      assert_select "input#user_vision[name=?]", "user[vision]"

      assert_select "input#user_strength[name=?]", "user[strength]"

      assert_select "input#user_shift_id[name=?]", "user[shift_id]"
    end
  end
end
