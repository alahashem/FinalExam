import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/api_service.dart';
import 'recipe_detail_screen.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  late Future<List<dynamic>> _recipes;

  @override
  void initState() {
    super.initState();
    _recipes = ApiService.fetchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      appBar: AppBar(
        title: Text(
          'Recipes',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xE882BEFF),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _recipes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());

          if (snapshot.hasError)
            return Center(child: Text('Error loading recipes'));

          final recipes = snapshot.data!;

          return ListView.separated(
            padding: EdgeInsets.all(16),
            itemCount: recipes.length,
            separatorBuilder: (context, index) => SizedBox(height: 12),
            itemBuilder: (context, index) {
              final recipe = recipes[index];

              String? imageUrl = recipe['image'];
              if (imageUrl == null || imageUrl.isEmpty) {
                imageUrl = 'https://via.placeholder.com/150';
              } else if (!imageUrl.startsWith('http')) {
                imageUrl = 'https://spoonacular.com/$imageUrl';
              }

              return ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.broken_image, size: 40),
                  ),
                ),
                title: Text(
                  recipe['title'],
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RecipeDetailScreen(id: recipe['id']),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
