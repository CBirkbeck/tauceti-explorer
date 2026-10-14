# REV-PKG-AnabelianGeometryAndNonabelianChabauty~2

Independent fixing review for issue #9857, by Codex, session `codex-mk4VvI`, 2026-10-14. Neither package session was this review session. Read WORKERS.md, PACKAGE_REVIEW.md, PROTOCOL.md §§5, 13, 20, the expansion protocol, UPSTREAM_GUIDE.md, the first review and the revision handoff.

**Verdict: accepted, with the corrections below applied.** The revision supplies owners and mathematical targets for the first review's G1–G18 ledger. This review found additional mathematical errors, corrected them, and supplied the semistable local-height construction that the new crystalline formula did not cover. No unresolved prerequisite defect remains from this review. Acceptance concerns a roadmap; the admitted signatures do not prove the results.

## Form, fidelity and dependencies

Read the current ProfiniteArithmetic and PeripheralActions READMEs and representative Lean declarations as the upstream models. This package has the required summary, boundaries, conventions, exact supplier contracts, ordered layers, API outlines, discriminating Checks, examples and references. It keeps the mathematical detail rather than replacing the roadmap by an inventory.

The target and hypothesis pass covered all 344 headed mathematical targets and the 240 anchored API targets in Layer 0. The accepted-plan inventory retains all 535 target anchors, all 650 API entries (643 distinct names), and all 465 named tests. All 122 accepted definitions/constructions have at least three Checks; the added definitions/constructions also have at least three. Künneth is a theorem, rather than a definition, and has two Checks. All 2,190 internal links resolve against 620 anchors, with no duplicate anchor. The folded Layer 0 entries retain statements, standing hypotheses, source distinctions and prerequisites. The corrections below deliberately strengthen or correct statements where retaining the old wording would retain an error.

All 19 linked atlas suppliers belong to tiers 1–15; this roadmap is tier 16. There is no upward supplier citation, FoundationsAndLibraryIntegration reference or UPSTREAM identifier. In particular, the two Hodge–Tate inputs belong here rather than depending on the unbundled tier-16 HodgeTateAndCanonicalSubgroups. The prior revision's ownership moves remain necessary. No new ownership move to a higher roadmap was made.

The G1–G18 closure was checked by following the new target statements and their input contracts:

| Ledger | Disposition after this review |
| --- | --- |
| G1 | Mixed extensions and crystalline local/global heights are in Layer 6. Added `nekovar-semistable-local-height`, including its actual cohomological domain, lift independence, crystalline restriction and central-translation formula. |
| G2, G18 | Layer 3 owns the rational relative logarithmic comparison and the good-reduction integral bounds. The bound retains dependence on K and g and independence of n and L. |
| G3 | Layer 2 owns Olsson's unipotent, two-endpoint and tangential comparison. The ramified-base extension is explicitly a construction target based on Olsson's stated extension, rather than a claim that he writes its proof. |
| G4 | Layer 1 owns the continuous π₁-to-étale comparison. Corrected the coefficient quantifier in the converse. |
| G5–G8 | Layer 1 owns finite pushforward/descent, prime-field Künneth, product groups and the full/tame tangential distinctions. |
| G9, G10 | Layer 3 owns admissible non-Galois log covers and proper hyperbolic Hom loci. Corrected the proof of properness to cover ramified dominant maps. |
| G11 | Layer 4 owns characteristic-zero unipotent quotient representability and the affine-algebra point formula. The existing fppf quotient sheaf is an input. |
| G12, G13 | Layer 6 owns the correspondence action and rational Rosati descent. Fixed the action, graded swap and diagonal signs with explicit symplectic computations. |
| G14 | Layer 7 owns open-curve/product/Weil-restriction cohomology. Added the positive-degree and geometric-connectedness restrictions and the arithmetic ramification hypothesis. |
| G15 | Proper Coleman charts, gluing and compact-disc zero bounds are Layer 5 targets. |
| G16 | The existing ComplexComparison Layer 8 citation remains the supplier. |
| G17 | Layer 4 defines the Bloch–Kato subgroups, with strict-inclusion examples. Corrected the Kummer carrier in its test. |

## Sources

Public primary texts were retrieved into scratch and read at the relevant statements; no source file or passage was committed. The 15-node random locator sample is recorded below so that the same checks can be repeated. “Deduction” means the package's calculation is its own consequence of the cited definitions, rather than a separately numbered theorem attributed to the author.

