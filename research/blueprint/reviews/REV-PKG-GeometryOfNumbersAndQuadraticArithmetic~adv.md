# Independent package review: GeometryOfNumbersAndQuadraticArithmetic~adv

Verdict: **needs_changes**, after the corrections in this PR. This is a completed independent fixing review of #8031, not a checkpoint or an implementation claim. Codex, session `codex-5xa0WS`, reviewed the package written by Claude Code (`cc-b6bfa5`). The packet is unchanged.

The review covers all 300 retained README targets (including three added mass targets), all 147 packet lemma nodes, conventions, definition APIs/tests and representative Lean signatures. The input packet contains 300 nodes and 54 recorded gaps; its `complete` status means the planning pass was completed, not that those gaps disappeared. The final package still has real prerequisite gaps listed below.

## Method and pins

Read WORKERS.md, PACKAGE_REVIEW.md, PROTOCOL.md, the expansion protocol and UPSTREAM_GUIDE.md. Read Completed IntegralLattices and RestrictedProducts as models, and inspected current IntegralLattices, QuadraticFormInvariants, GlobalQuadraticForms and the other potentially overlapping roadmap/library objects. Compared target carriers, operators and hypotheses, not only names. The current roadmap checkout was `de435a569d325b365a30fe83269ce34674eaea80`; the current Tau Ceti checkout was `a91d3aaf`. Lean elaboration used the shared pinned Mathlib `082e2d37` / Tau Ceti `f790474` build. No build or mutation was performed in either current upstream checkout.

Every target was checked for its mathematical domain, degenerate cases, quotient/denominator conditions, source and supplier direction. The table below records concrete witnesses and exclusions. A retained statement is not a claim that its proof has been formalized or that its prerequisite chain is closed. Tests and source checks are evidence for the review; the separate gap disposition governs acceptance.

## Corrections applied

- Fixed successive-minimum ordering for boxes and cross-polytopes, and the two-dimensional Dirichlet application's matrix and unequal bounds.
- Replaced set finiteness by finite length for general DVR torsion quotients. Kept cardinality formulas conditional on finite residue fields.
- Corrected the square-completion shear and its nonzero/integral denominator hypotheses; restricted the atomic-normalization algorithm to characteristic-zero DVRs and removed a valuation infinity-times-zero convention.
- Retained signed transfer only with the stated odd-characteristic assumptions for hyperbolicity, and added the characteristic-two metabolic/nonalternating counterexample.
- Opened the cited original signed-transfer proof and replaced the inaccessible secondary locator with its actual theorem/proposition/lemma locators.
- Added ordinary-versus-proper mass accounting, the full maximal-lattice local-type selector and the explicit local λ table. Proper mass is summed over all proper genera in the ordinary genus; doubling excludes rank zero. Included q=2 rational-factor controls and rank-zero mass 1.
- Replaced unsupported field and integral-lattice book locators by exact existing supplier contracts, and removed false source attributions for two elementary deductions and Construction A.
- Corrected Quillen's basepoint assertion, adjunction direction, the Q/S delooping level and Waldhausen page numbers. Specified Schlichting's countable envelope and completed negative K-group convention. Restricted the isometry-monoid/GW₀ comparison to split exact categories and added the homological centrality hypothesis.
- Used native `Functor.IsInvolutiveDual` rather than a parallel coherence predicate. Strengthened cone-fraction equality to equality of canonically advanced common-shift maps, with its API and tests.
- Added concrete discrete path-fibre examples and retained the distinction between duality shift and homotopy degree.
- Made positive dimension explicit in Gaussian error/covering arguments, which otherwise admit a zero denominator. Moved the order-dependent Euclidean product estimates to Layer 1 in Lean, matching the README.
- Kept existing ℤ-lattice finiteness and mass results in the boundaries/supplier contracts, with only number-ring variants in the target list. Removed empty headings and process residue. Fixed bibliographic versions and registered the actual analytic, arithmetic and stable-categorical gaps in the README instead of naming fictitious lower-tier suppliers.

## Remaining defects and handoff

These are the reasons for `needs_changes`; correcting source numbers and elaborating admitted signatures cannot close them.

| Gap | Targets | Exact missing mathematical contract / next work |
| --- | --- | --- |
| G1 | 3.1.3; 3.2.2, 3.2.4, 3.2.6–7 | A target-level finite-hermitian counting argument; existence/stabilization of the nonempty local density; integral Siegel interpolation; smooth integral representation models and normalized lifting counts; the functional-equation proof. Li–Zhang states or invokes Hironaka, Gan–Yu and Cho–Yamauchi here. Their citations do not turn the limit or polynomial existence into a consequence of the finite count. |
| G2 | 3.3.1–2, 3.3.5, 3.3.8 | Number-ring restriction of scalars with a positive real metric and discrete ℤ-lattice; genus reduction/compactness with coefficient ideals; τ(SO)=2, compatible Tamagawa/local measures, archimedean volumes and the zeta functional-equation conversion; smooth integral stabilizer models and reductive quotient orders, especially dyadic. The new factor table fixes the constants but does not construct these suppliers. |
| G3 | 3.4; 4.1.13; 4.3.2 | Integral-lattice theta-kernel specialization; corrected Davenport/Rogers argument and the multiset/projection complexity contract; harmonic-weighted theta-to-cusp-form comparison and the ineffective three-square representation lower bound used by Duke. The unweighted theta interface does not supply the weighted comparison. |
| G4 | 4.2–4.3.1 | Unit representations/matrix coefficients and the L² invariant-vector comparison; quantitative unipotent nondivergence; Ratner rigidity proofs; no escape and selection of orbit-average limits; the auxiliary Lie/arithmetic lemmas in the Oppenheim reduction. Benoist's numbered facts are statements, not these proof suppliers. |
| G5 | 4.4.13; 4.6.1 | Banaszczyk's all-index upper-transference proof and the original mean-value argument. Regev proves the endpoint/covering estimate, not the all-index assertion from the listed lower bound. The rank≥2 mean-value statement is retained as an explicitly sourced gap. |
| G6 | 6.9.1, 6.9.3; 6.10–6.11; nonconnective hermitian comparison | Perfect/derived duality and residue dualizing-line construction; stable Poincaré categories and dévissage/localization; dg weak-equivalence/duality and exact-category comparison; actual spectrum, homotopy fixed-point/orbit and 2-adic-completion interfaces with finite-vcd₂ inputs. Generic exact-category Q/GW and ordinary K-theory do not supply these. No higher-tier or fictitious roadmap is treated as a supplier. |
| G7 | 6.7.17; 6.9.2 | General duality-stable s-filtering exact quotient, its four conditions, induced duality and API. The ordinary envelope quotient is a special case. Construct the general quotient before the suspension; the current reference from 6.7 to 6.9 exposes the unresolved build-order contract. |

Resume by constructing these named carriers/proof inputs with locators and discriminating tests, then point each consuming target at its actual lower-layer contract. The packet's localization/completion, hermitian inverse-Gram, quaternion Morita, generic lattice Fourier and topology adapters also remain implementation/interface obligations as recorded in the 54-gap table below; this review does not silently discharge them. Preserve the corrected mass constants and degree conventions. A subsequent repair must update the packet as well; this review issue authorizes package files only.

## Source verification

The deterministic sample used seed 8031 and selected 15 original target locators. Each row records what was opened, rather than merely checking a reference list. Page numbers are printed unless stated otherwise. All repository prose is in the workers' own words; no source passage was copied.

| Target | Source opened and result |
| --- | --- |
| 5.2.2 | LLL 1982 scanned original, §1, (1.18), p.31 (physical PDF p.5), visually checked. The floor tie rule is our convention; original locator to (1.15) corrected. |
| 6.3.8 | Schlichting 2010, Lemma 2.6, pp.110–111, statement and full proof; both admissibility conditions retained. |
| 6.7.7 | Schlichting 2010, Lemma 9.2, pp.156–158, statement and proof; the localization exact structure is not defined by arbitrary sequences. |
| 6.5.5 | Schlichting 2010, Definition 4.1, p.116; identity spans have the indicated orientation. |
| 1.5.8 | Henk, p.5, coordinate reduction inspected. It uses the coordinate change; our arbitrary-set gauge identity is a direct deduction from Mathlib `gauge_def'`, now attributed accordingly. |
| 2.3.1 | Voight's stated range did not supply the asserted API comparison; replaced by Completed IntegralLattices Layer 1, read against the actual carrier. |
| 4.1.11 | Henk, p.5, proof after (2.5); largest nonzero coordinate and divisibility direction checked. |
| 6.11.14 | Calmès et al. III, Theorem 3.2.13, pp.60–61, including proof; skew-quadratic degrees 0–3 and comparison range agree. |
| 4.4.10 | Regev lecture 11, Corollary 8, pp.4–5; explicit c strengthening follows the preceding calculation. Added positive dimension to avoid 0/0. |
| 4.4.2 | Regev lecture 11, Definition 2 and Example 1, p.2; radius uses distance rather than squared distance. |
| 4.4.6 | Regev lecture 11, Poisson equations before Lemma 5, p.3; covolume reciprocal, sⁿ and positive phase checked. |
| 1.2.11 | Evertse, §2.3, Lemma 2.8, pp.23–24; this is attainment, not the monotonicity theorem. Corrected attribution to the threshold-definition deduction. |
| 6.5.8 | Schlichting 2010, Definitions 4.1 and 4.4, pp.116–117; forgetful functor preserves the chosen zero-object basepoint. |
| 6.11.4 | Calmès et al. III, Theorem 3.2.2 and Remark 3.2.1, pp.55–57; residue-2 row and odd-torsion convention agree. |
| 2.3.3 | Replaced unsupported generic Voight range by Completed IntegralLattices Layer 4, read for bilinear gluing and the additional even quadratic refinement. |

Author-flagged and high-risk source families received the following additional checks:

| Family | Primary source/locator checked | Disposition |
| --- | --- | --- |
| Ordinary Q and cofinality | Quillen, Higher algebraic K-theory I, §1 Theorems A/B and natural-transformation comparison; §2 Q-construction. | Q spans/basepoint and comma direction corrected. |
| Q/S comparison | Waldhausen, Algebraic K-theory of spaces, §1.9, pp.375–376 (physical PDF pp.57–58), including the displayed comparison. | Removed the extra loop; original page range was wrong. |
| Nonconnective ordinary K | Schlichting, Higher Algebraic K-Theory, §§2.4.3–2.4.6, pp.181–183, countable envelope/quotient and negative groups. | The author's public lecture supplies the construction. The separate 2004 journal original was not claimed as independently read. |
| Group completion | McDuff–Segal original scan, Proposition 1 p.279 and Proposition 2 p.280, visually read; Segal §§1–2, Proposition 1.4, pp.296–300; Schlichting 2010 Lemma 2.9, Corollary 2.10, pp.111–112. | Centrality and split-exact GW₀ comparison corrected. |
| Mass | Gan–Hanke–Yu 2001, Tables 3–4 pp.115–116, Proposition 6.12 and its surrounding discussion, §7 pp.118–120; Kirschmer 2013 p.3, equation (1), Table 1 and Proposition 3.2/Theorem 3.3. | Checked global constants against this primary mass treatment and the explicit maximal local table. Added proper-mass bridge and all λ factors. Did not claim access to Conway–Sloane or the separate Shimura 1999 book. Normalization/model proof gaps remain G2. |
| Atomic normal forms | Public Voight v1.0.7, §§9.3–9.5, especially Algorithm 9.3.16 and square-completion steps; author's algorithm errata with the dyadic atomic nonuniqueness example. | Corrected shear and scope; no uniqueness of atomic decomposition asserted. |
| Signed transfer | Skodlerack–Stevens accepted manuscript, Theorem 4.4, Proposition 4.6 and Lemma 4.7 with proofs, pp.13–14; KSS §3.4, Proposition 3.13(ii), p.15. | The secondary “[39]” proof dependency is now identified and opened. |
| Hermitian local densities | Li–Zhang §§3.1–3.2, pp.17–20 and cited Hironaka/Gan–Yu/Cho–Yamauchi locators. Public Hironaka 1998 full-proof acquisition did not succeed. | Statements are located; original proof/smooth-model prerequisites remain G1. No assertion that the cited sources were all downloaded. |
| Homogeneous dynamics | Benoist facts in §3, pp.20–22; Morris §§20.1–20.3, pp.406–413. Original Howe–Moore/Ratner full proofs not obtained in this review. | G4 explicitly records missing analytic proof suppliers. An announcement or secondary fact is not counted as an original proof. |
| Upper transference | Regev lecture 11, Theorem 1 and Remark 1 p.1 and full Gaussian endpoint proof pp.2–6; Banaszczyk 1993 DOI landing page did not provide its full proof. | G5: all-index theorem is attributed correctly but not derived from the lower inequality. |
| Mean value | Benoist measure/convention discussion pp.5–7; original Siegel full proof not obtained. | Explicit source/proof gap retained at 4.6.1. |
| Arithmetic GW | Calmès et al. III public v4 dated 27 April 2026, Theorem 3.2.2/Remark 3.2.1 pp.55–57 and Theorem 3.2.13 pp.60–61; Schlichting dg-duality theorem statements. | All eight integer residue rows and low skew-quadratic values checked. Framework gaps remain G6. |

