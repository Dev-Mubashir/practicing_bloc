import 'package:equatable/equatable.dart';

enum LoadingState {
  loading,
  loaded,
}

class ImageBoxState extends Equatable {
  final List<String> imageUrls;
  final String? image;
  final LoadingState? status;

  const ImageBoxState({
    this.imageUrls = const [
      'https://canvas.tamashaweb.com/jazzlive/uploads/slider/TMSH-1719651399431.webp?id=18',
      'https://canvas.tamashaweb.com/jazzlive/uploads/slider/TMSH-1719687382438.webp?id=76',
      'https://canvas.tamashaweb.com/jazzlive/uploads/slider/TMSH-1718961584917.webp?id=99',
      'https://canvas.tamashaweb.com/jazzlive/uploads/slider/TMSH-1718963507632.webp?id=98',
      'https://canvas.tamashaweb.com/jazzlive/uploads/slider/1687867558.webp?id=41',
    ],
    this.image,
    required this.status,
  });

  ImageBoxState copyWith({
    List<String>? imageUrls,
    String? image,
    LoadingState? status,
  }) {
    return ImageBoxState(
      imageUrls: imageUrls ?? this.imageUrls,
      image: image ?? this.image,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props =>
      [imageUrls, image ?? '', status ?? LoadingState.loading];
}
