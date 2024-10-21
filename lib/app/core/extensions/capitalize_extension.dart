extension CapitalizeExt on String {
  /// Capitalize first letter of word to UpperCase
  /// Example:
  /// ```
  /// final capitalized = 'example'.capitalize()
  /// ```
  ///
  /// Result:
  /// ```
  /// 'Example'
  /// ```
  String capitalize() {
    return substring(0, 1).toUpperCase() + substring(1);
  }
}
