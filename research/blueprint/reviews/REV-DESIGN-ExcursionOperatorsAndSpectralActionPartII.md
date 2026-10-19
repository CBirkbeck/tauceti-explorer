# Independent review: Excursion operators and the spectral action, Part II

**Verdict: accepted as a finished target-level planning pass.** Reviewer: Codex, session `codex-od7Jbq`, 2026-10-19. Job `REV-DESIGN-ExcursionOperatorsAndSpectralActionPartII`, issue #4517. The reviewed design was written by session `codex-s6reGX`; this reviewer did not contribute to it.

The packet correctly distinguishes a planned proof from closed prerequisites and implementation. All seven layers are planned, none is closed, and the three retained gaps are explicit supplier/source obligations. Each target is justified conditional on those obligations. The main stability theorem and inner-form comparison do not depend on the unresolved regular-packet atomicity input.

## Inventory and verdicts

| Item | Result |
| --- | --- |
| Nodes | 28: 21 corrected, 7 verified, 0 added, 0 unverifiable |
| Kinds | 4 definitions, 5 constructions, 2 lemmas, 15 theorems, 1 comparison, 1 application |
| Definition/construction API | 45 items across all 9 relevant nodes |
| Discriminating tests | 36; every definition/construction has at least 3 |
| Planets | 23 key objects and named results; no locator-only names |
| Baseline | 16 declarations independently confirmed; 0 removed or replaced |
| Requests | 7 remain; 3 satisfied requests removed in favor of exact supplier nodes |
| Gaps | G1, G2, G3 retained with their exact scope |
| Source issues | 3 independently confirmed; E3 newly included in this packet |
| Suggested Lean | Unchanged, 128 lines; elaborates with 13 expected `sorry` warnings and no other warning or error |

The packet's `review.checked` gives the individual mathematical reason, source locators and correction for every node. Corrected verdicts include dependency-address refinements; they do not mean that 21 theorem statements were false. No target statement, hypothesis, API item or test needed weakening or removal.

## Corrections applied

1. **Correct BunG ownership and use existing nodes.** The original R8 requested admissibility, basic-class classification and existence of a dominant modification from BG0. The supplier packet places the relevant invariant theory in BG1. The corrected graph imports the existing G-isocrystal, J_b, basic-class, admissible-pair, integral fundamental-group, two-invariant classification and torus Kottwitz nodes. R8 now asks BG1 only for the additional compatibilities: existence of a dominant admissible mu for each basic class, the identity-class/dual-central-character equivalence, and agreement of the stable-conjugacy invariant with the integral torus coinvariant kernel. SC1, SC2 and SC5 now declare BG1 in the roadmap and reader. The kernel-inclusion proof explicitly separates this existence input from G2's trace formula.
2. **Distinguish the categorical center from its distribution model.** Current upstream SmoothRepresentations Layers 1 and 3 plan the Hecke-algebra corners and categorical Bernstein center. They do not explicitly supply the complete essentially compact invariant-distribution comparison, its faithful evaluation and the inversion pairing used here. R1 and the SC0 sketches now put that additional comparison in G1. The existing category and center are still imported, without a duplicate construction.
3. **Replace satisfied stage requests by exact supplier nodes.** Removed R5, R6 and R7. The actual HS1 operator, monoidality and adjunction nodes supply the normalized Hecke family; HS3's between-strata node identifies basic-source extensions with the appropriate shriek functor; its admissibility/duality node supplies the stated star-extension finite-length theorem and comparison. ET.3/local-transfer-existence supplies characteristic-zero transfer at every residue characteristic. Exact conjugacy, rational-class, orbital-integral, stable-sum, matching-function and Kottwitz-sign nodes now accompany the remaining refinement requests. R3 and R4 ask only for the further uniform-finiteness, inversion and transfer compatibilities. Request-consumer inventories match the direct stage edges.
4. **Name the normalization input explicitly.** Replaced the undefined shorthand NORM in the stability induction, inner-form kernel argument and Levi square by the ES7 normalized-induction dictionary. Its source statement includes the half-modulus/cyclotomic cancellation; the ordinary dual Levi restriction is the convention used here.
5. **Correct the description of HKW Appendix C.** Theorem C.1.1, p. 75, characterizes nonelliptic finite-length virtual representations as rational combinations of proper-parabolic induced representations. The source inventory called it a finiteness theorem. Both inventories and the reader now identify the actual statement. The induced-span input remains part of G1; the theorem was not mistaken for finite-length preservation.
6. **Independently review source issues.** E1 and E2 now carry this review's own confirmed verdicts. Added E3 for the rho convention following HKW Equation (3.3.3), p. 18, independently checked against Appendix A.2, p. 72. This finding was already known as PAPER-HANSEN-KALETHA-WEINSTEIN-22/E5, but absent from this packet. All three are harmless misprints after the stated corrections; the packet's mathematical formulas already use the intended conventions.

