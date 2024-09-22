
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_api/src/core/constants/context_extension.dart';

import '../../../../core/widgets/text_widget.dart';

class StoriesButton extends StatefulWidget {
  const StoriesButton({super.key, required this.backdropPath, this.filmName, this.onPressed});

  final String? backdropPath, filmName;
  final VoidCallback? onPressed;

  @override
  State<StoriesButton> createState() => _StoriesButtonState();
}

class _StoriesButtonState extends State<StoriesButton> {
  List<Color> colors = [Colors.deepOrange, Colors.red, Colors.deepPurple, Colors.yellow, Colors.lightGreen];
  late String title;

  void fixTitle(){
    if(widget.filmName != null){
      title = widget.filmName!;
      if(title.length>15){
        title = "${title.substring(0, 10)}...";
      }
    }

  }

  @override
  void didChangeDependencies() {
    fixTitle();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 90.h,
            width: 80.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: colors,
              ),
            ),
            child: Container(
              height: 60,
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    widget.backdropPath != null && widget.backdropPath!.isNotEmpty
                        ? "https://image.tmdb.org/t/p/w500${widget.backdropPath}"
                        : "https://i0.wp.com/sigmamaleimage.com/wp-content/uploads/2023/03/placeholder-1-1.png?resize=300%2C200&ssl=1",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(child: CustomTextWidget(title ?? "New Film", textColor: context.appTheme.secondary, fontSize: 12,))
        ],
      ),
    );
  }
}