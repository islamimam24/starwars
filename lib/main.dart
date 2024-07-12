import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/core/Routes/routes.dart';
import 'package:starwars/core/services/dependency_injection.dart';
import 'package:starwars/core/utils/colors.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.blocer(context)],
      child: MaterialApp(
        scaffoldMessengerKey: scaffoldKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.grey,
        ),
        initialRoute: AppRoutes.toHome(),
        onGenerateRoute: AppPages.generateRouteSettings,
      ),
    );
  }
}
