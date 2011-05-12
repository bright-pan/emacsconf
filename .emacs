;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Filename:      .emacs
;; Version:       
;;                
;; Author:        Bright Pan <loststriker@gmail.com>
;; Created at:    Mon Mar 28 19:45:44 2011
;;                
;;                
;; Modified by:   Bright Pan <loststriker@gmail.com>
;; Modified at:   Thu May 12 09:33:12 2011
;;                
;; Description:   
;; Copyright (C) 2010-2011,  Bright Pan
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;**********************	basic setting	*********************

;;Load_path
(add-to-list 'load-path' "~/.emacs.d/plugins")

;;todo_path
(setq todo-file-do "~/emacs/todo/do")
(setq todo-file-done "~/emacs/todo/done")
(setq todo-file-top "~/emacs/todo/top")

;;Personal information
(setq user-full-name "Bright Pan")
(setq user-mail-address "loststriker@gmail.com") 




;;======================	time setting		=====================
;;时间显示设置
;;启用时间显示设置，在minibuffer上面的那个杠上（忘了叫什么来着）
(display-time-mode 1)
;;时间使用24小时制
(setq display-time-24hr-format t)
;;时间显示包括日期和具体时间
(setq display-time-day-and-date t)
;;时间栏旁边启用邮件设置
(setq display-time-use-mail-icon t)
;;时间的变化频率，单位多少来着？
(setq display-time-interval 10)
;;显示时间，格式如下
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t) 
;;----------------------	END	time setting	---------------------

