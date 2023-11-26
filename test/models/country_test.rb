require "test_helper"

class CountryTest < ActiveSupport::TestCase
  def setup
    @country = Country.new(name: "EX", full_name: "Example Country")
  end

  test "should be valid" do
    assert @country.valid?
  end

  test "name should be present" do
    @country.name = ""
    assert_not @country.valid?
  end

  test "full name should be present" do
    @country.full_name = "     "
    assert_not @country.valid?
  end

  test "name should not be too long" do
    @country.name = "a" * 5
    assert_not @country.valid?
  end

  test "full name should not be too long" do
    @country.full_name = "a" * 41
    assert_not @country.valid?
  end

  test "name should be unique" do
    duplicate_name = @country.dup
    @country.save
    assert_not duplicate_name.valid?
  end

  test "name should be saved as uppercase" do
    mixed_case_name = "Xx"
    @country.name = mixed_case_name
    @country.save
    assert_equal mixed_case_name.upcase, @country.reload.name
  end
end
