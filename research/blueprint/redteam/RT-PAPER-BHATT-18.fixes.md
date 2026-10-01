# Fixes for RT-PAPER-BHATT-18

Codex, session `codex-J6LwjP`, 2026-10-01. Refs #5535.
Input checkout: `e236453`.

Both independently confirmed findings are fixed in the three authorized
deliverables. The existing main theorems, 25 source issues and nine reading
gap records are preserved. The inventory grows from 89 to 90 items solely
because the common coefficient-map input is split out. Counts are now
10 library, 14 planned and 66 missing; all missing items have exactly one
route. No mathematics is claimed formalized.

## /1: correct the right adjoint without narrowing the almost base

`almost-category` now states the general tensor-square formula, the natural
right-adjoint Hom equivalence and counit, and the hypothesis for its
flat-ideal specialization. It imports P0's existing
`almost-hom-and-adjoints` node, which already has this precise contract.
Its module left adjoint is stated separately from the algebra adjoint (!!).
No P0 packet or reviewed base data is changed.

The added valuation-base test recovers Bhatt's formula. The quotient test
detects the error without changing the general hypothesis. Let V be the
valuation ring of the completion of `F_p((t^(1/p^∞)))`, m its maximal ideal,
W = V/(t), and n = m/tV. The ideal m is flat and idempotent; n is idempotent.
Base change of the tensor square gives

`n ⊗_W n ≅ (m ⊗_V m) ⊗_V W ≅ m/tm`.

This is W-flat. Multiplication to `n = m/tV` has kernel
`tV/tm ≅ V/m`, which is nonzero. The class of t is nonzero in m/tm:
elements of tm have valuation strictly greater than v(t), whereas t does
not. Its image in n is zero. With N = m/tm, the identity of the tensor
square cannot factor through that multiplication map. Thus precomposition
`Hom_W(n,N) → Hom_W(n⊗_W n,N)` is not surjective. The valuation-only formula
would fail this test; the general tensor-square formula remains applicable.

Fresh primary evidence:

- [Gabber–Ramero, Almost ring theory, sixth release](https://websites.umich.edu/~bhattb/almost_purity_2011/almost_ring_theory.pdf),
  dated 22 July 2002, Remark 2.1.4 p.8, (2.2.4) with its preceding argument
  p.12, and Proposition 2.2.13 with proof p.14. Base extension preserves
  flatness of the tensor square without necessarily preserving ideal
  flatness; the adjunction uses the tensor square.
- [Bhatt, 1608.08882v2](https://arxiv.org/pdf/1608.08882v2), footnote 5 p.3
  and Proposition 5.2 pp.8–9. His perfectoid valuation-base formula is
  unaffected. This is an extraction error, not a new source issue.

Read on 1 October 2026. Download hashes are respectively
`c4ab39ad5cd3f95f12a4c2f1f100f0c9f91578c6cbe2085a1962d111df8d7dc8`
(234 PDF pages) and
`08578ca15b17f51ee12c398ef305af3446057063c015e2bc8beb6012bcc26430`
(12 PDF pages). No claim to have reread either source completely is made.

## /2: share the Cohen coefficient map, retain the consumer corollary

The new missing `cohen-coefficient-ring` item is routed through existing
route 5 to R03.1. It specifies one continuous local map W(k) → B inducing
the identity on the perfect residue field of a complete Noetherian
mixed-characteristic local ring. The new R03.1 request explicitly reuses
accepted PAPER-ANDRE-18-B route 4 and its coefficient-change data.

`cohen-structure` remains missing in route 9 as the additional regular-local
isomorphism/hypersurface corollary. Its statement, prerequisites, proof
steps, note and tests import the chosen coefficient map and R03.3's local
algebra. Route 9's brief and reason, the reader and transferred gap G5 are
synchronized. The common input is not marked built or assigned a fictitious
registered node. R03.1 and R03.3 have no finished blueprint for these exact
targets among this job's deliverables; the explicit source item/request and
design brief are the authorized handoff to their blueprint/design jobs.

The shared-map tests use the constant inclusion into W(k)[[y]] in both
papers' parameter presentations, the ramified example
`Z_p[x]/(x²−p)` to avoid an unramified conclusion, and the commuting Witt
coefficient-extension square for `F_p ⊂ F_(p²)`. The first test gives
André's finite parameter presentation using `(p²,y)` and Bhatt's
regular-local isomorphism using `(p,y)` over the same coefficient map;
their theorem statements are not identified.

I compared accepted André route 4 and its `cohen-parameter-presentation`
and `coefficient-ring-compatibility` items, current R03.1/R03.3 contracts,
and their reviewed library coverage. Those records distinguish partial
coefficient interfaces from the requested exact Cohen construction. I
previously contributed to PAPER-ANDRE-18-B; this is an authorized fix to
Bhatt's extraction, not an independent review of my André work. Neither
that extraction nor its verdict is changed. André's cited Matsumura
coefficient-change proof is inherited evidence and was not freshly read.

## Validation and remaining boundaries

`scripts/check_paper.py` passed. Intake `check-files` accepted all three
deliverables with zero problems; `git diff --check` passed. All item IDs
and local prerequisites resolve, the item dependency graph is acyclic,
each missing item has exactly one route, and route sizes are
23, 6, 3, 9, 3, 7, 1, 8, 19. The common coefficient input lies only in
R03.1's source route and is a prerequisite of the presentation consumer.
The complete assembled graph has 2,956 stages and 8,622 distinct edges
and is acyclic. No stage edge is changed; the new design's future stage
graph still needs validation when its stages exist.

The published-version collation and existing proof-closure gaps remain
unchanged in scope. No source-erratum record is added, and no new library
absence or implementation claim is asserted. Pins remain Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. No Lean file is authorized or
compiled, no library build/cache/LSP is started, and scratch is removed
after submission.
