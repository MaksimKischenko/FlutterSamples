
import 'package:flutter/material.dart';
import 'package:widgets_example/screens/screens.dart';

import 'models/models.dart';



void main() {
runApp(WidgetsExampleApp());
} 

final _layoutDemos = [
  Demo(
    name: 'FittedBox',
    route: FittedBoxExample.routName, 
    builder: (context) => FittedBoxExample()
  ),
  Demo(
    name: 'ConstrainedBox',
    route: ConstrainedBoxExample.routName, 
    builder: (context) => ConstrainedBoxExample()
  ),
  Demo(
    name: 'LayoutBuilder ',
    route: LayoutBuilderDemo.routName, 
    builder: (context) => LayoutBuilderDemo()
  ),
  Demo(
    name: 'FlexibleExample ',
    route: FlexibleExample.routName, 
    builder: (context) => FlexibleExample()
  ),
  Demo(
    name: 'AspectRatio ',
    route: AspectRatioExample.routName, 
    builder: (context) => AspectRatioExample()
  )
];

final _fieldsDemos = [
  Demo(
    name: 'TextFormField',
    route: TextFormFieldScreen.routeName,
    builder: (context) =>  TextFormFieldScreen(
      labelText: 'Example_01')),
  Demo(
    name: 'PasswordField',
    route: PasswordField.routeName,
    builder: (context) =>  PasswordField(
      labelText: 'Example_02')),
  Demo(
    name: 'DateField',
    route: AttrDate.routeName,
    builder: (context) =>  AttrDate(
      labelText: 'Example_03')),
  Demo(
    name: 'SearchField',
    route: SearchScreen.routeName,
    builder: (context) =>  SearchScreen()),
  Demo(
    name: 'FocusNodeField',
    route: FocusNodeScreen.routeName,
    builder: (context) =>  FocusNodeScreen()),
  Demo(
    name: 'TextFieldDropDown',
    route: TextFieldDropdownScreen.routeName,
    builder: (context) =>  TextFieldDropdownScreen())

];

final _elementsDemos = [
  Demo(
    name: 'DropOffElement',
    route: DropOffScreen.routeName,
    builder: (context) =>  DropOffScreen()),
  Demo(
    name: 'TippingElement',
    route: TippingsScreen.routeName,
    builder: (context) =>  TippingsScreen()),
  Demo(
    name: 'MenuButtomElement',
    route: MenuBottomScreen.routeName,
    builder: (context) =>  MenuBottomScreen()),
  Demo(
    name: 'ButtomNavigation',
    route: ButtomNavigationScreen.routeName,
    builder: (context) =>  ButtomNavigationScreen()),
  Demo(
    name: 'TableSort',
    route: SortTablePage.routeName,
    builder: (context) =>  SortTablePage()),
  Demo(
    name: 'PopUpMenu',
    route: PopUpMenuButtonScreen.routeName,
    builder: (context) =>  PopUpMenuButtonScreen()),
  Demo(
    name: 'Radio',
    route: RadioScreen.routeName,
    builder: (context) =>  RadioScreen()),
  Demo(
    name: 'Drawer',
    route: DrawerScreen.routeName,
    builder: (context) =>  DrawerScreen()),
  Demo(
    name: 'Floating AppBar',
    route: AppFloating.routeName,
    builder: (context) =>  AppFloating()),

];

final _viewDemos = [
  Demo(
    name: 'StylePicture',
    route: StylePictureScreen.routeName,
    builder: (context) =>  StylePictureScreen()),
  Demo(
    name: 'ResponsiveBuilder_ToolTip',
    route: ToolTipScreen.routeName,
    builder: (context) =>  ToolTipScreen()),
  Demo(
    name: 'LayoutBuilder',
    route: LayoutBuilderScreen.routeName,
    builder: (context) =>  LayoutBuilderScreen()),


  
];

final _fithesDemos = [
  Demo(
    name: 'Hero navigation',
    route: HeroScreen.routeName,
    builder: (context) =>  HeroScreen()),
  Demo(
    name: 'Dismissing Items',
    route: DismissingItemScreen.routeName,
    builder: (context) =>  DismissingItemScreen()),
  Demo(
    name: 'WebSockets',
    route: WebSoccetsScreen.routeName,
    builder: (context) =>  WebSoccetsScreen(
      title: 'WebSockets',
    )),
  Demo(
    name: 'Stepper',
    route: StepperScreen.routeName,
    builder: (context) =>  StepperScreen()),
  Demo(
    name: 'GlobalKey',
    route: GlobalKeyScreen.routeName,
    builder: (context) =>  GlobalKeyScreen()),
  Demo(
    name: 'FutureBuilder',
    route: FutureBuilderScreen.routeName,
    builder: (context) =>  FutureBuilderScreen()),


];

final _animationsDemos = [
  Demo(
    name: 'AnimatedCrossFade',
    route: AnimatedCrossFadeScreen.routeName,
    builder: (context) =>  AnimatedCrossFadeScreen()
  ),
  Demo(
    name: 'Drug/Drop',
    route: DrugDropScreen.routeName,
    builder: (context) =>  DrugDropScreen()
  ),
  Demo(
    name: 'Physics/align',
    route: PhysicsCardDragDemo.routeName,
    builder: (context) =>  PhysicsCardDragDemo()
  ),  
  Demo(
    name: 'AnimatedContainer/size',
    route: AnimatedContainerApp.routeName,
    builder: (context) =>  AnimatedContainerApp()
  ),  
];

final exampleLayoutDemosRoutes = Map.fromEntries(_layoutDemos.map((e) => MapEntry(e.route, e.builder)));

final exampleFieldsDemosRoutes = Map.fromEntries(_fieldsDemos.map((e) => MapEntry(e.route, e.builder)));

final exampleElementsDemosRoutes = Map.fromEntries(_elementsDemos.map((e) => MapEntry(e.route, e.builder)));

final exampleViewsDemosRoutes = Map.fromEntries(_viewDemos.map((e) => MapEntry(e.route, e.builder)));

final exampleNavigationsDemosRoutes = Map.fromEntries(_fithesDemos.map((e) => MapEntry(e.route, e.builder)));

final exampleAnimationsDemosRoutes = Map.fromEntries(_animationsDemos.map((e) => MapEntry(e.route, e.builder)));

final allRoutes = <String, WidgetBuilder> {
  ...exampleLayoutDemosRoutes,
  ...exampleFieldsDemosRoutes,
  ...exampleElementsDemosRoutes,
  ...exampleViewsDemosRoutes,
  ...exampleNavigationsDemosRoutes,
  ...exampleAnimationsDemosRoutes
};


class WidgetsExampleApp extends StatelessWidget {
  
  
  const WidgetsExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
    themeMode: ThemeMode.dark,
    title: 'WidgetsExampleApp',
    theme: ThemeData(
      primarySwatch: Colors.blueGrey
    ),
    routes: allRoutes,
    home: HomeScreen(
      layoutDemos: _layoutDemos,
      fieldsDemos: _fieldsDemos,
      elementsDemos: _elementsDemos,
      viewsDemos: _viewDemos,
      fithesDemos: _fithesDemos,
      animationsDemos: _animationsDemos
    ),
  );
}