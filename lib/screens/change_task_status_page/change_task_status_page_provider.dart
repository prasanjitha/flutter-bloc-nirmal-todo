import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'change_task_status_page_bloc.dart';
import 'change_task_status_page_view.dart';

class ChangeTaskStatusPageProvider
    extends BlocProvider<ChangeTaskStatusPageBloc> {
  final String appBarTitle;
  ChangeTaskStatusPageProvider({
    Key? key,
    required this.appBarTitle,
  }) : super(
          key: key,
          create: (context) => ChangeTaskStatusPageBloc(context),
          child: ChangeTaskStatusPageView(
            appBarTitle: appBarTitle,
          ),
        );
}
