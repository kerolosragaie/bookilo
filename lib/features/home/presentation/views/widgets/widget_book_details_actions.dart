import 'dart:math';
import 'package:bookilo/core/widgets/widget_loading_indicator.dart';
import 'package:bookilo/core/models/book_model/book_model.dart';
import 'package:bookilo/features/home/presentation/manager/open_url_cubit/open_url_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/button_custom.dart';
import '../../../../../core/widgets/snack_bar_message.dart';

class BookActionsWidget extends StatelessWidget {
  final BookModel bookModel;
  const BookActionsWidget({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: "Free",
            oldPrice: Random().nextInt((500 - 100)),
            textColor: Colors.green,
            onPressed: () {},
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        ),
        Expanded(
          child: BlocConsumer<OpenUrlCubit, OpenUrlState>(
            listener: (context, state) {
              if (state is OpenUrlFailure) {
                SnackbarMessage.showErrorSnackBar(
                    context: context, message: state.errorMessage);
              } else if (state is OpenUrlLoading) {
                const Center(child: LoadingIndicatorWidget());
              }
            },
            builder: (context, state) {
              if (state is OpenUrlLoading) {
                return _buildFreePreviewCustomButton(context, isLoading: true);
              }
              return _buildFreePreviewCustomButton(context, isLoading: false);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFreePreviewCustomButton(BuildContext context,
      {required bool isLoading}) {
    return CustomButton(
      text: "Preview",
      backgroundColor: const Color(0xffEF8262),
      textColor: Colors.white,
      isLoading: isLoading,
      onPressed: () {
        if (!isLoading) {
          BlocProvider.of<OpenUrlCubit>(context)
              .openUrl(url: bookModel.volumeInfo!.previewLink!);
        }
      },
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
    );
  }
}
