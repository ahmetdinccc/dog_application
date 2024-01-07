import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.info_outline,
                      size: 30,
                    ),
                    title: const Text("Help", style: TextStyle(fontSize: 20)),
                    onTap: () {},
                    trailing: const Icon(Icons.arrow_right_sharp),
                  ),
                  Container(
                    height: 2,
                    width: 350, // Çizgi yüksekliği
                    color:
                        const Color.fromARGB(255, 225, 225, 225), // Çizgi rengi
                  ),
                  ListTile(
                    leading: const Icon(Icons.star_border, size: 30),
                    title: const Text(
                      "Rate us",
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {},
                    trailing: const Icon(Icons.arrow_right_sharp),
                  ),
                  Container(
                      height: 2,
                      width: 350, // Çizgi yüksekliği
                      color: const Color.fromARGB(
                          255, 225, 225, 225) // Çizgi rengi
                      ),
                  ListTile(
                    leading: const Icon(Icons.note_alt_outlined, size: 30),
                    title: const Text("Share With Friends",
                        style: TextStyle(fontSize: 20)),
                    onTap: () {},
                    trailing: const Icon(Icons.arrow_right_sharp),
                  ),
                  Container(
                      height: 2,
                      width: 350, // Çizgi yüksekliği
                      color: const Color.fromARGB(
                          255, 225, 225, 225) // Çizgi rengi
                      ),
                  ListTile(
                    leading: const Icon(Icons.share_outlined, size: 30),
                    title: const Text("Terms of Use",
                        style: TextStyle(fontSize: 20)),
                    onTap: () {},
                    trailing: const Icon(Icons.arrow_right_sharp),
                  ),
                  Container(
                    height: 2,
                    width: 350, // Çizgi yüksekliği
                    color:
                        const Color.fromARGB(255, 225, 225, 225), // Çizgi rengi
                  ),
                  ListTile(
                    leading: const Icon(Icons.verified_user_outlined, size: 30),
                    title: const Text("Privacy Policy",
                        style: TextStyle(fontSize: 20)),
                    onTap: () {},
                    trailing: const Icon(Icons.arrow_right_sharp),
                  ),
                  Container(
                      height: 2,
                      width: 350, // Çizgi yüksekliği
                      color: const Color.fromARGB(
                          255, 225, 225, 225) // Çizgi rengi
                      ),
                  ListTile(
                    leading: const Icon(Icons.verified_sharp, size: 30),
                    title: const Text("Os Version",
                        style: TextStyle(fontSize: 20)),
                    trailing: const Text(
                      "android",
                      style: TextStyle(
                          color: Color.fromARGB(255, 150, 150, 150),
                          fontSize: 15),
                    ),
                    onTap: () {},
                  ),
                ],
              )),
        ));
  }
}
