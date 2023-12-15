import 'package:flutter/material.dart';
import 'package:flutter_spotify/router_config.dart';
import 'package:go_router/go_router.dart';

ShapeBorder kBackButtonShape = const RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(30),
  ),
);

Widget kBackBtn = const Icon(
  Icons.arrow_back_ios,
  // color: Colors.black54,
);

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.label})
      : preferredSize = const Size.fromHeight(60.0);

  final String label;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          // SizedBox(height: 30,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Card(
                elevation: 0,
                shape: kBackButtonShape,
                child: MaterialButton(
                  height: 40,
                  minWidth: 40,
                  elevation: 10,
                  shape: kBackButtonShape,
                  onPressed: () => context.goNamed(Routes.home.name),
                ),
              ),
              Card(
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: InkWell(
                  // onTap: onTitleTapped,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 40,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          'Title',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
