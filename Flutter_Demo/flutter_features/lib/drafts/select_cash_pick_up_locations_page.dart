// import 'package:base_money/base_money.dart';
// import 'package:core/navigation/navigation_manager.dart';
// import 'package:core/utils/build_context_extensions.dart';
// import 'package:core/utils/functions.dart';
// import 'package:core/utils/search_debouncer.dart';
// import 'package:core/utils/sizes.dart';
// import 'package:flutter/material.dart';
// import 'package:lokalise_idt/generated/l10n.dart';
// import 'package:money_transfer_v2/config/money_transfer_ui_configuration.dart';
// import 'package:money_transfer_v2/models/route_parameters/select_cash_pick_up_location_parameters.dart';
// import 'package:money_transfer_v2/network/datamodels/cash_pickup/cash_pick_up_location_datamodel.dart';
// import 'package:money_transfer_v2/network/datamodels/cash_pickup/cash_pick_up_point_datamodel.dart';
// import 'package:money_transfer_v2/network/datamodels/transactions/request/recipient/transaction_recipient_address.dart';
// import 'package:money_transfer_v2/views/pages/base/page_with_arguments.dart';
// import 'package:money_transfer_v2/views/widgets/buttons/exit_button.dart';
// import 'package:money_transfer_v2/views/widgets/mt_2_section_item.dart';
// import 'package:money_transfer_v2/views/widgets/payers_search_field.dart';
// import 'package:money_transfer_v2/views/widgets/select_cash_pick_up_points/locations/new_design/cash_pick_up_location_widget.dart';

// class SelectCashPickUpLocationsPage extends StatefulWidget {
//   const SelectCashPickUpLocationsPage({
//     Key? key,
//   }) : super(key: key);

//   static const String routeName = '/select_cash_pick_up_locations';

//   @override
//   State<SelectCashPickUpLocationsPage> createState() => _SelectCashPickUpLocationsPageState();
// }

// class _SelectCashPickUpLocationsPageState extends State<SelectCashPickUpLocationsPage>
//     implements PageWithParameters {
//   late CashPickUpPointDataModel selectedCashPickUpPoint;
//   final _searchCashPickUpLocationsController = TextEditingController();
//   final _searchFocusNode = FocusNode();
//   late Function({
//     required CashPickUpPointDataModel selectedCashPickUpPoint,
//     required CashPickUpLocationDataModel selectedCashPickUpLocation,
//     required String? cityWithState,
//   }) updateSelectedCashPickData;
//   List<CashPickUpLocationDataModel> _filteredCashPickUpLocationsList = [];
//   List<CashPickUpLocationDataModel> _cashPickUpLocationsList = [];
//   late String? cityWithState;
//   final bool isBuiltForBottomSheet = false;
//   final MTPageWithParameters mtPage = MTPageWithParameters();

//   @override
//   void extractArguments() {
//     var pageArguments = ModalRoute.of(context)?.settings.arguments;
//     if (pageArguments != null && pageArguments is SelectCashPickUpLocationPageParameters) {
//       selectedCashPickUpPoint = pageArguments.selectedCashPickUpPoint;
//       updateSelectedCashPickData = pageArguments.updateSelectedCashPickData;
//       cityWithState = pageArguments.cityWithState;
//       _copyCashPickUpLocations();
//     }
//   }

