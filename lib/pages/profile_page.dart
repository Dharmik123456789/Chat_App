import 'package:chat_application/pages/auth/login_page.dart';
import 'package:chat_application/pages/home_page.dart';
import 'package:chat_application/service/auth_service.dart';
import 'package:chat_application/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  String userName;
  String email;
  ProfilePage({Key? key, required this.email, required this.userName})
      : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[600],
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
          backgroundColor: Colors.indigo[600],
          child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50),
        children: <Widget>[
          Icon(
            Icons.account_circle_rounded,
            size: 150,
            color: Colors.white,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            widget.userName,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold,
              fontSize: 20,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Divider(
            height: 2,
            color: Colors.white,
          ),
          ListTile(
            onTap: () {
              nextScreen(context, const HomePage());
            },
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: const Icon(Icons.group,color: Colors.deepOrangeAccent),
            title: const Text(
              "Groups",
              style: TextStyle(color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,),
            ),
          ),
          const Divider(
            height: 2,
            color: Colors.white,
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            onTap: () {},
            selected: true,
            selectedColor: Theme.of(context).primaryColor,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: const Icon(Icons.group,color: Colors.deepOrangeAccent),
            title: const Text(
              "Profile",
              style: TextStyle(color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,),
            ),
          ),
          const Divider(
            height: 2,
            color: Colors.white,
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            onTap: () async {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.indigo[400],
                      title: const Text("Logout",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),),
                      content: const Text("Are you sure you want to logout?",style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),),
                      actions: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.cancel,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            await authService.signOut();
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                                (route) => false);
                          },
                          icon: const Icon(
                            Icons.done,
                            color: Colors.lightGreen,
                          ),
                        ),
                      ],
                    );
                  });
            },
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: const Icon(Icons.exit_to_app,color: Colors.deepOrangeAccent),
            title: const Text(
              "Logout",
              style: TextStyle(color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
            ),
          const Divider(
            height: 2,
            color: Colors.white,
          ),
        ],
      )),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.account_circle_rounded,
              size: 180,
              color: Colors.white,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Full Name : ", style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white)),
                Text(widget.userName, style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white)),
              ],
            ),
            const Divider(
              height: 30,
              color: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Email : ", style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white)),
                Text(widget.email, style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
