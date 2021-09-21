
;;  (set global-visual-buffer-mode) ;; trying this, not sure if it's right


;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                          ("org" . "https://orgmode.org/elpa/")
                          ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)


(use-package auto-package-update
  :custom
  (auto-package-update-interval 7)                    ;; weekly, I guess?
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "06:00"))


;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)


(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))


;; Org mode

(defun p3s/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

(use-package org
  :pin org
  :commands (org-capture org-agenda)
  :hook (org-mode . p3s/org-mode-setup)
  :config

  (setq org-agenda-start-with-log-mode 1)
  (setq org-log-done 'time)
  (setq org-log-into-drawer 1)
  (setq org-agenda-files
  		'("~/Documents/OrgFiles/Tasks.org"
  		  "~/Documents/OrgFiles/Bills.org"
  		  "~/Documents/OrgFiles/Birthdays.org"))
  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-graph-column 60)
  (setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")))
  (setq org-refile-targets
  		'(("Archive.org" :maxlevel . 1)
  		  ("Tasks.org" :maxlevel . 1)))
  (advice-add 'org-refile :after 'org-save-all-org-buffers)
)
