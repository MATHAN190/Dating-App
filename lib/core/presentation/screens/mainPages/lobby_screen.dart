
import 'package:dating_app/core/constant/Theme/dating_colors.dart';
import 'package:dating_app/core/presentation/screens/mainPages/bottom_pages/chat_screen.dart';
import 'package:dating_app/core/presentation/screens/mainPages/bottom_pages/fav_screen.dart';
import 'package:dating_app/core/presentation/screens/mainPages/bottom_pages/main_screen.dart';
import 'package:dating_app/core/presentation/screens/mainPages/bottom_pages/myProfile_screen.dart';
import 'package:flutter/material.dart';


class LobbyPage extends StatefulWidget {
  const LobbyPage({super.key});

  @override
  State<LobbyPage> createState() => _MainPageState();
}

class _MainPageState extends State<LobbyPage> {
  int selectedIndex = 0;

  
  final List<Widget> _pages = const [
    MainScreen(),
    FavScreen(),
    ChatScreen(),
    ProfilePage()
  ];

  final List<IconData> icons = [
    Icons.home_rounded,
    Icons.favorite_border_outlined,
    Icons.chat_outlined,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _pages[selectedIndex],
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(icons.length, (index) {
              bool isSelected = selectedIndex == index;
      
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 00),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? DatingColors.primaryclr
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        icons[index],
                        size: 28,
                        color:
                            isSelected ? Colors.white : Colors.grey.shade500,
                      ),
                      if (isSelected) ...[
                        const SizedBox(width: 6),
                        Text(
                          _getTabName(index),
                          style: TextStyle(
                            color:  Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  String _getTabName(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "Favourite";
      case 2:
        return "Chat";
      case 3:
        return "Profile";
      default:
        return "";
    }
  }
}
