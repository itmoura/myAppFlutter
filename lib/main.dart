import 'package:flutter/material.dart';
import 'package:myapp/layout.dart';
import 'package:myapp/pages/list.dart';



import 'pages/home.dart';
import 'pages/about.dart';
import 'package:myapp/pages/settings.dart';

void main() => runApp(ThizerList());

class ThizerList extends StatelessWidget {

	final routes = <String, WidgetBuilder> { 
		HomePage.tag: (context) => HomePage(),
		AboutPage.tag: (context) => AboutPage(),
		SettingsPage.tag: (context) => AboutPage(),
    ListPage.tag: (context) => ListPage()
	};

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: "IT List",
			theme: ThemeData(
				primaryColorDark: Layout.secondary(),
				primaryColor: Layout.primary(),
				accentColor: Layout.secondary(),
				textTheme: TextTheme(
					headline: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
					title: TextStyle(fontSize: 24, fontStyle: FontStyle.italic, color: Layout.primary()),
					body1: TextStyle(fontSize: 18)
				)
			),
			home: HomePage(),
			routes: routes,
		);
	}
}