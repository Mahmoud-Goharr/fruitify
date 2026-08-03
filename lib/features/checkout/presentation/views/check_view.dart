import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/core/helper/get_user.dart';
import 'package:fruitify/core/services/get_it_service.dart';
import 'package:fruitify/core/widgets/custom_appbar.dart';
import 'package:fruitify/features/checkout/domain/entites/order_entity.dart';
import 'package:fruitify/features/checkout/domain/entites/shipping_address_entity.dart';
import 'package:fruitify/features/checkout/presentation/manger/add_order_cubit/add_order_cubit.dart';
import 'package:fruitify/features/checkout/presentation/views/widgets/add_order_cubit_bloc_builder.dart';
import 'package:fruitify/features/checkout/presentation/views/widgets/check_view_body.dart';
import 'package:fruitify/features/home/domain/entites/cart_entity.dart';
import 'package:provider/provider.dart';
import '../../../../core/repos/orders_repo/orders_repo.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});

  static const routeName = 'check_view';
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderInputEntity orderEntity;

  @override
  void initState() {
    super.initState();
    orderEntity = OrderInputEntity(
      cartEntity: widget.cartEntity,
      uID: getUser()!.uID,
      shippingAddressEntity: ShippingAddressEntity(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt.get<OrdersRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(context, title: 'الشحن', showNotification: false),
        body: Provider.value(
          value: orderEntity,
          child: const AddOrderCubitBlocBuilder(child: CheckoutViewBody()),
        ),
      ),
    );
  }
}
