import 'dart:convert';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart' as enc;
import 'package:encrypt/encrypt.dart';

class EncryptionUtils {
  static IV iv = IV.fromLength(16);
  static enc.Key key = enc.Key.fromSecureRandom(32);
  static Encrypter encrypter = Encrypter(AES(key));

  static String encryptAES(String text) {
    return encrypter.encrypt(text, iv: iv).base64;
  }

  static String decryptAES(String encrypted) {
    final Uint8List encryptedBytesWithSalt = base64.decode(encrypted);
    final Uint8List encryptedBytes = encryptedBytesWithSalt.sublist(
      0,
      encryptedBytesWithSalt.length,
    );
    final String decrypted =
        encrypter.decrypt64(base64.encode(encryptedBytes), iv: iv);

    return decrypted;
  }
}
