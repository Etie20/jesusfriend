import 'package:equatable/equatable.dart';

import '../../../domain/entities/plan.dart';

abstract class PlansState extends Equatable {

  const PlansState();

  @override
  List<Object> get props => [];
}

class PlansLoading extends PlansState {
  const PlansLoading();
}

class PlansLoaded extends PlansState {
  final List<dynamic> plans;

  const PlansLoaded({required this.plans});

  @override
  List<Object> get props => [plans];
}

class DailyContentLoaded extends PlansState {
  final dynamic dailyContent;

  const DailyContentLoaded({required this.dailyContent});

  @override
  List<Object> get props => [dailyContent];
}

class PlansError extends PlansState {
  final String error;

  const PlansError({required this.error});

  @override
  List<Object> get props => [error];
}