%% This is file 'texshawn.cls'
%% Shawn's personal template.
%% Compile: XeLatex
%% For more infomation:
%%
%% HOWTOs & Demo:
%%

%===========================================================================%
%->> Version
%===========================================================================%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\newcommand*\@iflatexlater{\@ifl@t@r\fmtversion}%
\@iflatexlater{2017/01/01}{}{%
  \ClassError{hitszthesis}{TeXLive/MikTex >= 2017 is required ...}{}%
}
\ProvidesClass{style/thesis_ug}
  [2020/03/30 v1.0
   My custom class]


%===========================================================================%
%->> Declare Options
%===========================================================================%
\DeclareOption{oneside}{%
  \PassOptionsToClass{oneside}{ctexbook}%
}
\DeclareOption{twoside}{%
  \PassOptionsToClass{twoside}{ctexbook}%
}
\DeclareOption{scheme=plain}{% enable plain writing style
  \PassOptionsToClass{scheme=plain}{ctexbook}%
}

%----- Handle non-implemented options
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{ctexbook}%
}

%----- Handle warning of fandol fonts
\PassOptionsToPackage{quiet}{xeCJK}

%----- Terminates all options processing
\ProcessOptions\relax%


%===========================================================================%
%->> LoadClass
%===========================================================================%
\LoadClass[a4paper,openany,UTF8,zihao=-4,scheme=plain]{ctexbook}
\@ifclasslater{ctexbook}{2017/01/01}{}{%
  \ClassError{texshawn}{ctex >= 2017/01/01 is required ...}{}%
}


%===========================================================================%
%->> If
%===========================================================================%


%===========================================================================%
%->> Load Packages
%===========================================================================%
\RequirePackage{ifxetex}    % LaTeX engine detection
\RequirePackage{listings}   % 设置代码环境
\RequirePackage{xcolor}     % 设置颜色
\RequirePackage{graphicx}   % 插入图片
\RequirePackage{array}      % 数组宏包
\RequirePackage{tabularx}   % 表格中的列格式设置
\RequirePackage{booktabs}   % 表格线宏包
\RequirePackage{longtable}  % 长表格宏包
\RequirePackage{subfig}     % 子浮动体宏包，包含|\caption|宏包
\RequirePackage{ulem}       % 自定义下划线
\RequirePackage{geometry}   % 页面布局
\RequirePackage{etoolbox}   % A toolbox of programming facilities
\RequirePackage{fancyhdr}   % 页眉设置
\RequirePackage{xcolor}     % 设置颜色
\RequirePackage{enumitem}   % 列表环境
\RequirePackage{mathptmx}   % 数学公式中的使用Times new romans
\RequirePackage{hyperref}   % 超链接
\RequirePackage{calc}       % 算术宏包
\RequirePackage{pdfpages}   % 插入PDF页面
\RequirePackage{style/gbt7714}  % 参考文献标准: GB/T 7714 (包含natbib宏包)
% ----- Font Warning
\RequirePackage[OT1]{fontenc}
\RequirePackage{fontspec}
\RequirePackage{xpatch}


%===========================================================================%
%->> Load Class Configuration
%===========================================================================%
\AtEndOfPackage{% class cfg loaded after package to make preamble commands take effect
  \makeatletter
  \InputIfFileExists{style/thesis_ug.cfg}{}{}
  \makeatother
}


%===========================================================================%
%->> Page Layout
%===========================================================================%
\geometry{
  a4paper, % 210 * 297mm
  hcentering,
  ignoreall,
  nomarginpar,
}
\geometry{% 版芯高度 = textheight(224) + head(5) + headsep(3) + footskip(8) = 240 mm
  text={150true mm,224true mm},
  top=37.5true mm,
  left=30true mm,
  head=5true mm,
  headsep=3true mm,
  footskip=8true mm,
  %foot=8true mm
}


%===========================================================================%
%->> Define Domain
%===========================================================================%
% ----- Clear Page
\let\hitsz@cleardoublepage\cleardoublepage
\newcommand{\hitsz@clearemptydoublepage}{%
  \clearpage{\pagestyle{fancy@empty}\hitsz@cleardoublepage}
}
\let\cleardoublepage\hitsz@clearemptydoublepage