;;======================	color setting		=====================
;; 指针颜色设置为白色
;;(set-cursor-color "white")
;; 鼠标颜色设置为白色
;;(set-mouse-color "white")
;; 设置背景颜色和字体颜色
;;(set-foreground-color "white")
;;(set-background-color "darkblue")
;; 设置另外一些颜色：语法高亮显示的背景和主题，区域选择的背景和主题，二次选择的背景和选择
(set-face-foreground 'highlight "white")
(set-face-background 'highlight "blue")
(set-face-foreground 'region "cyan")
(set-face-background 'region "blue")
(set-face-foreground 'secondary-selection "skyblue")
(set-face-background 'secondary-selection "darkblue")
;;设置日历的一些颜色
(setq calendar-load-hook
'(lambda ()
(set-face-foreground 'diary-face "skyblue")
(set-face-background 'holiday-face "slate blue")
(set-face-foreground 'holiday-face "white")))

;;----------------------	END	color setting	---------------------




;;Font


;;不要生成临时文件

(setq-default make-backup-files nil)

;;设置中文语言环境
(set-language-environment 'utf-8)

;;写文件的编码方式
(set-buffer-file-coding-system 'utf-8)

;;新建文件的编码方式
(setq default-buffer-file-coding-system 'utf-8)

;;终端方式的编码方式
(set-terminal-coding-system 'utf-8)

;;键盘输入的编码方式
(set-keyboard-coding-system 'utf-8)

;;读取或写入文件名的编码方式
(setq file-name-coding-system 'utf-8) 


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

;;打开就启用 text 模式
(setq default-major-mode 'text-mode)

;;禁用启动信息
(setq inhibit-startup-message t) 


;;语法高亮
(global-font-lock-mode t) 


;;打开图片显示功能
;;(auto-image-file-mode t) 
    
;;以 y/n 替代 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;;显示行列号
(column-number-mode t) 
    
;;显示括号匹配
(show-paren-mode t) 

;;隐藏工具栏
;;(tool-bar-mode nil) 


;; 隐藏滚动条。实际上再本机上的emacs-2.23是没有这个模式的。
(scroll-bar-mode nil) 
;;去掉工具栏
;;(tool-bar-mode nil)
;;去掉菜单栏，我将F10绑定为显示菜单栏，万一什么东西忘了，需要菜单栏了可以摁F10调出，再摁F10就去掉菜单
(menu-bar-mode nil)


;;光标靠近鼠标指针时，让鼠标指针自动让开
;;(mouse-avoidance-mode 'animate) 
    
;;不要在鼠标光标出插入
;;(setq mouse-yank-at-point t) 
    
;;高亮显示选中的区域
(transient-mark-mode t) 
    
;;支持emacs和外部程序的拷贝粘贴
(setq x-select-enable-clipboard t) 
    
;;在标题栏提示当前位置
(setq frame-title-format "Fiona@%b")


;;显示80列就换行
(setq default-fill-column 80) 

;;禁止终端响铃
(setq visiable-bell t) 
    
;;设置tab为4个空格的宽度
(setq default-tab-width 4)



;;时间戳设置(time-stamp)，设定文档上次保存的信息
;;只要里在你得文档里有Time-stamp:的设置，就会自动保存时间戳
;;启用time-stamp
(setq time-stamp-active t)
;;去掉time-stamp的警告？
(setq time-stamp-warn-inactive t)
;;设置time-stamp的格式，我如下的格式所得的一个例子：<hans 05/18/2004 12:01:12>
(setq time-stamp-format "%:u %02m/%02d/%04y %02H02M02S")
;;将修改时间戳添加到保存文件的动作里。
(add-hook 'write-file-hooks 'time-stamp)

;;在文档最后自动插入空白一行，好像某些系统配置文件是需要这样的
(setq require-final-newline t)
(setq track-eol t)

;;使用C-k删掉指针到改行末的所有东西
(setq-default kill-whole-line t)

;;设定删除保存记录为200，可以方便以后无限恢复
(setq kill-ring-max 200)

;;增大使用查找函数和变量的寻找范围
(setq apropos-do-all t)

;;是用aspell程序作为Emacs的拼写检查成学
(setq-default ispell-program-name "aspell")

;;使用narrow功能时的一个设置
(put 'narrow-to-region 'disabled nil)

;;启动Emacs自动设置为两个窗口(上下各一个)
;;(split-window-vertically)

;;改变emacs标题栏的标题
;;(setq frame-title-format "%b@vj.org")

;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)

;;功能是将当前行设为本页第一行，同终端下的clear命令有点相似
(defun line-to-top-of-window () 
"Move the line point is on to top of window." 
(interactive) 
(recenter 0)) 


;;======================		Chinese setting        =====================   
(setq gnus-default-charset 'cn-gb-2312
gnus-group-name-charset-group-alist '((".*" . gb2312))
gnus-summary-show-article-charset-alist '((1 . cn-gb-2312) (2 . big5) (3 . chinese-gbk) (4 . utf-8))
gnus-newsgroup-ignored-charsets '(unknown-8bit x-unknown iso-8859-1)
gnus-group-posting-charset-alist '((".*" gb2312 (gb2312))))
(define-coding-system-alias 'gb18030 'gb2312)
;;----------------------		End Chinese setting		---------------------

;;窗口设置
(gnus-add-configuration '(article (vertical 1.0 (summary .35 point) (article1.0))))

;;Group Buffer设置
;;自动进入Topic-mode
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;;Sumarry Buffer设置
(setq gnus-summary-line-format ":%U%R %B %s %-60=|%4L |%-20,20f |%&user-date; \n")



;;Article Buffer设置
;;设定要显示的头消息格式
(setq gnus-visible-headers
"^\\(^To:\\|^CC:\\|^From:\\|^Subject:\\|^Date:\\|^Followup-To:
\\|^X-Newsreader:\\|^User-Agent:\\|^X-Mailer:
\\|Line:\\|Lines:\\|Content-Type:\\|NNTP-Posting-Host\\)")

;;自动断行，每行80个字符
;;(add-hook 'message-mode-hook (lambda ()
;;(setq fill-column 80)
;;(turn-on-auto-fill)))




;;======================	字体解码优先顺序         =====================;
;;从王垠那拷过来的，不用怎么再改吧。
;;(setq font-encoding-alist
;;(append '(("MuleTibetan-0" (tibetan . 0))
;;("GB2312" (chinese-gb2312 . 0))
;;("JISX0208" (japanese-jisx0208 . 0))
;;("JISX0212" (japanese-jisx0212 . 0))
;;("VISCII" (vietnamese-viscii-lower . 0))
;;("KSC5601" (korean-ksc5601 . 0))
;;("MuleArabic-0" (arabic-digit . 0))
;;("MuleArabic-1" (arabic-1-column . 0))
;;("MuleArabic-2" (arabic-2-column . 0))) font-encoding-alist))
;;----------------------	字体解码优先顺序		---------------------       

;;鼠标滚轮，默认的滚动太快，这里改为3行
(defun up-slightly () (interactive) (scroll-up 3))
(defun down-slightly () (interactive) (scroll-down 3))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)


;;约会提醒
(setq appt-issue-message t)



;;**********************    	全局按键设定		*********************       
;;设置[f1]为goto-line   
;;(global-set-key [f1] 'info)
(global-set-key [f1] 'goto-line)
(global-set-key [f2] 'eshell)
(global-set-key [f3] 'shell)
(global-set-key [f4] 'kill-this-buffer)
;;[f11] define to maximise present window
;;习惯设置，打开／关闭菜单
(global-set-key [f12] 'menu-bar-mode)


;;移动光标设置
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end]  'end-of-buffer)

;;切换buffer的设置
(global-set-key [(control o)] 'other-window)
(global-set-key [(control tab)] 'tabbar-forward)



;;**********************		常用编程配置		*********************


;;热键设置
(global-set-key [f5] 'compile)
(global-set-key [f6] 'speedbar)
(global-set-key [f7] 'gdb)
(global-set-key [f8] 'previous-error)
(global-set-key [f9] 'next-error)
;;启动窗口gdb
(global-set-key [f10] 'gdb-many-windows)



;;(global-set-key [f9] 'delete-window);F9 关闭d当前窗口
;;(global-set-key [f8] 'other-window);F8窗口间跳转
;;(global-set-key [(f2)] 'ansi-term);F2 切换到shell模式
;;(global-set-key [f3] 'split-window-vertically);F3分割窗口
;;(global-set-key [f12] 'my-fullscreen);F12 全屏
;;(global-set-key [(f4)] 'compile);编译
;;(global-set-key [f5] 'gdb);启动gdb
;;(global-set-key [(f6)] 'gdb-many-windows);启动窗口gdb
;;(global-set-key [f1] 'goto-line);设置M-g为goto-line
;;(global-set-key [f7] 'other-frame);跳到其它窗格
;;(global-set-key [(f3)] 'speedbar);打开speedbar


;;======================            自动补全功能          =====================
;;自动补全功能，这事从王垠的网站直接Copy过来的，引用一些他对此的说明
;;设置以下 hippie-expand 的补全方式。它是一个优先列表， hippie-expand 会优先使用表最前面
;;的函数来补全这是说，首先使用当前的buffer补全，如果找不到，就到别的可见的窗口里寻找，如
;;还找不到，那么到所有打开的buffer去找，如果还……那么到kill-ring里，到文件名，到简称列表
;;里，到list，当前使用的匹配方式会在 echo 区域显示。
;;特别有意思的是 try-expand-line，它可以帮你补全整整一行文字。我很多时后有两行文字大致相
;;同，只有几个字不一样，但是我懒得去拷贝粘贴以下。那么我就输入这行文字的前面几个字。然后
;;多按几下 M-/ 就能得到那一行。
(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list
'(try-expand-line
try-expand-line-all-buffers
try-expand-list
try-expand-list-all-buffers
try-expand-dabbrev
try-expand-dabbrev-visible
try-expand-dabbrev-all-buffers
try-expand-dabbrev-from-kill
try-complete-file-name
try-complete-file-name-partially
try-complete-lisp-symbol
try-complete-lisp-symbol-partially
try-expand-whole-kill))

;;hippie的自动补齐策略，优先调用了senator的分析结果：
(autoload 'senator-try-expand-semantic "senator")
;;----------------------            End 自动补全		---------------------       

;;**********************			常用编程插件		*********************


;;======================			auto-header			=====================
(add-to-list 'load-path "~/.emacs.d/plugins/")
;;加载auto-header.el文件,自动添加文件头
(require 'auto-header)
;; 设置文件头中的姓名
(setq header-full-name "Bright Pan")
;; 设置邮箱
(setq header-email-address "loststriker@gmail.com")

;; 设置每次保存时要更新的项目
(setq header-update-on-save
    '(  filename
        modified
        counter
        copyright))
;; 设置文件头的显示格式
(setq header-field-list
'(  filename  ;;文件名
    version
    blank     ;空行，下同
    author    ;作者
    created   ;创建人
    blank
    blank
    modified_by ;更改者
	modified
    blank
	description   ;描述
	copyright ;版权

    ;;status  ;状态，是否发布
    ;;更新
    ;;blank
  ))
;;----------------------		END	auto-header			---------------------
;;======================			Load cscope				=====================
;(add-to-list 'load-path "~/.emacs.d/plugins/cscope-15.7a/contrib/xcscope")
(require 'xcscope)
;;(setq cscope-do-not-update-database t)
;;先M-x !，然后cscope -b，之后就可以在源代码中进行跳转了。命令见cscope菜单
;;这里有篇讲怎么在emacs下安装和使用cscope的：
;;http://ann77.stu.cdut.edu.cn/EmacsCscope.html
;;----------------------		  	END	cscop				---------------------





;;======================			Load color-theme			=====================
;;配色方案
;(load-file "~/dos/emacs/color-theme.el")
(require 'color-theme)
;(add-hook 'c-mode-common-hook 'color-theme-taylor)
;(add-hook 'c++-mode-common-hook 'color-theme-taylor)
(color-theme-taylor)

;;----------------------			END	color-theme			---------------------





;;======================			`Load gdb-many-window			=====================
;;gdb-many-window
;;这个功能插件可以使emacs的调试界面像VC一样，有watch, stacktrace等窗口，真正实现图形化gdb.
;;在emacs中编译好程序，然后M-x gdb，连按两次ret，多窗口gdb就出来了
;;http://www.inet.net.nz/~nickrob/multi-gud.el
;;http://www.inet.net.nz/~nickrob/multi-gdb-ui.el

;(add-to-list 'load-path"~/.emacs.d/plugins")
;(setq gdb-many-windows t)
;(load-library "multi-gud.el")
;(load-library "multi-gdb-ui.el")
;;----------------------    			END	gdb-many-window			---------------------





;;======================			Load linum			 	=====================
;;调用linum.el(line number)来显示行号：
;;(add-to-list 'load-path"~/.emacs.d/plugins")
(require 'linum)
(global-linum-mode 1)
;;----------------------			END	linum				---------------------





;;======================			Load yasnippet				=====================
;;自动补全代码插件
;(add-to-list 'load-path"~/.emacs.d/plugins")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/")
;;----------------------			END	yasnippet			---------------------
