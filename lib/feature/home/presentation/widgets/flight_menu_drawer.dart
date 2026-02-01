import 'package:flutter/material.dart';

class FlightMenuDrawer extends StatelessWidget {
  const FlightMenuDrawer({super.key});

  void _closeThen(BuildContext context, VoidCallback action) {
    Navigator.pop(context); // close drawer first
    Future.microtask(action); // then run action safely
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xffffffff),
      child: SafeArea(
        child: Column(
          children: [
            // 🔹 HEADER
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: const [
                  CircleAvatar(radius: 22, backgroundColor: Colors.grey),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "John Doe",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // 🔹 MENU (Scrollable)
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(Icons.request_page_outlined),
                    title: const Text('My Booking'),
                    onTap: () => _closeThen(context, () {
                      // trigger sort logic
                    }),
                  ),
                  ListTile(
                    leading: const Icon(Icons.content_paste_sharp),
                    title: const Text('Boarding Pass'),
                    onTap: () => _closeThen(context, () {
                      // open filters
                    }),
                  ),
                  ListTile(
                    leading: const Icon(Icons.star_border),
                    title: const Text('Rate us'),
                    onTap: () => _closeThen(context, () {
                      // navigate to settings
                    }),
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // 🔹 FOOTER
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () => _closeThen(context, () {
                // logout logic
              }),
            ),
          ],
        ),
      ),
    );
  }
}
