
import 'package:auto_route/annotations.dart';
import 'package:routing_test/screens/first_route.dart';
import 'package:routing_test/screens/second_route.dart';



@MaterialAutoRouter(     
  replaceInRouteName: 'Route,Page',         
  routes: <AutoRoute>[        
    AutoRoute(page: FirstRoute, initial: true),        
    AutoRoute(page: SecondRoute),        
  ],        
)        

class $Routes {}        