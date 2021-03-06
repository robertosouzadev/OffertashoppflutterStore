import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendor/Locale/locales.dart';
import 'package:vendor/Routes/routes.dart';
import 'package:vendor/baseurl/baseurlg.dart';
import 'package:vendor/beanmodel/appinfomodel.dart';
import 'package:vendor/constants/color.dart';
import 'package:vendor/main.dart';
import 'package:vendor/widgets/drawer_menu.dart';

Future getSharedValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // hitAppInfo();
  return prefs.getString('store_name');
}

String liveChat = '1';

void hitAppInfo() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var http = Client();
  http.post(appInfoUri, body: {'user_id': ''}).then((value) {
    print(value.body);
    if (value.statusCode == 200) {
      AppInfoModel data1 = AppInfoModel.fromJson(jsonDecode(value.body));
      if ('${data1.status}' == '1') {
        prefs.setString('app_currency', '${data1.currencySign}');
        prefs.setString('app_referaltext', '${data1.refertext}');
        prefs.setString('numberlimit', '${data1.phoneNumberLength}');
        prefs.setString('imagebaseurl', '${data1.imageUrl}');
        prefs.setString('liveChat', '${data1.liveChat}');
        liveChat = prefs.getString('liveChat');
        getImageBaseUrl();
      }
    }
  }).catchError((e) {
    print(e);
  });
}

Drawer buildDrawer(BuildContext context) {
  // var storeName;
  // getSharedValue().then((value) {
  //
  // });
  var locale = AppLocalizations.of(context);
  return Drawer(
    backgroundColor: ColorConstants.primaryColor,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage('assets/menubg2.png'), fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 54.0),
            child: FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  hitAppInfo();
                }
                return Text(
                  (snapshot.hasData != null)
                      ? '${locale.hey} ${snapshot.data}'
                      : '',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 22, letterSpacing: 0.5),
                );
              },
              future: getSharedValue(),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyDrawer(
                    Icons.account_box, locale.myProfile, PageRoutes.myProfile),
                MyDrawer(Icons.shopping_cart, locale.myOrders,
                    PageRoutes.newOrdersDrawer),
                MyDrawer(Icons.assignment_returned, locale.myItems,
                    PageRoutes.myItemsPage),
                MyDrawer(Icons.account_balance_wallet, locale.myEarnings,
                    PageRoutes.myEarnings),
                MyDrawer(
                    Icons.insert_chart, locale.insight, PageRoutes.insight),
                liveChat == "1"
                    ? MyDrawer(Icons.message, locale.chat, PageRoutes.chatList)
                    : SizedBox(),
                MyDrawer(Icons.notifications_active, locale.notifications,
                    PageRoutes.notificationList),
                MyDrawer(Icons.view_list, locale.aboutUs, PageRoutes.aboutus),
                MyDrawer(Icons.admin_panel_settings_rounded, locale.tnc,
                    PageRoutes.tnc),
                MyDrawer(Icons.chat, locale.helpCentre, PageRoutes.contactUs),
                MyDrawer(
                    Icons.language, locale.language, PageRoutes.chooseLanguage),
                ListTile(
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.clear().then((value) {
                      // Phoenix.rebirth(context);
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return GroceryStoreLogin();
                      }), (Route<dynamic> route) => false);
                    });
                  },
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  title: Text(
                    locale.logout,
                    style: TextStyle(letterSpacing: 2),
                  ),
                ),
                Divider(
                  thickness: 4,
                  color: Colors.transparent,
                )
              ],
            ),
          ))
        ],
      ),
    ),
  );
}
