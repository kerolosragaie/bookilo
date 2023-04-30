import 'package:bookilo/core/utils/functions/launch_url.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'open_url_state.dart';

class OpenUrlCubit extends Cubit<OpenUrlState> {
  OpenUrlCubit() : super(OpenUrlInitial());

  Future<void> openUrl({String? url}) async {
    if (url == null) {
      emit(const OpenUrlFailure(
          "Sorry, this book is not available to perview!"));
    } else {
      emit(OpenUrlLoading());
      try {
        String fixedUrl = url.replaceAll("http", "https");
        await urlLaunch(url: fixedUrl);
        emit(OpenUrlSuccess());
      } catch (e) {
        emit(OpenUrlFailure("Could not launch ($url)"));
      }
    }
  }
}
