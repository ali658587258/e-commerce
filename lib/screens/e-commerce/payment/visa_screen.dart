import 'dart:async';
import 'dart:io';

import 'package:commerce/core/utils/naviagtion.dart';
import 'package:commerce/screens/Authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:webview_flutter/webview_flutter.dart';

import '../../../components/custim_text.dart';
import '../../../src/api_constant.dart';
import '../../../src/app_color.dart';

class VisaScreen extends StatefulWidget {
  const VisaScreen({Key? key}) : super(key: key);

  @override
  State<VisaScreen> createState() => _VisaScreenState();
}

class _VisaScreenState extends State<VisaScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.kWhiteColor,
        appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: CustomText(
              fontWeight: FontWeight.bold,
              fontSize: 22.sp,
              text: "Payment",
              color: AppColor.kBlackColor,
            ),
            backgroundColor: AppColor.kWhiteColor,
            actions: [
              IconButton(
                onPressed: () {
                  paymentExitApp(context);
                },
                icon: const Icon(
                  Icons.exit_to_app,
                  color: AppColor.kBlackColor,
                ),
              )
            ]),
        body: WebView(
          initialUrl:
              'https://accept.paymob.com/api/acceptance/iframes/736964?payment_token=${ApiContest.finalToken}',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onProgress: (int progress) {
            print('WebView is loading (progress : $progress%)');
          },
          javascriptChannels: <JavascriptChannel>{
            _toasterJavascriptChannel(context),
          },
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('https://www.google.com/')) {
              print('blocking navigation to $request}');
              return NavigationDecision.prevent;
            }
            print('allowing navigation to $request');
            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
          gestureNavigationEnabled: true,
          backgroundColor: const Color(0x00000000),
        ),
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      },
    );
  }

  // to exit from app
  void paymentExitApp(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text(
            'Are you sure completed the pay',
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                AppNavigator.customNavigator(
                    context: context,
                    screen: LoginScreen(),
                    finish: true);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}
