import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'presentation.dart';

final router = GoRouter(
  initialLocation: '/main',
  debugLogDiagnostics: true, 
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
        child: const SplashScreen(),   
      ),
    ),
    GoRoute(
      path: '/main',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
        child: const MainScreen(),   
      ),
    ),    
    // GoRoute(
    //   path: '/signUp',
    //   pageBuilder: (context, state) => CustomTransitionPage<void>(
    //     key: state.pageKey,
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) => 
    //         FadeTransition(opacity: animation, child: child),
    //     child: const SignUpScreen(),   
    //   ),
    // ), 
    // GoRoute(
    //   path: '/reset',
    //   pageBuilder: (context, state) => CustomTransitionPage<void>(
    //     key: state.pageKey,
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) =>
    //         FadeTransition(opacity: animation, child: child),
    //     child: const ResetPasswordScreen(),   
    //   ),
    // ),           
    // GoRoute(
    //   path: '/home',
    //   pageBuilder: (context, state) => CustomTransitionPage<void>(
    //     key: state.pageKey,
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) =>
    //         FadeTransition(opacity: animation, child: child),
    //     child: const HomeScreen(),   
    //   ),
    // ),    
    // GoRoute(
    //   name: 'poem',
    //   path: '/poem',
    //   pageBuilder: (context, state) {
    //     final poem = state.extra as Poem; 
    //     return CustomTransitionPage<Poem>(
    //       key: state.pageKey,
    //         transitionsBuilder: (context, animation, secondaryAnimation, child) =>
    //             FadeTransition(opacity: animation, child: child),
    //         child: PoemScreen(poem: poem)     
    //       );
    //   },      
    // ),         
  ],
);