import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ihale_app/MostDetailPage.dart';
import 'package:ihale_app/model/MostPopular.dart';
import 'package:ihale_app/parse.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      appBarTheme: AppBarTheme(
        color: Colors.indigo,
      ),
      accentColor: Colors.amber,
      primaryColor: Colors.indigo
    ),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Most Wired"),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              heightFactor: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Loading",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              Most mostModal = snapshot.data[index];

              return Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MostDetailAppInfo(mostModal.detailLink.toString(),mostModal.imageUrl.toString())));
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 170,
                              width: MediaQuery.of(context).size.width * 1.5,
                              child: Image.network(
                                mostModal.imageUrl.toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: Column(
                              children: [
                                Text(
                                    mostModal.date +
                                        "   |    " +
                                        mostModal.author,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey.shade500)),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(mostModal.header,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 24)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            itemCount: snapshot.data.length == null ? 0 : snapshot.data.length,
          );
        },
        future: init(),
      ),
    );
  }
}
