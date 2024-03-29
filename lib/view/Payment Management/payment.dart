import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/config/provider/package_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/subscription_provider.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';
import 'package:mobile_capstone_fpt/models/Order/entity/order.dart';
import 'package:mobile_capstone_fpt/view/Payment%20Management/success_pay_screen.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key, required this.url, required this.listOrder})
      : super(key: key);
  final String url;
  final List<Order> listOrder;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    PackageProvider packageProvider = Provider.of<PackageProvider>(context);
    SubscriptionProvider subscriptionProvider =
        Provider.of<SubscriptionProvider>(context);

    final SecureStorage secureStorage = SecureStorage();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh toán',
            style: TextStyle(color: kblackColor, fontSize: 20)),
        backgroundColor: aBackgroundColor,
        centerTitle: true,
        leading: BackButton(
          color: kblackColor,
          onPressed: () async {
            // log("Back Payment");
            await packageProvider.clearBackPayment();
            Navigator.pushNamedAndRemoveUntil(
                context, '/SchedulePage', (route) => false);
            // if (!orderPro.buttonCancelPayment) {
            //   orderPro.cancelNotPayment(
            //       context, widget.ordersTours.id!, 'Non Payment');
            // }
          },
        ),
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        onProgress: (int progress) {},
        javascriptChannels: const <JavascriptChannel>{},
        navigationDelegate: (NavigationRequest request) async {
          if (request.url
              .startsWith('http://14.225.205.162:2004/subscriptions/payment')) {
            var uri = Uri.parse(request.url);
            var statusCode = uri.queryParameters['vnp_TransactionStatus'];
            var maDonHang = uri.queryParameters['vnp_TxnRef'];
            // log(statusCode.toString());
            if (statusCode == '00') {
              // String queryParam = request.url.split('?')[1];
              String subId =
                  await secureStorage.readSecureData("idSubscription");
              subscriptionProvider.confirmSub(context, subId);
              await subscriptionProvider.getSubById(context, subId);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => SuccessPayScreen(
                            // ordersTours: widget.ordersTours,
                            maDonHang: maDonHang,
                          )),
                  (Route<dynamic> route) => false);
            } else {
              String subId =
                  await secureStorage.readSecureData("idSubscription");
              if (subId.isNotEmpty) {
                // log(subId.toString());
                subscriptionProvider.cancelSub(context, subId);
                secureStorage.deleteSecureData(subId);
              }

              packageProvider.clearBackPackage();
              packageProvider.clearBackPayment();
              Navigator.pushNamedAndRemoveUntil(
                  context, '/HomePage', (route) => false);

              // Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(
              //         builder: (context) => PaymentFailed(
              //               ordersTours: widget.ordersTours,
              //             )),
              //     (Route<dynamic> route) => false);
            }
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        gestureNavigationEnabled: true,
        backgroundColor: aBackgroundColor,
      ),
    );
  }
}
