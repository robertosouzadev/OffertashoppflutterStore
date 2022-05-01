import 'package:flutter/material.dart';
import 'package:vendor/Components/drawer.dart';
import 'package:vendor/Locale/locales.dart';
import 'package:vendor/Pages/Other/adminproductpage.dart';
import 'package:vendor/Pages/Other/storeproductpage.dart';
import 'package:vendor/Routes/routes.dart';
import 'package:vendor/constants/color.dart';

class MyItemsPage extends StatefulWidget {
  @override
  _MyItemsPageState createState() => _MyItemsPageState();
}

class _MyItemsPageState extends State<MyItemsPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  int lastIndex = -1;
  int currentTabIndex = 0;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(_tabControllerListener);
    super.initState();
  }

  void _tabControllerListener() {
    setState(() {
      currentTabIndex = tabController.index;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: buildDrawer(context),

      appBar: AppBar(
        title: Text(
          locale.myItems,
          style: TextStyle(
            color: ColorConstants.letterColor,
          ),
        ),
        bottom: TabBar(
          padding: EdgeInsets.only(left: 16, right: 16),
          unselectedLabelColor: ColorConstants.primaryColor,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: ColorConstants.primaryColor),
          tabs: [
            // Card(
            //   color: currentTabIndex == 0 ? Colors.white : Colors.grey[200],
            //   elevation: 3,
            //   child: Container(
            //     width: MediaQuery.of(context).size.width / 2,
            //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            //     child: Text(
            Tab(
              icon: Icon(Icons.timer_sharp),
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(locale.storepheading),
                ),
              ),
            ),

            // icon: Icon(Icons.timer_sharp), text: (locale.storepheading)),

            //   textAlign: TextAlign.center,
            //   style: TextStyle(fontSize: 16),
            // ),
            //   ),
            // ),
            // Card(
            //   color: currentTabIndex == 1 ? Colors.white : Colors.grey[200],
            //   elevation: 3,
            //   child: Container(
            //     width: MediaQuery.of(context).size.width / 2,
            //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            // child: Text(
            Tab(
              icon: Icon(Icons.next_week),
              child: Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(locale.adminpheading),
                ),
              ),
            )

            //icon: Icon(Icons.next_week), text: locale.adminpheading),

            //       textAlign: TextAlign.center,
            //       style: TextStyle(fontSize: 16),
            //     ),
            //   ),
            // )
          ],
          isScrollable: false,
          controller: tabController,
          indicatorWeight: 1,
          indicatorColor: Colors.transparent,
          labelPadding: EdgeInsets.all(0),
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
            });
          },
        ),
      ),

      // actions: [
      //   IconButton(
      //     icon: Icon(Icons.search),
      //     onPressed: () {},
      //   )
      // ],

      body: Container(
        height: MediaQuery.of(context).size.height,
        child: TabBarView(
          controller: tabController,
          children: [
            MyStoreProduct(),
            MyAdminProduct(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          color: Theme.of(context).scaffoldBackgroundColor,
          size: 32,
        ),
        onPressed: () {
          setState(() {
            lastIndex = tabController.index;
            tabController.index = (lastIndex == 0) ? 1 : 0;
          });
          Navigator.pushNamed(context, PageRoutes.addItem).then((value) {
            setState(() {
              tabController.index = lastIndex;
            });
          }).catchError((e) {
            print(e);
          });
        },
      ),
    );
  }
}
