% 
% Class for a basic article. Use this and you are ready to go.
%
\NeedsTeXFormat{LaTeX2e}

% update when new stuff added
\ProvidesClass{MFHbook}[2016/08/02]

%%%%%%%%%%%%%%%%%
%--  Options  --%
%%%%%%%%%%%%%%%%%
\newif\if@widepage\@widepagefalse
\DeclareOption{widepage}{
	% Make the page geometry larger
	\@widepagetrue
}

\DeclareOption{oneside}{
	\PassOptionsToClass{\CurrentOption}{book}
}
\DeclareOption{twoside}{
	\PassOptionsToClass{\CurrentOption}{book}
}
\DeclareOption{10pt}{
	\PassOptionsToClass{\CurrentOption}{book}
}
\DeclareOption{12pt}{
	\PassOptionsToClass{\CurrentOption}{book}
}
\DeclareOption{a4paper}{
	\PassOptionsToClass{\CurrentOption}{book}
}

% Fallback
\DeclareOption*{
	\ClassWarning{MFHbook}{Unknown option '\CurrentOption'}
}

% Execute default options:
\ExecuteOptions{10pt}

% Process given options:
\ProcessOptions\relax

% Load base class:
\LoadClass[a4paper]{book}

%%%%%%%%%%%%%%%%%%
%--  Packages  --%
%%%%%%%%%%%%%%%%%%

% Package for \numberwithin
\usepackage{amsmath}

% Default geometry:
\if@widepage
	\usepackage{geometry}
\else
	\usepackage[left=3.8cm,right=3.8cm]{geometry}
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
%\pagestyle{headings}

% At \begin{document}
\AtBeginDocument{%
	\numberwithin{equation}{chapter}%
}

\endinput
