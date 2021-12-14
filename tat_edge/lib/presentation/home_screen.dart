import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tat_edge/widgets/wid_txt.dart';

import 'video_player_screen.dart';

class HomeScreen extends StatelessWidget {
  final List data;
  const HomeScreen({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/json/home_data.json'),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            var homeData = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 100,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ChewieDemo()));
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          WidText(
                            title: homeData[index]['name'] ?? "-",
                            widColor: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: homeData == null ? 0 : homeData.length,
            );
          },
        ),
      ),
    );
  }
}
