import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../models/gif_model.dart';
import '../services/giphy_api.dart';
import 'detail_screen.dart'; 

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final PagingController<int, GifModel> _pagingController =
      PagingController(firstPageKey: 1);




  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems =
          await GiphyApi.fetchGifs(_searchController.text, pageKey);

      final isLastPage = newItems.length < 25;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      print('Fetch error: $error');
      _pagingController.error = error;
    }
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GIF Search'),
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: PagedGridView<int, GifModel>(
              pagingController: _pagingController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              builderDelegate: PagedChildBuilderDelegate<GifModel>(
                itemBuilder: (context, gif, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(gif: gif),
                      ),
                    );
                  },
                  child: Image.network(gif.url),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          labelText: 'Search for GIFs',
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              if (_searchController.text.isNotEmpty) {
                _pagingController.refresh();
              }
            },
          ),
        ),
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            _pagingController.refresh();
          }
        },
      ),
    );
  }


}
