require 'spec_helper'

describe "payments/show" do
  before(:each) do
    @payment = assign(:payment, stub_model(Payment,
      :student => nil,
      :value => 1.5,
      :reference_month => 1,
      :reference_year => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/1.5/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
