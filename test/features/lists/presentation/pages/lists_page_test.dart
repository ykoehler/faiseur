import 'package:faiseur/features/lists/presentation/pages/lists_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ListsPage Widget Tests', () {
    testWidgets('ListsPage renders without errors', (tester) async {
      await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: ListsPage())));

      // Wait for initial render
      await tester.pumpAndSettle();

      // Verify the page rendered
      expect(find.byType(ListsPage), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('ListsPage has AppBar', (tester) async {
      await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: ListsPage())));

      await tester.pumpAndSettle();

      // Check for AppBar
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('ListsPage has FAB for creating lists', (tester) async {
      await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: ListsPage())));

      await tester.pumpAndSettle();

      // Check for FloatingActionButton
      expect(find.byType(FloatingActionButton), findsWidgets);
    });

    testWidgets('ListsPage shows Scaffold', (tester) async {
      await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: ListsPage())));

      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('ListsPage renders with proper layout structure', (tester) async {
      await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: ListsPage())));

      await tester.pumpAndSettle();

      // Verify no layout errors
      expect(tester.takeException(), isNull);

      // Verify Scaffold is present (main layout structure)
      expect(find.byType(Scaffold), findsOneWidget);
    });
  });
}
