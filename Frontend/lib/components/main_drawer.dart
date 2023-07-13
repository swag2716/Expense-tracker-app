import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expenses_app/screens/log_in_screen.dart';

import '../storage/auth_storage.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
        future: TokenManager().getName(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while fetching the name
            return CircularProgressIndicator();
          } else if (snapshot.hasData) {
            // Use the retrieved name if available
            final name = snapshot.data!;
            return Column(children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1594616838951-c155f8d978a0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                title: const Text("Your Profile"),
              ),

              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.inbox,
                  color: Colors.black,
                ),
                title: const Text("Your Inbox"),
              ),

              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.assessment,
                  color: Colors.black,
                ),
                title: const Text("Your Dashboard"),
              ),

              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                title: const Text("Settings"),
              ),
              const Divider(),
              ListTile(
                onTap: () async {
                  final tokenManager = TokenManager();
                  await tokenManager.clearTokens();
                  Get.offAll(LogInScreen());
                },
                leading: const Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                title: const Text("Log out"),
              ),
            ]);
          } else if (snapshot.hasError) {
            // Handle the error case
            return Text('Error: ${snapshot.error}');
          } else {
            // Handle other cases
            return const Text('No name available');
          }
        });
  }
}
