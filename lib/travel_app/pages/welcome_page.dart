import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/travel_app/cubit/app_cubit.dart';
import 'package:flutter_tutorial/travel_app/misc/colors.dart';
import 'package:flutter_tutorial/travel_app/pages/main_page.dart';
import 'package:flutter_tutorial/travel_app/widgets/app_large_text.dart';
import 'package:flutter_tutorial/travel_app/widgets/app_text.dart';
import 'package:flutter_tutorial/travel_app/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  var images = [
    "assets/drawables/welcome-one.png",
    "assets/drawables/welcome-two.png",
    "assets/drawables/welcome-three.png"
  ];
  var titles = ["Trips", "Flies", "Floats"];
  var subtitles = ["Mountain", "Paragliding", "Rivers"];
  var details = [
    "Mountain hikes gives you an incredible sense of freedom along with endurance test",
    "Fly in the open sky with the birds and free your body and mind.",
    "Rafting is the way get wet in enjoyment of nature"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: images.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
              padding: const EdgeInsets.only(left: 10),
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(images[index]), fit: BoxFit.cover)),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 200,
                      ),
                      AppLargeText(text: titles[index]),
                      const SizedBox(
                        height: 10,
                      ),
                      AppText(text: subtitles[index]),
                      const SizedBox(
                        height: 10,
                      ),
                      AppText(
                        text: details[index],
                        size: 18,
                        color: AppColors.textColor1,
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubit>(context).getPlacesdata();
                            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Hello")));
                            BlocProvider.of<AppCubit>(context).checkInternet();
                          },
                          child: ResponsiveButton())
                    ],
                  ),
                ],
              ));
        },
      ),
    );
  }
}
