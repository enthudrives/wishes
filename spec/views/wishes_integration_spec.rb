require "spec_helper_full"

describe "wishes/index.html.erb" do
  it "doesn't raise errors" do
    assign(:wishes, [build(:wish), build(:wish)])
    render
    expect(view).to render_template(partial: "_wish", count: 2)
  end
end
