;; -*- lexical-binding: t;-*-

(defun wl-copy/make-process ()
  (make-process
   :name "wl-copy"
   :buffer nil
   :command '("wl-copy")
   :connection-type 'pipe))

(defun wl-copy/send-text (payload)
  (let ((wl-copy-process (wl-copy/make-process)))
    (process-send-string wl-copy-process payload)
    (process-send-eof wl-copy-process)))

(defun wl-copy/send-region ()
  (interactive)
  (let ((selection (buffer-substring (region-beginning) (region-end))))
    (wl-copy/send-text selection)))
