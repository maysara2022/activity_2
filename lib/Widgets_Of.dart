import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetOf extends StatefulWidget {
  List items = [];
  List<Map<dynamic, dynamic>> dataItems;

  WidgetOf({required this.dataItems, super.key, required this.items});

  @override
  State<WidgetOf> createState() => _WidgetOfState();
}

int currentType = 0;

class _WidgetOfState extends State<WidgetOf> {
  @override
  Widget build(BuildContext context) {
    List<Map<dynamic, dynamic>> filteredData =
        widget.dataItems.where((item) => item["type"] == currentType).toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red.shade900,
          title: Text('الرئيسية'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
                image: NetworkImage(
                    'https://media.istockphoto.com/id/1191226812/photo/downy-woodpecker-male.jpg?s=612x612&w=0&k=20&c=essds2UgDWrSiG9erS1lW3INhzpqFAMOTJ06YHSPo48=')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'التصنيفات',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    height: 90,
                    child: ListView.builder(
                        itemCount: widget.items.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (c, i) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    currentType = i +1;
                                    print('$currentType ddddddddddddddd');
                                  });
                                },
                                child: Image(
                                  image: NetworkImage(widget.items[i]),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Container(
                    height: 350,
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: (currentType == 0)
                            ? widget.items.length
                            : filteredData.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (c, i) {
                          Map<dynamic, dynamic> item = {};
                          if (currentType == 0) {
                            item = widget.dataItems[i];
                          } else
                            item = filteredData[i];

                          return Card(
                            child: Column(
                              children: [
                                Container(
                                  child: Image(
                                    image: NetworkImage(item['imageUrl']),
                                    fit: BoxFit.fill,
                                  ),
                                  height: 100,
                                  width: double.infinity,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    children: [
                                      Text(item['name']),
                                      Spacer(),
                                      Text(item['price']),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      child: Row(
                                        children: [
                                          Text('اضف للسلة'),
                                          Icon(Icons.shopping_cart),
                                        ],
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                      ),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.red.shade900))),
                                  width: double.infinity,
                                ),
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
