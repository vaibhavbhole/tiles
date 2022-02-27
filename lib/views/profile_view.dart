import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiles/viewmodels/UserVM.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Consumer<UserVm>(
        builder: (context, uservm, child) => ListView(
          children: [
            SizedBox(
              height: 150.0,
              child: Center(
                child: Image.network(
                  uservm.user?.imagePath ?? "",
                  width: 100.0,
                  height: 100.0,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle_outlined),
              title: const Text("First Name"),
              subtitle: Text(uservm.user?.firstName ?? ""),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.account_circle_outlined),
              title: const Text("Last Name"),
              subtitle: Text(uservm.user?.lastName ?? ""),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.email_outlined),
              title: const Text("Email ID"),
              subtitle: Text(uservm.user?.email ?? ""),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.phone_android_outlined),
              title: const Text("Phone"),
              subtitle: Text(uservm.user?.contactNo ?? ""),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
