import 'package:firebase_core/firebase_core.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluster_admin/config/config.dart';
import 'package:fluster_admin/firebase_options.dart';
import 'package:fluster_admin/helpers/config_loading.dart';
import 'package:fluster_admin/views/wrapper/landing_widget.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
      );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    configLoading(
      isDarkMode: false,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue.dark,
    );

    return FluentApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      home: const SuperAdminLandingWidget(),
      builder: EasyLoading.init(),
    );
  }
}
