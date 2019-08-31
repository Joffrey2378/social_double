import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_double/models/favorites_model.dart';
import 'package:social_double/models/wall_model.dart';

class WallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                    (context, index) => _MyListItem(index)),
          ),
        ],
      ),
    );
  }
}

class _LikeButton extends StatelessWidget {
  final PostModel item;

  const _LikeButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favs = Provider.of<FavoritesModel>(context);

    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: favs.items.contains(item) ? null : () => favs.add(item),
      splashColor: Theme.of(context).primaryColor,
      child: favs.items.contains(item)
          ? Icon(Icons.favorite, semanticLabel: 'LIKED', color: Colors.red,)
          : Icon(Icons.favorite_border, semanticLabel: 'LIKE'),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Wall', style: Theme.of(context).textTheme.display4),
      floating: true,
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () => Navigator.pushNamed(context, '/favorites'),
        ),
      ],
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  _MyListItem(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var wall = Provider.of<WallModel>(context);
    var post = wall.getByPosition(index);
    var textTheme = Theme.of(context).textTheme.title;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              color: post.color,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(post.author, style: textTheme),
                  ),
                  _LikeButton(item: post),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}