import 'package:flutter/material.dart';

import 'package:peliculas_app/screens/screens.dart';
import 'package:provider/provider.dart';

import 'api/movies_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MovieProvider(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: "home",
        routes: {"home": (_) => Home(), "detail": (_) => Detail()},
      ),
    );
  }
}
