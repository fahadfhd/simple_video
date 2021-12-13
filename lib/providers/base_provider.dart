import 'package:flutter/material.dart';

typedef OnShowError = void Function(String msg, bool asToast);

/// The base provider class
abstract class BaseProvider extends ChangeNotifier {
  final String _providerName;

  String get providerName => _providerName;

  /// The default constructor
  BaseProvider({required String name})
      : _providerName = name,
        super();
}
