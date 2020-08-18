import 'package:flutter/cupertino.dart';
import 'package:html/parser.dart';
import 'package:flutter/material.dart';
import 'package:ihale_app/model/MostPopularDetail.dart';
import 'package:ihale_app/parseDetail.dart';

void main() => runApp(MostDetailApp());

class MostDetailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MostDetailAppInfo(),
    );
  }
}

class MostDetailAppInfo extends StatefulWidget {
  String _url;
  String _imageUrl;

  MostDetailAppInfo([this._url,this._imageUrl]);

  @override
  State<StatefulWidget> createState() => _MostDetailAppInfo();
}

class _MostDetailAppInfo extends State<MostDetailAppInfo> {
  @override
  Widget build(BuildContext context) {
    ScrollController _controller;
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        builder: (context, snapshot) {
          MostDetail detail = snapshot.data;

          if (detail != null) {

          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              heightFactor: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: NetworkImage(widget._imageUrl),
                    fit: BoxFit.fill
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  detail.detailHeaderTitle.toString(),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    controller: _controller,
                    child: Container(

                      child: Text(
                        detail.detailDetail.toString(),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          );
        },
        future: initDetail(widget._url),
      ),
    );
  }
}
