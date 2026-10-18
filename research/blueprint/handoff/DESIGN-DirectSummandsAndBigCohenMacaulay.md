# Handoff: DESIGN-DirectSummandsAndBigCohenMacaulay (issue #3479)

Worker: Claude (session claude-seWkLY), 2026-10-18.

## What was done

Designed the new roadmap **Direct summands and big Cohen–Macaulay algebras** (`DirectSummandsAndBigCohenMacaulay`, area `commutative`, no parent). Both paper routes of the brief (PAPER-ANDRE-18-B route 1, 111 items; PAPER-BHATT-18 route 9, 19 items) are planned as this one roadmap. The direct summand theorem is stated once, with André's and Bhatt's mixed-characteristic proofs as alternative routes.

Deliverables:
- `research/blueprint/roadmaps/DirectSummandsAndBigCohenMacaulay.json`: eight layers DS.0–DS.7 with their targets.
- `research/blueprint/packets/DirectSummandsAndBigCohenMacaulay.json`: target-level plan, status `complete`.
  - 52 nodes: 6 definitions, 3 constructions, 43 theorems.
  - 51 API items, 42 unit tests, 32 planets, 40 baseline declarations.
  - 19 source issues, 2 gaps, 2 requests, 2 restructure proposals.
- `research/blueprint/readmes/DirectSummandsAndBigCohenMacaulay.md`: the reader document (about 28,000 words). The introduction, scope, conventions and layer introductions are hand-written; the per-target sections are generated from the packet, so the two agree.
- `research/blueprint/suggested/DirectSummandsAndBigCohenMacaulay.lean`: 468 lines, 50 declarations.

Layers:
- DS.0: split algebras, splinters, big and balanced big Cohen–Macaulay modules, the splitting obstruction, completion, flatness over regular local rings, reductions, the trace (ℚ ⊆ R) and dimension ≤ 2 cases.
- DS.1: Hochster's endomorphism criterion, the corrected pure-to-split theorem over complete local rings, and the characteristic-p theorem.
- DS.2: André's theorem for W(k)⟦T_1,…,T_n⟧ (adic splitting criterion; splitting modulo p^m).
- DS.3: Bhatt's proof for every complete regular local ring of mixed characteristic. It covers Cohen presentations, perfectoid covers, obstruction detection, almost splitting on annuli, and the limit argument.
- DS.4: big Cohen–Macaulay algebras. It covers almost Cohen–Macaulay algebras, Hochster's partial algebra modifications, the modification criterion and key lemma, André's existence theorem, Hochster–Huneke in equal characteristic, and weak functoriality from almost Cohen–Macaulay squares.
- DS.5: the direct summand theorem (both routes), Chase's theorem for Noetherian rings, flat domination (Théorème 0.7.2), splitting of R → R⁺, contracted ideals and the monomial theorem.
- DS.6: Cohen–Macaulayness of pure subrings of regular local rings of mixed characteristic (Théorème 4.4.2).
- DS.7: Bhatt's derived direct summand theorem, with the characteristic-p and characteristic-0 cases.

## Checks

- `TAUCETI_BASELINE=<pinned index> python3 scripts/check_blueprint.py research/blueprint/packets/DirectSummandsAndBigCohenMacaulay.json`: 0 errors, 0 warnings. Every baseline declaration was found in the pinned index (Mathlib 082e2d3, Tau Ceti f790474). The statements of `IsRegularLocalRing`, `IsRegularRing`, `RingTheory.Sequence.IsWeaklyRegular`/`IsRegular`, `localCohomology`, `Module.Flat.pi` (Tau Ceti) and `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` were read in their source files.
- `python3 scripts/check_sorry_data.py` on the suggested file: passes.
- **The suggested Lean file compiled.** `lean-check` at Mathlib 082e2d3 and Tau Ceti f790474 elaborated it: exit 0, no errors, and `sorry` is the only warning (50 declarations). Definitions have real bodies (`Algebra.IsSplit`, `Algebra.IsPure`, `IsSplinter`, `IsSystemOfParameters`, `IsBigCohenMacaulayFor`, `IsBigCohenMacaulay`, `IsBalancedBigCohenMacaulay`, `IsAlmostCohenMacaulay`). Elaboration does not prove the theorems.
- A dry atlas assembly (`build.assemble`, nothing written) was run with this packet and PerfectoidSpacesPartII (accepted, not yet promoted) loaded as if promoted. It adds the eight layers and their stage links with no skipped (cyclic) links.