% ----- Front Domain
% 关闭章节序号， 页码使用罗马数字;
\renewcommand\frontmatter{%
  \if@openright\hitsz@clearemptydoublepage\else\clearpage\fi
  \setcounter{secnumdepth}{-1}
  % \ctexset{chapter/numbering=false}
  \pagenumbering{Roman}
  \hitsz@pagestyle{fancy@main}
}

% ----- Main Domain
% 开启章节序号计数，重置页码，页码使用阿拉伯数字;
\renewcommand\mainmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \setcounter{secnumdepth}{3}
  \pagenumbering{arabic}
  \hitsz@pagestyle{fancy@main}
}

% ----- Appendix
% 重置章节序号计数， 章节序号使用字母，对页码没有影响；
\let\hitsz@appendix\appendix
\renewcommand{\appendix}{%
  \ctexset{%
    chapter/name={\appendixname},
    appendix/number=\Alph{chapter}
  }
  \hitsz@appendix
}


% ----- Back Domain
% 关闭章节序号，对页码没有影响；
\renewcommand\backmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \setcounter{secnumdepth}{3}
  \pagenumbering{arabic}
  \hitsz@pagestyle{fancy@main}
}


%===========================================================================%
%->> Font Settings
%===========================================================================%
% ----- 基础字体
\setlength\parindent{2em}		% 每行缩进两个汉字
% \setmainfont{Times New Roman}	% 西文默认衬线字体(serif); 使用mathptmx宏包
%\setmonofont{Courier New}		% 西文默认的等宽字体
\setsansfont{Arial}				% 西文默认无衬线字体(sans serif)
\setCJKfamilyfont{kai}[AutoFakeBold]{KaiTi}
\newcommand*{\kai}{\CJKfamily{kai}}
\setCJKfamilyfont{song}[AutoFakeBold]{SimSun}
\newcommand*{\song}{\CJKfamily{song}}
\setCJKfamilyfont{xinwei}[AutoFakeBold]{stxinwei.ttf}
\newcommand*{\xinwei}{\CJKfamily{xinwei}}
\renewcommand*{\baselinestretch}{1.38}% 行距设置

\renewcommand\normalsize{%
	\@setfontsize\normalsize{12.05}{14.45}%
	\abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
	\abovedisplayshortskip \z@ \@plus3\p@
	\belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@}

% ----- 页眉：宋体、小5；
\newcommand*{\yemei}{\song \zihao{-5}}

% 下面这段命令可以改变环境中的字距
%\let\hitsz@CJKglue\CJKglue
%\newcommand{\hitsz@glue}{%
%    \renewcommand{\CJKglue}{\hskip 1em plus 0.08\baselineskip}
%    }

