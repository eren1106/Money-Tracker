import 'package:flutter/material.dart';

class DetailRow extends StatelessWidget {
  const DetailRow(
      {Key? key,
      required this.label,
      required this.text,
      this.isColumn = false})
      : super(key: key);

  final String label;
  final String text;
  final bool isColumn;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 3,
      ),
      child: isColumn
          ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  flex: 4,
                  fit: FlexFit
                      .tight, //If the fit is FlexFit.tight, the child is required to fill the available space
                ),
                Flexible(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  flex: 6,
                  fit: FlexFit
                      .tight, //If the fit is FlexFit.tight, the child is required to fill the available space
                )
              ],
            ),
    );
  }
}
