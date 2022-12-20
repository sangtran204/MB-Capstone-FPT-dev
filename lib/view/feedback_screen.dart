// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mobile_capstone_fpt/config/provider/feedback_provider.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';
import 'package:provider/provider.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key, required this.packageId}) : super(key: key);
  final String packageId;

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  double _packageRate = 0;
  double _foodRate = 0;
  double _shippingRate = 0;
  String _comment = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FeedbackProvider feedbackProvider = Provider.of<FeedbackProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
        backgroundColor: kBackgroundColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.height,
            color: Colors.grey.shade100,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                _textField('Đánh giá gói ăn'),
                RatingBar.builder(
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (packageRate) {
                    // print(packageRate);
                    _packageRate = packageRate;
                  },
                ),
                _textField('Đánh giá món ăn'),
                RatingBar.builder(
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (foodRate) {
                    // print(foodRate);
                    _foodRate = foodRate;
                  },
                ),
                _textField('Đánh giá giao hàng'),
                RatingBar.builder(
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (shippingRate) {
                    // print(shippingRate);
                    _shippingRate = shippingRate;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: 350,
                  height: 100,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black.withOpacity(0.13)),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: TextField(
                    onChanged: ((value) {
                      _comment = value;
                    }),
                    minLines: 3,
                    maxLines: 5,
                    style: TextStyle(color: Colors.black87, fontSize: 16),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        // prefixIcon: Icon(Icons.lock, color: Colors.grey.shade500),
                        hintText: 'Góp ý đến chúng tôi',
                        hintStyle: TextStyle(color: Colors.grey.shade500)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: kBackgroundColor),
                  child: Container(
                    width: 220,
                    height: 50,
                    child: const Center(
                      child: Text(
                        'Gửi đánh giá',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    int packagePoint = _packageRate.toInt();
                    int foodPoint = _foodRate.toInt();
                    int shippingPoint = _shippingRate.toInt();
                    feedbackProvider.sendFeedback(context, packagePoint,
                        foodPoint, shippingPoint, _comment, widget.packageId);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textField(String title) => Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, color: Colors.grey),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      );
}
