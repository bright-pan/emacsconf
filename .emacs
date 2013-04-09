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
(column-number-mode t) 
;;显示括号匹配
(show-paren-mode t) 
;;不要生成临时文件
(setq-default make-backup-files nil)
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
;                   Auto-Complete
;================================================
(add-to-list 'load-path (concat elget-dir "auto-complete-yasnippet"))
(require 'auto-complete-yasnippet)
(add-to-list 'load-path (concat elget-dir "auto-complete"))
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat elget-dir "auto-complete/ac-dict"))

(require 'auto-complete-clang)
    
(setq ac-auto-start nil)
(setq ac-quick-help-delay 0.5)
;; (ac-set-trigger-key "TAB")
;; (define-key ac-mode-map  [(control tab)] 'auto-complete)
(define-key ac-mode-map  [(meta /)] 'auto-complete)
(defun my-ac-config ()
  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  ;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))
(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
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
  (list "/usr/local/gcc-arm-none-eabi-4_7-2013q1/arm-none-eabi/include/c++/4.7.3"
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
(defun my-c-mode-common-hook()
  (c-set-style "k&r") ;;设置C语言默认格式
  (setq tab-width 4 indent-tabs-mode nil)  
  ;;按键定义
  (define-key c-mode-base-map [(return)] 'newline-and-indent)
  ;;预处理设置  
  (setq abbrev-mode t)  
)

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(add-hook 'c++-mode-common-hook(lambda()(c-set-style "k&r"))) ;;设置C++语言默认格式

;================================================
;                  color theme
;================================================
(add-to-list 'load-path (concat elget-dir "color-theme"))

(require 'color-theme)
(color-theme-euphoria)

;================================================
;                  color theme
;================================================
(add-to-list 'load-path (concat elget-dir "cmake-mode"))
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
		("\\.cmake\\'" . cmake-mode))
	      auto-mode-alist))
