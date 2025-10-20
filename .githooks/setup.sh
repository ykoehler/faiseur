#!/bin/bash
# Setup Git Hooks for Faiseur Development
#
# This script configures git to use the .githooks directory for pre-commit checks.
# Run this once after cloning the repository.
#
# Usage: bash .githooks/setup.sh

set -e

echo "🔧 Setting up Git hooks for Faiseur..."
echo ""

# Check if .git directory exists
if [ ! -d ".git" ]; then
  echo "❌ Error: Not in a git repository root"
  echo "   Please run this script from the project root"
  exit 1
fi

# Configure git to use .githooks directory
echo "📁 Configuring git.hooksPath..."
git config core.hooksPath .githooks

if [ $? -eq 0 ]; then
  echo "✅ Git configured to use .githooks/"
else
  echo "❌ Failed to configure git"
  exit 1
fi

echo ""
echo "🔍 Verifying hook setup..."

# Check if pre-commit hook is executable
if [ -x .githooks/pre-commit ]; then
  echo "✅ pre-commit hook is executable"
else
  echo "⚠️  Making pre-commit hook executable..."
  chmod +x .githooks/pre-commit
fi

echo ""
echo "✨ Git hooks setup complete!"
echo ""
echo "📝 Next steps:"
echo "   1. Your pre-commit hook will run before each commit"
echo "   2. To skip checks (not recommended): git commit --no-verify"
echo "   3. To manually run checks:"
echo "      • flutter analyze"
echo "      • flutter test"
echo "      • dart format lib/ test/ integration_test/"
echo ""
echo "🎯 Hook checks:"
echo "   • flutter format (code style)"
echo "   • flutter analyze (linting)"
echo "   • flutter test (unit tests)"
echo ""
