import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/travel_app/cubit/app_cubit.dart';
import 'package:flutter_tutorial/travel_app/cubit/app_logic.dart';
import 'package:flutter_tutorial/travel_app/data_services/api_client.dart';

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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            color: Colors.transparent,
            foregroundColor: Colors.black,
            systemOverlayStyle: SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
          ),
        ),
        home: BlocProvider<AppCubit>(create:(context)=>AppCubit(apiClient: ApiClient()),
        child: AppLogic(),),
      )
    );
  }
}

