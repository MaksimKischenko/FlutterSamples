// import 'package:base_money/base_money.dart';
// import 'package:core/core.dart';
// import 'package:core/utils/gaps.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:forms/forms.dart';
// import 'package:lokalise_idt/lokalise_idt.dart';
// import 'package:settings/managers/rate_app_info_service.dart';
// import 'package:settings/utils/analytics/settings_analytics_helper.dart';

// import 'models/send_report_page_arguments.dart';
// import 'send_report_view_model.dart';
// import 'widgets/exit_button.dart';

// class SendReportPage extends StatefulWidget {
//   static const String routeName = 'send_report_page';
//   const SendReportPage({super.key});

//   @override
//   State<SendReportPage> createState() => _SendReportPageState();
// }

// class _SendReportPageState extends State<SendReportPage> with ValidateFormMixin {
//   late final SendReportPageArguments? args;
//   late final SendReportViewModel _viewModel;
//   final int maxFeedbackLength = 1024;
//   late String _productName;
//   late String _initialValue;

//   @override
//   void initState() {
//     super.initState();
//     _viewModel = SendReportViewModel(
//       infoService: getdep<RateAppInfoService>(),
//       settingsAnalyticsHelper: getdep<SettingsAnalyticsHelper>(),
//     );
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _extractArgs();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final lang = S.of(context);
//     final descriptionTextStyle =
//         context.textTheme.bodyLarge?.copyWith(color: context.colors.onSurfaceVariant);
//     return ChangeNotifierBuilder<SendReportViewModel>(
//         notifier: _viewModel,
//         builder: (context, viewModel) {
//           return Form(
//             key: formKey,
//             onChanged: onFormChanged,
//             child: BossMoneyScaffold(
//               title: lang.rate_app_leave_note_dialog_title,
//               secondaryActions: const [ExitButton()],
//               buttonText: lang.app_button_send,
//               onBackPressed: () {
//                 _onBackPressed(_initialValue);
//               },
//               builder: (context) {
//                 return [
//                   Gap.verticalMaterial,
//                   Text(
//                       key: const ValueKey('reportAnIssueRateAppLeaveNoteDialogDescription'),
//                       lang.rate_app_leave_note_dialog_description_of(_productName),
//                       style: descriptionTextStyle),
//                   Gap.verticalMaterialSmall,
//                   FormTextField(
//                     key: const ValueKey('rateAppLeaveANoteForm'),
//                     initialValue: _initialValue,
//                     keyboardType: TextInputType.multiline,
//                     textInputAction: TextInputAction.newline,
//                     minLines: 6,
//                     maxLines: 6,
//                     hasClearButton: false,
//                     hasFixedHeight: false,
//                     showError: true,
//                     autofocus: true,
//                     enabled: !(viewModel.isLoading),
//                     hintText: lang.rate_app_leave_note_hint,
//                     onChanged: (value) => _initialValue = value,
//                     validator: (value) => lengthValidatorWithMessage(
//                       value,
//                       lang.leave_your_comments,
//                     ),
//                     onFieldSubmitted: canContinue ? (_) => onAction() : null,
//                     inputFormatters: [
//                       LengthLimitingTextInputFormatter(maxFeedbackLength),
//                     ],
//                   ),
//                 ];
//               },
//               isButtonLoading: viewModel.isLoading,
//               onButtonTap: onAction,
//             ),
//           );
//         });
//   }

//   void _extractArgs() {
//     _productName = context.args<SendReportPageArguments>()?.productName ?? '';
//     _initialValue = context.args<SendReportPageArguments>()?.filledNote ?? '';
//   }

//   void _onBackPressed(String note) {
//     Navigator.of(context).pop<String>(note);
//   }

//   @override
//   void onAction() async {
//     if (formKey.currentState?.validate() ?? false) {
//       await _viewModel.onSendReport(
//         note: _initialValue,
//         product: _productName,
//       );
//     }
//   }
// }
