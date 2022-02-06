import 'package:flutter/material.dart';
import 'package:pokemon_ipt/config/router.dart';
import 'package:pokemon_ipt/constants/routes.dart';

void main() {
  runApp(MyApp(
    router: ApplicationRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final ApplicationRouter router;
  const MyApp({Key? key, required this.router}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        initialRoute: LOGIN_ROUTE,
        onGenerateRoute: router.generateRoute);
  }
}
