class Chant {
  final int id;
  final int numPage;
  final   String title;
  final String parole;
  final  String voix1;
  final  String voix2;
  final  String voix3;
  final  String voix4;
  
  const Chant({
    required this.id,
    required this.numPage,
    required this.title,
    required this.parole,
    required this.voix1,
    required this.voix2,
    required this.voix3,
    required this.voix4,
  });


   Map<String, Object?> toMausique() {
    return {
      'id': id,
      'numpage': numPage,
      'title': title,
      'parole': parole,
      'voix1': voix1,
      'voix2': voix2,
      'voix3': voix3,
      'voix4': voix4,
    };
  }
}