import 'package:flutter/material.dart';

void main() {
  runApp(const DriveApp());
}

class DriveApp extends StatelessWidget {
  const DriveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drive UI',
      theme: ThemeData.dark(), // Dark theme for Drive-like look
      home: const DriveHome(),
    );
  }
}

class DriveHome extends StatelessWidget {
  const DriveHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DriveDrawer(),
      appBar: AppBar(
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Search in Drive',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person),
            ),
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const [
          DriveItem(name: "AR/VR & Development", date: "Sep 4, 2024", icon: Icons.folder),
          DriveItem(name: "Colab Notebooks", date: "Nov 4, 2023", icon: Icons.folder_copy),
          DriveItem(name: "CSE - Lec.", date: "Sep 7, 2024", icon: Icons.folder),
          DriveItem(name: "Development", date: "Dec 25, 2024", icon: Icons.folder),
          DriveItem(name: "FYDP", date: "Sep 11, 2024", icon: Icons.folder_special),
          DriveItem(name: "Research", date: "Jul 20, 2023", icon: Icons.folder),
          DriveItem(name: "TA", date: "Feb 23, 2024", icon: Icons.folder),
          DriveItem(name: "Zion", date: "May 6, 2023", icon: Icons.folder),
          DriveItem(name: "Git.pptx", date: "Mar 24", icon: Icons.slideshow),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: 3,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Starred'),
          BottomNavigationBarItem(icon: Icon(Icons.share), label: 'Shared'),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Files'),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.purple,
        icon: const Icon(Icons.add),
        label: const Text('New'),
        onPressed: () {},
      ),
    );
  }
}

class DriveItem extends StatelessWidget {
  final String name;
  final String date;
  final IconData icon;

  const DriveItem({
    super.key,
    required this.name,
    required this.date,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(name),
      subtitle: Text('Modified $date'),
      trailing: const Icon(Icons.more_vert),
    );
  }
}

class DriveDrawer extends StatelessWidget {
  const DriveDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text(
              'Google Drive',
              style: TextStyle(fontSize: 24),
            ),
          ),
          const ListTile(leading: Icon(Icons.access_time), title: Text("Recent")),
          const ListTile(leading: Icon(Icons.dashboard_customize), title: Text("Workspaces")),
          const ListTile(leading: Icon(Icons.offline_pin), title: Text("Offline")),
          const ListTile(leading: Icon(Icons.delete), title: Text("Trash")),
          const ListTile(leading: Icon(Icons.warning), title: Text("Spam")),
          const ListTile(leading: Icon(Icons.settings), title: Text("Settings")),
          const ListTile(leading: Icon(Icons.help), title: Text("Help & feedback")),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.cloud),
            title: const Text("Storage"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                LinearProgressIndicator(
                  value: 7.44 / 15.0,
                  color: Colors.purple,
                  backgroundColor: Colors.grey[800],
                ),
                const SizedBox(height: 4),
                const Text("7.44 GB of 15 GB used", style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}