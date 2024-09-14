// import 'dart:async';

// import 'package:core/core.dart';
// import 'package:flutter/material.dart';
// import 'package:settings/managers/rate_app_info_service.dart';
// import 'package:settings/models/rate_app/rate_app_analytics_event.dart';
// import 'package:settings/utils/analytics/settings_analytics_helper.dart';
// import 'package:settings/views/pages/report/send_report_page.dart';

// enum SendReportState { initial, loading, done, error }

// class SendReportViewModel extends ChangeNotifier with Mountable {
//   SendReportViewModel({
//     required RateAppInfoService infoService,
//     required SettingsAnalyticsHelper settingsAnalyticsHelper,
//   })  : _settingsAnalyticsHelper = settingsAnalyticsHelper,
//         _infoService = infoService;

//   final RateAppInfoService _infoService;
//   final SettingsAnalyticsHelper _settingsAnalyticsHelper;

//   SendReportState _state = SendReportState.initial;

//   SendReportState get state => _state;

//   set state(SendReportState state) {
//     _state = state;
//     notifyListeners();
//   }

//   bool get isLoading => _state == SendReportState.loading;

//   FutureOr<void> onSendReport({
//     required String note,
//     required String product,
//   }) async {
//     try {
//       state = SendReportState.loading;
//       await _infoService.sendUserReport(reportNote: note);
//       _trackSendReportPressedEvent(note);
//       state = SendReportState.done;
//       _trackThanksScrOpenEvent(note);
//     } catch (error, stackTrace) {
//       state = SendReportState.error;
//       Log.error(
//         'Fail to send report on issue',
//         exception: error,
//         stackTrace: stackTrace,
//       );
//     }
//     notifyListeners();
//   }

//   void _trackSendReportPressedEvent(String reportNote) {
//     _settingsAnalyticsHelper.trackAmplitudeAndGAEvent(
//       customEvent: RateAppAnalyticsEvent.sendReportPressed.key,
//       extraParams: {
//         RateAppEventProperty.reportNote.value: reportNote,
//       },
//       currentRouteName: SendReportPage.routeName,
//     );
//   }

//   void _trackThanksScrOpenEvent(String reportNote) {
//     _settingsAnalyticsHelper.trackAmplitudeAndGAEvent(
//       customEvent: RateAppAnalyticsEvent.thanksScrOpen.key,
//       extraParams: {
//         RateAppEventProperty.screenName.value: SendReportPage.routeName,
//         RateAppEventProperty.reviewNote.value: reportNote,
//       },
//     );
//   }
// }