//   @override
//   void dispose() {
//     _searchFocusNode.dispose();
//     _searchCashPickUpLocationsController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     mtPage.building(this);
//     final lang = S.of(context);
//     final themeData = getdep<MoneyTransferUiConfiguration>().themeDataBuilder(context);
//     return BossMoneyScaffold(
//       title: lang.mt_select_location_text,
//       secondaryActions: const [ExitButton()],
//       hasAnimatedTitle: false,
//       hideAppBarAndTitleOnKeyboardShow: true,
//       themeData: themeData,
//       persistentHeader: BossMoneyPersistentHeader(
//         child: PayersSearchField(
//           themeData: themeData,
//           searchController: _searchCashPickUpLocationsController,
//           focusNode: _searchFocusNode,
//           search: (value) => _filterCashPickUpLocations(value),
//           searchDebouncer: SearchDebouncer(),
//         ),
//         height: KSize.margin5x + KSize.searchBarHeight + KSize.margin2x,
//       ),
//       padding: const EdgeInsets.symmetric(
//         horizontal: KSize.margin4x,
//         vertical: KSize.margin2x,
//       ),
//       builderLazy: (context) {
//         return SliverMainAxisGroup(
//           slivers: [
//             const SliverPadding(padding: EdgeInsets.symmetric(vertical: KSize.margin1x)),
//             SliverToBoxAdapter(
//               child: Text(
//                 S.of(context).mt_any_location_header_text,
//                 style: context.textTheme.bodyLarge?.copyWith(
//                   color: context.colors.onSurfaceVariant,
//                 ),
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             const SliverPadding(padding: EdgeInsets.symmetric(vertical: KSize.margin1x)),
//             DecoratedSliver(
//               decoration: BoxDecoration(
//                 color: themeData.colorScheme.onPrimary,
//                 borderRadius: const BorderRadius.all(Radius.circular(BaseMoneyTheme.radiusDefault)),
//               ),
//               sliver: SliverList.separated(
//                 key: const Key('cash_pick_up_locations_list_view_widget'),
//                 itemCount: _cashPickUpLocationsList.length,
//                 itemBuilder: (context, index) {
//                   final borderRadius = BorderRadius.zero.defineBy(
//                     index: index,
//                     totalCount: _cashPickUpLocationsList.length - 1,
//                   );
//                   return CashPickUpLocationWidget(
//                     themeData: themeData,
//                     borderRadius: borderRadius,
//                     onPopeAction: () {
//                       NavigationManager.pop(context);
//                       if (!isBuiltForBottomSheet) {
//                         NavigationManager.pop(context);
//                       }
//                     },
//                     cashPickUpPoint: selectedCashPickUpPoint,
//                     cashPickUpLocation: _cashPickUpLocationsList[index],
//                     updateSelectedCashPickData: updateSelectedCashPickData,
//                     cityWithState: cityWithState,
//                   );
//                 },
//                 separatorBuilder: (context, index) {
//                   return Divider(
//                     indent: KSize.margin5x,
//                     endIndent: KSize.margin5x,
//                     thickness: 1,
//                     height: 1,
//                     color: themeData.colorScheme.background,
//                   );
//                 },
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _copyCashPickUpLocations() {
//     _filteredCashPickUpLocationsList = selectedCashPickUpPoint.locations;
//     if (cityWithState != null) {
//       _filteredCashPickUpLocationsList.removeWhere(
//         (element) => element.address.cityWithState != cityWithState,
//       );
//     }
//     _cashPickUpLocationsList = _filteredCashPickUpLocationsList;
//   }

//   ///The entry will be matched and displayed if every of the search terms
//   ///(space separated) will be contained in one of the following fields:
//   ///country/city/state/addressLine1/addressLine2.
//   bool _locationSearchCondition(
//     CashPickUpLocationDataModel location,
//     String searchTerm,
//   ) {
//     return location.name.toLowerCase().contains(searchTerm) ||
//         (location.address.country?.name?.toLowerCase().contains(searchTerm) ?? false) ||
//         (location.address.cityWithState.toLowerCase().contains(searchTerm)) ||
//         (location.address.line1?.toLowerCase().contains(searchTerm) ?? false) ||
//         (location.address.line2?.toLowerCase().contains(searchTerm) ?? false);
//   }

//   void _filterCashPickUpLocations(String val) {
//     if (_searchCashPickUpLocationsController.text.isEmpty) {
//       setState(() {
//         _cashPickUpLocationsList = _filteredCashPickUpLocationsList;
//       });
//     } else {
//       var individualWords = _searchCashPickUpLocationsController.text.toLowerCase().split(' ');
//       var locationsThatContainSearchText = <CashPickUpLocationDataModel>[];
//       locationsThatContainSearchText.addAll(
//         _filteredCashPickUpLocationsList.where(
//           (location) => individualWords.every(
//             (searchTerm) => _locationSearchCondition(location, searchTerm),
//           ),
//         ),
//       );
//       setState(() {
//         _cashPickUpLocationsList = locationsThatContainSearchText;
//       });
//     }
//   }
// }
