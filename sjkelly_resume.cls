%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resumeV2}[2010/07/10 v0.9 Resume class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage[left=0.3in,top=0.3in,right=0.3in,bottom=0.3in]{geometry} % Document margins
\usepackage[colorlinks=true, urlcolor=blue]{hyperref}	%hyperlinks
\usepackage{setspace}	% line spacing
\usepackage{multicol}
\pagestyle{empty} % Suppress page numbers


%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1 \vspace{-10pt}}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\def \addressSep {$\bullet$} % Set default address separator to a diamond $\diamond$ \star

% One, two or three address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
  \@ifundefined{@addressthree}{
  \def \@addressthree {#1}
  }{
     \def \@addressone {#1}
  }}
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
    \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
    \nameskip\break
  \endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \printname % Print the name specified with \name
  \@ifundefined{@addressone}{}{ % Print the first address if specified
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{ % Print the second address if specified
    \printaddress{\@addresstwo}}
     \@ifundefined{@addressthree}{}{ % Print the third address if specified
    \printaddress{\@addressthree}}
    
    \vspace{-12pt}	% decrease space between heading and first section
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the mainSection environment for the large sections within the CV
\newenvironment{mainSection}[1]{ % 1 input argument - section name
	\MakeUppercase{\bf #1}
	%\sectionlineskip
	\vspace{-0.4em}		% reduce space between the section title and anything after
	
	\begin{list}{}{ % List for each individual item in the section
   		\setlength{\leftmargin}{1.5em} 	% Margin within the section
   		\setlength{\itemsep}{0pt}
     		\setlength{\parsep}{0.5em}	%seperation between section titles and their body
     		\setlength{\topsep}{0pt}
     		\setlength{\partopsep}{0pt}
  	}
 	\item[]
	}{
  	\end{list}
}

\newenvironment{mainCompactSection}[1]{
	\MakeUppercase{\bf #1}
	%\sectionlineskip
	\vspace{-0.4em}		% reduce space between the section title and anything after
	
	\begin{list}{}{ % List for each individual item in the section
   		\setlength{\leftmargin}{1.5em} % Margin within the section
   		\setlength{\itemsep}{0pt}
     		\setlength{\parsep}{0em}
     		\setlength{\topsep}{0pt}
     		\setlength{\partopsep}{0pt}
  		}\item[]}{
  	\end{list}
  }

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

% Defines subsection for the work experience subsection
\newenvironment{experienceSubsection}[4]{% 4 input arguments - company name, year(s) employed, job title and location
	%\setlength{\parsep}{10pt}
	{\bf{#3}}, {#1}, {#4}\hfill {#2} % Bold company name and date on the right
  	\vspace{-0.5em}			% reduce space between job title and list of job descriptions
 	\begin{list}{$\cdot$}{\leftmargin=1em \parsep=0pt} 	% \cdot used for bullets, no indentation $\cdot$ $\bullet$
   		 %\itemsep -0.5em 				% Compress items in list together for aesthetics
	}{
  	\end{list}
}

\newenvironment{projectsSubsection}[4]{ 			% 4 input arguments - project name, date(s),  location, type
 	%\vspace{0.2em}		%reduce space between projects
 	{\bf{#1}}, \ifthenelse{\equal{#3}{}}{}{{\textnormal #3}, }{\em{#4}}\hfill{#2}% If the third argument is not specified, don't print the job title and 
	%\vspace{-0.5em}	%reduce space between items
	\begin{list}{}{\leftmargin=1em \parsep=0pt \topsep=-0.4em} 	% \cdot used for bullets, no indentation $\cdot$ $\bullet$
		%\itemsep -1em 				% Compress items in list together for aesthetics
	}{\end{list}
}

\newenvironment{generalSubsection}[4]{ % 4 input arguments - {project name}{location}{date(s)}{type}
 	{\bf{#1}}\ifthenelse{\equal{#2}{#4}{}}{}{, }\ifthenelse{\equal{#4}{}}{}{\textnormal#4}\ifthenelse{\equal{#2}{}}{}{, {\em #2}}\hfill {#3}								%item name bolded
	%if 2(location) or 4(type) are present, include the comma
			%if #4(type) is present, include it
			%if #2 (location) is present, include it
		% If the third argument is not specified, don't print the job title and 
 	%\vspace{0.5em}
}

\newcommand{\skillSubsection}[2]{ % 4 input arguments - {project name}{location}{date(s)}{type}
	{\bf{#1}}&{\hspace{6pt}\textnormal #2}\\
}

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\Large} 		% Size of the name at the top of the document
\def\addressskip{\large} 	% The space between the two address (or phone/email) lines
\def\sectionlineskip{\smallskip} 	% The space above the horizontal line for each section 
\def\nameskip{\bigskip} 		% The space after your name at the top
\def\sectionskip{\smallskip} 	% The space after the heading section
