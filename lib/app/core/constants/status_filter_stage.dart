enum StatusFilterState {
  all('all'),
  missing('missing'),
  repeated('repeatd');
  final String value;
  const StatusFilterState(this.value);
}