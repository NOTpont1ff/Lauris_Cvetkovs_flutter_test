// models/gif_model.dart

// This class represents a GIF model
class GifModel {
  final String id;
  final String title;
  final String url;
  final String user; // Username of the uploader

  // Constructor for GifModel, requires id, title, url, and user
  GifModel({
    required this.id,
    required this.title,
    required this.url,
    required this.user,
  });

  // Factory method to create a GifModel from JSON data
  factory GifModel.fromJson(Map<String, dynamic> json) {
    return GifModel(
      id: json['id'], // Get the GIF ID from JSON
      title: json['title'], // Get the title from JSON
      url: json['images']['fixed_height']['url'], // Get the URL for the GIF image
      user: json['username'] ?? 'Unknown', // Get the uploader's username, fallback to 'Unknown' if empty
    );
  }
}
