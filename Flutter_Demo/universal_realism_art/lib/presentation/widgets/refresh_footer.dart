import 'package:flutter/material.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:universal_realism_art/color_styles.dart';
import 'package:universal_realism_art/generated/translations.g.dart';



class RefreshFooter extends StatelessWidget {
  final String? noMoreDataMessage;
  final Function()? onTap;

  const RefreshFooter({
    this.noMoreDataMessage,
    this.onTap
  });
  
  @override
  Widget build(BuildContext context) => CustomFooter(
    builder: (context, mode){
      Widget? body;
      if (mode == LoadStatus.idle) {
        body = Text(t.widgets.refreshFooter.statuses.idle);
      }
      else if (mode == LoadStatus.loading) {
        body = CircularProgressIndicator(
          color: ColorStyles.whiteColor,
          backgroundColor: ColorStyles.mainColor,
        );
      }
      else if (mode == LoadStatus.failed) {
        body = Text(t.widgets.refreshFooter.statuses.failed, style: Theme.of(context).textTheme.bodySmall);
      }
      else if (mode == LoadStatus.canLoading) {
        body = Text(t.widgets.refreshFooter.statuses.canLoading, style: Theme.of(context).textTheme.bodySmall);
      } 
      else if (mode == LoadStatus.noMore ){
        body = Text(noMoreDataMessage ?? t.widgets.refreshFooter.statuses.noMoreData, style: Theme.of(context).textTheme.bodySmall);
      }
      return GestureDetector(
        onTap: mode == LoadStatus.idle? onTap : null,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Center(child: body),
        ),
      );
    }
  );
}