(define (twoOperatorCalculator operation)
    (if (null? operation) 0
        (if (equal? '+ (car operation)) (twoOperatorCalculator(cdr operation))
            (if (equal? '- (car operation)) 
                (twoOperatorCalculator(cons (-(cadr operation)) (cddr operation)))
                (+ (car operation)
                (twoOperatorCalculator (cdr operation))))
        )
    )
)

(define (fourOperatorCalculator operation)
    (if (null? (cdr operation)) operation
        (if (equal? '/ (cadr operation)) (fourOperatorCalculator (cons (/ (car operation) (caddr operation)) (cdddr operation)))
            (if (equal? '* (cadr operation)) (fourOperatorCalculator (cons (* (car operation) (caddr operation)) (cdddr operation)))
                (cons (car operation) (fourOperatorCalculator (cdr operation)))
            )
        )
    )
)

(define (NestedOp operations)
    (if (pair? operations) (twoOperatorCalculator(fourOperatorCalculator (calculatorNested operations)))
    operations)
)

(define (calculatorNested operation)
    (map NestedOp operation)
)


(define (checkOperators operation)
    (if (null? operation)
        #f
        (if (number? operation) #f
            (if (and (number? (car operation)) (null? (cdr operation)))
                #t
                (if (and (pair? (car operation)) (null? (cdr operation)))
                    (checkOperators (car operation))
                    (if (and (number? (car operation)) (or (equal? '- (cadr operation)) (equal? '+ (cadr operation)) (equal? '/ (cadr operation)) (equal? '* (cadr operation))))
                        (checkOperators (cddr operation))
                        (if (and (pair? (car operation))   (or (equal? '- (cadr operation)) (equal? '+ (cadr operation)) (equal? '/ (cadr operation)) (equal? '* (cadr operation))))
                        (and (checkOperators (car operation)) (checkOperators (cddr operation)))
                            #f
                        )
                    )
                )
            )
        )
    )
)

(define (calculator operation)
    (if (checkOperators operation)
        (twoOperatorCalculator (fourOperatorCalculator (calculatorNested operation))) #f
    )
)
 