import 'package:flutter/material.dart';

//Color Color(0xffFF9900) = Color(0xffFF9900);

import '../constants/color.dart';

TextStyle appBarTitleStyle(BuildContext context) =>
    Theme.of(context).textTheme.headline6.copyWith(
          color: Color.fromARGB(255, 4, 114, 225),
          fontWeight: FontWeight.normal,
        );

// Additional text themes
TextStyle boldCaptionStyle(BuildContext context) =>
    Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold);

TextStyle boldSubtitle(BuildContext context) =>
    Theme.of(context).textTheme.subtitle1.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        );

// Cria uma nova branch com:

// git branch <nome>

// Agora é só fazer o commit das alteração e enviar para o repositório:

// Commit:

// git add .

// O git add adiciona os arquivos para realizar o commit. A utilização do ponto(.) é para adicionar todos os arquivos que foram modificados. Você consegue ver os arquivos alterados e adicionados para commit com git status

// git commit -m "<mensagem>"

TextStyle loginButtonTextStyle(BuildContext context) =>
    Theme.of(context).textTheme.button.copyWith(color: Colors.black);

TextStyle normalCaptionStyle(BuildContext context) =>
    Theme.of(context).textTheme.caption.copyWith(
          color: Colors.grey,
          fontSize: 14,
        );

TextStyle normalHeadingStyle(BuildContext context) =>
    Theme.of(context).textTheme.headline6.copyWith(
          fontWeight: FontWeight.normal,
        );

//  ----- Updated 03-2022 -----

//Buttons Text Offerta Shopp 03-2022 Update

//h1, h2, h3, h4, h5, h6
TextStyle h1(BuildContext context) =>
    Theme.of(context).textTheme.button.copyWith(
        fontFamily: 'Noah',
        fontSize: 31,
        letterSpacing: 0.5,
        fontWeight: FontWeight.bold,
        height: 1.5);

TextStyle h2(BuildContext context) =>
    Theme.of(context).textTheme.button.copyWith(
        fontFamily: 'Noah',
        fontSize: 24,
        letterSpacing: 0.5,
        fontWeight: FontWeight.bold,
        height: 1.5);

TextStyle h3(BuildContext context) =>
    Theme.of(context).textTheme.button.copyWith(
        fontFamily: 'Noah',
        fontSize: 20,
        letterSpacing: 0.5,
        fontWeight: FontWeight.bold,
        height: 1.5);

TextStyle h3black(BuildContext context) =>
    Theme.of(context).textTheme.button.copyWith(
        color: Colors.black,
        fontFamily: 'Noah',
        fontSize: 18,
        letterSpacing: 0.2,
        fontWeight: FontWeight.bold,
        height: 1.5);

TextStyle loginTextStyle(BuildContext context) =>
    Theme.of(context).textTheme.button.copyWith(
        color: Color.fromRGBO(34, 50, 99, 1),
        fontFamily: 'Noah',
        fontSize: 16,
        letterSpacing: 0.5,
        fontWeight: FontWeight.bold,
        height: 1.5);

TextStyle loginSubTextStyle(BuildContext context) =>
    Theme.of(context).textTheme.button.copyWith(
        fontFamily: 'Noah',
        fontSize: 12,
        letterSpacing: 0.5,
        fontWeight: FontWeight.normal,
        height: 1.5);

TextStyle loginSubTextStyleGreyColor(BuildContext context) =>
    Theme.of(context).textTheme.button.copyWith(
        color: ColorConstants.greyColor,
        fontFamily: 'Noah',
        fontSize: 12,
        letterSpacing: 0.5,
        fontWeight: FontWeight.normal,
        height: 1.8);

TextStyle h5(BuildContext context, Color color) =>
    Theme.of(context).textTheme.caption.copyWith(
        color: color,
        fontFamily: 'Noah',
        fontSize: 14,
        letterSpacing: 0.5,
        fontWeight: FontWeight.bold,
        height: 1.5);

TextStyle headerColorWhite(BuildContext context) =>
    Theme.of(context).textTheme.caption.copyWith(
        color: Colors.white,
        fontFamily: 'Noah',
        fontSize: 14,
        letterSpacing: 0.5,
        fontWeight: FontWeight.bold,
        height: 1.5);
TextStyle headerColorDark(BuildContext context) =>
    Theme.of(context).textTheme.caption.copyWith(
        color: ColorConstants.darkColor,
        fontFamily: 'Noah',
        fontSize: 14,
        letterSpacing: 0.5,
        fontWeight: FontWeight.bold,
        height: 1.5);

TextStyle largeBold(BuildContext context) =>
    Theme.of(context).textTheme.button.copyWith(
        fontFamily: 'Noah',
        fontSize: 12,
        letterSpacing: 0.5,
        fontWeight: FontWeight.bold,
        height: 1.5);

TextStyle largeRegular(BuildContext context) =>
    Theme.of(context).textTheme.button.copyWith(
        fontFamily: 'Noah',
        fontSize: 10,
        letterSpacing: 0.5,
        fontWeight: FontWeight.normal,
        height: 1.5);

