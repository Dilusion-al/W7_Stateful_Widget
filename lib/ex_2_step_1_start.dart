import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: [
          FavouriteCard(title: 'Card 1', description: 'This is the first card', isFavourite: true),
          FavouriteCard(title: 'Card 2', description: 'This is the second card', isFavourite: false),
          FavouriteCard(title: 'Card 3', description: 'This is the third card', isFavourite: true),

        ],
      ),
    ),
  ),
);

class FavouriteCard extends StatefulWidget {
  final String title;
  final String description;
  final bool isFavourite;

  const FavouriteCard({
    super.key,
    required this.title,
    required this.description,
    required this.isFavourite,
  });


  @override
  State<FavouriteCard> createState() => _FavouriteCardState();
}

class _FavouriteCardState extends State<FavouriteCard> {
  late bool _isFavourite = false;
  void toggle() {
    setState(() {
      _isFavourite = !_isFavourite;
    });
  }
  @override
  build(BuildContext context) {
   
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight(500),
                    fontSize: 16,
                  ),
                ),
                Text(
                  widget.description,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight(500),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          IconButton(onPressed: toggle, icon: !_isFavourite ? Icon(Icons.favorite_outline) : Icon(Icons.favorite, color: Colors.red))
        ],
      ),
    );
  }
}
