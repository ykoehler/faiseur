import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A custom text field that matches the app's design system.
///
/// Provides consistent styling with support for leading/trailing icons,
/// error states, and helper text.
class AppTextField extends StatefulWidget {
  /// Creates an app text field.
  const AppTextField({
    required this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.suffixText,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.counterText,
    this.showCounter = true,
    this.textAlign = TextAlign.start,
    this.validator,
    super.key,
  });

  /// Label text displayed above the input
  final String labelText;

  /// Hint text displayed inside the input
  final String? hintText;

  /// Helper text displayed below the input
  final String? helperText;

  /// Error text displayed below the input
  final String? errorText;

  /// Text editing controller
  final TextEditingController? controller;

  /// Focus node
  final FocusNode? focusNode;

  /// Callback when text changes
  final ValueChanged<String>? onChanged;

  /// Callback when text is submitted
  final ValueChanged<String>? onSubmitted;

  /// Callback when field is tapped
  final VoidCallback? onTap;

  /// Leading icon
  final IconData? prefixIcon;

  /// Trailing icon
  final IconData? suffixIcon;

  /// Prefix text
  final String? prefixText;

  /// Suffix text
  final String? suffixText;

  /// Whether to obscure text (for passwords)
  final bool obscureText;

  /// Whether the field is enabled
  final bool enabled;

  /// Whether the field is read-only
  final bool readOnly;

  /// Keyboard type
  final TextInputType keyboardType;

  /// Text capitalization
  final TextCapitalization textCapitalization;

  /// Input formatters
  final List<TextInputFormatter>? inputFormatters;

  /// Maximum lines
  final int maxLines;

  /// Minimum lines
  final int? minLines;

  /// Maximum length
  final int? maxLength;

  /// Counter text
  final String? counterText;

  /// Whether to show character counter
  final bool showCounter;

  /// Text alignment
  final TextAlign textAlign;

  /// Validator function
  final String? Function(String?)? validator;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode _internalFocusNode;
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    _internalFocusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _internalFocusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasError = widget.errorText != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          focusNode: _internalFocusNode,
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
          onTap: widget.onTap,
          obscureText: widget.obscureText && !_showPassword,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          keyboardType: widget.keyboardType,
          textCapitalization: widget.textCapitalization,
          inputFormatters: widget.inputFormatters,
          maxLines: widget.obscureText ? 1 : widget.maxLines,
          minLines: widget.minLines,
          maxLength: widget.maxLength,
          textAlign: widget.textAlign,
          decoration: InputDecoration(
            labelText: widget.labelText,
            hintText: widget.hintText,
            helperText: widget.helperText,
            errorText: hasError ? widget.errorText : null,
            prefixIcon: widget.prefixIcon != null
                ? Icon(widget.prefixIcon)
                : null,
            prefixText: widget.prefixText,
            suffixIcon: _buildSuffixIcon(),
            suffixText: widget.suffixText,
            counterText: widget.showCounter ? widget.counterText : '',
            errorMaxLines: 2,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: hasError
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.outline,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: hasError
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.suffixIcon == null && !widget.obscureText) {
      return null;
    }

    if (widget.obscureText) {
      return IconButton(
        icon: Icon(_showPassword ? Icons.visibility_off : Icons.visibility),
        onPressed: () {
          setState(() => _showPassword = !_showPassword);
        },
      );
    }

    return Icon(widget.suffixIcon);
  }
}

/// A search text field with clear button.
class AppSearchField extends StatefulWidget {
  /// Creates a search field.
  const AppSearchField({
    required this.onChanged,
    this.hintText = 'Search...',
    this.controller,
    this.onClear,
    super.key,
  });

  /// Callback when text changes
  final ValueChanged<String> onChanged;

  /// Hint text
  final String hintText;

  /// Text controller
  final TextEditingController? controller;

  /// Callback when clear button is pressed
  final VoidCallback? onClear;

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  late TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_updateHasText);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _updateHasText() {
    setState(() => _hasText = _controller.text.isNotEmpty);
  }

  void _clear() {
    _controller.clear();
    widget.onClear?.call();
  }

  @override
  Widget build(BuildContext context) => TextField(
    controller: _controller,
    onChanged: widget.onChanged,
    decoration: InputDecoration(
      hintText: widget.hintText,
      prefixIcon: const Icon(Icons.search),
      suffixIcon: _hasText
          ? IconButton(icon: const Icon(Icons.clear), onPressed: _clear)
          : null,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
  );
}

/// A phone number text field with formatting.
class AppPhoneNumberField extends StatefulWidget {
  /// Creates a phone number field.
  const AppPhoneNumberField({
    required this.onChanged,
    this.labelText = 'Phone Number',
    this.hintText = '+1 (555) 000-0000',
    this.controller,
    super.key,
  });

  /// Callback when phone number changes
  final ValueChanged<String> onChanged;

  /// Label text
  final String labelText;

  /// Hint text
  final String hintText;

  /// Text controller
  final TextEditingController? controller;

  @override
  State<AppPhoneNumberField> createState() => _AppPhoneNumberFieldState();
}

class _AppPhoneNumberFieldState extends State<AppPhoneNumberField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextField(
    controller: _controller,
    keyboardType: TextInputType.phone,
    onChanged: widget.onChanged,
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(10),
    ],
    decoration: InputDecoration(
      labelText: widget.labelText,
      hintText: widget.hintText,
      prefixIcon: const Icon(Icons.phone),
      prefixText: '+1 ',
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
}

/// A multi-line text field for longer content.
class AppTextAreaField extends StatelessWidget {
  /// Creates a text area field.
  const AppTextAreaField({
    required this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.controller,
    this.onChanged,
    this.maxLines = 5,
    this.minLines = 3,
    this.maxLength = 500,
    this.showCounter = true,
    super.key,
  });

  /// Label text
  final String labelText;

  /// Hint text
  final String? hintText;

  /// Helper text
  final String? helperText;

  /// Error text
  final String? errorText;

  /// Text controller
  final TextEditingController? controller;

  /// Callback when text changes
  final ValueChanged<String>? onChanged;

  /// Maximum number of lines
  final int maxLines;

  /// Minimum number of lines
  final int minLines;

  /// Maximum length
  final int maxLength;

  /// Whether to show character counter
  final bool showCounter;

  @override
  Widget build(BuildContext context) => AppTextField(
    labelText: labelText,
    hintText: hintText,
    helperText: helperText,
    errorText: errorText,
    controller: controller,
    onChanged: onChanged,
    maxLines: maxLines,
    minLines: minLines,
    maxLength: maxLength,
    showCounter: showCounter,
    keyboardType: TextInputType.multiline,
    textCapitalization: TextCapitalization.sentences,
  );
}
