import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'views/welcome_view.dart';
import 'views/home_view.dart';
import 'views/login_view.dart';
import 'views/signup_view.dart';
import 'views/lesson_view.dart';
import 'views/profile_view.dart';
import 'views/leaderboard_view.dart';
import 'views/badges_view.dart';
import 'views/shop_view.dart'; 

void main() {
  runApp(CamerlingoApp());
}

class CamerlingoApp extends StatelessWidget {
  CamerlingoApp({Key? key}) : super(key: key);

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'welcome',
        builder: (context, state) => WelcomeView(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => SignupView(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => HomeView(),
        routes: [
          GoRoute(
            path: 'lesson/:id',
            name: 'lesson',
            builder: (context, state) {
              final lessonId = state.queryParameters['id']!;
              return LessonView(lessonId: lessonId);
            },
          ),
          GoRoute(
            path: 'leaderboard',
            name: 'leaderboard',
            builder: (context, state) => LeaderboardView(),
          ),
          GoRoute(
            path: 'badges',
            name: 'badges',
            builder: (context, state) => BadgesView(),
          ),
          GoRoute(
            path: 'shop',
            name: 'shop',
            builder: (context, state) => ShopView(),
          ),
        ],
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => ProfileView(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Camerlingo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}
