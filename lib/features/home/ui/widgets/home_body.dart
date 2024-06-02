import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/helpers/spacing.dart';
import 'package:task_app/core/widgets/custom_tap.dart';
import 'package:task_app/features/home/logic/cubit/home_cubit.dart';
import 'package:task_app/features/home/ui/widgets/create_task_button_with_form.dart';
import 'package:task_app/features/home/ui/widgets/home_filters.dart';
import 'package:task_app/features/home/ui/widgets/home_tasks_list.dart';
import 'package:task_app/features/home/ui/widgets/home_welcome_text.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTap(
      onTap: () {
        // Hide create task form
        context.read<HomeCubit>().emitChangeCreateTaskState(true);
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
          top: 10.h,
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeWelcomeText(),
                    verticalSpace(20),
                    const HomeFilters(),
                    verticalSpace(10),
                    const Expanded(
                      child: HomeTasksList(),
                    ),
                  ],
                ),
              ),
            ),
            verticalSpace(10),
            const CreateTaskButtonWithForm(),
          ],
        ),
      ),
    );
  }
}
