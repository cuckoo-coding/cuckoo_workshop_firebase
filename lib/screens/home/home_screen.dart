import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:randomapiapp/models/beer.dart';
import 'package:randomapiapp/theme/my_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final FirebaseFirestore firestore;

  late Future<List<Beer>> beers;

  @override
  void initState() {
    super.initState();
    firestore = FirebaseFirestore.instance;
    beers = getAllBeers();
  }

  Future<List<Beer>> getAllBeers() async {
    final beerSnapshots = await firestore.collection("beers").get();
    final beerList = beerSnapshots.docs
        .map((snapshot) => Beer.fromMap(snapshot.data()))
        .toList();

    return beerList;
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate =
        '${now.day.toString().padLeft(2, '0')}.${now.month.toString().padLeft(2, '0')}.${now.year}';

    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.sports_bar_rounded,
            color: MyColor.darkblue,
          ),
          title: Text('Our Beer Menu',
              style: Theme.of(context).textTheme.displayLarge),
          centerTitle: true,
          actions: [
            Text(
              formattedDate,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
        body: FutureBuilder(
          initialData: const [],
          future: beers,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.sports_bar_rounded),
                          title: Text(snapshot.data![index].name),
                          subtitle: Text(snapshot.data![index].tagline),
                          onTap: () {
                            //Navigator.pushNamed(context, '/detail');
                          },
                        );
                      });
                } else {
                  return const Center(
                    child: Text("No data found."),
                  );
                }
            }
          },
        ));
  }
}
