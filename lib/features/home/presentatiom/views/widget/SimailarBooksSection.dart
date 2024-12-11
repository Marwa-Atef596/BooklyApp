import 'package:flutter/material.dart';

import '../../../../../core/utiles/style.dart';
import 'SimilarBookListView.dart';

class SimailarBooksSection extends StatelessWidget {
  const SimailarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You Can Also Like',
          style: Styles.textstyle14.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 16,
        ),
        const SimilarBookListView(),
       
      ],
    );
  }
}
