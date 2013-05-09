require 'spec_helper'

describe "payments/new" do
  before(:each) do
    assign(:payment, stub_model(Payment,
      :student => nil,
      :value => 1.5,
      :reference_month => 1,
      :reference_year => 1
    ).as_new_record)
  end

  it "renders new payment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", payments_path, "post" do
      assert_select "input#payment_student[name=?]", "payment[student]"
      assert_select "input#payment_value[name=?]", "payment[value]"
      assert_select "input#payment_reference_month[name=?]", "payment[reference_month]"
      assert_select "input#payment_reference_year[name=?]", "payment[reference_year]"
    end
  end
end
