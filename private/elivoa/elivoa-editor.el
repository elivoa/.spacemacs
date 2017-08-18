;;; package --- elivoa-editor.el
;;; Commentary:
;;; -*- coding: utf-8 -*-
;;; Time-stamp: <[elivoa-editor.el] Elivoa @ Sunday, 2015-08-09 20:47:15>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Editor Configuration
;; Author: Bo Gao, elivoa@gmail.com
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Code:

(defalias 'eval- 'eval-region) ;; M-x eval
(defalias 'load- 'load-file) ;; M-x load

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Packaging system -- additional repositories.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "package")
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(set-fill-column 999999)

(setq package-archive-enable-alist '(("melpa" deft magit)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Override Purcell's Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; turn off global-whitespace-cleanup-mode, this mode will let .go
;; file becaume 8 space tab when save.
(global-whitespace-cleanup-mode 0)

;; override init-osx-keys
(when *is-a-mac*
  (setq mac-command-modifier 'super)
  (setq mac-option-modifier 'meta)
  (setq default-input-method "MacOSX")
  )

(setq-default cursor-type 'bar)

(setq echo-keystrokes 0.1)        ; 尽快显示按键序列
;; (mouse-avoidance-mode 'animate)   ; 光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线

;; indentation, tabs.
;; (setq tab-width 4
;;       indent-tabs-mode nil)

;; 鼠标设置, 不要跳屏
(setq scroll-margin 5
      scroll-conservatively 10000)

;; When a file actually ends, put empty line markers into the left hand side.
(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

;; 在fringe上显示一个小箭头指示当前buffer的边界
(setq-default indicate-buffer-boundaries 'left)

;; Set window title.
;; (when window-system
;;   (setq frame-title-format '(buffer-file-name "nmnn^o^ %f" ("%b"))))

;;(setq system-time-locale "C")
;; (setq global-hi-line-mode t) ;; 行高亮模式


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


(auto-image-file-mode)             ; 让 Emacs 可以直接打开和显示图片。
(defalias 'yes-or-no-p 'y-or-n-p)
;; (show-paren-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; scroll functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun hold-line-scroll-up()
  "Scroll the page with the cursor in the same line"
  (interactive)
  ;; move the cursor also
  (let ((tmp (current-column)))
    (scroll-up 18)
    (line-move-to-column tmp)
    ;; (forward-line -18)
    )
  )

(defun hold-line-scroll-down()
  "Scroll the page with the cursor in the same line"
  (interactive)
  ;; move the cursor also
  (let ((tmp (current-column)))
    (scroll-down 18)
    (line-move-to-column tmp)
    ;; (forward-line 18)
    )
  )

                                        ;(global-set-key (kbd "M-n") 'hold-line-scroll-up)
                                        ;(global-set-key (kbd "M-p") 'hold-line-scroll-down)
(global-set-key (kbd "M-n") 'cua-scroll-up)
(global-set-key (kbd "M-p") 'cua-scroll-down)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; window-number-mode, M-1 to select window.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;(require 'window-number)
                                        ;(window-number-mode 1)
                                        ;(window-number-meta-mode 1)


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


;; speedbar
;; (speedbar 1)
;; (require 'sr-speedbar)
;; (speedbar-add-supported-extension ".go")

(global-set-key (kbd "s-`")  'sr-speedbar-toggle)
(global-set-key (kbd "s-u")  'sr-speedbar-toggle)
(global-set-key (kbd "s-U")  'sr-speedbar-toggle)
;; (setq sr-speedbar-max-width 60
;;       sr-speedbar-width-x 60
;;       sr-speedbar-auto-refresh t
;;       )

;; _______________________________
(provide 'elivoa-editor)
;;; elivoa-editor.el ends here



;;; Require edit-server
(require 'edit-server)
(edit-server-start)


;; jsmode
(add-hook
 'js-mode-hook
 '(lambda ()
    (setq show-trailing-whitespace nil)))
