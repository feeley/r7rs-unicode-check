# r7rs-unicode-check
Scheme program to check R7RS conformance of the Unicode character related procedures

Simply run the program ```check-unicode.scm``` to get a list of the
situations where the result of a character related procedure is
different from the correct result.

Chibi Scheme:

```
% chibi-scheme -e '(load "check-unicode.scm")' | head -30
#x0085 char-whitespace? should return #t but returned #f
#x00a0 char-foldcase should return #x00a0 but returned #x0020
#x00a0 string-foldcase should return (#x00a0) but returned (#x0020)
#x00aa char-foldcase should return #x00aa but returned #x0061
#x00aa string-foldcase should return (#x00aa) but returned (#x0061)
#x00b2 char-foldcase should return #x00b2 but returned #x0032
#x00b2 string-foldcase should return (#x00b2) but returned (#x0032)
#x00b3 char-foldcase should return #x00b3 but returned #x0033
#x00b3 string-foldcase should return (#x00b3) but returned (#x0033)
#x00b9 char-foldcase should return #x00b9 but returned #x0031
#x00b9 string-foldcase should return (#x00b9) but returned (#x0031)
#x00ba char-foldcase should return #x00ba but returned #x006f
#x00ba string-foldcase should return (#x00ba) but returned (#x006f)
#x00df char-upcase should return #x00df but returned #x1e9e
#x0130 char-foldcase should return #x0130 but returned #x0069
#x0149 string-foldcase should return (#x02bc #x006e) but returned (#x0149)
#x01f0 string-foldcase should return (#x006a #x030c) but returned (#x01f0)
#x02b0 char-foldcase should return #x02b0 but returned #x0068
#x02b0 string-foldcase should return (#x02b0) but returned (#x0068)
#x02b1 char-foldcase should return #x02b1 but returned #x0266
#x02b1 string-foldcase should return (#x02b1) but returned (#x0266)
#x02b2 char-foldcase should return #x02b2 but returned #x006a
#x02b2 string-foldcase should return (#x02b2) but returned (#x006a)
#x02b3 char-foldcase should return #x02b3 but returned #x0072
#x02b3 string-foldcase should return (#x02b3) but returned (#x0072)
#x02b4 char-foldcase should return #x02b4 but returned #x0279
#x02b4 string-foldcase should return (#x02b4) but returned (#x0279)
#x02b5 char-foldcase should return #x02b5 but returned #x027b
#x02b5 string-foldcase should return (#x02b5) but returned (#x027b)
#x02b6 char-foldcase should return #x02b6 but returned #x0281
```

Chez Scheme:

```
% scheme --script check-unicode.scm | head -30
#x00B2 char-numeric? should return #f but returned #t
#x00B3 char-numeric? should return #f but returned #t
#x00B9 char-numeric? should return #f but returned #t
#x00BC char-numeric? should return #f but returned #t
#x00BD char-numeric? should return #f but returned #t
#x00BE char-numeric? should return #f but returned #t
#x026A char-upcase should return #xA7AE but returned #x026A
#x029D char-upcase should return #xA7B2 but returned #x029D
#x0560 char-alphabetic? should return #t but returned #f
#x0560 char-lower-case? should return #t but returned #f
#x0588 char-alphabetic? should return #t but returned #f
#x0588 char-lower-case? should return #t but returned #f
#x05EF char-alphabetic? should return #t but returned #f
#x0860 char-alphabetic? should return #t but returned #f
#x0861 char-alphabetic? should return #t but returned #f
#x0862 char-alphabetic? should return #t but returned #f
#x0863 char-alphabetic? should return #t but returned #f
#x0864 char-alphabetic? should return #t but returned #f
#x0865 char-alphabetic? should return #t but returned #f
#x0866 char-alphabetic? should return #t but returned #f
#x0867 char-alphabetic? should return #t but returned #f
#x0868 char-alphabetic? should return #t but returned #f
#x0869 char-alphabetic? should return #t but returned #f
#x086A char-alphabetic? should return #t but returned #f
#x08B3 char-alphabetic? should return #t but returned #f
#x08B4 char-alphabetic? should return #t but returned #f
#x08B6 char-alphabetic? should return #t but returned #f
#x08B7 char-alphabetic? should return #t but returned #f
#x08B8 char-alphabetic? should return #t but returned #f
#x08B9 char-alphabetic? should return #t but returned #f
```

Larceny:

```
% ~/larceny/larceny-1.3-bin-native-ia32-macosx/larceny < check-unicode.scm | head -40
Larceny v1.3 "Grain Alcohol and Rainwater" (Aug  6 2017 02:03:34, precise:Posix:unified)
larceny.heap, built on Sun Aug  6 02:04:40 EDT 2017

> hex

> char

> print-value

> check

> #x00d7 char-downcase should return #x00d7 but returned #x00f7
#x00d7 char-foldcase should return #x00d7 but returned #x00f7
#x00d7 string-foldcase should return (#x00d7) but returned (#x00f7)
#x00f7 char-upcase should return #x00f7 but returned #x00d7
#x0130 char-foldcase should return #x0130 but returned #x0069
#x026a char-upcase should return #xa7ae but returned #x026a
#x029d char-upcase should return #xa7b2 but returned #x029d
#x0560 char-alphabetic? should return #t but returned #f
#x0560 char-lower-case? should return #t but returned #f
#x0588 char-alphabetic? should return #t but returned #f
#x0588 char-lower-case? should return #t but returned #f
#x05ef char-alphabetic? should return #t but returned #f
#x0860 char-alphabetic? should return #t but returned #f
#x0861 char-alphabetic? should return #t but returned #f
#x0862 char-alphabetic? should return #t but returned #f
#x0863 char-alphabetic? should return #t but returned #f
#x0864 char-alphabetic? should return #t but returned #f
#x0865 char-alphabetic? should return #t but returned #f
#x0866 char-alphabetic? should return #t but returned #f
#x0867 char-alphabetic? should return #t but returned #f
#x0868 char-alphabetic? should return #t but returned #f
#x0869 char-alphabetic? should return #t but returned #f
#x086a char-alphabetic? should return #t but returned #f
#x08b3 char-alphabetic? should return #t but returned #f
#x08b4 char-alphabetic? should return #t but returned #f
#x08b6 char-alphabetic? should return #t but returned #f
#x08b7 char-alphabetic? should return #t but returned #f
#x08b8 char-alphabetic? should return #t but returned #f
#x08b9 char-alphabetic? should return #t but returned #f
```
