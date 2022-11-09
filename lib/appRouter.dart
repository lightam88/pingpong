import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pingpong/View/view.dart';

class AppRouter {
  // all the route paths. So that we can access them easily  across the app
  static const root = '/';
  static const matches = '/matches';
  static const scores = '/scores';
  static const addMatches = '/add_matches';
  static const addPlayer = '/add_player';
  static const notFound = '/not_found';

  // static const singleArticleWithParams = '/article/:id';
  /// get route name with parameters, here [id] is optional because we need [:id] to define path on [_singleArticleWithParams]
  static singleArticleWithParams([String? id]) => '/article/${id ?? ':id'}';

  /// private static methods that are accessible only in this class and not from outside
  static Widget _homePageRouteBuilder(
          BuildContext context, GoRouterState state) =>
      const HomeScreen();
  static Widget _matchesRouteBuilder(
          BuildContext context, GoRouterState state) =>
      const MatchScreen();
  static Widget _addMatchesRouteBuilder(
          BuildContext context, GoRouterState state) =>
      const AddMatchScreen();
  static Widget _scoresRouteBuilder(
          BuildContext context, GoRouterState state) =>
      const ScoreScreen();
  static Widget _addPlayerRouteBuilder(
          BuildContext context, GoRouterState state) =>
      AddPlayerScreen();
  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      const NotFoundScreen();

  /// use this in [MaterialApp.router]
  static final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(path: root, builder: _homePageRouteBuilder),
      GoRoute(path: matches, builder: _matchesRouteBuilder),
      GoRoute(path: scores, builder: _scoresRouteBuilder),
      GoRoute(path: addMatches, builder: _addMatchesRouteBuilder),
      GoRoute(path: addPlayer, builder: _addPlayerRouteBuilder)
    ],
    errorBuilder: errorWidget,
  );

  static GoRouter get router => _router;
}
