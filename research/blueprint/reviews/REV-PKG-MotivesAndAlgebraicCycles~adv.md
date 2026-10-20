# Independent package review: algebraic cycles, pure and mixed motives

Job `REV-PKG-MotivesAndAlgebraicCycles~adv`, issue #11276. Reviewer: Codex, session `codex-FXtucO`, 2026-10-20. Input package: #11240 / PR #11271, authored by session `codex-1yFbAK`. This reviewer did not write that package. Reviewed base commit: `3276ede5d7c8930e615a33861d10681a1a5e8db3`.

## Verdict and handoff

**`needs_changes`.** The package faithfully preserves its accepted inputs and clearly distinguishes conjectural predicates from theorem targets. The corrections below are applied in place. Two explicit mathematical inputs still prevent me from certifying it ready for an upstream draft:

1. **R1, README §7.11: replacement real-empty surface.** The displayed anti-linear complete-intersection construction cannot work. Independently computing the weight-four quadratic action gives `T²=-1`, so its necessary equation line cannot be invariant. The package correctly records this obstruction, but the intended real-empty surface with vanishing higher coherent cohomology and failed torsion descent still has neither a valid replacement construction nor a verified source for one. Resume with Benoist–Wittenberg I, Example 4.4, pp.59–60, and the precise obstruction calculation in §7.11. Supply and verify a replacement with all three required properties. The calculation excludes this construction; it does not exclude every real Campedelli surface.
2. **R2, README §7.17: primitive arithmetic height domain and normalization.** The predicate on a specified domain and Hermitian pairing is mathematically meaningful. Its identification with Beilinson 1987, Conjecture 5.5, remains unverified. The original chapter was not available in the approved library or through the public publisher endpoint. Li–Liu, Theorem 1.7 and footnote 4, pp.6–7, and Remark 1.10, p.8, supply the restricted arithmetic-theta application, not a construction on every intended cycle. Resume by obtaining the cleared original or an independently justified primary replacement, checking the primitive kernel, the pairing's domain, coefficient extension and sign. Keep the abstract predicate and the restricted application while doing so.

These are inherited gaps, not omissions newly introduced by packaging. The accepted MC.7 nodes deliberately expose them. Coverage therefore passes; source and construction closure does not. Future formalization of a correctly sourced theory is not itself a reason for this verdict. The conditional local arithmetic application remains conditional, as explained below; no claim of an unconditional repair is made.

This report is also the handoff note because the issue permits only the package files and this report. The review job is complete; it is not a checkpoint of an unfinished review. Further source-extraction limits are recorded explicitly below. No packets, source documents, other roadmaps or atlas data were changed.

## Shape, coverage and ownership

Read `WORKERS.md`, `PACKAGE_REVIEW.md`, the relevant source/API/Lean/package provisions of `PROTOCOL.md`, the expansion protocol and `UPSTREAM_GUIDE.md`. Compared the form with upstream AlgebraicTopology and ReductiveGroups and the PadicMeasuresIwasawaAlgebras exemplar. The README has a Summary, boundaries, conventions, exact supplier contracts, eight ordered layers with APIs and Checks, worked examples, dependencies and references. No catalogue scaffolding or source excerpts were introduced.

Recomputed the effective input independently: base 182 nodes, MC.0 continuation 15, MC.2 11, MC.4 17, MC.5 28, MC.6 12 new nodes plus 19 replacements of existing statements, and MC.7 50: **315 unique nodes**. Compared node identifiers with the author's full crosswalk in `handoff/PKG-MotivesAndAlgebraicCycles~codex.md` and the corresponding README statements. There are **313 mapped retained nodes, two supplier removals, no unmapped nodes and no extra identifiers**. The separate Part II's 79 nodes are outside this job. This checks preservation and grouping, rather than treating an input review as proof of mathematics.

