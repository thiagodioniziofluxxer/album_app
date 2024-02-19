import 'package:album_app/app/core/ui/styles/button_style.dart';
import 'package:album_app/app/core/ui/styles/text_style.dart';
import 'package:album_app/app/core/ui/widgets/button.dart';
import 'package:album_app/app/core/ui/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

import 'package:album_app/app/pages/sticker_detail/presenter/sticker_detail_presenter.dart';

class StickerDetailPage extends StatefulWidget {
  final StickerDetailPresenter presenter;
  const StickerDetailPage({
    super.key,
    required this.presenter,
  });

  @override
  State<StickerDetailPage> createState() => _StickerDetailPageState();
}

class _StickerDetailPageState extends State<StickerDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe Figurinha'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/sticker_pb.png'),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text(
                      'BRA 1',
                      style: context.textStyles.textPrimaryFontBold
                          .copyWith(fontSize: 22),
                    ),
                    const Spacer(),
                    RoundedButton(icon: Icons.remove, onPressed: () {}),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        '1',
                        style: context.textStyles.textSecondaryFontMedium,
                      ),
                    ),
                    RoundedButton(icon: Icons.add, onPressed: () {}),
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(left: 15, bottom: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Brassil',
                    style: context.textStyles.textSecondaryFontMedium,
                  )),
              Button.primary(
                label: 'Adicionar Figurinha',
                onPressed: () {},
                width: MediaQuery.of(context).size.width * .9,
              ),
              Button(
                onPressed: () {},
                label: "Excluir figurinha",
                outline: true,
                style: context.buttonStyles.primaryOutlineButton,
                labelStyle:
                    context.textStyles.textSecondaryExtraBoldPrimaryColor,
                    width: MediaQuery.of(context).size.width *.9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
