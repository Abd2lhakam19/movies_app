import 'package:application/core/helper/app_strings.dart';
import 'package:application/core/theming/app_colors.dart';
import 'package:application/core/theming/text_styles.dart';
import 'package:application/features/search/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({super.key, required this.searchController});
  var searchcubit = SearchCubit();
  TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 35.h),
      child: TextFormField(
        controller: searchController,
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
            borderSide: const BorderSide(width: 1, color: AppColors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(width: 1, color: AppColors.white),
          ),
          prefixIcon: IconButton(
              onPressed: () {
                searchcubit.getSearchedMovies(searchController.text);
              },
              icon: const Icon(
                Icons.search,
                size: 25,
                color: AppColors.white,
              )),
        ),
        style: TextStyles.font14WhiteRegular,
      ),
    );
  }
}
