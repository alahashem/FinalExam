import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child:
               Image.network('https://images.unsplash.com/photo-1606787366850-de6330128bfc?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGZvb2R8ZW58MHx8MHx8fDA%3D',fit: BoxFit.cover,
            ),
          ),
          // Semi-transparent overlay (optional for readability)
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.5)),
          ),
          // Main content (text, input fields, buttons)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 80),
              Padding(
                padding: EdgeInsets.all(40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Left side: Texts
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 4.0,
                                  color: Colors.black26,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Welcome back",
                            style: TextStyle(
                              color: Color(0xB4B9CAFF),
                              fontSize: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Right side: Image (optional)
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 60),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFD0D0D0),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              )
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey))),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Email or phone number",
                                    hintStyle: TextStyle(color: Color(0xFFBDBDBD)),
                                    border: InputBorder.none),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey))),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Color(0xFFBDBDBD)),
                                    border: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      Text("Forgot Password?", style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          // Navigate to HomeScreen when login button is pressed
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                        },
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xE882BEFF),
                          ),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
