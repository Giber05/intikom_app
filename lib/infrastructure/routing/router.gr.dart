// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:intikom_app/modules/authentication/presentation/screens/login/login_screen.dart'
    as _i1;
import 'package:intikom_app/modules/authentication/presentation/screens/splash/splash_screen.dart'
    as _i2;
import 'package:intikom_app/modules/case_1/presentation/screens/case_1.dart'
    as _i4;
import 'package:intikom_app/modules/case_2/presentation/screens/home/case_2_home_screen.dart'
    as _i5;
import 'package:intikom_app/modules/case_2/presentation/screens/stock_transfer/stock_transfer_screen.dart'
    as _i6;
import 'package:intikom_app/modules/case_2/presentation/screens/user_master_data/user_master_data.dart'
    as _i7;
import 'package:intikom_app/modules/home/presentation/screens/home/home_screen.dart'
    as _i3;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SplashScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    CaseOneRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CaseOneScreen(),
      );
    },
    CaseTwoHomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child:  _i5.CaseTwoHomeScreen(),
      );
    },
    StockTransferRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.StockTransferScreen(),
      );
    },
    UserMasterDataRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.UserMasterDataScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SplashScreen]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CaseOneScreen]
class CaseOneRoute extends _i8.PageRouteInfo<void> {
  const CaseOneRoute({List<_i8.PageRouteInfo>? children})
      : super(
          CaseOneRoute.name,
          initialChildren: children,
        );

  static const String name = 'CaseOneRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CaseTwoHomeScreen]
class CaseTwoHomeRoute extends _i8.PageRouteInfo<void> {
  const CaseTwoHomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          CaseTwoHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'CaseTwoHomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.StockTransferScreen]
class StockTransferRoute extends _i8.PageRouteInfo<void> {
  const StockTransferRoute({List<_i8.PageRouteInfo>? children})
      : super(
          StockTransferRoute.name,
          initialChildren: children,
        );

  static const String name = 'StockTransferRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.UserMasterDataScreen]
class UserMasterDataRoute extends _i8.PageRouteInfo<void> {
  const UserMasterDataRoute({List<_i8.PageRouteInfo>? children})
      : super(
          UserMasterDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserMasterDataRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
