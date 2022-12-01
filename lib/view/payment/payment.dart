import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatefulWidget {
  // const PaymentPage({Key? key, required this.url, required this.ordersTours})
  //     : super(key: key);
  const PaymentPage({Key? key, required this.url}) : super(key: key);
  final String url;
  // final OrdersTours ordersTours;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    // final orderPro = ref.watch(orderProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay',
            style: TextStyle(color: kblackColor, fontSize: 20)),
        backgroundColor: aBackgroundColor,
        centerTitle: true,
        leading: BackButton(
          color: kblackColor,
          onPressed: () {
            log("Cancel Payment");
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
        navigationDelegate: (NavigationRequest request) {
          // log(request.url);
          if (request.url
              .startsWith('http://14.225.205.162:2004/subscriptions/payment')) {
            var uri = Uri.parse(request.url);
            var statusCode = uri.queryParameters['vnp_TransactionStatus'];
            if (statusCode == '00') {
              String queryParam = request.url.split('?')[1];
              // orderPro.updateStatusPaymentUrl(
              //     widget.ordersTours, context, queryParam);
              // Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(
              //         builder: (context) => PaymentSuccess(
              //               ordersTours: widget.ordersTours,
              //             )),
              //     (Route<dynamic> route) => false);
            } else {
              log("Payment thất bại");
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