TextStyle normalBold(BuildContext context) =>
    Theme.of(context).textTheme.button.copyWith(
        fontFamily: 'Noah',
        fontSize: 10,
        letterSpacing: 0.5,
        fontWeight: FontWeight.bold,
        height: 1.5);

TextStyle normalRegular(BuildContext context, Color myColor) =>
    Theme.of(context).textTheme.button.copyWith(
        color: myColor,
        fontFamily: 'Noah',
        fontSize: 12,
        letterSpacing: 0.5,
        fontWeight: FontWeight.normal,
        height: 1.5);

TextStyle normalRegularLine(BuildContext context) =>
    Theme.of(context).textTheme.button.copyWith(
        fontFamily: 'Noah',
        fontSize: 10,
        letterSpacing: 0.5,
        fontWeight: FontWeight.bold,
        height: 1.5);

TextStyle formNormal(BuildContext context) =>
    Theme.of(context).textTheme.button.copyWith(
        fontFamily: 'Noah',
        fontSize: 12,
        letterSpacing: 0.5,
        fontWeight: FontWeight.bold,
        height: 1.8);

TextStyle formFill(BuildContext context) =>
    Theme.of(context).textTheme.button.copyWith(
        color: Color.fromRGBO(128, 128, 128, 1),
        fontFamily: 'Noah',
        fontSize: 14,
        letterSpacing: 0.5,
        fontWeight: FontWeight.bold,
        height: 1.8);

TextStyle linkNormal(BuildContext context) =>
    Theme.of(context).textTheme.button.copyWith(
        fontFamily: 'Noah',
        fontSize: 14,
        letterSpacing: 0.5,
        fontWeight: FontWeight.bold,
        height: 1.5);

TextStyle linkSmall(BuildContext context) =>
    Theme.of(context).textTheme.button.copyWith(
        fontFamily: 'Noah',
        fontSize: 12,
        letterSpacing: 0.5,
        fontWeight: FontWeight.bold,
        height: 1.5);
//------------ End Updats----------------------------//

TextStyle textFieldHintStyle(BuildContext context, FontWeight bold) =>
    Theme.of(context).textTheme.caption.copyWith(
          color: Color.fromRGBO(128, 128, 128, 1),
          fontFamily: 'Noah',
          fontSize: 14,
          letterSpacing: 0.5,
          fontWeight: FontWeight.bold,
        );

TextStyle TextTitle(BuildContext context) =>
    Theme.of(context).textTheme.caption.copyWith(
          color: Colors.grey[500],
          fontWeight: FontWeight.normal,
          fontSize: 15,
        );
TextStyle largeTextMenu(BuildContext context) => TextStyle(
    color: Colors.white,
    fontFamily: 'Roboto',
    fontSize: 14,
    letterSpacing: 0.5,
    fontWeight: FontWeight.normal,
    height: 1.5);

TextStyle textFieldInputStyle(BuildContext context, FontWeight fontWeight) =>
    Theme.of(context).textTheme.bodyText1.copyWith(
          color: Colors.black,
          fontSize: 14,
          letterSpacing: 0.5,
          fontWeight: fontWeight ?? FontWeight.normal,
        );

TextStyle textFieldLabelStyle(BuildContext context) =>
    Theme.of(context).textTheme.caption.copyWith(
          color: ColorConstants.primaryColor.withAlpha(30),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        );

TextStyle textFieldSuffixStyle(BuildContext context) =>
    Theme.of(context).textTheme.caption.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        );

ButtonStyle elevatedButtonStyle(BuildContext context) => ButtonStyle(
      elevation: MaterialStateProperty.all(5),
      shadowColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
      backgroundColor:
          MaterialStateProperty.all(Theme.of(context).primaryColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );

ButtonStyle elevatedButtonStyleZero(BuildContext context) => ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      shadowColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
      backgroundColor:
          MaterialStateProperty.all(Theme.of(context).primaryColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );

ButtonStyle elevatedButtonStyleNegative(BuildContext context) => ButtonStyle(
      elevation: MaterialStateProperty.all(5),
      shadowColor: MaterialStateProperty.all(ColorConstants.secondaryColor),
      backgroundColor: MaterialStateProperty.all(ColorConstants.secondaryColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );

CardTheme cardStyle(BuildContext context) => CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );

ButtonStyle outLineButtonStyle(BuildContext context) => ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(
            color: Color.fromARGB(255, 128, 128, 128),
          ),
        ),
      ),
    );

class ThemeUtils {
  static final ThemeData defaultAppThemeData = appTheme();