| Sampled target | Locator checked and result |
| --- | --- |
| embedded-kernel-inclusion-injectivity | Kim 2005 §1, pp. 5–9; deduction with the correct injectivity qualification. |
| nice-class-realization | BDMTV §4.4, p. 913; BDMTV 2023 Remark 3.17, p. 16. The rational lattice and p-adic vector-space scopes remain distinct. |
| twisted-kernel-quotient-continuous | Kim 2005 §1, pp. 5–7; deduction using the quotient topology. |
| discrete-normal-killing | Poonen §1.3.5, Definition 1.3.14 and Proposition 1.3.15, p. 11; the infinite-coefficient extension is a deduction. |
| separable-killing-descent | Achinger v1 Proposition 3.4(c), p. 8; Stacks 09YQ, 03RV, 07RR. |
| cocycle-right-cosets | Poonen §1.3.5, p. 11; deduction. |
| invariant-vector-criterion | BDMTV Definition A.1, p. 934; Kim 2009 §§1–2, pp. 97–100, 114. The nonzero qualifier is retained. |
| kernel-invariant-gauge-inclusion | Kim 2005 §1, pp. 5–9; deduction. |
| connecting-quotient-fibres | Kim 2005 §1, pp. 5–6, 9; deduction with the quotient fibre, rather than a false injection. |
| cocycle-values-invariants | Poonen §1.3.5, p. 11; deduction. |
| named-kernel-h1-inclusion-triangle | Kim 2005 §1, pp. 5–9; deduction respecting the named/native subgroup identification. |
| balanced-height-features | BDMTV pp. 894–895, Remark 3.9 p. 908, §6.4.1 p. 932; corrected BD II to Lemma 4.4 p. 22 and Lemma 5.3(1)–(2) pp. 22–23. |
| weak-jannsen-implies-dimension | Kim 2009 Observation 3 and proof, pp. 125–126. Added the required ramification-set hypothesis for the auxiliary extension. |
| h1-restriction-inflation | Kim 2005 §1, pp. 5–6; deduction. |
| invariant-coset-image | Kim 2005 §1, pp. 5–6, 9; deduction. |

Also checked the new prerequisite sources: Achinger and Stacks for the comparison, finite descent and curve computations; SGA 1 for products; Chen §§4.2–4.3 for tangential fibres; Deligne–Milne for neutral reconstruction; Olsson's introduction, path and tangential theorems and Appendix D; Mochizuki's relative and integral Hodge–Tate statements and admissible-cover setup; Milne's algebraic-group and abelian-variety notes for unipotent quotients and Rosati; and the cited Kim, Besser, Chiarellotto–Le Stum and Balakrishnan–Dogra/BDMTV statements for the path and height comparisons. Tamagawa Lemma 4.7, pp. 167–168, has the three marked-point/principal-unit hypotheses used in the addition target.

Three further BD II locators were corrected: the twisting injection is Lemma 4.2, p. 20; the specialized local-height discussion is §3.3, Lemmas 3.6–3.7, pp. 14–15; splitting independence is §3.5, after Lemma 3.11, p. 18. Pagination is that of the package's author manuscript.

The original Faltings article was inaccessible during this run. The two statements actually needed here were checked in Mochizuki 1999 §2, pp. 19–21 and §9, pp. 49–52, including the explicit bounded-denominator consequences on p. 51. This is not a claim to have independently verified the original Faltings page numbers. The original Nekovář paper was also inaccessible; the explicit replacement source for the local construction is Besser, arXiv:math/0209006v1, §4, diagram (4.4), Definitions 4.1 and 4.3 and Lemma 4.2, pp. 6–7, and §6, equation (6.1), p. 10. The cohomological construction is usable without Besser's Coleman–Gross comparison theorem or its sign discussion. Bloch–Kato's definitions remain sourced through the freely readable Kim and Berger texts, as the revision already explains.

## Mathematical corrections and adversarial pass

The pass read every target's statement/hypotheses, including the 240 folded entries, and the definitions' Checks. The following table groups the instances by mathematical family; it does not imply that every paper's proof was reread in full.

