interviewApp
  .component('app', 
    template: '
    <p class="alert alert-danger" ng-if="$ctrl.error">Error {{$ctrl.error.status}}: {{$ctrl.error.statusText}}.<br/>Please try again later.</p>
    <div ng-if="!$ctrl.error && $ctrl.students">
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
      <student-list students="$ctrl.students" filter="query"></student-list>
    </div>
    <div ng-if="!$ctrl.error && !$ctrl.students">
      Loading...
    </div>
    '

    controller: [ 'studentService',
      (studentService) ->
        studentService
          .getStudents()
          .then (students) => @students = students
          .catch (error) => @error = error
        return
    ]
  )
