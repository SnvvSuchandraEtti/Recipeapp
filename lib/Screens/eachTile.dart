

import 'package:flutter/material.dart';
import 'package:provider_1/Models/meals_model.dart';

class EachTile extends StatefulWidget {
  final Meal data;

  EachTile({Key? key, required this.data}) : super(key: key);

  @override
  _EachTileState createState() => _EachTileState();
}

class _EachTileState extends State<EachTile> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // Check if mounted before starting animation
    if (mounted) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    // Cancel the animation controller if still running
    if (_animationController.isAnimating) {
      _animationController.stop();
    }
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // Add favorite functionality here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section with fade-in animation
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: isLargeScreen ? 300 : 220,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.data.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title with fade-in and favorite button with scale animation
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.data.title,
                        style: TextStyle(
                          fontSize: isLargeScreen ? 28 : 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ScaleTransition(
                        scale: Tween(begin: 0.8, end: 1.0).animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: Curves.easeOut,
                          ),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () {
                            // Add favorite functionality here
                          },
                        ),
                      ),
                    ],
                  ),
                  // Subtitle with circle avatar and animated duration
                  Row(
                    children: [
                      CircleAvatar(
                        radius: isLargeScreen ? 24 : 18,
                        backgroundColor: Colors.orange,
                        child: Text(
                          widget.data.id,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.data.complexity,
                            style: const TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                          FadeTransition(
                            opacity: _animationController,
                            child: Text(
                              'Duration ${widget.data.duration} Minutes',
                              style: const TextStyle(fontSize: 12, color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Text(
                        "simple",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Ingredients Section with fade-in effect for chips
                  const Text(
                    "Ingredients",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: widget.data.ingredients.map((ingredient) {
                      return FadeTransition(
                        opacity: _animationController,
                        child: Chip(
                          label: Text(ingredient),
                          backgroundColor: Colors.grey[200],
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  // Steps Section with animated numbering
                  const Text(
                    "Steps to Prepare",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
                  ),
                  const SizedBox(height: 8),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.data.steps.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Animated step number
                            ScaleTransition(
                              scale: Tween(begin: 0.8, end: 1.0).animate(
                                CurvedAnimation(
                                  parent: _animationController,
                                  curve: Curves.easeOut,
                                ),
                              ),
                              child: Text(
                                '${index + 1}. ',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                widget.data.steps[index],
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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



