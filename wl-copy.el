;; -*- lexical-binding: t;-*-

(defun wl-copy/make-process ()
  (make-process
   :name "wl-copy"
   :buffer nil
   :command '("wl-copy")
   :connection-type 'pipe))

(defun wl-copy/send-region ()
  (interactive)
  (let ((wl-copy-process (wl-copy/make-process)))
    (process-send-region wl-copy-process (region-beginning) (region-end))
    (process-send-eof wl-copy-process)))

(provide 'wl-copy)
