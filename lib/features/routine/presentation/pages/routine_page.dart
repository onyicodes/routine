import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routine2/core/error/error_pages/error_page.dart';
import 'package:routine2/core/error/error_pages/no_result_found_page.dart';
import 'package:routine2/core/general_widgets/custom_drawer.dart';
import 'package:routine2/core/loading_indicator/simple_loading_indicator.dart';
import 'package:routine2/core/state_manager/app_state_manager.dart';
import 'package:routine2/core/state_manager/routine_state_manage.dart';
import 'package:routine2/features/routine/presentation/bloc/fetch_routines_bloc/fetch_routines_bloc.dart';
import 'package:routine2/features/routine/presentation/pages/add_routine_page.dart';
import 'package:routine2/features/routine/presentation/pages/routine_performance_page.dart';
import 'package:routine2/features/routine/presentation/widgets/routine_page_widgets/routine_loaded_state.dart';
import 'package:provider/provider.dart';

class RoutinePage extends StatefulWidget {
  const RoutinePage({Key? key}) : super(key: key);

  @override
  State<RoutinePage> createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FetchRoutinesBloc>(context)
        .add(const FetchAllRoutinesEvent());
  }

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    bool? isLightTheme = Provider.of<AppStateManager>(context).isLightTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Routine App', style: primaryTextTheme.headline3),
        actions: [
          IconButton(
              onPressed: () {
                changeThemePopup(
                    context: context,
                    primaryTextTheme: primaryTextTheme,
                    isLightTheme: isLightTheme);
              },
              icon: Icon(
                Icons.sunny_snowing,
                color: Theme.of(context).iconTheme.color,
              )),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 16.0),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                         const CalculateRoutineCheckPerformance()));
                },
                icon: Icon(
                  Icons.calculate_outlined,
                  color: Theme.of(context).iconTheme.color,
                )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) =>const CreateRoutine()));
        },
        backgroundColor: Theme.of(context).primaryColor,
        tooltip: 'Add new Routine',
        child: const Icon(Icons.add),
      ),
      body: BlocConsumer<FetchRoutinesBloc, FetchRoutinesState>(
        listener: (context, state) {
          if (state is FetchRoutinesLoaded) {
            Provider.of<RoutineStateManager>(context, listen: false)
                .setActiveRoutineList = state.routineList;
          }
        },
        builder: (context, state) {
          return state is FetchRoutinesLoaded && state.routineList.isEmpty
              ? noResultFoundPage(
                  context: context, message: "No routine found!")
              : state is FetchRoutinesLoaded
                  ? RoutinListLoaded(
                      routineList: state.routineList,
                    )
                  : state is FetchRoutinesLoading
                      ? simpleLoadingIndicator(
                          primaryTextTheme: primaryTextTheme)
                      : state is FetchRoutinesError
                          ? errorPage(
                              context: context,
                              errorMessage: state.errorMessage,
                              onTapped: () {
                                BlocProvider.of<FetchRoutinesBloc>(context)
                                    .add(const FetchAllRoutinesEvent());
                              })
                          : Container();
        },
      ),
    );
  }
}
