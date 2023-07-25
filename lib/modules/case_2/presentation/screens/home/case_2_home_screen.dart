import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intikom_app/infrastructure/ext/ctx_ext.dart';
import 'package:intikom_app/infrastructure/ext/double_ext.dart';
import 'package:intikom_app/infrastructure/routing/router.gr.dart';

@RoutePage()
class CaseTwoHomeScreen extends StatelessWidget {
  CaseTwoHomeScreen({Key? key}) : super(key: key);
  final menus = [
    {
      "name": 'Stock Transfer',
      "route": StockTransferRoute(),
      "icon": const Icon(Icons.transfer_within_a_station)
    },
    {
      "name": 'User Master Data',
      "route": UserMasterDataRoute(),
      "icon": const Icon(
        Icons.book_rounded,
      ),
    },
    {
      "name": 'Coming Soon',
      "route": null,
      "icon": const Icon(
        Icons.water_outlined,
      ),
    },
    {
      "name": 'Coming Soon',
      "route": null,
      "icon": const Icon(
        Icons.water_outlined,
      )
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: context.color.primary),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat Datang',
                          style: context.text.bodyMedium
                              ?.copyWith(color: context.color.background),
                        ),
                        10.verticalSpace,
                        Text(
                          context.userSession.user.userName,
                          style: context.text.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.color.background),
                        )
                      ],
                    ),
                    Icon(
                      Icons.home_outlined,
                      color: context.color.background,
                      size: 60,
                    )
                  ],
                ),
              ),
              60.verticalSpace,
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: menus.length,
                itemBuilder: (BuildContext context, int index) {
                  final Map<String, dynamic> menu = menus[index];
                  return GestureDetector(
                    onTap: () {
                      if (menu['route'] != null) {
                        context.router.push(menu['route']);
                      }
                    },
                    child: Card(
                      color: context.color.primary,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            menu['name'],
                            style: context.text.bodyLarge
                                ?.copyWith(color: context.color.background),
                          ),
                          menu['icon']!
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
