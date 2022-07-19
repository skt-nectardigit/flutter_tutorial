import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/http_example/pages/my_homepage.dart';

import 'http_example/cubit/internet_cubit/internet_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> InternetCubit(),
      child: const MaterialApp(
        title: "Flutter App",
        home: MyHomePage(),
      ),
    );
  }
}

