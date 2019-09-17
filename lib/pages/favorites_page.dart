import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_double/models/favorites_model.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites', style: Theme.of(context).textTheme.display1),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _FavoritesList(),
              ),
            ),
//            Divider(height: 4, color: Colors.black),
//            _FavoritesTotal()
          ],
        ),
      ),
    );
  }
}

class _FavoritesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.title;
    var favs = Provider.of<FavoritesModel>(context);

    return ListView.builder(
      itemCount: favs.items.length,
      itemBuilder: (context, index) => ListTile(
        contentPadding: EdgeInsets.all(0.0),
        title: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.account_circle),
            ),
            Text(
              favs.items[index].author,
              style: itemNameStyle,
            ),
          ],
        ),
      ),
    );
  }
}