import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:truckview_mvp/theme/app_colors.dart';
import 'package:truckview_mvp/widgets/brand_logo.dart';
import 'login.dart';
import 'main_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  bool _hidePassword = true;
  bool _hideConfirm = true;
  bool _isLoading = false;
  String? _error;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    final name = _nameCtrl.text.trim();
    final email = _emailCtrl.text.trim();
    final phone = _phoneCtrl.text.trim();
    final password = _passwordCtrl.text;
    final confirm = _confirmCtrl.text;

    if (name.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty || confirm.isEmpty) {
      setState(() => _error = 'Please fill in all fields.');
      return;
    }
    if (!RegExp(r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$').hasMatch(email)) {
      setState(() => _error = 'Enter a valid email address.');
      return;
    }
    if (phone.length < 10) {
      setState(() => _error = 'Enter a valid phone number.');
      return;
    }
    if (password.length < 6) {
      setState(() => _error = 'Password must be at least 6 characters.');
      return;
    }
    if (password != confirm) {
      setState(() => _error = 'Passwords do not match.');
      return;
    }

    setState(() { _isLoading = true; _error = null; });
    try {
      await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
        data: {'full_name': name, 'phone': phone},
      );
      if (mounted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const MainScreen()));
      }
    } on AuthException catch (e) {
      setState(() => _error = e.message);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? AppColors.pageDark : Colors.white;
    final textColor = isDark ? AppColors.textDark : AppColors.textLight;
    final mutedColor = isDark ? AppColors.mutedDark : AppColors.mutedLight;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const BrandLogo(size: LogoSize.mini),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Create Account',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: textColor)),
                      Text('Join TruckView today',
                          style: TextStyle(fontSize: 13, color: mutedColor)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),

              if (_error != null) ...[
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: AppColors.error.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
                  ),
                  child: Row(children: [
                    const Icon(Icons.error_outline, color: AppColors.error, size: 18),
                    const SizedBox(width: 8),
                    Expanded(child: Text(_error!,
                        style: const TextStyle(color: AppColors.error, fontSize: 13))),
                  ]),
                ),
              ],

              _label('Full Name', textColor),
              const SizedBox(height: 8),
              _field(
                controller: _nameCtrl,
                hint: 'John Doe',
                icon: Icons.person_outline_rounded,
                isDark: isDark,
                mutedColor: mutedColor,
              ),
              const SizedBox(height: 20),

              _label('Email Address', textColor),
              const SizedBox(height: 8),
              _field(
                controller: _emailCtrl,
                hint: 'you@example.com',
                icon: Icons.mail_outline_rounded,
                keyboardType: TextInputType.emailAddress,
                isDark: isDark,
                mutedColor: mutedColor,
              ),
              const SizedBox(height: 20),

              _label('Phone Number', textColor),
              const SizedBox(height: 8),
              _field(
                controller: _phoneCtrl,
                hint: '08012345678',
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                isDark: isDark,
                mutedColor: mutedColor,
              ),
              const SizedBox(height: 20),

              _label('Password', textColor),
              const SizedBox(height: 8),
              _field(
                controller: _passwordCtrl,
                hint: 'At least 6 characters',
                icon: Icons.lock_outline_rounded,
                obscureText: _hidePassword,
                isDark: isDark,
                mutedColor: mutedColor,
                suffix: IconButton(
                  icon: Icon(
                    _hidePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    size: 20,
                    color: mutedColor,
                  ),
                  onPressed: () => setState(() => _hidePassword = !_hidePassword),
                ),
              ),
              const SizedBox(height: 20),

              _label('Confirm Password', textColor),
              const SizedBox(height: 8),
              _field(
                controller: _confirmCtrl,
                hint: 'Repeat your password',
                icon: Icons.lock_outline_rounded,
                obscureText: _hideConfirm,
                isDark: isDark,
                mutedColor: mutedColor,
                suffix: IconButton(
                  icon: Icon(
                    _hideConfirm ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    size: 20,
                    color: mutedColor,
                  ),
                  onPressed: () => setState(() => _hideConfirm = !_hideConfirm),
                ),
              ),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _register,
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                              color: Colors.white, strokeWidth: 2))
                      : const Text('Create Account',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? ',
                      style: TextStyle(color: mutedColor, fontSize: 14)),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const LoginPage())),
                    child: const Text(
                      'Sign in',
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

  Widget _label(String text, Color color) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(text,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: color)),
    );
  }

  Widget _field({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    required bool isDark,
    required Color mutedColor,
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
        hintStyle: TextStyle(color: mutedColor, fontSize: 14),
        prefixIcon: Icon(icon, color: mutedColor, size: 20),
        suffixIcon: suffix,
      ),
    );
  }
}