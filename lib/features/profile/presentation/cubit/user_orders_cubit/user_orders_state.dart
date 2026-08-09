// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_orders_cubit.dart';

abstract class UserOrdersState extends Equatable {
  const UserOrdersState();

  @override
  List<Object> get props => [];
}

class UserOrdersInitial extends UserOrdersState {}
class UserOrdersLoading extends UserOrdersState {}
class UserOrdersSuccess extends UserOrdersState {
final  List<UserOrderEntity> userOrders;
  const UserOrdersSuccess({
    required this.userOrders,
  });
}
class UserOrdersFailure extends UserOrdersState {
  final String errMessage;

  const UserOrdersFailure({required this.errMessage});
  
}





