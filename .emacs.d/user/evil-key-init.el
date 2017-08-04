;; evil-mode config

(defun my-move-key (keymap-from keymap-to key)
     "Moves key binding from one keymap to another, deleting from the old location. "
     (define-key keymap-to key (lookup-key keymap-from key))
     (define-key keymap-from key nil))
   (my-move-key evil-motion-state-map evil-normal-state-map (kbd "RET"))
   (my-move-key evil-motion-state-map evil-normal-state-map " ")

(defun make-conditional-key-translation (key-from key-to translate-keys-p)
     "Make a Key Translation such that if the translate-keys-p function returns true,
   key-from translates to key-to, else key-from translates to itself.  translate-keys-p
   takes key-from as an argument. "
     (define-key key-translation-map key-from
       (lambda (prompt)
         (if (funcall translate-keys-p key-from) key-to key-from))))
   (defun my-translate-keys-p (key-from)
     "Returns whether conditional key translations should be active.  See make-conditional-key-translation function. "
     (and
       ;; Only allow a non identity translation if we're beginning a Key Sequence.
       (equal key-from (this-command-keys))
       (or (evil-motion-state-p) (evil-normal-state-p) (evil-visual-state-p))))
;;   (define-key evil-normal-state-map "c" nil)
   (define-key evil-normal-state-map " " nil)
;;   (define-key evil-motion-state-map " n" 'negative-argument)
;;   (define-key evil-motion-state-map "cu" 'universal-argument)
;;   (make-conditional-key-translation (kbd "ch") (kbd "C-h") 'my-translate-keys-p)
;;   (make-conditional-key-translation (kbd "g") (kbd "C-x") 'my-translate-keys-p)
;;   (make-conditional-key-translation (kbd "cc") (kbd "C-c") 'my-translate-keys-p)

(key-chord-define evil-normal-state-map ",," 'evil-force-normal-state)
(key-chord-define evil-visual-state-map ",," 'evil-change-to-previous-state)
(key-chord-define evil-insert-state-map ",," 'evil-normal-state)
(key-chord-define evil-replace-state-map ",," 'evil-normal-state)

