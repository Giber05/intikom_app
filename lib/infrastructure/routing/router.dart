import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Screen,Route")
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, path: '/login'),
        AutoRoute(page: SplashRoute.page, path: '/splash', initial: true),
        AutoRoute(page: HomeRoute.page, path: '/home'),
        AutoRoute(page: CaseOneRoute.page, path: '/case-1'),
        AutoRoute(page: CaseTwoHomeRoute.page, path: '/case-2'),
        AutoRoute(page: StockTransferRoute.page, path: '/stock-transfer'),
        AutoRoute(page: UserMasterDataRoute.page, path: '/user-master-data'),
      ];
}
