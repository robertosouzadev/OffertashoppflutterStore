import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:vendor/Components/drawer.dart';
import 'package:vendor/Locale/locales.dart';
import 'package:vendor/baseurl/baseurlg.dart';
import 'package:vendor/beanmodel/revenue/topselling.dart';
import 'package:vendor/constants/color.dart';
import '../Theme/style.dart';
import '../widgets/chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TopSellingItem {
  TopSellingItem(this.img, this.name, this.sold, this.price);

  String img;
  String name;
  String sold;
  String price;
}

class InsightPage extends StatefulWidget {
  @override
  _InsightPageState createState() => _InsightPageState();
}

class _InsightPageState extends State<InsightPage> {
  var http = Client();

  List<TopSellingItemsR> topSellingItems = [];
  TopSellingRevenueOrdCount orderCount;
  bool isLoading = true;
  dynamic apCurrency;

  String storeImage = '';

  @override
  void initState() {
    super.initState();
    getRevenue();
  }

  @override
  void dispose() {
    http.close();
    super.dispose();
  }

  void getRevenue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoading = true;
      storeImage = prefs.getString('store_photo');
      apCurrency = prefs.getString('app_currency');
    });
    http.post(storeProductRevenueUri,
        body: {'store_id': '${prefs.getInt('store_id')}'}).then((value) {
      if (value.statusCode == 200) {
        TopSellingRevenueOrdCount topSellingRevenueOrdCount =
            TopSellingRevenueOrdCount.fromJson(jsonDecode(value.body));
        setState(() {
          orderCount = topSellingRevenueOrdCount;
        });
        if ('${topSellingRevenueOrdCount.status}' == '1') {
          setState(() {
            topSellingItems.clear();
            topSellingItems = List.from(topSellingRevenueOrdCount.data);
          });
        }
      }
      setState(() {
        isLoading = false;
      });
    }).catchError((e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: ColorConstants.white,
      drawer: buildDrawer(context),
      appBar: AppBar(
          title: Text(
            'Insights',
            style: TextStyle(color: ColorConstants.blackFull),
          ),
          centerTitle: true),
      body: Column(
        children: [
          // (storeImage != null && storeImage.length > 0)
          //     ? Image.network(
          //         '$storeImage',
          //         height: 180,
          //         width: MediaQuery.of(context).size.width,
          //         fit: BoxFit.fill,
          //       )
          //     : Container(
          //         height: 180,
          //         width: MediaQuery.of(context).size.width,
          //       ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 24.0),
          //   child: AppBar(
          //     title: Text(
          //       locale.insight,
          //       style:
          //           TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
          //     ),
          //     centerTitle: true,
          //     iconTheme: new IconThemeData(color: Colors.white),
          //   ),
          // ),
          // ListView(
          //   physics: BouncingScrollPhysics(),
          //   children: [
          //     SizedBox(
          //       height: 15,
          //     ),
          // Container(
          //   child: Image.asset('assets/charts.png',fit: BoxFit.fill,),
          //   height: 200,
          //   margin: EdgeInsets.symmetric(horizontal: 10),
          //   decoration: BoxDecoration(
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.grey[400],
          //         blurRadius: 0.0, // soften the shadow
          //         spreadRadius: 0.5, //extend the shadow
          //       ),
          //     ],
          //     borderRadius: BorderRadius.circular(8),
          //     color: Theme.of(context).scaffoldBackgroundColor,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(
          //       horizontal: 10.0, vertical: 16),
          //   child: Text(
          //     locale.topSellingItems,
          //     style: Theme.of(context).textTheme.subtitle1,
          //   ),
          // ),

          // (!isLoading)
          //     ? (topSellingItems != null && topSellingItems.length > 0)
          //         ? ListView.builder(
          //             physics: NeverScrollableScrollPhysics(),
          //             padding: EdgeInsets.symmetric(vertical: 0),
          //             shrinkWrap: true,
          //             itemCount: topSellingItems.length,
          //             itemBuilder: (context, index) {
          //               return buildTopSellingItemCard(
          //                   context,
          //                   topSellingItems[index].varientImage,
          //                   topSellingItems[index].productName,
          //                   '${topSellingItems[index].count}',
          //                   '${topSellingItems[index].revenue}');
          //             })
          //         : Align(
          //             alignment: Alignment.center,
          //             child: Text(locale.nohistoryfound),
          //           )
          //     : ListView.builder(
          //         physics: NeverScrollableScrollPhysics(),
          //         padding: EdgeInsets.symmetric(vertical: 0),
          //         shrinkWrap: true,
          //         itemCount: 10,
          //         itemBuilder: (context, index) {
          //           return buildTopSellingSHItemCard();
          //         }),
          // ],
          //  ),
          // Positioned.directional(
          //     textDirection: Directionality.of(context),
          //     top: 130,
          //     start: 0,
          //     end: 0,
          //     child: (!isLoading)
          //         ? buildOrderCard(context, orderCount)
          // : buildOrderSHCard(),
          SizedBox(height: 36),
          buildOrderCard(context, orderCount)
        ],
      ),
    );
  }

  Widget buildOrderCard(
      BuildContext context, TopSellingRevenueOrdCount orderCount) {
    var locale = AppLocalizations.of(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          height: 50,
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Chip(
                  label: Text('Dia', style: chipStyle(context)),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
                SizedBox(width: 40),
                Chip(
                  label: Text('Sem', style: chipStyle(context)),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
                SizedBox(width: 40),
                Chip(
                  label: Text('Mês', style: chipStyle(context)),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
                SizedBox(width: 40),
                Chip(
                  label: Text('Ano', style: chipStyle(context)),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),

                // FloatingActionButton(
                //   child: Column(
                //     children: [
                //       Icon(Icons.money),
                //       Text('${locale.orders}\n',
                //           style: Theme.of(context).textTheme.subtitle2)
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8),
        Wrap(
          children: [
            Container(
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color.fromRGBO(102, 102, 102, 1),
                  width: 1,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Vendas',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(102, 102, 102, 1),
                        fontSize: 14,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.keyboard_arrow_down_sharp),
                ],

                // child: Row(
                //     mainAxisSize: MainAxisSize.min,
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text('Ano'),
                //       Icon(Icons.keyboard_arrow_down_sharp),
                //     ]),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.only(left: 16, top: 60, bottom: 16),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text('Mais vendidos',
                style: TextStyle(
                    color: ColorConstants.black3,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left),
          ),
        ),
        SingleChildScrollView(
          child: (!isLoading)
              ? (topSellingItems != null && topSellingItems.length > 0)
                  ? ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(vertical: 0),
                      shrinkWrap: true,
                      itemCount: topSellingItems.length,
                      itemBuilder: (context, index) {
                        return buildTopSellingItemCard(
                            context,
                            topSellingItems[index].varientImage,
                            topSellingItems[index].productName,
                            '${topSellingItems[index].count}',
                            '${topSellingItems[index].revenue}');
                      })
                  : Align(
                      alignment: Alignment.center,
                      child: Text(locale.nohistoryfound),
                    )
              : ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 0),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return buildTopSellingSHItemCard();
                  }),
        ),
      ],
    );
  }

  Widget buildTopSellingItemCard(BuildContext context, String img, String name,
      String sold, String price) {
    var locale = AppLocalizations.of(context);

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              boxShadow: [
                BoxShadow(
                    color: ColorConstants.primaryColor.withAlpha(88),
                    offset: Offset(0, 30),
                    blurRadius: 40)
              ],
              color: ColorConstants.primaryColor.withAlpha(112)),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorConstants.primaryColor.withAlpha(66),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          //Mask holder Template
                          Container(
                            width: 30,
                            height: 30,
                            child: ClipOval(
                              child: Stack(children: <Widget>[
                                Positioned(
                                  top: 0,
                                  left: -7.03125,
                                  child: Container(
                                    width: 44.0625,
                                    height: 30,
                                    child: Image.network(img),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 9),
                    Container(
                      width: 62,
                      height: 41,
                      child: Stack(children: <Widget>[
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Text(
                            '$name\n',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 16,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ),
                        Positioned(
                          top: 25,
                          left: 0,
                          child: Text(
                            '$name\n',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(238, 238, 238, 1),
                                fontSize: 13,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 150),
              Text(
                '$sold ${locale.sold}',
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 18,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            ],
          ),
        ),
        SizedBox(height: 15)
      ],
    );
  }

  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(8),
  //       color: ColorConstants.white,
  //     ),
  //     child: Row(
  //       children: [
  //         Container(
  //           padding: EdgeInsets.only(left: 8),
  //           width: 72,
  //           height: 72,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(6),
  //           ),
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(6),
  //             child: Image.network(
  //               img,
  //               fit: BoxFit.fill,
  //               width: 72,
  //               height: 72,
  //             ),
  //           ),
  //         ),
  //         Column(mainAxisSize: MainAxisSize.min, children: [
  //           Text(
  //             '$name\n',
  //             style: TextStyle(
  //                 fontFamily: 'Noah',
  //                 fontSize: 16,
  //                 color: ColorConstants.darkColor,
  //                 letterSpacing: 0.5,
  //                 fontWeight: FontWeight.bold,
  //                 height: 1.5),
  //           ),
  //           Text(
  //             '${locale.apparel}\n\n',
  //             style: TextStyle(
  //                 fontFamily: 'Noah',
  //                 fontSize: 12,
  //                 color: Colors.grey[400],
  //                 letterSpacing: 0.5,
  //                 fontWeight: FontWeight.bold,
  //                 height: 1.5),
  //           ),
  //           Text(
  //             '$sold ${locale.sold}',
  //             style: TextStyle(
  //                 fontFamily: 'Noah',
  //                 fontSize: 14,
  //                 color: Colors.black,
  //                 letterSpacing: 0.5,
  //                 fontWeight: FontWeight.bold,
  //                 height: 1.5),
  //           ),
  //         ]),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.end,
  //           children: [
  //             Text('${locale.revenue} '),
  //             Text(
  //               '$apCurrency $price',
  //               style: TextStyle(
  //                   fontFamily: 'Noah',
  //                   fontSize: 10,
  //                   color: Colors.black,
  //                   letterSpacing: 0.5,
  //                   fontWeight: FontWeight.bold,
  //                   height: 1.5),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget buildTopSellingSHItemCard() {
    return Shimmer(
      duration: Duration(seconds: 3),
      color: Colors.white,
      enabled: true,
      direction: ShimmerDirection.fromLTRB(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Stack(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 70,
                    width: 70,
                    color: Colors.grey[300],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 10,
                      width: 60,
                      color: Colors.grey[300],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 10,
                      width: 60,
                      color: Colors.grey[300],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 10,
                      width: 60,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
