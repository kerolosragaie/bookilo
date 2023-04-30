import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

part 'open_url_state.dart';

class OpenUrlCubit extends Cubit<OpenUrlState> {
  OpenUrlCubit() : super(OpenUrlInitial());

  Future<void> openUrl({required String url}) async {
    emit(OpenUrlLoading());
    String fixedUrl = url.replaceAll("http", "https");
    Uri uri = Uri.parse(fixedUrl);
    try {
      await launchUrl(uri);
      emit(OpenUrlSuccess());
    } catch (e) {
      await Future.delayed(const Duration(seconds: 2));
      emit(OpenUrlFailure("Wrong URL format ($url)!"));
    }
  }
}
