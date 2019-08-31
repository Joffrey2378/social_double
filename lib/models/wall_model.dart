import 'package:flutter/material.dart';

class WallModel {
  static const _itemPosts = [
    'Saimoore',
    'Doc',
    'Marty',
    'Dony',
    'Violet',
    'Jenifer',
    'Bony',
    'Cory',
    'Nelson',
  ];

  PostModel getById(int id) => PostModel(id, _itemPosts[id % _itemPosts.length]);

  PostModel getByPosition(int position) {
    return getById(position);
  }
}

@immutable
class PostModel {
  final int id;
  final String author;
  final Color color;
  final String postText;
  final int likes = 10;

  PostModel(this.id, this.author, [this.postText]) : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(other) => other is PostModel && other.id == id;
}