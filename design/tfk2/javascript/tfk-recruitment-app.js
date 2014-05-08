angular.module('tfk-recruitment-app', ['ngResource'], function ($interpolateProvider) {
    $interpolateProvider.startSymbol('[[[');
    $interpolateProvider.endSymbol(']]]');
});

function RecruitmentsCtrl($scope, $resource) {

    $scope.webservice = $resource('http://ws.t-fk.no/:action',
            {action:'ws.php', callback:'JSON_CALLBACK', format:'json'},
            {get: {method:'JSONP'}});

    $scope.recruitments_list = $scope.webservice.get({resource:'recruitments', search:'all'});

    $scope.predicate = '-published';
    $scope.limit = 4;
    
    //$scope.recruitments_list = {'results': [{'deadline': '2017-07-28', 'contracttype':'vikar', 'title':'webutvikler'}, {'deadline': '2017-08-01', 'contracttype':'fast', 'title':'Ostepopsteker'}]};

}
