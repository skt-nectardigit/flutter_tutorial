import 'package:flutter/material.dart';
import 'package:flutter_tutorial/travel_app/widgets/app_large_text.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController= TabController(length: 3, vsync: this);
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //First Element
              Row(
                children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.menu, color: Colors.black54,)),
                  Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                      image: const DecorationImage(
                        image: AssetImage("assets/drawables/andriod_developer.jpg")
                      )
                    ),
                  )
                ],
              ),
              //Second Element
              const SizedBox(height: 20,),
              AppLargeText(text: "Discover"),
              //Third Element
              /*const SizedBox(height: 20,),
              Container(
                child:   TabBar(controller: tabController,labelColor: Colors.black,tabs: const [
                  Tab(text: "Places",),
                  Tab(text: "Inspiration",),
                  Tab(text: "Emotions",),
                ]),
              ),
              Container(
                height: 300,
                width: double.maxFinite,
                child:  TabBarView(
                    controller: tabController,
                  children: const [
                    Text("Hello"),
                    Text("Hi"),
                    Text("Bye"),
                  ],
                ),
              )*/
              //Fourth Element


            ],
          ),
        ),
      ),
    );
  }
}
