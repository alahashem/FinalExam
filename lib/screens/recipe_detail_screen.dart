import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/api_service.dart';

class RecipeDetailScreen extends StatelessWidget {
  final int id;

  const RecipeDetailScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      appBar: AppBar(
        backgroundColor: Color(0xE882BEFF),
        title: Text(
          "Recipe Detail",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: ApiService.fetchRecipeDetails(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          if (snapshot.hasError)
            return Center(child: Text('Error loading details'));

          final recipe = snapshot.data!;

          String imageUrl = recipe['image'];
          if (imageUrl == null || imageUrl.isEmpty) {
            imageUrl = 'https://via.placeholder.com/150';
          } else if (!imageUrl.startsWith('http')) {
            imageUrl = 'https://spoonacular.com$imageUrl';
          }

          return SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Recipe Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 220,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 220,
                      color: Colors.grey[300],
                      child: Icon(Icons.broken_image, size: 80),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Title
                Text(
                  recipe['title'],
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 10),

                // Time
                Row(
                  children: [
                    Icon(Icons.timer, color: Colors.redAccent),
                    SizedBox(width: 5),
                    Text(
                      'Ready in ${recipe['readyInMinutes']} minutes',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // Summary
                Text(
                  recipe['summary'].replaceAll(RegExp(r'<[^>]*>'), ''),
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),

                SizedBox(height: 30),

                // Ingredients
                Text(
                  'Ingredients',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                Divider(thickness: 1.2),
                ...List<Widget>.from(
                  recipe['extendedIngredients'].map(
                        (i) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text("• ${i['original']}"),
                    ),
                  ),
                ),

                SizedBox(height: 30),

                // Start Cooking Button
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Let’s start cooking 🍳"),
                      ));
                    },
                    icon: Icon(Icons.restaurant_menu),
                    label: Text("Start Cooking"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                      textStyle: TextStyle(fontSize: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
