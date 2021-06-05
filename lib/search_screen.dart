import 'package:flutter/material.dart';
import 'package:show_search_example/search_result_screen.dart';

import 'data.dart';

class SearchScreen extends SearchDelegate {
  List<TourismPlace> resultSearch = [];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchResult(
      searchResult: resultSearch,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length < 2) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    } else {
      //kode untuk memfilter data berdasarkan query nya
      resultSearch = tourismPlaceList
          .where(
              (item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      return SearchResult(
        searchResult: resultSearch,
      );
    }
  }
}
