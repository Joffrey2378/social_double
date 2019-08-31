import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.live_tv,
              color: Colors.black87,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.chat,
              color: Colors.black87,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.photo_camera,
            color: Colors.black87,
          ),
          onPressed: () {},
        ),
        title: Text(
          'Doublegram',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Icon(Icons.photo),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  'UserName',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black87,
                ),
                onPressed: () {},
              )
            ],
          ),
          Image.asset('assets/bot.jpg'),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.exposure_plus_1,
                  color: Colors.black87,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.comment,
                  color: Colors.black87,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.chat,
                  color: Colors.black87,
                ),
                onPressed: () {},
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.bookmark_border,
                  color: Colors.black87,
                ),
                onPressed: () {},
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text('1,856 likes'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'gtbt btyb ytbsdfsdfs dvc v sjkiow jfksl dlksdnjfl ksd fn smlk d fns',
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 3,
                        style: TextStyle(),
                      ),
                    ),
                    Text('View all n coments',
                    style: TextStyle(
                      color: Colors.black38
                    ),),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
