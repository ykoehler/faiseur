#!/bin/bash

# macOS E2E Test Runner
# Quick script to run macOS end-to-end tests with proper configuration

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
FLAVOR="dev"
TEST_NAME=""
VERBOSE=""

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --staging)
      FLAVOR="staging"
      shift
      ;;
    --production)
      FLAVOR="production"
      shift
      ;;
    --test-name)
      TEST_NAME="$2"
      shift 2
      ;;
    --verbose)
      VERBOSE="--verbose"
      shift
      ;;
    --help)
      echo "Usage: ./run_macos_e2e.sh [OPTIONS]"
      echo ""
      echo "Options:"
      echo "  --staging          Run with staging environment"
      echo "  --production       Run with production environment"
      echo "  --test-name NAME   Run only tests matching NAME"
      echo "  --verbose          Enable verbose output"
      echo "  --help             Show this help message"
      echo ""
      echo "Examples:"
      echo "  ./run_macos_e2e.sh                           # Run all tests with dev env"
      echo "  ./run_macos_e2e.sh --staging                 # Run with staging env"
      echo "  ./run_macos_e2e.sh --test-name \"Splash\"      # Run splash tests only"
      echo "  ./run_macos_e2e.sh --verbose                 # Run with verbose output"
      echo "  ./run_macos_e2e.sh --test-name \"Debug Info\" # Collect debug info"
      exit 0
      ;;
    *)
      echo -e "${RED}Unknown option: $1${NC}"
      echo "Use --help for usage information"
      exit 1
      ;;
  esac
done

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  macOS E2E Test Runner${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo -e "${RED}Error: Flutter is not installed or not in PATH${NC}"
    exit 1
fi

# Check if macOS device is available
if ! flutter devices | grep -q "macOS"; then
    echo -e "${RED}Error: macOS device not available${NC}"
    echo "Run 'flutter devices' to see available devices"
    exit 1
fi

echo -e "${GREEN}✓ Flutter found: $(flutter --version | head -n 1)${NC}"
echo -e "${GREEN}✓ macOS device available${NC}"
echo ""

# Build command
CMD="flutter test integration_test/macos_e2e_test.dart"
CMD="$CMD --dart-define=FLAVOR=$FLAVOR"
CMD="$CMD -d macos"

if [ -n "$TEST_NAME" ]; then
    CMD="$CMD --name=\"$TEST_NAME\""
fi

if [ -n "$VERBOSE" ]; then
    CMD="$CMD $VERBOSE"
fi

echo -e "${YELLOW}Configuration:${NC}"
echo "  Environment: $FLAVOR"
if [ -n "$TEST_NAME" ]; then
    echo "  Test Filter: $TEST_NAME"
else
    echo "  Test Filter: All tests"
fi
echo "  Verbose: ${VERBOSE:-No}"
echo ""

echo -e "${YELLOW}Running command:${NC}"
echo "  $CMD"
echo ""

# Run the tests
echo -e "${BLUE}Starting tests...${NC}"
echo ""

eval $CMD

# Check exit code
if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}  ✓ All tests passed!${NC}"
    echo -e "${GREEN}========================================${NC}"
    exit 0
else
    echo ""
    echo -e "${RED}========================================${NC}"
    echo -e "${RED}  ✗ Tests failed!${NC}"
    echo -e "${RED}========================================${NC}"
    echo ""
    echo -e "${YELLOW}Troubleshooting:${NC}"
    echo "  1. Check debug output above for errors"
    echo "  2. Run with --verbose for more details"
    echo "  3. Run debug info test: ./run_macos_e2e.sh --test-name \"Debug Info\""
    echo "  4. See integration_test/MACOS_E2E_TESTS.md for help"
    exit 1
fi
