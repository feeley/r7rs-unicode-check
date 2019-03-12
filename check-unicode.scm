(define (hex n)
  (string-append
   "#x"
   (if (< n #x10000)
       (substring (number->string (+ n #x10000) 16) 1 5)
       (number->string n 16))))

(define (char c)
  (hex (char->integer c)))

(define (print-value x)
  (cond ((number? x)
         (display (hex x)))
        ((char? x)
         (display (char x)))
        ((pair? x)
         (let ((sep "("))
           (for-each
            (lambda (c) (display sep) (display (hex c)) (set! sep " "))
            x)
           (display ")")))
        (else
         (write x))))

(define (check code proc-name expected actual)
  (if (not (equal? expected actual))
      (begin
        (display (hex code))
        (display " ")
        (write proc-name)
        (display " should return ")
        (print-value expected)
        (display " but returned ")
        (print-value actual)
        (newline))))
        
(let ((port (open-input-file "expected-results.txt")))
  (let loop ()
    (let ((line (read port)))
      (if (not (eof-object? line))
          (let* ((code (list-ref line 0))
                 (c    (integer->char code))
                 (cws? (list-ref line 1))
                 (cn?  (list-ref line 2))
                 (dv   (list-ref line 3))
                 (ca?  (list-ref line 4))
                 (cuc? (list-ref line 5))
                 (cuc  (list-ref line 6))
                 (clc? (list-ref line 7))
                 (cdc  (list-ref line 8))
                 (cfc  (list-ref line 9))
                 (sfc  (list-ref line 10)))
            (check code 'char-whitespace? cws? (char-whitespace? c))
            (check code 'char-numeric?    cn?  (char-numeric? c))
;            (check code 'digit-value      dv   (digit-value c))
            (check code 'char-alphabetic? ca?  (char-alphabetic? c))
            (check code 'char-upper-case? cuc? (char-upper-case? c))
            (check code 'char-upcase      cuc  (char->integer (char-upcase c)))
            (check code 'char-lower-case? clc? (char-lower-case? c))
            (check code 'char-downcase    cdc  (char->integer (char-downcase c)))
            (check code 'char-foldcase    cfc  (char->integer (char-foldcase c)))
            (check code 'string-foldcase  sfc  (map char->integer (string->list (string-foldcase (string c)))))
            (loop))))))
