#lang racket/base

;; a
(define recursive-expt-machine
  (make-machine
   '(n b val continue)
   (list (list '- -) (list '= =) (list '* *))
   '(controller
     (assign continue (label expt-done))
     expt
     (test (op =) (reg n) (const 0))
     (branch (label base-case))
     (save continue)
     (assign continue (label after-expt))
     (assign n (op -) (reg n) (const 1))
     (goto (label expt))
     after-expt
     (restore continue)
     (assign val (op *) (reg b) (reg val))
     (goto (reg continue))
     base-case
     (assign val (const 1))
     (goto (reg continue))
     expt-done)))
(set-register-contents! recursive-expt-machine 'n 42)
;; 'done
(set-register-contents! recursive-expt-machine 'b 42)
;; 'done
(start recursive-expt-machine)
;; 'done
(get-register-contents recursive-expt-machine 'val)
;; 150130937545296572356771972164254457814047970568738777235893533016064

;; b
(define iterative-expt-machine
  (make-machine
   '(n b product)
   (list (list '- -) (list '= =) (list '* *))
   '(controller
     (assign product (const 1))
     expt
     (test (op =) (reg n) (const 0))
     (branch (label expt-done))
     (assign n (op -) (reg n) (const 1))
     (assign product (op *) (reg b) (reg product))
     (goto (label expt))
     expt-done)))
(set-register-contents! iterative-expt-machine 'n 42)
;; 'done
(set-register-contents! iterative-expt-machine 'b 42)
;; 'done
(start iterative-expt-machine)
;; 'done
(get-register-contents iterative-expt-machine 'product)
;; 150130937545296572356771972164254457814047970568738777235893533016064