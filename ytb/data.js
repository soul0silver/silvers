(
    function(){
        angular.module('youtubeApp',[]);
    }
)();
(function(){

    angular
        .module('youtubeApp')
        .controller('mainController', mainController);

    function mainController(youtubeService){

        var vm = this;
        vm.videoListing = [];
        vm.message = "Youtube Data API with AngularJs";

        function showVideos(){
            youtubeService.getVideos().success(function(data){
                vm.videoListing = data.items;
            });
        }
        showVideos();
    }
})();

(function(){
    angular
        .module('youtubeApp')
        .factory('youtubeService', youtubeService);

    function youtubeService($http){

        var apiKey = "AIzaSyAEKbU6-ZpJuu6XG0lJzBeNuoNJWTM8vF8",
        apiURL = "https://www.googleapis.com/youtube/v3/search?videoEmbeddable=true"
        +"&order=date&part=snippet&channelId=UClyA28-01x4z60eWQ2kiNbA&type=video&maxResults=15&key=" 
        + apiKey,
        youtubeFactory = {};

    youtubeFactory.getVideos = function(){
        return $http.get(apiURL);
    };
    return youtubeFactory;
    }
})();
