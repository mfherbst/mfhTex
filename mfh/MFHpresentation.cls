%
% Class for a presentation.
%
\NeedsTeXFormat{LaTeX2e}

% update when new stuff added
\ProvidesClass{MFHpresentation}[2016/10/10]

%%%%%%%%%%%%%%%%%
%--  Options  --%
%%%%%%%%%%%%%%%%%
\DeclareOption{draft}{
	\PassOptionsToClass{\CurrentOption}{beamer}
}

\DeclareOption{xcolor}{
	\PassOptionsToClass{\CurrentOption}{beamer}
}

\newif\if@statusslides\@statusslidestrue
\DeclareOption{nostatus}{
	% Do not show status slides
	\@statusslidesfalse
}

\newif\if@logoall\@logoallfalse
\DeclareOption{logoall}{
	% Show the logo on all slides
	\@logoalltrue
}

% Fallback
\DeclareOption*{
	\ClassWarning{MFHpresentation}{Unknown option '\CurrentOption'}
}

% Process given options:
\ProcessOptions\relax

% Load base class:
\LoadClass[mathserif,xcolor={dvipsnames}]{beamer}

%%%%%%%%%%%%%%%%%%
%--  Packages  --%
%%%%%%%%%%%%%%%%%%

\usepackage{lmodern}	%Font
\usepackage{colortbl}	%dynamic tables
\usepackage{pgfpages}	%for notes on second screen
\usepackage{ifthen}

\usepackage{bibentry}   %for \footcite, \secondcite
\usepackage{chngcntr}   %for \footcite, \secondcite

\usepackage{tikz}       % for \usetikzlibrary

% Package for \numberwithin
\usepackage{amsmath}

% Allow visible on <2-> property in TikZ
\usetikzlibrary{overlay-beamer-styles}

% NOTE: The package enumitem is not compatible with beamer
% This is why it is not used here

%%%%%%%%%%%%%%%%%%%%%%%%
%--  Special slides  --%
%%%%%%%%%%%%%%%%%%%%%%%%

% Define a conditional whether to place the logo on the current slide
% See for details:
% https://tex.stackexchange.com/questions/53781/how-can-i-include-the-logo-in-some-slides-and-remove-in-others-using-beamer%5C
\newif\ifshowlogo

% Set the default (depending on what user wants)
\if@logoall
	\showlogotrue
\else
	\showlogofalse
\fi

% Status in the talk
\newcommand{\statusframe}[1][]{%
	% Enable logo for the status frame in all cases
	\showlogotrue

	% Show the status frame
	\frame{%
		\frametitle{\contentsname}
		\ifthenelse{  \equal{#1}{full}  }{%
			\tableofcontents%
		}{%
			\tableofcontents[currentsection]%
		}
	}

	% Set back to default
	\if@logoall
		\showlogotrue
	\else
		\showlogofalse
	\fi
}

% inserts a full table of contents slide
\newcommand{\tocframe}{\statusframe[full]}

% inserts a black frame
\newcommand{\blackframe}{
	\bgroup
	\setbeamercolor{background canvas}{bg=black}
	\setbeamertemplate{navigation symbols}{}
	\addtocounter{framenumber}{-1}
	\begin{frame}<handout:0>[plain]{}	%show plain black frame, but not in handout
	\end{frame}
	\egroup
}

\newenvironment{extraslides}{%
	\newcounter{framenumberextra}
	\setcounter{framenumberextra}{\value{framenumber}}
	\newif\if@statusslidesrestore
	\@statusslidesrestorefalse
	\if@statusslides
		\@statusslidesrestoretrue
	\fi
	\@statusslidesfalse
}{%
	\addtocounter{framenumberextra}{-\value{framenumber}}
	\addtocounter{framenumber}{\value{framenumberextra}}
	\if@statusslidesrestore
		\@statusslidestrue
	\fi
}

%%%%%%%%%%%%%%%%%%
%--  Commands  --%
%%%%%%%%%%%%%%%%%%

%
% Bibliograpy on slides
%
\counterwithin*{footnote}{page}
% cite a bibtex entry in the footnote (first occurence)
\newcommand\footcite[1]{\footnote{\smaller\bibentry{#1}\label{\thepage:#1}}}
% cite a bibtex entry in the footnote (second occurence)
\newcommand\secondcite[1]{\textsuperscript{\ref{\thepage:#1}}}

%%%%%%%%%%%%%%%%%%%%%
%--  Other latex  --%
%%%%%%%%%%%%%%%%%%%%%

% Automatic slides at each section
\AtBeginSection[] {
	\if@statusslides\statusframe\fi
}

% At \begin{document}
\AtBeginDocument{%
	\numberwithin{equation}{section}%

	% Patch beamer logo template, such that
	% the logo is only shown if showlogo is true
	\addtobeamertemplate{logo}{\ifshowlogo}{\fi}

	% Make sure that the references are all in black
	% foreground colour only.
	\setbeamercolor*{bibliography entry title}{fg=black}
	\setbeamercolor*{bibliography entry author}{fg=black}
	\setbeamercolor*{bibliography entry location}{fg=black}
	\setbeamercolor*{bibliography entry note}{fg=black}
	\setbeamertemplate{bibliography item}{}

	% Reduce footnote size
	\setbeamerfont{footnote}{size=\smaller}
}

\endinput