## Duplication and retained variants

The nine input targets already removed by the package author were independently checked. They stay absent from the build; only boundaries/supplier references remain. The wrapper for strong exact duality now consumes the native involutive-duality predicate.

| Removed packet target | Existing object used |
| --- | --- |
| GN.0/gram-det-orthonormal-coordinates | Mathlib `LinearMap.normDet_sq_eq_det_gram`, GramNormDet module, with its RCLike/orthonormal specialization. |
| GN.0/covolume-square-gram | Tau Ceti `ZLattice.covolume_sq_eq_det_gram`, Algebra/Module/ZLattice/Covolume. |
| GN.0/mixed-embedding-normalization | Tau Ceti `NumberField.mixedEmbedding.covolume_idealLattice`. Weighted consumer metrics are a distinct adapter, not a replanned covolume theorem. |
| GN.1/blichfeldt-native-interface | Mathlib `MeasureTheory.exists_pair_mem_lattice_not_disjoint_vadd`. |
| GN.1/minkowski-first-native-interface | Mathlib `exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure` and its closed-boundary counterpart. |
| GN.1/ideal-class-application-import | Tau Ceti `NumberField.exists_ideal_in_class_of_norm_le`. |
| GN.1/unit-application-import | Tau Ceti `NumberField.Units.finrank_modTorsion`. |
| GN.2/spinor-reflection-product | Tau Ceti `CliffordAlgebra.spinorNorm` and OrthogonalSpinGroups Layer 1D. |
| GN.6/strong-category-duality | Tau Ceti `Functor.IsInvolutiveDual` and `dualityEquivalence`; exact compatibility is the extra wrapper data. |

Retained variants were compared at the object level: arbitrary convex-body successive minima versus IntegralLattices' squared Euclidean minima; real intrinsic covolume duals versus rational Gram duals; Dedekind-prime localization versus completed ℤ-lattices; number-ring proper genus/spinor genus and mass versus the ℤ-lattice statements; nondyadic local-field spinor stabilizers versus Qₚ; number-field adelic norm versus the rational specialization; and real metric Construction A versus the code-lattice constructor. No additional identical definition/theorem was found in the current inspected checkouts.

## Conventions and denominators

