import 'package:flutter/material.dart';
import 'package:myapp/layout.dart';

class SettingsPage extends StatelessWidget {

	static String tag = "settings";

  	@override
	Widget build(BuildContext context) {

		final content = Center(
			child: Text("Aqui vamos modificar coisas"),
		);
		return Layout.getContent(context, content);
  	}

}