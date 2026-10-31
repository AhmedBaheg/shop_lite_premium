import 'package:flutter/material.dart';
import 'package:shop_lite_premium/features/auth/domain/entities/user_entity.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ProfileUserInfo extends StatelessWidget {
  const ProfileUserInfo({
    super.key, required this.userEntity,
  });

  final UserEntity userEntity;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.actionPrimaryLight.withValues(alpha: 0.25),
              width: 1.5,
            ),
          ),
          child: CircleAvatar(
            radius: 28,
            backgroundColor:
            AppColors.actionPrimaryLight.withValues(alpha: 0.09),
            child: Text(
              getInitials(userEntity.name),
              style: AppTextStyles.titleLarge(
                context,
                color: AppColors.actionPrimaryLight,
              ),
            ),
          ),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userEntity.name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.titleLarge(context),
              ),

              const SizedBox(height: 5),

              Row(
                children: [
                  Icon(
                    Icons.email_outlined,
                    size: 15,
                    color: AppColors.textSecondaryLight,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      userEntity.email!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodySmall(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

      ],
    );
  }
}

String getInitials(String? name) {
  if (name == null || name.trim().isEmpty) return '';

  return name
      .trim()
      .split(RegExp(r'\s+'))
      .map((word) => word[0].toUpperCase())
      .join();
}