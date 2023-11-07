import 'package:equatable/equatable.dart';

abstract class PlansEvent extends Equatable{
  const PlansEvent();

  @override
  List<Object> get props => [];
}

class GetPlans extends PlansEvent {
  const GetPlans();
}

class GetDailyContent extends PlansEvent {
  final int planId;

  const GetDailyContent({required this.planId});

  @override
  List<Object> get props => [planId];
}