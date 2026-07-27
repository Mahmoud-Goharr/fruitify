import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruitify/core/repos/products_repo/products_repo.dart';
import 'package:fruitify/core/services/get_it_service.dart';
import 'package:fruitify/features/home/presentation/views/widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
      child: ProductsViewBody(),
    );
  }
}
