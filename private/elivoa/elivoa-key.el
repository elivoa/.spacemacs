;;; package --- elivoa's emacs config
;;; Commentary:
;;;   Including basic key mapping
;;;
;; -*- coding: utf-8 -*-
;; Time-stamp: <[elivoa-key.el] Elivoa @ Thursday, 2017-01-05 11:12:23>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; basic settings of Emacs.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Code:

(setq user-full-name "Bo GAO")
(setq user-mail-address "elivoa@gmail.com")


;; The first thing is set frame size
;; (setq default-frame-alist '((height . 72) (width . 112)))
(setq default-frame-alist '((height . 78) (width . 112)))

;; (setq-default default-directory "~")

(blink-cursor-mode 0)

(setq ns-pop-up-frames nil)

;; (setq default-major-mode 'text-mode) ; default major mode


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Key bindings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Basic Navigation & Edit
(global-set-key (kbd "s-<right>")  'move-end-of-line)
(global-set-key (kbd "s-<left>")  'move-beginning-of-line)
(global-set-key (kbd "s-d")  'kill-whole-line)
;; (global-set-key (kbd "s-j")  'backward-kill-word)

(global-set-key (kbd "s-<up>") 'beginning-of-buffer)
(global-set-key (kbd "s-<down>") 'end-of-buffer)

;; Navigate between buffers and frames
(global-set-key (kbd "s-]")  'next-buffer)
(global-set-key (kbd "s-[")  'previous-buffer)
(global-set-key (kbd "s-{")  'ns-prev-frame)
(global-set-key (kbd "s-}")  'ns-next-frame)
(global-set-key (kbd "C-s-<268632091>")  'ns-prev-frame);; c-s-[
(global-set-key (kbd "C-s-<268632093>")  'ns-next-frame);; c-s-]

;; (global-set-key (kbd "s-<escape>")  'ns-next-frame)
;; (global-set-key (kbd "s-1")  'ns-prev-frame)

(global-set-key (kbd "s-e")  'ido-switch-buffer) ; C-x e
(global-set-key (kbd "s-R")  'ido-switch-buffer) ; C-x e
;;(global-set-key (kbd "s-R")  'ido-switch-buffer-other-frame) ; C-x e
(global-set-key (kbd "s-o")  'ibuffer)

;; It's strange for key C-s-j and C-s-k and C-s-l in mac.
(global-set-key (kbd "C-s-<268632074>") 'previous-buffer)
(global-set-key (kbd "C-s-<268632075>") 'next-buffer)
;; (global-set-key (kbd "C-s-<268632076>") 'kill-this-buffer) ; C-s-l;; not works 2016-03-17
(global-set-key (kbd "C-s-<268632076>") 'kill-this-buffer) ; C-s-l;;

;; C-s-o
(global-set-key (kbd "C-s-<268632079>") 'mouse-buffer-menu) ; C-s-l

(global-set-key (kbd "C-s-j")  'previous-multiframe-window)
(global-set-key (kbd "C-s-k")  'next-multiframe-window)
(global-set-key (kbd "s-k")  'other-window)
(global-set-key (kbd "s-K") 'ns-next-frame)

;; edit commands
(global-set-key (kbd "M-n") 'cua-scroll-up)
(global-set-key (kbd "M-p") 'cua-scroll-down)

;; window / frames
(global-set-key (kbd "C-s-1")  'delete-other-windows)
(global-set-key (kbd "C-s-2")  'split-window-below)
(global-set-key (kbd "C-s-3")  'split-window-right)

;; undo redo
(global-set-key (kbd "s-Z")  'undo-tree-redo)

;; disable s
;; (global-set-key (kbd "s-S")  'move-beginning-of-line)
(global-set-key (kbd "M-<left>")  'backward-word)
(global-set-key (kbd "M-<right>")  'forward-word)

;; md
(global-set-key (kbd "M-<up>") 'md/move-lines-up)
(global-set-key (kbd "M-<down>") 'md/move-lines-down)
(global-set-key (kbd "M-s-<up>")  'md/duplicate-up)
(global-set-key (kbd "M-s-<down>")  'md/duplicate-down)

(provide 'elivoa-key)
;;; elivoa-key.el ends here
