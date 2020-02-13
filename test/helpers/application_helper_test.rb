require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
    test "full title helper" do
        assert_equal full_title, "re_learn_app"
        assert_equal full_title("Help"), "Help | re_learn_app"
    end
    
end