| Family | Instances and convention witnesses | Result or correction |
| --- | --- | --- |
| Layer 0 cocycles, gauges and defects | Trivial group/module; S₃ transpositions and conjugation; C₃-to-C₉ least-residue lift at (2,1) | Ordered products retained; positive defect 3, inverse defect 6. No abelian commutation is imported into nonabelian calculations. |
| Layer 0 kernel, quotient, transporter, twist and restriction APIs | Identity and constant coefficient maps; nonnormal subgroup; empty/nonempty transporter; nonneutral mapped class; source/target neutral class after repointing; arbitrary normal subgroup versus open normal subgroup | Surjectivity, quotient-map and inverse-continuity hypotheses are kept only where used. Kernel H¹ is not silently injective, and a coset space is not silently a group. Removed 17 instructions posing as Checks and two resulting empty Check headings; mathematical named tests remain. |
| Layer 1 paths and tangential fibres | Spec k; equal endpoints; identity on constants; positive/inverse inertia; marking indices 1 and 2; characteristic-p wild covers | Geometric kernel and right source translation retained. Full characteristic-zero fibres and tame fibres remain distinct. |
| Layer 1 K(π,1), covers and products | Field; affine curve; projective genus 0 and 1; degree-p covers; finite prime-field coefficients; finite-cover induced modules | Corrected a false single-coefficient converse: higher-direct-image vanishing is sufficient for a fixed M, but the converse uses all finite coefficients and induced modules on covers. |
| Layer 2 length and realizations | Zero object; two copies of the unit; nonsplit unit extension; depth zero/one; primitive T² coproduct; equal/different endpoints | Fixed the Lean length indexing to n+1 grades. Length zero now means trivial action, agreeing with C₀; a moved vector rejects it. The finite path algebra remains a module algebra rather than a Hopf quotient. |
| Layer 2 comparisons | Empty boundary; unramified and ramified coefficient fields; integral and tangential endpoints; one versus two augmentations | Good reduction is a condition on the full model/path construction, not a claim that arbitrary crystalline extensions stay crystalline. The ramified model is not assumed to descend to a Witt-vector model. |
| Layer 3 reconstruction and Hom loci | Proper/affine hyperbolicity; self-node; thickness 1 and p; degree-one calibration; genus-one nonexample; nonconstant ramified map | Fixed the properness route: resolve a rational generic map and contract its rational exceptional curves in the hyperbolic target. Étale-cover extension alone was insufficient. |
| Layer 3 Hodge–Tate inputs | Small base of dimension zero; P¹ minus three points; K=ℚ_p, g=1; p≤g; good versus bad reduction | Rational/logarithmic scope, boundary twist and uniform integral loss retained. Bad-reduction integral assertions remain excluded. |
| Layer 4 unipotent and Selmer geometry | Trivial group; Ga; nonnormal unipotent H; characteristic p; nilpotent affine coefficient algebra; no places; an empty local condition | Characteristic zero and split unipotence justify the point formula. Invariant vanishing is not a substitute for finite cohomology. Empty-place and empty-condition Selmer tests are different. |
| Layer 4 Bloch–Kato conditions | Qp(1) over Qp; trivial Qp; good-reduction elliptic representation; p=2 | Corrected raw Qp×⊗Qp to the rationalized pro-p completion. The full Kummer space has dimension 2, its finite line dimension 1. |
| Layer 5 periods and zero bounds | S₃ with I=(01), γ=(12); split path; f=1, f=t−a, f=0; finite disc cover; rank zero and nontrivial Sha | I⁻¹γ has the correct source direction. Nonzero-function and compact-disc hypotheses retained. Rank alone does not replace the full depth-one Selmer dimension. |
| Layer 6 mixed extensions | Two equal trivial graded pieces; three-block filtration; split extension; finite/nonfinite cohomology | Fixed the descending block direction and right torsor of maps ⊕Wᵢ→M. Hom vanishing removes automorphisms; it is not necessary for the class-set bijection. Period classifications require admissible graded pieces, and representability requires the Layer 4 finiteness hypotheses. |
| Layer 6 local/global heights | Split class; Kummer uniformizer and unit; isotropic span(b₁,b₂) versus nonisotropic span(b₁+a₂,b₂); central translation; p=2 | Fixed isotropic image for a section of the Hodge quotient: its kernel is always zero. Added a semistable construction using x−i(y)=j(k) and w′(x)=u(w(y))+k. Lift changes cancel. V⊕N(p(1+p)) is semistable, noncrystalline and has height χp(p(1+p)). |
| Layer 6 correspondences | Symplectic plane; diagonal; two graph directions; zero tensor; factor pullback; genus zero | Fixed T(u⊗v)(w)=〈u,w〉v, trace=cup, graded swap=−flip and adjoint compatibility. The diagonal acts by −id, with trace −2g; the two plane tensors have matrices diag(0,1) and diag(−1,0). Added the light Lean witness and examples. |
| Layer 6 height equations | Preheight projections with α=(1,2), values 7 and 1; no away places; Γ={3}; zero features; m=0; dependent anchors; Kp=Qp×Qp | Values −2 and 6 discriminate projection order; corrections are {0} and {−3}. Determinant values 5 and 0 distinguish the basis condition. Balanced feature dimension is 2, versus ordinary dimension 4. |
| Layer 7 cohomology and Lie characters | Quadratic Weil restriction of P¹; boundary ±√2; n=0 and 1; proper s=0; genus 0 and 1; p=2 with real places | The induced-summand assertion now requires i≥1 and geometric connectedness: induced H⁰ has dimension 2 but H⁰ of the Weil restriction dimension 1. T must contain extension ramification. Stated the Witt formula at n≥1. The H² bound now uses max(s−1,0), so the proper Hodge–Tate multiplicities are (g,g), not (g,g−1). |
| Layer 7 conjectures and examples | Equal dimensions; strict depth-one inequality; constant loci; decreasing tail sets; no S-primes; p=7 roots of unity | Conditional hypotheses and eventual-tail quantifier retained. Intersection equality alone does not imply eventual equality. |

