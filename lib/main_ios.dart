import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainIos extends StatelessWidget {
  const MainIos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: true,  // Enables WebView
        enableJavaScript: true,  // Disables JavaScript
        enableDomStorage: true,

      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3E1F92),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Get in touch',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                "We'd love to hear from you. Our friendly team is always here to chat.",
                style: TextStyle(
                  color: Color(0xFFA895D1),
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                ),
              ),

              const SizedBox(height: 30.0),
              buildContactButton(
                Icons.language,
                'blog.logrocket.com',
                    () => launchUrl(
                  //'https://demo.doconline.com/user/login')
                    'https://demo.doconline.com/aes-user-register?q=mKDIRuFDm9nlq1xPiGzm4LgxV3X7cMWX1dyAubOsXa5DglQj46aWRKyji9S2N3xcXohVIayCVXIcIUz8%2B2Cy8J%2BGax3D%2FEjsu4bQr15Zt00nMdTxuRNvRN6KO%2BdAixEYg1mgtwD2BvFOP9yRH9iKWr6oSZsMVVx%2FXznghXTgjY2TUUFXrVaCk91xAtEIGVvwHHA7FeldT%2FoalWPUmndcRvTAG63gXTmM2mIB5GZTMIkslS31RL1Vh%2FYrftXQiWKFIprXVAcuBrg3ugWPOWBA%2BtrEifwx6QkC2PxLBIVWuzRHDuMlioEY%2FUeQTEjsQpCxgZe%2FfAzVh8PScZMvYu42K4BxE91vWA2YlFcTWKlUajs%3D'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContactButton(
      IconData icon, String label, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFFED92A2)),
          const SizedBox(width: 20.0),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFFA294C2),
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}