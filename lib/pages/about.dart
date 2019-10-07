import 'package:flutter/material.dart';
import 'package:myapp/layout.dart';

class AboutPage extends StatelessWidget {

	static String tag = "about";

  	@override
	Widget build(BuildContext context) {

		final content = Center(
			child: Text("Este app foi criado por Ítalo Moura"),
		);
		return Layout.getContent(context, content);
  	}

}