import 'package:flutter/material.dart';


import 'package:myapp/layout.dart';
import 'package:myapp/widgets/HomeList.dart';
import 'package:myapp/models/Lista.dart';

class HomePage extends StatefulWidget {
	
	static String tag = "home";

	@override
	State<StatefulWidget> createState() {
		return new HomePageState();
	}  	
}

class HomePageState extends State<HomePage> {

	Lista listaBo = Lista();

	@override
	Widget build(BuildContext context) {
		
		final content = FutureBuilder(
			future: listaBo.list(),
			builder: (BuildContext context, AsyncSnapshot snapshot){
				switch(snapshot.connectionState){
					case ConnectionState.none:
					case ConnectionState.waiting:
						return const Center(
							child: Text("Carregando...")
						);
					default:
						if(snapshot.hasError){
							print(snapshot.error);
							return Text('Error: ${snapshot.error}');
						} else {
							return HomeList(items: snapshot.data);
						}
				}
			},
		);

		return Layout.getContent(context, content);
	}
	
}