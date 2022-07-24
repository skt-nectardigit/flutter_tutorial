import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/travel_app/cubit/app_cubit.dart';
import 'package:flutter_tutorial/travel_app/pages/nav_pages/home_page.dart';
import 'package:flutter_tutorial/travel_app/pages/welcome_page.dart';
class AppLogic extends StatefulWidget {
  const AppLogic({Key? key}) : super(key: key);

  @override
  State<AppLogic> createState() => _AppLogicState();
}

class _AppLogicState extends State<AppLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, AppState>(builder: (context, state) {
        if (state is WelcomeState) {
          return WelcomePage();
        }
        if (state is HomePageLoadingState) {
          return const Center(child: CircularProgressIndicator(),);
        }
        if (state is HomePageLoadedState) {
          return HomePage();
        }
        else{
          return Container();
        }
      }),
    );
  }
}
