import 'package:automotive_project/core/values/app_images.dart';
import 'package:automotive_project/modules/main/model/menu_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum MenuCode { HOME, SETTINGS }

extension MenuCodeExtensions on MenuCode {
  BottomNavItem toBottomNavItem(AppLocalizations appLocalization) {
    switch (this) {
      case MenuCode.HOME:
        return BottomNavItem(
          navTitle: appLocalization.bottomNavHome,
          iconSvgName: AppImages.homeNavigation,
          menuCode: MenuCode.HOME,
        );
      // case MenuCode.FAVORITE:
      //   return BottomNavItem(
      //       navTitle: appLocalization.bottomNavFavorite,
      //       iconSvgName: AppImages.favoriteNavigation,
      //       menuCode: MenuCode.FAVORITE);
      case MenuCode.SETTINGS:
        return BottomNavItem(
            navTitle: appLocalization.bottomNavSettings,
            iconSvgName: AppImages.settingNavigation,
            menuCode: MenuCode.SETTINGS);
    }
  }
}
