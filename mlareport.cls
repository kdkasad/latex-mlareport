% vim: ft=tex

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{mlareport}[2022/03/30 MLA Report]

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
\setlength{\headsep}{0.5in - \headheight}

%
% Works cited
%

% Environment definition
\newenvironment{workscited}%
{ \newpage { \centering Works Cited \par } }%
{ \newpage }

% Command to format each entry
\newcommand{\wcentry}{\noindent \hangindent 40pt}
