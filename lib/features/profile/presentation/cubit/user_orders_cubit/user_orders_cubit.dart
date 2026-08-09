
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruitify/features/profile/domain/entites/order_entity.dart';
import 'package:fruitify/features/profile/domain/repos/user_orders_repo.dart';
import 'package:fruitify/core/helper/get_user.dart';

part 'user_orders_state.dart';

class UserOrdersCubit extends Cubit<UserOrdersState> {
  UserOrdersCubit(this.userOrdersRepo) : super(UserOrdersInitial());
  final UserOrdersRepo userOrdersRepo;
  List<UserOrderEntity> userOrdersList = [];
  Future<void> getUserOrders() async {
    emit(UserOrdersLoading());
    final result = await userOrdersRepo.fetchUserOrder();
    result.fold(
      (failure) => emit(UserOrdersFailure(errMessage: failure.message)),
      (userOrders) {
        emit(UserOrdersSuccess(userOrders: userOrders));
        userOrdersList = userOrders.where((e)=>e.uId==getUser()!.uId).toList();
      },
    );
  }
}
