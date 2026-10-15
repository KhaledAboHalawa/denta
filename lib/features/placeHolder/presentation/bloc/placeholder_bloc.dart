import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'placeholder_event.dart';
part 'placeholder_state.dart';

class PlaceholderBloc extends Bloc<PlaceholderEvent, PlaceholderState> {
  PlaceholderBloc() : super(PlaceholderInitial()) {
    on<PlaceholderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
