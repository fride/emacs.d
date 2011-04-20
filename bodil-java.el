;;; bodil-java.el -- Java configuration

;; CEDET/Malabar setup
(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                  global-semanticdb-minor-mode
                                  global-semantic-idle-summary-mode
                                  global-semantic-mru-bookmark-mode))
(semantic-mode 1)
(require 'malabar-mode)
(setq malabar-groovy-lib-dir "~/.emacs.d/site-lisp/malabar/lib")
(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

;; Make Malabar's autoimport behave more like Eclipse
(defun malabar-eclipse-import ()
  "Eclipse style import handling."
  (interactive)
  (malabar-import-all)
  (malabar-import-group-imports))
(global-set-key (kbd "C-c C-v z") 'malabar-eclipse-import)
(add-hook 'malabar-mode-hook
          (lambda () 
            (add-hook 'after-save-hook 'malabar-compile-file-silently
                      nil t)))
