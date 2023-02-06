import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {}

class SearchRequest extends SearchEvent {
  final String text;

  SearchRequest({required this.text});

  @override
  List<Object?> get props => [];
}
