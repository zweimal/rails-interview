class StudentService
  @$inject = ['$http']

  constructor: (@http) ->

  getStudents: ({movie, color, food} = {}) ->
    @http(
      method: 'GET'
      url: '/students'
      headers: 
        'Accept': 'application/json'
      params:
        {movie, color, food}
    )
      .then (response) -> response.data

interviewApp.service 'studentService', StudentService