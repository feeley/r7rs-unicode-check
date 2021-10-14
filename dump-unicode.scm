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

(define max-code-point #x10ffff)

(define (private-use-character? n)
  (or (and (>= n   #xe000) (<= n   #xf8ff))
      (and (>= n  #xf0000) (<= n  #xffffd))
      (and (>= n #x100000) (<= n #x10fffd))))

(define (noncharacter? n)
  (or (and (>= n #xfdd0) (<= n #xfdef))
      (and (= #xfff (modulo (quotient n 16) #x1000))
           (>= (modulo n 16) #xe))))

(define (for-each-code-point proc)
  (let loop ((i 0))
    (if (<= i max-code-point)
        (begin
          (proc i)
          (loop (+ i 1))))))

(define count 0)

(for-each-code-point (lambda (i)
                       (if (noncharacter? i)
                           (set! count (+ count 1)))))
                     

(println count)
(exit)

(let loop ((i 0))
  (if (< i 200000)
      (begin
        (if (or (< i #xd800) (> i #xdfff))
            (let ((c (integer->char i)))
              (display "(")
              (print-value i)
              (display " ")
              (print-value (char-whitespace? c))
              (display " ")
              (print-value (char-numeric? c))
              (display " ")
              (print-value (digit-value c))
              (display " ")
              (print-value (char-alphabetic? c))
              (display " ")
              (print-value (char-upper-case? c))
              (display " ")
              (print-value (char-upcase c))
              (display " ")
              (print-value (char-lower-case? c))
              (display " ")
              (print-value (char-downcase c))
              (display " ")
              (print-value (char-foldcase c))
              (display " ")
              (print-value (map char->integer
                                (string->list (string-downcase (string c)))))
              (display " ")
              (print-value (map char->integer
                                (string->list (string-upcase (string c)))))
              (display " ")
              (print-value (map char->integer
                                (string->list (string-foldcase (string c)))))
              (display ")\n")))
        (loop (+ i 1)))))
