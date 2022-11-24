import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/watchlist.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/page/detail_watchlist.dart';

class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage({Key? key}) : super(key: key);

  @override
  State<MyWatchlistPage> createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
  Future<List<Watchlist>> fetchWatchlist() async {
    var url =
        Uri.parse('https://mvt-djangoapp.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object ToDo
    List<Watchlist> listWatchlist = [];
    for (var d in data) {
      if (d != null) {
        listWatchlist.add(Watchlist.fromJson(d));
      }
    }

    return listWatchlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Watch List"),
      ),
      drawer: MyDrawer(),
      body: FutureBuilder(
          future: fetchWatchlist(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) {
                    String title = snapshot.data![index].title;
                    String release_date = snapshot.data![index].release_date;
                    String rating = snapshot.data![index].rating.toString();
                    String watched = snapshot.data![index].watched;
                    String review = snapshot.data![index].review;
                    return Padding(
                        padding:
                            EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          child: ListTile(
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            title: Text(
                              "${snapshot.data![index].title}",
                            ),
                            subtitle:
                                Text("${snapshot.data![index].release_date}"),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailMyWatchlistPage(
                                        title: title,
                                        release_date: release_date,
                                        rating: rating,
                                        watched: watched,
                                        review: review))),
                          ),
                        ));
                  });
            }
          }),
    );
  }
}
