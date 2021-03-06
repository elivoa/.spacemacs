;;; package --- elivoa's emacs config
;;; Commentary:
;;;   Including basic key mapping
;;;
;; -*- coding: utf-8 -*-
;; Time-stamp: <[elivoa-key.el] Elivoa @ Friday, 2017-09-01 21:20:43>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; basic settings of Emacs.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Code:

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

;; File and buffers
(global-set-key (kbd "s-r")  'helm-recentf)
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

;; edit commands
(global-set-key (kbd "M-;") 'comment-line)
(global-set-key (kbd "s-/") 'comment-line)

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

;; Move form init.el
(global-set-key (kbd "M-n") 'hold-line-scroll-up)
(global-set-key (kbd "M-p") 'hold-line-scroll-down)
;; (global-set-key (kbd "M-n") 'cua-scroll-up)
;; (global-set-key (kbd "M-p") 'cua-scroll-down)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Key bindings for mac os x
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Basic Navigation & Edit
(global-set-key (kbd "s-<right>")  'move-end-of-line)
(global-set-key (kbd "s-<left>")  'move-beginning-of-line)
(global-set-key (kbd "s-<up>") 'beginning-of-buffer)
(global-set-key (kbd "s-<down>") 'end-of-buffer)

(global-set-key (kbd "s-]")  'next-multiframe-window)
(global-set-key (kbd "s-[")  'previous-multiframe-window)
(global-set-key (kbd "s-{")  'evil-prev-buffer)
(global-set-key (kbd "s-}")  'evil-next-buffer)

(global-set-key (kbd "C-;")  'avy-goto-char-timer)

;; Files & buffers
(global-set-key (kbd "s-o")  'ibuffer)
(global-set-key (kbd "s-e")  'helm-buffers-list)
(global-set-key (kbd "s-p")  'helm-projectile-find-file)
(global-set-key (kbd "s-P")  'helm-projectile-find-file-in-known-projects)

;; edit
(global-set-key (kbd "s-d")  'kill-whole-line)
;; (global-set-key (kbd "C-s-268632076")  'llll)
(global-set-key (kbd "s-L")  'kill-current-buffer)
;; (global-set-key (kbd [C-s-268632076])  'kill-current-buffer) ;; C-s-L; not work.



(provide 'elivoa-key)
;;; elivoa-key.el ends here
