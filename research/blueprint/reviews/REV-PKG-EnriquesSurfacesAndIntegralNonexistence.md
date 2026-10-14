# REV-PKG-EnriquesSurfacesAndIntegralNonexistence

Independent review of the roadmap package
[`packages/EnriquesSurfacesAndIntegralNonexistence`](../packages/EnriquesSurfacesAndIntegralNonexistence/README.md)
against its accepted plan, `packets/EnriquesSurfacesAndIntegralNonexistence.json`. Issue #9212.
Reviewer: Claude (Opus 5.5), session `claude-NLXxTx`, 14 October 2026. I did no part of the
design, plan or package; the package was written by Codex session `codex-qw0wbh`.

**Verdict: accepted**, with the fixes below applied. The package is a faithful, well-formed
specification. It is not a proof: the fourteen-case completeness theorem and the exclusion of
three further configurations remain open proof targets, and the README says so wherever they
are used. Before porting, the maintainer must settle the two structural items in "What remains".

## What was checked

| Check (PACKAGE_REVIEW.md) | Result |
| --- | --- |
| 1. Upstream form | Shape matches TauCetiRoadmap (read AlgebraicVectorBundles and IntegralLattices READMEs at the current checkout): Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, nine layers of prose subsections with API lists, **Checks.**, *Needs:* lines, per-layer Examples and Dependencies, Downstream consumers, References. No target tables or field lists. 2,077 lines, 171 KB. |
| 2. Fidelity to the plan | All 112 packet nodes map one-to-one to README subsections (script match by statement text; four matched by title). All 80 API names and 56 test names present. 105 statements are verbatim; the others differ only by dropping process tokens (`/247`, `/246`, node ids) or by naming the classification hypotheses in words. No claim beyond the plan found. |
| 3. Sources | See the source table. One wrong page range and three citation defects fixed; everything else confirmed. |
| 4. Gaps and citations | No `FoundationsAndLibraryIntegration` or `UPSTREAM:` ids. Cited suppliers: SchemeAndStackFoundations, AlgebraicModuliForArithmeticGeometry (A0 extension), FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 and WeilConjectures WC.7 (atlas packages), and IntegralLattices, AlgebraicVectorBundles, JacobianChallenge and LocalFieldsRamification (TauCetiRoadmap). Four cited suppliers do not exist anywhere; see "What remains". The roadmap is outside the Caraiani–Newton tiers, so no tier order applies. |
| 5. Unit tests | Every definition and construction has at least three discriminating Checks, except the two predicates of 1.2, which shared three. I added one discriminating Check for each. |
| 6. Lean | See the Lean section. `lean-check` exits 0 before and after my changes. |
| 7. Own words, no process | No verbatim passages or section-by-section summaries. Process wording removed (below). `intake.py check-files`: 0 problems on all five files; no local paths. |
| Duplication with current Tau Ceti | Nothing duplicated; newer library objects now cited (below). |

## Sources

All four papers were downloaded to scratch from the URLs in the README. Their SHA-256 values match
the packet: SCH23 `828efee5…`, ESB21 `286a66bd…`, DI21 `806acbf8…`, MMV22 `d1eddae3…`. SCH23's
printed page numbers equal its PDF page numbers. Every locator below was opened and the statement
compared with the README target.