% ----- 字号设置 -----
\def\hitsz@def@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][1.3]{%
    \fontsize{#2}{##1\dimexpr #2}\selectfont}}
\hitsz@def@fontsize{dachu}{58bp}
\hitsz@def@fontsize{chuhao}{42bp}
\hitsz@def@fontsize{xiaochu}{36bp}
\hitsz@def@fontsize{yihao}{26bp}
\hitsz@def@fontsize{xiaoyi}{24bp}
\hitsz@def@fontsize{erhao}{22bp}
\hitsz@def@fontsize{xiaoer}{18bp}
\hitsz@def@fontsize{sanhao}{16bp}
\hitsz@def@fontsize{xiaosan}{15bp}
\hitsz@def@fontsize{sihao}{14bp}
\hitsz@def@fontsize{banxiaosi}{13bp}
\hitsz@def@fontsize{xiaosi}{12bp}
\hitsz@def@fontsize{dawu}{11bp}
\hitsz@def@fontsize{wuhao}{10.5bp}
\hitsz@def@fontsize{xiaowu}{9bp}
\hitsz@def@fontsize{liuhao}{7.5bp}
\hitsz@def@fontsize{xiaoliu}{6.5bp}
\hitsz@def@fontsize{qihao}{5.5bp}
\hitsz@def@fontsize{bahao}{5bp}


%===========================================================================%
%->> Make Cover & Titlepage
%===========================================================================%
% RequirePackages: ulem,
\renewcommand{\maketitle}{%
  \hitsz@pagestyle{fancy@empty}
  \hitsz@maketitle@cover
  \if@openright\hitsz@clearemptydoublepage\else\clearpage\fi
  \hitsz@maketitle@titlepage
  \if@openright\hitsz@clearemptydoublepage\else\clearpage\fi
}

% 封面一
\newcommand{\hitsz@maketitle@cover}{
  \begin{center}
    \vspace*{2.3cm}
    % 题名
    \parbox[t][3.35cm][t]{\textwidth}{%
      \begin{center}
        \zihao{2}\heiti\hitsz@info@title \par \hitsz@info@appendanttitle
      \end{center}
    }
    % 姓名
    \parbox[t][8.30cm][t]{\textwidth}{%
      \begin{center}
        \zihao{-2}\song\textbf{\hitsz@info@author}
      \end{center}
    }

    % 学院, 学号, 专业, 指导教师
    \begin{center}
      \zihao{-4}\heiti
      % 下面两个表格是并列排版，中间不要空行
      \begin{tabular}{@{}r@{：}@{\ }l@{\qquad}}%
        \makebox[4.3em][s]{\hitsz@token@departmentname} & \hitsz@info@department  \\[8pt]
        \hitsz@token@stunumber       & \hitsz@info@stunumber
      \end{tabular}
      \begin{tabular}{@{}r@{：}@{}l@{}}%
        \hitsz@token@major       & \hitsz@info@major  \\[8pt]
        \hitsz@token@teacher     & \hitsz@info@teacher
      \end{tabular}
    \end{center}

    \vspace{2.2cm}
    % 日期
    \zihao{-4}\song\textbf{2020年6月}
  \end{center}
}

% 封面二
\newdimen\infowidth
\infowidth = 11cm            % 下划线长度
\setlength{\ULdepth}{4pt}   % 下划线与文字之间的距离
\newlength\tokenlength
\setlength\tokenlength{63pt}

\newcommand{\hitsz@maketitle@titlepage}{%
  \begin{center}
    \vspace*{0.55cm}
    \includegraphics[height=1.10cm]{style/hitlogo}% 1.02cm, 29pt

    \vspace*{1.67cm}\hspace{-15pt}
    \includegraphics[height=1.34cm]{style/thesislogo.jpg}
  \end{center}

  \vspace*{1.5cm}\hspace{-15pt}
  \parbox[t][7cm][t]{\textwidth}{% 该段落盒子放进居中环境后可消除劣质盒子警告(Overfull \hbox)
    \zihao{-3}\heiti
    \renewcommand{\arraystretch}{2.1}
    \begin{tabular}{l@{\qquad  }l}
      \zihao{-2}
      \makebox[\tokenlength][s]{\zihao{-2}\hitsz@token@title}\bfseries: &
      \uline{\makebox[\infowidth][l]{\hspace*{1em}{\song\zihao{-2}\bfseries\hitsz@info@title}}} \\
        & \uline{\makebox[\infowidth][l]{\hspace*{1em}{\song\zihao{-2}\bfseries\hitsz@info@appendanttitle}}} \\
        &
    \end{tabular}

    \vspace{0cm}
    \renewcommand{\arraystretch}{1.98} %表格间距
    \begin{tabular}{l@{\bfseries:\qquad }l}
      \makebox[\tokenlength][s]{\hitsz@token@major} &
      \uline{\makebox[\infowidth][l]{\hspace*{1em}{\song\zihao{-3}\bfseries\hitsz@info@major}}} \\

      \makebox[\tokenlength][s]{\hitsz@token@stunumber} &
      \uline{\makebox[\infowidth][l]{\hspace*{1em}{\song\zihao{-3}\bfseries\hitsz@info@stunumber}}} \\

      \makebox[\tokenlength][s]{\hitsz@token@student} &
      \uline{\makebox[\infowidth][l]{\hspace*{1em}{\song\zihao{-3}\bfseries\hitsz@info@author}}}  \\

      \makebox[\tokenlength][s]{\hitsz@token@teacher} &
      \uline{\makebox[\infowidth][l]{\hspace{1em}{\song\zihao{-3}\bfseries\hitsz@info@teacher}}} \\

      \makebox[\tokenlength][s]{\hitsz@token@defensedate} &
      \uline{\makebox[\infowidth][l]{\hspace*{1em}{\song\zihao{-3}\bfseries\hitsz@info@defensedate}}}
    \end{tabular}
    \renewcommand{\arraystretch}{1}
  }
}

%===========================================================================%
%->> Headers & Footers
%===========================================================================%
% ----- 空白页面格式
\let\hitsz@headrule\headrule
\fancypagestyle{fancy@empty}{\fancyhf{}%
  % 清空页眉
  \let\headrule\hitsz@headrule%
  \renewcommand{\headrulewidth}{\z@}
  % 无页脚
}

% ----- 书前部分格式
\fancypagestyle{fancy@front}{\fancyhf{}%
  \fancyfoot[C]{\zihao{-5} -~\thepage~-}
  \fancyhead[C]{\yemei \hitsz@info@school \hitsz@token@shenzhen \hitsz@info@thesis}
  \renewcommand{\headrule}{%
  \hrule width\headwidth height2.276pt \vspace{1pt}\hrule width\headwidth}
  \setlength{\headheight}{15pt}
}

% ----- 正文区格式
\fancypagestyle{fancy@main}{\fancyhf{}%
  \fancyfoot[C]{\zihao{-5} -~\thepage~-}
  \fancyhead[C]{\yemei \hitsz@info@school \hitsz@token@shenzhen \hitsz@info@thesis}
  \renewcommand{\headrule}{%
  \hrule width\headwidth height2.276pt \vspace{1pt}\hrule width\headwidth}
  \setlength{\headheight}{15pt}
}

% ----- 修改 pagestyle
\newcommand{\hitsz@pagestyle}[1]{%
  \ctexset{chapter/pagestyle=#1}
  \pagestyle{#1}
}

%\AtBeginDocument{%此处解决页眉经典bug, I don't konwo what this is.
%  \pagestyle{fancy@empty}
%  \renewcommand{\chaptermark}[1]{\@mkboth{\CTEXthechapter\enspace#1}{}}
%  }


%===========================================================================%
%->> Caption Settings
%===========================================================================%
\setcounter{secnumdepth}{3}
\ctexset{%
  chapter={
    name={第,章},
    afterindent=true,
    % 文类book将每一新章另起一页，该页的默认版式为plain
    pagestyle={fancy@main},
    beforeskip={18.74658bp},%一个空行 1.57481 × 18
    afterskip={24.74658bp},%0.8应该不计算间距 0.8 × 18 + 0.57481×18
    aftername=\enspace,
    format={\centering\heiti\zihao{-2}},
    nameformat=\bfseries,
    numberformat=\normalfont,
    titleformat=\bfseries,
    fixskip=true, % 添加这一行去除默认间距
    },
  section={
    afterindent=true,
    beforeskip={20.25bp \@plus 1.677267bp \@minus 1.157391bp}, % 原为13.5bp
    afterskip={20.25bp \@plus 1.677267bp \@minus 1.157391bp},
    format={\zihao{-3}\bfseries},
    numberformat=\normalfont,
    aftername=\enspace,
    fixskip=true,
    break={},
    },
  subsection={
    afterindent=true,
    beforeskip={16.5bp \@plus 1.842609bp \@minus 0.9920497bp}, % 原为11bp
    afterskip={16.5bp \@plus 2.33863bp \@minus 0.49602bp},
    format={\zihao{4}\bfseries},
    numberformat=\normalfont,
    aftername=\enspace,
    fixskip=true,
    break={},
    }
  }


%===========================================================================%
%->> Abstract ENV
%===========================================================================%
% ----- 不带序号且显示在目录中的章节命令
\newcommand{\hitsz@chapter}[1]{%
  \AtBeginEnvironment{#1}{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \phantomsection
    \addcontentsline{toc}{chapter}{\csname hitsz@cap@#1name\endcsname}
  }
  \newenvironment{#1}{
    \chapter*{\csname hitsz@cap@#1name\endcsname}
  }
}


% ----- 中文摘要
\hitsz@chapter{abstract}{}
\newcommand\keyword[1]{%
  % 输入参数为所有关键字
	\renewcommand{\hitsz@token@keywords}{#1}
	\par
	\vskip1ex
  \noindent\makebox[4em][l]{\zihao{-4}\hitsz@cap@keywordsname：}%
  \begin{minipage}[t]{120mm}{
    \hitsz@token@keywords
  }
  \end{minipage}
}

% ----- 英文摘要
\hitsz@chapter{enabstract}{}
\newcommand\enkeyword[1]{%
	\renewcommand{\hitsz@token@enkeywords}{#1}
	\par
	\vskip1ex
  \noindent\makebox[5em][l]{\zihao{-4}\hitsz@cap@enkeywordsname：}%
  \begin{minipage}[t]{120mm}{
    \hitsz@token@enkeywords
  }
  \end{minipage}
}


%===========================================================================%
%->> Table of Contents
%===========================================================================%
\setcounter{tocdepth}{2}
% 以章节格式添加目录
\renewcommand\tableofcontents{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \phantomsection
  \chapter*{\contentsname}
  \normalsize\@starttoc{toc}
}

\def\@pnumwidth{1.55em}  % 页码宽度
\def\@tocrmarg{2.55em}  % 标题行左缩进宽度
\def\@dotsep{0.3}

\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth > \m@ne \relax
    \addpenalty{-\@highpenalty}%
    %\vskip 1em \@plus\p@
    \setlength\@tempdima{4em} % 序号盒子宽度 (第n章)
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode %\bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      \heiti #1 \nobreak\hfil % 章节标题内禁止换行
      \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
      \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
% \@dettedtocline{层次深度}{缩进宽度}{序号宽度}
\renewcommand*\l@section{\@dottedtocline{1}{1em}{1.8em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{2em}{2.5em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{3\ccwd}{3.1em}}


%===========================================================================%
%->> Bibliography ENV
%===========================================================================%
% RequirePackages: etoolbox.
\AtBeginEnvironment{thebibliography}{%
  \if@openright\hitsz@clearemptydoublepage\else\clearpage\fi
  \phantomsection
  \addcontentsline{toc}{chapter}{\refname}
}
% 另一种可行的方法
%\AtEndOfPackageFile*{chapterbib}{
%  \renewcommand\bibsection{%
%    \ctexset{section/numbering=false}%
%    \section{\bibname}%
%    \ctexset{section/numbering=true}%
%  }
%}

% 使用style/gbt7714宏包可默认选择unsrt文献格式
% \bibliographystyle{unsrt}
\renewenvironment{thebibliography}[1]{
  \chapter*{\refname}%
  \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%

  \normalsize
  \list{\@biblabel{\@arabic\c@enumiv}}%
   {\settowidth\labelwidth{\@biblabel{#1}}%
    \setlength{\labelsep}{0.5em}
    \setlength{\itemindent}{0pt}
    \setlength{\leftmargin}{\labelsep+\labelwidth}
    \addtolength{\itemsep}{-0.8em}
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \@openbib@code
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy\frenchspacing
  \flushbottom
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000%
  \sfcode`\.\@m
  }
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
    \endlist
  }





%===========================================================================%
%->> Appendix
%===========================================================================%
% 附录中的章节格式（标号但不记入目录）
% 标题计数器
\newcounter{appchapter}
\newcounter{appsection}
\setcounter{appchapter}{0}
\setcounter{appsection}{0}
% Chapter标题命令
\newcommand{\appchapter}[1]{
  \stepcounter{appchapter}
  \setcounter{appsection}{0}
  \vspace{12bp}
  \centerline{\heiti\zihao{-2}\bfseries
    \makebox[1em][c]{\arabic{appchapter}}  #1
    \vspace{8bp}
    }
  }
% Section标题命令
\newcommand{\appsection}[1]{
  \stepcounter{appsection}
  \vspace{8bp}
  {\heiti\zihao{-3}\bfseries
    \makebox[2em][c]{\arabic{appchapter}. \arabic{appsection}}  #1
    \vspace{4bp}} \par
  }

%===========================================================================%
%->> Authorization
%===========================================================================%
\AtBeginEnvironment{authorization}{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \phantomsection
  \addcontentsline{toc}{chapter}{\hitsz@cap@authorizationname}
}

\newenvironment{authorization}{%
  \chapter*{\hitsz@info@school\hitsz@info@thesis\hitsz@cap@authorizationname}
  \hitsz@txt@declare
  \vspace{2\baselineskip}
  \par\hspace{6em}\hitsz@txt@authorsign\hfill\hitsz@date@datename\hitsz@date@datefill
}


%===========================================================================%
%->> Conclusion
%===========================================================================%
\hitsz@chapter{conclusion}{}


%===========================================================================%
%->> Acknowledgement
%===========================================================================%
\hitsz@chapter{acknowledgement}{}


%===========================================================================%
%->> Numerical Settings
%===========================================================================%
% ----- 修改公式编号
\renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter-\fi\@arabic\c@equation}

% ----- 公式参数解释
%% 此处的minipage产生了一个badbox警告(Underfull \box)
\newenvironment{note}{%
    \noindent\makebox[3em][l]{式中}%
    \begin{minipage}[t]{100mm}\begingroup
    }{\endgroup\end{minipage} \par}
\newcommand{\para}[2]{%
    \makebox[1em]{#1} --- #2 \hfill{}\\
    }


%===========================================================================%
%->> Floatting ENV
%===========================================================================%
% ----- 通用设置
%% 默认情况下, \LaTeX{} 要求每页的文字至少占据 20%,否则该页就只单独放置一个浮动环境,
%% 而这通常不是我们想要的, 我们将这个要求降低到 5%.
\renewcommand*{\textfraction}{0.05}
%% 有时如果多个浮动环境连续放在一起, \LaTeX{}会将它们分在几个不同页，即使它们可在同一页放得下.
%% 可以通过修改 |\topfraction| 和 |\bottomfraction| 分别设置顶端和底端的浮动环境的最大比例.
 \renewcommand*{\topfraction}{0.9}
 \renewcommand*{\bottomfraction}{0.8}
%% 有时\LaTeX{}会把一个浮动环境单独放在一页,我们要求这个环境至少要占据 85% 才能单独放在一页.
%% 注意:  |\floatpagefraction| 的数值必须小于 |\topfraction|.
 \renewcommand*{\floatpagefraction}{0.85}

%% 图标标题设置可参考：
%% https://www.latexstudio.net/archives/8652.html
\DeclareCaptionFont{song}{\song}
\DeclareCaptionFont{wuhao}{\zihao{5}}

% ----- 图
% 如果图片没有指定后缀, 依次按下列顺序搜索
\DeclareGraphicsExtensions{.jpg,.png,.pdf,.eps}
% 设置图表搜索路径, 可以给图表文件夹取如下名字
\graphicspath{{contents/}{pics/}{imgs/}{main/pics/}{front/pics/}{appendices/pics/}{back/pics/}}
\renewcommand*{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\figurename}{图}
\captionsetup[figure]{%
	format=hang,   % 标题从第二行开始都有缩进, 应该和 justification=raggedright 的效果一样.
	labelsep=quad, % 分隔符是一个空格
	font={song,wuhao}, % 图的字体, 宋体小四
	position=bottom % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置.
}

% ----- 子图
\renewcommand*{\thesubfigure}{\alph{subfigure}}
\captionsetup[subfigure]{%
	format=hang,
  labelformat=brace,  % 右括号
	labelsep=space,
	font={song,wuhao},
	position=bottom
}

% ----- 表格
\renewcommand{\tablename}{表}
\renewcommand*{\thetable}{\thechapter-\arabic{table}}
\captionsetup[table]{%
	format=hang,
  labelformat=simple,
	labelsep=quad,
	font={song,wuhao},
	position=bottom
}

% ----- 代码
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

\lstset{
  frame=tb,
  aboveskip=3mm,
  belowskip=3mm,
  showstringspaces=false,
  columns=flexible,
  framerule=1pt,
  rulecolor=\color{gray!35},
  backgroundcolor=\color{gray!5},
  basicstyle={\small\ttfamily},
  numbers=none,
  numberstyle=\tiny\color{gray},
  keywordstyle=\color{blue},
  commentstyle=\color{dkgreen},
  stringstyle=\color{mauve},
  breaklines=true,
  breakatwhitespace=true,
  tabsize=3,
}

\lstdefinestyle{latex}{
  language=tex,
  numbers=left,
  frame=single,
  numberstyle=\small,
}



%===========================================================================%
%->> Other Packages Settings
%===========================================================================%
% ----- hyperref
\hypersetup{%
  CJKbookmarks=true,
  linktoc=all,
  bookmarksnumbered=true,
  bookmarksopen=true,
  bookmarksopenlevel=3,
  pdfcreator={XeLaTeX with hitszthesis class},
  breaklinks=true,
  colorlinks=false,
  plainpages=false,
  pdfstartview=FitH,
  pdfborder={0 0 0}
}

% ----- enumitem
% 列表设置
% \setlist[enumerate,1]{label=(\arabic*).,font=\normalsize,
\setlength{\parsep}{0ex}%段落间距
\setlength{\topsep}{1ex}%列表到上下文的垂直距离
\setlength{\itemsep}{0ex}%条目间距


\endinput

%%
%% End of file 'texshawn.cls'
