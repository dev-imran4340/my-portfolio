import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../services/contact_service.dart';
import '../common/app_button.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _subject = TextEditingController();
  final _message = TextEditingController();
  bool _submitting = false;
  String? _feedback;
  ContactStatus? _status;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _subject.dispose();
    _message.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() {
      _submitting = true;
      _feedback = null;
    });

    final result = await ContactService.instance.send(
      ContactMessage(
        name: _name.text.trim(),
        email: _email.text.trim(),
        subject: _subject.text.trim(),
        message: _message.text.trim(),
      ),
    );

    if (!mounted) return;
    setState(() {
      _submitting = false;
      _status = result.status;
      _feedback = result.message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _Field(
            controller: _name,
            label: 'Name',
            validator: (value) {
              if (value == null || value.trim().length < 2) {
                return 'Enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          _Field(
            controller: _email,
            label: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              final email = value?.trim() ?? '';
              final valid = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email);
              if (!valid) return 'Enter a valid email';
              return null;
            },
          ),
          const SizedBox(height: 12),
          _Field(
            controller: _subject,
            label: 'Subject',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Enter a subject';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          _Field(
            controller: _message,
            label: 'Message',
            maxLines: 6,
            validator: (value) {
              if (value == null || value.trim().length < 10) {
                return 'Message should be at least 10 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 18),
          AppButton(
            label: _submitting ? 'Sending…' : 'Send Message',
            expand: true,
            onPressed: _submitting ? null : _submit,
          ),
          if (_feedback != null) ...[
            const SizedBox(height: 14),
            Text(
              _feedback!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: _status == ContactStatus.success
                        ? AppColors.success
                        : AppColors.textSecondary,
                  ),
            ),
          ],
        ],
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({
    required this.controller,
    required this.label,
    this.validator,
    this.maxLines = 1,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final int maxLines;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      keyboardType: keyboardType,
      style: const TextStyle(color: AppColors.textPrimary),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: AppColors.textSecondary),
        filled: true,
        fillColor: AppColors.secondaryBackground,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.danger),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.danger),
        ),
      ),
    );
  }
}
