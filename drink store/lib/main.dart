import 'package:flutter/material.dart';

void main() {
  runApp(WineApp());
}

class WineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isRedSelected = false;
  bool isWhiteSelected = true;
  bool isRoseSelected = false;
  bool isChampagneSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        //title: Text('WineApp'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  // 1-я линия: два текста слева, иконка справа
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  size: 24, color: Color(0xFF667085)),
                              SizedBox(width: 8),
                              Text(
                                'Donnerville Drive',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_drop_down,
                                  size: 24, color: Color(0xFF667085)),
                            ],
                          ),
                          Text(
                            '4 Donnerville Hall, Donnerville Drive...',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF667085)),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Icon(Icons.notifications, size: 32),
                          Positioned(
                            right: -4,
                            top: -4,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: const Text(
                                '3',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // 2-я линия: Search Bar
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.blueGrey),
                      ),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Shop wines by',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildButton('Type', isRedSelected, () {
                          setState(() {
                            isRedSelected = !isRedSelected;
                          });
                        }),
                        const SizedBox(width: 10),
                        buildButton('Style', isWhiteSelected, () {
                          setState(() {
                            isWhiteSelected = !isWhiteSelected;
                          });
                        }),
                        const SizedBox(width: 10),
                        buildButton('Countries', isRoseSelected, () {
                          setState(() {
                            isRoseSelected = !isRoseSelected;
                          });
                        }),
                        const SizedBox(width: 10),
                        buildButton('Grape', isChampagneSelected, () {
                          setState(() {
                            isChampagneSelected = !isChampagneSelected;
                          });
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 5-я линия: Горизонтальный ListView (карты продуктов)
                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildProductCard(
                            'White wines', 'assets/white_w.jpeg', 123),
                        buildProductCard(
                            'Rose wines', 'assets/rose_wine.webp', 123),
                        buildProductCard('Red wines', 'assets/red_w.jpeg', 123),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Wine', style: TextStyle(fontSize: 16)),
                      Text('view all', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return buildVerticalProductCard('assets/download.jfif'
                    //'https://mercatorwine.ca//img/Mercator_Summer_Evening.28cb3799.9555d423.jpg'
                    );
              },
              childCount: 13, // Количество элементов в списке
            ),
          ),
        ],
      ),
    );
  }

  // Метод для создания кнопки с изменяющимся стилем
  ElevatedButton buildButton(
      String label, bool isSelected, VoidCallback onPressed) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          isSelected ? Colors.pink.shade100 : Colors.white,
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            side: BorderSide(
              color: isSelected ? Colors.red : Colors.grey,
              width: 1.0,
            ),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          color: isSelected ? Colors.red : Colors.black,
        ),
      ),
    );
  }

  Widget buildVerticalProductCard(String imagePath) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0, right: 16, left: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Верхняя часть карточки: Изображение и статус
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Изображение продукта
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    imagePath,
                    height: 120,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            'Available',
                            style: TextStyle(
                              color: Colors.green.shade800,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      // Название продукта
                      const Text(
                        'Ocone Bozzovich Beneventano Bianco IGT',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Категория и описание вина
                      Row(
                        children: [
                          const Icon(Icons.wine_bar,
                              color: Colors.red, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            'Red wine (Green and Flinty)',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      // Страна происхождения
                      Row(
                        children: [
                          const Icon(Icons.flag, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            'From Champagne Blanc',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            // Нижняя часть карточки: цена и доп. информация
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Кнопка "Favourite"
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border, color: Colors.grey),
                  label: const Text(
                    'Favourite',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Цена
                    const Text(
                      '₹ 23,256,596',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 4),
                    // Объем бутылки
                    Text(
                      'Bottle (750ml)',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            // Оценка критиков
            Row(
              children: [
                const Text(
                  "Critics' Scores: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text(
                  '94 / 100',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Функция для создания карточки продукта
Widget buildProductCard(String title, String imagePath, int count) {
  return Container(
    width: 160, // Ширина карточки
    margin: EdgeInsets.all(8.0), // Отступы между карточками
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Изображение продукта
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Название продукта
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        // Красный индикатор количества
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Text(
              '$count',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
