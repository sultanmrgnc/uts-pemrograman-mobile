import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_controller.dart';
import '../widgets/dashboard_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);
    final username = authController.username ?? 'Guest';

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.blue,
            child: Center(
              child: Text(
                'Dashboard',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16),
              children: [
                DashboardCard(
                  icon: Icons.add,
                  label: 'Counter',
                  onTap: () => Navigator.pushNamed(context, '/counter'),
                ),
                DashboardCard(
                  icon: Icons.person,
                  label: 'Profil Saya',
                  onTap:
                      () => Navigator.pushNamed(
                        context,
                        '/profile',
                        arguments: username,
                      ),
                ),
                DashboardCard(
                  icon: Icons.settings,
                  label: 'Pengaturan',
                  onTap: () {},
                ),
                DashboardCard(
                  icon: Icons.logout,
                  label: 'Logout',
                  onTap: () => Navigator.pushNamed(context, '/login'),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue,
            ),
            height: 100,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Selamat datang, $username',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
