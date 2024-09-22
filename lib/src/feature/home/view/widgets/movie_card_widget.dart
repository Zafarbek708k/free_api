import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_api/src/core/constants/context_extension.dart';
import 'package:free_api/src/data/entity/model.dart';
import 'package:free_api/src/data/entity/up_coming_model.dart';

import '../../../../core/widgets/text_widget.dart';
import '../../../../data/entity/top_rated_model.dart';


class MoviesCard extends StatefulWidget {
  const MoviesCard({super.key, required this.model, required this.index, this.onPressed});

  final Model model;
  final int index;
  final VoidCallback? onPressed;

  @override
  State<MoviesCard> createState() => _MoviesCardState();
}

class _MoviesCardState extends State<MoviesCard> {
  List<Color> colors = [Colors.deepOrange, Colors.red, Colors.deepPurple, Colors.yellow, Colors.lightGreen];
  late String title;
  late int index;
  late final model;

  @override
  void initState() {
    log(widget.model.results![0].runtimeType.toString());
    index = widget.index;
    model = widget.model.results![index];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120.h,
        width: 150.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: colors,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: context.appTheme.primary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
                width: 130.h,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Set a border radius of 15
                  image: DecorationImage(
                    image: NetworkImage(
                      model.backdropPath != null && model.backdropPath!.isNotEmpty
                          ? "https://image.tmdb.org/t/p/w500${widget.model.results![index].backdropPath}"
                          : "https://i0.wp.com/sigmamaleimage.com/wp-content/uploads/2023/03/placeholder-1-1.png?resize=300%2C200&ssl=1",
                    ),
                    fit: BoxFit.cover, // Adjust the image fitting
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15), // Clip the container to have rounded corners
                  child: Image.network(
                    model.backdropPath != null && model.backdropPath!.isNotEmpty
                        ? "https://image.tmdb.org/t/p/w500${model.backdropPath}"
                        : "https://i0.wp.com/sigmamaleimage.com/wp-content/uploads/2023/03/placeholder-1-1.png?resize=300%2C200&ssl=1",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15), // Same border radius
                          image: const DecorationImage(
                            image: NetworkImage(
                              "https://i0.wp.com/sigmamaleimage.com/wp-content/uploads/2023/03/placeholder-1-1.png?resize=300%2C200&ssl=1",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextWidget("Title: ${model.originalTitle}", textColor: context.appTheme.secondary, fontSize: 10), // Ensure this matches
                    const SizedBox(height: 5),
                    CustomTextWidget("Popularity: ${model.popularity}", textColor: context.appTheme.secondary, fontSize: 10), // Ensure this matches
                    const SizedBox(height: 5),
                    CustomTextWidget("Date: ${model.releaseDate.toString().substring(0, 11)}", textColor: context.appTheme.secondary, fontSize: 10),
                    const SizedBox(height: 5),
                    CustomTextWidget("VoteAverage: ${model.voteAverage}", textColor: context.appTheme.secondary, fontSize: 10), // Ensure this matches


                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}


class TopRatedMovieCard extends StatefulWidget {
  const TopRatedMovieCard({super.key, required this.model, required this.index, this.onPressed});
  final Toprated model;
  final int index;

  final VoidCallback? onPressed;


  @override
  State<TopRatedMovieCard> createState() => _TopRatedMovieCardState();
}

class _TopRatedMovieCardState extends State<TopRatedMovieCard> {
  List<Color> colors = [Colors.deepOrange, Colors.red, Colors.deepPurple, Colors.yellow, Colors.lightGreen];
  late String title;
  late int index;
  late final model;

  @override
  void initState() {
    log(widget.model.results![0].runtimeType.toString());
    index = widget.index;
    model = widget.model.results![index];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120.h,
        width: 150.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: colors,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: context.appTheme.primary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
                width: 130.h,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Set a border radius of 15
                  image: DecorationImage(
                    image: NetworkImage(
                      model.backdropPath != null && model.backdropPath!.isNotEmpty
                          ? "https://image.tmdb.org/t/p/w500${widget.model.results![index].backdropPath}"
                          : "https://i0.wp.com/sigmamaleimage.com/wp-content/uploads/2023/03/placeholder-1-1.png?resize=300%2C200&ssl=1",
                    ),
                    fit: BoxFit.cover, // Adjust the image fitting
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15), // Clip the container to have rounded corners
                  child: Image.network(
                    model.backdropPath != null && model.backdropPath!.isNotEmpty
                        ? "https://image.tmdb.org/t/p/w500${model.backdropPath}"
                        : "https://i0.wp.com/sigmamaleimage.com/wp-content/uploads/2023/03/placeholder-1-1.png?resize=300%2C200&ssl=1",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15), // Same border radius
                          image: const DecorationImage(
                            image: NetworkImage(
                              "https://i0.wp.com/sigmamaleimage.com/wp-content/uploads/2023/03/placeholder-1-1.png?resize=300%2C200&ssl=1",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextWidget("Title: ${model.originalTitle}", textColor: context.appTheme.secondary, fontSize: 10), // Ensure this matches
                    const SizedBox(height: 5),
                    CustomTextWidget("Popularity: ${model.popularity}", textColor: context.appTheme.secondary, fontSize: 10), // Ensure this matches
                    const SizedBox(height: 5),
                    CustomTextWidget("Date: ${model.releaseDate.toString().substring(0, 11)}", textColor: context.appTheme.secondary, fontSize: 10),
                    const SizedBox(height: 5),
                    CustomTextWidget("VoteAverage: ${model.voteAverage}", textColor: context.appTheme.secondary, fontSize: 10), // Ensure this matches


                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}


class UpComingMovieCard extends StatefulWidget {
  const UpComingMovieCard({super.key, required this.model, required this.index, this.onPressed});
  final UpComing model;
  final int index;

  final VoidCallback? onPressed;


  @override
  State<UpComingMovieCard> createState() => _UpComingMovieCardState();
}

class _UpComingMovieCardState extends State<UpComingMovieCard> {
  List<Color> colors = [Colors.deepOrange, Colors.red, Colors.deepPurple, Colors.yellow, Colors.lightGreen];
  late String title;
  late int index;
  late final model;

  @override
  void initState() {
    log(widget.model.results![0].runtimeType.toString());
    index = widget.index;
    model = widget.model.results![index];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120.h,
        width: 150.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: colors,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: context.appTheme.primary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
                width: 130.h,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Set a border radius of 15
                  image: DecorationImage(
                    image: NetworkImage(
                      model.backdropPath != null && model.backdropPath!.isNotEmpty
                          ? "https://image.tmdb.org/t/p/w500${widget.model.results![index].backdropPath}"
                          : "https://i0.wp.com/sigmamaleimage.com/wp-content/uploads/2023/03/placeholder-1-1.png?resize=300%2C200&ssl=1",
                    ),
                    fit: BoxFit.cover, // Adjust the image fitting
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15), // Clip the container to have rounded corners
                  child: Image.network(
                    model.backdropPath != null && model.backdropPath!.isNotEmpty
                        ? "https://image.tmdb.org/t/p/w500${model.backdropPath}"
                        : "https://i0.wp.com/sigmamaleimage.com/wp-content/uploads/2023/03/placeholder-1-1.png?resize=300%2C200&ssl=1",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15), // Same border radius
                          image: const DecorationImage(
                            image: NetworkImage(
                              "https://i0.wp.com/sigmamaleimage.com/wp-content/uploads/2023/03/placeholder-1-1.png?resize=300%2C200&ssl=1",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextWidget("Title: ${model.originalTitle}", textColor: context.appTheme.secondary, fontSize: 10), // Ensure this matches
                    const SizedBox(height: 5),
                    CustomTextWidget("Popularity: ${model.popularity}", textColor: context.appTheme.secondary, fontSize: 10), // Ensure this matches
                    const SizedBox(height: 5),
                    CustomTextWidget("Date: ${model.releaseDate.toString().substring(0, 11)}", textColor: context.appTheme.secondary, fontSize: 10),
                    const SizedBox(height: 5),
                    CustomTextWidget("VoteAverage: ${model.voteAverage}", textColor: context.appTheme.secondary, fontSize: 10), // Ensure this matches


                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
