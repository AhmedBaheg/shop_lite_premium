import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_lite_premium/features/auth/presentation/views/views/auth_parent.dart';

import '../../../auth/data/data_sources/remote/auth_remote_data_source_impl.dart';
import '../../../auth/data/repo/auth_repo_impl.dart';
import '../../../auth/domain/use_cases/logout_use_case.dart';
import '../../../auth/presentation/cubits/auth_cubit.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        logoutUseCase: LogoutUseCase(
          authRepo: AuthRepoImpl(
            authRemoteDataSource: AuthRemoteDataSourceImpl(),
          ),
        ),
      ),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Products'),
              actions: [
                IconButton(
                  onPressed: () async {
                    await context.read<AuthCubit>().logout();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => AuthParent()),
                      (route) => false,
                    );
                  },
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
