\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zjuthesis}
    [Zhejiang University Thesis and Design Template, Zixuan Wang zxwang42@gmail.com]
\input{config/version}
\wlog{zjuthesis version: \zjuthesisversion}

\RequirePackage{kvoptions}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{enumerate}

\SetupKeyvalOptions{
    family=zjuthesis,
    prefix=
}
\DeclareStringOption{ClassNumber}
\DeclareStringOption{Security}
\DeclareStringOption{StudentName}
\DeclareStringOption{StudentID}
\DeclareStringOption{AdvisorName}
\DeclareStringOption{Grade}
\DeclareStringOption{Major}
\DeclareStringOption{Department}
\DeclareStringOption{Topic}
\DeclareStringOption{Title}
\DeclareStringOption{TitleEng}
\DeclareStringOption{SubmitDate}
\DeclareStringOption[undergraduate]{Degree}
\DeclareStringOption[general]{MajorFormat}
\DeclareStringOption[thesis]{Type}
\DeclareStringOption[proposal]{Period}
\DeclareStringOption[chinese]{Language}
\DeclareStringOption[doctor]{GradLevel}
\DeclareStringOption{ColaboratorName}
\DeclareStringOption[false]{BlindReview}
\DeclareStringOption[false]{PrintFilePath}
\DeclareStringOption[true]{TwoSide}
\DeclareBoolOption[true]{ListOfContents}
\DeclareBoolOption[true]{ListOfFigures}
\DeclareBoolOption[true]{ListOfTables}
\DeclareBoolOption[false]{ListOfAlgorithms}

\ProcessKeyvalOptions*

\wlog{Degree: {\Degree}}
\wlog{MajorFormat: {\MajorFormat}}
\wlog{Type: {\Type}}
\wlog{Period: {\Period}}
\wlog{BlindReview: {\BlindReview}}
\wlog{Language: {\Language}}
\wlog{GradLevel: {\GradLevel}}
\wlog{PrintFilePath: {\PrintFilePath}}

\PassOptionsToPackage{no-math}{fontspec}
\PassOptionsToPackage{AutoFakeBold}{xeCJK}

\usepackage{xifthen}

\ifthenelse{\equal{\TwoSide}{true}}
{
    \PassOptionsToClass{
        twoside,
        openright
    }{ctexrep}
}
{}

\LoadClass[
    zihao=-4,
    UTF8
]{ctexrep}

\input{config/packages}

\ifthenelse{\equal{\Degree}{undergraduate}}
{
    % undergraduate
    \ifthenelse{\equal{\Type}{thesis}}
    {
        \newcommand{\TitleTypeName}{浙江大学本科生毕业论文}
    }
    {
        \newcommand{\TitleTypeName}{浙江大学本科生毕业设计}
    }
}
{
    % graduate
    \ifthenelse{\equal{\GradLevel}{doctor}}
    {
        % doctor
        \ifthenelse{\equal{\Type}{thesis} \OR \equal{\Type}{design}}
        {
            % thesis or design
            \newcommand{\TitleTypeName}{浙江大学博士学位论文}
            \newcommand{\TitleTypeNameCover}{博士学位论文}
        }
        {}
    }
    {
        % master
        \ifthenelse{\equal{\Type}{thesis}}
        {
            % thesis
            \newcommand{\TitleTypeName}{浙江大学硕士学位论文}
            \newcommand{\TitleTypeNameCover}{硕士学位论文}
        }
        {
            % design
            \newcommand{\TitleTypeName}{浙江大学硕士专业学位论文}
            \newcommand{\TitleTypeNameCover}{硕士专业学位论文}
        }
    }
}

\input{config/path}
\input{config/commands}
\input{config/format/format}

%----------------------------------------
% theorem and theorem-like environments %
%----------------------------------------
% \numberwithin{equation}{chapter}
% \theoremstyle{definition}

\newtheorem{thm}{定理}[section]
\newtheorem{alg}[thm]{算法}
\newtheorem{asm}[thm]{假设}
\newtheorem{axm}[thm]{公理}
\newtheorem{coro}[thm]{推论}
\newtheorem{defn}[thm]{定义}
%\newtheorem{exm}{Example}[chapter]
%\newtheorem{exc}[exm]{Exercise}
% number examples and exercises with thms.
\newtheorem{exm}[thm]{例}
\newtheorem{exc}[thm]{练习}
\newtheorem{frm}[thm]{公式}
\newtheorem{lem}[thm]{引理}
\newtheorem{ntn}{记号}
\newtheorem{prop}[thm]{命题}
\newtheorem{rem}{注记}[section]
\newtheorem{rul}[thm]{规则}
\renewcommand{\proofname}{证明}
\RequirePackage{algorithm}
\RequirePackage{algorithmic}

% 修改编号格式
\renewcommand{\thethm}{\arabic{section}.\arabic{thm}}
\renewcommand{\thealg}{\arabic{section}.\arabic{alg}}
\renewcommand{\theasm}{\arabic{section}.\arabic{asm}}
\renewcommand{\theaxm}{\arabic{section}.\arabic{axm}}
\renewcommand{\thecoro}{\arabic{section}.\arabic{coro}}
\renewcommand{\thedefn}{\arabic{section}.\arabic{defn}}
\renewcommand{\theexm}{\arabic{section}.\arabic{exm}}
\renewcommand{\theexm}{\arabic{section}.\arabic{exm}}
\renewcommand{\thefrm}{\arabic{section}.\arabic{frm}}
\renewcommand{\thelem}{\arabic{section}.\arabic{lem}}
\renewcommand{\theprop}{\arabic{section}.\arabic{prop}}
\renewcommand{\therem}{\arabic{section}.\arabic{rem}}
\renewcommand{\therul}{\arabic{section}.\arabic{rul}}
