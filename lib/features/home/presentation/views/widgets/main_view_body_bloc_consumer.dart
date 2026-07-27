import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruitify/features/home/presentation/views/widgets/main_view_body.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: const Row(
                  children: [
                    Icon(Icons.check_circle_outline, color: Colors.white),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'تمت العمليه بنجاح',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
                elevation: 8,
                margin: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                duration: Duration(seconds: 2),
              ),
            );
        }
      },
      child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
