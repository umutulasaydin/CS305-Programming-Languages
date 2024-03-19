(define get-op (lambda (sym)
  (cond
    ((eq? sym '+) +)
    ((eq? sym '*) *)
    ((eq? sym '-) -)
    ((eq? sym '/) /)
    (else #f)
    )
))

(define get-value (lambda (variable env) (cond 
    ((null? environment) #f) ((eq? variable (caar env)) (cdar env))
    (else (get-value variable (cdr env)))
    )
))

(define ext-env (lambda (variable value old-environment)
    (cons (cons variable value) old-environment)
))

(define define-expr? (lambda (expr)
    (and (list? expr) (= (length expr) 3) 
    (eq? (car expr) 'define) (symbol?(cadr expr)))
))

(define if-expr? (lambda (expr)
    (and (list? expr) (= (length expr) 4) 
    (eq? (car expr) 'if))
))

(define let-expr? (lambda (expr)
    (if (and (list? expr) (= (length expr) 3) (eq? (car expr) 'let) 
    (if (eq? '() (cadr expr)) #t 
    (variable-binding-list? (cadr expr)))) #t #f)
))

(define control-list (lambda (rle lle) (cond 
      ((null? rle) #f) 
      ((and (list? rle) (= (length (car rle)) 2))
        (let ((smx? (lambda (sym seq) 
                      (cond
                        ((null? seq) #f) 
                        ((equal? (car seq) sym) #t)
                        (else (get-op? sym (cdr seq)))
                        )
                    )
                )
            )
          (if (get-op? (caar rle) lle) 
              #f 
              (control-list (cdr rle) (cons (caar rle) lle))
            )
        )
    )
      (else (control-list (cdr rle) (cons (caar rle) lle)))
)))

(define lambda-expr? (lambda (expr)
	(and (list? expr) (equal? (car expr) 'lambda) (= (length expr) 3))
))

(define operator? (lambda (op) (and
    (list? op) (not (null? op)) (if (equal? (let ((operator (get-op (car op)))) 
    (if operator #t #f)) #f) #f #t)
)))

(define variable-binding-list? (lambda (expr)
    (if (and (list? expr)  (= (length (car expr)) 2) 
    (list? (car expr)) (symbol? (caar expr)))
    (if (null? (cdr expr)) #t (variable-binding-list? (cdr expr))) #f)
))

(define get-element (lambda (rl ll) 
    (define is-element? (lambda (sym seq) (cond
        ((null? seq) #f) ((eq? (car seq) sym) #t)
        (else (is-element? sym (cdr seq)))
    )))
    (cond ((null? rl) #t)
    ((is-element? (caar rl) ll) #f)
    (else (get-element (cdr rl) (cons (caar rl) ll))))
))

(define s7 (lambda (expr env)

    (define every? (lambda (pred lst) (cond
        ((null? lst) #t) ((pred (car lst)) 
        (every? pred (cdr lst)))(else #f))
    ))

    (cond
        ((number? expr) expr)
        ((symbol? expr) 
        (let ((value (get-value expr env)))
        (cond
            ((not value)
            (let ((operator (get-op expr)))
                (if operator operator "ERROR")))
            ((lambda-expr? value) "#[compiled-procedure 0]") (else value)
        )))
        ((not (list? expr)) "ERROR")
        ((if-expr? expr) 
            (if (eq? (s7 (cadr expr) env) 0)
            (s7 (cadddr expr) env)
            (s7 (caddr expr) env)))
        ((let-expr? expr) 
            (let*
                ((vars (map s7 (map cadr (cadr expr)) 
                (make-list (length (map cadr (cadr expr))) env)))
                (new-env (append ( map cons (map car (cadr expr)) vars) env)))
                (s7 (caddr expr) new-env)))
        ((lambda-expr? expr) expr) ((lambda-expr? (car expr)) 
            (let ((new-env (append (map cons (cadar expr) (cdr expr)) env)))
			    (s7 (caddar expr) new-env)))
        ((lambda-expr? (get-value (car expr) env))
            (s7 (caddr (get-value (car expr) env)) 
            (append (map cons (cadr (get-value (car expr) env)) (cdr expr)) env)))
        ((operator? expr)
            (let ((operands (map s7 (cdr expr) (make-list (length (cdr expr)) env)))
                (operator (get-op (car expr))))
            (if (if (null? operands) #t (every? number? operands))
                (apply operator operands) "ERROR")))
        ((not (list? expr)) "ERROR")
        (else "ERROR")
    )
))

(define repl (lambda (env)
   (let* (
           (dummy1 (display "cs305> "))
           (expr (read))
           (new-env (if (define-expr? expr) 
                        (ext-env (cadr expr) (s7 (caddr expr) env) env)
                        env
                    ))
           (val (if (define-expr? expr)
                    (cadr expr)
                    (s7 expr env)
                ))
           (dummy2 (display "cs305: "))
           (dummy3 (display val))
           (dummy4 (newline))
           (dummy5 (newline)))
        (repl new-env))))

(define cs305 (lambda () (repl '())))
