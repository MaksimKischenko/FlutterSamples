import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:universal_realism_art/generated/translations.g.dart';

class RefreshHeader extends StatelessWidget {
  const RefreshHeader({
    Key? key,
  }): super(key: key);
  
  @override
  Widget build(BuildContext context) => defaultTargetPlatform == TargetPlatform.iOS
      ? ClassicHeader(
        idleText: t.widgets.refreshHeader.idle,
      )
      : const MaterialClassicHeader();
}