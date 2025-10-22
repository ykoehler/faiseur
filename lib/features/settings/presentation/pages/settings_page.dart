import 'package:faiseur/features/auth/presentation/providers/auth_providers.dart';
import 'package:faiseur/features/settings/presentation/providers/settings_providers.dart';
import 'package:faiseur/features/settings/presentation/widgets/settings_section.dart';
import 'package:faiseur/shared/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Settings page widget for user preferences and app configuration.
///
/// Displays settings organized into sections:
/// - Account information and profile
/// - Theme preferences (light/dark mode)
/// - Notification settings
/// - About and help
class SettingsPage extends ConsumerWidget {
  /// Creates a settings page.
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsync = ref.watch(userSettingsProvider);
    final authAsync = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), elevation: 0),
      body: settingsAsync.when(
        data: (settings) => ListView(
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: [
            // Account Section
            SettingsSection(
              title: 'Account',
              subtitle: 'Manage your profile and account',
              children: [
                authAsync.when(
                  data: (user) => ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Email'),
                    subtitle: Text(user?.email ?? 'Not available'),
                  ),
                  loading: () => const ListTile(title: Text('Email'), subtitle: Text('Loading...')),
                  error: (error, st) => const ListTile(title: Text('Email'), subtitle: Text('Error loading email')),
                ),
                const ListTile(leading: Icon(Icons.info), title: Text('Account Status'), subtitle: Text('Active')),
              ],
            ),

            // Appearance Section
            SettingsSection(
              title: 'Appearance',
              subtitle: 'Customize the look and feel',
              children: [
                SettingsTileTrailing(
                  title: 'Theme',
                  subtitle: 'Light, Dark, or System',
                  icon: Icons.palette,
                  trailing: _ThemeDropdown(currentTheme: settings.themeMode),
                ),
                if (settings.themeMode != 'system')
                  SettingsTile(
                    title: 'Dark Mode',
                    subtitle: 'Use system dark mode setting',
                    icon: Icons.dark_mode,
                    value: settings.darkMode,
                    onChanged: (value) {
                      // Theme toggle handled in app-level provider
                    },
                  ),
              ],
            ),

            // Notification Section
            SettingsSection(
              title: 'Notifications',
              subtitle: 'Control how you receive updates',
              children: [
                SettingsTile(
                  title: 'Enable Notifications',
                  subtitle: 'Receive app notifications',
                  icon: Icons.notifications,
                  value: settings.notificationsEnabled,
                  onChanged: (value) {
                    ref.read(settingsProvider.notifier).updateNotifications(enabled: value);
                  },
                ),
                if (settings.notificationsEnabled)
                  SettingsTile(
                    title: 'Email Notifications',
                    subtitle: 'Receive email updates',
                    icon: Icons.email,
                    value: settings.emailNotificationsEnabled,
                    onChanged: (value) {
                      ref.read(settingsProvider.notifier).updateEmailNotifications(enabled: value);
                    },
                  ),
              ],
            ),

            // View Preferences Section
            SettingsSection(
              title: 'View Preferences',
              subtitle: 'Choose your default list view',
              children: [
                SettingsTileTrailing(
                  title: 'Default View',
                  subtitle: 'List, Kanban, or Card view',
                  icon: Icons.view_agenda,
                  trailing: _ViewModeDropdown(currentViewMode: settings.defaultViewMode),
                ),
              ],
            ),

            // About Section
            SettingsSection(
              title: 'About',
              children: [
                ListTile(
                  leading: const Icon(Icons.help),
                  title: const Text('About App'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    // TODO: Navigate to about page
                  },
                ),
                const ListTile(leading: Icon(Icons.code), title: Text('Version'), subtitle: Text('0.1.0 (Beta)')),
              ],
            ),

            // Danger Zone Section
            SettingsSection(
              title: 'Account Actions',
              children: [
                SettingsActionTile(
                  label: 'Sign Out',
                  icon: Icons.logout,
                  onPressed: () {
                    _showSignOutDialog(context, ref);
                  },
                ),
              ],
            ),

            const SizedBox(height: 24),
          ],
        ),
        loading: () => const Center(child: AppLoadingIndicator()),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error loading settings: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.invalidate(userSettingsProvider);
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Shows a confirmation dialog for signing out.
  void _showSignOutDialog(BuildContext context, WidgetRef ref) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Out?'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(authProvider.notifier).signOut();
            },
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}

/// Theme mode dropdown selector.
class _ThemeDropdown extends ConsumerWidget {
  /// Creates a theme dropdown.
  const _ThemeDropdown({required this.currentTheme});

  /// Current theme mode.
  final String currentTheme;

  @override
  Widget build(BuildContext context, WidgetRef ref) => DropdownButton<String>(
    value: currentTheme,
    underline: const SizedBox(),
    onChanged: (newValue) {
      if (newValue != null) {
        ref.read(settingsProvider.notifier).updateTheme(newValue);
      }
    },
    items: const [
      DropdownMenuItem(value: 'light', child: Text('Light')),
      DropdownMenuItem(value: 'dark', child: Text('Dark')),
      DropdownMenuItem(value: 'system', child: Text('System')),
    ],
  );
}

/// View mode dropdown selector.
class _ViewModeDropdown extends ConsumerWidget {
  /// Creates a view mode dropdown.
  const _ViewModeDropdown({required this.currentViewMode});

  /// Current view mode.
  final String currentViewMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) => DropdownButton<String>(
    value: currentViewMode,
    underline: const SizedBox(),
    onChanged: (newValue) {
      if (newValue != null) {
        ref.read(settingsProvider.notifier).updateViewMode(newValue);
      }
    },
    items: const [
      DropdownMenuItem(value: 'list', child: Text('List')),
      DropdownMenuItem(value: 'kanban', child: Text('Kanban')),
      DropdownMenuItem(value: 'card', child: Text('Card')),
    ],
  );
}
