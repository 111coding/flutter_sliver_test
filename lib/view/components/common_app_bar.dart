import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliver_test/route/app_router.dart';
import 'package:sliver_test/route/app_routes.dart';
import 'package:sliver_test/view/components/btn/icon_btn_back.dart';
import 'package:sliver_test/view/components/btn/mini_button.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  CommonAppBar({
    Key? key,
    this.title = "",
    this.titleWidget,
    this.backShown = true,
    this.xShown = false,
    this.xFill = false,
    this.underLineShown = false,
  }) : super(key: key);

  final String title;
  final Widget? titleWidget;
  final bool backShown;
  final bool xShown;
  final bool xFill;
  final bool underLineShown;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: preferredSize.height,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (backShown) ...[
                    const IconBtnBack(),
                    const SizedBox(width: 10),
                  ],
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: titleWidget ??
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                    ),
                  ),
                  if (xShown)
                    MiniButton(
                      icon: const Icon(CupertinoIcons.xmark, size: 18),
                      onTap: () {
                        AppNavigator.pop();
                      },
                      isFill: xFill,
                    ),
                ],
              ),
            ),
          ),
          if (underLineShown)
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
        ],
      ),
    );
  }

  @override
  final Size preferredSize = Size.fromHeight(60 + MediaQuery.of(navigatorKey.currentContext!).padding.top);
}
