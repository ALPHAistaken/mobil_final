import 'package:flutter/material.dart';

class postScreen extends StatelessWidget {
  const postScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Column(
          children: [
            Container(
                width: double.infinity,
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Image.asset("assets/images/instagram.png"),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.add_circle,
                                color: Colors.black87,
                                size: 20,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.black87,
                                size: 20,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, left: 8, bottom: 8, right: 20),
                              child: Icon(
                                Icons.send,
                                color: Colors.black87,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )),
            Expanded(
              child: Container(
                  child: SingleChildScrollView(
                child: Column(children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        hikaye("assets/images/pp.jpeg", "enes_özcan"),
                        hikaye("assets/images/pp2.jpg", "Tolga_sağir"),
                        hikaye("assets/images/pp3.jpg", "ABDULLAH"),
                        hikaye("assets/images/pp4.jpg", "Eren Günal"),
                        hikaye("assets/images/pp5.jpg", "selin"),
                        hikaye("assets/images/pp6.jpg", "AZRA"),
                      ],
                    ),
                  ),
                  posts("assets/images/pp.jpeg", "assets/images/post1.jpg",
                      "enes_özcan", "istabul"),
                  posts("assets/images/pp2.jpg", "assets/images/post2.jpg",
                      "Tolga_sağir", "kutup"),
                  posts("assets/images/pp4.jpg", "assets/images/post3.jpg",
                      "Eren Günal", "çin"),
                  posts("assets/images/pp5.jpg", "assets/images/post4.jpg",
                      "selin", "maldivler"),
                ]),
              )),
            ),
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(Icons.home, size: 28, color: Colors.black87),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child:
                          Icon(Icons.search, size: 28, color: Colors.black87),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(Icons.smart_display,
                          size: 28, color: Colors.black87),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child:
                          Icon(Icons.favorite, size: 28, color: Colors.black87),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child:
                          Icon(Icons.person, size: 28, color: Colors.black87),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  Container posts(String avatar, String photo, String name, String location) =>
      Container(
          child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(avatar),
                        radius: 20,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            location,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.more_horiz)
                ],
              ),
            ),
            Image.asset(photo),
            begeni(),
            yorum("tolga_sağir",
                "fenasın he offffffffffffffffffffffffffffffff.iyisin busun"),
            yorum("AZRA", "ayynen"),
            yorum("ABDULLAH", "aslanım kendine iyi bakıyosun OK"),
          ],
        ),
      ));

  Padding begeni() {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(Icons.favorite_border, color: Colors.black87),
                SizedBox(
                  width: 8,
                ),
                Icon(Icons.comment_bank_outlined, color: Colors.black87),
              ],
            ),
          ),
          Icon(Icons.flag_circle_outlined, color: Colors.black87),
        ],
      ),
    );
  }

  Padding yorum(String name, String comment) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 12,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(comment,
                maxLines: 5,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                )),
          ),
        ],
      ),
    );
  }

  Widget hikaye(String avatar, String name) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  const Color.fromRGBO(214, 71, 103, 1),
                  Color.fromARGB(240, 248, 189, 116),
                ]),
                shape: BoxShape.circle),
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(avatar),
                radius: 35,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(name,
              style: TextStyle(
                fontSize: 11,
              ),
              overflow: TextOverflow.clip),
        ],
      ),
    );
  }

  Container PostItem() => Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: YourChildWidget(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/post1.jpg",
              ),
            ),
          ],
        ),
      );

  YourChildWidget() {}
}

CricleAvatar({required AssetImage backgroundImage, required int radius}) {}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Container();
}
