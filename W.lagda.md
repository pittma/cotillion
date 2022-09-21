---
title: W-Types, and how?
---

<!--
```
{-# OPTIONS --without-K #-}

module W where

open import Data.Unit
open import Data.Empty
```
-->

This is lifted from McBride's _W-types: good news and bad
news_[^1]. See the link in the footnote to follow along. Probably as I
make progress I'll updates here. But also maybe not.

```
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
```

[^1]: https://mazzo.li/epilogue/index.html%3Fp=324.html
