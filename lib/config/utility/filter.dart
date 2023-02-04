import 'package:equatable/equatable.dart';

class Filter extends Equatable {
  final String filterSequence;
  const Filter({
    required this.filterSequence,
  });

  @override
  List<Object?> get props => [];
}
