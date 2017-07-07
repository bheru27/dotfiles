;; Emacs Configuration File
;; Bryan Hernandez Ruiz -- Bheru27

(require 'package)
;;emacs package repos
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;;Install packages if not installed 

(unless (package-installed-p 'alchemist)
  (package-refresh-contents) 
  (package-install 'alchemist))
(unless (package-installed-p 'alect-themes)
  (package-install 'alect-themes))

;; Themes
(load-theme 'alect-black t)

;; Remove toolbar and menu bar

(menu-bar-mode -1)
(tool-bar-mode -1)



;;Change emacs autosave files to another directory.

(defconst emacs-tmp-dir (format "%s/%s/%s" (getenv "HOME") ".emacs.d" "auto-save"))
(unless (file-directory-p emacs-tmp-dir)
  (make-directory emacs-tmp-dir))

(setq backup-directory-alist
      `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,emacs-tmp-dir t)))

;;Change emacs fonts, I use Source code Pro so it needs to be installed.

(add-to-list 'default-frame-alist '(font .  "Source Code Pro Semibold" ))
(set-face-attribute 'default t :font  "Source Code Pro Semibold")


;;;;;;;;;; Org Mode ;;;;;;;;;;;;;;;;
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;;;;;;;;;;; Programming Configuration ;;;;;;;;;;;;




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (alect-themes alchemist))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
