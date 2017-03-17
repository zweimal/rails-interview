interviewApp
  .component('app', 
    template: '
    <div class="form-inline">
      <div>Filters</div>
      <div class="form-group">
        <label for="name" class="col-2 col-form-label">By name:</label>
        <div class="input-group">
          <input name="name" type="text" class="form-control" ng-model="query.name">
          <span class="input-group-btn">
            <button class="btn btn-danger" ng-click="query.name = undefined">x</button>
          </span>
        </div>
      </div>
    </div>
    <div class="spacer"/>
    <student-list students="$ctrl.studentList" filter="query"></student-list>'

    controller: [ 'studentService',
      (studentService) ->
        studentService
          .getStudents()
          .then (students) => @studentList = students 
        return
    ]
  )
