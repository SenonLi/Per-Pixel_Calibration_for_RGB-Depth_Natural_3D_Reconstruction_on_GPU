%% FILE: ukthesis.cls
%% AUTHOR: Sen Li
%% USAGE: To meet the formatting requirements for the University of
%% Kentucky Graduate school
%% VERSION: 1.0.0 (July 06, 2016)

\def\fileversion{v1.0.0} 
\def\filedate{2016/07/06}

\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{ukthesis}[\filedate\space\fileversion\space UK thesis class]

\newif\if@draft
\newif\if@pretty\@prettyfalse%use nice formatting instead of the grad schools
                %requirements 
\newif\if@sigs\@sigstrue%include names on the sig lines
%\newif\if@nofigures

\DeclareOption{nosignatures}{\@sigsfalse}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{memoir}}
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{memoir}}
\DeclareOption{draft}{\@drafttrue\PassOptionsToClass{draft}{memoir}}
\DeclareOption{pretty}{\@prettytrue}
\DeclareOption{final}{\@prettyfalse\@sigstrue\PassOptionsToClass{final,oneside,12pt}{memoir}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{memoir}}
\DeclareOption{oneside}{\PassOptionsToClass{oneside}{memoir}}
\DeclareOption{letterpaper}{\ClassWarning{ukthesis}{Option 'a4paper' is
    not available.  Defaulting to US letter paper}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ExecuteOptions{12pt}
\ProcessOptions\relax

\LoadClass{memoir}

\RequirePackage{calc}
%\RequirePackage{fullpage}
%% \RequirePackage{xspace}
%% \RequirePackage{enumerate}
%% \RequirePackage{fancyhdr}


%a command for optional typesetting
\newcommand{\pretty}[1]{}
\if@pretty\renewcommand{\pretty}[1]{#1}\fi
%set the margins
%\RequirePackage[left=1.5in,right=1.0625in,top=1in,bottom=1in,footskip=0.5in]{geometry} 
%\settrimmedsize{\stockheight}{\stockwidth}{*}
\settrims{0in}{0in}
\setstocksize{11in}{8.5in}
\setlrmarginsandblock{1.5in}{1in}{*}
\setulmarginsandblock{1in}{1in}{*}
%\setlength{\evensidemargin}{\oddsidemargin}
\setheaderspaces{*}{\baselineskip}{*}
\newlength{\@extrafootskip}
\settoheight{\@extrafootskip}{1}
\setheadfoot{.5in}{.5in}%-\@extrafootskip}
\setmarginnotes{10pt}{1in}{1ex}
\checkandfixthelayout

%%% these lengths control the positioning of title page elements relative
%%% to the margins.  Change these if the spec changes.
%% abstract page
\newlength{\@abheadskip}\setlength{\@abheadskip}{2.5in}%above abstract
\newlength{\@abheadheight}\setlength{\@abheadheight}{1in}%below
                                %abstract
\newlength{\@abdateline}\setlength{\@abdateline}{2in}
\newlength{\@absigline}\setlength{\@absigline}{2.5in}
%% approval page
\newlength{\@aptitleskip}\setlength{\@aptitleskip}{3in}%skip this far
                                %before the title 
\newlength{\@aptitleheight}\setlength{\@aptitleheight}{1in}%you have
                                %this much space for the title 
\newlength{\@apbottomskip}\setlength{\@apbottomskip}{4in} %skip after
                                %the signature line 
%% cover page
\newlength{\@coverbottomskip}\setlength{\@coverbottomskip}{3in}
\newlength{\@covertopskip}\setlength{\@covertopskip}{3in}
%% title page
\newlength{\@titletopskip}\setlength{\@titletopskip}{2.5in}
\newlength{\@titlebottomskip}\setlength{\@titlebottomskip}{2.5in}
\newlength{\@titlelineskip}\setlength{\@titlelineskip}{4in}
\newlength{\@titlelinewidth}\setlength{\@titlelinewidth}{.6\linewidth}
\newlength{\@titletitleheight}\setlength{\@titletitleheight}{\@titlelineskip}
%% abstract title page
\newlength{\@abtitlepageabove}\setlength{\@abtitlepageabove}{3in}
\newlength{\@abtitlepagebelow}\setlength{\@abtitlepagebelow}{3in}
%%abstract cover page
\newlength{\@abcoverpageabove}\setlength{\@abcoverpageabove}{3in}
\newlength{\@abcoverpagebelow}\setlength{\@abcoverpagebelow}{3in}
%%rules page
\newlength{\@rulespageabove}\setlength{\@rulespageabove}{2in}
\newlength{\@rulespagebelow}\setlength{\@rulespagebelow}{1in}



%modify the above lengths to account for the margins
\newlength{\@topmatter}%\setlength{\@topmatter}{0in}
\newlength{\@bottommatter}\setlength{\@bottommatter}{0in}
\setlength{\@topmatter}{\uppermargin}
%\addtolength{\@topmatter}{\topmargin}
%\addtolength{\@topmatter}{\topsep}
%\addtolength{\@topmatter}{\headheight}
\addtolength{\@topmatter}{\headsep}
%\addtolength{\@topmatter}{1in}%the origin is 1in down
\addtolength{\@bottommatter}{\lowermargin}
%\addtolength{\@bottommatter}{\footskip}
%
%
%set lengths for the abstract page
\addtolength{\@abheadskip}{-\@topmatter}
\addtolength{\@absigline}{-\@abdateline}
\addtolength{\@abdateline}{-\@bottommatter}
%set the lengths correctly for the approval page
\addtolength{\@aptitleskip}{-\@topmatter}
\addtolength{\@apbottomskip}{-\@bottommatter}
%lengths for the cover page
\addtolength{\@covertopskip}{-\@topmatter}
\addtolength{\@coverbottomskip}{-\@bottommatter}
%lengths for the title page
\addtolength{\@titletitleheight}{-\@titletopskip}%gives 1.5in for title
\addtolength{\@titletopskip}{-\@topmatter}
\addtolength{\@titlebottomskip}{-\@bottommatter}
\addtolength{\@titlebottomskip}{-.75\baselineskip}
%lengths for abstract title page
\addtolength{\@abcoverpageabove}{-\@topmatter}
\addtolength{\@abcoverpagebelow}{-\@bottommatter}

\newlength{\@dedicationskip}\setlength{\@dedicationskip}{4in}
\addtolength{\@dedicationskip}{-\@topmatter}
%lengths for rules page
\addtolength{\@rulespageabove}{-\@topmatter}
\addtolength{\@rulespagebelow}{-\@bottommatter}
%renew \maketitle and related commands
\newcommand{\@theyear}{\number\the\year}%the current year
\if@pretty\relax\else
\newcommand{\@theauthor}{}
\newcommand{\@thetitle}{}
\renewcommand{\author}[1]{
  \renewcommand{\@theauthor}{#1}
}
\renewcommand{\title}[1]{
  \renewcommand{\@thetitle}{#1}
}
\fi
\newcommand{\@theabstract}{}
\newcommand{\@thekeywords}{}
\newcommand{\@theadvisor}{}
\newcommand{\@thedept}{Electrical Engineering}
\newcommand{\@thedgs}{}
\newcommand{\dgs}[1]{
  \renewcommand{\@thedgs}{#1}
}
\renewcommand{\abstract}[1]{
  \renewcommand{\@theabstract}{#1}
}
\newcommand{\keywords}[1]{
  \renewcommand{\@thekeywords}{#1}
}
\newcommand{\advisor}[2][Electrical Engineering]{
  \renewcommand{\@theadvisor}{#2}
  \renewcommand{\@thedept}{#1}
}
\newcommand{\copyrightprefix}{Copyright$^\copyright$}
\newcommand{\copyrightnotice}{%
  \par\vfill
  \if@pretty
     \begin{center}
       \copyrightprefix\ \@author, \@theyear.
     \end{center}
  \else
     \begin{center}
       \copyrightprefix\ \@theauthor, \@theyear.
     \end{center}
  \fi
}

\newcommand{\makeapprovalpage}{
  %\begin{titlingpage}
  \thispagestyle{empty}
    \rule{0in}{\@aptitleskip+\baselineskip}\newline
    \parbox[c][\@aptitleheight][t]{\linewidth}{
      \begin{center}
        \vspace{-.75\baselineskip}
        \@thetitle
      \end{center}
      }
    %\par\noindent
    \begin{center}
      \vspace{-.75\baselineskip}
      By\\ \@theauthor
    \end{center}
    \vfill
    \hspace*{\fill} Director of
    Thesis:\underline{\parbox{.3\linewidth}{\if@sigs\hfill\@theadvisor\ \hfill\else\hfill\fi}}\newline \newline
    \hspace*{\fill} Co-Director of
    Thesis:\underline{\parbox{.3\linewidth}{\if@sigs\hfill Dr. Jeffrey Todd Hastings \hfill\else\hfill\fi}}\newline \newline
    \hspace*{\fill}
    Director of Graduate
    Studies:\underline{\parbox{.3\linewidth}{\if@sigs\hfill\@thedgs\ \hfill\else
    \hfill\fi}}\newline \newline
    \hspace*{\fill}
    Date:\underline{\parbox{.3\linewidth}{\if@sigs\hfill\@date \hfill
        \else\hfill\fi}}
    \par
    \rule{0pt}{\@apbottomskip-4\baselineskip}
  %\end{titlingpage}
    \newpage
}
\newcommand{\makeabstractpage}{
  %\begin{titlingpage}
  \thispagestyle{empty}
  \pdfbookmark[0]{Abstract}{Abstract}
    \rule{0in}{\@abheadskip+\baselineskip}\newline
    \parbox[c][\@abheadheight][t]{\linewidth}{
      \begin{center}
        \vspace{-.75\baselineskip}
        ABSTRACT OF THESIS
      \end{center}
      }
    \begin{center}
      \vspace{-.75\baselineskip}
      \@thetitle
    \end{center}
	\par \vspace{8mm} \noindent
	\@theabstract
    \begin{description}
      \item[\textnormal{KEYWORDS:}]\@thekeywords
    \end{description}
    \vfill
    \hspace*{\fill} Author's
    signature:\underline{\parbox{.3\linewidth}{\if@sigs\hfill\@theauthor\ \hfill
    \else\hfill\fi}}\newline \newline
    %\rule{1pt}{\@absigline-2\baselineskip}
    \vspace{-.6\baselineskip}
    \par\noindent\vspace{-\baselineskip}
    \hspace*{\fill}
    Date:\underline{\parbox{.3\linewidth}{\if@sigs\hfill\@date\ \hfill
    \else\hfill\fi}}
    \par
    \rule{0pt}{\@abdateline+\baselineskip}
  %\end{titlingpage}
    \newpage
}
\newcommand{\makecoverpage}{
  %\begin{titlingpage}
  \thispagestyle{empty}
    \rule{0in}{\@covertopskip}
    \begin{center}
      THESIS
      \vfill
      \@theauthor\\
      \vfill
      The Graduate School\\
      University of Kentucky\\
      %\vfill
      \@theyear\par
      \rule{0pt}{\@coverbottomskip-.75\baselineskip}
    \end{center}
  %\end{titlingpage}
    \newpage
}
\newcommand{\maketitlepage}{
  %\begin{titlingpage}
  \thispagestyle{empty}
  \pdfbookmark[0]{Title Page}{titlepage}
    \begin{center}
      \rule{0in}{\@titletopskip+.75\baselineskip}
       %\vspace{-2\parskip}
      \par\noindent
       \parbox[c][\@titletitleheight][t]{\linewidth}{
           \begin{center}
             \vspace{-.75\baselineskip}
             \@thetitle
           \end{center}
       }
      \par\noindent
      \vspace{\parskip}
      \vspace{-.6\baselineskip} 
      \par\noindent
      \rule[2.2mm]{\@titlelinewidth}{1pt}\\
      \vspace{\parskip}
		THESIS\\
      \rule[1mm]{\@titlelinewidth}{1pt}\\
      \parbox[c][][t]{.8\linewidth}{
          \begin{center}
            A thesis submitted in partial fulfillment of the\\
            requirements for the degree of Master of Science in\\
            Electrical Engineering in the College of Engineering\\
            at University of Kentucky
          \end{center}
        }
	\par \vspace{5mm}
      By\\
      \@theauthor\\
      Lexington, Kentucky\\
      \vspace{2\baselineskip}
      Director:  \@theadvisor,  Professor of \@thedept \\
      Co-Director:  Dr. Jeffrey Todd Hastings,  Professor of \@thedept \\
      Lexington, Kentucky\\
      \vspace{1.5\baselineskip}
      \@theyear
      \vfill
      Copyright$^\copyright$\ \@theauthor\ \@theyear
      \vspace{\@titlebottomskip}
    \end{center}
  %\end{titlingpage}
    \newpage
}
\newcommand{\makeabcoverpage}{
  \thispagestyle{empty}
   \rule{0in}{\@abcoverpageabove}
    \begin{center}
      ABSTRACT OF DISSERTATION
      \vfill
      \@theauthor\\
      \vfill
      The Graduate School\\
      University of Kentucky\\
      %\vfill
      \@theyear\par
      \rule{0pt}{\@abcoverpagebelow-.75\baselineskip}
    \end{center}
    \newpage
}
\newcommand{\makeabtitlepage}{
  %\begin{titlingpage}
  \thispagestyle{empty}
    \begin{center}
      \rule{0in}{\@titletopskip+.75\baselineskip}
       %\vspace{-\parskip}
       \parbox[c][\@titletitleheight][t]{\linewidth}{
           \begin{center}
             \vspace{-.75\baselineskip}
             \@thetitle
           \end{center}
       }
      \par\noindent
      \vspace{\parskip} 
      \vspace{-.6\baselineskip}
      \par\noindent
      \rule{\@titlelinewidth}{1pt}\\
      \vspace{\parskip}
      ABSTRACT OF DISSERTATION\\
      \rule{\@titlelinewidth}{1pt}\\
      \parbox[c][][t]{\@titlelinewidth}{
          \begin{center}
            A dissertation submitted in partial
            fulfillment of the requirements for the degree of 
            Doctor of Philosophy in the 
            College of Arts and Sciences
            at the
            University of Kentucky
          \end{center}
        }
      \par
      By\\
      \@theauthor\\
      Lexington, Kentucky\\
      \vspace{1.5\baselineskip}
      Director: Dr. \@theadvisor, Professor of \@thedept \\
      Lexington, Kentucky
      \vspace{1.5\baselineskip}
      \@theyear
      \par
      \vfill
      Copyright$^\copyright$\ \@theauthor\ \@theyear
      \vspace{\@titlebottomskip}
    \end{center}
  %\end{titlingpage}
    \newpage
}
\newcommand{\makerulespage}{
  \thispagestyle{empty}
  \rule{0in}{\@rulespageabove}
  \begin{center}
    RULES FOR THE USE OF THESES
  \end{center}
	 \hfill \par\noindent%
	Unpublished theses submitted for the Master's degree and deposited in the
	University of Kentucky Library are as a rule open for inspection, but are to be
	used only with due regard to the rights of the authors. Bibliographical references
	may be noted, but quotations or summaries of parts may be published only with
	the permission of the author, and with the usual scholarly acknowledgments. \\
	\\%
	Extensive copying or publication of the thesis in whole or in part also requires the
	consent of the Dean of the Graduate School of the University of Kentucky.\\
	\\%
	A library that borrows this thesis for use by its patrons is expected to secure the
	signature of each user.
       \par
       \vspace{\baselineskip}
       \par
       \underline{Name}\hfill\underline{Date}\vspace{\baselineskip}
       \vfill
       \par\noindent\underline{\hspace{\linewidth}}\vspace{.75\baselineskip}
       \vfill
       \par\noindent\underline{\hspace{\linewidth}}\vspace{.75\baselineskip}
       \vfill
       \par\noindent\underline{\hspace{\linewidth}}\vspace{.75\baselineskip}
       \vfill
       \par\noindent\underline{\hspace{\linewidth}}\vspace{.75\baselineskip}
       \vfill
       \par\noindent\underline{\hspace{\linewidth}}\vspace{.75\baselineskip}
       \vfill
       \par\noindent\underline{\hspace{\linewidth}}\vspace{.75\baselineskip}
       \vfill
       \par\noindent\underline{\hspace{\linewidth}}\vspace{.75\baselineskip}
       \vfill
       \par\noindent\underline{\hspace{\linewidth}}\vspace{.75\baselineskip}
       \vfill
       \par\noindent\underline{\hspace{\linewidth}}%\vspace{.75\baselineskip}
       \vspace{\@rulespagebelow}
       \clearpage
}

\newenvironment{acknowledgments}{
  \clearpage
  \chapterstyle{nonumbers}
  \chapter[Acknowledgments]{\textnormal{\normalsize{ACKNOWLEDGMENTS}}}
  \thispagestyle{plain}
  %\begin{center}{\textnormal{\normalsize{ACKNOWLEDGMENTS}}}\end{center}
  \begin{DoubleSpace}
}{
  %\clearpage
  \end{DoubleSpace}
  \clearpage
}
\newenvironment{dedication}{
  \clearpage
  \pdfbookmark[0]{Dedication}{Dedication}
  \thispagestyle{empty}
  \savepagenumber
  \begin{center}
  \rule{0in}{\@dedicationskip}
}{
  \end{center}
  \clearpage
  \restorepagenumber
}
\if@pretty\relax\else%this gives the grad school required frontmatter
\renewcommand{\maketitle}{
  \begin{titlingpage}
%  \makeabcoverpage
  \maketitlepage  
  \makeabstractpage
  \makeapprovalpage
%  \makerulespage
%  \makecoverpage
  \end{titlingpage}
  \setcounter{page}{3}
  %\pagestyle{plain}
}
\fi
%% \if@pretty
%%   \renewcommand{\maketitle}{
%%     \begin{titlingpage}
%%     \begin{center}
%%       \rule{0in}{2in}
%%       \Large{\@thetitle}
%%       \par
%%       \vspace{2\baselineskip}
%%       \par
%%       \@theauthor
%%       \par
%%       \@theyear
%%       \vfill
%%     \end{center}
%%     \begin{center}
%%       \textsc{abstract}
%%     \end{center}
%%     \@theabstract
%%     \vfill
%%     \end{titlingpage}
%%     \setcounter{page}{3}
%%   }
%% \fi
%customize list of figures
\if@pretty\relax\else
\renewcommand{\listfigurename}{List of Figures}
\renewcommand{\lofheadstart}{}
\renewcommand{\printloftitle}[1]{\hfill\normalsize{\MakeUppercase{\normalfont{#1}}}\hfill}
%customize list of tables
\renewcommand{\listtablename}{List of Tables}
\renewcommand{\lotheadstart}{}
\renewcommand{\printlottitle}[1]{\hfill\normalsize\MakeUppercase{{\normalfont{#1}}}\hfill}
%customize table of contents
\renewcommand{\contentsname}{Table of Contents}
\renewcommand{\tocheadstart}{}
\renewcommand{\printtoctitle}[1]{\hfill\normalsize\MakeUppercase{{\normalfont{#1}}}\hfill}
\renewcommand{\cftchapterpagefont}{\normalfont}
\renewcommand{\cftchapterfont}{\normalfont}
\renewcommand{\cftpartfont}{\normalfont}
\renewcommand{\cftpartpagefont}{\normalfont}
%\renewcommand{\changetocdepth}[1]{}
%add the word chapter to the toc
\renewcommand{\cftchapterpresnum}{Chapter\ }
\newlength{\toctemp}
\settowidth{\toctemp}{\cftchapterpresnum}
\addtolength{\cftchapternumwidth}{\toctemp} 
%add dots to the chapter lines
\renewcommand{\cftdot}{.}
\renewcommand{\cftchapterleader}{\cftdotfill{\cftsectiondotsep}}
\renewcommand{\cftpartleader}{\cftdotfill{\cftdotsep}}
\fi
%%setup the header and footer styles
\if@pretty\relax\else\pagestyle{plain}\fi
\makechapterstyle{small}{%
  \renewcommand{\printchaptername}{\normalfont\bfseries Chapter}
  \renewcommand{\chapnumfont}{\normalfont}
  \renewcommand{\chapnamefont}{\normalfont}
  \renewcommand{\printchapternum}{\normalfont\bfseries \thechapter\space}
  \renewcommand{\afterchapternum}{\normalfont}
  \renewcommand{\printchaptertitle}[1]{\normalfont\bfseries ##1}
  \setlength{\beforechapskip}{-\baselineskip}
}
\makechapterstyle{nonumbers}{
  \renewcommand{\printchaptername}{}
  \renewcommand{\chapnumfont}{\normalfont}
  \renewcommand{\chapnamefont}{\normalfont}
  \renewcommand{\printchapternum}{}
  \renewcommand{\afterchapternum}{\normalfont}
  \renewcommand{\printchaptertitle}[1]{\begin{center}##1\end{center}}
  \setlength{\beforechapskip}{-\baselineskip}
}
\if@pretty\relax\else
\chapterstyle{small}
\setsecheadstyle{\bfseries}
\setsubsecheadstyle{\bfseries}
\setsubsubsecheadstyle{\bfseries}
\fi
