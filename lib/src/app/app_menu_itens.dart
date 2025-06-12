import 'package:flutter/material.dart';
import 'package:utilidades/src/models/menu_models.dart';
import 'package:utilidades/src/views/home_view.dart';

final List<MenuModels> appMenuItemns = [
  MenuModels
  (title: "Nome",
   icon: Icons.home,
    route: "/home",
     page: const HomeView()),
];