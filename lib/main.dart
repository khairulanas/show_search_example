import 'package:flutter/material.dart';
import 'package:show_search_example/data.dart';
import 'package:show_search_example/search_result_screen.dart';
import 'package:show_search_example/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ///inisiasi variable untuk menyimpan hasil pencarian
  List<TourismPlace> resultSearch = [];
  @override
  void initState() {
    ///ketika screen ditampilkan, tambahkan data dummy ke result search
    ///sehingga data akan tampil semua
    resultSearch = tourismPlaceList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Example App'),
          actions: [
            IconButton(
              onPressed: () => showSearch(
                context: context,
                delegate: SearchScreen(),
              ),
              icon: Icon(Icons.search),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                onChanged: (query) {
                  ///state diperbarui setiap kita menulis query
                  setState(() {
                    ///jika query dihapus/tidak ada isinya, tampilkan semua data
                    if (query.length < 1) {
                      resultSearch = tourismPlaceList;
                    } else {
                      ///else: filter data nya... disini filter pencarian berdasarkan [name]
                      resultSearch = tourismPlaceList
                          .where((item) => item.name
                              .toLowerCase()
                              .contains(query.toLowerCase()))
                          .toList();
                    }
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),

              ///tampilkan hasil search nya
              Expanded(
                child: SearchResult(
                  searchResult: resultSearch,
                ),
              )
            ],
          ),
        ));
  }
}
