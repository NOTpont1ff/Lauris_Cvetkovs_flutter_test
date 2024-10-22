import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/models/gif_model.dart';

void main() {
  group('GifModel', () {
    test('fromJson parses data correctly', () {
      final json = {
        'id': '1',
        'title': 'Test GIF',
        'images': {
          'fixed_height': {
            'url': 'https://test.com/gif1.gif'
          }
        },
        'username': 'test_user'
      };

      final gif = GifModel.fromJson(json);
      expect(gif.id, '1');
      expect(gif.title, 'Test GIF');
      expect(gif.url, 'https://test.com/gif1.gif');
      expect(gif.user, 'test_user');
    });

    test('fromJson handles missing username', () {
      final json = {
        'id': '1',
        'title': 'Test GIF',
        'images': {
          'fixed_height': {
            'url': 'https://test.com/gif1.gif'
          }
        },
      };

      final gif = GifModel.fromJson(json);
      expect(gif.user, 'Unknown');
    });
  });
}
