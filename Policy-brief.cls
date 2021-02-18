%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Policy-brief 
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Policy-brief}[2019/04/29, v1.45]
\AtEndOfClass{\RequirePackage{microtype}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions*
\LoadClass{extarticle}

%% Fonts and language
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage{amsmath,amsfonts,amssymb}
\RequirePackage{lmodern}
\RequirePackage[scaled]{helvet}
\RequirePackage[T1]{fontenc}
\RequirePackage{lettrine} % For dropped capitals

%% For the Significance Statement & footnote on the first page
\RequirePackage{afterpage}
\RequirePackage{ifpdf,ifxetex}
\ifpdf\else
  \ifxetex\else
    \def\pgfsysdriver{pgfsys-dvipdfm.def}
    \pdfpagewidth=\paperwidth
    \pdfpageheight=\paperheight
\fi\fi
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{tikz}
\RequirePackage[framemethod=tikz]{mdframed}

\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{tikz}
\RequirePackage[framemethod=tikz]{mdframed}
%% Hyperlinking
\RequirePackage[colorlinks=true, allcolors=Cerulean, urlcolor=blue, citecolor=black]{hyperref}

%% Set up main title page fonts 
\newcommand{\headerfont}{\normalfont\sffamily\fontsize{7}{9} \selectfont}
\newcommand{\footerfont}{\normalfont\sffamily\fontsize{7}{9} \selectfont}
\newcommand{\toptitlefont}{\sffamily\bfseries\fontsize{22pt}{24pt}\selectfont}
\newcommand{\titlefont}{\sffamily\fontsize{16pt}{18pt}\selectfont}
\newcommand{\dropcapfont}{\fontfamily{lmss}\bfseries\fontsize{26pt}{28pt}\selectfont}
\newcommand{\datesfont}{\normalfont\sffamily\fontsize{7}{8}\selectfont}
\newcommand{\absfont}{\normalfont\sffamily\bfseries\fontsize{8}{11}\selectfont}
\newcommand{\keywordsfont}{\normalfont\rmfamily\fontsize{7}{10}\selectfont}
\newcommand{\copyrightfont}{\normalfont\rmfamily\fontsize{6}{8}\selectfont}

%% Set URL link color & font
\renewcommand\UrlFont{\color{blue}\sffamily}

%% Author and affiliation
\RequirePackage{authblk}
\setlength{\affilsep}{8.5pt} % 16.5pts between base of author line and base of affil line
\renewcommand\Authfont{\color{color0}\normalfont\sffamily\bfseries\fontsize{9}{11}\selectfont}
\renewcommand\Affilfont{\color{color0}\normalfont\sffamily\fontsize{7}{8}\selectfont}

\renewcommand\AB@affilsepx{; \protect\Affilfont}

\renewcommand\Authands{, and }

%% Choose template type
\newcommand*{\templatetype}[1]{%
  \RequirePackage{#1}}

%% Options for element switching
\RequirePackage{xifthen}
\newboolean{shortarticle}
\newboolean{singlecolumn}

%% For numbering just one line of an equation
\newcommand\numberthis{\addtocounter{equation}{1}\tag{\theequation}}



%% Graphics, tables and other formatting
\RequirePackage{graphicx,xcolor}
%\RequirePackage{colortbl}
\RequirePackage{booktabs}
\RequirePackage{algorithm}
\RequirePackage[noend]{algpseudocode}
\RequirePackage{changepage}
\RequirePackage[twoside,%
				letterpaper,includeheadfoot,%
				layoutsize={8.125in,10.875in},%
                layouthoffset=0.1875in,%
                layoutvoffset=0.0625in,%
                left=38.5pt,%
                right=43pt,%
                top=43pt,% 10pt provided by headsep
                bottom=32pt,%
                headheight=0pt,% No Header
                headsep=10pt,%
                footskip=25pt,
                marginparwidth=38pt]{geometry}
\RequirePackage[labelfont={bf,sf},%
                labelsep=colon,%
                figurename=Figure]{caption}
\setlength{\columnsep}{13.5pt} % Distance between the two columns of text
\setlength{\parindent}{12pt} % Paragraph indent

%% Set document color scheme
\definecolor{black50}{gray}{0.5} % 50% black for hrules
\definecolor{color0}{RGB}{0,0,0} % Base
%\definecolor{color1}{RGB}{59,90,198} % author email, doi
%\definecolor{color2}{RGB}{16,131,16} %

%% Bibliography
%% v1.41 (15/11/2016)
\RequirePackage[authoryear]{natbib}
\setlength{\bibsep}{0.0pt}
\bibliographystyle{ApalikeDOI}

%\renewcommand{\bibsection}{} % Remove header
\renewcommand\bibfont{\normalfont\sffamily\fontsize{8}{10}\selectfont} % set font to be sans serif

 
\renewcommand\@biblabel[1]{ #1.} % Remove brackets from label
\def\tagform@#1{\maketag@@@{\bfseries(\ignorespaces#1\unskip\@@italiccorr)}}
\renewcommand{\eqref}[1]{\textup{{\normalfont Eq.~(\ref{#1}}\normalfont)}}


%% Figure caption style
\DeclareCaptionFormat{stdformat}{\normalfont\sffamily\fontsize{7}{9}\selectfont#1#2#3}
\captionsetup*{format=stdformat}

%% Table style
\RequirePackage{etoolbox}
\captionsetup*[table]{labelfont+={small},textfont+={small,sf,bf},skip=10pt,position=above}
% booktabs provide nice spacing, but rule widths and distances need fixing
\setlength{\heavyrulewidth}{0.5pt}
\setlength{\lightrulewidth}{0.5pt}
\setlength{\aboverulesep}{1.5pt}
\setlength{\belowrulesep}{1.5pt}
\setlength{\belowbottomsep}{10pt}
\AtBeginEnvironment{tabular}{
\sffamily\fontsize{7.5}{10}\selectfont
}
\newcommand{\addtabletext}[1]{{\setlength{\leftskip}{9pt}\fontsize{7}{9}\selectfont#1}}

%% Equation numbering - use square brackets

\renewcommand\tagform@[1]{\maketag@@@ {[\ignorespaces #1\unskip \@@italiccorr ]}}


%% Headers and footers
\RequirePackage{fancyhdr}  % custom headers/footers
\RequirePackage{lastpage}
\pagestyle{fancy}
% Enables the custom headers/footers
\fancypagestyle{plain}{
   \fancyfoot[R]{\footerfont Policy Brief\hspace{7pt}|\hspace{7pt}\textbf{\today}\hspace{7pt}|\hspace{7pt}\textbf{\thepage}}
   \fancyfoot[L]{\footerfont\@ifundefined{@leadauthor}{}{\@leadauthor}\hspace{7pt}|\hspace{7pt}\@ifundefined{@toptitle}{}{\textit{\@toptitle}}}
}


% Headers
\fancyhead[LE,RO]{}
\fancyhead[LO,RE]{}
% Footers
\lfoot{}%
\cfoot{}%
\rfoot{}%

\fancyfoot[LE]{\footerfont\textbf{\thepage}\hspace{7pt}|\hspace{7pt}\footerfont\@ifundefined{@leadauthor}{}{\@leadauthor}\hspace{7pt}|\hspace{7pt}\@ifundefined{@toptitle}{}{\textit{\@toptitle}}}
\fancyfoot[LO]{\footerfont\@ifundefined{@leadauthor}{}{\@leadauthor}\hspace{7pt}|\hspace{7pt}\@ifundefined{@toptitle}{}{\textit{\@toptitle}}}
\fancyfoot[RO]{\footerfont Policy Brief\hspace{7pt}|\hspace{7pt}\textbf{\today}\hspace{7pt}|\hspace{7pt}\textbf{\thepage}}
\fancyfoot[RE]{\footerfont Policy Brief\hspace{7pt}|\hspace{7pt}\textbf{\today}}

\renewcommand{\headrulewidth}{0pt}% % No header rule
\renewcommand{\footrulewidth}{0pt}% % No footer rule

%% Section/subsection/paragraph set-up
\RequirePackage[explicit]{titlesec}
\setcounter{secnumdepth}{5}
\renewcommand{\thesubsection}{\Alph{subsection}}


\renewcommand\section{%
\@startsection{section}{1}{\z@}%
              {-3.5ex \@plus -1ex \@minus -.2ex}%
              {2.3ex \@plus.2ex}%
              {\color{Cerulean}\sffamily\Large\bfseries}}

\titleformat{\section}
  {\large\sffamily\bfseries}
  {\thesection.}
  {0.5em}
  {#1}
  []
\titleformat{name=\section,numberless}
  {\large\sffamily\bfseries}
  {}
  {0em}
  {#1}
  []  
\titleformat{\subsection}[runin]
  {\sffamily\bfseries}
  {\thesubsection.}
  {0.5em}
  {#1. }
  []
\titleformat{\subsubsection}[runin]
  {\sffamily\small\bfseries\itshape}
  {\thesubsubsection.}
  {0.5em}
  {#1. }
  []    
\titleformat{\paragraph}[runin]
  {\sffamily\small\bfseries}
  {}
  {0em}
  {#1} 
\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{2pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{2pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{12pt}

%% Article meta data additional fields
\newcommand{\additionalelement}[1]{\def\@additionalelement{#1}}
\newcommand{\toptitle}[1]{\def\@toptitle{#1}}
\newcommand{\dates}[1]{\def\@dates{#1}}
\newcommand{\leadauthor}[1]{\def\@leadauthor{#1}}
\newcommand{\etal}[1]{\def\@etal{#1}}
\newcommand{\keywords}[1]{\def\@keywords{#1}}
\newcommand{\equalauthors}[1]{\def\@equalauthors{#1}}

%% Dropped capital for first letter of main text
\newcommand{\dropcap}[1]{\lettrine[lines=2,lraise=0.05,findent=0.1em, nindent=0em]{{\dropcapfont{#1}}}{}}

%% Abstract formatting
\def\xabstract{abstract}
\long\def\abstract#1\end#2{\def\two{#2}\ifx\two\xabstract 
\long\gdef\theabstract{\ignorespaces#1}
\def\go{\end{abstract}}\else
\typeout{^^J^^J PLEASE DO NOT USE ANY \string\begin\space \string\end^^J
COMMANDS WITHIN ABSTRACT^^J^^J}#1\end{#2}
\gdef\theabstract{\vskip12pt BADLY FORMED ABSTRACT: PLEASE DO
NOT USE {\tt\string\begin...\string\end} COMMANDS WITHIN
THE ABSTRACT\vskip12pt}\let\go\relax\fi
\go}

% Define an environment with abstract content and styling
\newcommand{\abscontent}{
\noindent
\parbox{\dimexpr\linewidth}{%
    \vskip3pt%
	\absfont \theabstract
}%
%\vskip10pt%
\noindent
\parbox{\dimexpr\linewidth}{%
{
 \keywordsfont \@ifundefined{@keywords}{}{\@keywords}}%
}
%\vskip12pt%
}

% Option to format abstract differently for certain layouts (not used)
\newcommand{\abscontentformatted}{
\abscontent
}

%% Manual adjustment to line up main content with line numbers
\newlength\std@vertadjust
\newcommand\verticaladjustment[1]{\setlength{\std@vertadjust}{#1}}

%% Custom title page 
\renewcommand{\@maketitle}{

\vskip10pt%
{\raggedright\baselineskip= 24pt\toptitlefont \@toptitle\par}
\vskip15pt%
{\raggedright\baselineskip= 16pt\titlefont \@title\par}%
\vskip20pt% 21pts between base of title and base of author line
{\raggedright \@author\par}
\vskip8pt% 16pts between base of affiliations and base of dates line 
{\raggedright \datesfont \@ifundefined{@dates}{}{\@dates}\par}
\vskip10pt
{%
\abscontent
}%
\vskip10pt%

%%%
%\@additionalelement
%}%
\vskip\std@vertadjust
}



%% Footnotes set up
\RequirePackage[flushmargin,ragged,symbol*]{footmisc}
\renewcommand*{\footnotelayout}{\normalfont\sffamily\fontsize{6}{8}\selectfont} % set the footnote font
\renewcommand{\footnoterule}{% Set the footnote hrule style
  \kern -3pt
  {\color{black50} \hrule width 72pt height 0.25pt}
  \kern 2.5pt
}


%% Other packages
\RequirePackage{enumitem} % For reducing bullet list item separation

%% For sidecaptions
\RequirePackage[rightcaption]{sidecap}

%% Define widetext as a double-column float, with a warning
\RequirePackage{float}
\RequirePackage{stfloats}
\RequirePackage{marginnote}
\floatstyle{plain}
\newfloat{@widetext}{hbt!}{wtt}
\newenvironment{widetext}{%
  \PackageWarning{Policy-brief}{Use of `widetext` is not recommended. We will now place it at the top or bottom of a page.}
  \begin{@widetext*}[bt!]
  \marginnote{\itshape\footnotesize\color{red}Use of \texttt{widetext} is not recommended.}
  \hrule
}{
  \hrule
  \end{@widetext*}
}


\endinput