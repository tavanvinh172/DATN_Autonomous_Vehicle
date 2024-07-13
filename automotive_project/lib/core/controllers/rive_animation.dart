import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class InitialRiveAnimation extends GetxController {
  Rx<RiveFile>? carAnimation;

  @override
  void onInit(){
    preload();
    super.onInit();
  }

  Future<void> preload() async{
    rootBundle.load('assets/RiveAssets/vehicles.riv').then((value) async {
      carAnimation?.value = RiveFile.import(value);
    });
  }
}