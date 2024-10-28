import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:provider_1/Models/favoritesprovider.dart';
import 'package:provider/provider.dart';
import 'Screens/Recipie.dart';

// void main() {
//   runApp(MyApp());
// }
//

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // Enable DevicePreview in debug mode
      builder: (context) => MyApp(), // Launch MyApp
    ),
  );
}





class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HomePage"),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Recipie');
                  },
                  child: Text("Recipie App")
              )
            ],
          ),
        )
    );
  }
}


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Create a sample list of categories
//     final List<ItemCategories> categories = [
//       ItemCategories('c1', 'Italian', 0xFFE57373),
//       ItemCategories('c2', 'Quick & Easy', 0xFF81C784),
//       // Add more categories as needed
//     ];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'First App',
        home: const Homepage(),
        routes: {
          '/Recipie': (context) => Recipie(),
        },
      ),
    );
  }
}

//
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       useInheritedMediaQuery: true,
//       locale: DevicePreview.locale(context), // For DevicePreview
//       builder: DevicePreview.appBuilder,
//       title: 'DeliMeals',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: CategoriesScreen(categories), // Pass the categories list here
//     );
//   }
// }






//
//
// class HomePage extends StatelessWidget {
//   final List<String> companyImages = [
//     "assets/x.png",
//     "assets/tesla.png",
//     "assets/spacex.png",
//     "assets/neuralink.png",
//     "assets/hyperloop.png",
//     "assets/boring.png",
//   ];
//
//   final List<String> companyNames = [
//     "Twitter (X)",
//     "Tesla",
//     "SpaceX",
//     "NeuraLink",
//     "Hyperloop",
//     "Boring Company",
//   ];
//
//   final List<String> postImages = [
//     "assets/tw1.jpg",
//     "assets/tw2.jpg",
//     "assets/tw3.png",
//     "assets/tw4.png",
//     "assets/tw5.png",
//     "assets/tw6.png",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             width: double.infinity,
//             height: 200,
//             decoration: BoxDecoration(
//               gradient: RadialGradient(
//                 center: Alignment.topLeft,
//                 radius: 0.77,
//                 colors: [
//                   Color.fromARGB(255, 128, 105, 255),
//                   Color.fromARGB(255, 149, 139, 255),
//                   Color.fromARGB(255, 112, 51, 255),
//                 ],
//                 stops: [0.4, 0.6, 1],
//               ),
//             ),
//           ),
//           ListView(
//             children: [
//               SizedBox(height: 80),
//               Center(
//                 child: Container(
//                   width: 300,
//                   height: 200,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 5,
//                         blurRadius: 7,
//                       ),
//                     ],
//                     color: Colors.white,
//                   ),
//                   child: Stack(
//                     alignment: Alignment.bottomCenter,
//                     clipBehavior: Clip.none,
//                     children: [
//                       Positioned(
//                         top: -50,
//                         left: 100,
//                         child: Container(
//                           width: 100,
//                           height: 100,
//                           decoration: BoxDecoration(
//                             color: Colors.red,
//                             image: DecorationImage(
//                               image: AssetImage('assets/elon.jpg'),
//                               fit: BoxFit.fill,
//                             ),
//                             borderRadius: BorderRadius.circular(50),
//                           ),
//                         ),
//                       ),
//                       Column(
//                         children: [
//                           SizedBox(height: 50),
//                           Text(
//                             "Elon Musk",
//                             style: TextStyle(fontSize: 20),
//                           ),
//                           Text(
//                             "Founder | CEO | USA",
//                             style: TextStyle(color: Colors.grey),
//                           ),
//                           SizedBox(height: 40),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Column(
//                                 children: [
//                                   Text(
//                                     "26.5k",
//                                     style: TextStyle(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     "SUBS",
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: const Color.fromARGB(
//                                         255,
//                                         123,
//                                         123,
//                                         123,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 children: [
//                                   Text(
//                                     "189.5M",
//                                     style: TextStyle(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     "FOLLOWERS",
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.black38,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 children: [
//                                   Text(
//                                     "653",
//                                     style: TextStyle(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     "FOLLOWING",
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.black38,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Container(
//                 height: 1090,
//                 color: Colors.white,
//                 padding: EdgeInsets.all(7),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Companies",
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         Text(
//                           "This Way👉",
//                           style: TextStyle(
//                             color: const Color.fromARGB(255, 33, 212, 243),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 7),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: List.generate(
//                           companyImages.length,
//                               (index) => _createNamedContainer(
//                             name: companyNames[index],
//                             imagePath: companyImages[index],
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                     Text(
//                       "Top posts",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     Container(
//                       height: 1,
//                       width: double.infinity,
//                       color: Colors.grey,
//                     ),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Column(
//                         children: List.generate(
//                           postImages.length,
//                               (index) => Center(
//                             child: _createNamedContainer(
//                               name: "",
//                               imagePath: postImages[index],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _createNamedContainer({
//     required String name,
//     required String imagePath,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           width: 100,
//           height: 100,
//           margin: EdgeInsets.all(5),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             image: DecorationImage(
//               image: AssetImage(imagePath),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         if (name.isNotEmpty)
//           SizedBox(
//             width: 100,
//             child: Text(
//               name,
//               style: TextStyle(color: Colors.grey),
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//       ],
//     );
//   }
// }
