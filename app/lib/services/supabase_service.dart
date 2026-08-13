import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient _client = Supabase.instance.client;

  // Get current user ID
  String? get currentUserId => _client.auth.currentUser?.id;

  // Get current user profile data
  Future<Map<String, dynamic>?> getUserProfile() async {
    final userId = currentUserId;
    if (userId == null) return null;

    try {
      final response = await _client
          .from('profiles')
          .select()
          .eq('id', userId)
          .maybeSingle();
      return response;
    } catch (e) {
      print('Error fetching profile: $e');
      return null;
    }
  }

  // Update user profile
  Future<bool> updateProfile({
    String? fullName,
    String? phone,
  }) async {
    final userId = currentUserId;
    if (userId == null) return false;

    try {
      final updates = {
        if (fullName != null) 'full_name': fullName,
        if (phone != null) 'phone': phone,
        'updated_at': DateTime.now().toIso8601String(),
      };

      await _client.from('profiles').update(updates).eq('id', userId);
      
      // Also update auth metadata so it stays in sync
      await _client.auth.updateUser(
        UserAttributes(
          data: {
            if (fullName != null) 'full_name': fullName,
            if (phone != null) 'phone': phone,
          },
        ),
      );
      
      return true;
    } catch (e) {
      print('Error updating profile: $e');
      return false;
    }
  }

  // Create a new service request
  Future<bool> createServiceRequest({
    required String serviceType,
    String? description,
    String? address,
    double? lat,
    double? lng,
  }) async {
    final userId = currentUserId;
    if (userId == null) return false;

    try {
      await _client.from('service_requests').insert({
        'user_id': userId,
        'service_type': serviceType,
        'description': description,
        'address': address,
        'location_lat': lat,
        'location_lng': lng,
        'status': 'pending',
      });
      return true;
    } catch (e) {
      print('Error creating service request: $e');
      return false;
    }
  }

  // Get service requests for the current user
  Future<List<Map<String, dynamic>>> getMyServiceRequests() async {
    final userId = currentUserId;
    if (userId == null) return [];

    try {
      final response = await _client
          .from('service_requests')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      print('Error fetching service requests: $e');
      return [];
    }
  }
}
