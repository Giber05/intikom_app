import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CaseOneScreen extends StatefulWidget {
  const CaseOneScreen({Key? key}) : super(key: key);

  @override
  State<CaseOneScreen> createState() => _CaseOneScreenState();
}

class _CaseOneScreenState extends State<CaseOneScreen> {
  late List<String> items;

  @override
  void initState() {
    super.initState();
    items = buildItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Case 1'),
      ),
      body: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = items[index];
              return Card(
                child: Center(
                    child: FittedBox(fit: BoxFit.scaleDown, child: Text(item))),
              );
            },
          ),
        ],
      ),
    );
  }

  List<String> buildItems() {
    List<String> items = [];
    for (var i = 1; i <= 100; i++) {
      if (i % 3 == 0 && i % 5 == 0) {
        items.add('ThreeFive');
      } else if (i % 3 == 0) {
        items.add('Three');
      } else if (i % 5 == 0) {
        items.add('Five');
      } else {
        items.add(i.toString());
      }
    }
    return items;
  }
}
