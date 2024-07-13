import 'package:automotive_project/core/values/app_colors.dart';
import 'package:automotive_project/core/values/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildTerminal extends StatelessWidget {
  const BuildTerminal(
      {super.key, required this.datas, required this.scrollController});
  final List<List<int>> datas;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(8.0),
      height: size.height / 3.5,
      decoration: const BoxDecoration(
          color: AppColors.lightGreyColor,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Obx(
        () => ListView.builder(
            shrinkWrap: true,
            itemCount: datas.length,
            controller: scrollController,
            itemBuilder: (context, index) {
              final val = datas[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '>Cảm biến trái: ${val[0]} cm',
                    style: MyThemes.textTheme.titleLarge!
                        .copyWith(color: Colors.green),
                  ),
                  Text(
                    '>Cảm biến cận trái: ${val[1]} cm',
                    style: MyThemes.textTheme.titleLarge!
                        .copyWith(color: Colors.green),
                  ),
                  Text(
                    '>Cảm biến phải: ${val[2]} cm',
                    style: MyThemes.textTheme.titleLarge!
                        .copyWith(color: Colors.green),
                  ),
                  Text(
                    '>Cảm biến cân phải: ${val[3]} cm',
                    style: MyThemes.textTheme.titleLarge!
                        .copyWith(color: Colors.green),
                  ),
                  Text(
                    '>Cảm biến giữa ${val[4]} cm',
                    style: MyThemes.textTheme.titleLarge!
                        .copyWith(color: Colors.green),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
