import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:get/get.dart';

import 'shopping_cart_controller.dart';
import 'widgets/shopping_cart_field/shopping_cart_field_widget.dart';
import 'widgets/shopping_cart_tile/shopping_cart_tile_widget.dart';
import '../../core/constants/app_images.dart';
import '../../core/theme/app_theme/app_theme_interface.dart';
import '../../core/ui/vakinha_state.dart';
import '../../core/utils/formatter_utils.dart';
import '../../widgets/app_button/app_button_widget.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({ Key? key }) : super(key: key);

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends VakinhaState<ShoppingCartPage, ShoppingCartController> {
  final _formKey = GlobalKey<FormState>();
  late Worker _emptyWorker;

  @override
  void initState() {
    super.initState();
    _emptyWorker = ever(controller.isEmpty, (_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _emptyWorker.dispose();
    super.dispose();
  }

  _finishOrder() {
    _formKey.currentState!.save();
    controller.createOrder();
  }

  @override
  Widget build(BuildContext context) {
    final textStyles = Get.find<AppThemeInterface>().textStyles;

    if (controller.shoppingCartItems.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Carrinho', style: textStyles.heading3),
            const Text('Nenhum item foi adicionado ao carrinho'),
            
            SizedBox(height: context.heightTransformer(reducedBy: 90.0)),
            
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(AppImages.emptyCart, height: context.heightTransformer(reducedBy: 70)),
            )
          ]
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: () {
          controller.formIsValid = _formKey.currentState!.validate();
        },
        child: Column(
          children: [
            Row(
              children: [
                Text('Carrinho', style: textStyles.heading3),

                const SizedBox(width: 8.0),

                IconButton(
                  icon: const Icon(
                    Icons.delete_outline,
                    size: 28.0,
                    color: Colors.redAccent
                  ),
                  onPressed: controller.clear
                )
              ]
            ),

            Obx(() =>
              Column(
                children: controller.shoppingCartItems.map((shoppingCartItem) {
                  return ShoppingCartTileWidget(
                    label: shoppingCartItem.product.name,
                    price: shoppingCartItem.product.price,
                    quantity: shoppingCartItem.quantity,
                    onMinusPressed: () => controller.decrementItemQuantity(shoppingCartItem),
                    onPlusPressed: () => controller.incrementItemQuantity(shoppingCartItem),
                    calculateTotalPrice: true
                  );
                }).toList()
              )
            ),

            const SizedBox(height: 16.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: textStyles.heading6),
                Obx(() => 
                  Text(
                    FormatterUtils.formatCurrency(controller.totalPrice),
                    style: textStyles.heading6
                  )
                )
              ]
            ),

            const Divider(height: 32.0),

            ShoppingCartFieldWidget(
              label: 'Endereço de Entrega',
              hintText: 'Digite o endereço',
              onChanged: (value) => controller.address = value,
              validator: Validatorless.required('O endereço é obrigatório'),
            ),

            const SizedBox(height: 16.0),

            ShoppingCartFieldWidget(
              label: 'CPF',
              hintText: 'Digite o CPF',
              onChanged: (value) => controller.cpf = value,
              validator: Validatorless.multiple([
                Validatorless.required('O CPF é obrigatório'),
                Validatorless.cpf('CPF inválido')
              ]),
            ),

            const Divider(height: 32.0),

            Obx(() =>
              AppButtonWidget(
                child: const Text('Finalizar'),
                onPressed: controller.formIsValid
                  ? _finishOrder
                  : null
              )
            ),

            const SizedBox(height: 16.0)
          ]
        ),
      )
    );
  }
}