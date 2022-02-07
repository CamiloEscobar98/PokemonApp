class PokemonList {
  final String name;
  final String url;
  final String image;
  PokemonList({required this.name, required this.url, required this.image});

  factory PokemonList.fromJSON(Map<String, dynamic> json) {
    return PokemonList(
        name: json['name'], url: json['url'], image: json['image_url']);
  }
}
