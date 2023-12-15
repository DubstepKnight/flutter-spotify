import 'package:flutter/material.dart';

ShapeBorder kBackButtonShape = const RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(30),
  ),
);

Widget kBackBtn = const Icon(
  Icons.arrow_back_ios,
  // color: Colors.black54,
);

List<Widget> tabs = [
  ElevatedButton(
    onPressed: () {
      print('Button 1 pressed');
    },
    child: const Text('Button'),
  ),
  ElevatedButton(
    onPressed: () {
      print('Button 2 pressed');
    },
    child: const Text('Button'),
  ),
  ElevatedButton(
    onPressed: () {
      print('Button 3 pressed');
    },
    child: const Text('Button'),
  ),
];

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      snap: false,
      expandedHeight: 70.0,
      elevation: 0,
      scrolledUnderElevation: 0,
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Center(
          child: Row(
            children: [
              Builder(
                builder: (BuildContext context) {
                  return MaterialButton(
                    color: Colors.green,
                    height: 40,
                    minWidth: 40,
                    elevation: 1,
                    shape: kBackButtonShape,
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
              // ListView(
              //   scrollDirection: Axis.horizontal,
              //   children: tabs,
              // ),
            ],
          ),
        ),
      ),
      automaticallyImplyLeading: false,
    );
  }
}
