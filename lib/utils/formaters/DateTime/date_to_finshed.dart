extension FlDateTime on DateTime {
  String tiempoRestante(DateTime fechaObjetivo) {
    final ahora = DateTime.now();
    final diferencia = fechaObjetivo.difference(ahora);

    if (diferencia.inDays > 0) {
      return "Finaliza en ${diferencia.inDays} día${diferencia.inDays > 1 ? 's' : ''}";
    } else if (diferencia.inHours > 0) {
      return "Finaliza en ${diferencia.inHours} hora${diferencia.inHours > 1 ? 's' : ''}";
    } else {
      return "Finaliza en ${diferencia.inDays.abs()} mes${diferencia.inDays.abs() > 1 ? 'es' : ''}";
    }
  }

  String timePassed() {
    final ahora = DateTime.now();
    final difference = ahora.difference(this);

    if (difference.inSeconds < 60) {
      return 'ahora';
    } else if (difference.inMinutes < 60) {
      return 'hace ${difference.inMinutes} minuto${difference.inMinutes > 1 ? 's' : ''}';
    } else if (difference.inHours < 24) {
      return 'hace ${difference.inHours} hora${difference.inHours > 1 ? 's' : ''}';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} día${difference.inDays > 1 ? 's' : ''} atrás';
    } else if (difference.inDays < 365) {
      final meses = (difference.inDays / 30).floor();
      return '$meses mes${meses > 1 ? 'es' : ''} atrás';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years año${years > 1 ? 's' : ''} atrás';
    }
  }
}
