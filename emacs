;;emacs configuration file

;;emacs package repos
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("90edd91338ebfdfcd52ecd4025f1c7f731aced4c9c49ed28cfbebb3a3654840b" default)))
 '(menu-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;Using anaconda to create a python 'ide'
(add-hook 'python-mode-hook 'anaconda-mode)

(load-theme 'cyberpunk t)


(setq rcirc-default-nick "Nick")
(setq rcirc-server-alist
      '(("irc.rizon.net" :port 6697 :encryption tls
	:nick "Nick"
        :full-name "Name"
	:channels ("#Channels"))))
(setq rcirc-authinfo '(("freenode" nickserv "nick" "password")))

;;Put the name in the top
(add-hook 'rcirc-mode-hook #'(lambda
                 (&rest ignore) () (setq header-line-format
					 mode-line-format) (setq mode-line-format " ")))
(eval-after-load 'rcirc
  '(defun-rcirc-command reconnect (arg)
     "Reconnect the server process."
     (interactive "i")
     (unless process
       (error "There's no process for this target"))
     (let* ((server (car (process-contact process)))
            (port (process-contact process :service))
            (nick (rcirc-nick process))
            channels query-buffers)
       (dolist (buf (buffer-list))
         (with-current-buffer buf
           (when (eq process (rcirc-buffer-process))
             (remove-hook 'change-major-mode-hook
                          'rcirc-change-major-mode-hook)
             (if (rcirc-channel-p rcirc-target)
                 (setq channels (cons rcirc-target channels))
               (setq query-buffers (cons buf query-buffers))))))
       (delete-process process)
       (rcirc-connect server port nick
                      rcirc-default-user-name
                      rcirc-default-full-name
                      channels))))

(eval-after-load 'rcirc '(require 'rcirc-notify))
(eval-after-load 'rcirc '(rcirc-notify-add-hooks))
