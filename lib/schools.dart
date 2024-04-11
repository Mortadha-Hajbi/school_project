import 'package:flutter/material.dart';
class CatListView extends StatelessWidget {
  final List<CatItem> catItems = [
    CatItem(catEmotion: 'Angry Cat', imagePath: 'lib/images/cat.jpeg'),
    CatItem(catEmotion: 'Funny Cat', imagePath: 'lib/images/cat.jpeg'),
    CatItem(catEmotion: 'Happy Cat', imagePath: 'lib/images/cat.jpeg'),
    CatItem(catEmotion: 'Sleepy Cat', imagePath: 'lib/images/cat.jpeg'),
    CatItem(catEmotion: 'Working Cat', imagePath: 'lib/images/cat.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: catItems.length,
      itemBuilder: (context, index) {
        return catItems[index];
      },
    );
  }
}

class CatItem extends StatelessWidget {
  final String catEmotion;
  final String imagePath;

  CatItem({required this.catEmotion, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          catEmotion,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        trailing: Image.asset(
          imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        tileColor: getColorForCatEmotion(catEmotion),
      ),
    );
  }

  Color getColorForCatEmotion(String emotion) {
    switch (emotion.toLowerCase()) {
      case 'angry cat':
        return Colors.red[100]!;
      case 'funny cat':
        return Colors.yellow[100]!;
      case 'happy cat':
        return Colors.green[100]!;
      case 'sleepy cat':
        return Colors.purple[100]!;
      case 'working cat':
        return Colors.orange[100]!;
      default:
        return Colors.white;
    }
  }
}
