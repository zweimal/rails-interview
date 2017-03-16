require 'test_helper'

class StudentFlowsTest < ActionDispatch::IntegrationTest
  test "by default the firstname of the student is displayed" do
    get "/students"
    assert_select "td", "Kobe", "To simplify a teachers life we only want to see a student's firstname displayed"
    assert_select "tr", {count: 7}, "All students are returned including a header row"
  end

  test "duplicate first names have first initial of last name appended" do
    get "/students"
    assert_select "td", "Jimmy B.", "There is another student with a firstname of Jimmy and so the first character of my lastname is added to differentiate me"
    assert_select "td", "Jimmy G.", "There is another student with a firstname of Jimmy and so the first character of my lastname is added to differentiate me"
    assert_select "tr", {count: 7}, "All students are returned including a header row"
  end

  test "names filterable by movie" do
    get "/students?movie=taboo"
    assert_select "td", "Joey"
    assert_select "td", "Jimmy G."
    assert_select "tr", {count: 3}, "There are only two students in the fixture with a movie of taboo and so we expect 3 rows to be returned accounting for the header row"
  end
end
