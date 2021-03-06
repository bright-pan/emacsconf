;================================================
;              global configure
;================================================
(setq user-full-name "Bright Pan")
(setq user-mail-address "loststriker@gmail.com") 
;================================================
;             edit and file coding
;================================================
(create-fontset-from-fontset-spec
 (concat
  "-*-courier-medium-r-normal-*-14-*-*-*-*-*-fontset-courier,"
  "chinese-gb2312:-*-simsun-medium-r-*-*-14-*-*-*-c-*-gb2312*-*,"
  "mule-unicode-0100-24ff:-*-simsun-medium-r-*-*-14-*-*-*-c-*-iso10646*-*,"
  "korean-ksc5601:-*-*-medium-r-*-*-14-*-*-*-*-*-ksc5601*-*,"
  "chinese-cns11643-5:-*-simsun-medium-r-*-*-14-*-*-*-c-*-gbk*-*,"
  "chinese-cns11643-6:-*-simsun-medium-r-*-*-14-*-*-*-c-*-gbk*-*,"
  "chinese-cns11643-7:-*-simsun-medium-r-*-*-14-*-*-*-c-*-gbk*-*,"
  "sjis:-*-medium-r-normal--14-*-jisx0208*-*"))

(set-frame-font "fontset-courier")
(setq kill-ring-max 1024)
(windmove-default-keybindings 'M)
;;Emacs分割窗口快速切换
(column-number-mode t) 
;;显示括号匹配
(show-paren-mode t) 
;;不要生成临时文件
(setq-default make-backup-files nil)
;; 取消自动保存
(auto-save-mode 0)
;; 'y' for 'yes', 'n' for 'no'
(fset 'yes-or-no-p 'y-or-n-p) 
;; 隐藏滚动条
(scroll-bar-mode -1)
;;支持emacs和外部程序的拷贝粘贴
(setq x-select-enable-clipboard t) 
;;设置中文语言环境
(set-language-environment 'utf-8)
;;写文件的编码方式
(set-buffer-file-coding-system 'utf-8)
;;新建文件的编码方式
(setq buffer-file-coding-system 'utf-8)
;;终端方式的编码方式
(set-terminal-coding-system 'utf-8)
;;键盘输入的编码方式
(set-keyboard-coding-system 'utf-8)
;;读取或写入文件名的编码方式
(setq file-name-coding-system 'utf-8)

;================================================
;                   el-get
;================================================
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
(el-get 'sync)

(defconst elget-dir "~/.emacs.d/el-get/")
;================================================
;                  YASnippet
;================================================
(add-to-list 'load-path (concat elget-dir "yasnippet"))
(require 'yasnippet)
(yas-global-mode 1)
;================================================
;                  YASnippet
;================================================
(add-to-list 'load-path (concat elget-dir "xgtags"))
(require 'xgtags)

;================================================
;                   Auto-Complete
;================================================
(add-to-list 'load-path (concat elget-dir "auto-complete-yasnippet"))
(require 'auto-complete-yasnippet)
(add-to-list 'load-path (concat elget-dir "auto-complete"))
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat elget-dir "auto-complete/ac-dict"))

(require 'auto-complete-clang)

(require 'auto-complete-config)
(ac-config-default)

;; Show 0.8 second later
(setq ac-auto-show-menu 0.8)
(setq ac-auto-start nil)
(setq ac-menu-height 20)
(set-face-background 'ac-candidate-face "lightgray")
(set-face-underline-p 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue")
;(add-hook 'c++-mode (lambda () (add-to-list 'ac-sources 'ac-source-semantic)))
;; (ac-set-trigger-key "TAB")
;; (define-key ac-mode-map  [(control tab)] 'auto-complete)
(define-key ac-mode-map  [(meta /)] 'auto-complete)
;;(define-key ac-mode-map [(control n)] 'ac-next)
;;(define-key ac-mode-map [(control p)] 'ac-previous)
(setq ac-use-menu-map t)
;; Default settings
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

(defun my-ac-config ()
  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  ;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))
(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet ac-source-semantic ac-source-gtags) ac-sources)))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;; ac-source-gtags
(my-ac-config)


;(defconst user-include-dirs 
;  (list "/usr/include"
;	"/usr/local/include"  
;	"/usr/lib/gcc/x86_64-redhat-linux/4.7.2/include"
;	"/usr/lib/gcc/x86_64-redhat-linux/4.7.2/../../../../include/c++/4.7.2"
;	"/usr/lib/gcc/x86_64-redhat-linux/4.7.2/../../../../include/c++/4.7.2/x86_64-redhat-linux"
;	"/usr/lib/gcc/x86_64-redhat-linux/4.7.2/../../../../include/c++/4.7.2/backward"
;	))


(defconst user-include-dirs 
  (list "."
	"/home/bright/smart-lock/RT-Thread/components/drivers/include/drivers"
	"/home/bright/smart-lock/RT-Thread/components/drivers/include"
	"/home/bright/smart-lock"
	"/home/bright/smart-lock/RT-Thread"
	"/home/bright/smart-lock/RT-Thread/include"
	"/home/bright/smart-lock/RT-Thread/libcpu/arm/common"
	"/home/bright/smart-lock/RT-Thread/libcpu/arm/cortex-m3"
	"/home/bright/smart-lock/RT-Thread/components/finsh"
	"/home/bright/smart-lock/RT-Thread/components/libc/minilibc"
	"/home/bright/smart-lock/RT-Thread/components/CMSIS/Include"
	"/home/bright/smart-lock/Libraries/CMSIS/CM3/DeviceSupport/ST/STM32F10x"
	"/home/bright/smart-lock/Libraries/STM32F10x_StdPeriph_Driver/inc"
	"/home/bright/smart-lock/RT-Thread/components/libc/minilibc"
	"/usr/local/gcc-arm-none-eabi-4_7-2013q1/arm-none-eabi/include/c++/4.7.3"
	"/usr/local/gcc-arm-none-eabi-4_7-2013q1/arm-none-eabi/include/c++/4.7.3/arm-none-eabi"  
	"/usr/local/gcc-arm-none-eabi-4_7-2013q1/arm-none-eabi/include/c++/4.7.3/backward"
	"/usr/local/gcc-arm-none-eabi-4_7-2013q1/lib/gcc/arm-none-eabi/4.7.3/include"
	"/usr/local/gcc-arm-none-eabi-4_7-2013q1/lib/gcc/arm-none-eabi/4.7.3/include-fixed"
	"/usr/local/gcc-arm-none-eabi-4_7-2013q1/arm-none-eabi/include"
	))
(setq ac-clang-flags 
      (mapcar (lambda (item)(concat "-I" item)) 
	      user-include-dirs)) 
;================================================
;                   linum+
;================================================

(add-to-list 'load-path (concat elget-dir "linum+"))

(require 'linum+)
(global-linum-mode 1)
;================================================
;                   c/c++
;================================================

(add-to-list 'load-path elget-dir)
(require 'google-c-style)

(add-hook 'c-mode-common-hook 'google-set-c-style)

(defun ac-complete-semantic-self-insert (arg)
    (interactive "p")
    (self-insert-command arg)
    (ac-complete-semantic))

(defun my-c-mode-common-hook()
  (semantic-mode 1)

  (setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
				    global-semanticdb-minor-mode
				    global-semantic-idle-summary-mode
				    global-semantic-mru-bookmark-mode))

  (defconst cedet-include-dirs
    (list ".." "../include" "../inc" "../common" "../public"
	  "../.." "../../include" "../../inc" "../../common" "../../public"))
  (defconst sys-include-dirs
    (list "C:/MinGW/include"
	  "C:/MinGW/include/c++/3.4.5"
	  "C:/MinGW/include/c++/3.4.5/mingw32"
	  "C:/MinGW/include/c++/3.4.5/backward"
	  "C:/MinGW/lib/gcc/mingw32/3.4.5/include"
	  "C:/Program Files/Microsoft Visual Studio/VC98/MFC/Include"))
  (let ((include-dirs cedet-include-dirs))
    (when (eq system-type 'windows-nt)
      (setq include-dirs (append include-dirs sys-include-dirs)))
    (setq include-dirs (append include-dirs user-include-dirs))
    (mapc (lambda (dir)
	    (semantic-add-system-include dir 'c++-mode)
	    (semantic-add-system-include dir 'c-mode))
	  include-dirs))

  (define-key c-mode-base-map [(return)] 'newline-and-indent)
  (define-key c-mode-base-map [(f7)] 'compile)
  (local-set-key "." 'ac-complete-semantic-self-insert)
  (local-set-key ">" 'ac-complete-semantic-self-insert)
  (xgtags-mode 1)
)
;;   (semantic-mode 1)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
;(add-hook 'c++-mode-common-hook(lambda()(c-set-style "k&r"))) ;;设置C++语言默认格式
;================================================
;                  color theme
;================================================
(add-to-list 'load-path (concat elget-dir "xcscope"))
(require 'xcscope)
(setq cscope-do-not-update-database t)
;================================================
;                  color theme
;================================================
(add-to-list 'load-path (concat elget-dir "color-theme"))

(require 'color-theme)
(color-theme-euphoria)
;================================================
;                  color theme
;================================================
(add-to-list 'load-path (concat elget-dir "cl-lib"))

(require 'cl-lib)

;================================================
;                  magit
;================================================
(add-to-list 'load-path (concat elget-dir "magit"))

(require 'magit)


;================================================
;                  stardict
;================================================
(add-to-list 'load-path (concat elget-dir "stardict"))

(require 'stardict)

;================================================
;                  stardict
;================================================
(add-to-list 'load-path (concat elget-dir "org-mode/lisp"))

(require 'org)

;================================================
;                  color theme
;================================================
(add-to-list 'load-path (concat elget-dir "cmake-mode"))
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
		("\\.cmake\\'" . cmake-mode))
	      auto-mode-alist))
;================================================
;                  color theme
;================================================
(add-to-list 'load-path (concat elget-dir "markdown-mode"))
(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