| Source and locator | README targets | Result |
| --- | --- | --- |
| SCH23 §4, pp. 12–13: definition, Bombieri–Mumford invariants, Num ≅ U⊕E₈(−1), Prop. 4.1, Prop. 4.2, Lemma 4.3, type table, K3-like cover, conductrix and exceptional definition, Prop. 4.4(i)–(iii) | 0.1–0.4, 1.6–1.17, 1.19, 1.20, 1.24 | Confirmed. |
| SCH23 §5, pp. 14–17: family definition, Thm 5.1, Thm 5.2, Prop. 5.3, sequence (2), Prop. 5.4, constancy notions, Prop. 5.5, Thm 5.6 | 2.1–2.17, 3.2–3.13, 8.5, 8.7 | Confirmed. **Fixed** 3.3, which gave Prop. 5.5 as pp. 16–17; it is pp. 15–16, and Thm 5.6 begins on p. 16. |
| SCH23 Lemma 1.1 p. 5; Thm 2.1 p. 8; Props 3.1–3.2 pp. 10–11; Prop. 6.2 p. 19; Prop. 7.1 p. 20; Cors 7.2–7.3 p. 21; Prop. 8.1 p. 22; Cor. 8.3 p. 23; Thm 9.1 and Prop. 9.2 p. 24; Prop. 9.3 p. 25; Thm 9.4 p. 26; Thms 10.4–10.5 pp. 29, 31 | Layers 2–4 | Labels found on the cited pages. |
| SCH23 Prop. 11.1 and table (12), pp. 32–33 | 5.1–5.6 | Eleven printed elliptic and four quasielliptic triples match the README; the three extra elliptic triples are the plan's recorded additions. (i)–(iii) match 5.4–5.6. |
| SCH23 Props 11.2–11.4, 12.1–12.3, 13.1–13.2, 14.1, Thm 15.1, pp. 34–49 | 5.9–5.15, Layers 6–7, 8.6 | Confirmed. The printed inverses (14) p. 41 and (16) p. 43 agree entry by entry with my exact inverses of N₁ and N₂. |
| ESB21 Thm 1.1 p. 2; Lemma 2.3 p. 4; exceptional definition p. 5; Prop. 2.8(6) p. 6; Prop. 3.16 p. 12; Thm 4.2 p. 13; Cor. 4.3 p. 14 | 1.17–1.20, 1.22, 8.1 | Confirmed. |
| MMV22 Def. 1.1 p. 1; Thm 1.2, Remarks 1.4–1.5 p. 2; Lemmas 2.1–2.4 pp. 3–4 | 1.4–1.6, 1.21, 1.23 | Confirmed. **Fixed** the 1.23 locator, which read "main paper proof of …" with the Cossec–Dolgachev citation misplaced. |
| DI21 Prop. 3.3 p. 11; Cor. 3.4 p. 12; Prop. 4.2 p. 15; Thm 4.3 p. 16; Thm 6.1 p. 20; Prop. 7.1 p. 23; Thm 7.2 pp. 23–24 | SF.4 contract, 8.1–8.5 | Confirmed; Theorem 6.1's three hypotheses are exactly the README's SF.4 contract. **Fixed** 8.5's unlinked "Schröer 2021 Theorem 7.2" to DI21 and removed a duplicated unlinked DI21 entry in 8.3 and 8.4. |
| Fontaine preprint 91-02, Thm 1 and Remark (a), printed p. 3 (PDF p. 4) | Fontaine contract, 3.11, 3.13 | Confirmed from the scan: proper smooth Q-variety with proper smooth models over every ℤ_p (or over W(F̄_p)) has H^j(Ω^i)=0 for i≠j, i+j≤3. |
| Stacks Tags 0D3D (Lemma 74.13.2), 0H74 (Lemma 15.13.3) | 3.3, 3.4 | Confirmed. |

Source slips noted in passing. The README already handles the first four.
- SCH23's proof of Prop. 5.5 (p. 16) compares a canonical cover over ℤ[1/2] with one over W(F̄₂) without accounting for a twist between them. The README's four-twist comparison (3.5–3.11) closes this; I re-derived it and it is sound.
- DI21 Prop. 7.1 prints χ(Θ)=10; the value is −c₂+2χ(O)=−10 (8.1).
- SCH23 p. 43 writes Pic(Y_K) where Pic⁰(Y_K) is meant (6.4).
- SCH23 p. 15 writes the algebra multiplication as ϕ⁻¹(bb′) with bb′ in L⁻² while ϕ⁻¹ is defined on L²; the README uses the dual map (2.8).
- Not in the README: ESB21's sentence after Theorem 1.1 assigns part (2) to Theorem 4.2 and part (3) to Proposition 3.16, the reverse of their content. The README cites by content, which is correct.

## Adversarial mathematics pass

