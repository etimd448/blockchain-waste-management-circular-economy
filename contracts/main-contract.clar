;; Main platform contract
(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-data-var platform-active bool true)
(define-map platform-users { user: principal } { active: bool })

(define-public (register-user)
  (begin
    (map-set platform-users { user: tx-sender } { active: true })
    (ok true)
  )
)

(define-read-only (is-user-active (user principal))
  (default-to false (get active (map-get? platform-users { user: user })))
)
