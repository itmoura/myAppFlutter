import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/pages/about.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/settings.dart';
import 'package:myapp/models/Lista.dart';

class Layout {
  static final pages = [HomePage.tag, AboutPage.tag, SettingsPage.tag];
  static int currItem = 0;

  static Scaffold getContent(BuildContext context, content, [bool showBottom = true]) {
    
	BottomNavigationBar bottomNavBar = BottomNavigationBar(
        currentIndex: currItem,
        fixedColor: danger(),
        // type: BottomNavigationBarType.fixed, -- para + q 3 botões
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer), title: Text('Sobre')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('Configurações')),
          // BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('Configurações'))
        ],
        onTap: (int i) {
          currItem = i;
          Navigator.of(context).pushReplacementNamed(pages[i]);
        },
    );

	if(!showBottom)
		currItem = 1;

	return Scaffold(
      appBar: AppBar(
          backgroundColor: secondary(),
          title: Center(
            child: Text('IT LIST'),
          ),
          /* BOTÃO + E MODAL */
          actions: _getActions(context)),
      /* NAVEGAÇÃO */
      bottomNavigationBar: showBottom ? bottomNavBar : null,
      body: content,
    );
  }

  static List<Widget> _getActions(BuildContext context) {
    List<Widget> items = List<Widget>();

	if (pages[currItem] != HomePage.tag){
		return items;
	} else {

		TextEditingController _c = TextEditingController();
		items.add(
			GestureDetector(
			onTap: () {
				showDialog(
					context: context,
					barrierDismissible: false,
					builder: (BuildContext ctx) {
					final input = TextFormField(
						controller: _c,
            autofocus: true,
						decoration: InputDecoration(
							hintText: "Nome",
							contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
							border: OutlineInputBorder(
								borderRadius: BorderRadius.circular(5))),
					);
					return AlertDialog(
						title: Text("Nova Lista"),
						content: SingleChildScrollView(
						child: ListBody(children: <Widget>[input]),
						),
						actions: <Widget>[
						RaisedButton(
							color: danger(),
							child:
								Text("Cancelar", style: TextStyle(color: light())),
							onPressed: () {
								Navigator.of(ctx).pop();
							},
						),
						RaisedButton(
							color: success(),
							child: Text(
							"Adicionar",
							style: TextStyle(color: light()),
							),
							onPressed: () {
								
								Lista listaBo = Lista();
								listaBo.insert({
									'name': input.controller.text,
									'created': DateTime.now().toString()
								}).then((newRowId){
									Navigator.of(ctx).pop();
									Navigator.of(ctx).pushReplacementNamed(HomePage.tag);
								});
								
								// HomeList.items.add(
								// 	ListTile(
								// 		leading: Icon(Icons.pages),
								// 		title: Text(input.controller.text),
								// 		trailing: Icon(Icons.more_vert),
								// 		onTap: (){
								// 			Navigator.of(context).pushNamed(ListPage.tag);
								// 		},
								// 	)	
								// );
								
							},
						)
						],
					);
					});
			},
			child: Icon(Icons.add),
			),
		);

		items.add( Padding(padding: EdgeInsets.only(right: 20)));

		return items;
	}
  }

  static Color primary() => Color.fromRGBO(136, 54, 191, 1);
  static Color secondary() => Color.fromRGBO(118, 46, 166, 1);
  static Color light() => Color.fromRGBO(255, 255, 255, 1);

  static Color danger() => Color.fromRGBO(219, 63, 106, 1);
  static Color success() => Color.fromRGBO(60, 194, 85, 1);
  static Color info() => Color.fromRGBO(94, 88, 167, 1);
}
