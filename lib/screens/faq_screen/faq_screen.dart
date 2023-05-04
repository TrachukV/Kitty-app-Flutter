import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitty_app/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:kitty_app/generated/locale_keys.g.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_text_styles.dart';
import 'package:kitty_app/screens/settings_screen/settings_screen.dart';
import 'package:kitty_app/utils/constants/faq.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  static const routeName = 'faq_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.faq.tr(),
          style: AppTextStyles.blackRegular,
        ),
        backgroundColor: AppColors.grey,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            child: Icon(
              Icons.arrow_back,
              color: AppColors.black,
            ),
            onTap: () {
              context.read<NavigationBloc>().add(
                    NavigateTabEvent(
                      tabIndex: 2,
                      route: SettingsScreen.routeName,
                    ),
                  );
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Flexible(
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey),
                          borderRadius: BorderRadius.circular(8)),
                      child: ExpansionTile(
                        childrenPadding: const EdgeInsets.all(8),
                        title: Text(
                          faq[i]['question']!,
                          style: AppTextStyles.blackRegular,
                        ),
                        children: [
                          Text(
                            faq[i]['answer']!,
                            style: AppTextStyles.greyRegular,
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: faq.length),
            ),
          ],
        ),
      ),
    );
  }
}
