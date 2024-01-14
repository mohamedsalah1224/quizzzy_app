import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quizzy_app/model/postion_audio_data.dart';
import 'package:quizzy_app/utils/constant.dart';
import 'package:quizzy_app/view/custom_component/source_type/audio/audio_controls.dart';
import 'package:quizzy_app/view_model/media/audio_view_model.dart';

class CustomSourceAudio extends StatelessWidget {
  const CustomSourceAudio({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<AudioViewModel>();
    return Container(
      padding: REdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Color(0xff268C6D)),
          color: const Color(0xffF0F0F0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(child: AudioControls()),
          StreamBuilder<PositionAudioData>(
            stream: controller.positionDataStream,
            builder: (context, snapshot) {
              final positionData = snapshot.data;
              return ProgressBar(
                barCapShape: BarCapShape.square,
                total: positionData?.duration ?? Duration.zero,
                progress: positionData?.position ?? Duration.zero,
                buffered: positionData?.bufferedPosition ?? Duration.zero,
                onSeek: controller.audioPlayer.seek,
                thumbColor: primayColor,
                bufferedBarColor: primayColor.withOpacity(0.1),
                progressBarColor: primayColor,
              );
            },
          ),
        ],
      ),
    );
  }
}
