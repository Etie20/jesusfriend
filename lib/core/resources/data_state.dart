abstract class DataState<T> {
  final List<dynamic> ? data;
  final String ? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(List<dynamic> data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(String error) : super(error: error);
}