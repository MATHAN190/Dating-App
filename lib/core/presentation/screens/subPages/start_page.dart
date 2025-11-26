import 'package:dating_app/core/constant/Theme/dating_colors.dart';
import 'package:dating_app/core/presentation/screens/subPages/details_enter/enter_name.dart';
// import 'package:dating_app/core/presentation/screens/subPages/details_gather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE6B8FF), Color(0xFF825CFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sparkle App",
              style: TextStyle(
                fontFamily: "ArchivoBlack",
                fontSize: 20,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 250,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Transform.rotate(
                    angle: -0.35,
                    child: Container(
                      height: 180,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/couple.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    right: 0,
                    left: 30,
                    top: 60,
                    child: Transform.rotate(
                      angle: 0.20,
                      child: Container(
                        height: 180,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/couple2.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Title
            const Text(
              "Find your",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700,
                fontSize: 28,
                color: Colors.white,
              ),
            ),

            const Text(
              "Perfect match",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Meet New People , Spark Real Connections\nAnd See Where It Goes",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 13,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 80),

            //  Swipe
            SwipeButton.expand(
              width: MediaQuery.of(context).size.width * 0.8,
              thumb: Icon(Icons.favorite_border_outlined, color: Colors.white),
              activeThumbColor: DatingColors.primaryclr,
              activeTrackColor: DatingColors.lavendar,
              onSwipe: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context)=> EnterName())
                  ,
                  (route) => false,
                );
              },
              child: Text(
                "Swipe with Soul",
                style: TextStyle(color: DatingColors.darkNevy),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
