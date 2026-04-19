import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController userID = TextEditingController();
  TextEditingController password = TextEditingController();

  bool? isGuestMode = false;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: .min,
            spacing: 12,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(40),
                splashColor: Colors.cyan,
                onTap: () {
                  print("Tapped the well");
                },
                child: Icon(Icons.person_rounded, size: 178),
              ),
              TextField(
                controller: userID,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22)),
                  ),
                ),
                onEditingComplete: () {
                  setState(() {});
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.key),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22)),
                  ),
                ),
                onEditingComplete: () {
                  setState(() {});

                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.settings),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22)),
                  ),
                ),
                items: [
                  DropdownMenuItem(value: "SM", child: Text("Social Media")),
                  DropdownMenuItem(value: "MP", child: Text("Marketplace")),
                ],
                onChanged: (value) {
                  print(value);
                },
              ),
              SwitchListTile(
                title: const Text("Remember me"),
                value: rememberMe,
                onChanged: (value) {
                  setState(() {
                    rememberMe = value;
                  });
                },
              ),
              FilledButton(onPressed: (){

              }, child: const Text("Log In"))
            ],
          ),
        ),
      ),
    );
  }
}
