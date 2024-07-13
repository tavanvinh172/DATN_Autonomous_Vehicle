import 'package:automotive_project/core/values/app_colors.dart';
import 'package:automotive_project/core/values/app_theme.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  const CarCard({
    super.key,
    required this.deviceName,
    required this.ipAddress,
    required this.port,
    required this.date,
  });
  final String deviceName;
  final String ipAddress;
  final String port;
  final String date;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      width: size.width,
      height: size.height * .15,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              width: size.width / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    deviceName,
                    style: MyThemes.textTheme.titleLarge!
                        .copyWith(color: AppColors.colorDark),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$ipAddress/$port',
                    style: MyThemes.textTheme.titleMedium!
                        .copyWith(color: AppColors.colorDark),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // RichText(
                  //   text: TextSpan(
                  //     style: MyThemes.textTheme.titleMedium!
                  //         .copyWith(color: AppColors.colorDark),
                  //     children: [
                  //       const TextSpan(text: 'Ngày tạo: '),
                  //       TextSpan(
                  //           text: advancedformatDateString(date, 'dd-MM-yyyy'))
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
