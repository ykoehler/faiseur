import 'package:flutter/material.dart';

/// About page displaying app information, version, and links.
///
/// Features:
/// - App icon and branding
/// - Version and build information
/// - Links to resources (GitHub, Privacy Policy, etc.)
/// - Open source licenses
/// - Contact/support information
class AboutPage extends StatelessWidget {
  /// Creates an about page.
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('About'), elevation: 0),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          // App Header Section
          Center(
            child: Column(
              children: [
                // App Icon
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  ),
                  child: Icon(Icons.check_circle, size: 64, color: theme.colorScheme.primary),
                ),
                const SizedBox(height: 16),
                // App Name
                Text('Faiseur', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                // Version Info
                Text(
                  'Version 0.1.0 (Beta)',
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
                Text(
                  'Build 1 • Released Oct 19, 2025',
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Description Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Faiseur is a collaborative todo list app that helps families and teams manage tasks together with gamification and real-time synchronization.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 24),

          // Divider
          Divider(
            indent: 16,
            endIndent: 16,
            color: isDark ? Colors.white.withValues(alpha: 0.12) : Colors.black.withValues(alpha: 0.12),
          ),
          const SizedBox(height: 16),

          // Links Section
          _buildLinkTile(
            context: context,
            icon: Icons.code,
            title: 'GitHub Repository',
            subtitle: 'View source code and contribute',
            onTap: () {
              // TODO: Open GitHub link
              _showComingSoon(context);
            },
          ),
          _buildLinkTile(
            context: context,
            icon: Icons.privacy_tip,
            title: 'Privacy Policy',
            subtitle: 'How we handle your data',
            onTap: () {
              // TODO: Open privacy policy
              _showComingSoon(context);
            },
          ),
          _buildLinkTile(
            context: context,
            icon: Icons.description,
            title: 'Terms of Service',
            subtitle: 'Our terms and conditions',
            onTap: () {
              // TODO: Open terms of service
              _showComingSoon(context);
            },
          ),
          _buildLinkTile(
            context: context,
            icon: Icons.history,
            title: 'Changelog',
            subtitle: 'What\' new in this version',
            onTap: () {
              _showChangelog(context, theme);
            },
          ),
          _buildLinkTile(
            context: context,
            icon: Icons.help,
            title: 'Help & Support',
            subtitle: 'Get help or contact us',
            onTap: () {
              // TODO: Open support page
              _showComingSoon(context);
            },
          ),
          _buildLinkTile(
            context: context,
            icon: Icons.info,
            title: 'Open Source Licenses',
            subtitle: 'Third-party library licenses',
            onTap: () {
              showLicensePage(context: context, applicationName: 'Faiseur', applicationVersion: '0.1.0');
            },
          ),

          const SizedBox(height: 24),

          // Divider
          Divider(
            indent: 16,
            endIndent: 16,
            color: isDark ? Colors.white.withValues(alpha: 0.12) : Colors.black.withValues(alpha: 0.12),
          ),
          const SizedBox(height: 16),

          // Footer
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: theme.textTheme.bodySmall,
                      children: [
                        const TextSpan(text: 'Made with '),
                        TextSpan(text: '❤️', style: theme.textTheme.bodySmall?.copyWith(fontSize: 14)),
                        const TextSpan(text: ' by the Faiseur team'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a link tile for About page.
  Widget _buildLinkTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) => ListTile(
    leading: Icon(icon),
    title: Text(title),
    subtitle: Text(subtitle),
    trailing: const Icon(Icons.arrow_forward),
    onTap: onTap,
  );

  /// Shows a "Coming Soon" snackbar.
  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('This feature is coming soon!'), duration: Duration(seconds: 2)));
  }

  /// Shows the changelog dialog.
  void _showChangelog(BuildContext context, ThemeData theme) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Changelog'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildChangelogVersion(
                theme: theme,
                version: '0.1.0 - October 19, 2025',
                changes: const [
                  'Initial beta release',
                  'User authentication (email/password)',
                  'Create and manage todo lists',
                  'Add, edit, and delete todos',
                  'Real-time synchronization',
                  'Dark mode support',
                  'Settings and preferences',
                  'About page and changelog',
                ],
              ),
            ],
          ),
        ),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))],
      ),
    );
  }

  /// Builds a changelog version section.
  Widget _buildChangelogVersion({required ThemeData theme, required String version, required List<String> changes}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(version, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...changes.map(
            (change) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• ', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.primary)),
                  Expanded(child: Text(change, style: theme.textTheme.bodyMedium)),
                ],
              ),
            ),
          ),
        ],
      );
}
