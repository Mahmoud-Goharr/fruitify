import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/core/services/get_it_service.dart';
import 'package:fruitify/core/widgets/custom_appbar.dart';
import 'package:fruitify/features/profile/domain/repos/user_orders_repo.dart';
import 'package:fruitify/features/profile/presentation/cubit/user_orders_cubit/user_orders_cubit.dart';
import 'package:fruitify/features/profile/presentation/views/widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const routeName = 'Ordersview';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserOrdersCubit(getIt.get<UserOrdersRepo>()),
      child: Scaffold(
        appBar: customAppBar(
          context,
          title: 'طلباتي ',
          showNotification: false,
        ),
        body: OrdersViewBodyBuilder(),
      ),
    );
  }
}

class OrdersViewBodyBuilder extends StatefulWidget {
  const OrdersViewBodyBuilder({super.key});

  @override
  State<OrdersViewBodyBuilder> createState() => _OrdersViewBodyBuilderState();
}

class _OrdersViewBodyBuilderState extends State<OrdersViewBodyBuilder> {
  @override
  void initState() {
    context.read<UserOrdersCubit>().getUserOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserOrdersCubit, UserOrdersState>(
      builder: (context, state) {
        if (state is UserOrdersSuccess) {
          return OrdersViewBody(
            orders: context.read<UserOrdersCubit>().userOrdersList,
          );
        } else if (state is UserOrdersLoading) {
          return Center(child: CupertinoActivityIndicator());
        } else if (state is UserOrdersFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return Center(child: Text('No ordere put yet'));
        }
      },
    );
  }
}
