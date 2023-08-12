



import 'package:flutter/material.dart';

import '../Reuseable_widgets/NavegatorEase.dart';
import '../findMyPass.dart';

Column appDrawer(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: null,
              ),
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //
              //       image: Icon(Icons.home),
              //       fit: BoxFit.cover),
              // ),
              accountName: Text("ramez"),
              accountEmail: Text("ramezmalak@gmail.com")),

          ListTile(
            title: const Text("find my pass"),
            leading: const Icon(Icons.password),
            onTap: () {
              pushStack(context ,findCreatorPage());
            },
          ),
          const Divider(
            // Add a Divider below each ListTile to separate the items
            endIndent: 20,
            thickness: 1.4, // You can adjust the thickness as needed
          ),
          ListTile(
            title: const Text("Home"),
            leading: const Icon(Icons.home),
            onTap: () {},
          ),
          ListTile(
            title: const Text("My Products"),
            leading: const Icon(Icons.add_shopping_cart),
            onTap: () {},
          ),
          ListTile(
            title: const Text("About"),
            leading: const Icon(Icons.help_center),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Logout"),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {},
          ),
        ],
      ),
      Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: const Text(
            "Developed By Ramez Malak 2023",
            style: TextStyle(fontSize: 15),
          )),
    ],
  );
}
