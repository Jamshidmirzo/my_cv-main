import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_cv/blocs/file_bloc.dart';
import 'package:my_cv/blocs/file_event.dart';
import 'package:my_cv/blocs/file_state.dart';

class PdfButtonWidget extends StatelessWidget {
  const PdfButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FileBloc, FileState>(
      listener: (context, state) {
        if (state is LoadedState) {
          context.read<FileBloc>().add(OpenFile(state.filePath));
        }
        if (state is ErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        return IconButton(
          onPressed: () {
            context.read<FileBloc>().add(
                  DownloadFile("https://msnlabs.com/img/resume-sample.pdf"),
                );
          },
          icon: SvgPicture.asset("assets/icons/pdf.svg"),
        );
      },
    );
  }
}