All corrections are synchronized in the reader. The suggested file states the algebraic milestones on actual baseline carriers, so the supplier-address corrections require no Lean edit.

## Sources and mathematical checks

The five public PDFs were retrieved in their recorded versions. Their SHA-256 hashes matched the packet records. All results below are paraphrases, with the source hypotheses retained. No source passage or excerpt was added.

| Source | Reading and check |
| --- | --- |
| [Hansen, published 2026 article](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/AB00A1DF177B6DAB542489D58DA1C8AD/S2050508626100286a.pdf/excursion-operators-and-the-stable-bernstein-center.pdf) | Read the whole article, pp. 1–14. Checked the stable and very stable definitions; Lemmas 2.1–2.4; Propositions 2.5 and 2.7; Lemma 2.6; proofs of Theorems 1.1 and 1.4; and Corollaries 1.2–1.3. |
| [Fu, arXiv:2501.00652v1](https://arxiv.org/pdf/2501.00652v1) | §§3.1–3.3, pp. 18–21, and §§4.2–4.3, pp. 24–27: dual-root character product, finite coinvariant kernel, finite Fourier estimate and supported-weight existence in Lemma 4.2.7. The restrictive assumptions in the introduction are not silently imposed on the later general lemmas. |
| [Hansen–Kaletha–Weinstein, published 2022 article](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/33A94496879999F3D63C2997F2D50D9D/S2050508622000075a.pdf/div-class-title-on-the-kottwitz-conjecture-for-local-shtuka-spaces-div.pdf) | Lemma 3.1.1, pp. 12–13; Definition 3.2.2 and Remark 3.2.5, pp. 14–15; Equation (3.3.3), p. 18; Proposition 6.4.5 and Definition 6.4.6, pp. 61–62; Theorem 6.5.2, pp. 65–66; Lemma A.2.1, p. 72; Theorem C.1.1, p. 75. No refined-LLC hypothesis of Theorem 6.5.1 is imported into the unconditional character formula. |
| [Fargues–Scholze, arXiv:2102.13459v4](https://arxiv.org/pdf/2102.13459v4) | §I.9, pp. 34–35: the center-order condition and the distinction between Conjecture I.9.5 and the separate quasi-split stable-center expectation following it. Neither injectivity nor equality with the whole stable center is a theorem of this plan. |
| [Fintzen–Kaletha–Spice, arXiv:2106.09120v2](https://arxiv.org/pdf/2106.09120v2) | §4.3, especially p. 20, and §4.4, pp. 24–26: the exponential-convergence condition and the actual stability/endoscopy conclusion of Theorem 4.4.4. The published 2023 full text was not obtained. G3 remains an exact-hypothesis source check, rather than a claim that Hansen's corollary is false. |

The stability proof uses the normalized Hecke scalar modulo induced characters, the compact stable-representative argument and a discriminant-weighted estimate on torus supports. The estimate is quantitative enough for integration against a cuspidal test function. In the final induction, Xi=z·Theta is known tempered before stability is proved; its stable projection is then subtracted. This avoids assuming the desired conclusion.

Atomicity concerns all nonzero stable coefficient vectors supported in the given finite support. The subtraction argument therefore forces equal central eigenvalues even for a vector whose nonzero coefficients differ. Equality of excursion characters is converted into equality of semisimple parameter classes only through the existing ES5/LP2 reconstruction nodes.

For extended pure inner forms, the direction of kernel inclusion gives a map from the quasi-split FS image to the inner-form FS image. Surjectivity is onto that image, not the whole classical center. The transfer argument compares reverse Hecke modulo induced characters and does not assume that reverse Hecke preserves the elliptic summand. Test-function matching follows by stable-character duality and the unstable-function criterion, including irrelevant-class vanishing.

The sign correction E3 also has a concrete check: for split GL_2 and its quaternionic basic inner form with mu=(1,0), the full positive-root sum pairs oddly with mu, giving sign product -1. Interpreting rho itself as the full sum would double the exponent and incorrectly give +1.

## Baseline, reuse and scope

All 16 cited declaration statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The `Finsupp` declaration-kind label was corrected from `def` to `structure` after checking its declaration at line 88 of the pinned module. No citation was removed or replaced:

- Finite supports and subobjects: `Finsupp`, `Finsupp.mem_support_iff`, `Submodule`, `Subalgebra`.
- Finite averages and Fourier algebra: `Finset.expect`, `Fintype.expect_eq_sum_div_card`, `AddChar.complexBasis`, `AddChar.wInner_cWeight_eq_boole`.
- Image algebras: `AlgHom.range`, `AlgHom.rangeRestrict`, `AlgHom.rangeRestrict_surjective`, `Ideal.quotientKerEquivRange`.
- Integration: `MeasureTheory.norm_integral_le_of_norm_le_const`.
- Grothendieck groups: `TauCeti.ExactK0`, `TauCeti.ExactK0.lift`, `TauCeti.AbelianK0.homologyEulerChar`.

These provide generic algebra and analysis with the stated hypotheses. They do not provide the missing smooth-character category, character independence, distribution comparison or local-shtuka trace theorem. In particular, finite expectation's empty value is zero, the integral bound requires finite measure, and the ExactK0 lift supplies an algebraic universal property. None is used to assert a stronger representation-theoretic result.

Read the reviewed base ES0/ES1/ES7 library coverage and the exact supplier statements. Checked current upstream ReductiveGroups, RootSystems, LieHighestWeight and SmoothRepresentations, as well as the nine post-snapshot roadmaps and current Tau Ceti. The ordinary center/category, normalized induction, root datum and Weyl theory are imported. Current `TauCeti.simpleClassBasis` concerns finitely generated modules over an Artinian ring and does not supply irreducible-character independence for the smooth p-adic category. No existing target is planned a second time.

## Remaining orchestration work

Acceptance completes this review; the following are retained follow-up obligations of the plan, not unfinished review work.

- Give the accepted `SmoothRepresentationsCharactersPartII` route real stage/node addresses for G1, including the distribution comparison now made explicit. The existing unitary/Fell-topology Part II is a different continuation.
- Give `HeckeStacksAndLocalShtukasKottwitzPartII` real addresses for G2. Build on the exact HS3 basic-stratum and star/duality statements, and export the precise all-dominant-mu shriek character formula in both directions, with dual representations, shifts, inversion and Kottwitz signs tracked.
- Resolve G3 with the published FKS version or another primary source proving arbitrary-coefficient atomicity under exactly Hansen's tame and p-Weyl hypotheses. Merely citing packet stability under additional assumptions does not discharge it.
- Reconcile the earlier proposed stable-center continuation name with this Part II, as already recorded in the packet's restructuring notes; do not create a duplicate roadmap.

## Validation

`check_blueprint.py` reports 0 errors and 0 warnings. The JSON and packet/reader synchronization checks pass, as do `git diff --check`, the intake file check and the suggested-file admitted-data check. Every review verdict has a matching node, all request-consumer lists match their direct edges, and all 28 node specifications, APIs, tests and prerequisite lists occur in the reader. `lean-check` completed successfully with only the 13 expected `sorry` warnings; no Lean process remains running. The unchanged suggested file is below the 5,000-line limit. No private path, source excerpt or implementation claim was added.
