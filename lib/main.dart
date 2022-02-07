import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_ipt/config/preferences.dart';
import 'package:pokemon_ipt/config/router.dart';
import 'package:pokemon_ipt/view-models/exports.dart';
import 'package:pokemon_ipt/constants/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = UserPreferences();
  await prefs.init();
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
    return MultiProvider(
      providers: [
        Provider(create: (_) => LoginInViewModel()),
        Provider(create: (_) => PokemonViewModel()),
        Provider(create: (_) => ProfileViewModel())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          initialRoute: LOGIN_ROUTE,
          onGenerateRoute: router.generateRoute),
    );
  }
}
