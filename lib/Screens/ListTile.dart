
import 'package:provider_1/Models/data.dart';
import 'eachTile.dart';
import 'package:flutter/material.dart';
import 'package:provider_1/Models/categories_model.dart';

class RecipeListScreen extends StatelessWidget {
  final String topic;

  RecipeListScreen({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
            final eachMeal = meals[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EachTile(data: eachMeal)));
              },
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: const Color.fromARGB(255, 212, 238, 213),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 30,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  eachMeal.title,
                                  style: const TextStyle(color: Colors.black, fontSize: 20),
                                ),
                                InkWell(
                                  onTap: () {
                                    // Add your favorite functionality here
                                  },
                                  child: const Icon(Icons.favorite),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(eachMeal.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}





