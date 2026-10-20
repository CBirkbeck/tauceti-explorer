# Independent package review: Drinfeld modules and t-motives

Issue [#10896](https://github.com/CBirkbeck/tauceti-explorer/issues/10896), `REV-PKG-DrinfeldModulesAndTModules`. Codex, session `codex-d9Eqct`, 2026-10-20. **Completed independent review; verdict: `needs_changes`.** The reviewer did not write the package. This submission completes the review, rather than handing an unfinished review to another worker.

## Remaining defect and required resolution

The four shared linearized-polynomial contracts imported from **FiniteFieldsAndCharacterSums** still have no established upstream supplier. They are early FF.0 foundations in the reconciled parent plan, with legacy FF.4 target identifiers. Their ownership was not transferred by the move of analytic character sums to AnalyticNumberTheory.

| Missing supplier contract | Required generality and output | Consumers |
| --- | --- | --- |
| `frobenius-ore-polynomial-comparison` | Every commutative F-algebra R, including nonreduced R: identify R{τ} with q-linearized polynomials, with multiplication corresponding to composition on all value algebras. | §§0.1–0.10, 4.9 and the motive dictionary |
| `linearized-polynomial-eval-linear` | Evaluation of a q-linearized polynomial is F-linear, naturally under coefficient and value-algebra extension. | Drinfeld actions, kernels, lattices and torsion |
| `linearized-polynomial-separable-iff` | Over a field, a nonzero q-linearized polynomial is separable iff its X-coefficient is nonzero; over a splitting field its number of distinct roots is q to its τ-degree in the separable case. Relative unit-derivative statements must use the appropriate ring hypotheses. | §§0.7–0.8, 1.6–1.7, 2.5 |
| `subspace-polynomial-is-linearized` | For every finite F-subspace U of a coefficient field, the monic product over u in U of (X−u) is q-linearized, of τ-degree dim_F U. | Lattice products and isogenies in DM.2 |

I checked the current upstream main tree and searched upstream PRs by supplier name and by finite-field/linearized-polynomial objects. The four outputs were not found. The p-centre use of linearized polynomials is not this general contract. Mathlib's skew-polynomial carrier also does not supply it. The package correctly imports these definitions rather than rebuilding another roadmap's theory. Fixing this remaining defect requires the supplier's upstream package, or an authorized coordinated ownership change; neither can be produced by editing this review's permitted files. No foreign packet or roadmap was changed.

The Lang/Weil-restriction and Tannakian imports are **not** repeated as missing-supplier findings. PROTOCOL §15 includes tracked open upstream roadmap PRs. I read the actual contracts in [ReductiveGroupsPartII PR #785](https://github.com/TauCetiProject/TauCetiRoadmap/pull/785), head `0d37c3f452ad9769ad7bfc257b5f283091814d85`, and [MotivesAndAlgebraicCycles PR #1313](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1313), head `c3dad319dd28b8dec9dca85265421575049bd5dc`. RG2.0a.2 allows finite locally free coefficient algebras, including nonreduced ones, and RG2.3.7 supplies geometric Lang surjectivity. The specialization to finite algebras and separably closed fields is proved in §1.3. Motives §§6.1–6.3 gives general neutral reconstruction, tensor generation and group-map criteria over arbitrary fields, so it applies over the imperfect field F_q(t). These PRs remain open; #1313 is a draft. This is a dependency on their recorded contracts, not a claim that either has merged or been formalized. The order file assigns no Drinfeld tier; I did not invent one or infer an upward edge from its absence.

## Scope, form, fidelity and duplication

I read WORKERS, PACKAGE_REVIEW, PROTOCOL (including §§5, 13, 15, 20), the expansion protocol and UPSTREAM_GUIDE. The two principal form comparisons were AlgebraicCurves and ClassFieldTheory; I also inspected the current Completed RestrictedProducts roadmap and current supplier prose/signatures. The package has the upstream summary, boundaries, conventions, exact supplier contracts, ordered layers, APIs, Checks, examples and references. `metadata.toml` remains the fitting single line `topic = "math.NT"`. No process narrative was added to the README or Lean file.

The plan comparison covered both accepted constituent packets (75 DM.0-family nodes and 48 DM.8 nodes), the parent packet's 11 targets, and the reviewed library-coverage audit. All 123 constituent anchors resolve in the README, including the existing supplier-interface anchor for restricted-series preparation. The parent pre-t-motive/rationalization/rigidity targets are grouped in §4.12, Anderson comparison in §8.18, five arithmetic estimates in §8.38, and the two auxiliary-row targets in §8.39. The broad rationalization target needed restoration, described below. The revised README retains **all 137 numbered target sections and all 137 Checks lists**; hypotheses and tests were added, not discarded to shorten it. General A, nonprincipal ideals, non-rational infinity, arbitrary positive rank, imperfect coefficient fields where allowed, and arbitrary base schemes remain covered. Polynomial, analytic and Taelman specializations are explicit.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. I checked the read-only current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and roadmap checkout `0d144d044dacebca17b654695b6f1ad58f159b27`, including the nine post-snapshot roadmaps and Completed roadmaps. The roadmap checkout has pre-existing uncommitted files in the reductive/adelic/Hecke/smooth-representation bundle; these were not treated as merged main or edited. To cover newer suppliers I fetched individual SchemeAndStackFoundations, RestrictedPowerSeries and NewtonPolygons READMEs at upstream main `0e8b058a97cc4f9401d2679313e0e937761c1024`, and checked the current directory tree and the two PR contracts above. No repository was copied or cloned, and no build ran in either read-only checkout.

Object searches included Frobenius-semilinear fixed vectors, finite-algebra coefficient Frobenius, additive polynomial actions and group-scheme kernels, characteristic-polynomial cardinalities, finite-field nuclear determinants, section rings and graded spaces, restricted-series factorization, motives and local shtukas. Existing carriers and the general Lang/Tannaka constructions remain imports. In particular:

- Current `TauCeti.GaloisDescent.liftBaseChange_injective_of_invariant` in `RepresentationTheory/GaloisDescent/Injective.lean` assumes a finite Galois extension and a representation of its entire Galois group. It does not give §§8.1–8.9 for one arbitrary automorphism, arbitrary extensions and possibly noninvertible semilinear maps.
- Mathlib `Algebra.isGeometricallyReduced_field_iff` in `RingTheory/Nilpotent/GeometricallyReduced.lean` identifies reducedness after algebraic-closure base change. It does not already supply the full Mac Lane/p-basis criterion in §8.13.
- Tau Ceti's abelian-group ℤ_p Tate module differs from the intrinsic A_λ realization here. Complex nuclear operators do not give the determinant on compact F-vector spaces. RestrictedPowerSeries preparation and units already occur only as imported contracts, not duplicated targets.

**No additional complete target was removed in this review.** The prior removal of restricted-series preparation remains correct. No theorem of Tate's thesis is planned or cited as a theorem source.

## Corrections applied

| Sections | Defect and applied correction |
| --- | --- |
| 0.11 | Transcendence makes Carlitz product factors nonzero, not units in any coefficient ring. Reciprocals now belong to a coefficient field or explicit localization; F[θ] is the negative control. The product citation now uses accessible BP §2.2 and Pap §1.2.2. |
| 2.1 | Separated the general coefficient-ring automorphism, which matches the Lean definition, from inverse Frobenius on a perfect field and the normed hypotheses required for analytic subrings. |
| Conventions, 2.6, 4.6, 8.18 | Analytic uniformization uses the fixed infinite-place characteristic inclusion. Injectivity alone does not imply norm θ greater than one: t↦θ⁻¹ is the counterexample. |
| 4.5 | The zero motive cannot determine a numerical weight by dividing d/r. It is pure by convention; the weight and u/v comparison require positive rank. |
| 4.7 and Lean docstring | Positive tensor powers require n≥1. The raw empty matrix at n=0 is distinct from the rank-one unit pre-t-motive C(0). |
| 1.1 | Corrected the d-dimensional additive-group motive to the row module R{τ}^(1×d), made connectedness relative to geometric fibres, and exempted the zero shtuka from the false nilpotent-implies-nonétale assertion. |
| 1.6 | Made the main iff explicitly about Drinfeld modules. The Anderson generalization allows dimension-zero fibres; a zero module has trivial étale torsion even at the characteristic. The positive-dimensional Jacobian argument is now stated with its missing hypothesis. |
| 5.1, 5.8 | Added same-characteristic isogeny factorization through a nonzero A-scalar. The simplicity proof now distinguishes γ from its Frobenius twist and A_L-torsion from A-torsion. The ideal generated by τ is the negative control. Stalder p.3 states semisimplicity, so simplicity is attributed to the supplied argument, using Theorem 2.17(d) and Proposition 2.20, not to that sentence. |
| 4.12, 8.15 | Matched the analytic C_∞-coefficient application with the algebraic k̄(t) category by stating the construction over any perfect coefficient field containing F_q(θ). Added compatible scalar extension and finite-dimensional Hom spaces. The arithmetic Tannakian category still uses k̄(t). Forward τ and its inverse after rationalization have the same fixed comparison. |
| 4.12 | Restored the parent's rationalization for **all broad effective dual motives**, not just A-finite objects. The characteristic-supported cokernel vanishes after localization. The unit effective object is a non-A-finite test. |
| 8.18 | Torsion points are dual to motive τ-invariants, with the intrinsic Hom_F(A/(a),F) coefficient line; they are not those invariants themselves. Corrected the proof to use §1.7 and Har Proposition 6.5/Theorem 6.6. |
| 8.19 | A polynomial matrix with characteristic-supported determinant need not come from an A-finite object. The conclusion about such an H is now conditional; Φ=1 is the counterexample. The general integral-trivialization theorem is retained. |
| 7.1, 7.4 | Morphism degrees over arbitrary S are locally bounded, and glue. A global bound follows for quasicompact S. The disjoint union with component maps C_(t^n) tests why a single global bound would lose morphisms. |
| 8.10 | Added an entire transcendental constant as a negative control for the arithmetic coefficient condition. |
| Lean 1.3 | Added light real-bodied `IsLangBasis` and `coefficientFrobenius` definitions. Their two positive examples test a basis equation with invertible determinant and the two pure-tensor formulas. The finite-field, singular-matrix and square-zero examples are recorded negative controls, not unrelated calculations. |

Every definition's Checks list was inspected for a computed example, boundary or plausible wrong definition. The additions above repair the identified failures. No source text, source file, or section-by-section source synopsis is included.

## Source verification

The independent sample uses `random.Random(10896).sample(targets, 15)` in the original 137-heading document order. No packet/source locator was flagged unverified. Each listed public source was opened and its cited passage read; the following records the result in my own words, not an excerpt.

| Sampled § | Verified locator | Result |
| --- | --- | --- |
| 3.1 | HY equation (2.4), p.7; Theorem 2.3, p.8 | Full level and level-moduli hypotheses agree. |
| 8.29 | Pap Corollary 4.2.5, p.24 | Difference-simplicity agrees, with exact constants. |
| 8.30 | Pap Lemma 4.2.7, p.25 | Ideal descent is over the simple solution ring. |
| 2.8 | BP §2.2, pp.3–5; Pap §1.2.2, p.4 | D_i, signed ℓ_i and the strict logarithm radius agree. |
| 2.7 | BP §2.4, pp.6–7 | The lattice-morphism product uses the source exponential; zero scalar is separate. |
| 3.8 | Pin Lemma 5.1, p.19; Theorem 5.3, Definition 5.4, Proposition 5.5, Theorem 5.6, p.20; Theorem 5.7, p.21 | Dual Lie line, modular forms and section formulas agree. |
| 8.11 | Pap Lemmas 2.2.6–2.2.7, p.8 | Limits may have constants in F̄_q, rather than F_q. |
| 6.9 | Tae Definitions 6–7 and Proposition 12, pp.385–386 | Local isometry and tangency requirements agree. |
| 6.12 | Tha §§2.2–2.3, pp.536–537 | The depth-one identity has the stated range 1≤s≤q. |
| 8.50 | Pap Lemma 6.4.1, pp.37–38 | Small-log division agrees; zero exponential needs the separate period case. |
| 8.47 | Pap Lemma 3.5.3/Theorem 3.5.4, pp.20–21; ABP §3.1.2, p.8 | Carlitz group and period statement agree; graded coefficients are F_q(t). |
| 3.2 | HY Theorem 2.3, p.8; Definition 2.6, Lemma 2.7, Proposition 2.8, pp.10–11 | Fine level is distinguished from coarse quotients. |
| 5.8 | BP §4.2, p.16; Sta p.3, Theorem 2.17(d), pp.9–10, Proposition 2.20, p.10 | Repaired the attribution and the same-characteristic rationalization step. |
| 0.2 | BP §2.3, p.5 | Leading-term degree computation agrees for nonzero a. |
| 4.9 | BP §4.4, pp.17–18 | Star reverses products and transposes matrices. |

Additional correction checks used Har Definitions 4.1–4.5, pp.12–14, Theorem 6.4, pp.24–26, Proposition 6.5/Theorem 6.6, p.26; BP §4.1 and Theorem 4.2, pp.15–16, §4.5, p.18; Pap §§3.2–3.3, pp.9–15; and Wie Definition 5.1, pp.72–73, and arbitrary-base treatment §5.4, pp.80–84. Wiedmann keeps the period r·deg(∞), so no rational-place shortcut was introduced. Stacks Lemma 10.44.2, Tag 030W, was also read for the general separability distinction. ND locators were outside the sample and are not claimed as independently verified; the Deligne–Milne endpoint returned HTTP 406 and was not counted as read. The changed product claim now has BP/Pap locators, and abstract Tannaka is imported from its actual owner. No uncleared book or alternate copy of a restricted book was used.

For reproducibility, the public PDFs used by the sample have these SHA-256 hashes (accessed 2026-10-20; URLs are the package's versioned references):

| Source | SHA-256 |
| --- | --- |
| BP | `08b68132a113d44e588d95fbf4995f68d350f84cf212d24b716263d69272b82d` |
| Pap | `6b5d3436da4d309fa77de77d23a0ed1781ee7fe90c544e55a229ef5cae026cf3` |
| Pin | `408d485d17dbede3ae02b9b90f132a37947d567e8f2697bdcb6c6cb8c41c9639` |
| Tae | `46699398350f09a5e9baf53ae7b414102633fa86c0fc1abc11dee82ee6d0032d` |
| Har | `bca3f51ed9bf5f215a12bdf2390b4718cb3a951a3e71c01fb87541fefafcd31f` |
| Sta | `ba000e658d82e781d46e5f550c221e100516c46ea881cd23c68bae5da063142a` |
| Tha | `d31f4a4be1e6cb1aaf9bdc574070066b1057f043df3ec437cd71784c0933168f` |
| HY | `7c4fe158c3503fc2e7096ea237c1e1932dfa074b3a62416e6040c92d773da2af` |
| ABP | `a22c328ea63a1d2d43309bc125b5f377c88d853ff0f1b21039fba14b924ff8c2` |
| Wie | `dfb9028260ce487088763691bf55b9644a9598976fa9db183b936c491fec828d` |

## Lean signatures and verification

`Suggested.lean` has 697 lines. It uses one `import Mathlib`, one module docstring and the roadmap namespace, with light definitions over existing carriers. Heavy families, schemes, motives, analytic rings and Tannakian categories remain README targets and are named in the closing comment. No sorry-backed data definition, fabricated carrier, `True` placeholder, admitted example or auxiliary-lemma development was introduced.

The signature comparison covered more than the required ten signatures:

| Signatures | Hypotheses and witness checked |
| --- | --- |
| `DrinfeldModule`, `Hom`, `IsIsogeny` | Differential γ, F-constants and non-scalarity; zero versus identity morphism. |
| `natDegree_eq_rank_mul`, `natDegree_X_pos` | Polynomial A, a≠0 and positive rank; general A stays in the README. |
| `carlitz`, `carlitz_rank` | Any θ including zero; characteristic is ker γ. |
| `carlitzD_succ`, `carlitzEll_succ` | Any commutative F-algebra; signed recurrence and no unit claim. |
| `coefficientTwist` | Any ring automorphism; inverse Frobenius is a specialization, and t stays fixed. |
| Carlitz convergence, inverse and period theorems | Complete ultrametric field, norm θ=q, root ρ^(q−1)=−θ; strict logarithm radius. |
| `carlitzTensor` | n=1 and n=2 formulas; n=0 is only a raw empty matrix. |
| `semilinear_lang`, `semilinear_lang_finiteAlgebra` | Separably closed field, invertible linearization, arbitrary finite commutative D; coefficient Frobenius fixes D. |
| `finiteModuleCardinality`, its quotient theorem and `carlitzPowerSum_eq` | Polynomial cardinality, monic relation, zero module gives one; 1≤s≤q. |
| `linearIndependent_of_fixed`, `finrank_fixedSubmodule_le`, `bettiComparison_bijective_iff` | Exact constants and semilinearity; no unnecessary finite extension or operator invertibility; dimension assumptions only where needed. |
| `IsFundamentalMatrix`, `solutionSpace`, `solutionRing`, `degreeSpan` | Invertible determinant, equation direction, inverse determinant generator and degree-zero monomial one. |
| Carlitz transcendence/independence | Complete algebraically closed ultrametric field, algebraic exponentials, linear independence over F(θ); larger-carrier transfer is stated in the conventions. |

`lean-check` exited 0, with 25 warnings, all `declaration uses sorry`, and no errors. Every `example` is proved. The warning on the real-bodied Carlitz definition comes from proof fields, not a missing data body. Available memory was 80 GB before the one compilation; no language server or Lake build/update/cache command was started. Subsequent Lean edits only list additional README definitions in the closing comment.

## Adversarial mathematics pass

The table covers every numbered target, including retained statements. A successful boundary calculation is evidence for the audit, not a proof of the general theorem or a claim of formalization. Shared conventions were tested at q=2 and odd q; q=1 is impossible for a field. Degree uses δ at infinity, Ore multiplication gives (θ+τ)²=θ²+(θ+θ^q)τ+τ², inverse twists fix t, and matrix star transposes and reverses composition. Divisions require nonzero products or positive rank as corrected above. The F_q(t) coefficient field is allowed to be imperfect.

| Target(s) | Instance or calculation tried | Result |
| --- | --- | --- |
| 0.1 | Scalar action versus θ+τ; θ=0 has characteristic (t). | Non-scalarity retained. |
| 0.2–0.4 | a constant has degree zero; a=t² doubles τ-degree; δ>1 multiplies pole degree. | Nonzero a, positive rank and δ retained. |
| 0.5–0.7 | Carlitz θ=0; zero versus identity isogeny; τ intertwines Frobenius-twisted coefficients. | Nonzero isogeny and separability hypotheses retained. |
| 0.8 | τ gives Spec L[X]/X^q, length q with one geometric point. | Scheme degree kept separate from point count. |
| 0.9–0.10 | Nilpotent higher coefficients over a square-zero base versus a unit leading coefficient. | Relative rank and standardization hypotheses retained. |
| 0.11 | D₁=θ^q−θ is nonzero but nonunit in F[θ]; ℓ₁=−D₁. | Corrected units; odd-characteristic sign retained. |
| 2.1 | t fixed, non-F_q constant moved, product (t−a)(t−b). | Ring/analytic hypotheses separated. |
| 2.2–2.3 | Completion of a non-complete algebraic closure; nonprincipal rank-one ideal lattice; zero lattice. | Completeness and projectivity retained. |
| 2.4–2.5 | Zero lattice exponential z; Carlitz lattice; product derivative a rather than one for φ_a. | Normalization and finite subspace input retained. |
| 2.6 | t↦θ⁻¹ is injective with norm q⁻¹. | Fixed infinite-place inclusion made explicit. |
| 2.7 | Scalar 0; scalar θ on the Carlitz lattice gives C[t]. | Source exponential and zero case retained. |
| 2.8 | z=0, strict-radius boundary, odd q sign of ℓ₁. | Boundary terms do not tend to zero. |
| 2.9–2.11 | ρ↦cρ scales period by c; q=2 gives ρ=θ; Ω(θ)=−1/π. | Period sign and invariant power retained. |
| 4.1–4.4 | Zero module; scalar Φ_t=θI; rank-two Drinfeld motive is rank one over L{τ}. | Abelianness and variance remain conditions. |
| 4.5 | Zero lattice satisfies all u/v equalities; C tensor square has weight two. | Weight restricted to nonzero objects. |
| 4.6 | General t-module with proper exponential image. | Entire does not imply surjective; characteristic inclusion fixed. |
| 4.7 | n=1 gives θ+τ; n=2 gives (θx+y,θy+x^q); n=0 has empty matrix. | Distinguished unit pre-t-motive. |
| 4.8 | H=L[t], σ basis fixed, cokernel zero but not Ore finite. | Broad definition and separate A-finiteness retained. |
| 4.9 | (τa)*=aσ differs from σa; rectangular intertwiner transposes. | Reversal and handedness retained. |
| 4.10 | D=0, D=σ, diag(σ⁻¹,0), diag(σ⁻¹,σ⁻²), d=0. | Nilpotent part, nonnegative clearing exponents and Smith-rank convention retained. |
| 4.11 | Carlitz quotient by (σ−1) gives θx+x^q; replacing its F-image by an L-span changes it. | Additive quotient and both Ore finiteness conditions retained. |
| 4.12 | C⊗C∨=1; broad fixed-basis effective object; multiplication by θ is not a unit endomorphism. | Broad rationalization, scalar extension and coefficient scopes corrected. |
| 1.1 | V=0; rank-one zero Frobenius; d=2 additive group. | Zero étale exception, geometric connectedness and row rank corrected. |
| 1.2 | Rank zero gives degree one; rank-one identity gives constant F. | Anti-equivalence/co-Lie direction retained. |
| 1.3 | Empty matrix, singular rank-one, F₃ scalar 2, F₂ irreducible 2×2, D=F[ε]/ε², imperfect separably closed L. | Linearization, fixed coefficients and sidedness retained; direct definitions added. |
| 1.4–1.5 | Unit ideal gives trivial degree-one group; characteristic t^n torsion is connected; nonprincipal I. | Finite-flat scheme statement retained. |
| 1.6 | Zero Anderson module; C_t=τ at (t) versus (t−1). | Positive-dimensional converse corrected. |
| 1.7–1.9 | Degree-two residue field; z↦uz; geometric Frobenius acts on points by q^m-powers. | Dualizing line, intrinsic division module and basis conjugation retained. |
| 1.10–1.12 | Residue degree f>1 permutes factors; τ=z versus τ=1; supersingular t^n torsion. | Lifted residue coefficients, τ^f and full connected group schemes retained. |
| 3.1–3.3 | Repeated basis vector fails level; characteristic torsion cannot be constant étale; non-fine level leaves stabilizers. | Fine/coarse/stack distinctions retained. |
| 3.4–3.6 | Rank drop on boundary; reciprocal value at zero excluded; rank-one boundary empty. | Generalized-rank and weak-separation conditions retained. |
| 3.7 | Proper identity Spec F[u] and trivial ample line; section degree zero. | Full total-space normality argument and relative generality retained. |
| 3.8 | Rank two: P¹, q+1 cusps, ω=O(q); k=1 gives zero cusp forms. | Dimension and dual-Lie convention retained. |
| 3.9–3.10 | Identity Hecke correspondence; bad prime versus inverted level; boundary rank drop. | Trace/pullback direction and arithmetic base retained. |
| 5.1 | Degree-two residue tensor splits; residue parameter rescales trivialization. | Intrinsic duality retained; scalar-isogeny factorization added. |
| 5.2–5.4 | Zero Hom, rank-one endomorphisms, nonprincipal projective A-module; nonzero λ-divisibility. | Finite projective rather than free and saturation retained. |
| 5.5–5.7 | Completed ring differs from rational total quotient; finite field is finitely generated; arbitrary huge field excluded. | Period-ring, local-algebraization and Tate hypotheses retained. |
| 5.8 | L{τ}τ changes γ to γ^q; L{τ}φ_a becomes everything after A-localization. | Same-characteristic subobject and A-annihilator steps repaired. |
| 5.9 | Simple Drinfeld motive versus C⊕C tensor square. | Semisimplicity uses the finitely generated field hypotheses. |
| 6.1–6.2 | Zero finite module has cardinality 1; cyclic quotient has cardinality its monic relation. | Fitting/determinant and integral-model conventions retained. |
| 6.3–6.4 | Zero compact vector space; finite-dimensional determinant; contracting tail. | Nuclear compact finite-field setting retained. |
| 6.5–6.7 | Carlitz integral model has finite local Euler quotients, unit lattice and zero class module; θ³τ example has nonzero class. | Unit and class quotients not conflated. |
| 6.8–6.10 | Equal lattices have covolume 1; scaling reverses comparison if order exchanged; identity tangent map has determinant 1. | Covolume ratio and tangent determinant directions retained. |
| 6.11 | H=0 contributes polynomial 1; nonzero H contributes its monic cardinality. | Class-formula factor retained. |
| 6.12 | d=0 gives power sum 1; 1≤s≤q; p=2 and s=q. | Signed-product formula and exponent range retained. |
| 6.13 | q=2 gives π=(θ²+θ)log_C(1); E_t=θ+θ³τ has H=A/(t). | Nonzero class example and normalization retained. |
| 7.1–7.2 | Carlitz O(i); shift O(i+1) fails normalized Euler characteristic; absolute Frobenius changes curve degrees. | Relative Frobenius retained; local shift bounds corrected. |
| 7.3–7.4 | Rank-two chain; degree-one isogeny; infinitely many components with degrees n. | Contravariance retained; arbitrary-base morphisms glue with local bounds. |
| 7.5–7.7 | Carlitz factor t−θ fixes zero/pole; characteristic τ² has no separable torsion points. | Frobenius direction, coefficient-line duality and connected realization retained. |
| 8.1–8.4 | Conjugation on C, empty family, duplicate 1 with coefficients i and −i. | Independence and exact-constants hypotheses retained at the appropriate steps. |
| 8.5–8.9 | Zero space, conjugation, 2·id over Q; fixed basis versus basis i. | Injectivity separated from surjectivity, with no operator-invertibility shortcut. |
| 8.10 | Algebraic constant, transcendental constant, divergent sum of t^n. | Added arithmetic negative control. |
| 8.11–8.12 | Constant in F_(q²) outside F_q; norm<1 series; infinite F_q formal series. | F̄_q limit and restricted fixed-polynomial condition retained. |
| 8.13–8.14 | Purely inseparable t^(1/p), transcendental extension, fractional t-adic order. | General separability differs from algebraic separability. |
| 8.15–8.17 | Zero object, unit, σ-matrix t, singular solution matrix. | Scalar scope corrected; invertible fundamental basis retained. |
| 8.18 | Carlitz period lattice and torsion; second tensor power trivialized by Ω². | Torsion duality and analytic coefficient scope corrected. |
| 8.19 | Φ=1 has integral Ψ=1 but no Ore-finite lattice; Φ=t fails triviality. | Conditional A-finite conclusion corrected. |
| 8.20–8.23 | Unit, dual, tensor, exact sequence; degree-one G_m character and its inverse; characteristic-p unipotent representation. | Ordinary graded symmetry and general Tannakian supplier retained. |
| 8.24–8.25 | Conjugation C/R, identity with wrong constants; zero matrix gives zero solutions; empty rank. | Exact constants, separability and rank bound retained. |
| 8.26–8.27 | Ψ=1 gives base field; rank-one D=1⊗ψ divided by ψ⊗1; tensor product need not be a domain. | Inverse determinant and cocycle orientation retained. |
| 8.28–8.30 | Zero/unit ideal, (X−1), identity twist with excess constants, non-simple coefficient ring. | Exact constants and difference simplicity remain essential. |
| 8.31 | (u,v)↦(u,u⁻¹v); rank zero is trivial; rank one inverse gives antipode. | Right torsor and Hopf formulas retained on all algebras. |
| 8.32–8.35 | Unit motive has zero-dimensional group; Ω gives dimension one; infinitesimal group points do not detect a scheme. | Relative closedness, smoothness and scheme-level group identification retained. |
| 8.36–8.37 | Ω is entire; zero function excluded from zero counts; repeated zero counted with multiplicity. | Determinant support and nonzero-function hypotheses retained. |
| 8.38 | θ⁻¹ is not integral; r=s may have zero kernel; constant field F_(q^f) changes count. | Integrality, strict kernel inequality and full constant-field factor retained. |
| 8.39 | ψ=(1,t), lift (θ,−1) by (t,−1); ℓ=2,N=4 gives six unknowns/four constraints; zero auxiliary. | Polynomial rather than constant lift and zero/nonzero estimates retained. |
| 8.40–8.42 | (Ω,Ω) gives one relation; empty monomial family has span 1; rank-one block size d+1; numerical Hilbert polynomial over Q in p=2. | Saturation, constant monomial and Hilbert–Serre bridge retained. |
| 8.43 | Unit motive gives trdeg 0; Carlitz gives 1; determinant exponent zero. | Full period/dimension theorem retained. |
| 8.44–8.46 | α=0; small nonzero algebraic α; r=0 gives Carlitz system; lower-left entry gives the inverse twist. | ΩL_α rather than L_α is entire; extension orientation retained. |
| 8.47–8.49 | C⊗C∨=1; empty logarithm tuple; repeated logarithm; nonreduced subgroup cannot be tested only on fields. | G_m and vector-kernel relations retained. |
| 8.50–8.51 | exp_C λ=0; division to small logarithms; q=2 period/log dependence versus q>2. | Separate period case and linear-independence hypothesis retained. |
| 8.52 | Denominator 1, denominator t−1 fixed, denominator t−θ not fixed. | Denominator lies in constant polynomials, not generally constant scalars. |

## Final checks

- `lean-check` — exit 0, 25 sorry warnings only; all examples proved.
- `scripts/check_sorry_data.py` — exit 0.
- `scripts/check_blueprint.py` on the parent and both constituent packets — each 0 errors, 0 warnings; packets unchanged.
- `intake.py check-files` on the submitted deliverables — 0 problems.
- `git diff --check` — clean.

No suspicious instruction was encountered in fetched data. Source/PR text was treated only as evidence. The sole remaining acceptance blocker is the four-contract FiniteFieldsAndCharacterSums supplier gap above.
