import 'dart:io';

import 'package:automotive_project/bindings/initial_binding.dart';
import 'package:automotive_project/core/values/app_colors.dart';
import 'package:automotive_project/data/local/db/object_box.dart';
import 'package:automotive_project/data/local/preference/preference_manager.dart';
import 'package:automotive_project/data/local/preference/preference_manager_impl.dart';
import 'package:automotive_project/flavors/build_config.dart';
import 'package:automotive_project/flavors/env_config.dart';
import 'package:automotive_project/flavors/environment.dart';
import 'package:automotive_project/network/http_override.dart';
import 'package:automotive_project/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

const String SOCKET = "http://103.149.28.31:5000";

late ObjectBox objectbox;
final socket = IO.io(SOCKET, <String, dynamic>{
  'transports': ['websocket'],
  'autoConnect': false,
});
void main() async {
  EnvConfig devConfig = EnvConfig(
    appName: "Flutter GetX Template Dev",
    baseUrl: "http://localhost:7000",
    shouldCollectCrashLog: true,
  );
  HttpOverrides.global = MyHttpOverrides();
  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  WidgetsFlutterBinding.ensureInitialized();
  objectbox = await ObjectBox.create();
  // InitialBinding().dependencies();
  // MainBinding().dependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final EnvConfig _envConfig = BuildConfig.instance.config;
  final PreferenceManager _preferenceManager = Get.put(PreferenceManagerImpl());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _preferenceManager.getString(PreferenceManager.keyToken),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GetMaterialApp(
              title: _envConfig.appName,
              initialRoute:
                  snapshot.data!.isEmpty ? AppPages.LOGIN : AppPages.INITIAL,
              initialBinding: InitialBinding(),
              getPages: AppPages.routes,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: _getSupportedLocal(),
              theme: ThemeData(
                primarySwatch: AppColors.colorPrimarySwatch,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                brightness: Brightness.light,
                primaryColor: AppColors.colorPrimary,
                // scaffoldBackgroundColor:
                //     AppColors.lightGreyColor.withOpacity(.1),
                textTheme: const TextTheme(
                  labelLarge: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                fontFamily: 'Roboto',
              ),
              debugShowCheckedModeBanner: false,
            );
          }
          return Container();
        });
  }

  List<Locale> _getSupportedLocal() {
    return [
      const Locale('en', ''),
      const Locale('vi', ''),
    ];
  }
}
