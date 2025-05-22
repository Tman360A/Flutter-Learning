import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/FoodTracking.dart';
import 'package:go_router/go_router.dart';

GoRouter app_router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Text("Home Page")
    ),
    GoRoute(
      path: '/Food_Tracking',
      builder: (context, state) => FoodTracking()
    )
  ]
);