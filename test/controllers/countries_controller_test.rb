require "test_helper"

class CountriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @country = countries(:UK)
    @other_country = countries(:FR)
  end

end
