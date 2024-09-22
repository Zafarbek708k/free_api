import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:free_api/src/core/constants/context_extension.dart";
import "../../../../../riverpod.dart";
import "../../../../core/server/api/api.dart";
import "../../../../core/server/api/api_constants.dart";
import "../../../../core/widgets/text_widget.dart";
import "../../../../data/entity/model.dart";
import "../../../../data/entity/top_rated_model.dart";
import "../../../../data/entity/up_coming_model.dart";

class Search extends ConsumerStatefulWidget {
  const Search({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchState();
}

class _SearchState extends ConsumerState<Search> {
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  String? data;
  Model? model;
  UpComing? model2;
  Toprated? model3;

  List list = [];

  Future<void> getData() async {
    setState(() {
      isLoading = false;
    });
    final response = await ApiService.get(ApiConst.apiPopular, ApiConst.param);
    final response2 = await ApiService.get(ApiConst.apiUpcoming, ApiConst.param);
    final response3 = await ApiService.get(ApiConst.apiTopRated, ApiConst.param);

    if (response!.isNotEmpty && response2!.isNotEmpty && response3!.isNotEmpty) {
      model = modelFromJson(response);
      model2 = upComingFromJson(response2);
      model3 = topratedFromJson(response3);
      setState(() {
        List results = [...model!.results, ...model2!.results, ...model3!.results];
        list = results;
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
    ref.watch(homePageController);
    final controller = ref.read(homePageController);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              child: CustomTextWidget(context.localized.search, textColor: context.appTheme.secondary, fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: TextField(
                  controller: searchController,
                  style: TextStyle(color: context.appTheme.secondary),
                ),
              ),
            ),
            SizedBox(height: 120.h)
          ],
        ),
      ),
    );
  }
}