| Convention | Witness / exclusion | Result |
| --- | --- | --- |
| Complex Gram conjugation | A singleton i has Gram determinant 1; transpose-only multiplication would give −1. Empty Gram determinant is 1. | Native supplier convention retained. |
| Intrinsic volume | L=2ℤ×3ℤ has covolume 6, dual covolume 1/6; the zero lattice in dimension zero has covolume 1. | Inverses are taken only for full lattices, whose covolumes are positive. |
| Minima index/order | Widths (2,1) give minima (1/2,1); Fin 0 has no first minimum. | Ordering fixed; first-minimum theorems require positive rank. |
| Quadratic versus bilinear discriminant | Polar(x²)=2xy; on ℤ the polar-dual quotient differs from the dual of the coefficient bilinear form. | No silent division by 2 in dyadic or characteristic-two settings. |
| Uniformizer/residue | ℤₚ uses p; a ramified DVR uses its own π. k[[π]]/(π) has length 1 even when k is infinite. q is a residue cardinality ≥2, not 1. | Cardinality and characteristic-zero restrictions are explicit. |
| Signed discriminant/Hasse | d=(−1)^(m(m−1)/2)∏aᵢ; a hyperbolic plane has signed determinant 1. Rank modulo 8 controls the Hasse adjustment. | Local selector uses this sign, not the unsigned determinant. |
| Mass/properness | Rank-one ⟨1⟩: ordinary 1/2, proper 1. Rank zero: both 1. If no improper stabilizer exists, two proper classes share the ordinary class's doubled weight. | Doubling applies to the union of proper genera, in positive rank. |
| Gaussian | ρₛ(aℤ)=(s/a)ρ₁/ₛ((1/a)ℤ); c≈0.18956 and n≥1 give 1−cⁿ>0. | Prefactor and denominator checked; n=0 error bound excluded. |
| LLL rounding/swap | ±1/2 round to 1,0; −3/2 rounds to −1. For B=4,C=1,μ=1/2, swapped squared norm is 2 and potential ratio is 1/2. | Tie convention and B′=C+μ²B checked. |
| Duality and fibre directions | Right adjoint supplies terminal counit in (L↓d). Discrete false→true fibre is empty; identity fibre over false is singleton. | Directions/basepoints corrected. |
| GW degree/shift/flavour | W(ℝ)=ℤ with bilinear rank-one unit 1 corresponds additively to (1/2)ℤ; a duality shift by 4 does not identify homotopy degrees i and i+4. | No ring isomorphism to (1/2)ℤ asserted; integer-table degree zero treated separately. |

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/GeometryOfNumbersAndQuadraticArithmetic.json`: exit 0, zero errors and warnings; packet unchanged.
- `lean-check` on the package's Suggested.lean: exit 0, 731 warnings, every warning exactly `declaration uses sorry`, zero errors. The final file has 434 declarations and 391 examples. This checks elaboration only; the admitted examples are not executable proofs.
- An independent finite/exact-arithmetic audit enumerated norm-one hermitian vectors over 𝔽₄ (ranks 1,2,3: 3,6,36), checked 27 rank-one Siegel coefficient/overlattice/functional-equation cases, the odd-length derivative formula, LLL Gram–Schmidt/swap identities and floor ties, dyadic mass factors and the characteristic-two metabolic counterexample. All passed.
- All 62 targets carrying a definition/construction API have at least three discriminating README checks. The additional homotopical construction targets in 6.1 also have concrete checks; untyped framework definitions are explicitly named in the Lean closing comment rather than replaced by `True` or an unstructured proposition.
- Reviewed signatures including projection covolume, dual covolume, first minimum, gauge change, DVR cardinality, atomic square completion, signed transfer, Gaussian tail/error, LLL swap/potential, native involutive duality, common-shift cone fractions and pointed homotopy fibre. The characteristic-zero/odd-residue field scopes and positive-dimension guards match the corrected prose.
- `python3 research/blueprint/intake.py check-files` on the five deliverables: exit 0, five files, zero problems. Only package README/Suggested.lean/review.json and this report are changed; metadata.toml remains the original `topic = "math.NT"`.

## Exhaustive adversarial target table

Each row covers the final statement, its stated standing hypotheses and its listed prerequisites. “Retained” means no additional statement-level counterexample was found in these instances; it does not override a listed prerequisite gap. Witnesses also test the direction, normalization or exclusion a plausible incorrect definition would get wrong. Definitions retain their full ≥3 checks in the README; this table records two for readability.

| Target / statement | Instances checked | Result / change |
| --- | --- | --- |
| 0.1.1 Hadamard bound in orthonormal coordinates | Orthogonal real columns (2,0),(0,3) attain determinant norm 6 and product norm 6. / Columns (1,0),(1,1) have determinant norm 1 and product norm √2; equality fails. | Retained with the stated hypotheses. |
| 0.1.2 Hermitian Gram–Hadamard inequality | The empty Gram determinant and diagonal product both equal 1. / Family (1,i) in C has Gram [[1,i],[-i,1]], determinant 0 and diagonal product 1; conjugation is essential. | Retained with the stated hypotheses. |
| 0.1.3 Uniform Gram determinant bound | n=0,D=0 gives 1≤0^0=1. / A nonempty zero family with D=0 has determinant 0. | Retained with the stated hypotheses. |
| 0.2.1 Integral basis adapted to a primitive intersection | Columns (1,1),(0,1) form an integral basis: determinant 1. / No matrix with first column (2,0) and an integral second column has determinant ±1. | Retained with the stated hypotheses. |
| 0.2.2 Basis of the projected lattice | Projecting e₂ orthogonally off R(1,1) gives (−1/2,1/2), not (−1,1). / Projection off the full ambient space sends every integral submodule to the zero submodule of the zero-dimensional complement. | Retained with the stated hypotheses. |
| 0.2.3 Gram determinant factorization under orthogonal projection | The adapted columns (1,1),(0,1) give Gram determinant 1 = 2·(1/2). / A sign-reversed coordinate basis has determinant −1 but Gram determinant 1. | Retained with the stated hypotheses. |
| 0.2.4 Gram determinants of biorthogonal bases | The paired real bases 2 and 1/2 have Gram determinants 4 and 1/4. / Gram matrices [[2,1],[1,1]] and [[1,−1],[−1,2]] have determinant product 1. | Retained with the stated hypotheses. |
| 0.2.5 Dual of a projected integral submodule | The integral span of any finite real orthonormal basis is self-dual for the integer-valued inner pairing. / For Δ=2Z in R the dual is (1/2)Z, so an arbitrary ambient lattice cannot be substituted for its dual. | Retained with the stated hypotheses. |
| 0.2.6 Full orthogonal intersection in a self-dual lattice | The orthogonal intersection for the diagonal in Z² is the integral span of a real basis indexed by one element. / The orthogonal intersection for the full plane has an empty real basis. | Retained with the stated hypotheses. |
| 0.2.7 Complete a prescribed primitive-intersection basis | The columns (1,1),(0,−1) have determinant −1, so orientation reversal is allowed. / Every matrix with first column (2,0) has even determinant, hence cannot be an integral basis of Z². | Retained with the stated hypotheses. |
| 0.2.8 Integral basis adapted to a rational complete flag | The columns (1,1),(1,−1) have determinant −2: an independent integral-valued real basis is not necessarily an integral basis. / For the standard real basis of R³, x lies in flag 2 exactly when x_2=0. | Retained with the stated hypotheses. |
| 0.3.1 Covolume of a factor lattice | The projected Z² lattice off the diagonal has intrinsic covolume 1/√2. / The zero lattice in zero-dimensional Euclidean space has intrinsic covolume 1. | Retained with the stated hypotheses. |
| 0.3.2 Reciprocal covolume of the inner dual | The inner dual of 2Z in R has covolume 1/2. / The standard integral lattice in Euclidean n-space has covolume one, including n=0. | Retained with the stated hypotheses. |
| 0.3.3 Equal covolumes of primitive orthogonal intersections | Both primitive diagonal and antidiagonal intersections in Z² have intrinsic covolume √2. / Replacing the primitive generator (1,1) by (2,2) doubles its one-dimensional covolume while leaving its orthogonal line unchanged. | Retained with the stated hypotheses. |
| 1.1.1 Ordered tail product inequality | For (1,2,4), the three left sides are 1,4,4 and total product is 8. / Dropping a_j≥1 fails for (1/2,2): final term 2 exceeds total product 1. | Retained with the stated hypotheses. |
| 1.1.2 Ordered-product root bound | All terms 1 and V=1 give equality. / For (1,2,4),V=8, the final bound has exponent 1, not 1/0. | Retained with the stated hypotheses. |
| 1.1.3 Intrinsic volume of an orthonormal cube | n=0,r=0 gives volume 1. / n=1,r=0 gives volume 0. | Retained with the stated hypotheses. |
| 1.1.4 A cube inside the Euclidean unit ball | n=1 gives [−1,1], whose endpoints have norm 1. / n=4 gives half-side 1/2; the vertex with all four coordinates 1/2 has squared norm 1. | Retained with the stated hypotheses. |
| 1.1.5 Intrinsic Euclidean ball lower bound | n=1 gives exact lower bound 2. / n=4 gives lower constant 1. | Retained with the stated hypotheses. |
| 1.2.1 Successive minima on the lattice and convex body | For L=Z⊂R and K=[−2,2], λ_0(L,K)=1/2. / For L=Z² and K={∣x_0∣≤1/2, ∣x_1∣≤1/3}, (λ_0,λ_1)=(2,3). | Retained with the stated hypotheses. |
| 1.2.2 Finite lattice points below a gauge bound | Negative bound gives the empty set. / Bound zero gives precisely the zero lattice vector. | Retained with the stated hypotheses. |
| 1.2.3 An attained least gauge outside a proper subspace | For Z², the rectangle with minima 2,3, and W=Re_0, the least outside gauge is 3. / W=top is excluded because the complement is empty. | Retained with the stated hypotheses. |
| 1.2.4 A greedy independent family with a strict-sublevel flag | Repeated minima are allowed: the unit square has both values 1. / Strict inequality in the flag is essential: e_0 has gauge equal to the first minimum and does not lie in the zero prefix. | Retained with the stated hypotheses. |
| 1.2.5 Attainment of the rank threshold | A_i contains its endpoint; replacing ≤ by < in the membership assertion is false. / For the rectangle 2,3 the rank jumps from zero to one at 2 and from one to two at 3. | Retained with the stated hypotheses. |
| 1.2.6 Positivity of each successive minimum | For (1/2)Z and the unit interval the minimum is 1/2: positivity does not imply a lower bound of 1. | Retained with the stated hypotheses. |
| 1.2.7 Ordering of successive minima | The unit cube has a constant sequence of minima; strict monotonicity is false. | Retained with the stated hypotheses. |
| 1.2.8 Closed-dilate rank characterization | At r=0 the right side is false for every valid index. / At r=λ_i the threshold holds. | Retained with the stated hypotheses. |
| 1.2.9 Simultaneously attained independent minimum vectors | The unit-square diagonal pair has determinant −2 and attains both minima, so attainment alone does not certify an integral basis. / The zero-dimensional family is an empty real basis and has no minimum value to evaluate. | Retained with the stated hypotheses. |
| 1.2.10 Larger bodies have smaller minima | Changing [−1,1] to [−2,2] divides the only minimum by two. | Retained with the stated hypotheses. |
| 1.2.11 Sublattices have larger minima | 2Z⊂Z gives minima 2 and 1 for the unit interval. | Locator corrected: lattice monotonicity is a deduction from the threshold definition, not Lemma 2.8. |
| 1.2.12 Positive body scaling inverts the minima | Scaling the unit interval by 3 changes its minimum from 1 to 1/3. | Retained with the stated hypotheses. |
| 1.2.13 Invariance under a simultaneous linear change | Scaling both Z and [−1,1] by 2 preserves minimum 1; scaling only the lattice gives 2. / A shear acts simultaneously on the standard lattice and unit square without changing their two minima. | Retained with the stated hypotheses. |
| 1.2.14 The first minimum detects a nonzero lattice point | For Z and the unit interval, r=1 has witnesses ±1, while every 0≤r<1 has none. | Retained with the stated hypotheses. |
| 1.2.15 Integral basis for the strict minimum flag | The nonzero constant vector in R² does not belong to flag zero; equality at the first minimum is not a strict sublevel. / The empty standard basis of R⁰ has flag zero equal to the entire zero space. | Retained with the stated hypotheses. |
| 1.3.1 Volume of a weighted cross-polytope in basis coordinates | n=0 gives volume one. / With the standard basis and a=(2,3), the planar diamond has area 1/3. | Box minima sorted by reciprocal half-width: (2,1) gives (1/2,1). |
| 1.3.2 A symmetric body contains its weighted inscribed cross-polytope | The diamond with vertices ±e_0,±e_1 is contained in the unit square. / Without symmetry, containing b_i/a_i does not imply containing its negative. | Cross-polytope minima sorted by reciprocal widths, with a nonordered-width control. |
| 1.3.3 An independent lattice family has determinant at least the covolume | The diagonal and antidiagonal vectors in Z² have absolute determinant 2≥1. / For 2Ze_0⊕3Ze_1 the basis determinant and covolume are both 6. | Retained with the stated hypotheses. |
| 1.3.4 Minkowski’s sharp lower product inequality | For Z² and the unit diamond, product 1 times area 2 equals 2²/2!. / For Z² and the unit square, product 1 times area 4 is strictly larger than 2. | Retained with the stated hypotheses. |
| 1.3.5 All prescribed minima of a coordinate box | a=(2,3) gives minima 2,3. / a=(1,1,4) gives a repeated first value; the two shortest lattice vectors may be opposites and still fail to be independent. | Retained with the stated hypotheses. |
| 1.3.6 Sharpness via prescribed cross-polytope minima | a=(2,3), b standard in R² gives minima 2,3 and area 1/3, so the product-volume is 2. / Empty dimension has no minimum index and still attains the volume-product equality 1. | Retained with the stated hypotheses. |
| 1.4.1 Volume of a closed linear-forms parallelepiped | For n=1, A=(−2) and a=3 the set is [−3/2,3/2] of length 3. / For A=diag(2,3), a=(2,3), the region is the unit square of area 4. | Retained with the stated hypotheses. |
| 1.4.2 Minkowski’s boundary linear-forms theorem | For n=1, A=(2), a=2, z=1 is a boundary witness; replacing ≤ with < would eliminate every nonzero integer witness. / A determinant of −2 has the same threshold as 2. | Retained with the stated hypotheses. |
| 1.5.1 Volume of interior-disjoint convex translates | The closed intervals [0,1] and [1,2] have union of real volume 2 despite sharing an endpoint. / Two copies of [0,1] have union volume 1, not 2; their interiors are not disjoint. | Retained with the stated hypotheses. |
| 1.5.2 Sections of a finite translated union | The union of translates of [0,1] indexed by Fin 0 is the empty real set. | Retained with the stated hypotheses. |
| 1.5.3 Translation containment of an enlarged convex section | [2,3]⊆[4,6]−2, using a=2 and r=2. / [2,3] is not a subset of its dilation [4,6] about zero; the translation cannot be omitted. | Retained with the stated hypotheses. |
| 1.5.4 Section-volume monotonicity under partial dilation | At r=1, f₁,r(K)=K for every subset of ℝ×ℝ, so every section inequality is equality. | Retained with the stated hypotheses. |
| 1.5.5 Volume monotonicity of partially dilated unions | At r=1 both measurable unions are the same, so the product-volume comparison is equality. / For an empty index type both sides are zero, including when either factor has dimension zero. | Retained with the stated hypotheses. |
| 1.5.6 Complementary coordinate dilation of a union | On ℝ×ℝ, f₁,2(3,5)=(6,5). / On ℝ×ℝ, f₂,2(3,5)=(3,10); it must leave the translation coordinate unchanged. | Retained with the stated hypotheses. |
| 1.5.7 Codimension growth for translated convex unions | For F=EuclideanSpace ℝ (Fin 0), the factor 2^(dim F) is 1, not 2 or zero. | Retained with the stated hypotheses. |
| 1.5.8 Gauge under an invertible linear change | For K=[−1,1], transforming K and x=1 by multiplication by 2 gives gauge_[−2,2](2)=1. / Keeping K=[−1,1] while replacing x=1 by x=2 gives gauge 2, not 1. | Locator corrected to the direct gauge_def' deduction; Henk uses the coordinate change. |
| 1.5.9 Null intersection of separated convex clusters | ([0,2]∪[1,3])∩([3,5]∪[4,6]) has real volume zero. / [0,2]∩[1,3] has volume one: dropping cross-interior disjointness is false. | Retained with the stated hypotheses. |
| 1.5.10 Additive volume of transverse translate clusters | The union of [0,2],[1,3],[3,5],[4,6] has volume 6=2·3, not 4·2=8. / Repeating [0,1] within a row does not double that row's volume; two touching translated rows still have total volume 2. | Retained with the stated hypotheses. |
| 1.5.11 Separation outside a strict gauge flag | The open intervals (−1/2,1/2) and (1/2,3/2) are disjoint, even though the corresponding closed intervals touch. / Replacing the half-body by the whole unit interval makes translates centered at 0 and 1 overlap on (0,1). | Retained with the stated hypotheses. |
| 1.5.12 Volume factorization by lattice-box rows | For q=1,k=1,d=2 and S=[−1,1]×[−1/2,1/2], the prefix union has area 4 and the full union area 12=3·4; summing nine individual areas would incorrectly give 18. / M_0 consists only of zero in every dimension, so every row-volume factor at q=0 is one. | Retained with the stated hypotheses. |
| 1.5.13 Codimension growth in prefix coordinates | For d=3,k=1,r=2 the multiplier is 4, not the ambient factor 8. / For k=d the multiplier is r^0=1; for k=0 it is r^d. | Retained with the stated hypotheses. |
| 1.5.14 Consecutive-threshold lattice-box volume inequality | If s=t>0, the ratio inequality is equality, including every q and cutoff. / For q=1, K=[−1,1]×[−1/3,1/3], s=1,t=3,k=1, the smaller and larger union areas are 3 and 15. The required factor gives 9≤15; the incorrect ambient exponent gives 27≤15, which is false. | Retained with the stated hypotheses. |
| 1.5.15 Initial lattice-box translate volume | For q=1 and K=[−1,1]^2 with s=1, the union area is 9=3²·(1/2)²·4. / For q=1, K=[−2,2]×[−1,1] and s=1/2, the union area is 9/2=3²·(1/4)²·8. | Retained with the stated hypotheses. |
| 1.5.16 Uniform enclosing box for lattice translates | For q=1 and R=3/2 in dimension two, the enclosing area is (2+3)²=25, bounding the anisotropic row example of area 15. / In dimension zero the right side is one, including q=R=0; the empty union's volume is zero. | Retained with the stated hypotheses. |
| 1.5.17 Telescoping product with descending exponents | For a=(2,3,5), 2³·(3/2)²·(5/3)=30=2·3·5. / For a=(2,2,5), the repeated ratio is one and the identity gives 20. | Retained with the stated hypotheses. |
| 1.5.18 Accumulate the consecutive volume inequalities | For a=(2,3,5), B=1 and V=(8,18,30), the two recurrence steps are equalities and the endpoint is 30. / With B=0 and V identically zero the conclusion holds; a proof that divides by a volume would be invalid. | Retained with the stated hypotheses. |
| 1.5.19 Pass a uniform box comparison to the limit | For R=1/2 the ratio (2q+2R)/(2q+1) is identically one. / For d=0 both powers are one even when the numerator vanishes. | Retained with the stated hypotheses. |
| 1.5.20 Sharp product bound from a coordinate flag | For Z² and K=[−3,3]×[−1,1], thresholds (1/3,1) give product-volume 4, exactly 2². / For the unit diamond and thresholds (1,1), product-volume is 2<4. | Retained with the stated hypotheses. |
| 1.5.21 Minkowski’s sharp upper product inequality | For L=2Z and K=[−3,3], minimum 2/3 times length 6 is 4=2·covolume(L); omitting covolume would assert 4≤2. / For L=2Z×3Z and K=[−2,2]×[−1,1], minima (1,3) and area 8 give 24=4·6. | Retained with the stated hypotheses. |
| 2.1.1 Field hyperbolic comparison | The conclusion retains every stated hypothesis and normalization. | Generic book locator replaced by the exact field/Z-lattice supplier contract; this is a specialization comparison. |
| 2.1.2 Field discriminant comparison | The conclusion retains every stated hypothesis and normalization. | Generic book locator replaced by the exact field/Z-lattice supplier contract; this is a specialization comparison. |
| 2.1.3 Field Witt comparison | The conclusion retains every stated hypothesis and normalization. | Generic book locator replaced by the exact field/Z-lattice supplier contract; this is a specialization comparison. |
| 2.1.4 Field Hasse comparison | The conclusion retains every stated hypothesis and normalization. | Generic book locator replaced by the exact field/Z-lattice supplier contract; this is a specialization comparison. |
| 2.1.5 Local field classification comparison | The conclusion retains every stated hypothesis and normalization. | Generic book locator replaced by the exact field/Z-lattice supplier contract; this is a specialization comparison. |
| 2.1.6 Global field isotropy comparison | The conclusion retains every stated hypothesis and normalization. | Generic book locator replaced by the exact field/Z-lattice supplier contract; this is a specialization comparison. |
| 2.1.7 Global field isometry comparison | The conclusion retains every stated hypothesis and normalization. | Generic book locator replaced by the exact field/Z-lattice supplier contract; this is a specialization comparison. |
| 2.2.1 Integral quadratic lattices over a Dedekind domain | R=Z, K=Q, L=Z and q(x)=x² give an integral lattice whose polar pairing is 2xy and is not unimodular. / Over a non-Dedekind base such as `R = ℤ[√−3]` the structure still makes sense, but 2.2.3 (recovery from localisations) is a Dedekind statement and is not claimed there. | Retained with the stated hypotheses. |
| 2.2.2 Localization of an integral quadratic lattice | Z_(2) contains 1/3 and excludes 1/2; this is not Z₂. / Localizing a nonprincipal coefficient ideal makes it principal at a nonzero prime of a Dedekind domain. | Retained with the stated hypotheses. |
| 2.2.3 Integral lattice inclusion detected locally | 2Z is contained in Z at every prime, and the reverse inclusion fails at prime 2. | Retained with the stated hypotheses. |
| 2.2.4 Recover a lattice from its localizations | 2Z and Z differ at the prime 2, though their Q-spans coincide. / For equal embedded localizations the conclusion is L=M; independent local isometries do not supply a single global integral isometry. | Retained with the stated hypotheses. |
| 2.2.5 Descent of a lattice from a DVR completion | The descent of 2Z₂⊂Q₂ is 2Z_(2)⊂Q, not 2Z as a global lattice. / The finite quotient comparison R/p^e≅R̂/p^e for e≥1 is essential to lifting completed generators. | Retained with the stated hypotheses. |
| 2.3.1 Symmetric Z carrier comparison | The conclusion retains every stated hypothesis and normalization. | Generic book locator replaced by the exact field/Z-lattice supplier contract; this is a specialization comparison. |
| 2.3.2 Symmetric Z dual comparison | The conclusion retains every stated hypothesis and normalization. | Generic book locator replaced by the exact field/Z-lattice supplier contract; this is a specialization comparison. |
| 2.3.3 Symmetric Z overlattice comparison | The conclusion retains every stated hypothesis and normalization. | Generic book locator replaced by the exact field/Z-lattice supplier contract; this is a specialization comparison. |
| 2.4.1 Integral genus inside a rational quadratic space | In fixed (Q,x²), Z and 2Z are rationally in the same ambient space but not in one integral genus. / A global integral isometry yields local isometries at every place. | Retained with the stated hypotheses. |
| 2.4.2 Nondyadic unimodular spinor image | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 2.4.3 Adelic spinor norm | The conclusion retains every stated hypothesis and normalization. | Removed self-dependency; stabilizer finiteness comes from 2.4.2. |
| 2.4.4 Proper spinor stabilizer quotient | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 2.4.5 Proper spinor genus | For q=xy, τ_(1,1)τ_(1,2)=diag(2,1/2) has spinor norm [2]; over Q₂ this is not in the spin image. / Over Q₃ the same diag(2,1/2) stabilizes Z₃² and has nonsquare unit norm [2], so the integral stabilizer image is nontrivial. | Retained with the stated hypotheses. |
| 2.5.1 Dual quotient is primary torsion | Over k[[π]] with infinite k, O/(π) has length one but infinitely many elements. / The rank-zero dual quotient is zero; cardinalities require a finite residue field. | Finite length/finitely generated replaced set finiteness; infinite residue fields are allowed. |
| 2.5.2 DVR torsion decomposition comparison | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 2.5.3 DVR graded slice count | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 2.5.4 Ordered elementary divisor uniqueness | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 2.5.5 Uniformizer independence | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 2.5.6 DVR length and cardinality comparison | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 2.6.1 Atomic integral quadratic forms over a DVR | Over Z₂ the hyperbolic quadratic form xy is an atomic binary form. / Over a ring with 2 invertible only the rank-one unit case occurs. | DVR scope and disjunctive unit condition avoid fields and undefined infinity-times-zero arithmetic. |
| 2.6.2 Minimal polar pivot | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 2.6.3 Odd pivot diagonalization | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 2.6.4 Unary integral complement | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 2.6.5 Dyadic binary pivot normalization | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 2.6.6 Binary determinant valuation | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 2.6.7 Binary integral complement | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 2.6.8 Atomic block extraction | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 2.6.9 Atomic splitting termination | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 2.6.10 Corrected square completion | q=x²+2xy+3y² becomes x²+2y² under e₂−e₁; the opposite shear leaves a cross term. / At a=0 or in characteristic 2, b/(2a) is undefined; over ℤ₂ an odd b does not give an integral shear. | Corrected shear e₂−b/(2a)e₁, a≠0, 2≠0 and integral ratio b/(2a). |
| 2.6.11 Normalized integral quadratic form | The binary hyperbolic dyadic block cannot be discarded in favour of an unsupported integral diagonalization. / The zero quadratic map requires the specified zero-block convention. | Normalized integral algorithm restricted to characteristic-zero DVRs; characteristic 2 excluded. |
| 2.7.1 Integral hermitian lattices | For rank one over an unramified quadratic extension, H(x,y)=star(x)y on O_F is integral and self-dual. / Replacing conjugate transpose by ordinary transpose on the complex vector (i) changes its Gram value from 1 to −1. | Retained with the stated hypotheses. |
| 2.7.2 Hermitian dual lattice | For rank-one Gram π^a over an unramified extension, the dual of O_F e is π^−a O_F e. / The Gram-1 lattice is self-dual; Gram-π lattice is integral but not self-dual. | Retained with the stated hypotheses. |
| 2.7.3 Fundamental invariants of a local hermitian lattice | Rank one with Gram π³ has val=3 and type=1; it is not a vertex lattice. / Invariants (0,1,1) give val=2, type=2 and a vertex lattice. | Retained with the stated hypotheses. |
| 2.8.1 Quaternionic integral hermitian lattices | For a star-stable quaternion order O, H(x,y)=star(x)y on O satisfies the integral pairing condition. / Taking reduced trace of H(1,1)=1 gives 2, so reduced-trace metric normalization is a separate comparison. | Retained with the stated hypotheses. |
| 2.8.2 Quaternion order involution stability | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 2.8.3 Quaternion right twisted dual | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 2.8.4 Unit diagonal quaternion regularity | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 2.8.5 Split quaternion stabilizer comparison | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 2.9.1 Odd local quadratic norms | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 2.9.2 Signed hermitian determinant comparison | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 2.9.3 Signed hermitian twist | a=1 leaves h unchanged. / A scalar of negative involution changes hermitian to skew-hermitian. | Retained with the stated hypotheses. |
| 2.9.4 Odd local signed Witt comparison | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 2.9.5 Signed Witt scalar twisting | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 2.9.6 Signed hermitian transfer | E=F and λ=id give the identity. / A hyperbolic plane transfers to degree-many hyperbolic planes. | Added 2≠0 to hyperbolic transfer and the F₂ diagonal metabolic/nonalternating counterexample. |
| 2.9.7 Signed transfer image independence | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 2.9.8 Signed transfer maximal element | The conclusion retains every stated hypothesis and normalization. | Opened the original cited transfer proof, Theorem 4.4, Proposition 4.6, Lemma 4.7, pp.13–14. |
| 2.9.9 Signed transfer parity injectivity | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 3.1.1 Finite hermitian representation counts | Over Z/3 with trivial star, m=n=1, G=B=1 gives 2 maps. / With G=1,B=0 over Z/3 the count is 1: the zero map. | Retained with the stated hypotheses. |
| 3.1.2 Finite hermitian embedding counts | Over Z/3, G=1,B=0 at rank one gives 0 embeddings but 1 representation. / For an empty source the unique map is injective and the count is 1. | Retained with the stated hypotheses. |
| 3.1.3 Finite-field hermitian isometry formula | n=m=1,a=0 gives q+1 norm-one elements. / n=m=1,a=1 gives 0 embeddings. | Retained with the stated hypotheses. G1: finite hermitian count proof. |
| 3.2.1 Normalized finite-level hermitian counts | For n=0 the normalized count is 1 at every level. / For m=n=1 the exponent is N, not 2N. | Retained with the stated hypotheses. |
| 3.2.2 Hermitian local representation density | Density of the empty source is 1. / The denominator and measure use q=#k_{F₀}; substituting q² changes the limit. | Retained with the stated hypotheses. G1: analytic density existence. |
| 3.2.3 Eventually empty integral representation counts | For a rank-one target of norm 1 and source of norm pi, reduction modulo pi has a zero-vector solution, while modulo pi^2 no solution can have norm of valuation one. Generic emptiness implies eventual zero, not zero at every finite level. | Retained with the stated hypotheses. |
| 3.2.4 Normalized hermitian Siegel polynomial | For a rank-one lattice with valuation a, D_L(X)=Σ_{i=0}^a(−X)^i. / A self-dual lattice has polynomial 1. | Retained with the stated hypotheses. G1: integral Siegel interpolation. |
| 3.2.5 Cho–Yamauchi weight polynomial | m_q(0;X)=1, derivative weight 0. / m_q(1;X)=1−X, derivative weight 1. | Retained with the stated hypotheses. |
| 3.2.6 Cho–Yamauchi hermitian density formula | For valuation-one rank one, D=1−X and the negative derivative is 1. / For valuation-three rank one, D=1−X+X²−X³ and the negative derivative is 2. | Retained with the stated hypotheses. G1: smooth models and lifting counts. |
| 3.2.7 Hermitian Siegel polynomial functional equation | Rank-one D=1−X at valuation 1 satisfies D(X)=−X D(X^−1). / At valuation 2, D=1−X+X² and D(1)=1, so the odd-valuation vanishing does not extend to even valuation. | Retained with the stated hypotheses. G1: functional equation proof. |
| 3.3.1 Finite integral isometry stabilizers | For (Z,x²) the isometry group is {±1}, so its mass weight is 1/2. / Positive definiteness cannot be dropped: Pell-type indefinite rank-two lattices have infinite stabilizers. | Retained with the stated hypotheses. G2: restriction-of-scalars metric. |
| 3.3.2 Finiteness of a positive-definite genus class set | Infinitely many embedded coordinate changes can represent one integral-isometry class. / The rank-one positive unimodular Z-genus has one class, though its isometry group has two elements. | Retained with the stated hypotheses. G2: number-ring class finiteness. |
| 3.3.3 Weighted genus mass | The rank-one positive unimodular genus has ordinary mass 1/2, not class number 1. / For proper rank-one classes the stabilizer is trivial and proper mass is 1. | Positive automorphism order on the arithmetic domain; rank zero has mass 1. |
| 3.3.4 Adelic weighted mass identity | Rescaling one local Haar measure changes the numerator and local factor compatibly. / For proper rank-one classes the SO stabilizer is trivial and mass equals class count. A proper class whose stabilizer has order four contributes 1/4; for example SO(Z^2,x^2+y^2) has order four. | Retained with the stated hypotheses. |
| 3.3.5 Mass formula for maximal integral lattices | Class number one implies mass=1/∣Aut L∣; it is not an unweighted class count. / The formula is restricted to m≥3; binary zeta-at-one substitution is excluded. | Retained with the stated hypotheses. G2: Tamagawa and archimedean normalization. |
| 3.3.6 Ordinary and proper number-ring mass comparison | The positive rank-one ordinary class has stabilizer order 2 and mass 1/2; its proper mass is 1. / If an ordinary stabilizer has order 4 and has no improper automorphism, its two proper classes contribute 1/4+1/4=1/2. | Added ordinary/proper mass bridge across all proper genera; positive rank is required. |
| 3.3.7 Local invariants for maximal-lattice mass | `⟨1,1⟩` has determinant 1 but signed discriminant −1; the split plane `⟨1,−1⟩` has signed discriminant 1. / At odd rank and odd discriminant valuation the signs +1 and −1 select different `II` cases; at even valuation the positive sign has type `zero`. | Added the complete rank/discriminant/Hasse-sign local-type selector, including dyadic fields. |
| 3.3.8 Maximal-lattice local mass factors | At `q=2,r=1`, odd types `I`, `IIPlus`, `IIMinus` give respectively `1/2,3/2,1/2`. / At `q=3,r=2`, even types `I`, `II`, `IIIPlus` give respectively `2,5,1/2`. | Added all maximal local λ factors as exact rational values; q≥2 and compatible types required. G2: smooth integral stabilizer models. |
| 3.4.1 The theta series of a positive definite lattice and its coefficients | For `L = ℤ` with `B(x,y) = xy` the coefficient of `q` is `2`, of `q²` and `q³` is `0`, and of `q⁴` is `2`. / For `L = ℤ²` with the standard form the coefficient of `q` is `4` and of `q²` is `4`. | Retained with the stated hypotheses. G3: theta-kernel comparison. |
| 4.1.1 Counting by differences in finite-index cosets | The empty subset of Z has natural cardinal zero. / For N={0} in Z, N.index=0 but ∣{0}∣=1; finite-index hypotheses are essential. | Retained with the stated hypotheses. |
| 4.1.2 Henk’s sublattice counting lemma | The set {−1,0,1} has three elements, {−2,0,2} has three elements, and 3≤2·3. / The singleton consisting of the zero function Fin 0→Z has cardinal one. | Retained with the stated hypotheses. |
| 4.1.3 Counting separated points in integral basis residues | The residue images of −1,0,1 in ZMod 3 have cardinal three. / In ZMod 2 the integers 0 and 2 have equal residue, although they differ in Z. | Retained with the stated hypotheses. |
| 4.1.4 Excluding nonzero points in a dilated sublattice | An integer divisible by 3 with absolute value at most 2 is zero. / 2 is nonzero, divisible by 2, and has absolute value at most 2; also 2/2=1. | Retained with the stated hypotheses. |
| 4.1.5 Lattice-point bound from the first minimum | The product {−1,0,1}×{−1,0,1} has cardinal nine, equal to (floor(2/1)+1)^2. / For λ_0=3 the factor floor(2/λ_0)+1 is one. | Retained with the stated hypotheses. |
| 4.1.6 One step of divisibility-compatible rounding | q=5,m=6 gives n=6. / q=6,m=3 gives n=9, not 6; it still satisfies the strict upper bound. | Retained with the stated hypotheses. |
| 4.1.7 Backward rounding along a divisibility chain | q=(7,5,3) gives n=(12,6,3), with 3∣6∣12 and both earlier factors strictly below twice q. / The empty factor product is one. | Retained with the stated hypotheses. |
| 4.1.8 Strict product loss from backward rounding | 12·6·3=216<2²·7·5·3=420. / For d=1,q=n=3 the strict assertion would be 3<3 and is false. | Retained with the stated hypotheses. |
| 4.1.9 Coordinate membership in a diagonal sublattice | Coordinates (4,6) satisfy divisibility by (2,3), while 3 is not divisible by 2. / Zero divides an integer z exactly when z=0. | Retained with the stated hypotheses. |
| 4.1.10 Index of a diagonal sublattice | 2Z×3Z has index six. / 2Z×{0} has natural index zero, not a positive finite cardinality. | Retained with the stated hypotheses. |
| 4.1.11 Diagonal sublattice avoids the doubled body | No integer equals 2/3; division by the last factor is not integral without the divisibility condition. / For Z and K=[−1,1], n=2 leaves the point 2 in nZ∩2K at the equality 2/n=λ_0=1. | Retained with the stated hypotheses. |
| 4.1.12 Henk's successive-minima lattice-point bound | For the standard unit square the nine points satisfy 9<2·3·3=18. / A rectangle with minima (1,3) has three points and gives 3<2·3·1=6; its product factor 3 is below the first-minimum square factor 9. | Retained with the stated hypotheses. |
| 4.1.13 Davenport semialgebraic multiset estimate | For an interval [0,N] with N integral, count−length=1. / Counting a region twice multiplies both volume and point count; ignoring multiset multiplicity is wrong. | Retained with the stated hypotheses. G3: corrected Davenport proof. |
| 4.2.1 Howe–Moore matrix-coefficient decay | A constant vector in the full L² quotient space has a nondecaying coefficient; remove constants before applying the theorem. / Escaping only one factor of a product does not justify the unqualified product theorem. | Retained with the stated hypotheses. G4: unitary matrix coefficients. |
| 4.2.2 Ergodicity of a noncompact subgroup action | A compact subgroup does not meet the noncompactness hypothesis. / For a semisimple product, a lattice quotient with factor-invariant functions requires an irreducibility/factor version instead. | Retained with the stated hypotheses. G4: L²/action comparison. |
| 4.2.3 Dani–Margulis recurrence in the lattice space | A diagonal flow can diverge and cannot replace the unipotent flow. / The statement controls every T>0 with a compact set containing the necessary initial trajectory segment. | Retained with the stated hypotheses. G4: unipotent nondivergence. |
| 4.2.4 Ratner orbit-closure theorem | The orbit closure carries a finite L-invariant measure, not just an unspecified closed set. | Retained with the stated hypotheses. G4: orbit rigidity. |
| 4.2.5 Ratner invariant-measure classification | A convex combination of different homogeneous orbit measures need not be ergodic. / Replacing probability by an arbitrary infinite invariant measure is outside the statement. | Retained with the stated hypotheses. G4: measure rigidity. |
| 4.2.6 Equidistribution of a unipotent orbit | A closed periodic unipotent orbit equidistributes on itself, not on the full quotient. / The limiting measure has mass 1; vague convergence with escaped mass would not satisfy the statement. | Retained with the stated hypotheses. G4: time averages/no escape. |
| 4.3.1 Margulis’s theorem on irrational quadratic values | An integral form has discrete values and is excluded. / Positive-definite forms do not have values dense in all R. | Binary negative control justified by a nonzero Pell norm; no assertion of discreteness is needed. G4: auxiliary Lie/arithmetic inputs. |
| 4.3.2 Duke spherical lattice-point equidistribution | n≡7 mod8 has no three-square representations and is excluded. / A measure on primitive representations for nonsquare-free n is a different theorem. | Retained with the stated hypotheses. G3: harmonic theta and lower bound. |
| 4.4.1 Euclidean lattice packing radius | For aZ in R, a>0, the packing radius is a/2. / For Z² the packing radius is 1/2. | Retained with the stated hypotheses. |
| 4.4.2 Euclidean lattice covering radius | For aZ in R with a>0, μ=a/2. / For Z², μ=√2/2, larger than its packing radius 1/2. | Retained with the stated hypotheses. |
| 4.4.3 Polar-body transference lower inequality | For L=Z^n and K=product_i[-a_i,a_i], a_i>0, the polar is the cross-polytope sum_i a_i∣y_i∣<=1. The ordered minima of K are sorted reciprocals 1/a_i and those of its polar are sorted a_i, so the oppositely indexed products equal one. / An arbitrary real pairing has no integer ≥1 floor. | Retained with the stated hypotheses. |
| 4.4.4 Lattice Gaussian sum | For rank zero the sum is 1. / For L=aZ and s=a the unshifted sum equals that for Z at s=1. | Retained with the stated hypotheses. |
| 4.4.5 Gaussian lattice summability | The zero-dimensional sum is 1. / For aℤ and s>0 the tails are dominated by an exponentially decaying square; s=0 is excluded. | Retained with the stated hypotheses. |
| 4.4.6 Gaussian lattice Poisson comparison | For aℤ, the dual is (1/a)ℤ and the zero-shift prefactor is s/a. / At rank zero both sides are 1; the phase is exp(2πi⟨y,u⟩). | Retained with the stated hypotheses. |
| 4.4.7 Shifted Gaussian maximum | For u∈L the shifted and unshifted sums agree. / A half-lattice translate is permitted; termwise comparison is not the proof. | Retained with the stated hypotheses. |
| 4.4.8 Gaussian scale upper bound | At s=1 the factor is 1; rank zero gives 1≤1. / The argument requires s≥1, while the definition itself only requires s>0. | Retained with the stated hypotheses. |
| 4.4.9 Shifted Gaussian tail bound | Rank zero is excluded: its shifted-tail estimate would read 1≤1 but cannot feed a strict error bound. / For n≥1, c=2exp(−3π/4)≈0.18956, so cⁿ<1/4. | Retained with the stated hypotheses. |
| 4.4.10 Dual Gaussian error bound | At n=0, 1−c⁰=0; the bound is restricted to n≥1. / For n≥1, 0<cⁿ<1 and R≥0, so multiplying by 1−cⁿ preserves the inequality. | Made n≥1 explicit; at n=0 the claimed bound would contain 0/0. |
| 4.4.11 Poisson approximation error | At rank zero, ρ(L*+u)=covol(L)=1 and the error is zero. / For aℤ the factor is a, not 1/a; the absolute error handles either sign of the phase. | Retained with the stated hypotheses. |
| 4.4.12 Gaussian covering contradiction | Positive dimension is explicit; cⁿ<1/3 yields the contradiction. / A shortest vector equal to √n does not satisfy the strict hypothesis. | Made n≥1 explicit; the positive-dimension tail bound is required. |
| 4.4.13 Euclidean successive-minima transference | For aZ in R, the product is one. / For Zⁿ, each product is one and is at most n. | Retained with the stated hypotheses. G5: all-index upper transference. |
| 4.4.14 Covering radius and reciprocal shortest vector | For aZ in R the product is 1/2. / For Zⁿ the product is √n/2. | Retained with the stated hypotheses. |
| 4.5.1 Compact star bodies from homogeneous gauges | The Euclidean norm gives a convex star body. / p(x,y)=(√∣x∣+√∣y∣)² gives a compact nonconvex star body: (1,0),(0,1) lie in it but their midpoint does not. | Retained with the stated hypotheses. |
| 4.5.2 Critical determinant | For p(x)=∣x∣ on R, Δ=1 and Z is critical. / For p(x)=∣x∣/2 on R, Δ=2 and 2Z is critical. | Retained with the stated hypotheses. |
| 4.5.3 Interior ball of a star body | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 4.5.4 Admissible dilation lattice | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 4.5.5 Positive critical determinant | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 4.5.6 Critical minimizing sequence | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 4.5.7 Closed admissibility under basis convergence | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 4.5.8 Mahler compactness criterion | diag(t,t^−1)Z² escapes compact sets as t→∞ because its first minimum tends to 0. / A nonclosed subset with a uniform first-minimum bound is relatively compact, but need not be compact. | Retained with the stated hypotheses. |
| 4.5.9 Critical lattice existence | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 4.6.1 Siegel lattice mean-value theorem | Including v=0 adds f(0) and changes the formula. / In dimension one the single lattice Z does not give the Lebesgue mean-value formula. | Retained n≥2: the rank-one lattice space would falsify the mean-value statement. G5: original mean-value proof. |
| 4.7.1 Construction A real-lattice comparison | For the zero code, the unscaled lattice is pZ^n and has covolume p^n. / For the whole code it is Z^n with covolume 1. | Corrected source to the code index/discriminant contract and Layer 0 covolume comparison. |
| 5.1.1 Gram–Schmidt reduction coefficients | For b=((1,0),(1/2,1)) the coefficient μ₁₀ is 1/2. / For an orthogonal family, off-diagonal reduction coefficients vanish. | Retained with the stated hypotheses. |
| 5.1.2 LLL-reduced independent families | The standard orthonormal basis is reduced. / The basis ((2,0),(0,1)) has size coefficients zero but fails the Lovász condition. | Retained with the stated hypotheses. |
| 5.1.3 Growth bound for reduced orthogonal lengths | For orthonormal input the right-hand side is at least the left-hand side. / The exponent is an index difference, not the full ambient dimension. | Retained with the stated hypotheses. |
| 5.1.4 LLL shortest-vector approximation bound | For n=1 the factor is 1 and the basis vector is shortest. / Replacing integer coordinates by real coefficients destroys the lower bound on the last nonzero coefficient. | Retained with the stated hypotheses. |
| 5.2.1 Exact integer change-of-basis certificates | The coordinate swap [[0,1],[1,0]] has determinant −1 and is a valid certificate. / diag(2,1) is not an integer-invertible basis change. | Retained with the stated hypotheses. |
| 5.2.2 Nearest integer residual | The conclusion retains every stated hypothesis and normalization. | Nearest-integer source corrected to (1.18), printed p.31; floor(t+1/2) fixes ties. |
| 5.2.3 Integral shear certificate | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 5.2.4 Shear preserves orthogonalized vectors | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 5.2.5 Shear coefficient update | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 5.2.6 Descending size reduction | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 5.2.7 Adjacent swap certificate | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 5.2.8 First swapped orthogonal vector | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 5.2.9 Second swapped orthogonal vector | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 5.2.10 Later swapped coefficients | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 5.3.1 Integer Gram-prefix potential | The standard basis has all prefix determinants and potential equal to 1. / A rational metric with denominator 2 needs a fixed rescaling; its original determinants are not asserted to be integers. | Retained with the stated hypotheses. |
| 5.3.2 Prefix Gram product | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 5.3.3 Integral positive prefix determinants | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 5.3.4 Shear prefix determinant invariance | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 5.3.5 Swap prefix determinant ratio | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 5.3.6 Strict LLL potential decrease | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 5.3.7 LLL prefix invariant | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 5.3.8 LLL lexicographic termination | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 5.4.1 Exact terminating LLL reduction | Input columns (2,0),(0,1) require a swap; the returned certificate may have determinant −1. / Rank zero returns an empty reduced basis and empty identity matrices. | Retained with the stated hypotheses. |
| 5.4.2 Verify the short output in the original lattice | A verified certificate includes both original membership and the approximation factor. / A short vector in the real span but outside the integer span cannot pass verification. | Retained with the stated hypotheses. |
| 6.1.1 The Q-construction | The two spans `X ↞ X ≅ Y` and `X ≅ Y ↣ Y` attached to an isomorphism `X ≅ Y` represent the same morphism of `quillenQ E`. / `Hom(0, X)` is in bijection with the isomorphism classes of admissible inflations `Z ↣ X` (every `Z ↠ 0` is an admissible deflation), so it is a singleton exactly when `X` has no admissible subobject other than `0`; for `X = 0` it is a singleton, and for a nonzero vector space in the split structure it is not. | Zero image is a nerve basepoint, not a zero object of Q(E); subobjects give multiple Hom(0,X). |
| 6.1.2 K-groups of an exact category | `exactKGroup E 0` is generated by the classes `[X]` subject to `[Y] = [X] + [Z]` for every conflation, through `exactKGroup_zero_iso`. / The zero exact category has `exactKGroup 0 n = 0` for every `n`. | Retained with the stated hypotheses. |
| 6.1.3 Nerves, realisation and Quillen’s theorems | Theorem A applied to the identity functor is the identity equivalence. / A functor with a right adjoint satisfies the hypothesis of Theorem A, since `f/Y` has the terminal object determined by the counit `f(RY)→Y`. For a left adjoint, the corresponding under-comma category instead has an initial object. | Corrected adjunction directions: right-adjoint comma has a terminal counit object. |
| 6.1.4 The S-construction and delooping | `S_0 E` is the trivial category and `S_1 E` is `E`. / Additivity: the two functors `S_2 E → E` sending a conflation to its outer terms induce, with the total object, a homotopy equivalence `∣wS.S_2 E∣ ≃ ∣wS.E∣ × ∣wS.E∣`. | BQ≃∣N(iS•E)∣; only K=ΩBQ. Corrected Waldhausen pages to 375–376. |
| 6.1.5 The nonconnective K-theory spectrum | The negative K-groups of a field, and more generally of a regular noetherian ring, vanish. / `π_0` of the spectrum is `ExactK0 E` for idempotent complete `E`. | Specified admissible-inflation envelope, lim-colim Hom, exact quotient and idempotent completion. |
| 6.1.6 Group completion | For the groupoid of finite sets under disjoint union the `π_0` is `ℤ`. / The orthogonal sum is associative and commutative up to the coherence isomorphisms of 6.2, and these are what the Γ-space records. | Added homology centrality and split-exact hypothesis for the GW₀ monoid comparison. |
| 6.2.1 Exact category with strong duality | Finite projective R-modules with Hom_R(−,R) form the split exact example; arbitrary finite modules need not have invertible biduality. / Over Z the hyperbolic symmetric plane is available without 1/2. | Retained with the stated hypotheses. |
| 6.2.2 Nondegenerate symmetric spaces | The rank-one pairing xy on Z is nondegenerate; 2xy is separating but not a pairing isomorphism over Z. / The identity map preserves every symmetric space. | Retained with the stated hypotheses. |
| 6.2.3 Symmetric isometry classes | A rank-one Z pairing xy is not isometric to 2xy, which is not perfect. / The zero space has a single isometry class. | Retained with the stated hypotheses. |
| 6.2.4 Orthogonal sum | The sum of two rank-one unit forms over Z has diagonal Gram matrix (1,1). / Zero is a unit up to isometry. | Retained with the stated hypotheses. |
| 6.2.5 Negative symmetric space | Negating ⟨1⟩ gives ⟨−1⟩ over Q. / Negation twice recovers the original space. | Retained with the stated hypotheses. |
| 6.2.6 Admissible Lagrangians | The first summand of the hyperbolic plane is a Lagrangian. / 2Z⊂Z is not an admissible summand in the split exact category of projectives. | Retained with the stated hypotheses. |
| 6.2.7 Hyperbolic symmetric space | Over Z, H(Z) has Gram [[0,1],[1,0]] and is even unimodular. / H(0) is the zero symmetric space. | Retained with the stated hypotheses. |
| 6.2.8 Diagonal Lagrangian for opposite forms | For a one-dimensional field form <a>, the diagonal line in <a> orthogonal-sum <-a> has zero pairing and is the Lagrangian. | Retained with the stated hypotheses. |
| 6.3.1 Admissible isotropic subobject | L=0 in a perfect field space gives Q=X. / A Lagrangian gives Q=0. | Retained with the stated hypotheses. |
| 6.3.2 Exact short five lemma | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.3.3 Isotropic pairing descends | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.3.4 Isotropic quotient symmetry | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.3.5 Isotropic quotient is perfect | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.3.6 Isotropic graph is Lagrangian | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.3.7 Isotropic reduction of a symmetric space | For L=0 the quotient is X and X⊥−X is metabolic. / For a Lagrangian L the quotient L⊥/L is zero. | Retained with the stated hypotheses. |
| 6.3.8 Metabolic comparison for isotropic reduction | At L=0 the reduction is X and the comparison becomes X orthogonal-sum -X with its diagonal Lagrangian. | Retained with the stated hypotheses. |
| 6.4.1 Degree-zero Grothendieck–Witt group of an exact category | A metabolic space with Lagrangian L has the same GW class as H(L). / Over a split exact projective category, stable metabolic cancellation yields the usual group completion. | Retained with the stated hypotheses. |
| 6.4.2 Witt group of an exact category | A hyperbolic plane has zero Witt class. / The inverse of [X,φ] is [X,−φ]. | Retained with the stated hypotheses. |
| 6.4.3 Forgetful map on Grothendieck–Witt groups | F of the zero space is zero. / Over a field, a nonsingular one-dimensional form has underlying K0 rank one. | Retained with the stated hypotheses. |
| 6.4.4 Hyperbolic map from the exact Grothendieck group | H(0)=0. / Over a field the underlying rank of H of a rank-one class is two. | Retained with the stated hypotheses. |
| 6.4.5 Witt group as the hyperbolic cokernel | Each hyperbolic class maps to zero in the Witt group. | Retained with the stated hypotheses. |
| 6.4.6 Hyperbolic and forgetful maps in degree zero | Over a field with trivial rank-duality action, F H doubles rank. / The hyperbolic image maps to zero in W₀. | Retained with the stated hypotheses. |
| 6.5.1 Hermitian Q span | The identity representative uses U=X and both identity legs. / A Lagrangian inclusion represents zero→X. | Retained with the stated hypotheses. |
| 6.5.2 Hermitian Q representative equivalence | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.5.3 Hermitian Q pullback closure | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.5.4 Hermitian Q composition respects representatives | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.5.5 Hermitian Q identity laws | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.5.6 Hermitian Q associativity | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.5.7 Hermitian Q-construction | A Lagrangian gives a Qʰ path from zero to its metabolic space. / The identity span gives the identity morphism. | Retained with the stated hypotheses. |
| 6.5.8 Hermitian Q forgetful functor | The conclusion retains every stated hypothesis and normalization. | Forgetful functor preserves the chosen basepoint; no categorical-zero-object assertion. |
| 6.5.9 Hyperbolic Q equivalence | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.5.10 Hermitian Q nerve realization | The conclusion retains every stated hypothesis and normalization. | Uses the explicit 6.1.3 nerve-realization target; removed process language. |
| 6.5.11 Grothendieck–Witt space of an exact category | For the constant map from a point to false in the discrete two-point space, the homotopy fibre over true is empty: there is no path joining the two points. / The fibre of the identity of the discrete two-point space over false is a singleton. | Added three discrete Bool path-fibre controls; retained hyperbolic and degree-versus-shift controls. |
| 6.5.12 Higher Grothendieck–Witt groups | GW_0 agrees with the exact presentation, including metabolic relations. / For HE the higher groups agree with ordinary K_i(E). | Retained with the stated hypotheses. |
| 6.5.13 Orthogonal additivity on GW spaces | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.5.14 Degree-zero comparison for the GW space | The comparison respects the hyperbolic image of an actual exact object. / The degree-zero class is the metabolic GW presentation, not just unconstrained free isometry classes. | Retained with the stated hypotheses. |
| 6.6.1 Cofinal object complement | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.6.2 Cofinal hermitian comma contraction | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.6.3 Cofinal hermitian Q fibration | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.6.4 Grothendieck–Witt cofinality | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.7.1 Hermitian cone diagrams | Constant diagrams satisfy the conditions with k=0. / A diagram whose forward map is multiplication by 2 on a projective Z-module fails inflation. | Retained with the stated hypotheses. |
| 6.7.2 Cone diagrams are extension closed | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.7.3 Hermitian cone shifts | The zero shift is the identity. / Two lower shifts add their indices. | Retained with the stated hypotheses. |
| 6.7.4 Cone duality exchanges shifts | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.7.5 Cone fraction morphisms | Unshifted maps embed faithfully. / Every lower and upper comparison map becomes invertible. | Common-shift equality now compares canonically advanced representatives, with a named advance API. |
| 6.7.6 Cone fraction composition laws | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.7.7 Cone localization exactness | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.7.8 Constant cone embedding is fully exact | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.7.9 Constant cone embedding is s-filtering | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.7.10 Relative cone quotient equivalence | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.7.11 Cone zero extension shift | The new zero-position component is zero. / Its index-one component is the original index-zero component. | Retained with the stated hypotheses. |
| 6.7.12 Hermitian cone swindle functor | At index zero T has the original zero-index object. / At index one its component is U1⊕U0. | Retained with the stated hypotheses. |
| 6.7.13 Cone swindle descends to localization | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.7.14 Hermitian swindle absorption | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.7.15 Hermitian cone category | The cone of the zero exact category is equivalent to the zero exact category. / The shift maps chosen for localization become isomorphisms. | Retained with the stated hypotheses. |
| 6.7.16 Contractibility of the hermitian cone space | The comparison retains the source hypotheses: C(E,E) is the filtered diagram/cone category of §9, not a ring of dummy symbols. | Retained with the stated hypotheses. |
| 6.7.17 Hermitian suspension of an exact category | The cone GW space is contractible by id⊥T≅T. / The quotient is by the embedded E and retains exact duality. | Retained with the stated hypotheses. G7: filtering quotient/build order. |
| 6.7.18 Loop comparison under hermitian completion | The comparison retains the source hypotheses: No invertibility of two is imposed on this exact-category model. | Retained with the stated hypotheses. G6/G7: genuine spectrum and suspension comparison. |
| 6.7.19 Hermitian suspension delooping | Idempotent completion is explicitly retained before iteration. / The analogous Ω∣Qʰ(S_h E)∣ completion map is not always a π_0 isomorphism. | Retained with the stated hypotheses. |
| 6.7.20 Nonconnective hermitian spectrum | For the zero exact category, all integer-degree nonconnective hermitian groups are zero. / For HE negative groups recover nonconnective K groups. | Retained with the stated hypotheses. |
| 6.7.21 Nonconnective hyperbolic comparison | Positive degrees agree with Quillen K groups; degree zero uses the idempotent-completed derived-category convention of the imported spectrum. | Retained with the stated hypotheses. |
| 6.8.1 Formation | Using the same Lagrangian twice gives a trivial formation class. / Interchanging the Lagrangians reverses its class. | Retained with the stated hypotheses. |
| 6.8.2 Formation group | The class [L,L] is zero by concatenation. / Swapping gives its additive negative. | Retained with the stated hypotheses. |
| 6.8.3 Formation loop comparison | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.8.4 Formation detects hyperbolic kernel | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.9.1 Canonical residue duality coefficient | The residue term has a −1 duality shift, not degree zero. / For Z→Z[i] at 2, the integer 2 does not become a uniformizer at (1+i), so the naive residue-field identity is not the induced map. | Retained with the stated hypotheses. G6: derived residue duality. |
| 6.9.2 Hermitian filtering localization | A fully exact inclusion without the four s-filtering conditions is not enough. / Idempotent completeness of A is an explicit hypothesis. | Retained with the stated hypotheses. G7: s-filtering exact quotient. |
| 6.9.3 Symmetric Grothendieck–Witt localization for Dedekind rings | The left shift is r−1 after a uniformizer choice. / Quadratic L-theory at the prime 2 cannot simply replace symmetric L-theory in this sequence. | Retained with the stated hypotheses. G6: stable Poincaré dévissage. |
| 6.10.1 Classical hermitian Bott triangle | The comparison retains the source hypotheses: The dg model, weak equivalences and pretriangulated/smallness conventions are those of Schlichting. | Retained with the stated hypotheses. G6: dg/exact comparison. |
| 6.10.2 shifted Karoubi periodicity | The equality relates shift r with r+4 while keeping homotopy degree fixed. / The hypothesis 2 invertible cannot be removed by citing the characteristic-free exact-category definitions. | Retained with the stated hypotheses. G6: dg/exact comparison. |
| 6.10.3 Number-ring homotopy-limit comparison | A number ring with real places requires 2-completion; the rational signature contribution prevents the unqualified integral statement. / Classical connective groups give the nonnegative-degree specialization. | Retained with the stated hypotheses. G6: homotopy-limit carrier. |
| 6.10.4 Berrick–Karoubi comparison after inverting two | The map on π₀ is injective; it need not be surjective. / The theorem compares R with R[1/2], not GW with ordinary K without duality. | Retained with the stated hypotheses. G6: finite-vcd₂ inputs. |
| 6.10.5 Classical homotopy-limit obstruction | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. G6: spectrum/Poincaré carrier. |
| 6.10.6 Genuine L-theory after inverting two | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. G6: spectrum/Poincaré carrier. |
| 6.11.1 Classical integral degree-zero groups | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.11.2 Integral symmetric table, residue 0 | Residue 0: first allowed degree is 8; degree zero is handled separately in 6.11.1. / Odd K-theory means the actual odd torsion subgroup; no general cyclicity is assumed. | Retained with the stated hypotheses. |
| 6.11.3 Integral symmetric table, residue 1 | Residue 1: first allowed degree is 1; degree zero is handled separately in 6.11.1. / Odd K-theory means the actual odd torsion subgroup; no general cyclicity is assumed. | Retained with the stated hypotheses. |
| 6.11.4 Integral symmetric table, residue 2 | Residue 2: first allowed degree is 2; degree zero is handled separately in 6.11.1. / Odd K-theory means the actual odd torsion subgroup; no general cyclicity is assumed. | Retained with the stated hypotheses. |
| 6.11.5 Integral symmetric table, residue 3 | Residue 3: first allowed degree is 3; degree zero is handled separately in 6.11.1. / Odd K-theory means the actual odd torsion subgroup; no general cyclicity is assumed. | Retained with the stated hypotheses. |
| 6.11.6 Integral symmetric table, residue 4 | Residue 4: first allowed degree is 4; degree zero is handled separately in 6.11.1. / Odd K-theory means the actual odd torsion subgroup; no general cyclicity is assumed. | Retained with the stated hypotheses. |
| 6.11.7 Integral symmetric table, residue 5 | Residue 5: first allowed degree is 5; degree zero is handled separately in 6.11.1. / Odd K-theory means the actual odd torsion subgroup; no general cyclicity is assumed. | Retained with the stated hypotheses. |
| 6.11.8 Integral symmetric table, residue 6 | Residue 6: first allowed degree is 6; degree zero is handled separately in 6.11.1. / Odd K-theory means the actual odd torsion subgroup; no general cyclicity is assumed. | Retained with the stated hypotheses. |
| 6.11.9 Integral symmetric table, residue 7 | Residue 7: first allowed degree is 7; degree zero is handled separately in 6.11.1. / Odd K-theory means the actual odd torsion subgroup; no general cyclicity is assumed. | Retained with the stated hypotheses. |
| 6.11.10 Integral symmetrization cofiber | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.11.11 Integral quadratic Grothendieck–Witt groups | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.11.12 Skew integral symmetrization cofiber | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.11.13 Low skew-duality K homotopy orbits | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |
| 6.11.14 Integral skew-quadratic Grothendieck–Witt groups | The conclusion retains every stated hypothesis and normalization. | Retained with the stated hypotheses. |

## All 147 packet lemma nodes

This inventory links every input lemma to the final target audit. The three removed lemmas are accounted for by their native suppliers, not silently dropped. “Retained” is subject to the target table and gap disposition above. Packet ids here are review bookkeeping, not roadmap prose.

| Packet lemma (GN stage / slug) | Final target or native supplier |
| --- | --- |
| GN.0/gram-det-orthonormal-coordinates | Mathlib LinearMap.normDet_sq_eq_det_gram (removed duplicate) |
| GN.0/orthonormal-coordinate-hadamard | 0.1.1 Hadamard bound in orthonormal coordinates |
| GN.0/gram-uniform-bound | 0.1.3 Uniform Gram determinant bound |
| GN.0/covolume-square-gram | Tau Ceti ZLattice.covolume_sq_eq_det_gram (removed duplicate) |
| GN.1/ordered-tail-product | 1.1.1 Ordered tail product inequality |
| GN.1/orthonormal-cube-volume | 1.1.3 Intrinsic volume of an orthonormal cube |
| GN.1/inscribed-cube | 1.1.4 A cube inside the Euclidean unit ball |
| GN.0/saturated-adapted-basis | 0.2.1 Integral basis adapted to a primitive intersection |
| GN.0/projected-adapted-basis | 0.2.2 Basis of the projected lattice |
| GN.0/gram-det-adapted-projection | 0.2.3 Gram determinant factorization under orthogonal projection |
| GN.0/gram-det-biorthogonal | 0.2.4 Gram determinants of biorthogonal bases |
| GN.0/dual-projection-comap | 0.2.5 Dual of a projected integral submodule |
| GN.0/orthogonal-intersection-basis | 0.2.6 Full orthogonal intersection in a self-dual lattice |
| GN.1/finite-gauge-sublevel | 1.2.2 Finite lattice points below a gauge bound |
| GN.1/minimum-outside-subspace | 1.2.3 An attained least gauge outside a proper subspace |
| GN.1/greedy-minimum-family | 1.2.4 A greedy independent family with a strict-sublevel flag |
| GN.1/successive-minimum-is-least | 1.2.5 Attainment of the rank threshold |
| GN.1/successive-minimum-pos | 1.2.6 Positivity of each successive minimum |
| GN.1/successive-minimum-monotone | 1.2.7 Ordering of successive minima |
| GN.1/successive-minimum-le-iff | 1.2.8 Closed-dilate rank characterization |
| GN.1/successive-minimum-antitone-body | 1.2.10 Larger bodies have smaller minima |
| GN.1/successive-minimum-monotone-lattice | 1.2.11 Sublattices have larger minima |
| GN.1/successive-minimum-smul-body | 1.2.12 Positive body scaling inverts the minima |
| GN.1/successive-minimum-linear-equiv | 1.2.13 Invariance under a simultaneous linear change |
| GN.1/successive-minimum-first | 1.2.14 The first minimum detects a nonzero lattice point |
| GN.1/weighted-crosspolytope-volume | 1.3.1 Volume of a weighted cross-polytope in basis coordinates |
| GN.1/crosspolytope-containment | 1.3.2 A symmetric body contains its weighted inscribed cross-polytope |
| GN.1/lattice-determinant-lower-bound | 1.3.3 An independent lattice family has determinant at least the covolume |
| GN.1/linear-forms-box-volume | 1.4.1 Volume of a closed linear-forms parallelepiped |
| GN.4/coset-difference-bound | 4.1.1 Counting by differences in finite-index cosets |
| GN.4/residue-separation-count | 4.1.3 Counting separated points in integral basis residues |
| GN.4/homothetic-lattice-avoidance | 4.1.4 Excluding nonzero points in a dilated sublattice |
| GN.0/prescribed-primitive-basis | 0.2.7 Complete a prescribed primitive-intersection basis |
| GN.0/integral-rational-flag | 0.2.8 Integral basis adapted to a rational complete flag |
| GN.1/integral-minimum-flag | 1.2.15 Integral basis for the strict minimum flag |
| GN.4/divisible-rounding-step | 4.1.6 One step of divisibility-compatible rounding |
| GN.4/divisible-rounding-chain | 4.1.7 Backward rounding along a divisibility chain |
| GN.4/divisible-rounding-product | 4.1.8 Strict product loss from backward rounding |
| GN.4/diagonal-span-coordinates | 4.1.9 Coordinate membership in a diagonal sublattice |
| GN.4/diagonal-span-index | 4.1.10 Index of a diagonal sublattice |
| GN.4/diagonal-lattice-avoidance | 4.1.11 Diagonal sublattice avoids the doubled body |
| GN.1/finite-interior-disjoint-volume | 1.5.1 Volume of interior-disjoint convex translates |
| GN.1/finite-translate-section | 1.5.2 Sections of a finite translated union |
| GN.1/convex-section-enlargement | 1.5.3 Translation containment of an enlarged convex section |
| GN.1/section-union-volume-monotone | 1.5.4 Section-volume monotonicity under partial dilation |
| GN.1/partial-dilation-union-volume | 1.5.5 Volume monotonicity of partially dilated unions |
| GN.1/complementary-dilation-union | 1.5.6 Complementary coordinate dilation of a union |
| GN.1/gauge-linear-equiv | 1.5.8 Gauge under an invertible linear change |
| GN.1/convex-cluster-intersection-null | 1.5.9 Null intersection of separated convex clusters |
| GN.1/clustered-translate-volume | 1.5.10 Additive volume of transverse translate clusters |
| GN.1/strict-flag-translate-separation | 1.5.11 Separation outside a strict gauge flag |
| GN.1/lattice-box-row-volume | 1.5.12 Volume factorization by lattice-box rows |
| GN.1/coordinate-transverse-union-volume | 1.5.13 Codimension growth in prefix coordinates |
| GN.1/successive-box-volume-ratio | 1.5.14 Consecutive-threshold lattice-box volume inequality |
| GN.1/first-box-volume | 1.5.15 Initial lattice-box translate volume |
| GN.1/outer-lattice-box-volume | 1.5.16 Uniform enclosing box for lattice translates |
| GN.1/weighted-ratio-product | 1.5.17 Telescoping product with descending exponents |
| GN.1/weighted-volume-chain | 1.5.18 Accumulate the consecutive volume inequalities |
| GN.1/large-box-comparison-limit | 1.5.19 Pass a uniform box comparison to the limit |
| GN.5/lll-gram-schmidt-growth | 5.1.3 Growth bound for reduced orthogonal lengths |
| GN.3/empty-generic-density-zero | 3.2.3 Eventually empty integral representation counts |
| GN.2/lattice-inclusion-localizations | 2.2.3 Integral lattice inclusion detected locally |
| GN.6/isotropic-reduction-metabolic | 6.3.8 Metabolic comparison for isotropic reduction |
| GN.6/symmetric-diagonal-lagrangian | 6.2.8 Diagonal Lagrangian for opposite forms |
| GN.6/witt-hyperbolic-cokernel | 6.4.5 Witt group as the hyperbolic cokernel |
| GN.6/hermitian-cone-contractible | 6.7.16 Contractibility of the hermitian cone space |
| GN.5/lll-nearest-integer | 5.2.2 Nearest integer residual |
| GN.5/lll-shear-certificate | 5.2.3 Integral shear certificate |
| GN.5/lll-shear-gram-schmidt | 5.2.4 Shear preserves orthogonalized vectors |
| GN.5/lll-shear-coefficients | 5.2.5 Shear coefficient update |
| GN.5/lll-descending-size-reduction | 5.2.6 Descending size reduction |
| GN.5/lll-swap-certificate | 5.2.7 Adjacent swap certificate |
| GN.5/lll-swap-first-vector | 5.2.8 First swapped orthogonal vector |
| GN.5/lll-swap-second-vector | 5.2.9 Second swapped orthogonal vector |
| GN.5/lll-swap-later-coefficients | 5.2.10 Later swapped coefficients |
| GN.5/lll-prefix-gram-product | 5.3.2 Prefix Gram product |
| GN.5/lll-prefix-gram-integral | 5.3.3 Integral positive prefix determinants |
| GN.5/lll-prefix-shear-invariant | 5.3.4 Shear prefix determinant invariance |
| GN.5/lll-prefix-swap-ratio | 5.3.5 Swap prefix determinant ratio |
| GN.5/lll-strict-potential-decrease | 5.3.6 Strict LLL potential decrease |
| GN.5/lll-prefix-invariant | 5.3.7 LLL prefix invariant |
| GN.5/lll-lexicographic-termination | 5.3.8 LLL lexicographic termination |
| GN.4/star-body-interior-ball | 4.5.3 Interior ball of a star body |
| GN.4/star-body-admissible-dilate | 4.5.4 Admissible dilation lattice |
| GN.4/critical-determinant-positive | 4.5.5 Positive critical determinant |
| GN.4/critical-minimizing-sequence | 4.5.6 Critical minimizing sequence |
| GN.4/star-admissibility-closed | 4.5.7 Closed admissibility under basis convergence |
| GN.4/gaussian-lattice-summable | 4.4.5 Gaussian lattice summability |
| GN.4/gaussian-lattice-poisson | 4.4.6 Gaussian lattice Poisson comparison |
| GN.4/gaussian-shift-maximum | 4.4.7 Shifted Gaussian maximum |
| GN.4/gaussian-scale-upper | 4.4.8 Gaussian scale upper bound |
| GN.4/gaussian-shifted-tail | 4.4.9 Shifted Gaussian tail bound |
| GN.4/gaussian-short-vector-error | 4.4.10 Dual Gaussian error bound |
| GN.4/gaussian-poisson-error | 4.4.11 Poisson approximation error |
| GN.4/gaussian-covering-contradiction | 4.4.12 Gaussian covering contradiction |
| GN.2/dual-quotient-primary-torsion | 2.5.1 Dual quotient is primary torsion |
| GN.2/dvr-torsion-decomposition-adapter | 2.5.2 DVR torsion decomposition comparison |
| GN.2/dvr-graded-slice-count | 2.5.3 DVR graded slice count |
| GN.2/dvr-ordered-exponent-uniqueness | 2.5.4 Ordered elementary divisor uniqueness |
| GN.2/dvr-uniformizer-independence | 2.5.5 Uniformizer independence |
| GN.2/dvr-length-cardinality-adapter | 2.5.6 DVR length and cardinality comparison |
| GN.2/atomic-minimal-polar-pivot | 2.6.2 Minimal polar pivot |
| GN.2/atomic-odd-pivot-diagonal | 2.6.3 Odd pivot diagonalization |
| GN.2/atomic-unary-complement | 2.6.4 Unary integral complement |
| GN.2/atomic-binary-pivot-normalization | 2.6.5 Dyadic binary pivot normalization |
| GN.2/atomic-binary-determinant-valuation | 2.6.6 Binary determinant valuation |
| GN.2/atomic-binary-integral-complement | 2.6.7 Binary integral complement |
| GN.2/atomic-block-extraction | 2.6.8 Atomic block extraction |
| GN.2/atomic-rank-termination | 2.6.9 Atomic splitting termination |
| GN.2/atomic-corrected-square-completion | 2.6.10 Corrected square completion |
| GN.2/spinor-reflection-product | Tau Ceti CliffordAlgebra.spinorNorm; OrthogonalSpinGroups 1D (removed duplicate) |
| GN.2/spinor-unimodular-stabilizer | 2.4.2 Nondyadic unimodular spinor image |
| GN.2/spinor-adelic-norm | 2.4.3 Adelic spinor norm |
| GN.2/spinor-stabilizer-quotient | 2.4.4 Proper spinor stabilizer quotient |
| GN.6/exact-short-five-lemma | 6.3.2 Exact short five lemma |
| GN.6/isotropic-pairing-descent | 6.3.3 Isotropic pairing descends |
| GN.6/isotropic-quotient-symmetry | 6.3.4 Isotropic quotient symmetry |
| GN.6/isotropic-quotient-perfect | 6.3.5 Isotropic quotient is perfect |
| GN.6/isotropic-graph-lagrangian | 6.3.6 Isotropic graph is Lagrangian |
| GN.6/hermitian-q-span-setoid | 6.5.2 Hermitian Q representative equivalence |
| GN.6/hermitian-q-pullback-closure | 6.5.3 Hermitian Q pullback closure |
| GN.6/hermitian-q-composition-congr | 6.5.4 Hermitian Q composition respects representatives |
| GN.6/hermitian-q-identities | 6.5.5 Hermitian Q identity laws |
| GN.6/hermitian-q-associativity | 6.5.6 Hermitian Q associativity |
| GN.6/cofinal-object-complement | 6.6.1 Cofinal object complement |
| GN.6/cofinal-hermitian-comma-contraction | 6.6.2 Cofinal hermitian comma contraction |
| GN.6/cone-pointwise-extension-closed | 6.7.2 Cone diagrams are extension closed |
| GN.6/cone-duality-exchanges-shifts | 6.7.4 Cone duality exchanges shifts |
| GN.6/cone-fraction-composition | 6.7.6 Cone fraction composition laws |
| GN.6/cone-localization-exactness | 6.7.7 Cone localization exactness |
| GN.6/cone-constant-fully-faithful | 6.7.8 Constant cone embedding is fully exact |
| GN.6/cone-constant-filtering | 6.7.9 Constant cone embedding is s-filtering |
| GN.6/cone-relative-quotient-equivalence | 6.7.10 Relative cone quotient equivalence |
| GN.6/cone-swindle-descends | 6.7.13 Cone swindle descends to localization |
| GN.6/cone-swindle-absorption | 6.7.14 Hermitian swindle absorption |
| GN.6/integer-symmetrization-cofiber | 6.11.10 Integral symmetrization cofiber |
| GN.6/integer-skew-symmetrization-cofiber | 6.11.12 Skew integral symmetrization cofiber |
| GN.6/integer-skew-homotopy-orbits | 6.11.13 Low skew-duality K homotopy orbits |
| GN.2/quaternion-order-star-stability | 2.8.2 Quaternion order involution stability |
| GN.2/quaternion-right-twisted-dual | 2.8.3 Quaternion right twisted dual |
| GN.2/quaternion-unit-diagonal-regular | 2.8.4 Unit diagonal quaternion regularity |
| GN.2/quaternion-split-stabilizer | 2.8.5 Split quaternion stabilizer comparison |
| GN.6/formation-hyperbolic-kernel | 6.8.4 Formation detects hyperbolic kernel |
| GN.2/odd-local-quadratic-norms | 2.9.1 Odd local quadratic norms |
| GN.2/signed-transfer-image-independent | 2.9.7 Signed transfer image independence |
| GN.2/signed-transfer-maximal-element | 2.9.8 Signed transfer maximal element |
| GN.2/signed-transfer-parity-injectivity | 2.9.9 Signed transfer parity injectivity |

## Disposition of the 54 inherited gap records

“Planned obligation” means the package names the target but its implementation/adapter remains required; it does not mean the result is formalized. Consumer-owned and native-supplier items are distinguished from genuine missing proof contracts. Where the new package text resolves only a constant or signature, that partial resolution is stated.

| Input gap | Review disposition |
| --- | --- |
| Number-field metric comparison and integer-vector norm floor | Consumer-owned weighted metric; native mixed-embedding covolume is deferred, not replanned. |
| Full GN.1 source coverage and upstream minimum compatibility | General convex-body product/witness targets are present; compatibility with squared Euclidean minima remains a planned comparison. |
| GN.2 primary-source and proof decomposition | Field suppliers mapped to current roadmaps; the integral/local/hermitian adapters remain target-level obligations. |
| GN.3 primary-source and proof decomposition | G1–G3 remain: density proofs, number-ring finiteness, measures/models and theta comparison are not supplied by generic definitions. |
| GN.4 primary-source and proof decomposition | G3–G5 remain: Davenport, dynamics, upper transference and mean-value original proof inputs. |
| GN.5 primary-source and proof decomposition | Certified LLL transition, integer potential and termination targets are present; exact arithmetic spot checks pass. |
| GN.6 primary-source and proof decomposition | Exact-duality/Q/cone/formation targets present; G6–G7 derived/spectrum/quotient interfaces remain. |
| Proof execution | All admitted bodies remain planning obligations; elaboration is not proof execution. |
| Localization image adapter | Localization target and three controls present; its coefficient-ring/scalar-extension adapter is explicitly omitted in Lean. |
| Completion and finite-quotient adapters | Completion descent has the correct DVR domain; injection, finite-quotient and scalar-extension adapters remain obligations. |
| Dyadic spinor stabilizers and strong-approximation hypotheses | Nondyadic target retains odd-residue assumptions; no dyadic stabilizer or unconditional strong approximation is asserted. |
| Hermitian inverse-Gram and scalar-change proof | Dual lattice definition/tests present; local inverse-Gram finite generation and scalar-change proof are still required. |
| Finite hermitian vector counting proof | G1; small finite-field counts checked, but the general counting proof remains. |
| Hermitian density existence and normalization proof | G1; nonempty density-limit existence is now explicitly marked. |
| Integral Siegel polynomial existence | G1; polynomial existence/integrality is not obtained by defining a density. |
| Overlattice stratum lifting and smoothness | G1; smooth models and normalized lifting counts now explicitly marked. |
| Siegel-series functional-equation proof | G1; functional-equation proof now explicitly marked. |
| Classical hermitian homotopy-fibre carrier | Path-fibre definition is typed; added three Bool tests. The comparison with Q/GW realization remains a planned construction. |
| Quaternionic integral module and classification source | Quaternion carrier scoped to an actual fraction field/order; classification proof/model obligations retained. |
| Totally positive restriction-of-scalars metric | G2; archimedean restriction-of-scalars metric comparison now explicitly marked. |
| Definite genus finite representative theorem | G2; number-ring class-set finiteness now explicitly marked; finite volume is insufficient. |
| Tamagawa normalization and explicit mass factors | G2; explicit maximal local table and mass/proper bridge added; Tamagawa/model proof inputs remain. |
| Theta-kernel integral lattice adapter | G3; theta specialization remains a comparison, not a replacement theta theory. |
| Corrected Davenport/Rogers proof and semialgebraic carrier | G3; corrected original multiset/projection proof and carrier contract not established. |
| Howe–Moore source proof and unitary representation adapter | G4; matrix-coefficient/representation argument not supplied by Lie-group structure. |
| L² ergodicity characterization and quotient action | G4; L² invariant-vector and action comparison remains. |
| Dani–Margulis nondivergence proof | G4; quantitative nondivergence remains; Minkowski alone is insufficient. |
| Ratner orbit and measure rigidity proof | G4; recurrence is not orbit rigidity. |
| Ratner ergodic measure proof | G4; original measure-classification proof remains. |
| Oppenheim auxiliary Lie and arithmetic lemmas | G4; dimension-three Lie/arithmetic reductions remain; binary negative control checked. |
| Duke theta and coefficient estimates | G3; harmonic theta/cusp-form and ineffective lower-bound comparisons remain. |
| Polar-body carrier and upper transference theorem | Polar/dual definitions retained; G5 all-index upper bound is not supplied by the lower bound. |
| Mahler bounded basis and quotient topology | Minimum/basis compactness targets present; matching bounded-basis and quotient topology remains an interface obligation. |
| Original Siegel mean-value proof | G5; original mean-value proof acquisition remains; n≥2 prevents the rank-one counterexample. |
| Coding edge and real metric adapter | Code-lattice source corrected; real covolume/index adapter remains the distinct owned target. |
| Derived duality carrier owned by HermitianKTheoryOfPoincareCategories | G6; derived dualizing-line construction cannot be imported from an unlisted higher owner. |
| Symmetric dévissage framework and original inputs | G6; stable symmetric dévissage is not Schlichting exact filtering localization. |
| s-filtering quotient and full Schlichting localization proof | G7; general filtering quotient/duality API and four conditions remain. |
| Classical dg comparison and Karoubi proof | G6; dg weak-equivalence/duality and exact comparison remains. |
| Even finite-field comparison and finite-vcd₂ theorem | G6; finite-vcd₂ and even-residue comparison inputs remain. |
| Original upper transference proof | G5; Regev endpoint proof inspected, original all-index proof unavailable. |
| Original maximal mass theorem and complete local table | Explicit type/sign/λ table added and primary GHY mass source read; integral-model proof remains G2. |
| Mass zeta and archimedean normalization imports | G2; archimedean factors, measure compatibility and zeta conversion remain. |
| Native spectrum and hyperbolic suspension comparison | G6; genuine spectrum and hyperbolic suspension comparison remain. |
| Ratner time-average selection and escape control | G4; limit selection and no escape now explicitly marked. |
| Consumer weighted arithmetic metric adapter | Consumer-owned weighted arithmetic metric; no duplicate native embedding theorem. |
| Compact local-coordinate substrate for eventual emptiness | Eventual-empty target retains compact finite-residue local assumptions; coordinate-topology adapter remains. |
| Hermitian additivity, cone and completion interfaces | Cone/common-shift API strengthened and native duality used; cone completion/additivity proof obligations remain. |
| Actual s-filtering exact quotient and derived-duality suppliers | G6–G7; ordinary quotient alone is insufficient for derived and hermitian quotients. |
| Prototype API and concrete test completion | 62 API-bearing definitions have ≥3 README checks; 391 admitted Lean examples elaborate. Untyped framework constructions are listed explicitly; no implementation claim. |
| Arithmetic GW flavour and table framework | All eight arithmetic table rows sourced and checked; G6 framework needed for their meaning remains. |
| Split quaternion Morita and alternating PID classification | Actual split quaternion/Morita and alternating PID classification comparison remains an interface obligation. |
| Signed hermitian Witt and transfer proof inputs | Original cited transfer proof read and 2≠0 retained; signed-hermitian Witt/decomposition comparison remains distinct from trivial-involution field Witt. |
| Generic lattice Poisson summation and Fourier comparison | Poisson phase/prefactor and positive-rank denominator checked; general lattice Fourier/summability comparison remains a target, not a native theorem assumption. |
