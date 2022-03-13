import 'package:flutter/material.dart';
import 'package:sliver_test/const/value.dart';
import 'package:sliver_test/dummy_data/dummy_data.dart';
import 'package:sliver_test/route/app_router.dart';
import 'package:sliver_test/view/components/image/profile_image.dart';
import 'package:sliver_test/view/pages/sliver_page/component/token_item.dart';

class TokenView extends StatelessWidget {
  const TokenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: ConstValue.maxWidth),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          itemCount: DummyData.tokens.length,
          itemBuilder: (context, index) {
            return TokenItem(token: DummyData.tokens[index]);
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
        ),
      ),
    );
  }
}
