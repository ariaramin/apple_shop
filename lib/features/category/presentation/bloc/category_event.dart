import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {}

class CategoryRequest extends CategoryEvent {
  @override
  List<Object?> get props => [];
}
