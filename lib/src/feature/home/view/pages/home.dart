import "dart:async";
import "dart:developer";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:free_api/src/core/constants/context_extension.dart";
import "package:free_api/src/core/server/api/api.dart";
import "package:free_api/src/core/server/api/api_constants.dart";
import "package:free_api/src/data/entity/model.dart";
import "package:free_api/src/data/entity/top_rated_model.dart";
import "package:free_api/src/data/entity/up_coming_model.dart";
import "../../../../../riverpod.dart";
import "../../../../core/widgets/text_widget.dart";
import "../widgets/home_stories_button_widget.dart";
import "../widgets/movie_card_widget.dart";

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<Home> {
  bool isLoading = false;
  String? data;
  Model? model;
  UpComing? model2;
  Toprated? model3;

  List<Widget> pages =[];

  Future<void> getData() async {
    setState(() {
      isLoading = false;
    });
    final response = await ApiService.get(ApiConst.apiPopular, ApiConst.param);
    final response2 = await ApiService.get(ApiConst.apiUpcoming, ApiConst.param);
    final response3 = await ApiService.get(ApiConst.apiTopRated, ApiConst.param);

    log("Up coming $response2");
    log("Top Rated $response3");

    if (response!.isNotEmpty && response2!.isNotEmpty && response3!.isNotEmpty) {
      log("1");
      model = modelFromJson(response);
      model2 = upComingFromJson(response2);
      model3 = topratedFromJson(response3);
      log("2");
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                    child: CustomTextWidget(context.localized.stories, textColor: context.appTheme.secondary, fontSize: 24),
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: model?.results.length ?? 0,
                      itemBuilder: (context, index) {
                        log("length ${model?.results.length}");
                        final movie = model!.results[index]; // Use Result type
                        log(movie.backdropPath);
                        return StoriesButton(
                          backdropPath: movie.backdropPath,
                          filmName: movie.title,
                          onPressed: () {},
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                    child: CustomTextWidget(context.localized.upComing, textColor: context.appTheme.secondary, fontSize: 24),
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: model2?.results.length ?? 0, // Use the length from model2 safely
                      itemBuilder: (context, index) {
                        return UpComingMovieCard(
                          model: model2!,
                          index: index,
                          onPressed: () {},
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                    child: CustomTextWidget(context.localized.topRated, textColor: context.appTheme.secondary, fontSize: 24),
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: model3?.results.length ?? 0, // Use the length from model2 safely
                      itemBuilder: (context, index) {
                        return TopRatedMovieCard(model: model3!, index: index);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                    child: CustomTextWidget(context.localized.popular, textColor: context.appTheme.secondary, fontSize: 24),
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: model?.results.length ?? 0, // Use the length from model2 safely
                      itemBuilder: (context, index) {
                        log("length ${model?.results.length}");
                        final movie = model!.results[index]; // Use Result type
                        log(movie.backdropPath);
                        return MoviesCard(model: model!, index: index);
                      },
                    ),
                  ),
                  SizedBox(height: 120.h)
                ],
              ),
            ),
    );
  }
}
