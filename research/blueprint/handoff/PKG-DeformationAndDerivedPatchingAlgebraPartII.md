# Handoff: PKG-DeformationAndDerivedPatchingAlgebraPartII

Worker: Claude (session claude-Lpov4n), 2026-10-13. Issue #9164.

## What is done

The roadmap package is complete in `research/blueprint/packages/DeformationAndDerivedPatchingAlgebraPartII/`:

- `README.md` (about 100 KB): front matter (summary, scope and ownership, conventions with the five
  corrected source slips, exact supplier contracts, how to read the build), Layers K0–K4 with every
  target of the accepted plan, its API, Checks, hypotheses, locators and *Needs:*, worked examples,
  downstream consumers and references.
- `Suggested.lean` (560 lines): light real-bodied definitions (`annihilatorProduct`, `prefixQuotient`,
  `IsSecant`, `LowLocalCohomologyVanishes`, `IsCMSecant`, `IsDSequence`, `prefixProduct`,
  `KawasakiConditions`, `reesModule` with its closure proofs, `affineChart`, `ChartRing`, `chartModule`,
  `IsCMBlowupChartwise`), the layer milestones and end theorems proved by `sorry`, and discriminating
  `example`s. No sorry'd data, no `True` placeholders, no attribute hacks.
- `metadata.toml`: `topic = "math.AC"`.

All 68 plan targets and all 26 plan tests are in the README (checked against the packet node list).

## Checks run

- `lean-check research/blueprint/packages/DeformationAndDerivedPatchingAlgebraPartII/Suggested.lean`:
  exit 0, only `declaration uses 'sorry'` warnings (Mathlib 082e2d3, Tau Ceti f790474; imports
  `Mathlib` only).
- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems.
- `python3 scripts/check_sorry_data.py` on `Suggested.lean`: clean; 560 lines (< 5,000).
- Name alignment: every Lean declaration is named in the README, and every "`Suggested.lean` declares"
  name exists in the Lean file. A separate cross-check confirmed every cited Mathlib name at the pin
  (none deprecated), every cited Tau Ceti name in the current library (and absent at the pin), and every
  cited SchemeAndStackFoundations name in that package.
- Locators: Česnavičius arXiv v2 (sha256 matches the packet) re-read for §1.14 and §3 (pp. 9–17);
  Kawasaki 1996 items and pages re-checked (Def. 2.1 p. 41; Lemma 2.4, Def. 2.5, Thm 2.6, Lemma 2.7
  p. 42); every Stacks tag cited was fetched and its lemma number confirmed (list in the README
  References).
- Duplication: current Tau Ceti (a91d3aaf) has the Rees grading, affine blow-up algebras and chart
  immersions (cited, not planned) and no CM/depth/local cohomology/d-sequence/strict-transform
  material; TauCetiRoadmap main (including the post-snapshot roadmaps) has none of this roadmap's
  targets.

## Supplier changes made in the package (the packet is unchanged)

This Part II is outside the 94; its parent is tier 10. The packet cited two suppliers outside the
allowed set, and three suppliers whose actual plans do not contain the cited material:

1. `AnalyticStacks:AS.1` (outside the 94; does not plan ordinary-ring dualizing complexes) is replaced
   by SchemeAndStackFoundations SF.2 (`Coherent.DualizingComplex`, `Coherent.NormalizedDualizing`).
   Normalized local duality in the module form `H^j_𝔪(M) ≅ Hom(Ext^{-j}(M, ω), E)` is now a target of
   Layer K0.7 here (Stacks 47.18.3/47.18.4, 47.7), with the dimension-function lemmas cited from
   Stacks 47.16.5, 47.17.3, 47.17.4.
2. `AdicCoefficientsAndComparisons:L5` (does not supply module strict transforms) is dropped. The strict
   transform of a quasi-coherent module along a blowing-up (Stacks 080D/080E) is now a definition
   target of Layer K3.4 here. SchemeAndStackFoundations SF.4's `AlgebraicGeometry.strictTransformModule`
   is a different construction (quotient by base torsion along a modification of integral schemes,
   `[IsModification φ]`) and is not cited as the same object. AdicCoefficientsAndComparisons' README
   still lists this roadmap among the importers of its L5 (its "Downstream" list); that line can be
   dropped there.
3. The generic depth/CM/local-cohomology interfaces requested from `DeformationAndDerivedPatchingAlgebra:R03.3`
   are not in R03.3's accepted plan; R03.3 itself takes depth and CM from SchemeAndStackFoundations
   SF.0. The package therefore cites SF.0 (`IsLocalRing.depth`, `Module.IsCohenMacaulay`,
   `Scheme.Modules.IsCohenMacaulay`, `Ring.IsCatenary`) and SF.2 (module local cohomology with its
   extended Čech complex, flat base change, depth via local cohomology). R03.3 is still cited for
   "a parameter element of a nonzero finite CM module is regular" (`cm-parameter-element`).
