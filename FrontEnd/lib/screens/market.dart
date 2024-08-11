import 'package:flutter/material.dart';
import 'package:midassist/screens/salesitem.dart';
import 'package:midassist/screens/cart.dart';
import 'package:midassist/screens/custom_bottom_navigation_bar.dart';

class Market extends StatefulWidget {
  const Market({Key? key}) : super(key: key);

  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 25,
            left: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Cart(),
                      ),
                    );
                  },
                  child: const Image(
                    image: AssetImage('assets/back.png'),
                    height: 50,
                  ),
                ),
                const SizedBox(width: 100),
                const Text(
                  'Market',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80, left: 25, right: 25),
                child: TextField(
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    hintText:
                        _isFocused ? '' : 'Search doctor, drugs, articles...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 110),
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Item(),
                                ),
                              );
                            },
                            child: const Image(
                              image: AssetImage('assets/beauty.png'),
                              height: 120,
                              width: 130,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Boston Round Pack',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Padding(
                            padding: EdgeInsets.only(top: 0, bottom: 5),
                            child: Text(
                              'Cream and Body Lotion',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Image(
                                  image: AssetImage('assets/Rating.png'),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Rs. 5625/=',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavigationBar(),
          ),
        ],
      ),
    );
  }
}
