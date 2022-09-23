---
title: Addition Is Commutative, Syntax Is Hard
---

<!--
```agda
module Add where

open import Relation.Binary.PropositionalEquality

data ℕ : Set where
  zero : ℕ
  succ : ℕ → ℕ

_+_ : ℕ → ℕ → ℕ
zero + b = b
(succ a) + b = succ (a + b)
```
-->

I'm working on a piece of writing about syntax being hard and am using
`+-comm` below an example. It's semantically intuitive, but its
analytic proof is not.


```agda
+-identᵣ : ∀ (a : ℕ) → a + zero ≡ a
+-identᵣ zero = refl
+-identᵣ (succ a) = cong succ (+-identᵣ a)

+-succ : ∀ (a b : ℕ) → (succ a) + b ≡ a + (succ b)
+-succ zero b =  refl
+-succ (succ a) b = cong succ (+-succ a b)

+-comm : ∀ (a b : ℕ) → a + b ≡ b + a
+-comm zero b = sym (+-identᵣ b)
+-comm (succ a) b = trans (cong succ (+-comm a b)) (+-succ b a)
```
