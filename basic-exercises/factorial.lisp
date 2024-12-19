(defun factorial (n)
  "Compute the factorial of a non-negative integer n."
  (if (<= n 1)
      1
      (* n (factorial (- n 1)))))

(defun main ()
  "Main function to compute the factorial of a number."
  (format t "Enter a non-negative integer: ")
  (let ((n (read)))
    (if (and (integerp n) (>= n 0))
        (format t "The factorial of ~A is ~A~%" n (factorial n))
        (format t "Please enter a valid non-negative integer.~%"))))

;; Call the main function
(main)