## Stage coverage

All eight stages are `planned`. The `remaining` lists name lemma-level refinements, and the two gaps below.

## Ownership decisions (for the maintainer and later jobs)

- **Imported from PerfectoidSpacesPartII, not replanned.** The brief asked for an "early purity prefix" here, but DESIGN-PerfectoidSpacesPartII (#3480, accepted by its review) already plans these in RA.5 and records a restructure proposal for it; this design follows that proposal:
  - pure and almost pure maps (André B Annexe A.1–A.2, A.4) and André's Krull detection lemma: `PerfectoidSpacesPartII:RA.5/pure-map`, `/almost-pure-map`, `/krull-detection-lemma`;
  - the flat integral model and ramified almost flatness: `/flat-integral-model`, `/ramified-kummer-almost-flatness`, `/kummer-almost-faithful-flatness`;
  - the perfectoid Riemann extension theorem (RA.3);
  - almost-pro-zero towers and the quantitative Riemann extension theorem (RA.0–RA.1).
  This roadmap keeps Hochster's purity criteria (Annexe A.3, corrected).
- **Owned here.** Big Cohen–Macaulay modules, balanced big Cohen–Macaulay modules and splinters, in their arbitrary-module form, and the characteristic-p theorem that R⁺ is balanced big Cohen–Macaulay. PAPER-BHATT-ETAL-23 routes the same items to the proposed Part II `SchemeAndStackFoundationsMixedCharacteristicBirationalGeometry`. A `rescope` proposal in the packet asks that roadmap to import them from DS.0 and DS.4; its design job should cite `DirectSummandsAndBigCohenMacaulay:DS.0/splinter`, `/big-cm-module`, `/balanced-big-cm-module` and `DS.4/char-p-absolute-integral-closure`.
- **Imported from DeformationAndDerivedPatchingAlgebra.** Systems of parameters, the residue injective hull, Matlis duality, top local cohomology and Kunz's theorem come from the accepted whole-roadmap packet (`DeformationAndDerivedPatchingAlgebra:R03.3/...`); Cohen maps, residue extensions, completions and the Artin–Rees Hom pro-isomorphism from the accepted R03.1 packet. PAPER-ANDRE-18-B route 3 also sent `complete-local-normalization` to R03.3, but no accepted packet plans it. This design does not need it: Théorème 0.7.2 is proved with a domain quotient of maximal dimension instead of the normalisation.

## Red-team finding RT-AREA-padic-1/2 (handed to this job)

The finding was that André's perfectoid Abhyankar lemma (*Le lemme d'Abhyankar perfectoïde*, Théorème 0.3.1) was used by two accepted designs but planned nowhere. This is now resolved:
- DESIGN-PerfectoidSpacesPartII planned the lemma by André's own route, as `PerfectoidSpacesPartII:RA.4/perfectoid-abhyankar-lemma`, with ramified almost purity and annular envelopes.
- It did not use Bhatt–Scholze Theorem 10.9, which belongs to the unplanned Part II of PerfectoidQuotients; importing it would have created an upward dependency.
- This roadmap imports the lemma through the fragment it consumes, `PerfectoidSpacesPartII:RA.5/ramified-kummer-almost-flatness` (André B Théorème 3.2.1, Corollaire 3.2.2), in DS.2 and DS.4.

