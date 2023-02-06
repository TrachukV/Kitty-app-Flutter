import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:kitty_app/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:kitty_app/generated/locale_keys.g.dart';
import 'package:kitty_app/models/statistics_model/statistics_model.dart';
import 'package:kitty_app/resources/app_colors.dart';

import 'package:kitty_app/resources/app_icons.dart';
import 'package:kitty_app/resources/app_text_styles.dart';
import 'package:kitty_app/screens/search_screen/search_screen.dart';
import 'package:kitty_app/screens/widgets/avatar_widget.dart';
import 'package:kitty_app/screens/widgets/calendar_widget.dart';
import 'package:kitty_app/utils/pdf_generator/pdf_generenor.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({Key? key}) : super(key: key);
  static const routeName = 'chart_screen';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: AppColors.blue,
            icon: const Icon(
              Icons.file_download_outlined,
              color: Colors.white,
            ),
            label: Text(LocaleKeys.report.tr()),
            onPressed: () async {
              await createOpenPdf(state);
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leadingWidth: 100,
            title: Text(
              LocaleKeys.stats.tr(),
              style: AppTextStyles.blackBold,
              textAlign: TextAlign.right,
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  context.read<NavigationBloc>().add(NavigateTabEvent(tabIndex: 5, route: SearchScreen.routeName));
                },
                child: AppIcons.blackSearch,
              ),
              const SizedBox(width: 20),
              AvatarWidget(
                color: AppColors.grey,
              ),
              const SizedBox(width: 17),
            ],
          ),
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: height * 0.01,
            ),
            CalendarWidget(
              decrement: () {
                context.read<DatabaseBloc>().add(
                      IncDecMonthEvent(command: 'decrement', screen: 'statistics'),
                    );
              },
              increment: () {
                context.read<DatabaseBloc>().add(
                      IncDecMonthEvent(command: 'increment', screen: 'statistics'),
                    );
              },
              screen: 'statistics',
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                LocaleKeys.overview.tr(),
                style: AppTextStyles.blackTitle,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            state.statisticsModels.isEmpty
                ? Center(
                    child: Container(
                      width: width / 1.1,
                      height: height / 17,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.grey),
                    ),
                  )
                : Center(
                    child: ChartWidget(
                      statistics: state.statisticsModels,
                    ),
                  ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                LocaleKeys.details.tr(),
                style: AppTextStyles.blackTitle,
              ),
            ),
            const StatisticsItemBuilder(),
          ]),
        );
      },
    );
  }
}

class ChartWidget extends StatelessWidget {
  const ChartWidget({
    super.key,
    required this.statistics,
  });

  final List<StatisticsModel> statistics;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: width / 1.1,
        height: height / 17,
        child: Row(
          children: List.generate(statistics.length, (index) {
            return Flexible(
              flex: (statistics[index].percentage).round(),
              child: AnimatedContainer(
                curve: Curves.easeIn,
                color: Color(int.parse('FF${statistics[index].icon.color}', radix: 16)),
                duration: const Duration(milliseconds: 500),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class StatisticsItemBuilder extends StatelessWidget {
  const StatisticsItemBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        return Flexible(
          child: ListView.builder(
              itemCount: state.statisticsModels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: SvgPicture.asset(state.statisticsModels[index].icon.pathToIcon),
                  title: Text(
                    state.statisticsModels[index].title,
                    style: AppTextStyles.blackRegular,
                  ),
                  subtitle: Text(
                    '${state.statisticsModels[index].counterTransactions} transactions',
                    style: AppTextStyles.greyCategory,
                  ),
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${state.statisticsModels[index].totalAmount}',
                        style: AppTextStyles.redRegular,
                      ),
                      Text(
                        '${(state.statisticsModels[index].percentage.round())}%',
                        style: AppTextStyles.blackBottom,
                      ),
                    ],
                  ),
                );
              }),
        );
      },
    );
  }
}
