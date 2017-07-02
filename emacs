;; Emacs Configuration File
;; Bryan Hernandez Ruiz -- Bheru27

;;emacs package repos
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

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

(setq c-basic-offset 4)

;;Python Mode
(autoload 'python-mode "python-mode" "Python editing mode." t)
    (setq auto-mode-alist
           (cons '("\\.py$" . python-mode) auto-mode-alist))
     (setq interpreter-mode-alist
           (cons '("python" . python-mode) interpreter-mode-alist))

