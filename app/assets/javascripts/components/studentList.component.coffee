interviewApp
  .component('studentList', 
    template: '<table class="table" ng-init="order = \'id\'">
        <tr>
          <th>
            <button class="btn"
              ng-class="$ctrl.getClass(order == \'id\')" 
              ng-click="order = \'id\'">#
            </button>
          </th>
          <th>
            <button class="btn" 
              ng-class="$ctrl.getClass(order == \'name\')" 
              ng-click="order = \'name\'">Name
            </button>
          </th>
          <th>
            <button class="btn" 
              ng-class="$ctrl.getClass(order == \'favoritemovie\')" 
              ng-click="order = \'favoritemovie\'">Favorite Movie
            </button>
          </th>
          <th>
            <button class="btn" 
              ng-class="$ctrl.getClass(order == \'favoritefood\')" 
              ng-click="order = \'favoritefood\'">Favorite Food
            </button>
          </th>
          <th>
            <button class="btn" 
              ng-class="$ctrl.getClass(order == \'favoritecolor\')" 
              ng-click="order = \'favoritecolor\'">Favorite Color
            </button>
          </th>
        </tr>

        <tr ng-repeat="student in $ctrl.students | orderBy: order | filter: $ctrl.filter ">
          <td>{{ student.id }}</td>
          <td>{{ student.name }}</td>
          <td>{{ student.favoritemovie }}</td>
          <td>{{ student.favoritefood }}</td>
          <td>{{ student.favoritecolor }}</td>
        </tr>

    </table>'

    bindings:
      students: '<'
      filter: '<'

    controller: ->
      getClass: (flag) -> 
        if flag
          'btn-primary'
        else
          'btn-secondary'
  )
