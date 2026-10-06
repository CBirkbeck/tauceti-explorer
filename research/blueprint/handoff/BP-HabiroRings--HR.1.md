# BP-HabiroRings--HR.1 — complete planning pass

Issue: [#6497](https://github.com/CBirkbeck/tauceti-explorer/issues/6497).
Worker: Codex — codex-Af1gv8. Claim confirmed by the swarm bot.
Branch: codex-Af1gv8-habiro-hr1.

The complete packet has HR.1 coverage **planned**, not closed. It supplies both
local gaps of accepted BP-HabiroRings: the integral Wilkerson comparison and the
construction and perfect covering of free Λ-rings. Nothing is claimed implemented.
All fifteen new nodes retain implementationStatus unchecked.

## Delivered

- Fifteen nodes: ten theorems, four constructions, one definition.
- Twenty-six API items and sixteen unit tests for the five new definitions and
  constructions. The simultaneous Witt comonad and reconstructed-section laws
  are promoted theorem nodes because other declarations consume those API laws.
- Three new planets: Big Witt comonad, Wilkerson’s theorem, Free Λ-ring. Retain
  the three accepted parent HR.1 planets, for six altogether.
- Thirteen baseline declarations, with actual statements read at Mathlib
  082e2d37e8b0463410cdb532e111cd43d5a66174. Tau Ceti
  f790474821cf4256814db967cb154e7af3d0c369 was searched at that git object;
  the supplement needs no Tau Ceti module imports.
- Explicit imports of all six parent HR.1 nodes, the parent HR.4 full/truncated
  big Witt functor, and the exact PR.0 torsion-free Frobenius/delta equivalence.
- No new local mathematical gaps; one inherited external completion request.
- A reader document of approximately 9,800 words, including the retained parent
  interfaces, exact conventions and the complete localized flatness proof route.

The free object is the polynomial ring on Witt coordinate blocks I × positive
integers. Its coaction is specified using the big Witt comultiplication, so its
universal property allows arbitrary coalgebra targets, including torsion. The
Adams comparison is restricted to torsion-free rings. The exterior operation
convention has the required sign: exterior λ² is minus the second Witt
coordinate. Full Frobenius refines the imported finite-divisor interface; it
does not create another owner or ring construction.

The derived flatness argument uses the coordinate congruence modulo p for a
restricted monomial basis over ℤ_(p), and the triangular coefficient p for a
polynomial-algebra presentation over ℤ[1/p]. Finite weighted pieces are used
only for finite generator blocks. Arbitrary I is handled by finite support.
Localization uses the scalar action through ψᵖ. Witt-ring Frobenius divisibility
modulo pW(A) is proved separately and is used for the comonad construction.

## Checks completed

- `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroRings--HR.1.json`:
  zero errors and zero warnings, with the declaration index available.
- `lean-check research/blueprint/suggested/HabiroRings--HR.1.lean`:
  exit 0 at the pinned Mathlib; only admitted-declaration warnings. This result
  concerns the new suggested file, not a recompilation of the parent. The file
  gives actual ring-map equalities, polynomial evaluation, a finite signed
  exterior product, localized bases/algebra equivalences, and faithful-flat
  ring-map statements. Its bounded parent adapters are documented explicitly.
- All twenty-six API names and sixteen test names checked against the suggested
  file; every new node’s identifier occurs there. Reader generated from the
  final packet and the retained parent nodes, then checked for count agreement.
- Every new source excerpt checked as a literal substring of the downloaded
  version after whitespace normalization; maximum excerpt length 59 characters.
- Independent finite arithmetic checks: integral Frobenius coordinate polynomials
  for p=2,3 and n=1,…,4, including triangular coefficients, weights and prime
  congruences; restricted-basis monomial bijections in weights 0,…,6 for one and
  two blocks at p=2,3; integer section ghosts through index 8. These checks test
  examples and proof conventions, not formal implementation.
- Only the issue’s four deliverable paths are changed. No parent packet,
  atlas/data/content file, queue, or supplier file is edited.

## What integration and the independent review must do

1. Retain the six accepted HR.1 node ids, their APIs and tests. Add this packet’s
   fifteen nodes. Replace exactly the parent’s two HR.1 gap records; preserve
   its unrelated HR.4 and other-stage gaps.
2. Route the parent’s coarse PR.0 dictionary request to the existing node
   `PrismaticCohomology:PR.0/torsionfree-frobenius-equivalence`, as this supplement
   already does. No generic delta construction is planned here.
3. Resolve the inherited `DerivedDeRhamCohomology:DD.1` request: derived principal
   completion, derived Nakayama, and the bounded-torsion comparison with classical
   completion, for the imported completion criterion and étale Frobenius lift.
   This precise supplier boundary is why coverage remains planned.
4. Apply the accepted RS-10 round-two atomic ownership rule. QWittVectors is
   currently a draft, not installed. HR.1 and HR.4 remain interim suppliers.
   Transfer their nodes, the new interfaces, and consumers together when QW.1–2
   is installed; do not create duplicate QW nodes or new cross-stage cycles.
5. Review the derived flatness argument, especially the degree-p scalar action,
   finite-weight matrix inverse, arbitrary-generator finite-support passage,
   away-p inverse substitution, and nonzero localized fibres. Also check the
   arbitrary-ring coalgebra boundary and both distinct prime congruences.

No further local HR.1 mathematical refinement is identified in this pass. Its
open work is the inherited supplier interface and authorized assembly/ownership
integration. The next worker must not restart these definitions.

## Sources and reproducibility

Read 2026-10-06: Hesselholt, arXiv:1006.3125v3, §1 pp.6–19 and cofree adjunction
p.24; Borger, arXiv:0801.1691v6, §1.6–1.9 and §1.17–1.18; Wagner q-Witt,
arXiv:2410.23078v5, §2.31–2.33, Remark 2.47 and footnote (2.3); Wagner q-Hodge,
arXiv:2510.04782v2, §1.22(e) and the parent’s completion/étale passages. URLs,
version dates and PDF SHA-256 values are in the packet. No necessary source is
missing; the public Dwork/comonad proofs supply the Wilkerson proof route without
requiring access to the 1982 paper. No new source mistake was found. Existing
parent source issues remain there.

The reviewed AUDIT-17 HR.1 entry, accepted parent and RS-10 ownership result,
roadmap/stage edges and matching blueprint links were read. The upstream models
read were AdicSpaces and LocalFieldsRamification. Scratch source PDFs, texts,
worklist, arithmetic checks and compiler log are disposable and are removed
on submission; all information needed to resume or review is recorded here and
in the four public deliverables.
