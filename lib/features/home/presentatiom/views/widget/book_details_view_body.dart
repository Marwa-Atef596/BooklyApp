import 'package:booklyapp/features/home/data/model/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'BooksDetailSection.dart';
import 'SimailarBooksSection.dart';
import 'custom_book_appbar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      //عشان ف expanded استخدمت دى بدل سنجل شيلد اسكرول فيو
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailsViewAppbar(),
                BooksDetailSection(
                  book: bookModel,
                ),
                const Expanded(
                  //عشان تفضل تحت دايما
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                const SimailarBooksSection(),
                // const SizedBox(
                //   height: 40,
                // ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
