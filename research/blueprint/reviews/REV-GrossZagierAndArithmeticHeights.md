# REV-GrossZagierAndArithmeticHeights — independent review of the consolidated GZ.0–GZ.9 blueprint

**Verdict: accepted.** This is the review of issue [#9387](https://github.com/CBirkbeck/tauceti-explorer/issues/9387) by Claude (Opus), session `claude-EGtFwd`, dated 2026-10-14. The input is BP-GrossZagierAndArithmeticHeights (issue #9416, [PR #9580](https://github.com/CBirkbeck/tauceti-explorer/pull/9580), Codex `codex-fpPjYu`). That job consolidated the accepted GZ.0 and GZ.8 part packets into one primary packet and a full reader. This session did none of that work, and none of the work on the part packets.

The packet, the reader and (unchanged) the suggested file were checked; corrections were made in place. Every change is listed below and in the packet's `review.checked`. No mathematics is claimed formalised; every node keeps `implementationStatus: unchecked`.

## What was under review

The primary packet owns 13 targets and imports 264 more from the two part packets by their ids. It also applies 30 field corrections and 15 reference substitutions to the imported targets and retires 6 of them, for 277 resolved targets. Of the 13 owned targets, 4 are new:

- the pinned/current height comparison;
- rational Galois descent;
- the explicit CST local constants;
- the Petersson–Whittaker factorization.

The other 9 are the per-layer milestones, copied from the accepted parts with their review metadata removed. The new mathematics is therefore the 4 new targets, the 30 corrections, the supplier routing (98 requests, 33 supplier dispositions, 28 restructure proposals, 16 gaps) and the reader.

## Method and counts

- **Resolution.** I resolved the full plan exactly as `importPolicy` prescribes. Both part SHA-256 values match the committed files. All 277 targets resolve; every prerequisite is an internal target, a baseline declaration, another blueprint's node, or an atlas stage; and the internal graph is acyclic: 591 distinct edges, which the consolidation counted as 593 because two duplicated references were counted twice. I rechecked this after my edits.
- **The 9 milestone copies.** These were diffed against the accepted part nodes: eight differ only by removed metadata, and the GZ.1 Poincaré target differs only by the substituted height reference.
- **The 30 corrections.** Each was compared with the original field.
  - Eighteen re-route prerequisites (MP.7→MP.5, R14.5→R12.5, the new descent, CST-constant and Petersson targets, and the P4 imports). Three of these also rewrite proof steps or tests, and two also re-word the statement.
  - The other twelve re-word imported statements or hypotheses.
  - Every re-wording was checked to be mathematically equivalent.
- **Baseline.** All 83 declarations exist at Tau Ceti f790474 / Mathlib 082e2d3, and each cited module matches the declaration index. I read the statements cited by owned targets and corrections in the pinned source:
  - the elliptic height, pairing and regulator declarations;
  - `Matrix.det_smul`, `NumberField.totalWeight_eq_finrank` and `weakApproximation_denseRange`;
  - the Petersson declarations, `AbstractMeasure.*` and `PowerSeries.eval₂`.

  I also read the current Tau Ceti a91d3aaf height definitions.
- **Sources read in this review** (scratch copies only; nothing deposited):
  - CST, arXiv:1408.1733v2 (SHA-256 `8d9085…ac43`, the packet's hash): Proposition 2.1 and (2.2), (2.1), (2.3)–(2.5), Lemma 3.5, Propositions 3.11–3.12, Lemmas 3.13–3.14. Every displayed fraction was checked on rendered pages 14, 18, 23, 26–27 and 30–31.
  - The YZZ author erratum of 28 June 2026, in full: 64 items and §2. The Berkeley and PKU copies are identical.
  - The arXiv abstract page of CST, for its versions.
- **Unavailable sources.**
  - The 2011 YZZ draft URL now returns 404.
  - The 2013 book is not cleared.
  - The published CST version (Algebra Number Theory 8, 2014) is not openly served.

  Locators that rest only on these remain on the accepted part reviews, as gaps 0, 6 and 8 already state.
- **Lean.** `lean-check` of the 195-line suggested file at the pins gives 30 warnings for admitted proofs and nothing else. I rechecked every statement in the file by hand:
  - character orthogonality for `heegnerFinite`;
  - the inverse of 0 in ZMod 3 for the averaging example;
  - Γ_ℂ(1)=1/π in `completed_derivative_at_central_zero`;
  - the Euler-factor values 1 and 2 and the (√p−1)² bound.
- **Checker.** `check_blueprint.py` with the pinned declaration index: 0 errors, 0 warnings before and after the corrections.

## Verdicts on the 13 owned targets

- **Pinned and current elliptic height conventions (new): verified.**
  - At f790474 the canonical height is the limit of h(2ⁿP)/(2·4ⁿ) and the pairing is the halved polar form (`QuadraticMap.associated'`).
  - At a91d3aaf the denominator is 4ⁿ and the pairing is the same halved polar form, so current names already give h_x, B_x and Reg_x.
  - The Checks are right: a²+2b² has half-polar Gram determinant 2 and full-polar determinant 8, and quadratic base change scales a rank-two regulator by 4.
- **Rational Galois descent (new): verified.** (A(H)⊗ℚ)^G = A(K)⊗ℚ, with inverse the norm divided by [H:K]. The torsion-lift step and the M-linear scalar extension are correct, and so are the four Checks.
- **Explicit local toric constants (new): verified on the rendered pages.**
  - The five cases of Proposition 3.12, including the two L(1/2,π,χ) denominators and e(1−q^{−e}), match.
  - So do the δ_σ condition of Proposition 3.11, Lemma 3.5's γ = Vol(R×)/Vol(U₀(n)) = L(1,1_F)(1−e(R)q⁻¹), the three δ-exponents of Lemma 3.13, and C = 4^{k−1}π^{k+1}/Γ(k) of Lemma 3.14 (4π³ in weight two).
- **Petersson pairing as a product of Whittaker pairings (new): verified** against CST Proposition 2.1 and (2.2).
- **The nine milestone copies: verified.**
  - Base-change signs and measures: re-read against erratum items 4, 5, 10, 13 and 15 and the footnote to item 5.
  - Saito–Tunnell criterion ε_BC = χ_v(−1)ε(B_v): erratum item 5; Tunnell–Saito after χ = λ⁻¹.
  - Waldspurger constant: CST (2.1) gives ζ_F(2)L(1/2)/(2L(1,π,ad)) for periods of total volume 2L(1,η), and dividing by 4L(1,η)² gives the stated /8.
  - YZZ constant: CST (2.4) and its conversion dictionary on p.18.
  - The GZ.1, GZ.2, GZ.3, GZ.6 and GZ.7 milestones are unchanged accepted text whose 2011-draft locators could not be reopened; this is recorded in each `checked` note.

## Corrections made in this review

1. **Modular-forms supplier routing.** This is the main finding.
   - **The fault.** The accepted GZ.0 part sent the Hecke duality, the trace adjunction, new/old orthogonality and prime-to-level detection to ModularCurvesPartII R14.5, which plans modular quotients. The consolidation copied that request text, unchanged, onto R12.5. It changed the prerequisites of only two of the six targets.
   - **Why R12.5 is wrong.** R12.5's own text leaves analytic newform theory to ModularForms. Four targets still cited R14.5, but no R14.5 request remained, and the R12.5 request named two consumers that did not cite R12.5.
   - **Two pinned declarations.** The pinned Tau Ceti already proves the Atkin–Lehner Main Lemma (`TauCeti.mem_cuspFormsOld_of_forall_coprime_qExpansion_coeff_eq_zero`, Γ₁(N) per character) and the newness criterion (`TauCeti.mem_cuspFormsNew_iff`). I read both at f790474 and added them as baseline declarations.
   - **New routing:**
     - `classical-height-series-cuspidality`: RP.0, R14.2, R12.5 (only the Hecke-equivariant identification of cusp forms with differentials) and ModularForms Layer 2 (the a₁ duality).
     - `classical-prime-to-level-detection`: the two pinned declarations and the AS.4 projection, with its outline rewritten to that argument.
     - `classical-trace-adjunction` and `classical-mobius-level-decomposition`: ModularForms Layer 3.
     - `classical-boundary-eisenstein-orthogonality`: AS.4, whose existing request already names the boundary Eisenstein families.
     - `classical-hecke-kernel-action`: R14.2 and ModularForms Layer 2.
     - `coefficient-identity`: the pinned Main Lemma added to its prerequisites.
   - **Requests.**
     - Request 45 (R12.5) is narrowed to what R12.5 states.
     - Request 91 now names Layer 3, the layer its consumer cites, and states that the Main Lemma it used to request is a pinned declaration.
     - Request 99 (ModularForms Layer 2: a₁(T_nf)=a_n(f), the perfect Hecke duality and the determinant-m description of T_m) is new.
     - Requests 10, 13 and 39 gain the rerouted consumers.
   - **Supplier audit.** In R1-partial-4, R14.5 is removed and the split is stated.
2. **Request bookkeeping for the new targets.**
   - The descent target and `chi-isotypic-mordell-weil-space` are added to the RP.1 request.
   - The Petersson factorization is added to the AF.3 request.
   - The explicit constants, the Petersson factorization and the Waldspurger milestone are added to the main AL.3 request.
   - New Request 100 asks A2 for the Galois action on A(H) commuting with End_K(A) and A(H)^G = A(K).
3. **`boundary-cusp-correction`.** The existing R12.5 request (differentials and q-expansions at the cusp) names it, but it did not cite R12.5. R12.5 is added.
4. **`elliptic-poincare-comparison` and `elliptic-curve-heegner-height-formula`.** In each, two substituted height references collapsed into a duplicate prerequisite, which is now listed once.
5. **Two broken sentences** in the consolidation's re-wordings are repaired: ", Here" in `classical-orbit-kernel-evaluation` and ", In" in `classical-logarithmic-prime-decomposition`.
6. **Supplier audit R1-partial-7.** It named a non-existent roadmap, TropicalAndBerkovichGeometry, and no consumers. It now names TropicalAndBerkovichArithmetic TB.2/TB.3/TB.6 and their two consumers.
7. **Restructure proposal on ordinary CM intersections.** Its roadmaps list lacked the proposed owner ComplexMultiplicationAndExplicitReciprocity, which is now added.
8. **Reader.**
   - Every change above is mirrored in the reader: node dependency lines, the prime-to-level outline, the request and supplier-audit sections, and the two new requests.
   - A section on the new source issue is added.
   - A doubled full stop in 13 supplier-audit entries is removed.
   - The introduction no longer says the new material awaits review.

   The 13 owned targets' statements, hypotheses, outlines, APIs, Checks and acceptance items appear verbatim in the reader. Imported statements differ from it only by markdown escapes.

After these corrections, 34 stage prerequisites still have a request for the supplier stage but do not list that particular consumer, down from 47. All are inherited from the parts and every supplier is requested, so this is bookkeeping, not a closure gap.

## Source issue added

**GrossZagierAndArithmeticHeights/E101 (CST, misprint, confirmed).** On p.18 of arXiv v2, Proposition 2.5 defines γ_v as Vol(U₀(N)_v)/Vol(U_v). That is the reciprocal of the γ_v of Proposition 2.4 and of the γ defined before Lemma 3.5.

The printed version must be a slip:

- formula (2.5) is derived in the same way as (2.3), so it needs Vol(U_v)/Vol(U₀(N)_v);
- the proof of Theorem 1.5 applies (2.5) with Lemma 3.13, whose γ is Lemma 3.5's.

The explicit-constant target already uses Lemma 3.5's γ, so the issue affects nothing here. arXiv v2 is the latest version. The published text could not be compared, and the issue's `searched` list says so. The packet's empty `sourceIssues` now holds this entry, with `sourceVersions` for the two texts read.

## Red-team findings handed to the blueprint

- **RT-AREA-automorphic-1/19.** GZ.5 imports MP.6's norm-form theta integrals, see-saw and anisotropic Siegel–Weil exports. The node records Weil's range, r = 0 or m − r > n + 1: the norm form of a quadratic field is (2,0) and division trace-zero data are (3,0), while the split trace-zero case (3,1) lies outside it. That case is gap 7. Correct.
- **RT-AREA-iwasawa-1/3.** All GZ.1 targets import RP.0 (heights, Northcott) and RP.1 (Mordell–Weil). GZ.1 keeps only the Poincaré, coefficient and character pairings. Correct.
- **RT-AREA-iwasawa-1/11.** GZ.9 imports L3h for the square-root distribution and GH.4 `bdp-special-value-formula` at r = j = 0. No GZ.9 target cites ModularSymbolsPadicLFunctions L2, and restructure entry 3 proposes dropping the edge. Correct.
- **RT-AREA-iwasawa-1/12.** The pinned-height target states the code's convention exactly; see the verdict above. The upstream note on the EllipticCurves README (lines 1178–1182, x-height convention) was checked against TauCetiRoadmap 0d144d0. Correct.
- **RT-AREA-iwasawa-1/17.** GZ.3 keeps `manin-integrality-and-p-unit`, `manin-isogeny-twist-transfer` and `manin-degree-divisibility`, with optimality and p∤2ND. Listing them as inputs is the consumers' job. Correct.
- **RT-AREA-algebraicgeometry/26.** `arithmetic-intersection-gluing`, `admissible-arithmetic-extension` and `graph-admissible-measure` import StableReduction Layers 1, 4, 5 and 7. GZ.2 keeps the admissible metrics, measures, gluing and Faltings–Hriljac. Correct.

## Questions for the orchestrator

1. **Promotion of a consolidated packet.** `scripts/blueprints.py` and `promote.py` do not read `imports`, `importPolicy`, `referenceSubstitutions` or `targetCorrections`. A promoted copy therefore shows only the 13 owned targets. The GZ.8 part is already promoted, and the primary's `GZ.8/general-quaternionic-gross-zagier-identity` shares its id: the later packet wins in `merge_blueprints`. The corrected imported targets live only in this packet and its reader. Either the build learns to resolve imports, or the package worker must work from this reader.
2. **Package.** The existing package (`research/blueprint/packages/GrossZagierAndArithmeticHeights`, review needs_changes) should adopt the corrected modular-forms routing in correction 1. It should also cite the two pinned Tau Ceti declarations rather than ModularCurvesPartII R12.5 or R14.5.
3. **Theta series ownership.** TauCetiRoadmap IntegralLattices (current main) assigns positive-definite lattice theta series in even rank to a Theta Series roadmap that is not yet on main. The weight-one ideal-class theta series requested from MetaplecticAutomorphicForms MP.5 (Request 44) falls in that scope. When that roadmap lands, the request should be re-pointed to it.
4. **Main Lemma elsewhere.** Other atlas packets that request the Atkin–Lehner Main Lemma from ModularForms Layer 4 can cite `TauCeti.mem_cuspFormsOld_of_forall_coprime_qExpansion_coeff_eq_zero`, which exists at the pin.
5. **Sources.** The 2011 YZZ author draft is no longer at its recorded URL. A cleared copy of the 2013 book would close gaps 0, 6 and 8. Someone with access to Algebra Number Theory 8 (2014) could check E101 against the published Proposition 2.5.
6. **Unapplied proposals.** The 28 restructure proposals and 33 supplier dispositions remain unapplied owner and scope proposals. They are honest and precise, but they need maintainer decisions before any package claims those interfaces.
