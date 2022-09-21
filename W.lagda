\documentclass{article}

\usepackage{agda}
\usepackage{pittma}

\hypersetup{
            pdftitle={W-Types, And How?},
            pdfborder={0 0 0},
            breaklinks=true}

\title{W-Types, And How?}

\author{dan pittman dan@dpitt.me}

\begin{document}

\maketitle

\begin{code}[hide]
{-# OPTIONS --without-K #-}

module W where

open import Data.Unit
open import Data.Empty
\end{code}

This is lifted from McBride's \emph{W-types: good news and bad
news} \footnote{\href {https://mazzo.li/epilogue/index.html%3Fp=324.html} }. See
the link in the footnote to follow along. Probably as I make progress
I'll updates here. But also maybe not.

\begin{code}
data Bool : Set where
  true : Bool
  false : Bool

data W (S : Set) (P : S → Set) : Set where
  _◂_ : (s : S) (f : P s → W S P) → W S P

natf : Bool → Set
natf true = ⊤
natf false = ⊥

ℕ : Set
ℕ = W Bool natf

zero : ℕ
zero = false ◂ λ () 

succ : ℕ → ℕ
succ n = true ◂ (λ _ → n)
\end{code}
\end{document}
