import 'package:flutter/material.dart';
import 'package:projet_pfe/Notifications.dart';
import 'package:projet_pfe/login.dart';

class DashboardPage extends StatelessWidget {
  final String userName;
  final int nbrSites;
  final int nbrGateways;
  final int nbrDevices;
  final notifications;
  final waterLevels;
  final temperatureData;
  final String imageUser;

  const DashboardPage({
    Key? key,
    required this.userName,
    required this.nbrSites,
    required this.nbrGateways,
    required this.nbrDevices,
    required this.notifications,
    required this.waterLevels,
    required this.temperatureData,
    required this.imageUser,
  }) : super(key: key);

  int get notificationCount => notifications.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF143D6D),
        title: const Text("Dashboard"),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationPage(notifications: notifications),
                    ),
                  );
                },
                icon: const Icon(Icons.notifications),
              ),
              if (notificationCount > 0)
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Text(
                      notificationCount.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF143D6D),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    // Replace with user's image
                    backgroundImage: AssetImage('img/employee.png'),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    userName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout), // Ajout de l'icône pour logout
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            "Welcome, $userName!",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InformationCard(
                title: "Sites",
                value: nbrSites.toString(),
                icon: Icons.location_city,
              ),
              InformationCard(
                title: "Gateways",
                value: nbrGateways.toString(),
                icon: Icons.router,
              ),
              InformationCard(
                title: "Devices",
                value: nbrDevices.toString(),
                icon: Icons.devices,
              ),
            ],
          ),
          const SizedBox(height: 40),

        ],
      ),
    );
  }
}

class InformationCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const InformationCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(
              icon,
              size: 48,
              color: const Color(0xFF69C4CF),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              "You have $value",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class DataPoint {
  final String date;
  final double waterLevel;
  final double temperature;
  final double humidity;

  DataPoint({
    required this.date,
    required this.waterLevel,
    required this.temperature,
    required this.humidity,
  });
}