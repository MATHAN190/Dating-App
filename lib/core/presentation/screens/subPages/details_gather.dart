import 'package:dating_app/core/constant/Theme/dating_colors.dart';
import 'package:flutter/material.dart';

class DatingOnboarding extends StatefulWidget {
  const DatingOnboarding({super.key});

  @override
  State<DatingOnboarding> createState() => _DatingOnboardingState();
}

class _DatingOnboardingState extends State<DatingOnboarding> {
  TextEditingController nameController = TextEditingController();
   TextEditingController ageController = TextEditingController();
    TextEditingController genderController = TextEditingController();

  int step = 0;

  String name = "";
  int age = 18;
  String gender = "";
  double height = 170;
  double weight = 60;

  List<String> genders = ["Male", "Female", "Others"];

  void nextStep() {
    if (step < 4) setState(() => step++);
  }

  void previousStep() {
    if (step > 0) setState(() => step--);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFE6B8FF), Color(0xFF825CFF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: step > 0
              ? IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: previousStep,
                )
              : null,
        ),

        body: Padding(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(height: 50),
              // Progress Bar
              LinearProgressIndicator(
                value: (step + 1) / 5,
                color: DatingColors.primaryclr,
                backgroundColor: DatingColors.lavendar,
              ),

              const SizedBox(height: 40),
              Expanded(child: getStepWidget()),
            ],
          ),
        ),

        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: DatingColors.lavendar,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            onPressed: nextStep,
            child: Text(
              step == 4 ? "Finish" : "Next",
              style: TextStyle(color: DatingColors.darkNevy),
            ),
          ),
        ),
      ),
    );
  }

  // STEP CONTENT
  Widget getStepWidget() {
    switch (step) {
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "What's your name?",
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
            TextField(
              
              onChanged: (v) => name = v,
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Enter your name",
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        );

      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "How old are you?",
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
            Slider(
              value: age.toDouble(),
              min: 18,
              max: 60,
              divisions: 42,
              label: "$age",
              onChanged: (v) => setState(() => age = v.toInt()),
            ),

            Text(
              "$age years",
              style: const TextStyle(fontSize: 22, color: Colors.white),
            ),
          ],
        );

      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select gender",
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
            Column(
              children: genders.map((g) {
                return RadioListTile(
                  
                  title: Text(g, style: const TextStyle(color: Colors.white)),
                  value: g,
                  groupValue: gender,
                  onChanged: (v) => setState(() => gender = v.toString()),
                );
              }).toList(),
            ),
          ],
        );

      case 3:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your height?",
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
            Slider(
              value: height,
              min: 140,
              max: 200,
              label: "${height.toInt()} cm",
              onChanged: (v) => setState(() => height = v),
            ),
            Text(
              "${height.toInt()} cm",
              style: const TextStyle(fontSize: 22, color: Colors.white),
            ),
          ],
        );

      case 4:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your weight?",
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
            Slider(
              value: weight,
              min: 40,
              max: 120,
              label: "${weight.toInt()} kg",
              onChanged: (v) => setState(() => weight = v),
            ),
            Text(
              "${weight.toInt()} kg",
              style: const TextStyle(fontSize: 22, color: Colors.white),
            ),
          ],
        );

      default:
        return Container();
    }
  }
}
