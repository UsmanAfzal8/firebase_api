import 'package:provider/provider.dart';

import 'auth_provider.dart';

// ignore: always_specify_types
dynamic get listOfProvider => [
      ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
    ];
