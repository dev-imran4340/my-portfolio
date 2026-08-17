import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../core/utils/motion.dart';

enum AppButtonVariant { primary, outline, ghost }

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.icon,
    this.expand = false,
    this.tooltip,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final IconData? icon;
  final bool expand;
  final String? tooltip;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onPressed != null;
    final background = switch (widget.variant) {
      AppButtonVariant.primary =>
        _hover ? const Color(0xFF7B74FF) : AppColors.primary,
      AppButtonVariant.outline =>
        _hover ? AppColors.card : Colors.transparent,
      AppButtonVariant.ghost =>
        _hover ? AppColors.card : Colors.transparent,
    };
    final border = switch (widget.variant) {
      AppButtonVariant.primary => Border.all(color: Colors.transparent),
      AppButtonVariant.outline => Border.all(color: AppColors.borderStrong),
      AppButtonVariant.ghost => Border.all(color: Colors.transparent),
    };
    final foreground = widget.variant == AppButtonVariant.ghost
        ? AppColors.textPrimary
        : AppColors.textPrimary;

    final button = FocusableActionDetector(
      mouseCursor: enabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onShowHoverHighlight: (value) => setState(() => _hover = value),
      child: AnimatedContainer(
        duration: Motion.of(context, const Duration(milliseconds: 180)),
        transform: Matrix4.translationValues(0, _hover && enabled ? -1.5 : 0, 0),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(12),
          border: border,
          boxShadow: widget.variant == AppButtonVariant.primary && enabled
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: _hover ? 0.32 : 0.18),
                    blurRadius: 22,
                    offset: const Offset(0, 10),
                  ),
                ]
              : null,
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
              child: Row(
                mainAxisSize: widget.expand ? MainAxisSize.max : MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.label,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: foreground,
                          fontSize: 14,
                        ),
                  ),
                  if (widget.icon != null) ...[
                    const SizedBox(width: 8),
                    Icon(widget.icon, size: 16, color: foreground),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );

    final sized = widget.expand ? SizedBox(width: double.infinity, child: button) : button;
    if (widget.tooltip == null) return sized;
    return Tooltip(message: widget.tooltip!, child: sized);
  }
}

class IconActionButton extends StatelessWidget {
  const IconActionButton({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: Ink(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.border),
              color: AppColors.card.withValues(alpha: 0.6),
            ),
            child: Icon(icon, size: 16, color: AppColors.textPrimary),
          ),
        ),
      ),
    );
  }
}