Read the coverage audit and related intersection, comparison, étale-duality, period, Satake and effective-motive entries. Read current upstream at `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, separately from the elaboration pins. Searched by coactions, projectors, pairings, kernels, Hodge pieces, coefficient relations, exactness and localization, then read the relevant declarations. No Lake operation was run in the current read-only checkout.

| Object comparison | Independent finding and package boundary |
| --- | --- |
| Duals of finite biproducts | Current `CategoryTheory/Monoidal/Rigid/Biproduct`, including `TauCeti.ExactPairing.biproduct`, already supplies this. MC.1 `dual-of-biproduct` was correctly removed by the author; idempotent-summand duality remains. |
| Abelian finite comodules | Current `Algebra/Coalgebra/Comodule/Finite/Abelian` supplies the Noetherian-base, flat-coalgebra theorem and exact forgetful functor. MC.5 `finite-comodules-abelian` was correctly removed. Over a field the required flatness is available. |
| Known-group reconstruction | Read the representation/comodule equivalence and Tannaka group-functor code. These start from a supplied bialgebra/Hopf algebra or group. They do not construct the coefficient Hopf algebra of an arbitrary category. |
| Rational Hodge classes | Existing Hodge structure, morphism, Tate and rational-substructure APIs do not duplicate the inverse image of a single complex Hodge piece under the specified rational comparison. The kept definition uses those carriers. |
| Karoubi, t-structure, triangulated K₀ | Existing carriers and relations are suppliers. Correspondence-specific structure, motivic predicates and compact-support measure remain new. Tensor-ring descent remains with GrothendieckEulerForms, Part II. |
| Analytic and algebraic comparison | Current DifferentialGeometry Layers 5–8 supplies analytic de Rham and integration. Algebraic comparison and compatibility with geometric cycle classes remain distinct contracts. The existing comparison plans are consumed through their owners. |
| Real algebraic geometry | Current RealAlgebraicGeometry supplies semialgebraic syntax/projection and explicitly excludes homology. It does not supply the equivariant cycle adapters required here. |

Screened all nine post-snapshot directions: AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, all OperatorTheory subroadmaps, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry; also Completed ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts. Read object matches against their actual targets. No additional duplicated motive, reconstruction or cycle-detector target was found. The two removals above predate this review; **this review makes no additional target removal or ownership move**.

MotivesAndAlgebraicCycles is outside the 94-roadmap Caraiani–Newton list. No arbitrary upward citation, `UPSTREAM:` id or FoundationsAndLibraryIntegration target remains in this package. The cohomology plans of upstream PR #196 were read as existing plans, not as implemented theorems or instructions. Generic supplier work was not copied into this roadmap.

## Corrections applied

| Location | Defect or uncertainty | Applied correction |
| --- | --- | --- |
| §4.5 | Pointwise equidimensional-cycle homology was identified with ordinary Suslin homology for arbitrary nonproper `X`. | Restricted the finite-correspondence identification to proper `X`, `r=0`; stated the actual equidimensional homology and affine higher-Chow comparisons. Added `CH₀(𝔸¹)=0` versus `H₀^S(𝔸¹)=ℤ`. Corrected FV to Theorem 4.2 and Definition 4.3, pp.16–18. |
| §2.4 | The prose Check obscured which Künneth factor determines the acted-on degree; “two components” on a curve also obscured `H¹`. | Computed the actions of `[x×C]` on `H⁰` and `[C×x]` on `H²`; identified the positive-genus middle projector separately. |
| §4.1 | Integer marks in localization lacked an explicit interpretation; MVW statement kinds/pages were wrong. | Fixed `(X,m)=X⊗T^m`; cited Corollary 15.8, p.122, Theorem 16.25 and Remark 16.26, p.131. The Hom formula itself was retained. |
| §5.2 | Huber–Müller-Stach page ranges pointed past the relevant universal construction. | Corrected to pp.138–140 and Propositions 7.4.1–7.4.2, pp.164–165. Independently checked that the direction `C(D,T)→B` is correct; did not reverse it. |
| §6.5 | The affine-heap construction depended on an unread SGA 3 quotient locator. | Supplied a concrete fpqc descent route with transition `x↦h(x,e,f)`, its cocycle, compatible action and affine/morphism descent citations. Added a nonempty heap without a rational point. |
| §0.7 | The author could not retrieve the primary low-degree hypersurface proof. | Opened the primary source and supplied the contact-line/divisibility route with exact locators. Removed the obsolete retrieval qualification. |
| §§2.7, 4.8 | Milne's finite-cover page was cited for all-degree comparison; several Voevodsky corollaries were called propositions. | Cited Milne Theorem 21.5 and proof, pp.132–134, and distinguished Voevodsky's propositions from Corollaries 4.2.4–4.2.7. |
| References for §§0.6, 7.12 | Primary Gersten and torsion-cycle-map entry points were absent from the reference list. | Added Bloch–Ogus Theorem 4.2, p.190, and Bloch 1979 §§1–3, pp.108–118, with coefficient/base-field restrictions. No claim that these alone give the real equivariant adapter. |
| §7.19 | “Corrected local identity” was an unnamed premise with no exact normalization. | Stated `Int′=(∂Den_Λ−Den)/(q+1)`, inert unramified/odd-residue scope and full-rank lattice domain, with the conditional Li–Zhang theorem and later Li–Rapoport–Zhang geometric route. Retained the model/multiplicity/Whittaker comparison as a premise. |
| §§3.6, 7.17 | A useful zero-category control was absent; a height-sign Check read as an unconditional positivity claim. | Added `End(1)=0≠F` and qualified the rank-one sign by the positivity predicate. |

Suggested.lean and metadata.toml required no changes. No target or existing Check was dropped to reduce size.

## Source verification

Sources were read as mathematical data. Locators below use printed pages unless the arXiv version is specified. The reproducible sample was `random.Random(11276).sample` on the 77 numbered subsection headings in README order. For subsections also appearing in the author's warning list, the sample checked an additional ordinary locator; the warnings themselves are addressed separately below.

| Sample subsection | Public source and inspected locator | Result |
| --- | --- | --- |
| 6.5 | HMS14 Proposition A.6, p.16; Stacks Tags 0245 and 02W0 | Heap claim located; replaced the separate unverified quotient route by effective affine descent. |
| 6.9 | HMS14 Theorem 2.10, Corollary 2.11, p.11, §3, pp.12–13 | Formal-period/bitorsor identifications and marked comparison located. |
| 1.6 | Stacks Tags 0FGQ–0FGR, pp.13–14 | Projective-bundle proof located. The displayed top-Chern leading coefficient in the source needs the package's existing correction to 1; the rank-three computation below verifies it. |
| 4.8 | Voevodsky Proposition 4.2.3, Corollaries 4.2.4–4.2.7, Proposition 4.2.8, pp.47–49 | Corrected statement kinds; checked Hom directions and positive-shift vanishing. |
| 4.1 | MVW Corollary 15.8, p.122; Theorem 16.25 and Remark 16.26, p.131 | Corrected locators; stabilization and cyclic permutation have separate roles. |
| 7.4 | Kleiman Proposition 4.3, p.16, and adjoining discussion p.17 | Located algebraic-equivalence/smash-nilpotence statement and standard-conjecture restrictions. No unconditional general standard conjecture inferred. |
| 4.10 | Bittner §3, p.3, before Theorem 3.1 | Scissor construction distinguished from the characteristic-zero blow-up presentation. |
| 7.15 | Ichino–Prasanna §2.1.2, p.12, Definition 12.1, p.82 | Compatibility requires the rational structure and every specified realization, not just a Hodge class. |
| 4.6 | FV Theorems 7.1, 7.4, 8.2, 8.3, pp.37,41,43–45 | Located duality, naive comparison, suspension and Gysin sequence with cycle-dimension shifts. |
| 7.18 | Li–Liu Conjecture 1.1 and footnote 2, pp.3–4 | Selected cuspidal factor, occurrence condition and center verified. |
| 7.19 | Li–Liu Assumption 1.3, Hypotheses 4.5/6.6, Theorems 1.5/1.7, pp.4–7,24,30 | Kept Hypothesis 4.5 separate from nonvanishing and all-prime semisimplification separate from full semisimplicity. |
| 7.14 | BW I Questions 2.1, 2.6, 2.16, 4.9, pp.36,38,44,61 | Located the quantified questions; did not assert their present-day open status. |
| 4.2 | Voevodsky Proposition 3.5.1, pp.34–35; MVW Lectures 14–15, pp.109–124 | Projective-bundle/homotopy targets retain their field and smoothness assumptions. |
| 6.8 | Deligne–Milne Theorem 3.2 and Remark 3.3, pp.30–31; HMS14 Appendix B, pp.17–26 | Located fiber-extension/torsor statements and coefficient restrictions. |
| 2.7 | Milne Theorem 21.5, pp.132–134; SGA 4 XVI Theorem 4.1, pp.232–234 | All-degree comparison identified separately from Riemann existence for covers. |

The author's eleven flagged source/proof groups were followed up as follows. “Located” does not mean that this review has formalized the proof or exhaustively extracted every primary work cited inside a survey.

| Author flag | Review outcome and remaining limit |
| --- | --- |
| 1. Geometric suppliers | Read actual library/roadmap interfaces. Chow, Picard and algebraic comparison are future supplier constructions with exact contracts, not existing implementations. Their joint cup/Kummer/trace export is still required. |
| 2. Moving, transfer, Gysin | Opened Suslin–Voevodsky, FV and Friedlander–Lawson. Checked effectivity, genericity, infinite-field versus transfer descent and positive uniformizer normalization. The finite-field complex-level transfer proof remains a named target, not silently obtained by choosing a generic rational parameter. |
| 3. Basic Lemma and all pairs | Opened the 2017 and corrected 2025 HMS texts and Harrer. Constructible coefficients, common filtrations, nonunique cover-index maps and arbitrary-pair h/de Rham descent remain explicit. Smooth-proper comparison alone is insufficient. |
| 4. Relative Beck | Read FS VI.10.2 and its proof, pp.232–234. Its printed reflection hypothesis does not supply preservation to the pinned monadic API. The README retains the sufficient theorem with both premises and the weaker route as an obligation; no false implication was added. |
| 5. Affine heap quotient | Closed this source-route uncertainty by the explicit descent construction and Stacks citations in §6.5. |
| 6. Roitman | Primary §5 Theorem 6(a)/Lemma 17, pp.587–588, and §2, pp.582–583, verified. |
| 7. Known Tate/standard cases | Totaro and Kleiman registers read; coefficient/characteristic restrictions retained. This review did not fully extract the primary Zarhin/Tankeev/André/Moonen, characteristic-two K3, Katz–Messing, Artin–Tate/Brauer–Sha–BSD or Schoen proofs. These remain primary-proof tasks, not consequences of abstract motives. |
| 8. Gersten and torsion map | Opened Bloch–Ogus and Bloch 1979 and checked the displayed Gersten and prime-to-characteristic cycle-map entry points. Real equivariant descent, low-dimensional injectivity and semialgebraic duality still need their specified adapters. |
| 9. Real examples | Read BW I/II, CTV and the elementary parity/valuation routes. Did not certify all conic-bundle/K3/Enriques/classification, real approximation, Witt or Pfister inputs. The restricted book cited for a K3 example is not cleared; no other copy was used. R1 remains a specific broken construction requiring replacement. |
| 10. Quartic Chow computations | Kept separate full-Chow/intermediate-Jacobian/lattice proof targets. A cohomological defect calculation does not by itself determine Chow torsion. These announced routes were not upgraded to proved calculations. |
| 11. Heights and local arithmetic | R2 remains. Independently opened Li–Zhang v3 and Li–Rapoport–Zhang v2 and followed the local density-to-Whittaker entry point to Li–Liu Proposition 9.1, equation (9.3), pp.44–45. The old scheme-theoretic inverse-image assertion cannot be substituted for the later reduced inverse-image statement. |

For the last item, Li–Zhang Definition 10.1.1, p.64, gives the actual local intersection on the split hermitian space `W_n`; Theorem 10.5.1, p.70, depends on Conjecture 10.4.1, p.67. Remark 10.5.4, p.72, gives the Whittaker translation. The later route is Li–Rapoport–Zhang Theorem 14.6.2, pp.60–61, §16, pp.65–71, especially Corollary 16.1.5, p.69. I checked these statements and version-specific pages, not an equivalence of every geometric convention in the two papers. Hence the global theorem still explicitly assumes the corrected local identity.

## Adversarial mathematics pass

Read every subsection's definitions, hypotheses, API and identities. Applied the relevant zero, unit, rank-one, transpose, characteristic, nonproper and integral-versus-field instances below. All 77 numbered subsections are represented. This table records mathematical checks, not a claim that the future geometric proofs were completed. Missing geometric inputs stay visible above. Where carriers are absent at the pins, these are README Checks; the binding shape rule forbids inventing Lean carriers merely to encode examples.

| Statements / README subsection | Computed instances or failure test | Result / change |
| --- | --- | --- |
| 0.1 Correspondence degrees, actions, composition | Point: only degree zero is ℚ. Two points: `E₁₂E₂₁=E₁₁`, reversed `E₂₂`. Empty: zero. Surface-to-point degree zero is `CH²`. | Componentwise dimensions and both gradings required; retained. |
| 0.2 Graph, transpose, tensor | Point-in-curve graph and structural map; transpose of surface-to-curve degree zero has degree one. | Contravariance and dimension correction agree. Geometric tensor switch has no extra cohomological sign. |
| 0.3 Projectors | `a=[x×ℙ¹]`, `b=[ℙ¹×x]`: `a²=a`, `b²=b`, `ab=ba=0`, `a+b=Δ`. Positive-genus `π₁` need not vanish. | Projector identity is the projector itself. |
| 0.4 Algebraic equivalence | Infinite-order degree-zero elliptic divisor is algebraically trivial but not rationally trivial; over a finite field rational Pic⁰ points are torsion. | Distinguishes coefficient and parameter-field scopes. |
| 0.5 Adequacy and numerical pairing | Point pairing is multiplication; total relation kills the unit; complementary divisor pairings on `ℙ¹×ℙ¹`. | Adequacy alone does not imply normalization at the point. |
| 0.6 Support and coniveau | Supported diagonal terms act trivially in the excluded degrees; a statement only over `k` does not give universal extension-field support. | Kept universal quantifier and Gersten action contract. |
| 0.7 Hypersurfaces and ELW | Empty ideal has generator 0; projective space has index 1; anisotropic real conic has `ind₀=2`, `ind₁=1`; singular normalization changes χ by a lower-support term. | Congruence, not equality of χ; source route improved. |
| 0.8 Quadric torsion | `2τ=0` with mod-two detector 1; after rationalization τ vanishes. | Integral torsion and rational motive statements remain separate. |
| 1.1 Twisted Karoubi category | Equal unit twists give ℚ, unequal twists zero; zero projector has identity zero; `Hom(1,h(ℙ¹)(1))` is a line. | Twist sign and restricted morphisms agree. |
| 1.2 Tensor, Tate, additivity | `L=1(-1)`, `L(1)=1`; raising mark −1 to 0 adds one ℙ¹; point disjoint union ℙ¹. | Common-twist and mixed-dimension biproduct formulas agree. |
| 1.3 Duality | Unit twist dual reverses sign; transpose exchanges ℙ¹ projectors; `(X,p,m)^∨=(X,pᵗ,d-m)`. | Dimension twist repairs the degree; supplied biproduct duality reused. |
| 1.4 Chow groups and Manin | `CH^i(1(n))` is ℚ exactly at `i+n=0`; projector images on ℙ¹. | Identity principle tests all products and twists, not only the point. |
| 1.5 Universal property | Zero object, identity functor and two choices of idempotent splitting. | Uniqueness is marked coherent isomorphism, not literal equality of choices. |
| 1.6 Projective bundle | Rank zero empty; rank one identity; on ℙ², `c₂(Q)=ξ²`, and the diagonal polynomial has leading coefficient 1. | Existing correction of the source's binomial coefficient is necessary. |
| 1.7 Adequate quotient | Total relation yields zero category; retracts of image versus lifting an arbitrary idempotent. | No unjustified essential surjectivity. |
| 2.1 Graded carrier | Odd line has symmetry −1; shift changes parity; zero has total dimension 0. | Koszul symmetry and finite total dimension retained. |
| 2.2 Weil operations | Point disjoint union ℙ¹ needs separate top traces; a separable point of degree two has trace 2. | Geometric cohomology and its Galois invariants cannot be interchanged. |
| 2.3 Realization | Zero projector, ℙ¹ projectors, homologically trivial nonzero elliptic divisor. | Realization on actual correspondence actions is a construction, not an assumed factorization. |
| 2.4 Künneth and cycle class | `[x×C]` acts on `H⁰`, transpose on `H²`; `c₂(O_point)=-[point]`; `r=0` excluded from `(r-1)!`. | Corrected degree witness and middle curve component. Denominator invertible over characteristic-zero coefficients. |
| 2.5 Normalized comparison | Unit maps to unit; quadratic-point trace 2; `t_dR↦(2πi)⁻¹t_B`. | All cup/trace/Tate squares required. |
| 2.6 Betti/de Rham | On ℙ¹ a divisor's raw analytic integral is `2πi`; a characteristic-zero field need not embed in ℂ. | Algebraic de Rham generality retained; analytic comparison needs the embedding. |
| 2.7 Étale | Geometric Frobenius on ℚℓ(1) is `q⁻¹`; finite Kummer towers retain transition maps; characteristic ℓ excluded. | Corrected all-degree source; no positive-characteristic independence inferred. |
| 2.8 Curves and kernels | Closed point degree `a`; finite curve map has `f_*f^*=deg f`; projector image comparison. | Quotient descent needs exactly kernel containment. |
| 3.1 Numerical trace radical | Nilpotent has zero traces of positive powers; characteristic-zero Newton identities detect eigenvalues; ℙ¹ projectors have trace 1. | Characteristic-zero and finite-dimensionality restrictions matter. |
| 3.2 Category criterion | A field is semisimple; dual numbers have a nonzero radical; zero idempotent splits. | Pseudoabelian/additive assumptions cannot be replaced by a scalar-ring test. |
| 3.3 Jannsen | Total adequate relation violates the point normalization; elliptic Chow kernel versus numerical quotient. | Existing `I⁰(point)=0` excludes the false zero-category instance. |
| 3.4 Rank and signed symmetry | Odd line categorical rank −1, unsigned dimension +1; even Tate line rank +1. | Modified symmetry needs algebraic Künneth projectors; no unjustified ℚ-neutrality. |
| 3.5 Radical and lifts | Two idempotent lifts modulo a nilpotent ideal need not coincide; realization need not kill numerical equivalence without D. | No canonical lift or unconditional realization on numerical motives. |
| 3.6 Tannakian meaning | Ordinary vector spaces pass; super odd line fails in characteristic ≠2; zero category has `End(1)=0`. | Added zero-category Check. |
| 4.1 Geometric category and inversion | Unit localization is identity; negative exponent is genuinely inverse; rationalization kills ℤ/p. Infinite coproduct not assumed in bounded-above category. | Explicit mark convention and corrected cyclic-action locator. |
| 4.2 Homotopy/projective bundles | `M(𝔸¹)=R`, `M(ℙ⁰)=R`, `M(ℙ¹)=R⊕R(1)[2]`; rank-one bundle. | Ordinary homotopy formula does not determine compact support. |
| 4.3 Blow-up and Gysin | Cartier-center blow-up adds no summand; point blow-up on surface adds `R(1)[2]`; residue of `t` has order +1. | Shift and uniformizer sign fixed; perfect-field scope retained. |
| 4.4 Relative cycles | Empty, diagonal, and point over a positive-dimensional base; fibers must have the specified pure dimension. | Generic field-of-definition/effectivity conditions cannot be omitted. |
| 4.5 Bivariant/moving | `CH₀(𝔸¹)=0` but ordinary Suslin `H₀=ℤ`; affine higher-Chow codimension is `dim X-r`; finite field has no infinite generic-parameter argument. | Fixed false identification and added explicit negative control. |
| 4.6 Duality | At point shift zero; for smooth `U`, cycle dimension is `r+dim U`; Gysin lowers homological index by one. | Suspension changes cycle dimension, not just homological degree. |
| 4.7 Compact support | `Mᶜ(𝔸¹)=R(1)[2]`; empty zero; proper agrees with ordinary; nilpotent thickening unchanged. | No integral universal-homeomorphism conclusion from reduction alone. |
| 4.8 Representability/bridge | Point gives R; `H^BM_{2,1}(𝔸¹)=R`; Chow `1(1)` maps to `R(-1)[-2]`; point-in-curve graph reverses arrow. | Transpose and opposite category are essential. |
| 4.9 Stable dual/Tate | Dual of `R(1)[2]` is `R(-1)[-2]`; dual of ordinary `M(𝔸¹)` is R; `Hom(1,ℚ(1)[1])=k×⊗ℚ`. | Effective RHom cannot replace stable dual. |
| 4.10 Scissor ring | `[ℙ¹]=1+𝕃`, `[𝔾_m]=𝕃-1`, fat point class 1; `[A[1]]=-[A]`. | Inverting `1-𝕃⁻¹` requires target localization; ordinary motive would map it to zero. |
| 5.1 Diagram coalgebra | Isolated K² gives M₂(K); identity edge equates scalars, zero edge imposes nothing; Jordan centralizer dimension two. | Quiver representation need not preserve non-designated composition; transitions need not be injective. |
| 5.2 Universal category | Isolated K² has Morita-equivalent category but a two-dimensional marked object; dual-number modules allowed. | Verified `C(D,T)→B` direction; exact faithful fiber does not imply semisimplicity or preserve simplicity. |
| 5.3 Pairs | Point gives ℚ; equal pair zero; `H¹(𝔾_m,{1})=ℚ(-1)`; two-point boundary in ℙ¹ is nonzero. | Pair product can be good without being very good. |
| 5.4 Basic Lemma/cellular | `{0,1}⊂𝔸¹` gives `ℚ²→ℚ`, `(a,b)↦b-a`, kernel diagonal and cokernel zero; repeated level contributes zero. | A surface filtration repeating a point below top degree fails the dimension condition. |
| 5.5 Covers and all pairs | Two different cover-index choices need a prism homotopy; in totalization `d_v+(-1)^q d_h` cross terms cancel. | Relative/support cone uses `[-1]`; no uniqueness of index maps assumed. |
| 5.6 Tensor/localization | Two degree-one classes have geometric flip −1, corrected symmetry +1; `ℚ[t]→ℚ`, `t↦1`, is not localization. | Unit image does not prove canonical localization. Rank-two fiber cannot become invertible with faithful ordinary fiber. |
| 5.7 Rigidity/fibers | ℤ/2 is not dualizable although generated from ℤ by a cokernel; Spec ℚ(i) has two geometric embeddings. | Field rigidity distinct from Dedekind torsion; top cohomology not reduced to one Tate copy. |
| 5.8 Correspondences | Graphs recover actual pullback; composition of two finite correspondences retains multiplicities; zero correspondence zero. | Functoriality must preserve transfers and descent, not just objects. |
| 5.9 Geometric-to-Nori | `R(1)[2]↦L_N[-2]`; cellular rank-one differential survives; cone maps to relative cochains. | Contravariance fixes twist/shift and cone direction. |
| 6.1 Finite hulls | Zero hull is zero; character of 𝔾_m has finite hull not tensor-closed; characteristic-p C_p representations have exact fiber but need not be semisimple. | Subobjects of every finite sum are required in the finite algebra. |
| 6.2 Neutral Hopf | Matrix monoid lacks the defining representation's tensor dual; on 𝔾_m antipode sends `t→t⁻¹`; trivial fiber reconstructs K. | Both convolution equations needed before tensor automorphisms are identified. |
| 6.3 Functoriality | 𝔾_m finite type but not finite; restriction to μ₂ not full; α_p tests characteristic-zero connectedness restriction. | All value algebras needed; field-valued points miss infinitesimal group structure. |
| 6.4 Relative reconstruction | Regular M₂-module multiplies in the stated order; finite weights S give `K^S`, dual colimit `K[ℤ]`; identity relative fiber needs action balancing. | Reflection does not provide preservation; sufficient theorem retains both. |
| 6.5 Heap/torsor | `h(5,2,3)=6`; noncommutative `xy⁻¹z`; empty heap; `Spec ℝ[t]/(t²+1)` has no real point, law `-xyz`, translation group μ₂. | New descent cocycle computed; no rational base point assumed. |
| 6.6 Coefficients | Off-diagonal map sends second basis vector to first: coefficient 1. Integral arrow 2 gives relation `2(y-x)=0`, detected by `b mod 2`. | Torsion-free quotient differs from integral presentation; rational comparison agrees. |
| 6.7 Formal periods | Linearity, boundary/Stokes, tensor product; Tate period is invertible only after specified localization. | Analytic evaluation not confused with an injectivity theorem. |
| 6.8 Fiber Isom | Same fiber gives its automorphism torsor; a form may have no rational point; scalar extension must preserve finite projectivity. | Nonneutrality and all-algebra representability retained. |
| 6.9 Period bitorsor | `b=xΦ⁻¹`, `d=Φ⁻¹x`; for `b=[[1,1],[0,1]]`, `d=[[1,0],[1,1]]`, `bd=[[2,1],[1,1]]`, `db=[[1,1],[1,2]]`. | Left and right actions cannot be interchanged. Heap law fixes marked point. |
| 6.10 Artin/Tate | Non-Galois separable extension: embeddings outnumber automorphisms; pure Tate closes under subquotients, not arbitrary extensions. | Existing finite-étale descent reused; no mixed-Tate heart inferred. |
| 7.1 Hodge predicate | Rational Tate unit: piece 0 all ℚ, piece 1 zero; wrong weight without injectivity retains kernel. | Fixed rational image and injectivity are separate hypotheses in Lean. |
| 7.2 Tate variants | Frobenius Jordan block has fixed vectors without a canonical equivariant splitting; union over finite extensions differs from one fixed field. | Surjectivity, semisimplicity and strong variants remain distinct. |
| 7.3 Standard predicates | Inverse Lefschetz degree `i-d`; cycle representative of a cohomological projector need not be Chow-idempotent; rational image versus F-linear span. | No use of C alone to obtain actual Chow projectors. |
| 7.4 Known cases/nilpotence | At a point smash nilpotence is zero; the norm pullback coefficient at n=3 is `2³·6=48`. | Source register restrictions retained; source's incorrect numeric control not propagated. |
| 7.5 BB/Murre | Zero steps and top steps; weak independence differs from strong; assumptions must range over all products/varieties in equivalence theorem. | No one-variety quantifier substituted for global hypotheses. |
| 7.6 Motivic heart | Weight shifts and cohomology of unit; a t-structure without the stated realization/weight compatibility does not supply conjectural consequences. | Conditional predicate remains conditional. |
| 7.7 Integral/real classes | Norm from a nonreal point has degree two, which cannot be divided integrally; rational descent can invert two. | Real-closed semialgebraic comparison is separate from analytic Hodge theory. |
| 7.8 Divisors/zero cycles/blow-ups | Degree-zero and top cycle classes; blow-up in codimension one is unchanged; point surface blow-up adds one algebraic class. | Integral, rational and equivariant ranges distinguished. |
| 7.9 Genus/norm detector | Empty-real conic has even genus zero; a real-point genus-one curve defeats a dimension-one odd-genus claim. | Dimension at least two retained in the curve-existence criterion. |
| 7.10 Obstruction/descent | Empty target obstruction, surface canonical Borel–Haefliger class, nonorientable Enriques component. | Orthogonal complement and algebraic subgroup not interchanged. |
| 7.11 Real examples | Recomputed f² weights `(1,7,2,6,3,5,0)`; weight-four T sends `(A,B,C,D)` to `(B̄,-Ā,D̄,-C̄)`, hence T²=−1. Odd ramification permutes four valuation residues even in characteristic two. | R1 remains. Valuation obstruction does not certify a smooth specialization construction. |
| 7.12 Unramified/torsion | Prime-to-characteristic restriction, boundary at a uniformizer, vanishing low-dimensional pieces and norm/restriction. | Bloch map does not supply its real-equivariant adapter automatically. |
| 7.13 Quartic CH | Rationalization kills torsion; a cohomological cokernel cannot determine the full integral group without cycle/Jacobian input. | Kept full-Chow proof tasks separate from defect calculations. |
| 7.14 Questions | Empty-real versus nonempty-real loci and dimension/codimension restrictions in the four original questions. | No blanket generalization or present-day open-status claim. |
| 7.15 Compatible HT | Unit gives coefficient field; nonzero Tate twist has wrong type; nontrivial quadratic Artin line has type (0,0) but no invariant class. | Every-prime condition cannot be replaced by one convenient realization. |
| 7.16 Rank | r=1 elliptic curve recovers Pic⁰ rank and center one; analytic order zero only kills rationalized cycles. | Hecke-localized nonvanishing does not imply dimension one or rank equality. |
| 7.17 Heights | Zero excluded; under positivity r=1 raw height negative; scalar a contributes `|a|²`; no value outside P. | Conditional sign fixed; R2 remains. |
| 7.18 Unitary specialization | n=2 gives a curve; multiple base-change factors require selected Π_j. | Product of factors would alter analytic order. |
| 7.19 Li–Liu | `C₁=-π/4`; even `[F:ℚ]` makes its global power positive; Γ arguments positive. At odd residue q, `q+1≥4`; derivative and subtraction both needed. | Exact conditional local premise added; R contains at least two split places; no rank-one conclusion from localization. |

In particular, every displayed denominator has its scope checked: nonzero factorials over characteristic-zero fields, residue `q+1` at odd residue characteristic, positive Γ arguments and nonzero normalization factors. No formal “q=1” substitution was made into a theorem requiring a residue field of odd cardinality. The relevant characteristic-two and integral negative controls were used where their hypotheses permit them.

## Lean and validation

Elaboration pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. `lean-check` exited **0**, with exactly four warnings, each “declaration uses sorry,” at the four theorem declarations. The file is unchanged after that check. It has 150 lines, two light real-bodied definitions, four theorem signatures and four proved examples. No sorry'd data, admitted examples, auxiliary theory development, `True` placeholder or unused general-purpose Tau Ceti import was found. The closing block accounts for the heavy definitions in every layer.

| Ten signature checks against README | Finding |
| --- | --- |
| `comparisonCoefficient` | Source vector and target covector have the correct sides; value is `ell(f v)` and the body proves linearity. |
| Zero-source example | Proved zero functional, not an unrelated library calculation. |
| Off-diagonal example | Proved value 1 on the second source basis vector and first target covector. |
| `exists_antipode_of_rigid_finite_comodules` | Arbitrary field K, supplied commutative bialgebra and rigid finite-comodule category; both convolution identities; no Hopf or antipode premise. |
| `rationalClassesOfType` | Actual `Submodule.comap` of a complex Hodge piece after restriction to ℚ; definition assumes neither injectivity nor fixed image. |
| `rationalClassesOfType_diagonal_iff` | Weight `2p` and conjugation-fixed rational image present; conclusion concerns membership in filtration step p. |
| `rationalClassesOfType_map` | Hodge-morphism premise and commuting comparison square both present; same weight retained. |
| `rationalClassesOfType_wrong_weight` | Both injectivity and fixed-image hypotheses present; otherwise the kernel counterexample invalidates equality to bottom. |
| Tate-unit type-zero example | Proved top subspace. |
| Tate-unit type-one example | Proved bottom subspace. |

Counted each numbered subsection's Checks and inspected their mathematical purpose: every one has at least three. This count supplements, rather than replaces, the computations above. The two kept definitions each have exactly two proved examples. Heavy geometric conventions remain prose witnesses because their carriers are absent; no weakened Lean substitute was introduced.

Validation commands and results:

- `lean-check research/blueprint/packages/MotivesAndAlgebraicCycles/Suggested.lean`: exit 0; four sorry warnings only.
- `python3 scripts/check_blueprint.py` on the base packet and each of MC.0, MC.2, MC.4, MC.5, MC.6, MC.7: all seven runs, zero errors and zero warnings. Their inherited packet status is not an independent closure verdict.
- `python3 research/blueprint/intake.py check-files` on all five authorized deliverables: zero problems.
- `git diff --check`: passed. Metadata remains `topic = "math.AG"`.

All new prose is in the reviewer's own words. No source PDF, source passage, local path or fetched code is committed. The source/library records below preserve the retrieval information needed after scratch cleanup. One author webpage included an invitation to contact the author about mistakes; it was treated as an untrusted contact instruction and ignored. No messages, credentials, downloaded code execution or unrelated file changes resulted.

## Source retrieval receipts

Access date for every entry: **2026-10-20**. Hashes identify the retrieved PDF bytes, not a claim of complete proof extraction. Browser-only sources follow the table. No source files are retained in the repository.

| Retrieved PDF | SHA-256 |
| --- | --- |
| [ACMV](https://www.math.colostate.edu/~achter/math/abtriv0717.pdf) | `defc0d6a23e3fd0a004413511a0e813cbf25fda77f683c089f978df953e59492` |
| [Beilinson10](https://arxiv.org/pdf/1006.1116v2) | `eba1a4dd5b90773518d252936bc5d49b6ac8fdb17c75de79300b6a91b0a2f1d6` |
| [Benoist](https://www.math.ens.psl.eu/~benoist/articles/realperiodindex.pdf) | `e4c90a314c6d9ea38d3bd8498a6ec050aa763c4150890c98cc295390ef4ece2a` |
| [bittner](https://arxiv.org/pdf/math/0111062v1) | `484d2c3586977503dc6f1b43fca158af059cd0f9c5322731d0ebae6d643e160c` |
| [Bloch79](https://www.numdam.org/item/CM_1979__39_1_107_0.pdf) | `722a5321f9e9d059954e85b6d5e9f15d47e09fad1425ca8d38175516ff501dfb` |
| [BlochOgus](https://www.numdam.org/article/ASENS_1974_4_7_2_181_0.pdf) | `e5304dd3656a18a82d1df1ccdf89b2aaf8837e29e726ad0b56898f587fbe38ec` |
| [BW1](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf) | `daeb43ec861bd6c30564543dac796c55c7f21aa943c442f826b32613e72a46a9` |
| [BW2](https://www.math.ens.psl.eu/~benoist/articles/hodgereel2.pdf) | `6562e18516da996517b3baa26c2207489a8b8438fff841a3be643739a93bb508` |
| [CTV](https://www.cmls.polytechnique.fr/perso/voisin/Articlesweb/CTVoisin13juin11.pdf) | `6a76c596025eb4379a800bcefb57c3f260226b202dae7919d191b4835a0a212a` |
| [DM](https://www.jmilne.org/math/xnotes/tc.pdf) | `48f8af5249081217fc4a806414a764d9d69d66eff9092ddd8e2cf0ea078579e8` |
| [friedlander-lawson](https://dornsife.usc.edu/ericmfriedlander/wp-content/uploads/sites/233/2023/06/14.pdf) | `da01bf9a4ccc26bd421af94d562e266c43d008ee7d97790c377d4e7b1dbe87de` |
| [FS](https://arxiv.org/pdf/2102.13459v4) | `1f8040751d3424f59ae56651d990d7b2d5030e6b7cae58bc2fc683358dfc2027` |
| [FV](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s4.pdf) | `c5edd97134be2d8e3d625b54e604739e6a25590ce686acc8a71a316cfa104554` |
| [Harrer](https://arxiv.org/pdf/1609.05516) | `26cd326422cd4ae1444d9a7ca60cebf74723450de522003de33784a4e09e3a06` |
| [HMS14](https://arxiv.org/pdf/1105.0865v5) | `e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563` |
| [HMS17](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-alt/buch-v6.pdf) | `a77d6efa07d426114558c08aa6684979bb42b1dc08825c10f026d8de702c6326` |
| [HMS25](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-errata/buch-errata.pdf) | `6d08014f21a616abb4ba7e177effad4d15e4a215b0f234ce3a4605c20a02b731` |
| [IP](https://arxiv.org/pdf/1806.10563v2) | `058fda94ad08d245dcdf01672e5915beacb8458e6b49498b7e15debbf828aad5` |
| [jannsen92](https://epub.uni-regensburg.de/26642/1/jannsen10.pdf) | `f2a285cb7ba9f53a1dcb3844e41901dd4f8391cc2655b1b8195bc7a62a277fab` |
| [jannsen94](https://epub.uni-regensburg.de/26639/1/ubr13239_ocr.pdf) | `ba94f5191b9b9f803b9f798a3a9325d60ad59c6c2f6e94b32e157268e03520cd` |
| [karpenko](https://sites.ualberta.ca/~karpenko/publ/agiqf.pdf) | `af1c7a6dd92dc2ce1fffab96c1f73f7d0e091e0050dd4d31370addd473d48369` |
| [kleiman](https://download.uni-mainz.de/mathematik/Algebraische%20Geometrie/Lehre/WS23.Padische1994.Kleiman.Standard.Conjectures.pdf) | `0fca42935d8908ded002bb36675a3fe0863fce18279af36ab0fd33b879591ecf` |
| [kollar](https://arxiv.org/pdf/1312.3923v2) | `735a72d0615586eef919234b66504dbe36a8e62df33ad7c0b51641455b6cfde2` |
| [LiLiu](https://www.math.columbia.edu/~chaoli/AIPF.pdf) | `6ef2d63ea2cf55d8a2648f71ed7ac84e4d32f77e9e7eaeb62b47e584e4e5e566` |
| [LiLiu2](https://www.math.columbia.edu/~chaoli/AIPF2.pdf) | `ebc12f4ddc2dc8b998f91bbfa3329364b075240c4ee53be1bf409a4361be7d88` |
| [LRZ](https://arxiv.org/pdf/2404.02214v2) | `4e687dfc505fb8555f0155c486ec849508f7c1af384446ed155c506a894a1bba` |
| [LZ](https://arxiv.org/pdf/1908.01701v3) | `7db1843f90c3e79741f8d58d92b6bb42b0a3b7ae001c8f9419f43b08c2119d49` |
| [MVW](https://www.claymath.org/library/monographs/cmim02.pdf) | `1197e239873e2a7f7f4dcbd1d115af67281a6d0867eff8816cc630b86b67f020` |
| [stacks](https://stacks.math.columbia.edu/download/weil.pdf) | `01f8d89f2c09649af2e0355b4798a71ee8c31ff97f8f2fa13a5b907e0db7caa2` |
| [suslin-relative](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s2.pdf) | `4f2cfb7162e9ca5febd9010ffca3a3d1ebe3e34b7031c6d514bd02b00e53ce92` |
| [Totaro](https://www.math.ucla.edu/~totaro/papers/public_html/tate.pdf) | `53be841ceb366122bd98d07c95291e6b46f7ab47f24b9fc6fb40c9b4b8ec6ec5` |
| [totaro-integral](https://www.math.ucla.edu/~totaro/papers/public_html/integral.pdf) | `ff883f6915a311ffd010065dc029e9942fdca64fa84dbaa223f6bfa991f9e785` |
| [voevodsky](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s5_0.pdf) | `b15df626bd9e0bc41080dc7712ae8bab8bc8cd2ad8d20bf668593ce87eee70ad` |

Browser-only primary reads: [Roitman](https://www.mathnet.ru/php/getFT.phtml?jrnid=sm&option_lang=eng&paperid=3248&what=fullteng), [Milne LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), [SGA 4 volume III](https://www.numdam.org/volume/SGA_1973__3_/), [Stacks affine descent](https://stacks.math.columbia.edu/tag/0245), and [Stacks morphism descent](https://stacks.math.columbia.edu/tag/02W0). These were opened through the browser; no local byte hash is claimed. The local Roitman download timed out, but the browser primary PDF was readable.

Unsuccessful closure leads, recorded without treating them as substitutes: [Beilinson 1987 publisher record](https://link.springer.com/chapter/10.1007/BFb0078364) did not supply the required full text; [Beilinson's later height note](https://arxiv.org/pdf/2301.02630v2) did not settle the original number-field normalization. No uncleared copy of the original or of the restricted real-algebraic-geometry book was used.
