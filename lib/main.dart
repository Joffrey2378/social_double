import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_double/models/favorites_model.dart';
import 'package:social_double/models/wall_model.dart';
import 'package:social_double/pages/favorites_page.dart';
import 'package:social_double/pages/wall_page.dart';

import 'common/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(builder: (context) => WallModel()),
        ChangeNotifierProxyProvider<WallModel, FavoritesModel>(
            builder: (context, wall, previousFavorites) =>
                FavoritesModel(wall, previousFavorites)),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => WallPage(),
          '/favorites': (context) => FavoritesPage(),
        },
      ),
    );
  }
}
