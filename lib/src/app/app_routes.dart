import 'package:flutter/material.dart';

Map<String, WidgetBuilder> generateRoutes(){
  final Map<String, WidgetBuilder> routes = {};

  for(var item in appMenuItemns){
    routes[item.route] = 
    (context) => BaseLayout();
  }

  return routes;
}