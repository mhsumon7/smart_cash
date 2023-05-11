import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cash/data/model/dashboard_response.dart';
import 'package:smart_cash/presentation/resources/string_manager.dart';
import 'package:smart_cash/presentation/resources/style_manager.dart';
import 'package:smart_cash/presentation/screens/home/home_card.dart';
import 'package:smart_cash/presentation/screens/home/home_card2.dart';
import '../../controller/dashboard_controller.dart';
import '../../controller/internetchecker_controller.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../no_internet/internetchecker_view.dart';
import 'navigation.dart';

class HomeViewNotToken extends GetView<DashboardController> {
  final ApiData? apiData;

  const HomeViewNotToken({Key? key, this.apiData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: TopSection(scaffoldKey: scaffoldKey),
            ),
            Padding(
              padding: EdgeInsets.only(top: 150),
              child: Container(
                  height: 300,
                  child: RefreshIndicator(
                    onRefresh: () async {
                      controller.getDashboardDataNonToken();
                    },
                    child: controller.obx(
                          (response) => response == null
                          ? Text(
                        'not ok',
                        style: TextStyle(color: Colors.red),
                      )
                          : ListView.builder(
                          itemCount: response.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 300,
                                  color: Colormanager.white,
                                  child: HomeViewCardHorizontal(
                                    apiData: response[index],
                                  )
                              ),
                            );
                          }),
                    ),
                  )),
            ),

            // Container(
            //   width: 100,
            //   height: 100,
            //   padding: const EdgeInsets.all(8.0),
            //   child: RefreshIndicator(
            //     onRefresh: () async {
            //       controller.getDashboardData();
            //     },
            //     child: Obx(() => controller.obx(
            //             (response) => response == null
            //             ? EmptyFailureNoInternetView(onPressed: () {
            //           controller.getDashboardData();
            //         })
            //             : ListView.builder(
            //           itemCount: response.length,
            //           scrollDirection: Axis.horizontal,
            //           itemBuilder: (BuildContext context, index) {
            //             return Text('ok');
            //           },
            //         ),
            //         onEmpty: EmptyFailureNoInternetView(
            //           onPressed: () {
            //             controller.getDashboardData();
            //           },
            //         ),
            //         onLoading: Center(
            //           child: CircularProgressIndicator(),
            //         ),
            //         onError: (error) => SingleChildScrollView(
            //           physics: const BouncingScrollPhysics(
            //               parent: AlwaysScrollableScrollPhysics()),
            //           child: EmptyFailureNoInternetView(
            //             onPressed: () {
            //               controller.getDashboardData();
            //             },
            //           ),
            //         ))),
            //   ),
            // ),

            // Padding(
            //   padding: const EdgeInsets.only(top: 145),
            //   child: Container(
            //     width: 100,
            //     height: 100,
            //     color: Colors.red,
            //     child: RefreshIndicator(
            //       onRefresh: () async {
            //         controller.getDashboardData();
            //       },
            //       child: Obx(() => controller.obx(
            //           (response) => response == null
            //               ? EmptyFailureNoInternetView(onPressed: () {
            //                   controller.getDashboardData();
            //                 })
            //               : ListView.builder(
            //                   itemCount: response.length,
            //                   scrollDirection: Axis.horizontal,
            //                   itemBuilder: (BuildContext context, index) {
            //                     return Text('ok');
            //                   },
            //                 ),
            //           onEmpty: EmptyFailureNoInternetView(
            //             onPressed: () {
            //               controller.getDashboardData();
            //             },
            //           ),
            //           onLoading: Center(
            //             child: CircularProgressIndicator(),
            //           ),
            //           onError: (error) => SingleChildScrollView(
            //                 physics: const BouncingScrollPhysics(
            //                     parent: AlwaysScrollableScrollPhysics()),
            //                 child: EmptyFailureNoInternetView(
            //                   onPressed: () {
            //                     controller.getDashboardData();
            //                   },
            //                 ),
            //               ))),
            //     ),
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.only(top: 400),
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.getDashboardDataNonToken();
                },
                child: Obx(() => Get.find<InternetcheckerController>()
                    .connectionStatus
                    .value ==
                    1
                    ? controller.obx(
                        (response) => response == null
                        ? EmptyFailureNoInternetView(onPressed: () {
                      controller.getDashboardDataNonToken();
                    })
                        : ListView.builder(
                      itemCount: response.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, index) {
                        return HomeViewCard(
                          apiData: response[index],
                        );
                      },
                    ),
                    onEmpty: EmptyFailureNoInternetView(
                      onPressed: () {
                        controller.getDashboardDataNonToken();
                      },
                    ),
                    onLoading: Center(
                      child: CircularProgressIndicator(),
                    ),
                    onError: (error) => SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      child: EmptyFailureNoInternetView(
                        onPressed: () {
                          controller.getDashboardDataNonToken();
                        },
                      ),
                    ))
                    : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  child: EmptyFailureNoInternetView(
                    onPressed: () {
                      controller.getDashboardDataNonToken();
                    },
                  ),
                )),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colormanager.white,
                height: 60,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.home),
                        Text("Home"),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.person),
                        Text("Profile"),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.feedback_outlined),
                        Text("Support"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: NavigationBarDrawer(),
    );
  }
}

class TopSection extends StatelessWidget {
  const TopSection({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 142,
      color: Colormanager.primary,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  if (scaffoldKey.currentState!.isDrawerOpen) {
                    scaffoldKey.currentState!.openEndDrawer();
                  } else {
                    scaffoldKey.currentState!.openDrawer();
                  }
                },
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Icon(
                    Icons.menu,
                    color: Colormanager.grey,
                    size: 40,
                  ),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.homeRoute);
                },
                child: Text(
                  AppStrings.smartcash,
                  style:
                  getSemiBoldStyle(color: Colormanager.white, fontSize: 30),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    height: 30,
                    child: Icon(Icons.search_outlined),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
