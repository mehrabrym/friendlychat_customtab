import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

void main() {
  runApp(new FriendlychatApp());
}

class FriendlychatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Friendlychat",
      debugShowCheckedModeBanner: false,
      home: new ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Friendly Chat")),
      body: new Center(
        child: new FlatButton(onPressed: () => _launchURL(context), child: new Text('Show Flutter Homepage'))
      )
    );
  }
}

void _launchURL(BuildContext context) async {
  try {
    await launch(
      'https://flutter.io/',
      option: new CustomTabsOption(
        toolbarColor: Theme.of(context).primaryColor,
        enableDefaultShare: true,
        enableUrlBarHiding: true,
        showPageTitle: true,
        animation: new CustomTabsAnimation(
          startEnter: 'android:anim/slide_in_right',
          startExit: 'android:anim/fade_out',
          endEnter: 'android:anim/fade_in',
          endExit: 'android:anim/slide_out_right',
        ),
        extraCustomTabs: <String>[
          'com.android.chrome',
          'org.mozilla.firefox',
        ],
      ),
    );
  } catch (e) {
    debugPrint(e.toString());
  }
}