require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "Name",
      :age => 2,
      :educational_background => "Educational Background",
      :vision => "Vision",
      :strength => "Strength",
      :shift_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Educational Background/)
    expect(rendered).to match(/Vision/)
    expect(rendered).to match(/Strength/)
    expect(rendered).to match(/3/)
  end
end
