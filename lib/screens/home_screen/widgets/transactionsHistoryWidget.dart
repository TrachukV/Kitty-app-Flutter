import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:kitty_app/generated/locale_keys.g.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_text_styles.dart';
import 'package:kitty_app/utils/helpers/helpers.dart';

class TransactionHistoryWidget extends StatefulWidget {
  const TransactionHistoryWidget({Key? key}) : super(key: key);

  @override
  State<TransactionHistoryWidget> createState() => _TransactionHistoryWidgetState();
}

class _TransactionHistoryWidgetState extends State<TransactionHistoryWidget> {
  Offset _tapPosition = Offset.zero;
  void _getTapPosition(TapDownDetails details) {
    setState(() {
      _tapPosition = details.globalPosition;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        final transactionsMap = state.mapTransactions.entries;
        final allCategories = [...state.expensesCategories, ...state.incomeCategories];
        return Flexible(
          child: ListView.separated(
            padding: const EdgeInsets.all(15),
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: state.mapTransactions.length,
            itemBuilder: (
              context,
              index,
            ) {

              final dayTransactionsData = transactionsMap.elementAt(index).value;
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.grey, width: 1),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dateFormatHelper(transactionsMap.elementAt(index).key),
                            style: AppTextStyles.blackTitle,
                          ),
                          Text(
                            dayExpensesHelper(transactionsMap.elementAt(index).value),
                            style: AppTextStyles.blackTitle,
                          )
                        ],
                      ),
                    ),
                    ...List.generate(dayTransactionsData.length, (index) {
                      final transactions = allCategories.firstWhere(
                        (element) => element.categoryId == dayTransactionsData[index].categoryId,
                      );
                      return GestureDetector(
                        onTapDown: (details) => _getTapPosition(details),
                        onLongPress: (){
                          if(dayTransactionsData[index].description.isNotEmpty){
                            _showDeleteOption(
                                context,
                                dayTransactionsData[index].description,
                                dayTransactionsData[index].expenseId);
                          } else {
                            _showDeleteOption(
                                context,
                                '${transactions.title} ${LocaleKeys.transaction}',
                                dayTransactionsData[index].expenseId);
                          }
                        },
                        child: ListTile(
                          leading: SvgPicture.asset(transactions.icon.pathToIcon),
                          title: Text(
                            transactions.title,
                            style: AppTextStyles.blackRegular,
                          ),
                          subtitle: Text(dayTransactionsData[index].description, style: AppTextStyles.greyCategory),
                          trailing: Text(dayTransactionsData[index].amount
                            .toString(),
                            style: dayTransactionsData[index].amount  < 0 ? AppTextStyles.redRegular : AppTextStyles.greenRegular,
                          ),
                        ),
                      );
                    })
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
  void _showDeleteOption(BuildContext context, String title, int id) async {
    final RenderObject? overlay =
    Overlay.of(context)?.context.findRenderObject();
    await showMenu(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      context: context,
      position: RelativeRect.fromRect(
          Rect.fromLTWH(_tapPosition.dx, _tapPosition.dy, 30, 30),
          Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
              overlay.paintBounds.size.height)),
      items: [PopupMenuItem(
          value: 'delete',
          child: Text('Delete $title', style: AppTextStyles.redRegular,))],
    ).then((value) {
      if (value != null) {
        context.read<DatabaseBloc>().add(DeleteTransactionEvent(transactionId: id));
      }
    });
  }
}
