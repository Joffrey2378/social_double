import 'package:flutter/cupertino.dart';
import 'package:social_double/models/wall_model.dart';

class FavoritesModel extends ChangeNotifier {
  final WallModel _wall;
  final List<int> _postIds;

  FavoritesModel(this._wall, FavoritesModel previous)
  : assert(_wall != null),
  _postIds = previous?._postIds ?? [];

  List<PostModel> get items => _postIds.map((id) => _wall.getById(id)).toList();

  int get totalPrice => items.fold(0, (total, current) => total + current.likes);

  void add(PostModel item) {
    _postIds.add(item.id);
    notifyListeners();
  }
}