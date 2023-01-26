import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _albumApiProvider = AlbumAPIProvider();
  late Future<List<Album>> futureAlbums;

  @override
  void initState() {
    super.initState();
    futureAlbums = _albumApiProvider.fetchAlbums();
  }

  void _incrementCounter() {
    setState(() {
      futureAlbums = _albumApiProvider.fetchAlbums();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: FutureBuilder<List<Album>>(
            future: futureAlbums,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Text('Click To Load Data');
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                default:
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                          child: Text(snapshot.data![index].id.toString())),
                      title: Text(
                        snapshot.data![index].title,
                      ),
                      subtitle: Text(
                        snapshot.data![index].userId.toString(),
                      ),
                      trailing: const Icon(Icons.person),
                    ),
                  );
              }
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () async {
                Album album = await _albumApiProvider.fetchAlbum(2);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(album.toString()),
                ));
              },
              tooltip: 'Increment',
              child: const Icon(Icons.person),
            )
          ],
        ));
  }
}