The semistable-height addition closes a domain mismatch, rather than restricting the promised global pairing to a smaller domain. The exact supplier paragraph, global height target and Lean closing comment now include it. No target, named API or named mathematical test was removed to hide a gap.

## Current-library duplication and pinned inputs

Checked mathematical objects against the nine newer current roadmaps (including the nested OperatorTheory roadmaps), Completed/ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts, and the current Tau Ceti library. Current roadmap checkout: `0d144d044dacebca17b654695b6f1ad58f159b27`; current library: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. **No additional exact duplicate was found and no target was removed in this review.**

The existing boundary deferrals remain essential: ProfiniteArithmetic's continuous Aut/Out and outer actions; PeripheralActions' abstract peripheral powers; ProfiniteCohomology and current all-degree continuous cohomology/killing; the maximal pro-p quotient; Tannakian reconstruction from a specified Hopf algebra; and the fppf homogeneous quotient sheaf. The retained targets add geometric normalization, nonabelian coefficients, reconstruction from a neutral category, or unipotent representability as stated in their boundary clauses. LocalGaloisGroups does not supply the anabelian path/reconstruction theorems. The other newer/Completed roadmaps do not supply those objects or the height constructions.

Read the roadmap's library audit and locally checked the pinned inputs at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: the native quotient/action APIs, maximal pro-p quotient, finite-comodule `fgPointTensorIsoEquiv` and explicit finite-quotient H¹ comparison. The newer all-degree and open-subgroup cohomology inputs are explicitly current-library boundary imports, not claims that they already existed at the older pin.

## Lean and submission checks

Suggested.lean has 543 lines, 18 light real-bodied definitions, two structures, 17 theorems and 41 examples. No admitted data definition, auxiliary development or placeholder carrier was introduced. The two changes are the length correction and the symplectic-plane convention witness. Heavy geometric, comparison and height constructions stay in the README and are covered by the closing comment.

Ten signatures compared explicitly with the README:

| Signature | Scope checked |
| --- | --- |
| `Nonabelian.gauge_isCocycle` | Automorphism action and ordered gauge; no commutativity. |
| `Nonabelian.gauge_continuous` | Topological coefficient group and joint action continuity. |
| `Nonabelian.class_eq_iff` | Native continuous cocycle quotient and single-gauge relation. |
| `ArithmeticPath.pathCocycle_mem_ker` | Both endpoint splittings and geometric p retained. |
| `Unipotent.length_zero_iff` | Corrected to trivial action over any field, with n+1 grades. |
| `RelativeMaps.over_identity` | Map is over the fixed quotient; no curve reconstruction asserted. |
| `Selmer.condition_mono` | Underlying class-set specialization with supplied localizations. |
| `Period.translate_periodRatio` | I·(I⁻¹γ)=γ in the noncommutative group. |
| `Heights.nice_add_pullback` | Pullback stability, trace-kernel and primitive-class-kernel hypotheses. |
| `Heights.determinant_equation` | Anchor interpolation and nonzero feature determinant; includes m=0. |

All remaining theorem signatures and the finite computed examples were also read. `lean-check` exited 0 with 58 warnings, all `declaration uses sorry`. `scripts/check_sorry_data.py` exited 0. `metadata.toml` remains exactly `topic = "math.NT"`. The intake file check and whitespace check are recorded in the handoff. No passages, section-by-section source summaries or local machine paths are part of the deliverables.
