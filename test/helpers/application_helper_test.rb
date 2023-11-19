require "test_helper"

class ApplicationHelperTest < ActionView::TestCase

  test "full title helper" do
    assert_equal "ABI WMS", full_title
    assert_equal "Help | ABI WMS", full_title("Help")
  end
  
end