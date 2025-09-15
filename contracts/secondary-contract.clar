;; Secondary platform contract  
(define-constant ERR-INVALID (err u200))
(define-data-var total-transactions uint u0)

(define-public (process-transaction)
  (begin
    (var-set total-transactions (+ (var-get total-transactions) u1))
    (ok (var-get total-transactions))
  )
)

(define-read-only (get-transaction-count)
  (var-get total-transactions)
)
