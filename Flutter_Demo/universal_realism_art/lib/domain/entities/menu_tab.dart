import 'package:universal_realism_art/generated/translations.g.dart';

enum MenuTab {
  art('assets/icons/art.svg'),
  info('assets/icons/info.svg'),
  // paymentsInfo(''),
  settings('assets/icons/settings.svg');

  const MenuTab(this.location);
  final String location;
}

mixin MenuTabTooltip {
  static final Map<MenuTab, String> menuTabKeys = {
    MenuTab.art: t.mobileScreens.main.menu.art,
    MenuTab.info: t.mobileScreens.main.menu.info,
    MenuTab.settings: t.mobileScreens.main.menu.settings
  };
}


