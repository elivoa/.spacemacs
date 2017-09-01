;;; package --- elivoa-editor.el
;;; Commentary:
;;; -*- coding: utf-8 -*-
;;; Time-stamp: <[elivoa-editor.el] Elivoa @ Friday, 2017-09-01 01:12:07>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Editor Configuration
;; Author: Bo Gao, elivoa@gmail.com
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Code:

(setq user-full-name "Bo GAO")
(setq user-mail-address "elivoa@gmail.com")

;; (setq-default default-directory "~")

;; Set frame size
(setq default-frame-alist '((height . 78) (width . 238)))
(setq ns-pop-up-frames nil)
(setq inhibit-startup-screen t) ;隐藏启动显示画面

(blink-cursor-mode 0)

(defalias 'eval- 'eval-region) ;; M-x eval
(defalias 'load- 'load-file) ;; M-x load

;; (set-fill-column 999999)

(setq kill-ring-max 800)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Packaging system -- additional repositories.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "package")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Spacemacs Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq powerline-default-separator 'slant)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Override Purcell's Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; turn off global-whitespace-cleanup-mode, this mode will let .go
;; file becaume 8 space tab when save.
;; (global-whitespace-cleanup-mode 0)

(setq-default cursor-type 'bar)
(setq cursor-type 'bar)
(setq-default indicate-buffer-boundaries 'left) ; 在fringe上显示一个小箭头指示当前buffer的边界

(setq echo-keystrokes 0.1)        ; 尽快显示按键序列
;; (mouse-avoidance-mode 'animate)   ; 光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线

;; indentation, tabs.
;; (setq tab-width 4
;;       indent-tabs-mode nil)

;; 鼠标设置, 不要跳屏
(setq redisplay-dont-pause t
      scroll-margin 4
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

(defun smooth-scroll (increment)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.06)
  (scroll-up increment))

(global-set-key [(mouse-5)] '(lambda () (interactive) (smooth-scroll 1)))
(global-set-key [(mouse-4)] '(lambda () (interactive) (smooth-scroll -1)))

;; When a file actually ends, put emlpty line markers into the left hand side.
(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

;; Set window title.
(when window-system
  (setq frame-title-format '(buffer-file-name "[ nnmn^o^  %I] %f" ("%b") )))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Idea from Eclipse's format code: indent-region
;; @TODO: if selected indent selection otherwise indent buffer.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun indent-buffer ()
  "Indent the whole buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))


(global-set-key (kbd "s-F") 'indent-buffer)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Config auto-backup locations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq backup-directory-alist `(("." . "~/.backups")))
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;;;;;;;;;;;;;;;;;;
;; Recent files
;;;;;;;;;;;;;;;;;;
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Time-stamp configure
;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'write-file-hooks 'time-stamp)
(setq time-stamp-format                 ; format of the stamp
      ;; use describe-variable for info
      "[%f] Elivoa @ %:a, %:y-%02m-%02d %02H:%02M:%02S"
      time-stamp-active t               ; update time-stamps
      time-stamp-warn-inactive t)       ; warn if unable

;;;;;;;;;;;;;;;;;;;;;;;;;
;; about the clickboard
;;;;;;;;;;;;;;;;;;;;;;;;;

;; There are some behaviors in Emacs that are not very intuitive.
;; Since I pair with others that don't know how Emacs handles
;; highlighting, treat regions like other editors. This....

(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; scroll functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun hold-line-scroll-up()
  "Scroll the page with the cursor in the same line"
  (interactive)
  ;; move the cursor also
  (let ((tmp (current-column)))
    (scroll-up 8)
    (line-move-to-column tmp)
    ;; (forward-line -18)
    )
  )

(defun hold-line-scroll-down()
  "Scroll the page with the cursor in the same line"
  (interactive)
  ;; move the cursor also
  (let ((tmp (current-column)))
    (scroll-down 8)
    (line-move-to-column tmp)
    ;; (forward-line 18)
    )
  )

;; (global-set-key (kbd "M-n") 'hold-line-scroll-up)
;; (global-set-key (kbd "M-p") 'hold-line-scroll-down)
(global-set-key (kbd "M-n") 'cua-scroll-up)
(global-set-key (kbd "M-p") 'cua-scroll-down)



;; _______________________________
(provide 'elivoa-editor)

;;; elivoa-editor.el ends here