So the lemma has one owner, and both consumers point at it. Neither this packet nor the reader rests on a rejected route of PAPER-ANDRE-18. Rewording the ANDRE-18-B route 4 brief, the second half of the suggested fix, is outside this job's files and is left to the maintainer.

## Gaps and requests

- **G1** (`DS.4/equal-char-zero-big-cm`). Hochster–Huneke 1995 was not read. The node outlines the classical reduction to characteristic p: a bad sequence of partial modifications is a finite system of equations, descended by Néron–Popescu approximation. The precise descent statement must be read off the source.
- **G2** (`DS.7/char-zero-derived-splitting`). Kovács' theorem (rational singularities ⇒ derived splinter) rests on resolution of singularities in characteristic 0 and on Grauert–Riemenschneider vanishing. No roadmap of the atlas plans either. SchemeAndStackFoundations SF.4 says resolution is a theorem only in named settings; it is the natural owner of Hironaka's theorem.
- **Request R1** to `PerfectoidSpacesPartII:RA.5`. André's flatness theorem in the generality of André B Remarques 2.6.1(4): a ramified complete regular local base, and several elements g ramified at once. RA.5 records this only as a hypothesis note. It is needed by `DS.6/weak-functoriality-regular-target`.
- **Request R2** to the Tau Ceti roadmap StableReduction, Layer 2 (coherent R^i f_* under proper morphisms over Noetherian bases). This only records a stage-level citation of existing Tau Ceti work.

## Source issues

The packet records 19 issues. All were found by the paper extractions and confirmed by their reviews, and each was rechecked at its locator in the texts read here:
- PAPER-ANDRE-18-B: E1, E2, E3, E4, E5, E6, E9, E16, E19, E20, E21;
- PAPER-BHATT-18: E1, E2, E3, E9, E10, E13, E14, E15.

