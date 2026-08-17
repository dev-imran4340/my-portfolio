import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/motion.dart';

/// Types text character-by-character with a blinking caret.
class TypewriterText extends StatefulWidget {
  const TypewriterText({
    super.key,
    required this.text,
    required this.style,
    this.highlight,
    this.highlightStyle,
    this.charDuration = const Duration(milliseconds: 26),
    this.startDelay = Duration.zero,
    this.onComplete,
  });

  final String text;
  final TextStyle? style;
  final String? highlight;
  final TextStyle? highlightStyle;
  final Duration charDuration;
  final Duration startDelay;
  final VoidCallback? onComplete;

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _caret;
  String _visible = '';
  bool _done = false;
  bool _started = false;
  Timer? _startTimer;
  Timer? _typeTimer;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _caret = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 520),
    )..repeat(reverse: true);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_started) {
      _started = true;
      _run();
    }
  }

  void _run() {
    if (Motion.reduced(context)) {
      _caret.stop();
      setState(() {
        _visible = widget.text;
        _done = true;
      });
      widget.onComplete?.call();
      return;
    }

    void startTyping() {
      _typeTimer = Timer.periodic(widget.charDuration, (timer) {
        if (!mounted) {
          timer.cancel();
          return;
        }
        _index++;
        if (_index > widget.text.length) {
          timer.cancel();
          _caret.stop();
          _caret.value = 1;
          setState(() => _done = true);
          widget.onComplete?.call();
          return;
        }
        setState(() => _visible = widget.text.substring(0, _index));
      });
    }

    if (widget.startDelay > Duration.zero) {
      _startTimer = Timer(widget.startDelay, startTyping);
    } else {
      startTyping();
    }
  }

  @override
  void deactivate() {
    _caret.stop();
    super.deactivate();
  }

  @override
  void dispose() {
    _startTimer?.cancel();
    _typeTimer?.cancel();
    _caret.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final highlight = widget.highlight;
    final showCaret = !_done || _caret.value > 0.45;

    Widget body;
    if (highlight != null &&
        highlight.isNotEmpty &&
        _visible.contains(highlight)) {
      final start = _visible.indexOf(highlight);
      final end = start + highlight.length;
      body = Text.rich(
        TextSpan(
          style: widget.style,
          children: [
            TextSpan(text: _visible.substring(0, start)),
            TextSpan(
              text: _visible.substring(start, end),
              style: widget.highlightStyle ??
                  widget.style?.copyWith(color: const Color(0xFF6C63FF)),
            ),
            TextSpan(text: _visible.substring(end)),
          ],
        ),
      );
    } else {
      body = Text(_visible, style: widget.style);
    }

    return AnimatedBuilder(
      animation: _caret,
      builder: (context, _) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(child: body),
            if (!_done)
              Padding(
                padding: const EdgeInsets.only(left: 3, top: 2),
                child: Opacity(
                  opacity: showCaret ? 1 : 0,
                  child: Container(
                    width: 2.5,
                    height: (widget.style?.fontSize ?? 24) * 0.85,
                    decoration: BoxDecoration(
                      color: widget.highlightStyle?.color ??
                          const Color(0xFF6C63FF),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
