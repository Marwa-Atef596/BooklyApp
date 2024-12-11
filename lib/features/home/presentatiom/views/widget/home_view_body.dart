import 'package:booklyapp/core/utiles/style.dart';
import 'package:flutter/material.dart';
import 'customBestSellerListView.dart';
import 'customFeaturedBooksListView.dart';
import 'custom_app_bar.dart';

class HoneViewBody extends StatelessWidget {
  const HoneViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            FeaturedBooksListView(),
            Padding(
              padding: EdgeInsets.only(left: 24, top: 50),
              child: Text(
                'Newest Books',
                style: Styles.textstyle18,
              ),
            ),
          ],
        )),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            // padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
            child: BestSellerListView(),
          ),
        )
      ],
    );
  }
}
