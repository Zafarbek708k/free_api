final class ApiConst {
  const ApiConst._();

  static const Duration connectionTimeout = Duration(minutes: 1);
  static const Duration sendTimeout = Duration(minutes: 1);
  static const Duration receiveTimeout = Duration(minutes: 1);

  static const String baseUrl = "https://api.themoviedb.org";
  static const String version = "/3";
  static const String apiUpcoming = "$version/movie/upcoming";
  static const String apiPopular= "$version/movie/popular";
  static const String apiTopRated = "$version/movie/top_rated";

// Query parameters
  static final Map<String, String> param = {
    "api_key": ApiConst.apiKey,
    "Content-Type": "application/json",
  };



  // Dynamic API Endpoints
  static String apiGetMovieLis = "$version/account/$accountId/lists";
  static String apiGetWatchListMovies = "$version/account/$accountId/watchlist/movies";

  // Static Endpoint (for general trending movies with pagination)
  static const String apiGetMovieWithPage = "/trending/all/day";

  // Account and API Keys
  static const String accountId = "21460780";
  static const String apiKey = "c310d0f072e64a61d4097736dfc040c6";
}

final class ApiParams {
  const ApiParams._();

  // Method to generate authorization header
  static Map<String, String> authorizationHeader() => {
        "Authorization": "Bearer ${ApiConst.apiKey}",
        "Content-Type": "application/json",
      };

  // Parameters for sending SMS verification code
  static Map<String, dynamic> cabinetSmsCheckParams({
    required String phone,
    required String code,
  }) =>
      <String, dynamic>{
        "phone": phone,
        "code": code,
      };

  // Empty parameter map when no additional parameters are needed
  static Map<String, dynamic> emptyParams() => <String, dynamic>{};

  // Query parameters for requesting a movie list with pagination
  static Map<String, dynamic> movieListParams({required int page}) => {
        "api_key": ApiConst.apiKey,
        "account_id": ApiConst.accountId,
        "page": page,
      };
}
