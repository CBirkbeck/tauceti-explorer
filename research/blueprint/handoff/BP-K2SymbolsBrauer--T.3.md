# Handoff — BP-K2SymbolsBrauer--T.3

**Job** `BP-K2SymbolsBrauer--T.3` (issue #762) · Claude Code, session `cc-7b31c4` · 24 September 2026 ·
packet status **partial**; **all seven stages in scope are now `source_decomposed`**. The first pass left T.5
and T.7 partial; the continuation below closes both. The sections after it are the first pass's note, kept as
written.

## Continuation: T.5 and T.7 decomposed

The first pass read Weibel's K-book III.5.10–III.5.11.1, III.6.2.2–III.6.4.2 and III.7.3–III.7.3.1, and left
five items in the two `remaining` lists, all of them statements other roadmaps own. This pass reads the same
chapter further — III.5.2.2, III.6.1.1, III.6.2.1 and III.6.5.1 — and separates what this layer can own from
what it can only import. 22 nodes → **27**; 46 API items, 32 unit tests, 11 planets, 5 gaps, 15 requests.
`check_blueprint.py`: **0 errors, 0 warnings**. The Lean file is now 208 lines with 54 `sorry`s and was **not
compiled**.

**T.5**, three new nodes:

- `k2-of-a-finite-field` — Corollary 6.1.1 with the source's **complete** proof, which is elementary and was
  simply not read the first time: reduce to `{x,x}` by Matsumoto; dispose of even `q`; for odd `q` use
  skew-symmetry to replace `x` by any odd power, identify odd powers with non-squares, and count — the
  involution `u ↦ 1−u` acts on a set with `(q−1)/2` non-squares and `(q−3)/2` squares, so some non-square `u`
  has `1−u` a non-square.
- `k2-of-the-integers-and-of-the-rationals` ★ — the part of this computation that **is** this layer's own is
  the sign symbol on `ℝ`: it is a Steinberg symbol because a number and one minus it are never both negative,
  it sends `{−1,−1}` to `−1`, and it therefore both proves the generator non-trivial and splits the sequence
  for `ℚ`, giving `K₂(ℚ) ≅ K₂(ℤ) ⊕ ⨁_p 𝔽_p^×` (Application 6.5.1). The order-two statement for `K₂(ℤ)` is
  Milnor's Euclidean-algorithm computation, which the source cites rather than proves, and which this packet
  cites the same way.
- `certified-presentation` — the **format** the layer's text asks for, with the rule it insists on: generators,
  relations, a generation proof and a completeness proof; the first three give an upper bound, only the fourth
  turns it into an isomorphism, and an upper bound with a surjection may not be reported as an isomorphism. The
  two sources of lower bounds available here are named: the sign symbol at a real place and the tame symbols at
  the finite places. The instances belong to `ArithmeticKTheory:N.6`.

**T.7**, two new nodes:

- `twisted-roots-of-unity` ★ — the target every statement of the layer needs and that **neither pinned library
  has**: `μ_m^{⊗n}` as a Galois module, with the cup product of two Kummer classes landing in the second
  cohomology of the twice-twisted module, the trivialisation attached to a **choice** of primitive root, and
  the change-of-root rule proved on it. Tau Ceti has `kummerMap` and an explicit cup product in low degrees and
  Mathlib has the roots of unity as a group; the Galois module structure on the tensor powers is in neither.
  This is what makes the Hilbert comparison a well-posed statement rather than a statement with a silent
  choice.
- `etale-chern-class-and-what-is-imported` — the remaining four comparisons stated precisely, each with its
  owner and its hypotheses: the agreement of the symbol formula with the étale Chern class and Tate's local,
  global and S-integer comparisons (`MotivicEtaleKTheory:M.3`), the identification of the local symbol with the
  Kummer cup product followed by the local invariant (ClassFieldTheory Layer 5) and the Hilbert product formula
  (Layer 14). The shortcut the roadmap forbids is named: the ring statement comes from the étale localisation
  sequence, never from the blanket assertion that the étale cohomology of a scheme is the Galois cohomology of
  its function field. A new gap records that no source read here proves any of the four and names Tate's 1976
  paper as the next source to obtain.

---

The first pass's note follows, kept as written.

## What is closed

22 nodes (4 definitions, 2 constructions, 3 lemmas, 6 theorems, 6 comparisons, 1 application), 33 API
items, 24 unit tests, 9 planets, 20 pinned baseline declarations, 15 requests, 4 gaps.
`scripts/check_blueprint.py` reports **0 errors and 0 warnings**.

- **T.3:symbols** — the tame symbol through unit parts, so no residue is taken of a nonintegral
  element; independence from the uniformiser; bilinearity and the Steinberg relation by the source's
  four-case analysis; the normalisation on the two mixed pairs; the ramification formula.
- **T.3:localization-comparison** — finite support; the higher Milnor residues and specialisation maps
  by Serre's construction, with the relation on the indeterminate stated; rigidity; the transfer with
  the norm-residue and projection formulas; and the comparison with the localisation boundary, with
  the sign fixed **at the comparison**.
- **T.4** — the Bass–Tate sequence with the place at infinity kept outside the sum; the transfers and
  transitivity; Weil reciprocity with its finiteness and its reduction to the projective line; and the
  comparison of the two valuations, pinned on affine charts and glued here.
- **T.6** — Dennis–Stein symbols with the modern sign convention, their three relations, the reduction
  to a Steinberg symbol, the presentation under the local-ring and field hypotheses **only**, and the
  square-zero test.

## What is partial, and why

**T.5** and **T.7** are `partial` by design, and their `remaining` lists say exactly what is missing
and who owns it. Almost every computation their targets name is owned by another roadmap:
`ArithmeticKTheory:N.2` (the localisation theorem and so the injectivity half of the tame-kernel
sequence), `N.6` (certified presentations with matching lower bounds), `N.8` (`K₂(ℤ)`, `K₂(ℚ)`),
`SpecialValuesBirchTate:B.7` (the S-integer comparison), `KTheoryFiniteLocalFields:L.1` (`K₂(𝔽_q)`),
`MotivicEtaleKTheory:M.3` (the norm-residue map and Tate's comparison), and two layers of
`ClassFieldTheory` (the local invariant; Hilbert reciprocity). This layer owns the definitions and the
symbols those statements are phrased with, and imports the rest rather than planning it twice.

## Four gaps

1. **Bass–Tate cited, not obtained** — the function-field sequence, the transfers and their
   transitivity are attributed; the transitivity argument is the substantial part a continuation
   should decompose.
2. **Weil reciprocity is derived, not cited** — the K-book does not state the symbol form the roadmap
   asks for, so the node reduces to the projective line and derives it there; the derivation is
   written out rather than attributed.
3. **The gluing of the two valuations** is not pinned: affine charts are, the gluing into the closed
   points of a proper regular curve is not.
4. **The twice-twisted coefficient module is missing** from both libraries, so the cup product of two
   Kummer classes has no target; T.7's symbol formula is stated against it and the request names it.

## One correction to the companion part

An earlier revision of the packet for the **T.1** part (issue #761, PR #2781) placed the higher tame
symbols with rigidity, and the Dennis–Stein symbols with their presentation, under `T.2:symbols`. The
roadmap assigns higher Milnor residues and specialisation to `T.3:localization-comparison` and the
Dennis–Stein symbols to `T.6`. Both groups are owned **here** instead, and the companion packet was
corrected on its own branch before review rather than left as a duplication for a reviewer to find.
The packet's `restructure` list records this; no change to the atlas is proposed, since the stage
texts already say where these belong.

## One convention, stated rather than smoothed over

The roadmap's tame symbol is `(−1)^{v(f)v(g)} · overline(f^{v(g)}/g^{v(f)})`, so `∂_v{u,π} = ū` and
`∂_v{π,u} = ū⁻¹`. The K-book's symbol is the **inverse** of this one. The definition records the
inversion, a unit test catches a silent reversal, and every comparison states it.

## The suggested Lean file

`research/blueprint/suggested/K2SymbolsBrauer--T.3.lean`, 168 lines, **not compiled**: no toolchain at
the pinned commits. `K₂`, Milnor K-theory, the localisation sequence, the norm-residue map and the
local invariant are all parameters, never invented.

## Sources read

Weibel's *K-book*, author-hosted draft of 29 August 2013, SHA-256 `a04f53c9…b058845`: III.5.10–5.11.1
(PDF pp. 233–234), III.6.2.2–6.4.2 (pp. 241–243) and III.7.3–7.3.1 (p. 254). No source issue is
recorded: no misprint, error or gap was found in what was read. The difference of normalisation
between the roadmap and the source is a convention, not a mistake, and is recorded as such.
