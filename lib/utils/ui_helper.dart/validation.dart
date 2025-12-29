String? validation(dynamic value) {
  if (value == null || value.trim().isEmpty) {
    return 'Title is required';
  }
  return null;
}
