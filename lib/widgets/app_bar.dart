import 'package:first_crud/utils/color_constants.dart';
import 'package:first_crud/utils/string_constants.dart';
import 'package:flutter/material.dart';

class app_bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 1, right: 1, top: 20),
      child: Container(
        color: Colors.white70,
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: ColorConstants.mycolor,
                )),
            Text(
              StringConstants.appName,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: ColorConstants.mycolor),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_circle),
              color: ColorConstants.mycolor,
            )
          ],
        ),
      ),
    );
  }
}
