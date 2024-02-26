import 'package:first_crud/screens/createUser.dart';
import 'package:first_crud/utils/color_constants.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class homePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _homePagestate();
  }
}

class _homePagestate extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          app_bar(),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40),
            child: Center(
                child: Text(
              'Welcome TO CRUD!',
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: ColorConstants.mycolor),
            )),
          ),
          SizedBox(
            height: 250,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Image.asset(
              'assets/down-arrow.png',
              width: 250,
              height: 200,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add task',
        backgroundColor: ColorConstants.mycolor,
        child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => createUserDetails()),
              );
            },
            icon: const Icon(Icons.add)),
      ),
    );
  }
}
