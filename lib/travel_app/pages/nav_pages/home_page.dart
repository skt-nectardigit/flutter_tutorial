import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/travel_app/cubit/app_cubit.dart';
import 'package:flutter_tutorial/travel_app/misc/colors.dart';
import 'package:flutter_tutorial/travel_app/widgets/app_large_text.dart';
import 'package:flutter_tutorial/travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    var exploreMoreItems = {
      "assets/drawables/balloning.png": "Balloning",
      "assets/drawables/hiking.png": "Hiking",
      "assets/drawables/kayaking.png": "Kayaking",
      "assets/drawables/snorkling.png": "Snorkling"
    };
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AppCubit, AppState>(
          builder: (context, state) {

            if (state is HomePageLoadedState) {
              print("------------HomePageLoadedState---------------");
              var places= state.placesModelList;
              return Container(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //First Element
                    Row(
                      children: [
                        const Icon(
                          Icons.menu,
                          color: Colors.black54,
                        ),
                        Expanded(child: Container()),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey,
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/drawables/andriod_developer.jpg"))),
                        )
                      ],
                    ),
                    //Second Element
                    const SizedBox(
                      height: 20,
                    ),
                    AppLargeText(text: "Discover"),
                    //Third Element
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TabBar(
                          isScrollable: true,
                          controller: tabController,
                          labelColor: Colors.black,
                          labelPadding: const EdgeInsets.only(left: 0, right: 10),
                          indicator:
                          CircleIndicator(color: AppColors.mainColor, radius: 4),
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: const [
                            Tab(
                              text: "Places",
                            ),
                            Tab(
                              text: "Inspiration",
                            ),
                            Tab(
                              text: "Emotions",
                            ),
                          ]),
                    ),
                    Container(
                      height: 250,
                      width: double.maxFinite,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: places.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    margin: const EdgeInsets.only(right: 20, top: 10),
                                    width: 150,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image:  DecorationImage(
                                          image: NetworkImage(places[index].img),
                                          fit: BoxFit.cover),
                                    ),
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [],
                                      ),
                                    ));
                              }),
                          const Text("Hi"),
                          const Text("Bye"),
                        ],
                      ),
                    ),
                    //Fourth Element
                    const SizedBox(
                      height: 30,
                    ),
                    AppLargeText(text: "Explore More"),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 100,
                      width: double.maxFinite,
                      child: ListView.builder(itemCount: exploreMoreItems.length, scrollDirection: Axis.horizontal, itemBuilder: (context, index) {
                        return Container(
                          alignment: Alignment.center,
                          width: 80,
                          margin: const EdgeInsets.only(right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          exploreMoreItems.keys.elementAt(index),
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(height: 5,),
                              AppText(
                                text: exploreMoreItems.values.elementAt(index),
                                color: AppColors.textColor2,
                                size: 12,
                              )
                            ],
                          ),
                        );
                      }),
                    )
                  ],
                ),
              );
            }
            else{
              return const Center(
                child:  Text("Opps !!! Error occured."),
              );
            }
          }, listener: (context, state){
            if (state is InternetConnectedState) {
              print("------------Connected---------------");
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Connected"),
                backgroundColor: Colors.green,
              ));
            }
            else{
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Disconnected"),
                backgroundColor: Colors.red,
              ));
            }
        },
        ),
      ),
    );
  }
}

class CircleIndicator extends Decoration {
  final Color color;
  double radius;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CircleIndicatorPainter(color: color, radius: radius);
  }

  CircleIndicator({
    required this.color,
    required this.radius,
  });
}

class _CircleIndicatorPainter extends BoxPainter {
  final Color color;
  double radius;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;

    //final Offset offset1= Offset(configuration.size!.width/2-radius/2, configuration.size!.height-radius*2);
    final Offset circleOffset = Offset(
        configuration.size!.width / 2, configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }

  _CircleIndicatorPainter({
    required this.color,
    required this.radius,
  });
}
