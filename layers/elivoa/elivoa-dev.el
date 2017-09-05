;;; package --- Summary
;;; Commentary:
;;;    Development config
;;;
;;; -*- coding: utf-8 -*-
;;; Time-stamp: <[elivoa-dev.el] Elivoa @ Friday, 2017-09-01 21:23:30>
;;; Code:

;;
;; Development configs
;; emable ede mode
;; (global-ede-mode 1)
;; (require 'semantic/sb)
;; (semantic-mode 1)


;;; --------------------------------------------------------------------
;; 注释：如果没有激活的区域，就注释/反注释当前行，仅当在行尾的时候才在行尾加注释。; use comment-line instead.
;;; --------------------------------------------------------------------
;; (defun smart-comment-line (&optional arg)
;;   "Add Comment. Comment current line or selected text. "
;;   (interactive "*P")
;;   (comment-normalize-vars)
;;   (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
;;       (comment-or-uncomment-region (line-beginning-position) (line-end-position))
;;     (comment-dwim arg)))
;; (global-set-key (kbd "M-;") 'smart-comment-line)
;; (global-set-key (kbd "s-/") 'smart-comment-line)
;; (global-set-key (kbd "s-/")  'comment-line) ; use this instead set in keys.
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; markdown mode -- add extensions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (autoload 'markdown-mode "markdown-mode"
;;   "Major mode for editing Markdown files" t)
;; (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))

;;; already in init-markdown.el
;; (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.mdown\\'" . markdown-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; html-mode don't show trailing whitespace
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook
 'html-mode-hook
 (lambda ()
   (setq show-trailing-whitespace nil)
   (set-fill-column 120)
   (flycheck-mode nil)
   ))

;; disable html mode s-k to jump to other window.
;; (require-package 'tagedit)
;; (after-load 'sgml-mode
;;  (define-key tagedit-mode-map (kbd "s-k") 'other-window)
;;  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; projectile
;; ** TODO -- need to redefine this.
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (projectile-global-mode)
;; (define-key projectile-mode-map [?\s-P] 'projectile-find-file-in-known-projects)
;; (define-key projectile-mode-map [?\s-p] 'projectile-find-file)

;;To enable Projectile only in select modes:
;;(add-hook 'ruby-mode-hook 'projectile-on)
;;(setq projectile-use-native-indexing t)
;;(setq projectile-enable-caching t)


;; yasnippet
;(yas-global-mode 1)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ORG mode -- see Purcell's config
;; TODO use org mode to edit files.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (setq org-export-with-sub-superscripts nil)
;; (setq org-export-with-sub-superscripts '{})

;; (global-set-key (kbd "C-c a") 'org-agenda)
;; (setq org-log-done t)
;; (setq org-todo-keywords
;;       '((sequence "TODO" "INPROGRESS" "DONE")))
;; (setq org-todo-keyword-faces
;;       '(("INPROGRESS" . (:foreground "blue" :weight bold))))
;; (setq org-agenda-files (list "~/Dropbox/org/groupon.org"))

;;; elivoa-dev.el ends here
(provide 'elivoa-dev)
