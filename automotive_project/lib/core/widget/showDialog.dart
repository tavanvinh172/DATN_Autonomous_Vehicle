import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> showMyDialog({required BuildContext context,required  String title,required  Widget content,required  List<Widget> actions}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(title, style: const TextStyle(color: Colors.white),),
          IconButton(onPressed: ()=> Get.back(), icon: const Icon(Icons.close))
        ],),
        content: SizedBox(
          width: 300.0,
          height: 300.0,
          child: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                content,
              ],
            ),
          ),
        ),
        actions: actions,
      );
    },
  );
}