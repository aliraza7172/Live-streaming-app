import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../presentation/resources/index_manager.dart';

class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key); //default constractor

//Private named constractor
  MyApp._internal();

//Single Instance--Singleton
  static final MyApp instance = MyApp._internal();

//factory for the class instance
  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nice live',
        // themeMode: ThemeMode.system,
        // darkTheme: getApplicationTheme(),
        // theme: getApplicationTheme(),
        theme: ThemeData(
            primarySwatch: Colors.blue,
            unselectedWidgetColor: HexColor.fromHex("#303749")),
        darkTheme: ThemeData.dark()
            .copyWith(primaryColor: Color.fromARGB(255, 85, 56, 54)),
        // ThemeData(
        //   fontFamily: FontConstants.fontFamily,
        //   primarySwatch: myappColor,
        // ),
        //home: Container(),
        initialRoute: Routes.LiveStreamingBasePage,
        onGenerateRoute: RouteGenerator.getRoute,
      );
    });
  }

  MaterialColor myappColor = const MaterialColor(
    0xFF27B0FF,
    <int, Color>{
      50: Color(0xFF27B0FF), //10%
      100: Color(0xFF27B0FF), //20%
      200: Color(0xFF27B0FF), //30%
      300: Color(0xFF27B0FF), //40%
      400: Color(0xFF27B0FF), //50%
      500: Color(0xFF27B0FF), //60%
      600: Color(0xFF27B0FF), //70%
      700: Color(0xFF27B0FF), //80%
      800: Color(0xFF27B0FF), //90%
      900: Color(0xFF27B0FF), //100%
    },
  );
}
