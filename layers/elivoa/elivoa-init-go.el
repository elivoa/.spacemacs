;;; package --- go IDE config
;;; Commentary:
;;;
;; -*- coding: utf-8 -*-
;; Time-stamp: <[elivoa-init-go.el] Elivoa @ Monday, 2014-07-21 18:06:18>
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Go Mode Config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;p

;;; load go-mode
;;(require 'go-mode-load) ;; stable version
;;(require 'go-mode-load)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto-complete for go
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; go auto-complete
(require 'auto-complete)
(add-to-list 'ac-modes 'go-mode)
(require 'go-autocomplete)
(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)
;;(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;;; fmt before
;; (add-hook 'before-save-hook 'gofmt-before-save)

;; flymake-go
(eval-after-load "go-mode"
  '(require 'flymake-go))

;; goflycheck
;; (add-to-list 'load-path "~/develop/github.com/gopkg/src/github.com/dougm/goflymake")
;; (require 'go-flymake)
;; (require 'go-flycheck)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; go-eldoc mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'go-eldoc)
;; (add-hook 'go-mode-hook 'go-eldoc-setup)

(add-hook
 'go-mode-hook
 '(lambda ()

    ;; Go specific key bindings.
    (local-set-key (kbd "s-F") 'gofmt)         ; format buffer
    (local-set-key (kbd "s-r") 'go)            ;; run buffer
    (local-set-key (kbd "s-C") 'go-fix-buffer) ;;
    (local-set-key (kbd "s-O") 'go-remove-unused-imports) ;;
    (local-set-key (kbd "s-i") 'go-import-add)            ;;
    (local-set-key (kbd "M-.") 'godef-jump)               ;;
    (local-set-key (kbd "M->") 'godef-jump-other-window)  ;;

    ;; enable go-eldoc mode
    (go-eldoc-setup)

    ;; Other
    (setq show-trailing-whitespace nil)
    (setq default-tab-width 4)
    (setq tab-width 4)
    (setq indent-tabs-mode 1)

    ;; gocode
    (auto-complete-mode 1)
    (setq ac-sources '(ac-source-go))

    ;; Imenu & Speedbar
    (setq imenu-generic-expression
          '(("type" "^type *\\([^ \t\n\r\f]*\\)" 1)
            ("func" "^func *\\(.*\\) {" 1)))
    (imenu-add-to-menubar "Index")

    ;; Outline mode

    ;; Level 3: //.  use this to devide the file into major sections
    ;; Level 4: //   followed by at least two characters
    ;; Level 4: package
    ;; Level 4: import
    ;; Level 4: const
    ;; Level 4: var  followed by at least one character
    ;; Level 4: type
    ;; Level 4: func
    ;; Level 5 and above: tab-indented lines with at least five characters
    (make-local-variable 'outline-regexp)
    (setq outline-regexp "//\\.\\|//[^\r\n\f][^\r\n\f]\\|pack\\|func\\|impo\\|cons\\|var[^\r\n\f]\\|type\\|\t\t*[^\r\n\f]\\{4\\}")
    (outline-minor-mode 1)
    (local-set-key "\M-a" 'outline-previous-visible-heading)
    (local-set-key "\M-e" 'outline-next-visible-heading)

    ;; Menu bar
    (require 'easymenu)
    (defconst go-hooked-menu
      '("Go tools"
        ["Go run buffer" go t]
        ["Go reformat buffer" go-fmt-buffer t]
        ["Go check buffer" go-fix-buffer t]))
    (easy-menu-define
      go-added-menu
      (current-local-map)
      "Go tools"
      go-hooked-menu)
    )
 )

;; Run go
(defun go ()
  "Run current buffer."
  (interactive)
  (compile (concat "go run " (buffer-file-name))))


;; (add-hook 'outline-mode-hook
;;           (lambda ()
;;             (require 'outline-cycle)))

;; (add-hook 'outline-minor-mode-hook
;;           (lambda ()
;;             (require 'outline-magic)
;;             (define-key outline-minor-mode-map [(f10)] 'outline-cycle)))


;; Format source
;; BUG: will clear window configuration. TODO: debug to fix this?
;; (defun go-fmt-buffer ()
;;   "run gofmt on current buffer"
;;   (interactive)
;;   (if buffer-read-only
;;       (progn
;;         (ding)
;;         (message "Buffer is read only"))
;;     (let ((p (line-number-at-pos))
;;           (filename (buffer-file-name))
;;           (old-max-mini-window-height max-mini-window-height))
;;       (show-all)
;;       (if (get-buffer "*Go Reformat Errors*")
;;           (progn
;;             (delete-windows-on "*Go Reformat Errors*")
;;             (kill-buffer "*Go Reformat Errors*")))
;;       (setq max-mini-window-height 1)
;;       (if (= 0 (shell-command-on-region (point-min) (point-max) "gofmt" "*Go Reformat Output*" nil "*Go Reformat Errors*" t))
;;           (progn
;;             (erase-buffer)
;;             (insert-buffer-substring "*Go Reformat Output*")
;;             (goto-char (point-min))
;;             (forward-line (1- p)))
;;         (with-current-buffer "*Go Reformat Errors*"
;;           (progn
;;             (goto-char (point-min))
;;             (while (re-search-forward "<standard input>" nil t)
;;               (replace-match filename))
;;             (goto-char (point-min))
;;             (compilation-mode))))
;;       (setq max-mini-window-height old-max-mini-window-height)
;;       (delete-windows-on "*Go Reformat Output*")
;;       (kill-buffer "*Go Reformat Output*")
;;       )))

;; (defun go-fix-buffer ()
;;   "Run gofix on current buffer."
;;   (interactive)
;;   (show-all)
;;   (shell-command-on-region (point-min) (point-max) "go tool fix -diff"))


;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; deprecated
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; this should be in go-mode-hook, whtat did this lines do?
;; copied semantic key
;; (local-set-key (kbd "M-/") 'semantic-complete-analyze-inline)
;; (local-set-key "." 'semantic-complete-self-insert)
;; (local-set-key ">" 'semantic-complete-self-insert)

(provide 'elivoa-init-go)
;;; elivoa-init-go.el ends here
