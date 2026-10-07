import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:truckview_mvp/theme/app_colors.dart';
import 'package:truckview_mvp/theme/theme_provider.dart';
import 'package:truckview_mvp/widgets/brand_logo.dart';
import 'login.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final themeProvider = context.watch<ThemeProvider>();
    final user = Supabase.instance.client.auth.currentUser;

    final displayName = user?.userMetadata?['full_name'] as String? ??
        user?.email?.split('@').first ??
        'TruckView User';
    final displayEmail = user?.email ?? '';
    final displayPhone = user?.userMetadata?['phone'] as String? ?? '';

    final bgColor = isDark ? AppColors.pageDark : Colors.white;
    final cardColor = isDark ? AppColors.surfaceDark : Colors.white;
    final textColor = isDark ? AppColors.textDark : AppColors.textLight;
    final mutedColor = isDark ? AppColors.mutedDark : AppColors.mutedLight;
    final borderColor = isDark ? AppColors.borderDark : AppColors.borderLight;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BrandLogo(size: LogoSize.mini),
                  GestureDetector(
                    onTap: () => themeProvider.toggleTheme(),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: 52,
                      height: 28,
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.brandOrange : AppColors.borderLight,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Stack(
                        children: [
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeInOut,
                            left: isDark ? 26 : 2,
                            top: 2,
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Icon(
                                isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                                size: 14,
                                color: isDark ? AppColors.brandOrange : AppColors.brandNavy,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: borderColor),
                      boxShadow: [
                        BoxShadow(
                          color: isDark ? Colors.black26 : Colors.black12,
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 38,
                          backgroundColor: AppColors.brandOrange.withValues(alpha: 0.12),
                          child: const Icon(Icons.person_rounded,
                              size: 44, color: AppColors.brandOrange),
                        ),
                        const SizedBox(height: 14),
                        Text(displayName,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: textColor)),
                        if (displayEmail.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(displayEmail,
                              style: TextStyle(fontSize: 13, color: mutedColor)),
                        ],
                        if (displayPhone.isNotEmpty) ...[
                          const SizedBox(height: 2),
                          Text(displayPhone,
                              style: TextStyle(fontSize: 13, color: mutedColor)),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Account',
                      style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: borderColor),
                    ),
                    child: Column(
                      children: [
                        _tile(context,
                            icon: Icons.edit_rounded,
                            title: 'Edit Profile',
                            mutedColor: mutedColor,
                            textColor: textColor,
                            onTap: () => ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(content: Text('Coming soon')))),
                        Divider(height: 1, color: borderColor),
                        _tile(context,
                            icon: Icons.history_rounded,
                            title: 'Service History',
                            mutedColor: mutedColor,
                            textColor: textColor,
                            onTap: () => ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(content: Text('No history yet')))),
                        Divider(height: 1, color: borderColor),
                        _tile(context,
                            icon: Icons.notifications_rounded,
                            title: 'Notifications',
                            mutedColor: mutedColor,
                            textColor: textColor,
                            onTap: () {}),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.red.withValues(alpha: 0.4)),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.logout_rounded, color: Colors.red),
                      title: const Text('Log out',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold)),
                      onTap: () async {
                        await Supabase.instance.client.auth.signOut();
                        if (context.mounted) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) => const LoginPage()),
                              (_) => false);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color textColor,
    required Color mutedColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.brandOrange, size: 22),
      title: Text(title,
          style: TextStyle(color: textColor, fontWeight: FontWeight.w500)),
      trailing: Icon(Icons.arrow_forward_ios_rounded, size: 14, color: mutedColor),
      onTap: onTap,
    );
  }
}
