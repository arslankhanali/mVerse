import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mVerse/pages/watchlistpage.dart';
import 'package:mVerse/state/app_state.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    Key key,
    @required this.context,
    @required this.lineone,
    @required this.linetwo,
  }) : super(key: key);

  final BuildContext context;
  final String lineone;
  final String linetwo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 45),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              lineone,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
            Text(
              linetwo,
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 30,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 100),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(50.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 20.0,
                ),
              ],
            ),
            child: StoreConnector<AppState,AppState>(
              converter: (store) => store.state,
              builder: (context, state){
                return FlatButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Watchlistpage(
                  )));},
          icon:Icon(Icons.add_shopping_cart),
          label: Text('${state.viewnumberofmovies.length}',style:TextStyle(fontSize: 25)
          ),
                          
            );
            //Icon(Icons.ac_unit),
            // FlatButton.icon(onPressed: null, icon: null, label: Text("0")),
              }),
        ),
        )],
    );
  }
}

