% ============================================
%   Class definition Ver. 5.2.0 - 2012-08-08
% ============================================

\ProvidesClass{UUThesisTemplate}
\NeedsTeXFormat{LaTeX2e}

% Conditionals for options
\newif\if@UU@chapterafterpart
\newif\if@usepdfgfx
\newif\if@sfivepaper
\newif\if@culumntitles
\newif\if@UU@openright
\newif\if@UU@margnum

\@usepdfgfxtrue
\@sfivepapertrue
\@UU@chapterafterparttrue
\@culumntitlesfalse
\@UU@openrightfalse

% Paper resizing commands
\providecommand{\UU@setsfivepaper}{
	\setlength{\paperheight}{242mm} 
	\setlength{\paperwidth}{165mm}
	\setlength{\hoffset}{-1in}
	\setlength{\voffset}{-1in}
	\setlength{\topmargin}{8,8mm} 
	\setlength{\oddsidemargin}{22,5mm}
	\setlength{\evensidemargin}{22,5mm}
	\setlength{\headheight}{4,6mm}
	\setlength{\headsep}{4,6mm}
	\setlength{\textheight}{572pt}
	\setlength{\textwidth}{120mm}
	\setlength{\marginparsep}{1mm}
	\setlength{\marginparwidth}{20mm}
	\setlength{\footskip}{26pt}
	\setlength{\topskip}{13pt}
	\setlength{\pdfpagewidth}{\paperwidth}
	\setlength{\pdfpageheight}{\paperheight}
}

\providecommand{\UU@setafourpaper}{
	\setlength{\paperheight}{297mm} 
	\setlength{\paperwidth}{210mm}
	\setlength{\hoffset}{-1in}
	\setlength{\voffset}{-1in}
	\setlength{\topmargin}{13,8mm} 
	\setlength{\oddsidemargin}{30mm}
	\setlength{\evensidemargin}{30mm}
	\setlength{\headheight}{4,6mm}
	\setlength{\headsep}{4,6mm}
	\setlength{\textheight}{242mm}
	\setlength{\textwidth}{150mm}
	\setlength{\marginparsep}{1mm}
	\setlength{\marginparwidth}{20mm}
	\setlength{\footskip}{26pt}
	\setlength{\pdfpagewidth}{\paperwidth}
	\setlength{\pdfpageheight}{\paperheight}
	\special{papersize=297mm,210mm}
}
\providecommand{\UU@setafivepaper}{
	\setlength{\paperheight}{210mm} 
	\setlength{\paperwidth}{148mm}
	\setlength{\hoffset}{-1in}
	\setlength{\voffset}{-1in}
	\setlength{\topmargin}{8,8mm} 
	\setlength{\oddsidemargin}{20mm}
	\setlength{\evensidemargin}{20mm}
	\setlength{\headheight}{4,6mm}
	\setlength{\headsep}{4,6mm}
	\setlength{\textheight}{172mm}
	\setlength{\textwidth}{108mm}
	\setlength{\marginparsep}{1mm}
	\setlength{\marginparwidth}{20mm}
	\setlength{\footskip}{26pt}
	\setlength{\pdfpagewidth}{\paperwidth}
	\setlength{\pdfpageheight}{\paperheight}
}
\providecommand{\UU@setbfivepaper}{
	\setlength{\paperheight}{250mm} 
	\setlength{\paperwidth}{176mm}
	\setlength{\hoffset}{-1in}
	\setlength{\voffset}{-1in}
	\setlength{\topmargin}{8,8mm} 
	\setlength{\oddsidemargin}{22,5mm}
	\setlength{\evensidemargin}{22,5mm}
	\setlength{\headheight}{4,6mm}
	\setlength{\headsep}{4,6mm}
	\setlength{\textheight}{210mm}
	\setlength{\textwidth}{131mm}
	\setlength{\marginparsep}{1mm}
	\setlength{\marginparwidth}{20mm}
	\setlength{\footskip}{26pt}
	\setlength{\pdfpagewidth}{\paperwidth}
	\setlength{\pdfpageheight}{\paperheight}
}

\providecommand{\UU@papersize}{}
\let\UU@papersize\UU@setsfivepaper


\DeclareOption{s5paper}{ 
	\let\UU@papersize\UU@setsfivepaper
}

\DeclareOption{a4paper}{ 
	\PassOptionsToClass{\CurrentOption}{book}
	\PassOptionsToPackage{\CurrentOption}{geometry}
	\PassOptionsToPackage{\CurrentOption}{hyperref}
	\let\UU@papersize\UU@setafourpaper
}
\DeclareOption{a5paper}{ 
	\PassOptionsToClass{\CurrentOption}{book}
	\PassOptionsToPackage{\CurrentOption}{geometry}
	\PassOptionsToPackage{\CurrentOption}{hyperref}
	\@sfivepaperfalse
	\let\UU@papersize\UU@setafivepaper
}
\DeclareOption{b5paper}{ 
	\PassOptionsToClass{\CurrentOption}{book}
	\PassOptionsToPackage{\CurrentOption}{geometry}
	\PassOptionsToPackage{\CurrentOption}{hyperref}
	\let\UU@papersize\UU@setbfivepaper
}
\DeclareOption{letterpaper}{ 
	\ClassWarning{Invalid papersize \CurrentOption}
}
\DeclareOption{legalpaper}{ 
	\ClassWarning{Invalid papersize \CurrentOption}
}
\DeclareOption{titles}{ 
	\@culumntitlestrue
}
\DeclareOption{margnum}{ 
	\@UU@margnumtrue
}
\DeclareOption{twocolumn}{ 
	\ClassWarning{This class does not support \CurrentOption}
}
\DeclareOption{swedish}{ \PassOptionsToPackage{\CurrentOption}{babel} }
\DeclareOption{english}{ \PassOptionsToPackage{\CurrentOption}{babel} }
\DeclareOption{german}{ \PassOptionsToPackage{\CurrentOption}{babel} }
\DeclareOption{french}{ \PassOptionsToPackage{\CurrentOption}{babel} }
\DeclareOption{openany}{ \@UU@openrightfalse }
\DeclareOption{openright}{ \@UU@openrighttrue }

\PassOptionsToPackage{figuresright}{rotating}
\PassOptionsToPackage{font=small,labelfont=bf,nooneline,textfont=it}{caption}
\PassOptionsToPackage{linktocpage, breaklinks=true, colorlinks=true, urlcolor=black, linkcolor=black, citecolor=black, filecolor=black, menucolor=black, pdfpagelabels,bookmarksnumbered=true,bookmarks=true}{hyperref}

