import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => const PreOnboardingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => const PreOnboardingWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'pre_onboarding',
          path: '/preOnboarding',
          builder: (context, params) => const PreOnboardingWidget(),
        ),
        FFRoute(
          name: 'onboarding1',
          path: '/onboarding1',
          builder: (context, params) => Onboarding1Widget(
            backgroundColor: params.getParam(
              'backgroundColor',
              ParamType.Color,
            ),
          ),
        ),
        FFRoute(
          name: 'onboarding2',
          path: '/onboarding2',
          builder: (context, params) => Onboarding2Widget(
            backgroundColor: params.getParam(
              'backgroundColor',
              ParamType.Color,
            ),
          ),
        ),
        FFRoute(
          name: 'onboarding3',
          path: '/onboarding3',
          builder: (context, params) => Onboarding3Widget(
            backgroundColor: params.getParam(
              'backgroundColor',
              ParamType.Color,
            ),
          ),
        ),
        FFRoute(
          name: 'onboarding4',
          path: '/onboarding4',
          builder: (context, params) => Onboarding4Widget(
            backgroundColor: params.getParam(
              'backgroundColor',
              ParamType.Color,
            ),
          ),
        ),
        FFRoute(
          name: 'onboarding5',
          path: '/onboarding5',
          builder: (context, params) => Onboarding5Widget(
            backgroundColor: params.getParam(
              'backgroundColor',
              ParamType.Color,
            ),
          ),
        ),
        FFRoute(
          name: 'onboarding6',
          path: '/onboarding6',
          builder: (context, params) => Onboarding6Widget(
            backgroundColor: params.getParam(
              'backgroundColor',
              ParamType.Color,
            ),
          ),
        ),
        FFRoute(
          name: 'onboarding7',
          path: '/onboarding7',
          builder: (context, params) => Onboarding7Widget(
            backgroundColor: params.getParam(
              'backgroundColor',
              ParamType.Color,
            ),
          ),
        ),
        FFRoute(
          name: 'onboarding8',
          path: '/onboarding8',
          builder: (context, params) => Onboarding8Widget(
            backgroundColor: params.getParam(
              'backgroundColor',
              ParamType.Color,
            ),
          ),
        ),
        FFRoute(
          name: 'onboarding9',
          path: '/onboarding9',
          builder: (context, params) => Onboarding9Widget(
            backgroundColor: params.getParam(
              'backgroundColor',
              ParamType.Color,
            ),
          ),
        ),
        FFRoute(
          name: 'onboarding10',
          path: '/onboarding10',
          builder: (context, params) => Onboarding10Widget(
            backgroundColor: params.getParam(
              'backgroundColor',
              ParamType.Color,
            ),
          ),
        ),
        FFRoute(
          name: 'pre-paywall',
          path: '/prePaywall',
          builder: (context, params) => PrePaywallWidget(
            backgroundColor: params.getParam(
              'backgroundColor',
              ParamType.Color,
            ),
          ),
        ),
        FFRoute(
          name: 'paywall',
          path: '/paywall',
          // BYPASS PAYWALL - Redirect to HomePage instead
          builder: (context, params) => const HomePageWidget(),
          // builder: (context, params) => const PaywallWidget(),
        ),
        FFRoute(
          name: 'success',
          path: '/success',
          builder: (context, params) => const SuccessWidget(),
        ),
        FFRoute(
          name: 'Flashcards',
          path: '/flashcards',
          builder: (context, params) => const FlashcardsWidget(),
        ),
        FFRoute(
          name: 'Tests',
          path: '/tests',
          builder: (context, params) => const TestsWidget(),
        ),
        FFRoute(
          name: 'StudyPage',
          path: '/studyPage',
          builder: (context, params) => const StudyPageWidget(),
        ),
        FFRoute(
          name: 'GeneralKnowledge',
          path: '/generalKnowledge',
          builder: (context, params) => const GeneralKnowledgeWidget(),
        ),
        FFRoute(
          name: 'AirBrakesTestPage1',
          path: '/airBrakesTestPage1',
          builder: (context, params) => const AirBrakesTestPage1Widget(),
        ),
        FFRoute(
          name: 'GeneralKnowledge1',
          path: '/generalKnowledge1',
          builder: (context, params) => const GeneralKnowledge1Widget(),
        ),
        FFRoute(
          name: 'CombinationVehiclesTest',
          path: '/combinationVehiclesTest',
          builder: (context, params) => const CombinationVehiclesTestWidget(),
        ),
        FFRoute(
          name: 'DoubleTriplesTest',
          path: '/doubleTriplesTest',
          builder: (context, params) => const DoubleTriplesTestWidget(),
        ),
        FFRoute(
          name: 'GeneralKnowledgeTest',
          path: '/generalKnowledgeTest',
          builder: (context, params) => const GeneralKnowledgeTestWidget(),
        ),
        FFRoute(
          name: 'DrivingTest',
          path: '/drivingTest',
          builder: (context, params) => const DrivingTestWidget(),
        ),
        FFRoute(
          name: 'HazardousMaterialTest',
          path: '/hazardousMaterialTest',
          builder: (context, params) => const HazardousMaterialTestWidget(),
        ),
        FFRoute(
          name: 'PassengerTransportTest',
          path: '/passengerTransportTest',
          builder: (context, params) => const PassengerTransportTestWidget(),
        ),
        FFRoute(
          name: 'AirBrakes',
          path: '/airBrakes',
          builder: (context, params) => const AirBrakesWidget(),
        ),
        FFRoute(
          name: 'CombinationVehiclesFC',
          path: '/combinationVehiclesFC',
          builder: (context, params) => const CombinationVehiclesFCWidget(),
        ),
        FFRoute(
          name: 'DoubleTriplesFC',
          path: '/doubleTriplesFC',
          builder: (context, params) => const DoubleTriplesFCWidget(),
        ),
        FFRoute(
          name: 'DrivingTestFC',
          path: '/drivingTestFC',
          builder: (context, params) => const DrivingTestFCWidget(),
        ),
        FFRoute(
          name: 'GeneralKnowledgeFC',
          path: '/generalKnowledgeFC',
          builder: (context, params) => const GeneralKnowledgeFCWidget(),
        ),
        FFRoute(
          name: 'HazardousMaterialFC',
          path: '/hazardousMaterialFC',
          builder: (context, params) => const HazardousMaterialFCWidget(),
        ),
        FFRoute(
          name: 'PassengerTransportFC',
          path: '/passengerTransportFC',
          builder: (context, params) => const PassengerTransportFCWidget(),
        ),
        FFRoute(
          name: 'TankersFC',
          path: '/tankersFC',
          builder: (context, params) => const TankersFCWidget(),
        ),
        FFRoute(
          name: 'GKTest1',
          path: '/gKTest1',
          builder: (context, params) => const GKTest1Widget(),
        ),
        FFRoute(
          name: 'AirBreaksTest2024',
          path: '/airBreaksTest2024',
          builder: (context, params) => const AirBreaksTest2024Widget(),
        ),
        FFRoute(
          name: 'CombinationVehiclesTest2024',
          path: '/combinationVehiclesTest2024',
          builder: (context, params) => const CombinationVehiclesTest2024Widget(),
        ),
        FFRoute(
          name: 'DoubleTripleTest2024',
          path: '/doubleTripleTest2024',
          builder: (context, params) => const DoubleTripleTest2024Widget(),
        ),
        FFRoute(
          name: 'HamzatTest2024',
          path: '/hamzatTest2024',
          builder: (context, params) => const HamzatTest2024Widget(),
        ),
        FFRoute(
          name: 'PassengerVehiclesTest2024',
          path: '/passengerVehiclesTest2024',
          builder: (context, params) => const PassengerVehiclesTest2024Widget(),
        ),
        FFRoute(
          name: 'PreTripTest2024',
          path: '/preTripTest2024',
          builder: (context, params) => const PreTripTest2024Widget(),
        ),
        FFRoute(
          name: 'SchoolBusTest2024',
          path: '/schoolBusTest2024',
          builder: (context, params) => const SchoolBusTest2024Widget(),
        ),
        FFRoute(
          name: 'TankerVehiclesTest2024',
          path: '/tankerVehiclesTest2024',
          builder: (context, params) => const TankerVehiclesTest2024Widget(),
        ),
        FFRoute(
          name: 'GeneralKnowledgeTest2024',
          path: '/generalKnowledgeTest2024',
          builder: (context, params) => const GeneralKnowledgeTest2024Widget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
