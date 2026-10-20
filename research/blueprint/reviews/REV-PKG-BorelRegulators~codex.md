# Independent package review: BorelRegulators (after the second fix round)

Job: `REV-PKG-BorelRegulators~codex`, issue #11234. Reviewer: Claude (Opus 5.5),
session `claude-IjmpHx`. Date: 2026-10-20. Verdict: **needs_changes**.

I did not write or fix this package. Its history is: package #10996
(codex-hHK7dv), review #11039 (codex-Okfw71), fix checkpoint #11085
(codex-PFnBy7), and fix #11226 (claude-IRLtnR). I read the whole README and
Suggested.lean, the 56-node packet, the previous review
`REV-PKG-BorelRegulators~adv.md`, both fix handoffs, the package handoff,
PROTOCOL §§5, 13 and 20, UPSTREAM_GUIDE and PACKAGE_REVIEW. The fix round had
set `review.json` to `accepted` under the name `fix-FIX-PKG-BorelRegulators~adv2`.
The intake bot rejected that twice, because a fix cannot name itself the
reviewer. This report replaces it.

The three findings of the previous review are addressed in substance. Weil's
proof is decomposed, Bloch's pairing is removed with a reason, and the
Bloch–Wigner coefficient is evaluated. I confirmed the new mathematics where I
could recompute it (tables below). One new defect remains, and only the
maintainer can resolve it.

## Blocking finding (needs a maintainer decision)

**F1. τ(𝔾_m)=1 in README §6.2 has no admissible supplier.** The proof of
`normOne_tamagawaNumber` uses τ(H)=τ(GL₁(D))/τ(𝔾_m), with
τ(GL₁(D))=1 from the zeta integral of D. The bullet
`tamagawaNumber_multiplicativeGroup` obtains τ(𝔾_m)=1 by converting the
volume κ of the norm-one idele class group, which it says
AutomorphicLFunctionsAndLocalFactors AL.1 supplies. Three facts make this
unusable:

