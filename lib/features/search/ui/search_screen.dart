import 'package:application/core/helper/app_assets.dart';
import 'package:application/core/helper/app_strings.dart';
import 'package:application/core/helper/spacing.dart';
import 'package:application/core/routing/routes.dart';
import 'package:application/core/theming/app_colors.dart';
import 'package:application/core/theming/text_styles.dart';
import 'package:application/features/search/cubit/search_cubit.dart';
import 'package:application/features/search/cubit/search_states.dart';
import 'package:application/features/search/data/models/search_response.dart';
import 'package:application/features/search/ui/widgets/search_text_field.dart';
import 'package:application/features/search/ui/widgets/searched_movie_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int index = 0;
  TextEditingController searchController = TextEditingController();
  var searchCubit = SearchCubit();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchCubit.getSearchedMovies(searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 35.h),
            child: TextFormField(
              controller: searchController,
              onChanged: (value) {
                searchCubit.getSearchedMovies(value);
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: AppStrings.searchSmall,
                isDense: true,
                enabled: true,
                filled: true,
                hintStyle: TextStyles.font14WhiteRegular.copyWith(
                  color: AppColors.white.withOpacity(0.4),
                ),
                fillColor: AppColors.deepGrey,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.white),
                ),
                prefixIcon: IconButton(
                    onPressed: () {
                      searchCubit.getSearchedMovies(searchController.text);
                      FocusScope.of(context).unfocus();
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 25,
                      color: AppColors.white,
                    )),
              ),
              style: TextStyles.font14WhiteRegular,
            ),
          ),
          searchController.text.isNotEmpty
              ? BlocBuilder<SearchCubit, SearchStates>(
                  bloc: searchCubit,
                  builder: (context, state) {
                    switch (state) {
                      case LoadingSearchState():
                        {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.yellowColor,
                            ),
                          );
                        }
                      case ErrorSearchState():
                        {
                          return Center(
                            child: Text(
                              AppStrings.noMoviesFound,
                              style: TextStyles.font14WhiteRegular,
                            ),
                          );
                        }
                      case SuccessSearchState():
                        {
                          List<Results> movieList = state.result;
                          return Expanded(
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          Routes.movieDetails,
                                          arguments:
                                              movieList[index].id.toString());
                                    },
                                    child: SearchedMovieItem(
                                        results: movieList[index]),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                                itemCount: movieList.length),
                          );
                        }
                    }
                  },
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.noMoviesFound),
                      verticalSpace(10),
                      const Text(
                        AppStrings.noMoviesFound,
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
