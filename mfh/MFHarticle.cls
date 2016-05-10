% 
% Class for a basic article. Use this and you are ready to go.
%
\NeedsTeXFormat{LaTeX2e}

% update when new stuff added
\ProvidesClass{MFHarticle}[2016/05/10]

%%%%%%%%%%%%%%%%%
%--  Options  --%
%%%%%%%%%%%%%%%%%

% Article default options
\DeclareOption{10pt}{
	\PassOptionsToClass{\CurrentOption}{article}
}
\DeclareOption{12pt}{
	\PassOptionsToClass{\CurrentOption}{article}
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

% Default geometry:
\usepackage[left=2.5cm,right=2.5cm,top=3cm,bottom=3cm]{geometry}

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
