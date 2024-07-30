import 'package:equatable/equatable.dart';

abstract class ImageBoxEvent extends Equatable {
  const ImageBoxEvent();

  @override
  List<Object> get props => [];
}

class UpdateImages extends ImageBoxEvent {}
