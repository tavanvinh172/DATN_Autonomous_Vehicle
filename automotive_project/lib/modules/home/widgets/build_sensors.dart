import 'package:automotive_project/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildSensors extends StatelessWidget {
  const BuildSensors({super.key, required this.datas});
  final List<List<int>> datas;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
          color: AppColors.lightGreyColor,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Obx(
        () => ListView.builder(
            shrinkWrap: true,
            itemCount: datas.length,
            itemBuilder: (context, index) {
              final val = datas[index];
              print('val: $val');
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Text((val[0] / 100).toString()),
                  SizedBox(
                    width: 50,
                    height: size.height / 3.5,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: LinearProgressIndicator(
                        color: Colors.green.withOpacity(0.5),
                        value: val[0] / 100,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: size.height / 3.5,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: LinearProgressIndicator(
                        color: Colors.green.withOpacity(0.5),
                        value: val[1] / 100,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: size.height / 3.5,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: LinearProgressIndicator(
                        color: Colors.green.withOpacity(0.5),
                        value: val[2] / 100,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: size.height / 3.5,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: LinearProgressIndicator(
                        color: Colors.green.withOpacity(0.5),
                        value: val[3] / 100,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: size.height / 3.5,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: LinearProgressIndicator(
                        color: Colors.green.withOpacity(0.5),
                        value: val[4] / 100,
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
