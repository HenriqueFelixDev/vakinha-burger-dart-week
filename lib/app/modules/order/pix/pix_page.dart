import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/models/orders/pix_model.dart';
import '../../../core/theme/app_theme/app_theme_interface.dart';
import '../../../core/utils/formatter_utils.dart';
import '../../../widgets/app_bar/app_bar_widget.dart';

class PixPage extends StatefulWidget {
  const PixPage({ Key? key }) : super(key: key);

  @override
  _PixPageState createState() => _PixPageState();
}

class _PixPageState extends State<PixPage> {
  final PixModel pixData = Get.arguments;

  UriData? get pixImage => Uri.parse(pixData.image).data;

  @override
  Widget build(BuildContext context) {
    final textStyles = Get.find<AppThemeInterface>().textStyles;

    return Scaffold(
      appBar: AppBarWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text('Valor a receber', style: TextStyle(fontSize: 22.0)),
            
                Text(
                  FormatterUtils.formatCurrency(pixData.totalValue),
                  style: textStyles.heading1
                ),

                Image.memory(
                  pixImage!.contentAsBytes(),
                  height: context.heightTransformer(reducedBy: 70.0),
                  width: context.heightTransformer(reducedBy: 70.0)
                )
              ]
            ),

            TextButton(
              child: const Text(
                'PIX copia e cola',
                style: TextStyle(
                  fontSize: 22.0,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed
                )
              ),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: pixData.code));
                Get.rawSnackbar(
                  message: 'PIX copiado',
                  snackPosition: SnackPosition.BOTTOM
                );
              }
            )
          ]
        ),
      )
    );
  }
}