  static ThemeData appTheme() {
    Color primaryColor = Color.fromARGB(255, 4, 114, 225);
    Color secondaryColor = Color.fromARGB(255, 249, 78, 140);
    Color yellowColor = Color.fromARGB(255, 255, 200, 51);
    Color greyColor = Color.fromARGB(255, 128, 128, 128);
    Color darkColor = Color.fromARGB(255, 34, 50, 99);
    Color lightColor = Color.fromARGB(255, 236, 238, 245);
    Color greenColor = Color.fromARGB(255, 3, 173, 83);
    Color letterColor = Color.fromARGB(255, 122, 122, 122);
    Color backgroundColor = Color.fromARGB(255, 237, 237, 237);

    return ThemeData(
      fontFamily: "Noah",
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSwatch(accentColor: Color(0x26dc2e45)),
      hintColor: Color(0xFF999999),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: primaryColor),
      ),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: primaryColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        elevation: 5.0,
        unselectedIconTheme: IconThemeData(color: Colors.grey[600]),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(primaryColor),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: primaryColor,
        textTheme: ButtonTextTheme.primary,
        shape: StadiumBorder(),
        disabledColor: Color(0xFFE5E3DC),
        height: 50,
      ),

      sliderTheme: SliderThemeData(
        thumbColor: primaryColor,
        activeTrackColor: primaryColor,
      ),
      cardColor: Colors.white,
      cardTheme: CardTheme(elevation: 5),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      iconTheme: IconThemeData(
        color: primaryColor,
        opacity: 1.0,
      ),
      textTheme: TextTheme(
        headline5: TextStyle(
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
        headline6: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        subtitle1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: primaryColor,
        ),
        subtitle2: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
        bodyText2: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        caption: TextStyle(
          fontSize: 13,
          color: Colors.black,
        ),
        bodyText1: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
        button: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 15,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          borderSide: BorderSide(width: 1, color: primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          borderSide:
              BorderSide(width: 1, color: Color.fromARGB(255, 238, 238, 238)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          borderSide: BorderSide(width: 0.7, color: secondaryColor),
        ),
      ),

      // TYPOGRAPHY & ICONOGRAPHY
      // String? fontFamily,
      // Typography? typography,
      // TextTheme? textTheme,
      // TextTheme? primaryTextTheme,
      // IconThemeData? iconTheme,
      // IconThemeData? primaryIconTheme,
      // COMPONENT THEMES
      // AppBarTheme? appBarTheme,
      // MaterialBannerThemeData? bannerTheme,
      // BottomAppBarTheme? bottomAppBarTheme,
      // BottomNavigationBarThemeData? bottomNavigationBarTheme,
      // BottomSheetThemeData? bottomSheetTheme,
      // ButtonBarThemeData? buttonBarTheme,
      // ButtonThemeData? buttonTheme,
      // CardTheme? cardTheme,
      // CheckboxThemeData? checkboxTheme,
      // ChipThemeData? chipTheme,
      // DataTableThemeData? dataTableTheme,
      // DialogTheme? dialogTheme,
      dividerTheme: DividerThemeData(color: backgroundColor, thickness: 1),

      // DrawerThemeData? drawerTheme,
      // ElevatedButtonThemeData? elevatedButtonTheme,
      // FloatingActionButtonThemeData? floatingActionButtonTheme,
      // ListTileThemeData? listTileTheme,
      // NavigationBarThemeData? navigationBarTheme,
      // NavigationRailThemeData? navigationRailTheme,
      // OutlinedButtonThemeData? outlinedButtonTheme,
      // PopupMenuThemeData? popupMenuTheme,
      // ProgressIndicatorThemeData? progressIndicatorTheme,
      // RadioThemeData? radioTheme,
      // SliderThemeData? sliderTheme,
      // SnackBarThemeData? snackBarTheme,
      // SwitchThemeData? switchTheme,
      // TabBarTheme? tabBarTheme,
      // TextButtonThemeData? textButtonTheme,
      // TextSelectionThemeData? textSelectionTheme,
      // TimePickerThemeData? timePickerTheme,
      // ToggleButtonsThemeData? toggleButtonsTheme,
      // TooltipThemeData? tooltipTheme,
    );
  }
}

//app theme
final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'ProductSans',
  backgroundColor: Colors.black,
  primaryColor: Color(0xFF39c526),
  bottomAppBarColor: Colors.white,
  dividerColor: Color(0xffacacac),
  disabledColor: Color(0xff616161),
  indicatorColor: Color(0xffFF9900),
  cardColor: Color(0xff222e3e),
  hintColor: Color(0xffa3a3a3),
  bottomAppBarTheme: BottomAppBarTheme(color: Color(0xffFF9900)),
  appBarTheme: AppBarTheme(
    color: Colors.transparent,
    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  //text theme which contains all text styles
  textTheme: TextTheme(
    //default text style of Text Widget
    bodyText1: TextStyle(color: Colors.white, fontSize: 18),
    bodyText2: TextStyle(),
    subtitle1: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
    subtitle2: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w400),
    headline3: TextStyle(fontSize: 20),
    headline5: TextStyle(fontWeight: FontWeight.bold),
    headline6: TextStyle(color: Color(0xff747474)),
    caption: TextStyle(),
    overline: TextStyle(),
    button: TextStyle(
        fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
  ),
);

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5