import 'package:reference_parser/src/util/VerseEnum.dart';
import 'package:reference_parser/src/data/Librarian.dart';
import 'package:reference_parser/src/model/BibleReference.dart';

/// A bible reference that contains the book, chapter, and a single verse number.
///
/// When instantiated by the [Reference] class, this object usually refers to the
/// reference object's first or last verse.
class Verse extends BibleReference {
  /// The book, chapter, and verse number.
  ///
  /// The full book name of the reference in Book chapter:verse format
  @override
  final String reference;

  /// The chapter number this verse is within.
  final int chapter;

  /// The verse number this verse refers to within a chapter.
  final int verseNumber;

  /// [ReferenceType.VERSE].
  @override
  ReferenceType referenceType;

  /// Whether this verse is found within the bible.
  @override
  final bool isValid;
  Verse(String book, int chapter, int verseNumber)
      : reference = Librarian.createReferenceString(book, chapter, verseNumber),
        chapter = chapter,
        verseNumber = verseNumber,
        referenceType = ReferenceType.VERSE,
        isValid = Librarian.verifyVerse(book, chapter, verseNumber),
        super(book);
}
