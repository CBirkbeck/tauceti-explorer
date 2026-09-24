# Handoff — BP-RelativeFarguesFontaine--RF4 (issue #986)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-rf4`.

## Deliverables

- `research/blueprint/packets/RelativeFarguesFontaine--RF4.json` — 5 nodes
  (1 definition, 1 lemma, 1 comparison, 2 theorems), 7 API items, 5 unit tests,
  3 planets, 21 baseline declarations, 9 gaps, 7 requests, 1 structural proposal.
  `"part": "RF4"`, `"status": "partial"`.
- `research/blueprint/readmes/RelativeFarguesFontaine--RF4.md` — 465 lines.
- `research/blueprint/suggested/RelativeFarguesFontaine--RF4.lean` — 224 lines.
- This note.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/RelativeFarguesFontaine--RF4.json --index $TAUCETI_BASELINE/declarations.tsv`
  → **0 errors, 0 warnings**.
- `python3 -m unittest discover -s tests` → 273 tests, OK.
- `python3 research/blueprint/intake.py check-files` → 0 problems.

**The Lean file was not compiled.** No Lean was run; the Mathlib build here is a
shared cache that must not be rebuilt. Every `implementationStatus` is
`unchecked`.

## Scope

Second part of the roadmap: `RF4` with its two substages. `RF0`–`RF3` belong to
`BP-RelativeFarguesFontaine--RF0` (issue #985, PR #2858). Not in a restructured
family. With both parts submitted, all 24 nodes of the decomposition are planned.

## The one node that is not inherited

The decomposition has four nodes here and **none of them is a definition**. The
geometric, cohomological and Tannakian notions of a `G`-torsor appear only inside
the statement of the theorem that compares them — and the stage is named
*Tannakian transfer*. PROTOCOL §0 requires that no definition of the sources be
left out, so `RF4:G-torsors/three-notions-of-G-torsor` was added, with an API
outline and five unit tests.

**Its four locators were read directly from `Berkeley.pdf` in this session**,
from a file whose SHA-256 reproduces byte for byte, by inflating the PDF's object
streams and reading its text operators; the printed pages were confirmed from the
running heads:

- **§19.5, printed p. 179** — the three definitions verbatim, as a displayed
  list.
- **Immediately before them, p. 179** — *"There is the problem that in general,
  if `X` is an adic space over `ℤ_p`, it is not clear whether `G × X` is also an
  adic space. For this reason, we restrict to one class of spaces where this
  happens, at least when `G` is smooth."* That is why the sousperfectoid
  hypothesis is there, and the stage text asks for it to be retained rather than
  assumed away.
- **Footnote 1, p. 178** — any exact `⊗`-functor is automatically faithful,
  because the trivial representation embeds into `V ⊗ V^∨`. So faithfulness is
  not an extra hypothesis on a Tannakian torsor, and exactness is not optional.
- **§19.1, printed p. 170** — *"For our purposes, it is easiest to define
  `G`-torsors in terms of the Tannakian formalism … a trivialization is
  meromorphic along `S^♯` if and only if this holds true for the corresponding
  vector bundles associated to all algebraic representations of `G`."* That is
  the condition the modification node uses.

A reviewer should check those four first: they are the only content of this
packet not inherited from the independent review.

## Source verification

All four of the roadmap's sources were downloaded again in this session and
**all four SHA-256 hashes reproduce byte for byte** — `FS-geometrization`,
`SW20-berkeley`, `BMS18-integral` (arXiv:1602.03148) and `GR02-almost`
(arXiv:math/0201175).

## The library finding

`data/library-coverage.json` has no reviewed audit entry, so the pinned index was
searched directly.

**Tau Ceti already has Tannaka reconstruction** — 125 declarations under
`TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/`, including
`tensorAutFunctor` and `pointsFunctorIsoTensorAutFunctor`, both cited here. But
they are reconstruction **over a field**, for finitely generated comodules over a
Hopf algebra. The theorem of this layer is the equivalence of three notions of
**torsor** over a sousperfectoid analytic adic space over `ℤ_p`, whose proof runs
through étale descent of vector bundles on such spaces and the relative spectrum
of a faithfully flat quasicoherent algebra, and whose conclusion includes that a
geometric torsor is itself sousperfectoid and locally étale over a ball. It does
not follow from the pinned statement, and no node here re-plans it.

Also cited: `IsAdicComplete`, `AdicCompletion` and `IsLocalization` for the
Beauville–Laszlo lemma — whose whole subtlety is that `R → R̂` may fail to be
flat — `Module.Projective` for its finite-projectivity clause, and
**`IsDiscreteValuationRing`**, because the base case of the étale-local
triviality argument is that at a geometric point `B^+` is a *product of complete
discrete valuation rings with algebraically closed residue field*, where every
`G`-torsor is trivial.

**Absent at both pins**, as everywhere in this family: adic spaces, perfectoid
rings and diamonds.

## What remains

Neither substage is closed. The decomposition's seven gaps are roadmap-wide and
are carried in both parts; two are added here. Specific to this part:

1. **Only the statement of SW20 Lemma 5.2.9 was read**; its proof — Beauville,
   Laszlo, *Un lemme de descente*, CRAS 1995 — was not, so the non-noetherian
   argument itself is unverified, and that argument is the whole content of the
   lemma.
2. **KL15 Theorem 8.2.22 (c) and (d)** (the étale sheaf property and étale
   descent of vector bundles on sousperfectoid spaces) and **SW20 Proposition
   6.3.3** (stability of sousperfectoidness under étale maps) were not read, and
   the three-descriptions theorem rests on all three.
3. **[GR03, Proposition 5.4.21]**, used by Fargues–Scholze for étale-local
   triviality of `G`-torsors over `B^+`, could not be matched in the locally
   available Gabber–Ramero copy — whose hash *does* reproduce, and whose
   `edition` field already records that it is arXiv v3 and not the Springer LNM
   pagination Fargues–Scholze cite as [GR03].
4. **Compatibility of the gluing with tensor, dual, base change and several
   disjoint divisors**, and **independence of the faithful representation and
   compatibility with extension of structure group**, are asserted by the stage
   text and no source proof of them was read.

## Structural proposal

**`RF4:G-torsors` should say which Tannakian statement it owns.** The pinned
libraries have the other one. Tau Ceti's Tannaka is reconstruction over a field;
what this layer needs is a transfer between three notions of torsor over a
sousperfectoid adic space, and the difference is exactly where the work is.
Saying so in the stage text would stop a reader thinking the layer has to build
the Tannakian formalism. The same narrowing is proposed for
`GeometricSatakeAndFusion:GS4:integral-dual-group` in PR #2850, for the same
reason — two consumers, both needing something the pinned Tannaka does not give.

## Where to resume

Both parts of this roadmap are now submitted, so all 24 nodes of the
decomposition are planned. The next real work is source reading: the
Beauville–Laszlo proof first, since it is the one lemma here whose argument
nobody has followed; then KL15 8.2.22 and SW20 6.3.3; then a copy of
Gabber–Ramero with the numbering Fargues–Scholze cite.