1. The current AL roadmap (TauCetiRoadmap PR #924, head `d1996dc`) no longer
   contains κ. Its AL.1 is now "Local eigendistributions and Hecke L-functions",
   and its adelic Poisson summation is consumed from
   ArithmeticGaloisRepresentations §2.7. Only the explorer copy of the AL
   package still has the `idele-class-volume` item.
2. PACKAGE_REVIEW.md, "Tate's thesis (maintainer rule, 2026-10-19)", forbids any
   package from stating the norm-one idele-class volume. τ(𝔾_m)=1 in the
   Tamagawa normalisation is that volume: it is equivalent to κ=ρ_F.
3. No other supplier has it. AdelicAlgebraicGroups (PR #792, head `58ecae2`)
   defines τ(G) and computes it only for the trivial group. GlobalNumberFields
   (TauCetiRoadmap main) proves compactness of the norm-one idele class group
   but not its volume. The Tau Ceti library at `a91d3aaf` has no idele volume
   either.

The step cannot be routed around. Since τ(H)·τ(𝔾_m)=τ(GL₁(D)), rationality
of τ(H), which Borel's Proposition 2.4 needs, is equivalent to rationality
of τ(𝔾_m). Mars, exposé 351, p.84, likewise applies Weil's theorem "once to k".
The step lies on the proof path of §6.3, §7.1 and the headline §7.2. The
quaternion case in GeometryOfNumbersAndQuadraticArithmetic §3.3
(`quaternionAdjointTamagawa`, PR #851) uses τ(G_m) in the same way.

Options for the maintainer: name an owner for τ(𝔾_m)=1, for example
AdelicAlgebraicGroups §5.1 next to its GL₁ examples, proved from Mathlib's
fundamental-cone volume, which is the lattice-point count behind
`NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`; or allow this roadmap to
state it with that geometry-of-numbers proof. Once one is chosen, the bullet
becomes a one-line supplier contract. I left the README text of this bullet
unchanged so that the decision stays visible.

## Fixes applied in this review

| Area | Change |
|---|---|
| Undefined names | 18 names were used in later subsections but never introduced. Each is now named where its statement is, using the plan's declaration name: `arithmeticRestriction`, `arithmeticInvariantFormMap`, `compactDual_stableExterior`, `invariantForms_bijective_of_squareIntegrable`, `arithmeticComparison_stableRange`, `arithmeticCohomology_stableExterior`, `arithmeticK_rationalHurewicz`, `divisionOrder_borelRank`, `targetCoordinates`, `regulatorMatrix`, `zetaLeading_functionalEquation`, `arithmeticCompactFactorComparison`, `exists_archimedeanSplitDivision`, `normOne_archimedeanVolume`, `restrictionScalarsForm`, `borel_positiveZetaPeriod`, `borelRegulator_zetaProportional`, `borelClass_eq_two_beilinsonClass`. `borelConstants_ge_rank` now points to §3.6's existing `arithmeticBound_rank`. Phrases that pointed to nothing ("the stable Whitehead theorem of §3.9", "the bordification and compact-quotient input of this subsection", "regulator-lattice" and others) now cite the named API items. |
| Suppliers, §1.1 | The README said AdelicAlgebraicGroups Layer 1 supplies the reduced norm, GL_n(D) and SL_n(D). It does not. The reduced norm and its idelic extension are ClassicalArithmeticCompletion §7.10, on IntegralHeckeAndGaloisDeterminants §0.6; SL_n(D)=SL₁(M_n(D)) is ClassicalArithmeticCompletion §7.26; SL₁(D) is AdelicAlgebraicGroups §3.4; restriction of scalars is AdelicAlgebraicGroups §1.4. ClassicalArithmeticCompletion is on TauCetiRoadmap main. |
| Suppliers, §6.2 | The quaternion case of Hasse–Schilling–Maass is AdelicAlgebraicGroups §4.6 (`quaternion-norm-images`, PRR Theorem 1.34), not "GN.2". There is now one clause on the overlap with GeometryOfNumbersAndQuadraticArithmetic §3.3 for quaternion τ(H)=1. Poisson summation is cited as AL.0 on 𝔸_F^n, with its scalar case in ArithmeticGaloisRepresentations §2.7, matching the current AL. |
| Locators | §2.2 cited "Burgos §§5.4–5.6 and Theorem 6.18, pp.39–46,55–56", but Burgos has no §5.6 and no Theorem 6.18. It now cites §5.1 (pp.35–36), §5.5 (pp.48–49), Proposition 6.8 and Theorem 6.9 (van Est, pp.53–54). §3.1 cited "§§5.5–5.7, pp.40–48", but there is no §5.7. It now cites §5.5, plus §6.3 with Example 6.10 (compact twin; GL_n(ℂ) has twin U_n), pp.54–55. In §8.2, Burgos Lemma 10.2 is on p.90, not pp.91–92. Bare "Borel 3.6", "Borel 8.2" and similar now say which Borel paper (1974 or 1977). |
| Mathematics, §2.4 | The text said a block exchange "has determinant −1 only when the division degree is odd". The exchange of D-ranks m and m′ has reduced norm (−1)^{mm′e}, and when that is −1, e is odd and a −1 in an unused D-coordinate compensates. Corrected. |
| §3.5 Check | "0 in degrees one and two, and 1 in degree three" meant the field degree [F:ℚ]. Reworded. |
| Size | The README was 209,028 bytes, over the issue's 200 KB limit. It is now 196,110 bytes and nothing was dropped. Each source was linked in full 1–19 times; the body now cites by author and year (Borel 1974, Burgos, Quillen, …) with every theorem, section and page kept, and References carries the full links under those labels. Trailing paragraphs that only repeated a subsection's own Checks were removed (in §§1.1, 1.2, 1.3, 2.2, 2.4, 3.1, 3.4–3.7, 4.4, 4.6, 4.12, 4.13, 5.3, 5.5, 6.4, 6.5 and 8.7). Every Check, API item, hypothesis and worked example remains. The reference to Church–Farb–Putman was cited nowhere and was removed. |
| Suggested.lean | `traceCocycle_three` is now proved: it enumerates the six permutations of Fin 3 by `decide`, then uses trace cyclicity. `#print axioms` (checked in scratch, not committed) shows propext, Classical.choice and Quot.sound only. The two trace examples, the Pauli values −2i/−16i and the repeated-argument vanishing, therefore no longer rest on an admitted lemma. Nothing else changed. |

## Fidelity to the plan

Every packet node has a README subsection, with two exceptions.
`R.6/local-sl-volume` is supplied by AdelicAlgebraicGroups §2.4 and is stated
in the supplier contracts. `R.6/bloch-borel-interface` was removed by the
second fix round, and I accept the removal. The packet itself leaves Bloch's
side unspecified ("its definitions and locators are not recorded in this
plan"). Nothing consumes the node. Its only source, Bloch's CRM Monograph 11,
is neither free nor cleared (`~/atlas-library` INDEX). An item that cannot be
stated unambiguously is not an upstream target. The local-measure change
identity of §6.6 covers any later comparison.

Two subsections now say more than the packet. §6.2 decomposes Weil's proof,
which the packet left as a gap. §8.5 gives the exact coefficient, where the
packet stated only proportionality. Both were required by the previous review.
A packet maintenance job should close the gaps "Weil's computation…" and "The
Bloch–Wigner normalisation λ_BW", retire `R.6/bloch-borel-interface`, and add
the new §6.2 targets.

## Sources checked

I downloaded the public sources to scratch (not committed) and read them by
page; I read Platonov–Rapinchuk–Rapinchuk in the cleared library. Numdam page
offsets were fixed from the running heads.

| Source | Locators read | Result |
|---|---|---|
| Borel 1974 | §0.1 p.237; 1.3 p.238; 2.2–2.5 pp.239–240; 3.1–3.7 pp.241–246; 4.1, 5.1–5.7, 6.1, 7.1–7.4 pp.246–258; Theorem 7.5 and 7.7 p.259; 8.2 p.260; 9.1–9.5 pp.261–262; 10.2–10.3 p.263; 10.6 p.265; Theorem 11.1 p.266; 11.5 p.268; 12.1 p.270; Proposition 12.2 p.271 | all resolve |
| Borel 1977 | 1.4–1.5 p.616; 1.6, 2.1–2.2 pp.617–618; 2.3–2.4 pp.618–619; 3.3–3.5 pp.619–622; 5.1–5.2 pp.625–627; 5.4–5.5 p.628; 6.1–6.2 p.631; 6.3–6.4 pp.632–633 | resolve (the formulas are images in the scan and were not re-read) |
| Burgos | Definitions 9.19, 9.24; Remark 9.20 with (9.4)/(9.5); Propositions 9.21–9.22, 9.25–9.26; Theorem 9.12; Corollaries 9.8, 9.17; Proposition 9.15; Theorems 8.12, 8.15, 10.9; Definition 10.8; Lemma 10.10; Proposition 10.11; Theorem 4.24 and Remark 4.25; §5.1 | resolve, except the three corrected above. 9.25 is Φ(x̄ᵗ+x), and 9.26 is 2π_{p−1}Φ, as the README says |
| Weibel VI | Definition 5.1, Theorem 5.2 p.23; Corollary 5.3, Lemma 5.4 p.24; Lemma 5.6 pp.25–26 ([x]=(0,∞,1,x) and the five-term relation); Theorem 5.7 p.26; Lemmas 5.10–5.11, Proposition 5.12, Remark 5.12.1 p.29 | resolve |
| Weibel IV | Theorems 1.17–1.18 p.12; 1.18.1 pp.12–13; Proposition 5.3, Definition 5.4 pp.48–49 | resolve |
| Goncharov | (11) and Lobachevsky's formula p.7; Lemma 5.2 pp.38–39; Corollary 5.5 p.41; (61) p.43; (64) and Theorem 5.7 p.45; Corollary 5.10 and Theorem 5.11 pp.48–49 | resolve |
| Mars | Lemme p.82, proof p.83; §4 pp.83–84 (SL(m,D), stabiliser SL(m−1,D)⋉U, Weil's theorem applied to k and to D) | resolve |
| Godement I, II | exposé 171 Théorème 2 p.44; exposé 176 Théorème 2 p.114, footnote (3) p.115 | resolve |
| Putman–Studenmund | Theorem C p.4; Proposition 2.1 p.8 | resolve |
| Platonov–Rapinchuk–Rapinchuk (cleared copy) | §1.4.3 p.33 (local reduced norm surjective); Theorem 1.34 p.43 (Eichler) | resolve |

## Adversarial pass

| Statement | Instance computed | Outcome |
|---|---|---|
| §4.5 Φ₃ and its normalisation | c₂=−1/6, and the sign-weighted sum is 3Tr(X[Y,Z]); for Pauli, [σ₂,σ₃]=2iσ₁ gives Φ₃=−2i and the relative 8Φ₃=−16i | Holds; now a proved Lean theorem |
| §8.5 step 1, relative ≈ absolute | Exact rational rank test in the Chevalley–Eilenberg complex of sl₂(ℂ)_ℝ (20 triples, 15 pairs): A−(Ψ−Ψ̄)/8 is exact, while A, A−(Ψ−Ψ̄)/4, A+(Ψ−Ψ̄)/8 and A−(Ψ−Ψ̄)/2 are not | Burgos 9.25 and 9.26 agree, and only with the stated factor |
| §8.5 step 2, frame | Poincaré extension at j by quaternion arithmetic: σ₁↦2∂_x, σ₂↦−2∂_y, σ₃↦2∂_h, determinant −8 | Holds |
| §8.5 step 3, model of the symmetric space | Burgos Proposition 6.8 uses M=U\G with right translation and right-invariant forms; (−1)^q·evaluation, followed by inversion, gives the G/K evaluation | Consistent. The remaining sign risk is the homogeneous-cochain convention of van Est and Weibel's edge map, which the sources do not display |
| §8.5 step 4, orientation | (∞,0,1,z), Im z>0, approximated with the vertex at height H: det=−H·Im z<0 | Negatively oriented, as stated |
| §8.5 step 5, labelling | r(0,∞,1,x)=1/x; Weibel's [x]=(0,∞,1,x) | Holds, giving D(S_F x)/π |
| §8.5 Checks | x=2, y=3 gives [2]−[3]+[3/2]−[3/4]+[1/2]; r(2,0,1,3)=−3 and r(0,2,1,3)=−1/3; D(ζ₆)/π≈0.32307, 2D(ζ₆)/π≈0.64613, G≈0.91597 | All hold |
| §6.2 unramified factor | Coset volume #GL_e(𝔽_q)/q^{e²}=∏_{a=1}^e(1−q^{−a}), sublattice zeta ∏_{b=0}^{e−1}(1−q^{b−s})^{−1}, c_v(e)=∫Φ_v and c_v=1+O(q^{−2}) on [e,e+1]; the ξ=0 terms give τ(Φ̂(0)/(s−e)−Φ(0)/s) | Holds |
| §6.2 fibration | Eichler image and weak approximation make Nrd(D^×)\N¹→F^×\𝔸¹ bijective; the definite quaternion at {2,∞} gives indices 2 and 2 | Holds; F1 is the remaining defect |
| §5.4 powers of π | j odd: A(j)/a=π^{(1−j)r₁−(2j−1)r₂}; j even: π^{−jr₁−(2j−1)r₂}; both equal π^{d_j−dj}; ζ(−1)=−1/12 | Holds |
| §3.5–3.6 constants | c(Res SL₂)=[d/2]′; c(A_n)=[n/2]′; c(B_n)=n−2 from the coefficients k(2n−k)/2 of ρ and the highest root α₁+2α₂+…+2α_n | Holds |
| §1.5 dimension | d=r₁n(n+1)/2+r₂n²−1; at F=ℚ, n=2: d=2 and ν=1 | Holds |
| §2.4 block exchange | Nrd=(−1)^{mm′e} | Old text inexact; corrected |
| §4.4 Bott normalisation | s_j=(−1)^{j−1}j·c_j+(decomposables), so s(ch_j)=±s(c_j)/(j−1)!; ch₃ has indecomposable part c₃/2 | Holds |
| §6.4 witness | ℚ(i), basis (1,i), embeddings (id, conj): δ=−2i, δ²=−4 | Holds |
| Generality, Lean against README | `exists_archimedeanSplitDivision` is for every number field and every e≥2; `archimedeanTarget_finrank` for every number field with j≥2; `traceCocycle_scalar` and `_hermitian` for every finite size with j≥2 | Agree |

## Duplication and ownership

I compared against the current TauCetiRoadmap main and the open roadmap PRs
the package cites, and against Tau Ceti `a91d3aaf`. Besides F1 and the
supplier corrections above, I found no target here that an upstream roadmap
already owns. ClassifyingSpaces, GeneralizedCohomology, BordismFormalGroups,
EtaleCohomologyFoundations and DerivedModuleAlgebra (main) have no plus
construction, BGL⁺, higher algebraic K-groups, van Est, relative Lie
cohomology, compact duals or Bloch–Wigner material. The stage numbers cited for
AlgebraicTopology (2, 4, 5, 6) match main. ReductiveGroupsPartII's
`divisionBuilding` is the affine building of GL_m over a local division
algebra; the spherical building here is a different object in another
namespace. No target was moved into a higher-tier roadmap.

## Lean and checks

- `lean-check …/Suggested.lean`: exit 0, 11 `declaration uses sorry` warnings
  and nothing else (12 before, since `traceCocycle_three` is now proved). The
  file has 253 lines, real-bodied definitions only, and no admitted examples.
- `scripts/check_sorry_data.py`: exit 0.
- `scripts/check_blueprint.py research/blueprint/packets/BorelRegulators.json`:
  0 errors, 0 warnings. The packet was not edited.
- `research/blueprint/intake.py check-files` on README, Suggested.lean and
  metadata.toml: 0 problems. `git diff --check`: clean.
- `metadata.toml` is `topic = "math.KT"`, unchanged and fitting.
- No process language: grep for packet, review, job, checkpoint, gap,
  deferred and optional finds nothing in the README.

## Remaining work

1. F1 needs a maintainer decision (above). The next fix round then turns
   `tamagawaNumber_multiplicativeGroup` into a supplier contract or a proved
   target.
2. Packet maintenance, under Fidelity above.
3. Residual sign risk in §8.5, recorded honestly: the magnitude 1/π and every
   orientation step were recomputed. If a later reader finds that Burgos's
   continuous cochains use the opposite homogeneous convention, both
   coefficients change sign and nothing else changes.
4. Maintainer notes. EndoscopicTransferAndUnitaryTraceComparison ET.4 can
   import `specialLinearDivision_tamagawaNumber`. GeometryOfNumbers §3.3 needs
   τ(𝔾_m) too. Bloch's CRM Monograph 11 is uncleared and would be needed to
   reinstate the removed comparison.

No untrusted text asked for any action.
