import 'package:dash_drop_dashboard/pages/auth/presentation/controller/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dashdrop_uikit/components/buttons/button_widget.dart';
import 'package:dashdrop_uikit/components/card/common_card.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../components/tost.dart';
import '../../../../core/utils/enums.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.loginState == RequestState.loaded) {
          // --- ADMIN CHECK LOGIC ---
          // TODO: Replace with real check: if (state.user.role == 'admin')
          bool isAdmin = true;

          if (isAdmin) {
            Tost().success(context, "Login success");
            Navigator.popAndPushNamed(context, '/');
          } else {
            Tost().error(context, "Access Denied: Invalid Permissions.");
          }
        } else if (state.loginState == RequestState.error) {
          Tost().error(context, state.loginMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF12423C), Color(0xFF0E322D)],
              ),
            ),
            child: ResponsiveBuilder(
              builder: (context, sizingInformation) {
                if (sizingInformation.deviceScreenType ==
                    DeviceScreenType.desktop) {
                  return Center(
                    child: contentDesktopWidget(context),
                  );
                }
                return Center(child: contentMobileWidget(context));
              },
            ),
          ),
        );
      },
    );
  }

  Widget contentDesktopWidget(BuildContext context) {
    return CommonCard(
      width: 900,
      height: 650,
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          // Left Side: Branding
          Expanded(
            flex: 4,
            child: Container(
              color: const Color(0xFF12423C).withOpacity(0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/logo.ai.svg',
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Drug Enforcement Department',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF12423C),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Ministry of Interior',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Right Side: Login Form
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: _signInFormWidget(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget contentMobileWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CommonCard(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/images/logo.svg',
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 25),
              const Text(
                'Drug Enforcement Department',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF12423C),
                ),
              ),
              const SizedBox(height: 40),
              _signInFormWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInFormWidget(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sign In",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "Please enter your credentials to proceed.",
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          const SizedBox(height: 40),

          // --- REPLACED CUSTOM WIDGET WITH STANDARD TEXTFORMFIELD ---
          _buildStandardInput(
            label: "User ID",
            hint: "Enter your user ID",
            controller: userIdController,
            inputType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your User ID';
              }
              // Check if it's a number
              // if (int.tryParse(value) == null) {
              //   return 'User ID must be a valid number';
              // }
              return null;
            },
          ),

          const SizedBox(height: 25),

          _buildStandardInput(
            label: "Password",
            hint: "Enter your password",
            controller: passwordController,
            inputType: TextInputType.visiblePassword,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 6) {
                return 'Please enter a valid password';
              }
              return null;
            },
          ),

          const SizedBox(height: 40),

          ButtonWidget(
            type: ButtonType.primary.type,
            btnText: "Login",
            onTap: () {
              if (_formKey.currentState!.validate()) {
                try {
                  context.read<AuthBloc>().add(LoginEvent(
                      userID: userIdController.text.trim(),
                      password: passwordController.text.trim()));
                } catch (e) {
                  print(e);
                  Tost().error(context, "An unexpected error occurred");
                }
              }
            },
          ),

          const SizedBox(height: 30),

          Center(
            child: Text(
              "© 2026 Ministry of Interior",
              style: TextStyle(color: Colors.grey[400], fontSize: 12),
            ),
          )
        ],
      ),
    );
  }

  // --- HELPER FOR STANDARD STYLED INPUT ---
  Widget _buildStandardInput({
    required String label,
    required String hint,
    required TextEditingController controller,
    TextInputType inputType = TextInputType.text,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: inputType,
          validator: validator,
          cursorColor: const Color(0xFF12423C), // Matches theme color
          style: const TextStyle(fontSize: 16),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
            filled: true,
            fillColor: Colors.grey[50], // Very light grey background
            // FIX: contentPadding handles the height and spacing inside the box
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(color: Color(0xFF12423C), width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
          ),
        ),
      ],
    );
  }
}
