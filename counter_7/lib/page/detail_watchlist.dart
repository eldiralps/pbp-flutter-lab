import 'package:flutter/material.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/page/watchlist_page.dart';
import 'package:counter_7/model/watchlist.dart';

class DetailMyWatchlistPage extends StatefulWidget {
  var title;
  var release_date;
  var rating;
  var watched;
  var review;

  DetailMyWatchlistPage(
      {super.key,
      this.title,
      this.release_date,
      this.rating,
      this.watched,
      this.review});

  @override
  State<DetailMyWatchlistPage> createState() => _DetailMyWatchlistState();
}

class _DetailMyWatchlistState extends State<DetailMyWatchlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Detail")),
        drawer: MyDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Center(
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(children: [
              const Text(
                "Release Date: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(widget.release_date),
            ]),
            const SizedBox(height: 10),
            Row(children: [
              const Text("Rating: ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(widget.rating),
            ]),
            const SizedBox(height: 10),
            Row(children: [
              const Text("Status: ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              if (widget.watched == "Yes")
                const Text("Watched")
              else
                const Text("Not Watched"),
            ]),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Review: ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(widget.review),
                  ]),
            )
          ]),
        ),
        floatingActionButton: Container(
            margin: const EdgeInsets.only(left: 35),
            child: ElevatedButton(
              // style: ElevatedButton.styleFrom(
              //   primary: Colors.blue,
              //   minimumSize: const Size.fromHeight(40),
              // ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            )));
  }
}