| Statement | Instances computed | Outcome |
| --- | --- | --- |
| Gram matrices N₁, N₂ (6.1) and the Lean `!![…]` | Exact rational elimination | Lean matrices equal the README description; det −4, rank 8 mod 2, inverse denominators 2, invariant factors 1⁸,2,2. |
| Dual norms (6.2, 6.7) | C₁*²=−1, C₇*²=C₈*²=−2, R*²=0, F*²=−2, C₈*·R*=0, C₈*·F*=2, R*·F*=1; (C₈*+nR*+F*)²=2n at n=0,1,2,7 | All as stated. |
| Spinor incidences (6.6) | All 15 weighted-degree-two vectors mapped into S*/S for N₁ and N₂ | Zero class: interior even hits and double terminals; vector class: C₃, C₅, {0,1}, {7,8}; spinor classes {0,8},{1,7} and {0,7},{1,8}, as stated. The class does not depend on R̃·T, since R* and F′* are integral. |
| Incidence orbits (6.11, 7.2) | Enumeration under the stated symmetries | 15 vectors in orbits 1,2,2,2,4,4 and 6 vectors in orbits 1,1,2,2. |
| Point counts (4.10, 5.1, 5.3) | n_a table at q=2 for all 14 elliptic and 4 quasielliptic triples | Each sums to 25. E₃, E₅ are supersingular and E₂, E₄ ordinary (traces 0, −2, 1, −1), so each triple has at most one semistable or supersingular rational fibre. |
| Quasielliptic component sum (5.2–5.3) | Solutions of r₀+r₁+r_∞=11 in {1,2,7,8,9,9} | Exactly the four triples listed. |
| Forced multiplicities (5.4, 5.5) | Each candidate, with 1.11 (tame half-fibres are ordinary or additive) | Consistent with SCH23 Prop. 11.1(i)–(ii). |
| Dyadic classes (3.6, 3.7, 3.9) | (−1)^e2^a5^b·(−1)^e2^a=5^b(2^a)²; c=−10, u=−2 gives 20=5·2² | Correct. The Layer 3 example used c and u the other way round from 3.9; **fixed**. |
| Hensel at p=2 | u≡1 mod 8: ‖F(1)‖≤1/8<1/4=‖F′(1)‖² | Correct; u≡5 mod 8 fails, as stated. |
| Oort–Tate over ℤ (3.13) | ab=2 with units ±1 | Only ℤ/2 and μ₂, as stated. |
| Type table (1.12–1.14) | μ₂, ℤ/2, α₂ and their duals | Matches SCH23 p. 13. |
| 1.11 tame half-fibres | 2-torsion of Pic⁰: ordinary E, supersingular E, G_m, G_a in characteristic 2 | Ordinary and additive only, as stated. |
| 1.25 distinct pencils | Two isotropic nef classes with zero product in signature (1,9) | Proportional, hence equal when primitive; 2F∼2F′ since Pic^τ is 2-torsion; argument sound. |
| Tangent cohomology (8.1) | χ(Θ)=(7c₁²−5c₂)/6=−10; triples (0,10,0), (1,12,1) | Correct. |
| Lifting (8.2–8.4) | b₁=2(h¹−h²) for supersingular (0=0), Pic⁰_red=0 | DI21 Thm 4.3 applies; Thm 6.1 not used for supersingular, as stated. |
| 2.11, 2.13 hypotheses | Kummer sequence with Pic(R)=0 only | Cover existence and the R×/R×² torsor need only Pic(R)=0; numerical-class descent needs H²(G_m)=0. These refinements of SCH23 Thm 5.6 are correct. |

## Duplication against current TauCetiRoadmap and Tau Ceti

TauCetiRoadmap was read at commit `0d144d0` and Tau Ceti at `a91d3aaf`. A Sonnet helper searched
both for every object of the package; I verified each reported declaration myself. Nothing in either
plans or proves Enriques or K3 surfaces, genus-one or quasielliptic fibrations, Kodaira fibres as
declarations, numerical equivalence, Hodge index, fppf cohomology of schemes, scheme deformation
theory, Deligne–Illusie, Fontaine's theorem, or point counts of surfaces. Nothing was removed.

Objects current Tau Ceti already has that the package uses. None is at the Lean pin, so they are
now named in Scope and ownership:
- `TauCeti.SquareClassGroup`, `TauCeti.card_unitSquareClasses_padic_two`, `Padic.not_isSquare_five` and `TauCeti.UnramifiedQuadratic` (ℚ₂[X]/(X²+X+1)). The README's class-five model z²−z−1 defines the same extension, since −15≡1 mod 16; I added a sentence saying so.
- `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`, the μ_n group schemes and the α_p Frobenius kernel, which underlie the R07.1 contract.
- `LineBundleClass`, `CartierDivisor.toLineBundleClassHom`, `LineBundleClass.eulerDegreeHom`, `picZero` and `rigidifiedPicardFunctor` exist as the README already says.
- IntegralLattices Layer 6, milestone 6A, is the indefinite classification the README imports. Its citation now names the milestone, including in 0.4's *Needs*.

## Lean

`lean-check` on the original file: exit 0, 17 `declaration uses sorry` warnings. My changes:
- `firstGram_symmetric` and `secondGram_symmetric` now have real proofs and are used by
  `firstLattice` and `secondLattice`. Statements that mention these proofs no longer depend on
  a sorry'd term.
- The two half-norm examples are now proved: full norm −2 gives 0 in ℚ/ℤ, full norm −1 does not.

Final `lean-check`: exit 0, 13 `declaration uses sorry` warnings, all on theorem statements; no
errors and no other warnings.

