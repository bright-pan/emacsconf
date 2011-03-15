;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Brgiht Pan's dotemacs file
;;; Last modified time 
;;; Time-stamp: <Administrator 11/29/2010 10:09  >
;;; Life is a box of chocalates,
;;; you never know what you're gonna get.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


;;--------------------
;;   普通配置（UI）
;;--------------------

;; 标题栏，显示"buffer的名字@Emacs"
(setq frame-title-format "%b@Emacs")

;; 禁用启动信息
(setq inhibit-startup-message t)

;; 显示光标位置：
(setq column-number-mode t)
(setq line-number-mode t)

;; 设置kill-ring-max为200
(setq kill-ring-max 200)

;; 设置tab为8个空格的宽度，而不是原来的2
(setq c-basic-offset 4)
(setq tab-width 4)
(setq-default indent-tabs-mode nil)

;; 设置让光标指到某个括号与它匹配的括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; 禁用终端响铃
(setq visible-bell t)

;; 高亮显示选择区域
(setq transient-mark-mode t)

;; 显示日期时间
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
;(setq display-time-use-mail-icon t)
(setq display-time-interval 10)
(display-time)

;; 不产生备份文件
(setq make-backup-files nil)
;;不产生临时文件
(setq-default make-backup-files nil) 

;; 取消自动保存
(auto-save-mode 0)

;; 防止页面滚动时跳动
(setq scroll-margin 3
      scroll-conservatively 10000)

;; 'y' for 'yes', 'n' for 'no'
(fset 'yes-or-no-p 'y-or-n-p) 

;;显示默认的文档的宽度，看起来比较舒服？
(setq fill-column 80)

;;指针不要闪，我得眼睛花了
(blink-cursor-mode -1)
(transient-mark-mode 1)

;;当指针移到另一行，不要新增这一行？d
(setq next-line-add-newlines nil)

;;在文档最后自动插入空白一行，好像某些系统配置文件是需要这样的
(setq require-final-newline t)

;; 打开图片显示功能
(auto-image-file-mode t)

;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)

;;时间戳设置(time-stamp)，设定文档上次保存的信息
;;只要里在你得文档里有Time-stamp:的设置，就会自动保存时间戳
;;启用time-stamp
(setq time-stamp-active t)
;;去掉time-stamp的警告？
(setq time-stamp-warn-inactive t)
;;设置time-stamp的格式，我如下的格式所得的一个例子：<hans 05/18/2004 12:01:12>
(setq time-stamp-format "%:u %02m/%02d/%04y %02H:%02M%:02S")
;;将修改时间戳添加到保存文件的动作里。
(add-hook 'write-file-hooks 'time-stamp)


;;;;---------------- Global Hot Key ----------------------

;; F1:最大化当前buffer:
(global-set-key [(f1)] 'delete-other-windows)

;; F2：切换到dired模式
(global-set-key [(f2)] 'dired)

;; F3：切换到shell模式
(global-set-key [(f3)] 'shell)

;; F4:关闭buffer
(global-set-key [(f4)] 'kill-buffer-and-window)

;; 跳到另一个窗口
(global-set-key [(f6)] 'other-window)

;; F7：编译
(global-set-key [(f7)] 'compile)

;; F9:gdb
(global-set-key [(f9)] 'gdb)

;; F10: gdb:next
(global-set-key [(f10)] 'gud-next)

;; F11: gdb:step
(global-set-key [(f11)] 'gud-step)

