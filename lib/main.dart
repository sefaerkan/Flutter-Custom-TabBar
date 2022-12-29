import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'T A B  B A R'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> items = [
    "Home",
    "Explore",
    "Search",
    "Feed",
    "Post",
    "Activity",
    "Setting",
    "Profile",
  ];

  List<IconData> icons =[
   Icons.home,
   Icons.explore,
   Icons.search,
   Icons.feed,
   Icons.post_add,
   Icons.local_activity,
   Icons.settings,
   Icons.person,
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            current = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.all(5),
                          width: 80,
                          height: 45,
                          decoration: BoxDecoration(
                            color: current == index
                                ? Colors.white70
                                : Colors.white54,
                            borderRadius: current == index
                                ? BorderRadius.circular(15)
                                : BorderRadius.circular(10),
                            border: current == index
                                ? Border.all(
                                color: Colors.deepPurpleAccent, width: 2)
                                : null,
                          ),
                          child: Center(
                            child: Text(
                              items[index],
                              style: GoogleFonts.laila(
                                fontWeight: FontWeight.w500,
                                color: current == index
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: current == index,
                        child: Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.deepPurpleAccent,
                          ),
                        ),

                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              width: double.infinity,
              height: 500,
              child: Column(
                children: [
                  Icon(
                    icons[current],
                    size: 200,
                    color: Colors.deepPurpleAccent,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    items[current],
                    style: GoogleFonts.laila(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
