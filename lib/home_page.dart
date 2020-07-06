// Importing the Pakages
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Url
  String url = 'https://ansem-test.herokuapp.com/services';
  List result;
  // Esta función hará que solicite de la url los datos los decodifique y la almacene en una variable
  void makeRequest() async {
    var response = await http.get(url);
    setState(() {
      if(response.statusCode == 200){
        var extractData = json.decode(response.body);
        result = extractData["services"];
      }else{
        throw ErrorDescription("Existe un error...");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(

        title: new Text('Servicios Activos'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: result == null ? 0 : result.length,
        itemBuilder: (BuildContext context, index) {
          return  ListTile(
            isThreeLine: true,
            contentPadding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            title:  Text(result[index]["user"]["firstName"] + " " + result[index]["user"]["lastName"],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),git
            subtitle: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Text (result[index]["vehicle"]["brand"] + " - " + result[index]["vehicle"]["model"]+ " - " + result[index]["vehicle"]["colour"],
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.right),
                Text (result [index]["vehicle"]["licensePlate"],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right),
              ],
            ),
            leading:  CircleAvatar(
              backgroundColor: Colors.grey[850],
              child: Image.network(
                'https://cdns.iconmonstr.com/wp-content/assets/preview/2016/240/iconmonstr-car-3.png',
              ),
            ),
          );
        },
      ),
    );
  }
}