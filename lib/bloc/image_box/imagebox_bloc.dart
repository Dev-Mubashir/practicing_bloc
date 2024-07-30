import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:practicing_bloc/bloc/image_box/imagebox_event.dart';
import 'package:practicing_bloc/bloc/image_box/imagebox_state.dart';

class UpperBloc extends ImageboxBloc {
  UpperBloc() : super();
}

class LowerBloc extends ImageboxBloc {
  LowerBloc() : super();
}

class ImageboxBloc extends Bloc<ImageBoxEvent, ImageBoxState> {
  late Timer _timer;
  ImageboxBloc() : super(const ImageBoxState(status: LoadingState.loading)) {
    on<UpdateImages>(_updateImages);

    // _timer = Timer(Duration.zero, () {
    //   add(UpdateImages());
    //   _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
    //     add(UpdateImages());
    //   });
    // });
  }

  void _updateImages(UpdateImages event, Emitter<ImageBoxState> emit) async {
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(image: _getRandomImage(), status: LoadingState.loaded));
  }

  String _getRandomImage() {
    final randomIndex = (state.imageUrls.toList()..shuffle()).first;
    return randomIndex;
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
