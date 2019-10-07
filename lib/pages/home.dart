import 'package:flutter/material.dart';


import 'package:myapp/layout.dart';
import 'package:myapp/widgets/HomeList.dart';

class HomePage extends StatelessWidget {

	static String tag = "home";

  	@override
	Widget build(BuildContext context) {

		final content = HomeList();
		return Layout.getContent(context, content);
  	}

}