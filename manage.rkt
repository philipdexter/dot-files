#!/usr/bin/env racket
#lang racket

(define (handle-file cd file)
    (system (string-append "ln -sf " cd file " ~/." file)))

(define (handle-dir cd file)
        (if (directory-exists? (string->path (string-append "~/." file)))
            (display (string-append " warning: " file " already exists - not linking"))
            (system (string-append "ln -sfT " cd file " ~/." file))))

(define (read-next-line-iter file handle)
    (let ((line (read-line file)))
        (unless (or (eof-object? line) (= 0 (string-length line)))
            (let ((cd (path->string (current-directory))))
                (display (string-append "moving: " line))
                (handle cd line))
            (newline)
            (read-next-line-iter file handle))))

(call-with-input-file "files"
    (lambda (file) (read-next-line-iter file handle-file)))
(call-with-input-file "dirs"
    (lambda (file) (read-next-line-iter file handle-dir)))
