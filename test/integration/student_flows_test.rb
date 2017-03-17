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

  test "names filterable by color" do
    get "/students?color=red"
    assert_select "td", "Kobe"
    assert_select "td", "Joey"
    assert_select "tr", {count: 3}, "There are only two students in the fixture with a color of red and so we expect 3 rows to be returned accounting for the header row"
  end

  test "[Json API] names filterable by food" do
    begin
      get "/students?food=e", format: :json

      assert_response :success
      json = JSON.parse(response.body)

      assert_instance_of Array, json
      assert_equal 3, json.length

      names = json.collect { |student| student['name'] }

      assert_includes names, 'Jimmy G.'
      assert_includes names, 'Tom'
      assert_includes names, 'Shaquille'

    rescue ActionController::UnknownFormat
      flunk 'It should allow JSON-formatted response'
    rescue JSON::ParserError
      flunk 'Response should be valid JSON object'
    end
  end

  test "names filterable by multiple attributes" do
    get "/students?movie=tab&color=red"
    assert_select "td", "Joey"
    assert_select "tr", {count: 2}, "There are only one student in the fixture with a movie containing 'tab' and a color of red, so we expect 2 rows to be returned accounting for the header row"
  end
end
