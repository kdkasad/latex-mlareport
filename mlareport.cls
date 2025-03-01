% vim: ft=tex

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{mlareport}[2022/04/27 MLA Report]

%
% Load base article class
%
\LoadClass[12pt,letterpaper]{article}

%
% Page setup
%
\RequirePackage{geometry}
\geometry{letterpaper, top=1in, left=1in, bottom=1in, right=1in}

%
% Font - TeX Gyre Termes
% (Times equivalent)
%
\RequirePackage{fontenc}
\RequirePackage{unicode-math}
\setmainfont{TeX Gyre Termes}
\setmathfont{TeX Gyre Termes Math}

%
% Set spacing options
%
\raggedright
\setlength{\parindent}{0.5in}
\RequirePackage{setspace}
\doublespacing
\frenchspacing

% Spacing before/after lists
\RequirePackage{enumitem}
\setlist{nosep}

%
% URL support
%
\RequirePackage[hidelinks]{hyperref}
\urlstyle{same}
\hypersetup{pdfduplex=Simplex}
\renewcommand{\url}[1]{\href{https://#1}{\nolinkurl{#1}}}

%
% Create first page heading and title
%

% Title command
\renewcommand{\title}[1]{\renewcommand{\@title}{#1}%
	\hypersetup{pdftitle={\@title}}}
\renewcommand{\@title}{\ClassError{No \noexpand\title{} given}}

% Author command
\renewcommand{\author}[2]{\renewcommand{\@authorfirst}{#1}%
	\renewcommand{\@authorlast}{#2}%
	\hypersetup{pdfauthor={\@authorfirst{} \@authorlast{}}}}
\newcommand{\@authorfirst}{\ClassError{No \noexpand\author{} given}}
\newcommand{\@authorlast}{\ClassError{No \noexpand\author{} given}}

% Instructor command
\newcommand{\instructor}[1]{\renewcommand{\@instructor}{#1}}
\newcommand{\@instructor}{\ClassError{No \noexpand\instructor{} given}}

% Course command
\newcommand{\course}[1]{\renewcommand{\@course}{#1}}
\newcommand{\@course}{\ClassError{No \noexpand\course{} given}}

% Subject command
\newcommand{\subject}[1]{\hypersetup{pdfsubject={#1}}}

% Define \makeheading command
\newcommand{\makeheading}%
{ { \raggedright \noindent %
\@authorfirst{} \@authorlast{} \\
\@instructor{} \\
\@course{} \\
\@date{} \\
} }

% Redifine \maketitle command
\renewcommand{\maketitle}{%
	{ \centering \@title \par }%
}

%
% Header/footer
%
\RequirePackage{fancyhdr}
\RequirePackage{calc}
\fancyhf{}
\pagestyle{fancy}

% Author's last name and page number in top right corner
\rhead{\@authorlast{} \thepage}

% No line separating the header/footer and the body
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Place header half an inch from the top of the page. The header will be a
% distance of 1in + \topmargin away from the top of the page.
\setlength{\topmargin}{-0.5in}

% Place the text 1 inch from the top of the page. \headsep is the distance from
% the bottom of the header to the body. So the distance from the top of the
% page to the body is 1in + \voffset + \topmargin + \headheight + \headsep.
\setlength{\headheight}{15pt}
\setlength{\headsep}{0.5in - \headheight}

%
% Works cited
%

% Environment definition
\newenvironment{workscited}%
{ \newpage  { \centering Works Cited \par } }%
{ \newpage }

% Command to format each entry
\newcommand{\wcentry}{\noindent \hangindent 40pt}

% Missing citation warning.
% Will use red if the 'colorx' package is loaded.
\RequirePackage{ifthen}
\AtBeginDocument{%
	\@ifpackageloaded{xcolor}%
		{\newcommand{\@havecolors}{1}}%
		{\newcommand{\@havecolors}{0}}
}
\newcommand{\needcite}{%
	\ifthenelse{\@havecolors = 1}%
		{\textcolor{red}{(citation needed)}}%
		{(citation needed)}%
}

%
% Notes page
%
\newenvironment{notes}%
	{ \newpage \centering Notes \par \begin{enumerate} \centering }%
	{ \end{enumerate} \newpage }

%
% Labeled footnotes
%
\newcommand{\fntext}[2]{%
	\expandafter\newcommand \csname fntext:#1 \endcsname {#2}%
}
\newcommand{\fn}[1]{%
	\footnote{\csname fntext:#1 \endcsname}%
}

%
% Footnote formatting:
%  - give footnotes a hanging indent instead of a first-line indent
%  - put space between the footnote mark and text
%
\newlength{\fnhangindent}
\renewcommand\@makefntext[1]{%
	\raggedright%
	\noindent%
	\settowidth{\fnhangindent}{\@makefnmark\ }%
	\hangindent \fnhangindent%
	\@makefnmark\ #1}

% vim: ft=tex ts=4 sw=4 noet
