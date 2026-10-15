part of 'placeholder_bloc.dart';

abstract class PlaceholderState extends Equatable {
  const PlaceholderState();  

  @override
  List<Object> get props => [];
}
class PlaceholderInitial extends PlaceholderState {}
