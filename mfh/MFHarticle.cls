% 
% Class for a basic article. Use this and you are ready to go.
%
\NeedsTeXFormat{LaTeX2e}

% update when new stuff added
\ProvidesClass{MFHarticle}[2016/05/10]

%%%%%%%%%%%%%%%%%
%--  Options  --%
%%%%%%%%%%%%%%%%%
\newif\if@widepage\@widepagefalse
\DeclareOption{widepage}{
	% Make the page geometry larger
	\@widepagetrue
}

\newif\if@twocolumn\@twocolumnfalse
\DeclareOption{twocolumn}{
	% Setup a twocolumn layout
	\PassOptionsToClass{\CurrentOption}{article}
	\@twocolumntrue
}

% Fallback
\DeclareOption*{
	\ClassWarning{MFHarticle}{Unknown option '\CurrentOption'}
}

% Execute default options:
\ExecuteOptions{10pt}

% Process given options:
\ProcessOptions\relax

% Load base class:
\LoadClass[a4paper]{article}

%%%%%%%%%%%%%%%%%%
%--  Packages  --%
%%%%%%%%%%%%%%%%%%

% Package for \numberwithin
\usepackage{amsmath}

% Column separation for twocolumn
\if@twocolumn
	\setlength{\columnsep}{2em}
\fi

% Default geometry:
\if@widepage
	\if@twocolumn
		\usepackage[left=1.3cm,right=1.3cm]{geometry}
	\else
		\usepackage{geometry}
	\fi
\else
	\if@twocolumn
		\usepackage[left=2cm,right=2cm]{geometry}
	\else
		\usepackage[left=3.8cm,right=3.8cm]{geometry}
	\fi
\fi

% Package which replaces itemize, description and enumerate environments
% by more flexible alternatives
\usepackage{enumitem}

% Make references as links:
\usepackage{hyperref}

%%%%%%%%%%%%%%%%%%%%%
%--  Other latex  --%
%%%%%%%%%%%%%%%%%%%%%

% Have running headings for each page
\pagestyle{headings}

% At \begin{document}
\AtBeginDocument{%
	\numberwithin{equation}{section}%
}

\endinput
