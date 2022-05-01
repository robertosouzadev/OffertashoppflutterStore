import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:vendor/Components/custom_button.dart';
import 'package:vendor/Components/entry_field.dart';
import 'package:vendor/Locale/locales.dart';
import 'package:vendor/Routes/routes.dart';
import 'package:vendor/Theme/colors.dart';
import 'package:vendor/Theme/style.dart';
import 'package:vendor/baseurl/baseurlg.dart';
import 'package:vendor/beanmodel/appinfomodel.dart';
import 'package:vendor/beanmodel/signmodel/signmodel.dart';
import 'package:vendor/widgets/my_header.dart';
import 'package:vendor/widgets/my_text_field.dart';

class SignIn extends StatefulWidget {
  // final VoidCallback onVerificationDone;
  //
  //
  // SignIn(this.onVerificationDone);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with WidgetsBindingObserver {
  bool showProgress = false;
  int numberLimit = 10;
  dynamic appName = '--';
  var countryCodeController = TextEditingController();
  var phoneNumberController = TextEditingController();
  AppInfoModel appInfoModeld;
  int checkValue = -1;
  bool showPassword = true;

  var passwordController = TextEditingController();

  FirebaseMessaging messaging;
  dynamic token;

  int count = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    hitAsyncInit();
    hitAppInfo();
  }

  void hitAsyncInit() async {
    try {
      await Firebase.initializeApp();
      messaging = FirebaseMessaging.instance;
      messaging.getToken().then((value) {
        token = value;
      });
    } catch (e) {}
  }

  void hitAppInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      showProgress = true;
    });
    var http = Client();
    http.post(appInfoUri, body: {'user_id': ''}).then((value) {
      // print(value.body);
      if (value.statusCode == 200) {
        AppInfoModel data1 = AppInfoModel.fromJson(jsonDecode(value.body));
        print('data - ${data1.toString()}');
        if (data1.status == "1" || data1.status == 1) {
          setState(() {
            appInfoModeld = data1;
            appName = data1.appName;
            countryCodeController.text = '${data1.countryCode}';
            numberLimit = int.parse('${data1.phoneNumberLength}');
            prefs.setString('app_currency', '${data1.currencySign}');
            prefs.setString('app_name', '${data1.appName}');
            prefs.setString('app_referaltext', '${data1.refertext}');
            prefs.setString('numberlimit', '$numberLimit');
            prefs.setString('imagebaseurl', '${data1.imageUrl}');
            prefs.setString('liveChat', '${data1.liveChat}');
            getImageBaseUrl();
            showProgress = false;
          });
        } else {
          setState(() {
            showProgress = false;
          });
        }
      } else {
        setState(() {
          showProgress = false;
        });
      }
    }).catchError((e) {
      setState(() {
        showProgress = false;
      });
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyHeader('Vamos começar', 'Informe os dados abaixo',
                      loginTextStyle(context), loginTextStyle(context)),

                  SizedBox(height: 28),
                  // Text(
                  //   locale.welcomeTo,
                  //   style: Theme.of(context).textTheme.headline3,
                  //   textAlign: TextAlign.center,
                  // ),
                  // Divider(
                  //   thickness: 1.0,
                  //   color: Colors.transparent,
                  // ),
                  // Image.asset(
                  //   "assets/Logos/icon.png",
                  //   scale: 2.5,
                  //   height: 150,
                  // ),
                  // Divider(
                  //   thickness: 2.0,
                  //   color: Colors.transparent,
                  // ),
                  // Text(
                  //   appName,
                  //   style: Theme.of(context).textTheme.headline3,
                  //   textAlign: TextAlign.center,
                  // ),

                  Divider(
                    thickness: 1.0,
                    color: Colors.transparent,
                  ),
                  LimitedBox(
                    child: MyTextField(
                      Key('1'),
                      controller: phoneNumberController,
                      hintText: locale.emailAddress,
                      prefixIcon: Icon(Icons.email_outlined),
                      //textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(height: 8),

                  LimitedBox(
                    child: MyTextField(
                      Key('2'),
                      obscureText: showPassword,
                      obscuringCharacter: "*",
                      prefixIcon: Icon(Icons.password_outlined),
                      controller: passwordController,
                      hintText: locale.password2,
                      suffixIcon: IconButton(
                        icon: Icon(
                          showPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                      ),
                    ),
                  ),

                  Divider(
                    thickness: 2.0,
                    color: Colors.transparent,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        if (!showProgress) {
                          Navigator.of(context).pushNamed(PageRoutes.signUp,
                              arguments: {'appinfo': appInfoModeld});
                        } else {
                          Toast.show('Por favor, Aguarde um momento .', context,
                              duration: Toast.LENGTH_SHORT,
                              gravity: Toast.CENTER);
                        }
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                              text: locale.notuser1,
                              style: TextStyle(
                                  color: kMainTextColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300),
                              children: [
                                TextSpan(
                                    text: locale.notuser2,
                                    style: TextStyle(
                                        color: kMainColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600))
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(PageRoutes.langnew);
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          locale.selectPreferredLanguage,
                          style: TextStyle(fontSize: 14, color: kMainColor),
                        ),
                      ),
                    ),
                  ),
                  // Text(
                  //   'Not a user? ',
                  //   style: Theme.of(context).textTheme.headline3,
                  //   textAlign: TextAlign.center,
                  // )
                ],
              ),
            ),
            (showProgress)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Divider(
                        thickness: 1.0,
                        color: Colors.transparent,
                      ),
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: CircularProgressIndicator()),
                      Divider(
                        thickness: 1.0,
                        color: Colors.transparent,
                      ),
                    ],
                  )
                : Container(
                    height: 48,
                    margin: EdgeInsets.all(16),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: elevatedButtonStyle(context),
                      onPressed: () {
                        if (!showProgress) {
                          setState(() {
                            showProgress = true;
                          });
                          if (phoneNumberController.text != null &&
                              emailValidator(phoneNumberController.text)) {
                            if (passwordController.text != null &&
                                passwordController.text.length > 4) {
                              hitLoginUrl('${phoneNumberController.text}',
                                  passwordController.text, context);
                            } else {
                              Toast.show(locale.incorectPassword, context,
                                  gravity: Toast.CENTER,
                                  duration: Toast.LENGTH_SHORT);
                              setState(() {
                                showProgress = false;
                              });
                            }
                          } else {
                            Toast.show(locale.incorectEmail, context,
                                gravity: Toast.CENTER,
                                duration: Toast.LENGTH_SHORT);
                            setState(() {
                              showProgress = false;
                            });
                          }
                        }
                      },
                      child: Text('Entrar'),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  bool emailValidator(email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  void hitLoginUrl(
      dynamic user_phone, dynamic user_password, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (token != null) {
      print(token);
      var http = Client();
      http.post(storeLoginUri, body: {
        'email': '$user_phone',
        'password': '$user_password',
        'device_id': '$token',
      }).then((value) {
        print('sign - ${value.body}');
        if (value.statusCode == 200) {
          var jsData = jsonDecode(value.body);
          SignMain signInData = SignMain.fromJson(jsData);
          print('${signInData.toString()}');
          if (signInData.status == "0" || signInData.status == 0) {
            Toast.show(signInData.message, context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
          } else if (signInData.status == "1" || signInData.status == 1) {
            var userId = int.parse('${signInData.data.id}');
            prefs.setInt("store_id", userId);
            prefs.setString("store_name", '${signInData.data.store_name}');
            prefs.setString("owner_name", '${signInData.data.employee_name}');
            prefs.setString("email", '${signInData.data.email}');
            prefs.setString(
                "store_photo", '$imagebaseUrl${signInData.data.store_photo}');
            prefs.setString("phone_number", '${signInData.data.phone_number}');
            prefs.setString("password", '${signInData.data.password}');
            prefs.setString("city", '${signInData.data.city}');
            prefs.setString("admin_share", '${signInData.data.admin_share}');
            prefs.setString(
                "admin_approval", '${signInData.data.admin_approval}');
            prefs.setString("store_status", '${signInData.data.store_status}');
            prefs.setString("address", '${signInData.data.address}');
            prefs.setString("lat", '${signInData.data.lat}');
            prefs.setString("lng", '${signInData.data.lng}');
            prefs.setBool("islogin", true);
            Navigator.of(context).pushNamedAndRemoveUntil(
                PageRoutes.newOrdersDrawer, (route) => false);
          }
        }
        setState(() {
          showProgress = false;
        });
      }).catchError((e) {
        setState(() {
          showProgress = false;
        });
        print(e);
      });
    } else {
      if (count == 0) {
        count = 1;
        messaging.getToken().then((value) {
          setState(() {
            token = value;
            hitLoginUrl(user_phone, user_password, context);
          });
        });
      } else {
        setState(() {
          showProgress = false;
        });
      }
    }
  }
}
