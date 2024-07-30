import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicing_bloc/bloc/image_box/imagebox_bloc.dart';
import 'package:practicing_bloc/bloc/image_box/imagebox_event.dart';
// import 'package:practicing_bloc/bloc/image_box/imagebox_event.dart';
import 'package:practicing_bloc/bloc/image_box/imagebox_state.dart';
import 'package:practicing_bloc/ui/extension.dart';

class ImageBoxUI extends StatelessWidget {
  const ImageBoxUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UpperBloc>(
          create: (context) => UpperBloc(),
        ),
        BlocProvider<LowerBloc>(
          create: (context) => LowerBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Center(
              child: Text(
                'Random Image Generator',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          body: const Column(
            children: [
              Expanded(child: GenericImageBox<UpperBloc>()),
              Expanded(child: GenericImageBox<LowerBloc>()),
            ],
          ),
        ),
      ),
    );
  }
}

class GenericImageBox<T extends BlocBase<ImageBoxState>>
    extends StatelessWidget {
  const GenericImageBox({super.key});

  xyz(context) {
    Stream.periodic(
      const Duration(seconds: 5),
      (_) => UpdateImages(),
    ).startWith(UpdateImages()).forEach((event) {
      context.read<T>().add(
            event,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    xyz(context);
    return BlocBuilder<T, ImageBoxState>(
      builder: (context, state) {
        if (state.status == LoadingState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Image.network(
            state.image ?? '',
            fit: BoxFit.cover,
          );
        }
      },
    );
  }
}
