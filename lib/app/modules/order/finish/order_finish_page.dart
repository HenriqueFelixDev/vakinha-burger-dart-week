import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_routes.dart';
import '../../../core/models/orders/pix_model.dart';
import '../../../core/theme/app_theme/app_theme_interface.dart';
import '../../../widgets/app_button/app_button_widget.dart';

class OrderFinishPage extends StatefulWidget {
  const OrderFinishPage({ Key? key }) : super(key: key);

  @override
  _OrderFinishPageState createState() => _OrderFinishPageState();
}

class _OrderFinishPageState extends State<OrderFinishPage> {
  final PixModel pixData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final textStyles = Get.find<AppThemeInterface>().textStyles;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.logoCircle,
                  ),

                  const SizedBox(height: 16.0),

                  Text(
                    'Pedido realizado com sucesso!\nClique no botão abaixo para acesso ao QRCode do pix',
                    textAlign: TextAlign.center,
                    style: textStyles.heading5
                  ),

                  const SizedBox(height: 16.0),

                  SizedBox(
                    width: context.widthTransformer(reducedBy: 30.0),
                    child: AppButtonWidget(
                      child: const Text('Pix'),
                      backgroundColor: Colors.black,
                      onPressed: () => Get.toNamed(AppRoutes.orderPix, arguments: pixData)
                    ),
                  ),
                ]
              ),
            ),

            const SizedBox(height: 8.0),

            AppButtonWidget(
              child: const Text('Fechar'),
              onPressed: () => Get.offAllNamed(AppRoutes.home)
            ),
          ]
        ),
      )
    );
  }
}