String getFormattedDate() {
  DateTime now = DateTime.now();
  const List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  return '${now.day} ${months[now.month - 1]}';
}
