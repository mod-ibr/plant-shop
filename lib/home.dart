import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:plant_shop/detail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> _products = [
    Product(
      image: '1.png',
      title: 'Amaryllis',
      desc:
          'Amaryllis is a bulbous plant, with each bulb being 5–10 cm (2.0–3.9 in) in diameter. It has several strap-shaped, hysteranthous, green leaves with midrib, 30–50 cm (12–20 in) long and 2–3 cm (0.79–1.18 in) broad, arranged in two rows.',
    ),
    Product(
      image: '3.jpg',
      title: 'spider orchid',
      desc:
          'flowers are 5-30cm long, wiry and densely hairy. single or multiple flowers, commonly cream-green with a maroon centre but can vary to blood-red, mauve and pink. flowers may have a faint petrochemical or musky odour.',
    ),
    Product(
      image: '6.png',
      title: 'Pelargonium ',
      desc:
          'A well shaped bushy plant, the flowers have white lower petals with candy pink upper petals that are feathered red at the base. The upper petals are also ruffled.',
    ),
    Product(
      image: '2.jpg',
      title: 'Myrtle',
      desc:
          'Myrtus communis (true myrtle), of the family Myrtaceae, is a fragrant, evergreen shrub with small, glossy green leaves and white, star-shaped flowers with long stamens, and, after their blooming, purple-black berries. It is native to Mediterranean Europe, North Africa, the Middle East, and Turkey.',
    ),
    Product(
      image: '4.jpg',
      title: 'Balsam',
      desc:
          'It is a sparsely-branched annual herbaceous plant and grows about 0.3 to 1 m tall. The plant produce tap root with numerous fibrous lateral roots. Foliage. Its leaves are alternately arranged along the succulent stems, lanceolate-elliptic and have serrate margins.',
    ),
    Product(
      image: '5.jpg',
      title: 'Сенполия (фиалка)',
      desc:
          'Violets are flowers with five petals: two pairs of lateral petals and one often with veins of another color. The leaves of violets are usually oval or heart-shaped, which may be lobed. Due to their almost universally recognized shape, these wildflowers are easy to identify.',
    ),
  ];

  final List<Map<String, dynamic>> _plantInform = [
    {
      'image': '1.png',
      'title': 'Amaryllis',
      'desc':
          'Amaryllis is a bulbous plant, with each bulb being 5–10 cm (2.0–3.9 in) in diameter. It has several strap-shaped, hysteranthous, green leaves with midrib, 30–50 cm (12–20 in) long and 2–3 cm (0.79–1.18 in) broad, arranged in two rows.',
    },
    {
      'image': '3.jpg',
      'title': 'spider orchid',
      'desc':
          'flowers are 5-30cm long, wiry and densely hairy. single or multiple flowers, commonly cream-green with a maroon centre but can vary to blood-red, mauve and pink. flowers may have a faint petrochemical or musky odour.',
    },
    {
      'image': '6.png',
      'title': 'Pelargonium ',
      'desc':
          'A well shaped bushy plant, the flowers have white lower petals with candy pink upper petals that are feathered red at the base. The upper petals are also ruffled.',
    },
    {
      'image': '2.jpg',
      'title': 'Myrtle',
      'desc':
          'Myrtus communis (true myrtle), of the family Myrtaceae, is a fragrant, evergreen shrub with small, glossy green leaves and white, star-shaped flowers with long stamens, and, after their blooming, purple-black berries. It is native to Mediterranean Europe, North Africa, the Middle East, and Turkey.',
    },
    {
      'image': '4.jpg',
      'title': 'Balsam',
      'desc':
          'It is a sparsely-branched annual herbaceous plant and grows about 0.3 to 1 m tall. The plant produce tap root with numerous fibrous lateral roots. Foliage. Its leaves are alternately arranged along the succulent stems, lanceolate-elliptic and have serrate margins.',
    },
    {
      'image': '5.jpg',
      'title': 'Сенполия (фиалка)',
      'desc':
          'Violets are flowers with five petals: two pairs of lateral petals and one often with veins of another color. The leaves of violets are usually oval or heart-shaped, which may be lobed. Due to their almost universally recognized shape, these wildflowers are easy to identify.',
    },
  ];

  List<Map<String, dynamic>> _foundPlant = [];
  TextEditingController editingController = TextEditingController();

  @override
  initState() {
    _foundPlant = _plantInform;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _plantInform;
    } else {
      results = _plantInform
          .where((user) => user['title']
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundPlant = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18, left: 14, right: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Plant Shop',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Icon(
                IconData(0xe0ef, fontFamily: 'MaterialIcons'),
                size: 40,
                color: Color.fromARGB(255, 5, 126, 57),
              )
            ],
          ),
          Text(
            'Types of plant and its description',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 5, 126, 57),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 35),
            child: Row(
              children: [_searchBox()],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              physics: BouncingScrollPhysics(),
              crossAxisCount: 4,
              itemCount: _foundPlant.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            product: _products[index],
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Center(
                              child: Card(
                                elevation: 8,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Image.asset(
                                    'assets/images/${_foundPlant[index]['image']}',
                                    width: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '${_foundPlant[index]['title']}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ));
              },
              staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
            ),
          )
        ],
      ),
    );
  }

  Widget _searchBox() {
    return Expanded(
      child: TextField(
        onChanged: (value) {
          _runFilter(value);
        },
        controller: editingController,
        decoration: InputDecoration(
          hintText: 'search',
          prefixIcon: Icon(
            Icons.search,
            size: 30,
          ),
          filled: true,
          fillColor: Color.fromARGB(255, 93, 196, 149),
          contentPadding: EdgeInsets.all(15),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}

class Product {
  String title;
  String image;
  String desc;

  Product({required this.title, required this.image, required this.desc});
}