The file has six real definitions (`dyadicRepresentative`, `globalTwist`, `firstGram`,
`secondGram`, `firstLattice`, `secondLattice`) and no sorry'd data. I spot-checked eleven
signatures against the README; all carry the README's hypotheses: the five dyadic theorems, both
determinants, `firstLattice_even`, the basis pairings, and the two incidence counts with their
weight vectors. Every README definition either is declared or is listed in the closing comment.
Layers 0–2, 4–5 and 8 have no Lean content, because their carriers (surfaces, relative Picard
spaces, torsors) are not at the pins. That follows the 2026-10-12 shape.

## Other README fixes

- **3.1 and the WC.7 contract.** WeilConjectures WC.7 (accepted package) states the count for any smooth proper geometrically connected surface with b₁=0, b₂=ρ and constant Num (`count_surface_of_constant_num`). 3.1 re-derived it. It now applies that theorem with the invariants of 0.3, and Scope names WC.7 as the owner of the count.
- **Unwritten suppliers.** Scope and the supplier subsection now say that NumericalPicardAndContractionDescent, GenusOneFibrationsAndRationalEllipticSurfaces, K3SurfacesAndSymplecticBoundedness and EverywhereGoodReductionAndLowDegreeHodgeNumbers do not exist yet, and that the contracts are their specification.
- **Process wording.** Rewrote "acquisition", "foundational proof obligations" and "Record … in the obligations" in 1.4, 1.5, 1.18, 1.19, 1.23, 8.1 and the references: each now says plainly that the quoted older result is part of the target's proof. Removed "proposed" from the genus-one supplier in 4.1.
- **Vacuous hypotheses.** Deleted the hypothesis sentences "…is as quantified in the statement" (1.3, 1.7, 1.8, 1.10) and "…are as in the statement" (3.4, 3.5, 3.8, 3.9, 3.11). Replaced "…exactly those in the statement" in 6.4, 6.6 and 6.7 with a reference to the configurations of 6.2 and 6.3.
- **3.11** no longer draws the Fontaine contradiction itself; it supplies the everywhere-good-reduction K3 surface that 3.13 uses.
- **1.2** gains `test_minus_two_geometric_integrality` (two conjugate (−2)-curves meeting once: integral over k, square −2, not geometrically integral) and `test_four_section`.
- **Downstream consumers** now names WeilConjectures WC.7. The packet's other two consumers, RealSurfacePeriodIndex and MotivesAndCohomologyFoundations, are not atlas roadmaps.
- "fiber" is now "fibre" throughout (13 places, including headings), and "jacobian" in the 4.10 heading is capitalised.

`metadata.toml` is the single line `topic = "math.AG"`, which fits; it is unchanged.

## What remains (for the maintainer)

1. **Four supplier roadmaps do not exist.** NumericalPicardAndContractionDescent (SCH23 §§1–3), GenusOneFibrationsAndRationalEllipticSurfaces (Kodaira fibres, unpointed and quasielliptic Jacobians, SCH23 §§8–10 including the exhaustive rational-Jacobian classification), K3SurfacesAndSymplecticBoundedness (design job #3461 pending) and EverywhereGoodReductionAndLowDegreeHodgeNumbers (Fontaine) are cited by Layers 2–5 and 3.10–3.13. The accepted design review already asked for them to be registered. Until they exist, or their content moves into this roadmap, the layers that cite them cannot be built and the roadmap cannot go upstream. The README states each contract exactly, so each can be designed against it.
2. **WeilConjectures WC.7 overlap and cycle.** WC.7's "Twenty-five points over F₂" theorem (`count_enriques_or_rational_genus_one`) is the same statement as 3.1. It takes its Enriques invariants from this roadmap's Layer 0, while Layer 0 takes cohomology from WC.7. I made 3.1 import WC.7's general constant-Num theorem. Suggestion: drop the Enriques-specific corollary from WC.7 so that WeilConjectures no longer depends on this roadmap. That is a change to the WeilConjectures package, outside this job.
3. **Open proof targets.** These are unchanged and honestly marked in the README:
   - fourteen-case rational-Jacobian completeness (5.1);
   - the three-configuration exclusion (5.7);
   - the narrowed reducibility theorem (1.26);
   - full proofs of the classical inputs that MMV22, ESB21 and DI21 quote.
4. The A0 surface-Picard extension (2.2, 8.2) must be assigned within AlgebraicModuliForArithmeticGeometry, as the design review recorded.

## Validation

- `lean-check …/Suggested.lean`: exit 0, 13 sorry warnings only.
- `python3 research/blueprint/intake.py check-files` on README.md, Suggested.lean, metadata.toml, review.json and this report: 0 problems.
- README: 118 anchors, 115 distinct local links, none broken.
- The packet was not edited.
