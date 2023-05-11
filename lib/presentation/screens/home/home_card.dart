import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cash/data/model/dashboard_response.dart';
import 'package:smart_cash/data/utils/base_url.dart';
import 'package:smart_cash/presentation/controller/dashboard_controller.dart';
import 'package:smart_cash/presentation/resources/color_manager.dart';
import 'package:smart_cash/presentation/resources/style_manager.dart';
import 'package:smart_cash/presentation/screens/home/home.dart';

class HomeViewCard extends StatelessWidget {
  final ApiData? apiData;

  const HomeViewCard({Key? key, required this.apiData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(BaseUrl.imageurl+apiData!.provider!.imagePath.toString()),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    apiData!.percentage.toString() +
                                        "\% Cashback",
                                    style: getSemiBoldStyle(
                                        color: Colors.redAccent, fontSize: 15),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    apiData!.provider!.note.toString(),
                                    style: getBoldStyle(
                                        color: Colormanager.black,
                                        fontSize: 15),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(apiData!.provider!.businessName.toString(),style: getRegularStyle(color: Colors.yellow.shade700),),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
