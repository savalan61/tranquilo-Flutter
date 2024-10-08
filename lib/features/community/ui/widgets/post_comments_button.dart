import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/features/community/ui/screens/comments_bottom_sheet.dart';
import 'package:tranquilo_app/features/community/data/models/post_models/post_response.dart';

class PostCommentsButton extends StatelessWidget {
  final Post post;
  const PostCommentsButton({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: const BorderSide(
            color: ColorsManager.containerSilver,
          ),
        ),
      ),
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return DraggableScrollableSheet(
              initialChildSize: 0.7,
              minChildSize: 0.3,
              maxChildSize: 0.9,
              expand: false,
              builder: (context, scrollController) {
                return CommentsBottomSheet(
                  scrollController: scrollController,
                  post: post,
                );
              },
            );
          },
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/svgs/comment.svg',
            width: 16.w,
            height: 16.h,
          ),
          horizontalSpace(4),
          Text(
            post.commentsCount.toString(),
            style: TextStyles.font12JetBlackRegular,
          ),
        ],
      ),
    );
  }
}
