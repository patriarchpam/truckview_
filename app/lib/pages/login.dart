import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:truckview_mvp/theme/app_colors.dart';
import 'package:truckview_mvp/pages/register.dart';
import 'package:truckview_mvp/pages/forgot_password.dart';
import 'package:truckview_mvp/pages/main_screen.dart';
import 'package:truckview_mvp/widgets/brand_logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _hidePassword = true;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      await Supabase.instance.client.auth.signInWithPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainScreen()),
        );
      }
    } on AuthException catch (e) {
      setState(() => _errorMessage = e.message);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          child: Column(
            children: [
              const BrandLogo(),
              const SizedBox(height: 28),
              Text(
                'Welcome back',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDark ? AppColors.textDark : AppColors.textLight,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Sign in to manage your vehicle care.',
                style: TextStyle(
                  fontSize: 14,
                  color: isDark ? AppColors.mutedDark : AppColors.mutedLight,
                ),
              ),
              const SizedBox(height: 32),

              if (_errorMessage != null) ...[
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.error.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.error.withOpacity(0.3)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.error_outline, color: AppColors.error, size: 18),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _errorMessage!,
                          style: const TextStyle(color: AppColors.error, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],

              // Email field
              _buildLabel('Email address', isDark),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _emailController,
                hint: 'you@example.com',
                icon: Icons.mail_outline,
                keyboardType: TextInputType.emailAddress,
                isDark: isDark,
              ),
              const SizedBox(height: 20),

              // Password field
              _buildLabel('Password', isDark),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _passwordController,
                hint: 'Enter your password',
                icon: Icons.lock_outline,
                obscureText: _hidePassword,
                isDark: isDark,
                suffix: IconButton(
                  icon: Icon(
                    _hidePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: isDark ? AppColors.mutedDark : AppColors.mutedLight,
                    size: 20,
                  ),
                  onPressed: () => setState(() => _hidePassword = !_hidePassword),
                ),
              ),

              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ForgotPasswordPage()),
                  ),
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: AppColors.brandOrange,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _login,
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        )
                      : const Text(
                          'Login',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                ),
              ),

              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New to TruckView? ',
                    style: TextStyle(
                      color: isDark ? AppColors.mutedDark : AppColors.mutedLight,
                      fontSize: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => RegisterPage()),
                    ),
                    child: const Text(
                      'Create account',
                      style: TextStyle(
                        color: AppColors.brandOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text, bool isDark) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.textDark : AppColors.textLight,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    required bool isDark,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    Widget? suffix,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(
        color: isDark ? AppColors.textDark : AppColors.textLight,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: isDark ? AppColors.mutedDark : AppColors.mutedLight,
          fontSize: 14,
        ),
        prefixIcon: Icon(
          icon,
          color: isDark ? AppColors.mutedDark : AppColors.mutedLight,
          size: 20,
        ),
        suffixIcon: suffix,
      ),
    );
  }
}