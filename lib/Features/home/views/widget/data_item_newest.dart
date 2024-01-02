import 'package:books_online/Features/home/views/widget/newest_books_item.dart';
import 'package:flutter/material.dart';

class DataItemNewest extends StatelessWidget {
  const DataItemNewest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.60,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The Atomic Hapits The Best Book of year',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w200,
              fontFamily: 'GT Sectra Fine Regular',
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'jemy welson',
            style: TextStyle(
              fontSize: 22,
              color: Colors.grey,
              fontWeight: FontWeight.w200,
              fontFamily: 'GT Sectra Fine Regular',
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Expanded(
            child: Row(
              children: [
                Text(
                  '19.99 €',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  '⭐ 4.5',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
