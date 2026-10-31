import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_lite_premium/core/shared_widgets/app_main_bar.dart';
import 'package:shop_lite_premium/core/theme/app_colors.dart';
import 'package:shop_lite_premium/core/utils/app_spacing.dart';
import 'package:shop_lite_premium/features/auth/data/data_sources/remote/auth_remote_data_source_impl.dart';
import 'package:shop_lite_premium/features/auth/data/repo/auth_repo_impl.dart';
import 'package:shop_lite_premium/features/auth/domain/use_cases/logout_use_case.dart';
import 'package:shop_lite_premium/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:shop_lite_premium/features/auth/presentation/views/views/auth_parent.dart';

import '../../../../core/shared_widgets/custom_divider.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/domain/use_cases/get_user_data_use_case.dart';
import '../widgets/profile_menu_item.dart';
import '../widgets/profile_user_info.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) =>
          AuthCubit(
            logoutUseCase: LogoutUseCase(
              authRepo: AuthRepoImpl(
                authRemoteDataSource: AuthRemoteDataSourceImpl(),
              ),
            ),
            getUserDataUseCase: GetUserDataUseCase(
              AuthRepoImpl(
                authRemoteDataSource: AuthRemoteDataSourceImpl(),
              ),
            ),
          )..getUserData(),
      child: Scaffold(
        appBar: AppMainBar(title: localization.profileTitle),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Builder(
            builder: (context) {
              return Column(
                children: [
                  SizedBox(height: AppSpacing.x24),

                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if (state is AuthGetUserDataLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.actionPrimaryLight,
                          ),
                        );
                      } else if (state is AuthGetUserDataSuccess) {
                        return ProfileUserInfo(userEntity: state.userEntity,);
                      }
                      return SizedBox.shrink();
                    },
                  ),

                  SizedBox(height: AppSpacing.x24),

                  ProfileMenuItem(
                    icon: AppStrings.packageIcon,
                    title: localization.profileOrders,
                    value: localization.profileOrdersCount(2),
                  ),

                  CustomDivider(),

                  ProfileMenuItem(
                    icon: AppStrings.mapPinIcon,
                    title: localization.profileSavedAddresses,
                    value: localization.profileAddressCount(2),
                  ),

                  CustomDivider(),

                  ProfileMenuItem(
                    icon: AppStrings.creditCardIcon,
                    title: localization.profilePaymentMethods,
                    value: localization.profileVisaEnding(4242),
                  ),

                  CustomDivider(),

                  ProfileMenuItem(
                    icon: AppStrings.notificationIcon,
                    title: localization.profileNotifications,
                    value: localization.profileNotificationsOn,
                  ),

                  CustomDivider(),

                  ProfileMenuItem(
                    icon: AppStrings.languagesIcon,
                    title: localization.profileLanguage,
                    value: localization.language,
                  ),

                  CustomDivider(),

                  ProfileMenuItem(
                    icon: AppStrings.appearanceIcon,
                    title: localization.profileAppearance,
                    value: localization.profileLight,
                  ),

                  CustomDivider(),

                  ProfileMenuItem(
                    icon: AppStrings.circleHelpIcon,
                    title: localization.profileHelpSupport,
                  ),

                  CustomDivider(),

                  BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthLogoutSuccess) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => AuthParent()),
                              (route) => false,
                        );
                      } else if (state is AuthFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorMessage)),
                        );
                      }
                    },
                    child: ProfileMenuItem(
                      icon: AppStrings.logoutIcon,
                      title: localization.profileLogout,
                      onTap: () {
                        context.read<AuthCubit>().logout();
                      },
                      arrowIcon: false,
                    ),
                  ),

                  SizedBox(height: 50),

                  Text(
                    localization.profileVersion(1.0),
                    style: AppTextStyles.bodySmall(
                      context,
                      color: AppColors.textSecondaryLight,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