\ProcessOptions


% The thesis template is based on the standard class book
\LoadClass{book}
\if@UU@openright\@openrighttrue\else\@openrightfalse\fi

\@ifpackageloaded{ifpdf}{%
	\usepackage{ifpdf}%
	\ifpdf%
		\@usepdfgfxtrue%
	\else%
		\@usepdfgfxfalse%
	\fi%
}%

% Define page size and tell dvips to use it by entering the \special command
\UU@papersize
\special{papersize=\the\pdfpagewidth,\the\pdfpageheight}


% ============================================
%              XeTeX requirements
% ============================================	
\newif\ifFontIsAvailable
\def\testFontAvailability#1{
\count255=\interactionmode
\batchmode
\let\preload=\nullfont
\font\preload="#1" at 11pt
\ifx\preload\nullfont \FontIsAvailablefalse
\else \FontIsAvailabletrue \fi
\interactionmode=\count255
}

\expandafter\ifx\csname XeTeXrevision\endcsname\relax\else
	\usepackage{fontspec}
	\usepackage{xunicode}% provides unicode character macros 
	\usepackage{xltxtra}
\fi

%\ifxetex
%	\setmainfont[Mapping=tex-text]{Times New Roman}
%	\setsansfont[Mapping=tex-text]{Arial}
%	\setmonofont[Mapping=tex-text]{Courier New}
%\fi



% ============================================
%               Font settings
% ============================================

\AtBeginDocument{
\renewcommand\normalsize{\@setfontsize{\normalsize}{11}{13}} %11/13pt
\renewcommand\small{\@setfontsize{\small}{10}{12}}%10/12pt
\renewcommand\footnotesize{\@setfontsize{\footnotesize}{9}{11}}%9/11pt
\renewcommand\scriptsize{\@setfontsize{\scriptsize}{8}{10}}%8/10pt
\renewcommand\tiny{\@setfontsize{\tiny}{6}{8}}%6/8pt
\renewcommand\large{\@setfontsize{\large}{13}{15}}%13/15
\renewcommand\Large{\@setfontsize{\Large}{15}{17}}%15/17
\renewcommand\LARGE{\@setfontsize{\LARGE}{18}{20}}%18/20
\renewcommand\huge{\@setfontsize{\huge}{20}{23}}%20/23
\renewcommand\Huge{\@setfontsize{\Huge}{24}{28}}%24/28 

\let\superscript\textsuperscript
\let\subscript\textsubscript
\normalsize
}

% ============================================
%                Basic adjustments
% ============================================

\renewcommand{\bibname}{\refname}

% Prevent widows and orphans by setting a very large penalty
\widowpenalty=\@M
\clubpenalty=\@M


% Set spacing around paragraphs and displays
\setlength{\parindent}{\baselineskip}
\providecommand{\mathindent}{\baselineskip plus 3pt minus 3pt}
\renewcommand{\mathindent}{\baselineskip}
\setlength{\parskip}{0pt}
\setlength{\belowdisplayskip}{10pt plus 3pt minus 3pt}
\setlength{\abovedisplayskip}{10pt plus 3pt minus 3pt}
\setlength{\belowdisplayshortskip}{10pt plus 3pt minus 3pt}
\setlength{\abovedisplayshortskip}{10pt plus 3pt minus 3pt}


% No indentation of footnotes
\renewcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent%
    \hb@xt@0.4em{\hss\@makefnmark}#1%
}

\renewcommand\footnoterule{{\leftskip 0pt\noindent\rule{26mm}{.5pt}\vspace{3pt}\par}}

% Remove default spacing between items in lists
\renewcommand{\labelitemi}{\textbullet}%
\renewcommand{\labelitemii}{\textendash}%
\renewcommand{\labelitemiii}{\textasteriskcentered}%
\renewcommand{\labelenumi}{\arabic{enumi}.}%
\renewcommand{\labelenumii}{\alph{enumii})}%
\renewcommand{\labelenumiii}{\roman{enumiii}.}%
\setlength{\labelsep}{0.4em}
\settowidth{\leftmargini}{\@Roman 8.\hspace{\labelsep}}

\renewcommand{\@listI}{%
	\setlength\leftmargin\leftmargini%
	\setlength\parsep{0\p@}%
	\setlength\topsep{0\p@}%
	\setlength\itemsep{0\p@}%
	\setlength{\partopsep}{0pt}%
}
\let\@listi\@listI
\renewcommand{\@listii}{%
	\setlength\leftmargin\leftmarginii%
}
\renewcommand{\@listiii}{%
	\setlength\leftmargin\leftmarginiii%
}
\renewcommand{\@listiv}{%
	\setlength\leftmargin\leftmarginiv%
}
\renewcommand{\@listv}{%
	\setlength\leftmargin\leftmarginv%
}

