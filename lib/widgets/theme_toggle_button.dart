import 'package:flutter/material.dart';

class ThemeToggleSwitch extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onToggle;

  const ThemeToggleSwitch({
    super.key,
    required this.isDarkMode,
    required this.onToggle,
  });

  @override
  State<ThemeToggleSwitch> createState() => _ThemeToggleSwitchState();
}

class _ThemeToggleSwitchState extends State<ThemeToggleSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onToggle(!widget.isDarkMode),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: 100,
        height: 50,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: widget.isDarkMode
              ? const LinearGradient(
                  colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
                )
              : const LinearGradient(
                  colors: [Color(0xFF87CEEB), Color(0xFFE0F7FA)],
                ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 400),
              alignment:
                  widget.isDarkMode ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Image.asset(
                    widget.isDarkMode
                        ? 'assets/moon.jpg'
                        : 'assets/sun.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
