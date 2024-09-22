import "dart:developer";
import "package:free_api/src/core/server/api/api.dart";
import "package:free_api/src/core/server/api/api_constants.dart";
import "../entity/model.dart";
import "app_repository.dart";


class AppRepositoryImpl implements AppRepository {
  factory AppRepositoryImpl() => _impl;
  const AppRepositoryImpl._internal();
  static const AppRepositoryImpl _impl = AppRepositoryImpl._internal();





  @override
  Future<Model?> popularMovies() async{
    late Model model;
    String? result = await ApiService.get(ApiConst.apiPopular, ApiConst.param);
    if(result != null){
      log("Api popular result == $result");
      model =  modelFromJson(result);
      return model;
    }else{
      return null;
    }
  }

  @override
  Future<Model?> topRatedMovies() async{
    late Model model;
    String? result = await ApiService.get(ApiConst.apiTopRated, ApiConst.param);
    log("Api topRated result == $result");
    if(result != null){
      model =  modelFromJson(result);
      return model;
    }else{
      return null;
    }
  }

  @override
  Future<Model?> upcomingMovies() async {
    late Model model;
    String? result = await ApiService.get(ApiConst.apiUpcoming, ApiConst.param);
    log("Api UPComing result == $result");
    if(result != null){
      model =  modelFromJson(result);
      return model;
    }else{
      return null;
    }
  }


}
