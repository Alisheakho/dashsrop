import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../layout/main_layout.dart';
import 'package:dash_drop_dashboard/flutter_gen/app_localizations.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return MainLayout(
      title: lang.dashboard,
      child: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.5,
        children: [
          _buildStatCard(lang.stats_pending, "12", Icons.pending_actions, Colors.orange),
          _buildStatCard(lang.stats_approved, "450", Icons.check_circle_outline, AppTheme.primary),
          _buildStatCard(lang.stats_employees, "1,200", Icons.people_outline, AppTheme.secondary),
          _buildStatCard(lang.stats_allowance, "35 Days", Icons.date_range, Colors.blue),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color, size: 32),
                Text(
                  value,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
