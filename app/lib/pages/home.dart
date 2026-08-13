import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:truckview_mvp/theme/app_colors.dart';
import 'package:truckview_mvp/widgets/brand_logo.dart';
import 'package:truckview_mvp/widgets/service_card.dart';
import 'package:truckview_mvp/services/supabase_service.dart';
import 'services.dart';
import 'request_service.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SupabaseService _supabaseService = SupabaseService();
  late Future<List<Map<String, dynamic>>> _requestsFuture;

  @override
  void initState() {
    super.initState();
    _fetchRequests();
  }

  void _fetchRequests() {
    setState(() {
      _requestsFuture = _supabaseService.getMyServiceRequests();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final user = Supabase.instance.client.auth.currentUser;
    final firstName = (user?.userMetadata?['full_name'] as String?)?.split(' ').first
        ?? user?.email?.split('@').first
        ?? 'there';
    final hour = DateTime.now().hour;
    final greeting = hour < 12 ? 'Good morning' : hour < 17 ? 'Good afternoon' : 'Good evening';

    final cardColor = isDark ? AppColors.surfaceDark : Colors.white;
    final textColor = isDark ? AppColors.textDark : AppColors.textLight;

    return Scaffold(
      backgroundColor: isDark ? AppColors.pageDark : AppColors.softLight,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            _fetchRequests();
            await _requestsFuture;
          },
          color: AppColors.brandOrange,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Header with logo + greeting
              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
                  boxShadow: [
                    BoxShadow(
                      color: isDark ? Colors.black26 : Colors.black12,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const BrandLogo(size: LogoSize.mini),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$greeting, $firstName',
                            style: TextStyle(
                              fontSize: 13,
                              color: isDark ? AppColors.mutedDark : AppColors.mutedLight,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'What does your vehicle need?',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Quick Action CTA
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RequestService(),
                    ),
                  ).then((_) => _fetchRequests());
                },
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.brandOrange, Color(0xFFFF5A00)],
                    ),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.brandOrange.withValues(alpha: 0.4),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.flash_on, color: Colors.white, size: 30),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Quick Request",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Tap to request a mechanic instantly",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Text(
                'Quick Services',
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.1,
                children: [
                  ServiceCard(
                    title: "Engine Repair",
                    icon: Icons.settings,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ServicesPage()),
                      );
                    },
                  ),
                  ServiceCard(
                    title: "Diagnostics",
                    icon: Icons.car_repair,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const RequestService()),
                      ).then((_) => _fetchRequests());
                    },
                  ),
                  ServiceCard(
                    title: "Towing",
                    icon: Icons.local_shipping,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const RequestService()),
                      ).then((_) => _fetchRequests());
                    },
                  ),
                  ServiceCard(
                    title: "Battery",
                    icon: Icons.battery_charging_full,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const RequestService()),
                      ).then((_) => _fetchRequests());
                    },
                  ),
                ],
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Requests',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.refresh, size: 20, color: isDark ? AppColors.mutedDark : AppColors.mutedLight),
                    onPressed: _fetchRequests,
                    tooltip: 'Refresh',
                  ),
                ],
              ),

              const SizedBox(height: 4),

              FutureBuilder<List<Map<String, dynamic>>>(
                future: _requestsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return const Center(child: Text('Error loading requests'));
                  }

                  final requests = snapshot.data ?? [];

                  if (requests.isEmpty) {
                    return Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
                      ),
                      child: Center(
                        child: Text(
                          "No service requests yet.",
                          style: TextStyle(color: isDark ? AppColors.mutedDark : AppColors.mutedLight),
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: requests.length > 3 ? 3 : requests.length, // Show up to 3
                    itemBuilder: (context, index) {
                      final req = requests[index];
                      final date = DateTime.tryParse(req['created_at'] ?? '');
                      final formattedDate = date != null ? DateFormat.yMMMd().format(date) : 'Unknown Date';
                      final status = (req['status'] as String?)?.toUpperCase() ?? 'PENDING';

                      Color statusColor = AppColors.brandOrange;
                      if (status == 'COMPLETED') statusColor = Colors.green;
                      if (status == 'CANCELLED') statusColor = AppColors.error;

                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
                          boxShadow: [
                            BoxShadow(
                              color: isDark ? Colors.black26 : Colors.black12,
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: statusColor.withValues(alpha: 0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.build_circle, color: statusColor),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    req['service_type'] ?? 'Unknown Service',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: textColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "$status • $formattedDate",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: isDark ? AppColors.mutedDark : AppColors.mutedLight,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios, size: 14, color: isDark ? AppColors.mutedDark : AppColors.mutedLight),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),

              const SizedBox(height: 25),

              // Emergency Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.error,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.error.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.support_agent,
                      size: 45,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Need Immediate Assistance?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Call or request help instantly anytime.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}