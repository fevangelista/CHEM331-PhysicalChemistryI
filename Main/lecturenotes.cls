\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lecturenotes}[2017/04/28 Lecture notes class]
\LoadClass{article}

% Page size and margins
\RequirePackage[letterpaper,
	top= 1in,
	bottom= 1in,
	left= 1in,
	right= 2.5in,
	marginparsep = 0.125in,
	marginparwidth = 1.5in]{geometry}

% Scientific packages
\RequirePackage{siunitx}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{tikz} % Required for drawing custom shapes
\RequirePackage{tikzsymbols}

% Typography
\RequirePackage{fontspec}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{titling}
\RequirePackage{enumitem}
\RequirePackage{bbding}
\RequirePackage{caption}
\RequirePackage{setspace}
\RequirePackage{marginnote}
\RequirePackage{hyperref}
\RequirePackage{booktabs}

% Set fonts
\setmainfont{Adobe Caslon Pro}
\newfontfamily\headingfont[]{RobotoSlab-Regular.ttf}
\titleformat*{\section}{\LARGE\headingfont}
\titleformat*{\subsection}{\normalsize\headingfont}
\renewcommand{\maketitlehooka}{\headingfont}
\captionsetup[figure]{margin=0pt,font=small,labelfont=bf,name=Fig.}

%
% Custom colored boxes
%---------------------------------------------------------------------------------
\RequirePackage[framemethod=default]{mdframed} % Required for creating the theorem, definition, exercise and corollary boxes

% Important equation box
\newmdenv[skipabove=7pt,
skipbelow=7pt,
rightline=false,
leftline=true,
topline=false,
bottomline=false,
linecolor=gray,
backgroundcolor=black!5,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=5pt,
leftmargin=0cm,
rightmargin=0cm,
linewidth=2pt,
innerbottommargin=5pt]{ImportantBox}

%
% Custom theorem styles
%
\newtheoremstyle{ocrenumbox}% % Theorem style name
{0pt}% Space above
{0pt}% Space below
{\normalfont}% % Body font
{}% Indent amount
{\small\bf\sffamily\color{gray}}% % Theorem head font
{\;}% Punctuation after theorem head
{0.25em}% Space after theorem head
{\small\headingfont\color{gray}\thmname{#1}\nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}}% Theorem text (e.g. Theorem 2.1)
\thmnote{\nobreakspace\the\thm@notefont\sffamily\bfseries\color{black}---\nobreakspace#3.}} % Optional theorem note
\renewcommand{\qedsymbol}{$\blacksquare$}% Optional qed square

\newtheoremstyle{blacknumex}% Theorem style name
{9pt}% Space above
{9pt}% Space below
{\small}% Body font set to small size
{} % Indent amount
{\small\bf\sffamily}% Theorem head font
{\;\newline}% Punctuation after theorem head
{0.25em}% Space after theorem head
{\small\headingfont{\tiny\ensuremath{\blacksquare}}\nobreakspace\thmname{#1}\nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}
}% Theorem text (e.g. Theorem 2.1)
\thmnote{\nobreakspace\the\thm@notefont\headingfont\bfseries\nobreakspace(#3).}}% Optional theorem note

\newtheoremstyle{blacknumbox} % Theorem style name
{0pt}% Space above
{0pt}% Space below
{\normalfont}% Body font
{}% Indent amount
{\small\bf\sffamily}% Theorem head font
{\;}% Punctuation after theorem head
{0.25em}% Space after theorem head
{\small\sffamily\thmname{#1}\nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}}% Theorem text (e.g. Theorem 2.1)
\thmnote{\nobreakspace\the\thm@notefont\sffamily\bfseries---\nobreakspace#3.}}% Optional theorem note

% Exercise box	  
\newmdenv[skipabove=7pt,
skipbelow=7pt,
rightline=false,
leftline=true,
topline=false,
bottomline=false,
backgroundcolor=white,%gray!1,
linecolor=gray,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=5pt,
innerbottommargin=5pt,
leftmargin=0cm,
rightmargin=0cm,
linewidth=2pt]{eBox}	

% Defines the theorem text style for each type of theorem to one of the three styles above
\newcounter{dummy} 
\numberwithin{dummy}{section}
\theoremstyle{ocrenumbox}
\newtheorem{problem}{Problem}[section]
\newtheorem{exerciseT}{Exercise}[section]
\theoremstyle{blacknumex}
\newtheorem{exampleT}{Example}[section]
%\theoremstyle{blacknumbox}
%\newtheorem{importantEquationT}[dummy]{ImportantEquation}


%% A custom itemize env
%
%
%\newenvironment{summary} {
%	\begin{enumerate}[label=(\alph*)]
%	\setlength{\itemsep}{3pt}
%	\setlength{\parskip}{0pt}
%	\setlength{\parsep}{0pt}
%}{
%	\end{enumerate}
%}


% Creates an environment for each type of theorem and assigns it a theorem text style from the "Theorem Styles" section above and a colored box from above
\newenvironment{example}
	{\begin{exampleT}}
	{\hfill{\tiny\ensuremath{\blacksquare}}\end{exampleT}}

\newenvironment{exercise}
	{\begin{eBox}\begin{exerciseT}}
	{\hfill{\color{gray}\tiny\ensuremath{\blacksquare}}\end{exerciseT}\end{eBox}}			

\newenvironment{ibox}
	{\begin{ImportantBox}}
	{\end{ImportantBox}}

\newenvironment{iequation}
	{\begin{ImportantBox}\begin{equation}}
	{\end{equation}\end{ImportantBox}}

\newenvironment{summary}
	{
	\subsection*{Summary}
		\begin{ImportantBox}
		\begin{itemize}[label=\raisebox{-0.75ex}{\HandRight}]
		\setlength{\itemsep}{3pt}
		\setlength{\parskip}{0pt}
		\setlength{\parsep}{0pt}
	}
	{\end{itemize}\end{ImportantBox}}

% A customized list of items
\newenvironment{myitems}
	{
		\begin{itemize}
		\setlength{\itemsep}{3pt}
		\setlength{\parskip}{0pt}
		\setlength{\parsep}{0pt}
	}
	{\end{itemize}}

\newcounter{mnotecount}
\renewcommand\themnotecount{$^{\arabic{mnotecount}}$}
\newcommand\mnote[1]{
	\refstepcounter{mnotecount}$^{\arabic{mnotecount}}$\marginpar{
		\setstretch{0.9}\themnotecount\textmd{\footnotesize{#1}}
	}
}
\newcommand\mfigure[1]{
	\marginpar{
		\setstretch{0.9}\themnotecount\textmd{\footnotesize{#1}}
	}
}
