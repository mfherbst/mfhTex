%
% Class for a basic poster, based largely on baposter,
% just modifying some of its defaults.
%
% Options:
%  fontscale  Change the overall font size.
%             Smaller values mean larger fonts.
%             Ideal value is between 0.29 and 0.35
%             Recommended value is 0.32
%
\NeedsTeXFormat{LaTeX2e}

% update when new stuff added
\ProvidesClass{MFHposter}[2016/09/21]

%%%%%%%%%%%%%%%%%
%--  Options  --%
%%%%%%%%%%%%%%%%%

% To parse this we need xkeyval and baposter
\RequirePackage{xkeyval}

\DeclareOptionX{fontscale}{
	% Font scale: Smaller values mean larger fonts
	% Try to use value around 0.32
	\PassOptionsToClass{\CurrentOption}{baposter}
}

% Fallback
\DeclareOption*{
	\ClassWarning{MFHposter}{Unknown option '\CurrentOption'}
}

% Process given options:
\ProcessOptionsX

% Load base class:
\LoadClass[portrait,a0paper]{baposter}

%%%%%%%%%%%%%%%%%%
%--  Packages  --%
%%%%%%%%%%%%%%%%%%

% Package which replaces itemize, description and enumerate environments
% by more flexible alternatives
\usepackage{enumitem}

% use package xcolor
\usepackage[dvipsnames]{xcolor}

% Change space between paragraphs properly
\usepackage{parskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--  Changes to baposter defaults  --%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setkeys[ba]{poster}{
	%
	% General stuff
	%
	% Change default number of columns to 2
	columns=2,
	% Distance between the columns:
	colspacing=1em,
	% Do we have an eyecatcher
	eyecatcher=false,
	%
	% Background
	%
	background=plain,
	bgColorOne=white,
	bgColorTwo=white,
	%
	% Height of the header of the poster title
	%
	headerheight=0.17\textheight,
}{}

\setkeys[ba]{posterbox}{
	%
	% Textbox border and font
	%
	% Width of all border lines
	linewidth=0.7pt,
	boxpadding=0.7em,
	textborder=roundedsmall,
	textfont={%
		% Reduce default paragraph indent to nothing
		\setlength{\parindent}{0.0cm}%
		%
		% Reduce the space between paragraphs
		\setlength{\parskip}{0.15em}%
		%
		% Set space between text and margin notes
		\setlength{\marginparsep}{0.5em}%
	},
	%
	% Textbox background
	%
	boxshade=plain,
	boxColorOne=white,
	boxColorTwo=white,
	%
	% Format of textbox headers
	%
	headerborder=closed,
	headershape=roundedright,
	headershade=shadelr,
	headerfont=\large\larger\bfseries\hspace{0.5ex},
	%
	% Colours for the textboxes (themeable)
	%
	borderColor=PosterBoxBorder,
	headerColorOne=PosterHeaderLhs,
	headerColorTwo=PosterHeaderRhs,
	headerFontColor=PosterHeaderFont,
}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--  Theme definitions  --%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\mfhposter@theme@iwrblue}{
	\definecolor{PosterHeaderLhs}{rgb}{0.066,  0.180,  0.285}
	\definecolor{PosterHeaderRhs}{rgb}{0.156, 0.441, 0.644}
	\colorlet{PosterBoxBorder}{PosterHeaderLhs}
	\definecolor{PosterAlertColor}{rgb}{.90196, .36470, .06666}
	\definecolor{PosterHeaderFont}{rgb}{1.,1.,1.}
}

%%%%%%%%%%%%%%%%%%%%%
%--  Other latex  --%
%%%%%%%%%%%%%%%%%%%%%

% Command to load a theme
\newcommand{\usepostertheme}[1]{%
	\ifthenelse{\equal{#1}{iwrblue}}{%
		\mfhposter@theme@iwrblue%
	}{%
		\error{MFHposter: Theme #1 unknown.}%
	}%
}

% Remove the "Bibliograpy" or "References" header for the thebibliograpy
\renewcommand{\refname}{}	%empty references header

%
% Command and environments
%

% save space in lists: Use this after opening of the list:
\newcommand{\compresslist}{%
	\setlength{\itemsep}{0.05em}%
	\setlength{\parsep}{0.2ex}%
	\setlength{\parskip}{0.05em}%
}

% command to use for words that should catch the eye
\newcommand{\alert}[1]{\textbf{\textcolor{PosterAlertColor}{#1}}}

\newcommand{\makeimagetitle}[5]{%
	% Typeset a poster title which has a background image
	%
	%  #1:  Poster title picture (as background)
	%  #2:  Poster title
	%  #3:  Poster Authors Text
	%  #4:  Poster Institute Text
	%  #5:  Author contact information
	\begin{tikzpicture}
		\draw (0,0) node [opacity=0.9] {\includegraphics[width=\textwidth]{#1}};
		\draw (1,1.3) node[align=left] {%
			\begin{minipage}{\textwidth}
				\linespread{0.9}
				\Huge{\bfseries{#2}}
			\end{minipage}
		}; %title
		\draw (1,-.2) node {%
			\begin{minipage}{\textwidth}
				\linespread{0.9}
				\normalsize{#3}
			\end{minipage}
		}; %authors
		\draw (1,-1.2) node {%
			\begin{minipage}{\textwidth}
				\linespread{0.9}
				\normalsize{#4}
			\end{minipage}
		}; %institute
		\draw (1,-2.1) node {%
			\begin{minipage}{\textwidth}
				\linespread{0.9}
				\small{#5}
			\end{minipage}
		}; %Contact
	\end{tikzpicture}
}

\newenvironment{mfhposter}[4]{%
%       Wrapper around baposter's poster environment
%       currently only removes the eye-catcher argument
%
%       #1:  Poster title
%       #2:  Poster subtitle
%       #3:  Poster title RHS logo
%       #4:  Baposter options
%
\begin{poster}%
  % Poster Options
  {#4}%
  % Eye Catcher
  {}% (disabled in default options)
  % Title field
  {#1}%
  % Subtitle field
  {#2}%
  % University logo - Left empty
  {#3}%
}%
{%
	 \end{poster}%
}

\endinput
