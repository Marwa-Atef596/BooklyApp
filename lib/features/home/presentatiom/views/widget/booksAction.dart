import 'package:booklyapp/features/home/data/model/book_model/book_model.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utiles/function/lunch_url.dart';
import '../../../../../core/widget/custombutton.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
        const  Expanded(
              child: CustomButton(
            text: 'Free',
            background: Colors.white,
            textcolor: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          )),
          Expanded(
              child: CustomButton(
            // onpressed: () async {
            //   Uri uri = Uri.parse(bookModel.volumeInfo.previewLink!);
            //   if (await canLaunchUrl(uri)) {
            //     await launchUrl(uri);
            //   }
            // },
            onpressed: () {
              launchCustomUr(context, bookModel.volumeInfo.infoLink);
            },
            text: getText(bookModel),
            fontsize: 16,
            background: Color(0xffef8262),
            textcolor: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          )),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not Avaliable';
    } else {
      return 'Preview';
    }
  }
}
