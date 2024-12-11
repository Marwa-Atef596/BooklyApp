import 'package:booklyapp/features/home/data/model/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utiles/style.dart';
import 'CustomBookItem.dart';
import 'booksAction.dart';
import 'customBookRating.dart';

class BooksDetailSection extends StatelessWidget {
  const BooksDetailSection({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var Width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Width * .2),
          child: CustomBookItem(
            imgUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          book.volumeInfo.title!,
          style: Styles.textstyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            book.volumeInfo.authors?[0] ?? '',
            style: Styles.textstyle18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        BookRating(
          count: book.volumeInfo.ratingsCount ?? 0,
          rating: book.volumeInfo.averageRating ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 38,
        ),
         BooksAction(bookModel: book,),
      ],
    );
  }
}
