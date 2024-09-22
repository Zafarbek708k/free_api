
import 'package:free_api/src/data/entity/model.dart';


abstract class AppRepository {
  /// crud
  Future<Model?>upcomingMovies();
  Future<Model?>popularMovies();
  Future<Model?>topRatedMovies();

}
