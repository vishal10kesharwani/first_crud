import 'dart:async';

import 'package:first_crud/models/user_model.dart';
import 'package:first_crud/utils/color_constants.dart';
import 'package:flutter/material.dart';

import '../api_services/apiServices.dart';
import '../utils/string_constants.dart';
import 'userUpdate.dart';

void main() {
  runApp(const createUserDetails());
}

class createUserDetails extends StatefulWidget {
  const createUserDetails({super.key});

  @override
  State<createUserDetails> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<createUserDetails> {
  final TextEditingController _controller = TextEditingController();
  Future<UserDetail>? _futureUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create User',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text(StringConstants.appName),
        ),
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: buildColumn()),
      ),
    );
  }

  Padding buildColumn() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text.rich(
              TextSpan(
                children: <InlineSpan>[
                  WidgetSpan(
                    child: Text(
                      'Add User',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.mycolor),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.clear),
              labelText: 'Enter Title',
              hintText: 'Enter your title',
              border: OutlineInputBorder(),
            ),
            controller: _controller,
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  setState(() {
                    _futureUser = createUser(_controller.text);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: const Duration(minutes: 5),
                        content: Text('User Created Successfully!')));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const updateUserDetails()),
                    );
                  });
                },
                child: const Text('Create Data'),
              );
            }),
          ),
        ],
      ),
    );
  }

  FutureBuilder<UserDetail> buildFutureBuilder() {
    return FutureBuilder<UserDetail>(
      future: _futureUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const updateUserDetails()),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
