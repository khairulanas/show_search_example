import 'package:flutter/material.dart';

import 'data.dart';

class SearchResult extends StatelessWidget {
  final List<TourismPlace> searchResult;
  const SearchResult({Key? key, required this.searchResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final TourismPlace place = searchResult[index];
          return InkWell(
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Expanded(
                  //   flex: 1,
                  //   child: Image.asset(place.imageAsset),
                  // ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            place.name,
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(place.location),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: searchResult.length,
      ),
    );
  }
}