4. Notions with no owner, now targets here: secant sequences `IsSecant` (Česnavičius Def. 3.1(i),
   Remark 3.2); the composite-support spectral sequence and change of rings for local cohomology
   (Stacks 47.9.6, 47.9.2) with the one- and two-element consequences; the bundled predicate
   `KawasakiConditions`; the product-of-ideals identity for scheme blow-ups (Stacks 31.33.12; not in
   StableReduction Layer 4's list); the chart-module API including the homogeneous-localization
   comparison; `moduleBlowup.isCohenMacaulay_iff` (chartwise CM ⇔ CM of the sheaf); the strict
   transform of a module along a blowing-up (`blowupStrictTransform`, K3.4).
5. StableReduction Layer 4 is cited only for what its README lists (relative Proj blow-up, universal
   property, properness, behaviour off the centre, exceptional divisor, strict transforms of
   subschemes, affine charts).

## Corrections to the plan (recorded here; the packet is unchanged)

1. **Prefixwise inheritance (the plan's open point in K2/K4).** Robustness (Remark 3.12) transfers
   Kawasaki's conditions to `M/r'M` or `M/rₛᵐM` only if the auxiliary element is secant for each
   relevant prefix quotient. The package states the weaker-hypothesis theorem and the depth induction
   with the extra hypothesis that the list is secant for `M` (true for every CM-secant list), and runs
   the induction over lists of length `s` (no terminal hypothesis), applying the inductive hypothesis
   to `M/rₛᵐM` with the truncated list `r₁, …, r_{s-1}`. With secancy, `rₛᵐ` and `r'` are secant for the
   needed prefix quotients by Remark 3.2, so the inheritance gap closes. Kawasaki's theorem itself is
   unchanged.
2. **Regular-element reduction.** The plan asserted regularity of `r'` on `M/I_sⁿM` for every prefix `s`;
   condition (iii) gives it only for the full product `I_t` (for shorter prefixes its antecedent needs
   regularity on `M/(r₁, …, r_s)M`). The package asserts it for `I_t` only, which is all the reduction
   uses.
3. **Chart relation.** `chart_relation_mem_annihilator` needs a Noetherian base (flat base change of
   Mathlib's `Ext`-colimit local cohomology); the plan stated it over an arbitrary ring.
4. **Remark 3.2.** Replacing `rᵢ` by `rᵢr_j` is allowed only in the truncated list `r₁, …, r_{i-1}, rᵢr_j`
   (`r₁r₂, r₂` is never secant); powers of any entry are allowed. The secancy dimension formula needs
   `M ≠ 0`.
5. **Lean shape.** The plan's suggested file had sorry'd data (`GradedAlgebra` instance on the Rees
   grading, chart open immersions, the module blowing-up sheaf, Rees-module maps) and global
   `attribute [-instance]` changes. The package keeps only data-free statements: the blow-up scheme
   and the sheaf are README targets, and Cohen–Macaulayness of `Bl_I(M)` is stated chartwise
   (`IsCMBlowupChartwise`), with the equivalence to the sheaf statement a README target (K3.3). A type
   synonym `ChartRing` gives the chart ring a single ring structure, which removes the instance
   diamonds without attribute changes. The duality theorems of K0.7 are README-only (their carriers,
   dualizing complexes, are not at the pins).

## Sources not read (cited through Česnavičius)

- Schenzel 1982, 2.4.2 (proof of K0.5) and Kawasaki 2000, 2.2, 2.8–2.10, 3.1–3.3 and Kawasaki 2002, 3.6
  (proofs of K1.2 and K2.3) are cited as the proofs to follow, with Česnavičius' list of corrections to
  Kawasaki 2000. They were not read in this job. Kawasaki's two papers are in Trans. Amer. Math. Soc.
  and should be freely readable on the AMS site; a follow-up could confirm the item numbers (the
  README deliberately gives them without "Lemma"/"Proposition" labels).
- Herrmann–Ikeda–Orbanz is not used: the dimension bound is proved from Stacks 10.113.1 and a `Proj`
  prime-chain argument, and the counterexample from the HJLS preprint.

## Where to resume

Nothing remains for the package job. The review (`REV-PKG-DeformationAndDerivedPatchingAlgebraPartII`)
should in particular recompute the K4.4 depth-induction sketch with the added secancy hypothesis and
the K0.7 duality statements.