\newlength{\UU@tmplen}
\newlength{\UU@listindent}
\newcounter{UU@tmpcounter}
\providecommand{\setlistmargin}[1][]{
	\def\tmp{#1}
	\ifx\tmp\@empty
		\settowidth{\UU@tmplen}{\@itemlabel\hspace{\labelsep}}
	\else
		\ifx\@listctr\@undefined
		\settowidth{\UU@tmplen}{\@itemlabel\hspace{\labelsep}}
		\else
		\setcounter{UU@tmpcounter}{\value{\@listctr}}
		\setcounter{\@listctr}{#1}
		\settowidth{\UU@tmplen}{\@itemlabel\hspace{\labelsep}}
		\setlength{\labelwidth}{\UU@tmplen}
		\setcounter{\@listctr}{\value{UU@tmpcounter}}
		\fi
	\fi
	\advance\UU@tmplen-\leftmargin
	\advance\UU@tmplen\UU@listindent
	\advance\leftskip\UU@tmplen
	\advance\leftmargin\UU@tmplen
	\advance\@totalleftmargin\UU@tmplen
	\setlength\linewidth\textwidth
	\advance\linewidth-\@totalleftmargin
}





% Indented, smaller text with space before and after
\renewenvironment{quotation}{%
	\par\addtolength{\leftskip}{26pt}%
	\addvspace{13pt plus 6pt minus 6pt}\small\noindent\ignorespaces%
}{%
	\par\addvspace{13pt plus 6pt minus 6pt}%
	\global\@afterindentfalse\ignorespacesafterend%
}
\let\quote\quotation
\let\endquote\endquotation




% ============================================
%             Page layout
% ============================================

% Plain - Empty header with page number outer end of footer 
\renewcommand{\ps@plain}{%
	\let\@oddhead\@empty%
	\let\@evenhead\@empty%
	\renewcommand{\@oddfoot}{\hfil\thepage}%
	\renewcommand{\@evenfoot}{\thepage\hfil}%
}

% UU@chapter - empty header
\providecommand{\ps@UU@chapter}{%
	\let\@oddhead\@empty%
	\let\@evenhead\@empty%
}

% Headings - chapter title in even headers, section title in odd headers
\renewcommand{\ps@headings}{%
	\ps@plain%
	\def\@evenhead{\leftmark\hfil }%
	\def\@oddhead {\hfil\rightmark }%
	\let\@mkboth \markboth %
	\def\chaptermark ##1{\markboth {\ifnum \c@secnumdepth >\m@ne \thechapter . \ \fi ##1}{}}%
	\def\sectionmark ##1{\markright {\ifnum \c@secnumdepth >\z@ \thesection~~\fi ##1}}%
}

\let\@oddfoot\@empty 
\let\@evenfoot\@empty 
\let\@mkboth\@gobbletwo 
\let\chaptermark\@gobble 
\let\sectionmark\@gobble
\def\appendixmark#1{%
	\markboth{Appendix \theappendix}{}%
}



\AtBeginDocument{
	\pagestyle{plain}
}

% Adjust to odd pagenumber using an optional blank page
\let\origdoublepage\cleardoublepage
\newcommand{\clearemptydoublepage}{%
  \clearpage
  {\pagestyle{empty}\origdoublepage}%
}
\let\cleardoublepage\clearemptydoublepage



% ============================================
%          Dispositional Settings
% ============================================

% Default to not using numbering for headings
\setcounter{secnumdepth}{-1}

% Set numbering valid only withing the main matter
\newcounter{secnumdepthmainmatter}
\AtBeginDocument{\setcounter{secnumdepthmainmatter}{\c@secnumdepth}}


% Remove page numbers and numbering of headings
\let\oldfrontmatter\frontmatter
\renewcommand{\frontmatter}{% 
	\renewcommand{\thepage}{\roman{page}}% 
	\setcounter{secnumdepth}{-2} % 
	\@mainmatterfalse% 
	\pagestyle{empty}% 
}

% Adjust to odd page and restore numbering of headings
\let\oldmainmatter\mainmatter
	\renewcommand{\mainmatter}{% 
	\cleardoublepage% 
	\renewcommand{\thepage}{\arabic{page}}% 
	\setcounter{secnumdepth}{\c@secnumdepthmainmatter} % 
	\@mainmattertrue% 
	\if@culumntitles%
		\pagestyle{headings}%
	\else%
		\pagestyle{plain}%
	\fi%
}

% Remove page numbers and numbering of headings
\let\oldbackmatter\backmatter
\renewcommand{\backmatter}{% 
	\oldbackmatter% 
	\setcounter{secnumdepth}{-2}
	\makeatletter%
	\ifx\toclevel@chapter\undefined\else%
		\renewcommand{\toclevel@appendix}{-1}%
		\renewcommand{\toclevel@chapter}{-1}%
		\renewcommand{\toclevel@section}{0}% 
		\renewcommand{\toclevel@subsection}{1}% 
		\renewcommand{\toclevel@subsubsection}{2}% 
		\renewcommand{\toclevel@paragraph}{3}% 
		\renewcommand{\toclevel@subparagraph}{4}% 
	\fi%
	\makeatother% 
}

% Change the chapter command to create appendixes
\renewenvironment{appendix}{
	\@ifundefined{pdfbookmark}{}{\pdfbookmark[-2]{\appendixname}{appendices}}%
	\let\oldchapter\chapter%
	\let\chapter\appendixchapter%
	\let\chaptername\appendixname%
	\@mainmattertrue%
}{%
} 


% ============================================
%                  Headings
% ============================================	  


% Provides a readable command to set numbering of headings
\providecommand{\toclevel@part}{-1}
\providecommand{\toclevel@appendix}{0}%
\providecommand{\toclevel@chapter}{0}%
\providecommand{\toclevel@section}{1}% 
\providecommand{\toclevel@subsection}{2}% 
\providecommand{\toclevel@subsubsection}{3}% 
\providecommand{\toclevel@paragraph}{4}% 
\providecommand{\toclevel@subparagraph}{5}% 

\providecommand{\numberingdepth}[1]{%
	\setcounter{secnumdepth}{\csname toclevel@#1\endcsname}%
}



% Redefinition of sectioning command to prevent issues with AMSMath
% and allow for greater adjustments of chapter numbering

\newcommand\chapterfont{}
\let\uu@ifstar\@ifstar
\renewcommand{\@startsection}[6]{ %
	\if@noskipsec\leavevmode\fi %
	\par\@tempskipa #4\relax\@afterindentfalse%
	\if@nobreak%
		\everypar{}%
	\else%
		\addpenalty\@secpenalty\addvspace\@tempskipa%
	\fi%
	\uu@ifstar{%
		\@ssect{#3}{#4}{#5}{#6}%
	}{%
		\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}%
	}%
}
\def\@ssect#1#2#3#4#5{%
	\@tempskipa #3\relax %
	\begingroup %
		#4{\@hangfrom{\hskip #1}\interlinepenalty \@M #5\@@par}%
	\endgroup %
	\@xsect{#3}%
}
\def\@sect#1#2#3#4#5#6[#7]#8{
	\ifnum #2>\c@secnumdepth%
		%\phantomsection%
		\let\@svsec\@empty%
	\else %
		\refstepcounter{#1}%
		\protected@edef\@svsec{\protect\@seccntformat{#1}\relax}%
	\fi %
	\@tempskipa #5\relax %
	\begingroup %
		#6%
		{\@hangfrom {\hskip #3\relax \@svsec }\interlinepenalty \@M #8 \@@par }%
	\endgroup%
	\csname #1mark\endcsname {#7}%
	\addcontentsline {toc}{#1}{%
		\ifnum #2>\c@secnumdepth\else%
			\protect\numberline{\csname the#1\endcsname}%
		\fi%
		#7%
		}%
	\@xsect{#5}
}
\def\@xsect#1{%
	\@tempskipa #1\relax %
		\par \nobreak \vskip \@tempskipa %
		\@afterheading %
	\ignorespaces%
}



% Chapter numbering formats
\newcommand{\@seccntformat@part}{%
	{\partname~\thepart}\hspace{0,5em}%
}
\newcommand{\@seccntformat@chapter}{%
	{\thechapter}.\hspace{0,5em}%
}
\newcommand{\@seccntformat@section}{%
	{\thesection}\hspace{0,5em}%
}
\newcommand{\@seccntformat@subsection}{{\thesubsection}\hspace{0,5em}}
\newcommand{\@seccntformat@subsubsection}{{\thesubsubsection}\hspace{0,5em}}
\newcommand{\@seccntformat@paragraph}{{\theparagraph}\hspace{0,5em}}
\newcommand{\@seccntformat@subparagraph}{{\thesubparagraph}\hspace{0,5em}}
\renewcommand{\@seccntformat}[1]{%
		\csname @seccntformat@#1\endcsname%
}

\if@UU@margnum
	\renewcommand{\@seccntformat}[1]{%
		\makebox[0mm][r]{\csname @seccntformat@#1\endcsname}%
	}
\fi

% Part heading
\renewcommand{\part}{%
	\cleardoublepage%
	\thispagestyle {empty}%
	\@afterindentfalse%
	\@UU@chapterafterparttrue%
	\secdef\@part\@spart%
}
\renewcommand{\@part}[2][1]{%
	\edef\@mtarg{\zap@space#2 \@empty}%
	\vspace*{0.3\textheight}%
	\edef\pgsdelimiter{\ifx\@empty\@mtarg\else :\fi}%
	\ifnum \c@secnumdepth >-2\relax %
		\refstepcounter{part}%
		\addcontentsline{toc}{part}{\partname~\thepart :~#1}%
	\else %
		\addcontentsline {toc}{part}{#1}%
	\fi %
	\markboth{}{}%
	{
		\UU@RaggedRight%
		\interlinepenalty \@M%
		\chapterfont%
		\LARGE%
		\ifnum \c@secnumdepth >-2\relax \partname \nobreakspace \thepart\pgsdelimiter \par \fi %
		#2\par%
	}%
	\@xsect{\baselineskip}
}

% Chapter heading
\renewcommand\chapter{%
	\if@openright\cleardoublepage\else\if@UU@chapterafterpart\cleardoublepage\else\clearpage\fi\fi
	\@UU@chapterafterpartfalse
	%\markboth{}{}
	\thispagestyle{UU@chapter}
	\suppressfloats[t]
	\@startsection {chapter}{0}{\z@}{\z@}{82pt plus 13pt minus 26pt}{%
		\chapterfont%
		\LARGE%
		\UU@RaggedRight%
		\hyphenpenalty=10000%
	}%
}
\renewcommand\@makeschapterhead[1]{\chapter*{#1}}


% Appendix heading
\newcounter{appendix}
\def\theappendix{\@Alph\c@appendix}%
\def\appendixchapter{%
	\if@openright\cleardoublepage\else\if@UU@chapterafterpart\cleardoublepage\else\clearpage\fi\fi
	\@UU@chapterafterpartfalse
	\thispagestyle{UU@chapter}
	\suppressfloats[t]
	\@startsection{appendix}{-2}{\z@}{\z@}{82pt plus 13pt minus 26pt}{%
		\chapterfont%
		\LARGE%
		\UU@RaggedRight
		Appendix \@Alph\c@appendix.\\
	}%
}

\renewcommand\section{%
	\@startsection {section}{1}{\z@}{30pt plus 5pt minus 5pt}{5pt minus 1pt}{%
		\chapterfont%
		\Large%
		\UU@RaggedRight%
		\hyphenpenalty=10000%
	}%
}
\renewcommand\subsection{%
	\@startsection {subsection}{2}{\z@}{25pt plus 5pt minus 3pt}{4pt minus 1pt}{%
		\chapterfont%
		\large%
		\UU@RaggedRight%
		\hyphenpenalty=10000%
	}%
}
\renewcommand\subsubsection{%
	\@startsection {subsubsection}{3}{\z@}{13pt plus 5pt minus 2pt}{1pt minus 1pt}{%
		\chapterfont%
		\normalsize%
		\UU@RaggedRight%
		\hyphenpenalty=10000%
		\textbf
	}%
}
\renewcommand\paragraph{%
	\@startsection {paragraph}{4}{\z@}{13pt plus 5pt minus 2pt}{1pt minus 1pt}{%
		\chapterfont%
		\normalsize%
		\UU@RaggedRight%
		\hyphenpenalty=10000%
		\textit
	}%
}
\renewcommand\subparagraph{%
	\@startsection {subparagraph}{5}{\z@}{13pt plus 5pt minus 2pt}{1pt minus 1pt}{%
		\chapterfont%
		\normalsize%
		\UU@RaggedRight%
		\hyphenpenalty=10000%
	}%
}


%\hyphenation{te-star avsta-vning vi-d binde-streck}



% ============================================
%                 Captions
% ============================================	  

\setlength{\abovecaptionskip}{3pt plus 2pt}
\setlength{\belowcaptionskip}{0pt plus 42pt}

\AtBeginDocument{
\def\@caption#1[#2]#3{%
	\par %
	\addcontentsline {\csname ext@#1\endcsname }{#1}{\protect \numberline {\csname the#1\endcsname }{\ignorespaces #2}}%
	\begingroup %
		\@parboxrestore %
		\if@minipage %
			\@setminipage %
		\fi %
		\normalsize %
		\@makecaption{\csname fnum@#1\endcsname }{\ignorespaces #3}%
		\par %
	\endgroup
}

\def\@makecaption@table#1#2{%
	\addvspace{\belowcaptionskip}%
	%\sbox\@tempboxa{{\bf #1.} #2}%
	\small{\bf #1.} {\it #2}\par%
	\addvspace{\abovecaptionskip}%
}

\def\@makecaption@default#1#2{%
	\addvspace{\abovecaptionskip}%
	\sbox\@tempboxa{{\it #1.} #2}%
	\ifdim \wd\@tempboxa>\hsize%
		\small{\it #1.} #2\par%
	\else %
		\global \@minipagefalse \hb@xt@ \hsize {\hfil \box \@tempboxa \hfil }%
	\fi %
	\addvspace{\belowcaptionskip}%
}

\renewcommand{\@makecaption}[2]{%
	\expandafter\let\expandafter\hej\csname 	@makecaption@\@captype\endcsname%
	\expandafter\ifx\hej\relax%
		\let\hej\@makecaption@default%
	\fi%
	\hej{#1}{#2}%
}
}


% ============================================
%              Package fixes
% ============================================	  

\AtBeginDocument{%
%
% Smaller font size in tables
	\let\otable\table%
	\def\table{\let\textnormalsize\normalsize\let\normalsize\small\par\otable}%
	\g@addto@macro\endtable\normalsize%
%
% Fixes for package caption
	\@ifpackageloaded{caption}{%
		\let\captionfont\small%
		\def\table{\begingroup\captionsetup{labelfont=bf}%
		\small\par\otable}%
		\g@addto@macro\endtable\endgroup%
		\let\ofigure\figure%
		\def \figure{\begingroup\captionsetup{labelfont=it,textfont=rm}\ofigure}%
		\g@addto@macro\endfigure\endgroup%
	}{}%
%
% Fixes for package natbib
	\@ifpackageloaded{natbib}{%
		\def\bibsection{\chapter{\bibname}\sectionmark{References}}%
		\def\bibfont{\small}%
		\def\bibpreamble{\UU@RaggedRight\raggedbottom}%
	}{}%
%
% Fixes for package amsthm
	\@ifpackageloaded{amsthm}{%
		\def\th@definition{%
		  \normalfont %
		  \thm@preskip\baselineskip%
		  \thm@postskip\thm@preskip%
		}
		\def\th@remark{%
		  \thm@headfont{\itshape}%
		  \normalfont %
		  \thm@preskip\baselineskip%
		  \thm@postskip\thm@preskip
		}
		\def\th@plain{%
			\thm@preskip\baselineskip%
			\thm@postskip\thm@preskip%
			\itshape%
		}%
	}{}%
%
% Fixes for package longtable
	\@ifpackageloaded{longtable}{%
	\setlength\LTcapwidth{0.985\textwidth}%
	\setlength\LTleft\z@%
	\setlength\LTright\z@%
		\def\LT@makecaption#1#2#3{%
			\multicolumn{\LT@cols}{@{}l@{}}{%
			\parbox{\LTcapwidth}{%
			\def\@captype{table}%
			\@makecaption{#2}{#3}}%
			}%
		}%
		\let\olongtable\longtable%
		\def\longtable{\small\par\olongtable}%
		\g@addto@macro\endlongtable{\addvspace{0pt plus 13pt}\normalsize}%
		\let\oLT@array\LT@array%
	\def\LT@array[#1]#2{% 
	\oLT@array[#1]{#2}%
	\hline \multicolumn{\LT@cols}{r@{}}{{\continuednextpage}} %
	\endfoot}%
	}{}%
%
% Prevents raggedright from creating bad line breaks
	\@ifpackageloaded{ragged2e}{
		\providecommand{\UU@RaggedRight}{\RaggedRight}
	}{%
		\providecommand{\UU@RaggedRight}{\raggedright\parfillskip\fill}%
	}
%
% Prevents hyperref from breaking table of contents
	\@ifpackageloaded{hyperref}{
		\def\toclevel@appendix{0}
		\def\contentsline#1#2#3#4{%
			\ifx \\#4\\\csname l@#1\endcsname {#2}{#3}%
			\else %
				\ifHy@linktocpage %
					\csname l@#1\endcsname {#2}{\hyper@linkstart {link}{#4}{#3}\hyper@linkend }%
				\else%
	 				\csname l@#1\endcsname {\hyper@linkstart {link}{#4}{#2}\hyper@linkend }{#3}%
				\fi%
	 		\fi%
		}
	}{\providecommand{\phantomsection}{}}
}




% ============================================
%             Table of contents
% ============================================	

% Provides a readable command to set the level of detail in toc
\providecommand{\contentsdepth}[1]{%
	\setcounter{tocdepth}{\csname toclevel@#1\endcsname}%
}

\newlength{\tocskip@part}
\setlength{\tocskip@part}{13pt plus 2pt}
\newlength{\tocskip@chapter}
\setlength{\tocskip@chapter}{8pt minus 1pt}
\newlength{\@tempdimd}

\newcommand\customtocline[5]{%
	\ifnum \c@tocdepth >#5
		\setlength\@tempdima{#4}%
		\setlength\@tempdimb{#3}%
		\settowidth{\@tempdimc}{~#2}%
		\setlength{\@tempdimd}{\textwidth}%
		\parindent \z@%
		\begingroup%
			\UU@RaggedRight%
			\setlength{\parfillskip}{-\@tempdimc}%
			%\advance\leftskip\@tempdima%
			\advance\rightskip\@tempdimc%
			\hskip -\leftskip%
			\advance\leftskip\@tempdimb%
			#1\nobreak\ %
			{\tiny\dotfill}\nobreak{}\null%
			~#2%
		\par%
		\endgroup%
	\fi%
 }


\renewcommand*{\numberline}[1]{\@hangfrom{\hb@xt@ \@tempdima {#1\hfil}}}
\newcommand*\nonumberline[1]{\hb@xt@ \@tempdima {#1\hfil}}
\newcommand*\tablenumberline[1]{\hb@xt@ \@tempdima {\tablename~#1:\hfil}}
\newcommand*\figurenumberline[1]{\hb@xt@ \@tempdima {\figurename~#1:\hfil}}
\newcommand*\partnumberline[1]{\partname~#1:~}
\newcommand*\appendixnumberline[1]{\appendixname~#1:~}
\let\chapternumberline\numberline
%\newcommand*\chapternumberline[1]{}
%{{\small\textsc\chaptername~#1\hfill\null\\\hskip-\leftskip}}
\let\stdnumberline\numberline


\newcommand{\settocnumwidth}[6]{
	\settowidth{\tocnumindent@chapter}{#1\hspace{0.5em}}
	\settowidth{\tocnumindent@section}{#1.#2\hspace{0.5em}}
	\settowidth{\tocnumindent@subsection}{#1.#2.#3\hspace{0.5em}}
	\settowidth{\tocnumindent@subsubsection}{#1.#2.#3.#4\hspace{0.5em}}
	\settowidth{\tocnumindent@paragraph}{#1.#2.#3.#4.#5\hspace{0.5em}}
	\settowidth{\tocnumindent@subparagraph}{#1.#2.#3.#4.#5.#6\hspace{0.5em}}
	\adjusttocindent
}
\newcommand{\settocindent}[6]{
	\setlength{\tocindent@chapter}{#1}
	\setlength{\tocindent@section}{#2}
	\setlength{\tocindent@subsection}{#3}
	\setlength{\tocindent@subsubsection}{#4}
	\setlength{\tocindent@paragraph}{#5}
	\setlength{\tocindent@subparagraph}{#6}
}
\newcommand{\adjusttocindent}{
	\setlength{\tocindent@section}{\tocindent@chapter}%
	\ifnum\c@secnumdepthmainmatter>-1\addtolength{\tocindent@section}{\tocnumindent@chapter}%
	\else\addtolength{\tocindent@section}{\tocindent}\fi%
%
	\setlength{\tocindent@subsection}{\tocindent@section}%
	\ifnum\c@secnumdepthmainmatter>0\addtolength{\tocindent@subsection}{\tocnumindent@section}%
	\else\addtolength{\tocindent@subsection}{\tocindent}\fi%
%
	\setlength{\tocindent@subsubsection}{\tocindent@subsection}%
	\ifnum\c@secnumdepthmainmatter>1\addtolength{\tocindent@subsubsection}{\tocnumindent@subsection}%
	\else\addtolength{\tocindent@subsubsection}{\tocindent}\fi%
%
	\setlength{\tocindent@paragraph}{\tocindent@subsubsection}%
	\ifnum\c@secnumdepthmainmatter>2\addtolength{\tocindent@paragraph}{\tocnumindent@subsubsection}%
	\else\addtolength{\tocindent@paragraph}{\tocindent}\fi%
%
	\setlength{\tocindent@subparagraph}{\tocindent@paragraph}%
	\ifnum\c@secnumdepthmainmatter>3\addtolength{\tocindent@subparagraph}{\tocnumindent@paragraph}%
	\else\addtolength{\tocindent@subparagraph}{\tocindent}\fi%
}
\newlength{\tocnumindent@chapter}
\newlength{\tocnumindent@section}
\newlength{\tocnumindent@subsection}
\newlength{\tocnumindent@subsubsection}
\newlength{\tocnumindent@paragraph}
\newlength{\tocnumindent@subparagraph}
\newlength{\tocindent}
\newlength{\tocindent@chapter}
\newlength{\tocindent@section}
\newlength{\tocindent@subsection}
\newlength{\tocindent@subsubsection}
\newlength{\tocindent@paragraph}
\newlength{\tocindent@subparagraph}

\setlength{\tocindent}{13pt}
%\settocnumindent{15pt}{24pt}{34pt}{44pt}{54pt}{64pt}
%\settocnumwidth{10}{10}{5}{3}{3}{3}

\setlength{\tocindent@chapter}{0pt}
% Adjust table of contents indents based on level of numbering
\AtBeginDocument{%
	\settocnumwidth{10}{10}{5}{3}{3}{3}
}

\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{%
	\begingroup%
		\raggedbottom%
		\cleardoublepage%
		\oldtableofcontents%
		\vfill\null%
		\clearpage%
	\endgroup%
}

\newcounter{prevtoclvl}
\setcounter{prevtoclvl}{-2}
\newcommand{\@nopagebreaktoc}[1]{%
	\ifnum\c@prevtoclvl<#1%
		\nopagebreak[3]%
	\fi%
	\setcounter{prevtoclvl}{#1}%
}

\renewcommand*\l@chapter[2]{%
	\@nopagebreaktoc{0}%
	%\renewcommand{\numberline}{\chapternumberline}%
	\vskip\tocskip@chapter%
	\customtocline{#1}{#2}{\tocindent@chapter}{\tocnumindent@chapter}{-1}%
	%\renewcommand{\numberline}{\stdnumberline}%
	}
\renewcommand*\l@section[2]{\@nopagebreaktoc{1}\customtocline{#1}{#2}{\tocindent@section}{\tocnumindent@section}{0}}
\renewcommand*\l@subsection[2]{\@nopagebreaktoc{2}\customtocline{#1}{#2}{\tocindent@subsection}{\tocnumindent@subsection}{1}}
\renewcommand*\l@subsubsection[2]{\@nopagebreaktoc{4}\customtocline{#1}{#2}{\tocindent@subsubsection}{\tocnumindent@subsubsection}{2}}
\renewcommand*\l@paragraph[2]{\@nopagebreaktoc{4}\customtocline{#1}{#2}{\tocindent@paragraph}{\tocnumindent@paragraph}{3}}
\renewcommand*\l@subparagraph[2]{\nopagebreak[1]\@nopagebreaktoc{5}\customtocline{#1}{#2}{\tocindent@subparagraph}{\tocnumindent@subparagraph}{4}}
\setcounter{tocdepth}{2} 

\newcommand*\l@appendix[2]{%
	\@nopagebreaktoc{0}
	\renewcommand{\numberline}{\appendixnumberline}%
	\vskip\tocskip@chapter%
	\customtocline{#1}{#2}{\tocindent@chapter}{\tocnumindent@chapter}{-1}%
	\renewcommand{\numberline}{\stdnumberline}%
}

\renewcommand*\l@part[2]{%
	\@nopagebreaktoc{-1}%
	\renewcommand{\numberline}{\partnumberline}%
	\vskip\tocskip@part%
	\customtocline{#1}{#2}{\z@}{4em}{-2}%
	\renewcommand{\numberline}{\stdnumberline}%
}

\renewcommand*\l@figure[2]{%
	\let\numberline\figurenumberline%
	\customtocline{#1}{#2}{\z@}{4.3em}{0}%
	\renewcommand{\numberline}{\stdnumberline}%
}
\renewcommand*\l@table[2]{%
	\let\numberline\tablenumberline%
	\customtocline{#1}{#2}{\z@}{4.3em}{0}%
	\addvspace{0.5\baselineskip plus 0.1\baselineskip}%
	\renewcommand{\numberline}{\stdnumberline}%
}






% ============================================
%                List of papers
% ============================================	


\renewcommand{\bibname}{\refname}
\providecommand{\listofpapersname}{List of papers}
\providecommand{\continuednextpage}{Continued on next page}
\providecommand{\keywordsname}{Keywords}

\providecommand{\listofpapersintro}[1]{\gdef\@listofpapersintro{#1}}
\providecommand{\listofpapersoutro}[1]{\gdef\@listofpapersoutro{#1}}
\listofpapersintro{This thesis is based on the following papers, which are referred to in the text by their roman numerals.}% 
\listofpapersoutro{Reprints were made with permission from the publishers.}


\providecommand{\pgs@language@swedish}{%
	\renewcommand{\bibname}{\refname}%
	\renewcommand{\listofpapersname}{Lista \"over delarbeten}% 
	\listofpapersintro{Denna avhandling \"ar baserad p\r{a} f\"oljande artiklar, vilka i texten h\"anvisas till med romerska siffror.}% 
	\listofpapersoutro{Reproduktion med tillst\aa nd fr\aa n respektive utgivare.}%
	\renewcommand{\continuednextpage}{Fortsatt p\r{a} n\"a{}sta sida}%
	\renewcommand{\keywordsname}{Nyckelord}%
}

\providecommand{\pgs@language@english}{%
  	\renewcommand{\bibname}{\refname}%
  	\renewcommand{\listofpapersname}{List of papers}% 
	\listofpapersintro{This thesis is based on the following papers, which are referred to in the text by their Roman numerals.}% 
	\listofpapersoutro{Reprints were made with permission from the publishers.}% 
	\renewcommand{\continuednextpage}{Continued on next page}%
	\renewcommand{\keywordsname}{Keywords}%
}		


\AtBeginDocument{%
	\@ifpackageloaded{babel}{%
		\addto\captionsswedish{%
		  	\pgs@language@swedish
		}%
		\addto\captionsenglish{%
		  	\pgs@language@english
		}%
	}{}%
	\@ifpackageloaded{polyglossia}{%
		\renewcommand{\xpg@hook@setlanguage}{\csname pgs@language@\languagename \endcsname}
		\xpg@hook@setlanguage%
	}{}%
}

\newcounter{listofpapersc}
\renewcommand{\thelistofpapersc}{\Roman{listofpapersc}}
\newenvironment{listofpapers}{%
	\cleardoublepage%
	\@ifundefined{pdfbookmark}{}{\pdfbookmark[0]{\listofpapersname}{lop}}%
	\chapter*{\listofpapersname}%
	\noindent {\@listofpapersintro}\vspace{1\baselineskip}%
    \setcounter{listofpapersc}{0}%
    \begin{list}{\Roman{listofpapersc}}{%
    	\def\@currentlabel{\Roman{listofpapersc}}%
    	\UU@RaggedRight%
    	\hyphenpenalty=10000%
        \usecounter{listofpapersc}%
            \setlength{\leftmargin}{2,5em}%
            \setlength{\labelsep}{1em}%
            \setlength{\itemsep}{1em plus 0.2em minus 0.2em}%
            \setlength{\parsep}{0mm}%
            \setlength{\topsep}{0mm}}%
}{%
    \end{list}\nopagebreak%
    \vspace{1\baselineskip}\noindent {\@listofpapersoutro}%
}


% ============================================
%            Basic bibliography
% ============================================	

\let\oldbib\thebibliography
\let\endoldbib\endthebibliography

\renewenvironment{thebibliography}[1]{%
	\chapter{\bibname}%
	\@mkboth {\bibname}{\bibname}%
	\small%
	\UU@RaggedRight%
	\raggedbottom%
	\list{\@biblabel{\@arabic\c@enumiv }}{%
		\settowidth\labelwidth{\@biblabel{#1}}%
		\leftmargin\labelwidth %
		\advance\leftmargin \labelsep %
		\@openbib@code%
 		\usecounter{enumiv}%
		\let\p@enumiv\@empty %
		\renewcommand\theenumiv{\@arabic \c@enumiv }%
	}%
	\sloppy %
	\clubpenalty 4000 %
	\@clubpenalty \clubpenalty %
	\widowpenalty 4000%
	\sfcode `\.\@m%
}{%
	\def \@noitemerr {\@latex@warning {Empty `thebibliography' environment}}%
	\endlist%
}


% ============================================
%                    Index
% ============================================	

\newcommand{\UU@theindex}{
	\clearpage%
	\if@twocolumn%
		\@restonecolfalse %
	\else %
		\@restonecoltrue %
	\fi %
	\twocolumn%
	\chapter{\indexname}%
	\parindent\z@%
	\parskip\z@ \@plus .3\p@ %
	\relax %
	\columnseprule \z@ %
	\columnsep 35\p@ %
	\let \item \@idxitem %
	}%
	
\AtBeginDocument{%
	\let\theindex\UU@theindex%
	\@ifpackageloaded{makeidx}{%
		\renewcommand{\printindex}{\@input {\jobname .ind}}%
	}{}%
	\@ifpackageloaded{multind}{%
		\renewcommand{\printindex}[2]{%
			{%
			\def\indexname{#2}%
			\@input{#1.ind}%
			}%
		}%
	}{}%
}







% ============================================
%                Dummy pages
% ============================================

\providecommand{\keywordsname}[1]{Keywords}
\providecommand{\authorshort}[1]{\gdef\@authorshort{#1}}
\providecommand{\address}[1]{\gdef\@address{#1}}
\providecommand{\publisher}[1]{\gdef\@publisher{#1}}
\providecommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\providecommand{\series}[1]{\gdef\@series{#1}}
\providecommand{\serialnumber}[1]{\gdef\@serialnumber{#1}}
\providecommand{\pagecount}[1]{\write\@auxout{\string\gdef\string\@pagecount{#1}}\gdef\@pagecount{#1}\gdef\pagecount##1{}}
\providecommand{\URN}[1]{\gdef\@URN{#1}}
\providecommand{\ISBN}[1]{\gdef\@ISBN{#1}}
\providecommand{\ISSN}[1]{\gdef\@ISSN{#1}}
\providecommand{\keywords}[1]{\gdef\@keywords{#1}}
\providecommand{\titlepagelogo}[1]{\gdef\@titlepagelogo{#1}}%
\let\@publisher\relax
\let\@series\relax
\let\@serialnumber\relax
\let\@authorshort\relax
\let\@address\relax
\let\@titlepagelogo\relax
\providecommand{\@pagecount}{??}
\let\@keywords\relax
\let\@ISSN\relax
\let\@ISBN\relax
\let\@URN\relax

\title{Title Page Dummy}
\providecommand{\@subtitle}{This Page will be Replaced before Printing}
\author{ }
\titlepagelogo{UU_logo_sv_42}
\providecommand{\makehalftitle}{%
	\begin{center}%
		\ifx\@publisher\relax\ifx\@series\relax Half Title Dummy Page\par \fi\fi%
		\MakeUppercase{\@publisher}\par%
		\@series\par%
		\@serialnumber\par%
	\end{center}%
}

\renewenvironment{titlepage}{%
	\cleardoublepage%
}{%
	\clearpage%
}

\renewcommand{\maketitle}{%
	\providecommand{\titlepagelogo}{UU_logo_sv_42}%
	\begin {titlepage}%
		\def\first##1{##1}%
		\def\last##1{##1}%
		\def\I##1{##1}%
		\vspace*{40mm}%
		\begin{center}%
			{\Large \@author\par}%
			\vspace{6mm}%
			\Huge{\@title}\par%
			\vspace{6mm}%
			{\fontsize{14}{16}\fontshape{it}\selectfont \@subtitle}%
		\end{center}%
		\begin{figure}[b]%
			\begin{center}%
				\immediate\openin0 =\@titlepagelogo\space%
				\ifeof 0\relax\null%
					%\ClassWarning{UUThesisTemplate warning: Image \@titlepagelogo does not exist, placeholder used.}\null
					\framebox(120,120)[c]{Title page logo}%
				\else%
					\ifx\includegraphics\undefined%
						\framebox(120,120)[c]{Title page logo}%
					\else%
						\includegraphics{\@titlepagelogo}%
					\fi%
				\fi%
				\immediate\closein0%
			\end{center}%
		\end{figure}%
	\end{titlepage}%
	\global \let \title \relax %
	\global \let \author \relax %
	\global \let \and \relax%
}

\newcommand{\dedicationfont}[1]{\gdef\@dedicationfont{#1}}
\newcommand{\@dedicationfont}{\textit}
\newcommand{\dedication}[1]{%
	\cleardoublepage%
	\vspace*{\stretch{3}}%
	\begin{flushright}%
	{\@dedicationfont\Large\selectfont\emph{#1}}%
	\end{flushright}%
	\vspace*{\stretch{1}}%
}


\providecommand{\abstracthead}{}
\providecommand{\abstractfoot}{}
\providecommand{\abstractsection}{\vskip\baselineskip\noindent\textbf{Abstract}\par\noindent\ignorespaces}
\providecommand{\abstractpreamble}{\clearpage\thispagestyle{empty}}
\providecommand{\abstractfont}{\fontsize{9}{11}\fontshape{rm}\selectfont}

\newenvironment{abstract}{%
	\abstractfont\abstractpreamble %
	\abstracthead%
	\abstractsection %
}{%
\abstractfoot%
}

\providecommand{\abstractdummy}[1]{\gdef\@abstractdummy{#1}}
\abstractdummy{\clearpage\vspace*{\stretch{1}}\hfill Abstract Dummy Page. \hfill\vspace*{\stretch{1}}\clearpage}

\newcommand{\frontmatterCS}{\maketitle\@abstractdummy}
\newcommand{\frontmatterMonograph}{\makehalftitle\maketitle\@abstractdummy}

\AtEndDocument{
	\pagecount{\the\c@page}
}




% ============================================
%        Compability and short-hands
% ============================================

	\newenvironment{numberedlist}{
		\begin{enumerate}
		\setlistmargin[5]
    }{\end{enumerate}}

	\newenvironment{numberedlist-indent}{
		\setlength{\UU@listindent}{1cm}
    		\addtolength{\leftmargini}{\UU@listindent}
		\begin{enumerate}
		\setlistmargin[5]
    }{\end{enumerate}}

	\newenvironment{enumerate-indent}{
		\setlength{\UU@listindent}{1cm}
    		\addtolength{\leftmargini}{\UU@listindent}
		\begin{enumerate}
		\setlistmargin[5]
    }{\end{enumerate}}

    \newenvironment{bulletlist}{
		\begin{itemize}
		\setlistmargin
    }{\end{itemize}}
    
    \newenvironment{bulletlist-indent}{
		\setlength{\UU@listindent}{1cm}
    		\addtolength{\leftmargini}{\UU@listindent}
		\begin{itemize}
		\setlistmargin
    }{\end{itemize}}
    
    \newenvironment{itemize-indent}{
		\setlength{\UU@listindent}{1cm}
    		\addtolength{\leftmargini}{\UU@listindent}
		\begin{itemize}
		\setlistmargin
    }{\end{itemize}}
  
    \newenvironment{romanlist}{
        \renewcommand{\labelenumi}{\Roman{enumi}.}
        \renewcommand{\labelenumii}{\roman{enumii}.}
        \begin{enumerate}
        \setlistmargin[8]
    }{\end{enumerate}}
    \newenvironment{romanlist-indent}{
    	\setlength{\UU@listindent}{1cm}
    	\addtolength{\leftmargini}{\UU@listindent}
        \begin{romanlist}
    }
    {\end{romanlist}}
    \newenvironment{simplelist}
        {\begin{list}{}{
            \setlength{\leftmargin}{0mm}
            \setlength{\itemsep}{0mm}
            \setlength{\parsep}{0mm}
            \setlength{\topsep}{0mm}}}
        {\end{list}}
    \newenvironment{simplelist-indent}
        {\begin{list}{}{
            \setlength{\leftmargin}{1cm}
            \setlength{\itemsep}{0mm}
            \setlength{\parsep}{0mm}
            \setlength{\topsep}{0mm}}}
        {\end{list}}
    \newenvironment{definitionlist}[1][]
        {\@afterindenttrue\par\parindent -1em\advance\leftskip-\parindent\renewcommand{\item}[1]{\par{\it #1 ##1} -- \ignorespaces}}
        {\par}
    \newenvironment{definitionlist-indent}[1][]
        {\leftskip 1cm\begin{definitionlist}[#1]}
        {\end{definitionlist}}
    \newcommand{\code}[1]{{\small\texttt{#1}}}
	\newcommand\listheading[1]{%
		\if@noskipsec\leavevmode\fi %
		\par\@tempskipa 13pt \@plus 2pt \@minus 3pt\relax\@afterindentfalse%
		\if@nobreak%
			\everypar{}%
		\else%
			\addpenalty\@secpenalty\addvspace\@tempskipa%
		\fi%
		\noindent\textit{#1}%
	}

        
%\parfillskip=0cm plus 1fill
%\emergencystretch 4em
%\selectlanguage{swedish}
%\hyphenation{}