Every node uses the corrected statements. The ones that change stated results:
- Hochster's criterion needs the separating element r to be regular or zero (E2).
- The pure-to-split implication needs a complete base (E3, E4; Datta–Murayama's DVR is the counterexample).
- Bhatt's Proposition 6.2 needs surjectivity of f[1/p] (E17).
- The monomial "iff" needs dimension ≥ 1 (E15).
- André's flat domination takes the product only over dominating components (E14).

No new mistakes were found.

## Route items: where each one went

PAPER-ANDRE-18-B route 1 (111 items):
- **Planned as nodes:**
  - DS.0: splitting → `split-algebra`; splinter; big-cm-module/big-cm-fixed → `big-cm-module`; balanced-big-cm-module/big-cm-balanced; completion-balances; regular-big-cm-flat; finite-splitting-descent → split-algebra API; flat-ext-basechange → `splitting-obstruction` API; reduction-to-domain, galois-closure-reduction and discriminant-element → `direct-summand-reductions`; invertible-degree-retraction → `trace-retraction`; finite-flat-split and dimension-two-case → `low-dimension-direct-summand`.
  - DS.1: functional-retraction-regular-r → `endomorphism-retraction-criterion`; complete-pure-split; frobenius-direct-summand-char-p.
  - DS.2: compatible-splittings → `adic-splitting-criterion` (Artin–Rees in place of Hochster's coset stabilisation, so retraction-coset-stabilization, countable-surjective-system-section and compatible-functional-limit are not needed); mod-p-splitting and mod-p-power-injective → `mod-p-power-splitting`; unramified-direct-summand.
  - DS.4: almost-big-cm; partial-modification, full-algebra-modification and modification-sequence → `partial-algebra-modification`; no-bad-sequence-criterion → `modification-criterion`; hochster-key-lemma; almost-to-balanced-cm and almost-cm-no-bad-sequence → `almost-cm-to-big-cm`; almost-cm-finite-base, almost-cm-flat-criterion and almost-cm-mod-parameter-criterion → `almost-cm-criteria`; big-cm-reductions; big-cm-existence; big-cm-equal-characteristic → `equal-char-zero-big-cm` and `big-cm-existence`; absolute-integral-closure-big-cm-char-p; weak-functorial-cm → `weak-functoriality-almost-cm`.
  - DS.5: direct-summand → `direct-summand-theorem`; product-flat-noetherian and fp-tensor-arbitrary-product → `flat-products-noetherian`; finite-cover-flat-domination; complete-plus-retraction and integral-finite-subalgebra-union → `absolute-integral-closure-splits`; contracted-ideal-criterion and monomial-conjecture → `homological-consequences`.
  - DS.6: pure-local-completion and purity-perfect-residue → `pure-local-completion`; weak-functoriality-regular-target (no-unramified-square and discriminant-pullback-obstruction are its hypotheses and checks); hh-cm-descent → `cm-descent-from-regular-target`; pure-regular-target-cm → `pure-subring-of-regular-is-cm`.
- **Imported from PerfectoidSpacesPartII RA.5:**
  - purity: pure-module, pure-ring, module-generator, generator-finite-sum, pure-fp-test, pure-hom-lift, pure-fp-quotient-split, pure-filtered-split, pure-tor-injective, pure-flat-quotient, pure-restrict-scalars, pure-ring-basechange-test, pure-composition, pure-basechange, pure-colimit, pure-left-factor, pure-product, flat-descends-pure, pure-tensor-faithful, faithfully-flat-iff-pure-flat, finite-pure-split-generator, tor-filtered-colimit;
  - almost purity: almost-pure-module, almost-pure-left-adjoint, almost-hom-lift, almost-ext-class, almost-pure-ring-adjoint, almost-pure-left-factor, almost-pure-finite-basechange;
  - Krull detection: idempotent-annihilator, idempotent-annihilator-local, flat-annihilator;
  - steps of André's flatness theorem: flatness-by-fibres, colimit-base-flatness, flat-colimit-coherent, fp-ideal-descent, complete-module-flatness. Bhatt's algebra criterion, DerivedDeRhamCohomology DD.1, suffices for every use here.
- **Checks and tests, not separate nodes:**
  - heitmann-dimension-three: an acceptance item of the direct summand theorem;
  - non-regular-counterexample: a unit test of split algebras and splinters;
  - noncomplete-dvr-counterexample: a hypothesis and check of `complete-pure-split`;
  - power-series-plus-endomorphism: an acceptance item of the endomorphism criterion.
- **Not planned: no target needs them.**
  - Hochster's 1983 reduction to the unramified case: ce-property, root-splitting-implies-ce, ce-monomial-obstruction, monomial-splitting-criterion, ramified-plus-nonvanishing, power-series-plus-solid-split, pure-integral-top-nonvanishing, unramified-reduction. The general case is reached through Bhatt's theorem (valid for ramified rings) and through flat domination.
  - André's equal-characteristic illustration, perfect-closure-trace-retraction. Characteristic p is done by Frobenius.
  - The §0.1 reformulations whose proofs lie in sources not read here: flat-descent-criterion (Ohi), improved-new-intersection (Hochster, Dutta), syzygy-conjecture (Evans–Griffith), homological-reformulations. The brief's final targets do not include them; the reader says so under Scope.

PAPER-BHATT-18 route 9 (19 items):
- unramified-cover, ramified-general-cover and field-normalization → `DS.3/regular-local-perfectoid-cover`;
- cover-tor and cover-detection → `DS.3/perfectoid-cover-almost-faithfully-flat`;
- local-complete-reduction and residue-field-extension → `DS.0/direct-summand-reductions`;
- obstruction-detection and perfect-cone-detection → `DS.3/obstruction-detection` (stated for any perfect cone);
- annular-obstruction → `DS.3/annular-almost-splitting`;
- obstruction-limit and perfect-cone-limit → `DS.3/obstruction-limit`;
- direct-summand → `DS.3/bhatt-direct-summand` and `DS.5/direct-summand-theorem`;
- cohen-structure → `DS.3/regular-local-cohen-presentation`;
- perfectoid-proper-split → `DS.7/perfectoid-proper-almost-split`;
- proper-cohomology → `DS.7/proper-cohomology-perfect`;
- derived-local-reduction → `DS.7/derived-obstruction-reductions`;
- derived-summand → `DS.7/derived-direct-summand-theorem`;
- equal-characteristic → `DS.0/trace-retraction`, `DS.1/frobenius-direct-summand`, `DS.7/char-p-cohomology-killing`, `DS.7/char-p-derived-splinter` and `DS.7/char-zero-derived-splitting`.

## Suggested Lean file

The file states only what has carriers at the pins:
- DS.0: `Algebra.IsSplit` with its API, `Algebra.IsPure` (restated from RA.5), `IsSplinter`, `IsSystemOfParameters` (restated from R03.3), big and balanced big Cohen–Macaulay modules, completion and regular flatness, and the characteristic-zero and dimension ≤ 2 splinter theorems;
- DS.1: pure-to-split over complete rings, and characteristic p;
- DS.2: the adic splitting criterion, and `IsSplinter (MvPowerSeries (Fin n) (WittVector p k))`;
- DS.3: the statement of Bhatt's theorem;
- DS.4: `IsAlmostCohenMacaulay` with an explicit root system, and the existence theorems including R⁺ in characteristic p;
- DS.5–DS.6: the direct summand theorem, flat products over Noetherian rings, flat domination, R → R⁺, contracted ideals, the monomial theorem, regular-target weak functoriality, and pure subrings.

Not at the pins, so stated in the README only:
- the splitting obstruction in D(A), RΓ of proper schemes and derived splinters (DS.7);
- perfectoid covers and almost algebra (DS.3);
- partial modifications (DS.4).

The unit tests are `example`s with docstrings naming the packet's test.

## Sources read (2026-10-18)

- André, *La conjecture du facteur direct*, published Numdam copy (sha256 34da107d…): §§0, 1.1, 3, 4 and Annexe A completely; §§1.2–2.6 skimmed, as they are owned by RA.2 and RA.5.
- Bhatt, arXiv:1608.08882v2, complete (sha256 08578ca1…).
- Hochster 2002, author preprint (scanned), pp. 8–10: §4.1, Theorem 4.2, Lemma 5.1.
- Heitmann–Ma, arXiv:1703.08281v2, §1 including §1.2 and Theorem 1.6.
- Huneke–Lyubeznik, arXiv:math/0604046v1, complete.
- Bhatt, *Derived splinters in positive characteristic*, arXiv:1109.0354v1: introduction and §1.
- BMPSTWW, arXiv:2012.15801v3: §2.2 and Definition 2.12.
- Datta–Murayama, arXiv:2007.10383v1: Proposition 5.4.1.
- Hochster, Math 615 local cohomology notes: Theorem (5.4).

Not read; each is cited only where marked:
- Hochster–Huneke 1995 (gap G1);
- Kovács 2000 (gap G2);
- Hochster 1973, cited through André §3.4 and the extraction's reading of p. 30.

## What a follow-up must do

- The independent review (REV-DESIGN-DirectSummandsAndBigCohenMacaulay) should check:
  - the corrected statements of `DS.1/endomorphism-retraction-criterion` and `DS.1/complete-pure-split`;
  - the Artin–Rees replacement in `DS.2/adic-splitting-criterion`;
  - the domain-quotient replacement of the normalisation in `DS.5/finite-cover-flat-domination`;
  - the short argument written out in `DS.6/cm-descent-from-regular-target` (André cites Hochster–Huneke 1995 (2.3) for it, unread here).
- Closing G1 needs Hochster–Huneke 1995. Closing G2 needs an owner for Hironaka's resolution and Grauert–Riemenschneider vanishing.
- PerfectoidSpacesPartII should take request R1 when it is next revised.
