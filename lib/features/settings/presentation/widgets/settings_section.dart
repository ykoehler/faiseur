import 'package:flutter/material.dart';

/// A reusable settings section widget with header and content.
///
/// Provides a consistent visual style for grouping related settings.
/// Features:
/// - Custom header with optional subtitle
/// - Divider support
/// - Flexible content area
class SettingsSection extends StatelessWidget {
  /// Creates a settings section.
  const SettingsSection({
    required this.title,
    required this.children,
    this.subtitle,
    this.showDivider = true,
    super.key,
  });

  /// The section title.
  final String title;

  /// Optional subtitle text below the title.
  final String? subtitle;

  /// Child widgets for the section content.
  final List<Widget> children;

  /// Whether to show a divider below the section.
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Section Header
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ],
          ),
        ),
        // Section Content
        ...children,
        // Optional Divider
        if (showDivider) ...[
          const SizedBox(height: 12),
          Divider(
            height: 1,
            color: isDark
                ? Colors.white.withValues(alpha: 0.12)
                : Colors.black.withValues(alpha: 0.12),
          ),
        ],
      ],
    );
  }
}

/// A single settings tile with icon and toggle switch.
///
/// Displays a setting option with an icon, title, optional subtitle,
/// and a switch for toggling the setting on/off.
class SettingsTile extends StatelessWidget {
  /// Creates a settings tile.
  const SettingsTile({
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
    this.icon,
    this.iconColor,
    super.key,
  });

  /// The setting title.
  final String title;

  /// Optional subtitle text.
  final String? subtitle;

  /// Optional icon widget.
  final IconData? icon;

  /// Optional icon color.
  final Color? iconColor;

  /// Current switch value.
  final bool value;

  /// Callback when switch value changes.
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: icon != null
          ? Icon(icon, color: iconColor ?? theme.colorScheme.primary)
          : null,
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: Switch(value: value, onChanged: onChanged),
    );
  }
}

/// A single settings tile with icon and trailing text (non-switch).
///
/// Displays a setting option with an icon, title, optional subtitle,
/// and custom trailing widget (e.g., dropdown, text, button).
class SettingsTileTrailing extends StatelessWidget {
  /// Creates a settings tile with trailing widget.
  const SettingsTileTrailing({
    required this.title,
    required this.trailing,
    this.subtitle,
    this.icon,
    this.iconColor,
    this.onTap,
    super.key,
  });

  /// The setting title.
  final String title;

  /// Optional subtitle text.
  final String? subtitle;

  /// Optional icon widget.
  final IconData? icon;

  /// Optional icon color.
  final Color? iconColor;

  /// Trailing widget (e.g., Text, Dropdown, Button).
  final Widget trailing;

  /// Optional callback when tile is tapped.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: icon != null
          ? Icon(icon, color: iconColor ?? theme.colorScheme.primary)
          : null,
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: trailing,
      onTap: onTap,
    );
  }
}

/// A button tile for actions (e.g., Sign Out, Reset Settings).
///
/// Displays a prominent action button within the settings structure.
class SettingsActionTile extends StatelessWidget {
  /// Creates a settings action tile.
  const SettingsActionTile({
    required this.label,
    required this.onPressed,
    this.icon,
    this.isDestructive = false,
    super.key,
  });

  /// The button label text.
  final String label;

  /// Optional icon widget.
  final IconData? icon;

  /// Whether this is a destructive action (red color).
  final bool isDestructive;

  /// Callback when button is pressed.
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonColor = isDestructive
        ? theme.colorScheme.error
        : theme.colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: icon != null ? Icon(icon) : null,
          label: Text(label),
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
