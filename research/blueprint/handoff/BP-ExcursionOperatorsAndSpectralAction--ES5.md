# Handoff — BP-ExcursionOperatorsAndSpectralAction--ES5 (issue #727)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-es5`.

## Correction, made on the same branch before review

The first version of this packet said there is "no reviewed audit in
`data/library-coverage.json`" for this roadmap. **That is wrong.** `AUDIT-20`, reviewed
as `REV-AUDIT-20` on 17 September 2026 with 240 targets checked and 89 corrections,
covers all seventeen layers and returns **not built** for every one. No node here
duplicates a built target, so nothing planned is overturned, but four of the audit's
notes change what the packet cites, and all four are applied:

- Mathlib's `CategoryTheory.CatCenter = End (𝟭 C)` is the Bernstein centre of a
  category and is now cited (the audit records `ES0`'s centre target as *partial*).
- Mathlib **has** the Nielsen–Schreier theorem — a subgroup of a free group is free,
  which is exactly what `F_n ×_W W'` needs in FS IX.6.3 — and **has** abelian Shapiro's
  lemma in all degrees (`groupCohomology.coindIso`), while the **nonabelian** Shapiro
  equivalence that proposition proves is absent. Both are cited, so the boundary is
  exact, and the missing **Schreier index formula** is recorded as its own gap.
- Tau Ceti's `ClassFieldTheory.Formation` and its Tate cohomology are the *carriers* of
  class field theory; a direct search confirms there is no Artin map and no reciprocity
  map anywhere in either library. Cited, so that the torus gap says precisely what is
  missing rather than "absent".
- The audit's duplicate records for `ES5` name
  `GlobalShtukasAndFunctionFieldLanglands:GS.5` and
  `LanglandsParameterStacks:LP2:semisimple-characters`. The second was already
  requested; a request to the first is added.

The packet now has 27 baseline declarations, 13 gaps and 22 requests; nodes (16),
planets (14), sources and locators are unchanged.

## Deliverables

- `research/blueprint/packets/ExcursionOperatorsAndSpectralAction--ES5.json` — 16 nodes
  (2 definitions, 2 constructions, 11 theorems, 1 comparison), 24 API items, 16 unit
  tests, 14 planets, 23 baseline declarations, 11 gaps, 21 requests, 3 structural
  findings. `"part": "ES5"`, `"status": "partial"`.
- `research/blueprint/readmes/ExcursionOperatorsAndSpectralAction--ES5.md` — the roadmap
  document, 1560 lines.
- `research/blueprint/suggested/ExcursionOperatorsAndSpectralAction--ES5.lean` — 307
  lines of signatures and `example` unit tests.
- This note.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/ExcursionOperatorsAndSpectralAction--ES5.json --index $TAUCETI_BASELINE/declarations.tsv`
  → **0 errors, 0 warnings**, with the pinned declaration index in place.
- `python3 research/blueprint/intake.py check-files` on the four changed paths → 0 problems.
- `python3 -m unittest discover -s tests` → OK.

**The Lean file was not compiled.** No Lean was run. The Mathlib build on this machine
is a shared cache that must not be rebuilt. Every `implementationStatus` is `unchecked`.

## Relation to the companion part

The `ES0` part of this roadmap (layers ES0–ES4, issue #726) was written in the **same
session**, from the same reading of the same file, and submitted as a separate pull
request. This packet therefore does not re-plan VIII.4.1, VIII.4.2, the excursion
relations, IX.5.1, the component decomposition, IX.5.2, the map to the classical
Bernstein centre, the duality *square* of IX.5.3, or any of Chapter X. Where a node here
needs one of those, it names the **stage** — `ES0`, `ES1:finite-ramification`,
`ES1:spectral-center`, `ES4` — as a prerequisite rather than the other packet's node id,
because that packet is not yet merged. Once it is, a follow-up may sharpen those
prerequisites to node ids.

## What this packet rests on

**This roadmap has no integrated decomposition.** All 16 nodes were written from
Fargues–Scholze read directly, from `Geometrization.pdf` whose SHA-256
`9ab9efbd0df251bf…` reproduces the recorded value byte for byte.

Sections read for this job: **VII.7** (pp. 272–276), **VIII.3** (pp. 286–290),
**VIII.4** (pp. 290–293), **IX.1** (pp. 320–321), **IX.2** (pp. 321–323), **IX.4**
(p. 327), **IX.5** (pp. 327–330), **IX.6 in full** (pp. 330–333), **IX.7 in full**
(pp. 334–338), and **X.2** (pp. 346–348).

## The three things a reviewer should check first

1. **The statement of Proposition VIII.3.8 is damaged in the extraction, and this packet
   deliberately does not restate it.** VIII.3.8 is the statement that turns an excursion
   character into a semisimple parameter, and the whole of ES5 rests on it. Its
   enumerated items (i), (ii), (iii) are lost in the display-heavy region on printed
   pp. 289–290; what was recovered is the third item's two commuting squares and the
   full proof. Rather than reconstruct an enumerated statement nobody read, the packet
   files the whole proposition as a request to
   `LanglandsParameterStacks:LP2:semisimple-characters`, which owns it, and records the
   damage as a gap with a next source action. A reviewer who can open the PDF should
   record the three items verbatim.
2. **Local class field theory is in neither pinned library**, and Propositions IX.6.4 and
   IX.6.5 — the torus case, and with it the statement that the parameters constructed
   here for tori are the usual ones — rest entirely on `Z¹(W_E,G_m) = Hom(E^×,G_m)`. A
   direct search of the pinned index found no Artin map, no local reciprocity map and no
   class field theory of any kind; Tau Ceti's only `Weil` declarations are Weil divisors.
   No stage of any roadmap in this family claims it either. The packet requests it from
   `tauceti:TauCetiRoadmap/ClassFieldTheory` layers 8 and 9 **with the geometric-Frobenius
   normalisation fixed**, and proposes that as a structural finding.
3. **Three obligations of these layers have no counterpart in the source.** The roadmap
   asks (a) that the Schur/condensed scalar-endomorphism fact be proved on the actual
   representation category of `G_b(E)` — FS never state it; (b) that independence of the
   eligible stratum embedding be proved at the level of the centre — FS assert it in a
   parenthesis in Definition IX.7.1 and prove it nowhere read; (c) that the maps of
   Bun/Hecke correspondences be constructed and **their kernels compared** before any
   character is evaluated — no proof read discusses kernels. All three are recorded as
   gaps rather than being papered over with an invented locator.

## Layer by layer

- **ES5** (6 nodes). Schur-irreducibility in the condensed sense, with FS IX.1.2 on what
  that structure is; the excursion character with VIII.3.7's two families of relations
  and its continuity; VIII.4.3 (abstract); IX.4.1 (geometric); `φ_(G,b,π)` via VII.7.2's
  fully faithful left adjoint to `i_b^*`, with `φ_π` at `b=1`; and invariance under
  isomorphism with **conditional** transport along algebraically closed extensions — the
  roadmap forbids assuming base change preserves Schur-irreducibility, and this packet
  does not.
- **ES6** (1 node). The coefficient policy: IX.6's standing hypothesis, imposed on every
  centre-level diagram and **for each participating group**, with the excursion-algebra
  variant that FS assert and never write out.
- **ES6:functoriality** (7 nodes). IX.6.1 with the push–pull identity
  `π_* T_{V'}(π^* A) = T_V(A ⊗ π_*Λ)` and the Satake compatibility; IX.6.2 with
  Proposition VII.7.10 as categorical input; IX.6.3 with the nonabelian Shapiro
  comparison `Exc(W,Ĝ) = Exc(W',Ĝ')` through the finite-index free subgroup
  `F_n ×_W W'`; IX.6.4; IX.6.5 with the two-leg `std ⊗ std^∨` computation; the closing
  paragraph on twisting and central characters; and a node for the z-embedding
  apparatus, which the roadmap makes an obligation of this layer rather than an import.
- **ES6:duality** (2 nodes). IX.5.3's second sentence, split into the
  Bernstein–Zelevinsky half and the smooth-dual half, the latter recorded as a late
  return that depends on `ES7:parabolic`.

## What remains

Eleven gaps, each with a next source action. In order of how much they block:

1. The statement of **FS VIII.3.8** (pp. 289–290) — read it in a viewer and record items
   (i)–(iii) verbatim, then plan it in `LanglandsParameterStacks:LP2:semisimple-characters`.
2. **V. Lafforgue [Laf18] §11**, Proposition 11.7 and Lemma 11.10 — the continuity of the
   parameter, and therefore the entire reason for carrying the condensed structure
   through ES5, is quoted from there and was not read.
3. **Local class field theory**, as above.
4. **FS §II.2.1** — the explicit line-bundle computation that finishes the `G_m` case of
   IX.6.5; the roadmap asks for exactly this computation and this packet cannot yet
   exhibit it.
5. **FS VI.12.1** — the only substantive input to both duality nodes.
6. **Kaletha §5 and Fact 5.5** — both the construction of a z-embedding and the
   surjectivity `Z'(E) → D(E)`.
7. **The excursion-algebra variants of §IX.6** — FS write out none of the five; the
   roadmap requires all of them.

## Where to resume

The remaining part of this roadmap is **ES7** (issue #728): `ES7:parabolic`,
`ES7:GLn-comparison`, `ES7:equal-characteristic`, `ES7:function-field-automorphic`.
Definition IX.7.1, §IX.7.1's twisted Levi inclusion, Theorem IX.7.2 with its full proof,
Corollary IX.7.3 and Theorem IX.7.4 were all read in this session; the handoff note for
issue #726, `research/blueprint/handoff/BP-ExcursionOperatorsAndSpectralAction--ES0.md`,
carries a table of their printed pages and proof structures, so that job should start
from it rather than re-extracting the PDF.
