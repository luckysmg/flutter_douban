import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';

///
/// @created by 文景睿
/// description:星级评分条封装
///
class RatingBarIndicator extends StatelessWidget {
  final double rating;
  final double size;
  final Color filledColor;
  final Color emptyColor;
  final bool isHalfAllowed;
  final maxRating;

  const RatingBarIndicator(
      {Key key,
      @required this.rating,
      this.size = 20,
      this.filledColor = Colors.orange,
      this.emptyColor = Colors.grey,
      this.isHalfAllowed = true,
      this.maxRating = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.readOnly(
      maxRating: maxRating,
      initialRating: rating,
      isHalfAllowed: isHalfAllowed,
      size: size,
      filledColor: filledColor,
      emptyColor: emptyColor,
      halfFilledColor: filledColor,
      halfFilledIcon: Icons.star_half,
      filledIcon: Icons.star,
      emptyIcon: Icons.star_border,
    );
  }
}
