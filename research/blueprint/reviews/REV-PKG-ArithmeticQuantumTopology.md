# Independent package review: ArithmeticQuantumTopology

**Verdict: needs_changes.** The review is complete and the local corrections are applied. Three
prerequisite defects remain outside the authorized package files: the geometric and volume inputs
of Polylogarithms P.2, effective Habiro descent on the full quadratic finite étale algebra, and an
admissible upstream ordering with ready supplier packages. They are detailed below. An accepted
packet or a successful `sorry` build does not establish those contracts.

Reviewer: Codex, session `codex-GWNbaZ`, 2026-10-14, issue [#7916](https://github.com/CBirkbeck/tauceti-explorer/issues/7916).
The input package was written by Claude (Opus), session `claude-gWFnvH`, in
[PR #9529](https://github.com/CBirkbeck/tauceti-explorer/pull/9529), merged before this review.
I did not author that package. The input atlas commit was
`a44866586cf3d2a672692b391ef9f48816b6c9ba`.

## Review method and scope

Read WORKERS, PROTOCOL, PACKAGE_REVIEW, UPSTREAM_GUIDE and the expansion protocol, the whole
assigned issue, the accepted ArithmeticQuantumTopology packet, the complete package, and the
supplier contracts and remaining gaps in the six cited atlas packets. Used the current upstream
PeripheralActions and CombinatorialHeegaardFloer READMEs as full form models and read their
Suggested files. Read the relevant IntegralLattices, GeometricTopology, LieHighestWeight,
RootSystems and OperatorTheory contracts as well. Searches covered the current upstream README
and Suggested files, Completed roadmaps, and current Tau Ceti by carriers, equations, domains and
operators, rather than proposed names alone.

The current upstream commit inspected was `0d144d044dacebca17b654695b6f1ad58f159b27`, and current
Tau Ceti was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The elaboration pins were Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. No build or mutation was run in either read-only
current checkout. No packet, campaign reader, atlas data or other worker's deliverable was edited.

The 2026-10-12 shape instruction overrides the older issue's 200 KB ceiling. The README retains
the full mathematics and tests; the compact Suggested file has real-bodied light definitions,
representative theorem signatures, proved examples and a closing list of absent carriers. No
theory construction, sorry'd data definition or truth placeholder was introduced. The metadata
remains the single appropriate line `topic = "math.GT"`.

## Corrections applied

1. **Surgery homology.** Added the exterior meridian-basis and Seifert-longitude targets used in
   Mayer–Vietoris, and integral Poincaré duality/universal coefficients from AlgebraicTopology
   Stage 6 for the homology-sphere criterion. The slope killed by integer surgery is the framing
   multiple of the meridian plus the longitude. A cokernel calculation alone is not the entire
   integral homology-sphere proof. The positive E₈ stabilization now distinguishes adjoining
   (−1), which makes the form odd indefinite, from adjoining (+1), which need not diagonalize it.
2. **Quantum conventions.** Fixed the inverse Jones variable with an explicit right-handed
   trefoil calculation: the quantum trace gives q⁻¹+q⁻³−q⁻⁴, hence t=q⁻¹ in the current
   Temperley–Lieb convention. At q=2 the two substitutions give 9/16 and −6. Replaced the
   erroneous h-adic description of the even integral completion by its image completion for the
   e-power filtration. Added zero-convergence and Laurent quantum-integer controls.
3. **Ohtsuki scope.** Removed the ancillary first-coefficient/Casson assertion: the build does
   not construct Casson or supply that comparison. Kept the full Ohtsuki comparison through
   p-adic evaluations. Its tests now include the necessary divisibility of the linear coefficient
   by 6, rather than a sentence saying that a comparison is a comparison.
4. **Cusped geometry.** Removed the duplicate hyperbolicity predicate, using current Tau Ceti's
   metric/finite-volume carriers instead. Distinguished current closed rigidity predicates from
   a proved cusped theorem. Added the orientation qualification: a general group isomorphism
   can reverse orientation, so equality of oriented complex volumes needs the oriented version.
   Restricted Epstein–Penner connectivity to regular refinements with height witnesses and
   compatible faces; arbitrary vertex-preserving triangulations are not covered. Added the square
   geometric gluing-Jacobian nondegeneracy target. Named the ideal-boundary supplier gap rather
   than asserting that the metric module already supplies PSL₂(ℂ) and ideal regions.
5. **NZ and root data.** Replaced arbitrary deletion of cusp rows by selection of independent
   edge rows and peripheral equations. Retained det B, Hessian, integral-unimodularity and parity
   restrictions separately. Corrected [DG2] Remark 2.7's locator to p. 8. Added finite-average,
   square-root choice and cyclic-product controls. No actual Kummer field is assumed to have
   independent rotations of every coordinate.
6. **Faddeev/operator contracts.** Separated the raw real positive-b strip integral from complex-b
   meromorphic continuation, with named integrability and contour-comparison targets. Fixed
   the reciprocal-parameter domain. Reused OperatorTheory's Cayley Borel calculus instead of
   planning a second general calculus; the three Φ-specific unitary operators remain here.
   Added unitarity on both positive reals and the admitted unit-circle branch. The latter is
   essential for the state integral at ℏ>1/4: at ℏ=1, λ=exp(πi/3), whereas positive real λ cannot
   give that ℏ. The Schrödinger conjugation and pentagon now have compatible domains.
7. **Distribution products.** Corrected [AK] Appendix B, Theorem 8: its local wavefront condition
   does not ensure a tempered product. Defined the local carrier/test-space and restriction
   contracts, scoped local continuity precisely, and required a continuous Schwartz extension
   for the tempered lift. Added the smooth tempered pair
   u=(sin(e^(x²)))′, v=cos(e^(x²)), whose local product grows too rapidly to be tempered. Both
   wavefront sets are empty. Read the public [BDH] source for the corrected local product,
   sequential continuity versus normal-topology hypocontinuity, and pullback domains.
8. **Contractions and checks.** Corrected the enlarged-test-space multi-index restriction:
   in an integrated coordinate α_i=0 implies β_i=0. Constant-in-fibre output tests are admitted;
   arbitrary bounded oscillatory tests are not. Added identity/constant/zero kernel tests,
   divergent constant-kernel composition, homological admissibility and positive gauge controls,
   the 4ℏ versus 8ℏ phase witness, and a noncommuting matrix multiplication witness.
9. **Examples.** Fixed the canonical order-five figure-eight value versus its other embedding,
   the constant 1 GSW normalization versus the GZ one-loop constant 3^(−1/4), and the 5₂ field
   conversion τ=ξ⁻¹ with its discriminant factor and square-root branch. Expanded the Lean
   closing comment so the heavy definition families remain explicitly represented by name.

## Source audit

All locations below were personally read in the specified public source, on 2026-10-14. These
are locator and statement checks, not claims to have checked every proof in each paper. Printed
page numbers and PDF page numbers are distinguished. No source passages or private source files
were copied into the repository.

### All source families marked unverified by the package author

| Source | Locations read | Result |
| --- | --- | --- |
| [Saw], [math/0308281v2](https://arxiv.org/abs/math/0308281v2) | §4 pp. 18–22; §6 Theorems 3–5 pp. 24–26 | Root bounds, open alcove and negligible quotient retained; finite-free category is not treated as abelian. |
| [MM], [math/9905075v1](https://arxiv.org/abs/math/9905075v1) | §1 pp. 1–2; Theorem 4.9, §4, p. 15 | Dimension N≥2 and reduced unknot normalization verified; N=1 is separately extended. |
| [DG], [1202.6268v2](https://arxiv.org/abs/1202.6268v2) | §1.2 pp. 4–5; §§2.1–2.4 pp. 11–13 | Full rank (A|B) is distinct from invertible B; peripheral/flattening conditions retained. |
| [DG2], [1511.05628v1](https://arxiv.org/abs/1511.05628v1) | §§2.1–2.4 pp. 5–9; §2.8 pp. 11–12; §3 pp. 13–16 | Finite weights and arithmetic descent separated from conjectural topology; Remark 2.7 is on p. 8. |
| [GSWZ], [2412.04241v2](https://arxiv.org/abs/2412.04241v2) | §1.7 pp. 13–14, Theorem 5; §1.8 pp. 15–17 | Full quadratic étale coefficient algebra, excluded primes, integral comparison and phase retained. |
| [BD], [1905.02045v2](https://arxiv.org/abs/1905.02045v2) | §1 pp. 1–3, Theorem 1 p. 2 | Ten named knots, bounded denominators and positive-q convention verified; 7₂ excluded and table's 5₁ corrected to 5₂. |
| [HabC], [math/0605313v1](https://arxiv.org/abs/math/0605313v1) | §11 Theorem 11.2, PDF pp. 30–31 | Completed even center and coefficient/completion scope verified. |
| [RT], [author-hosted public PDF](https://people.math.harvard.edu/~opie/Reshetikhin_Turaev.pdf) | §§2.1–3.3 pp. 2–7; §§4.1–4.6 pp. 8–12; Theorem 5.1 pp. 12–13; §6.1 p. 17 | Ribbon/duality, graphs/coupons and functor inputs verified in the original paper, not an abstract or secondary description. |

### Random sample of 15 other source records

The sample was drawn from the packet's other source records before source checking. Repeated
paper/target pairs are distinct locators in the input, so both sides of the Kashaev volume
qualification and both locations defining the P rescalings were checked.

| Sampled target | Source locator read | Result |
| --- | --- | --- |
| Framed links/linking matrix | [HabK] §2.3 pp. 1290–1291, PDF pp. 6–7 | Matrix/framing conventions match. |
| Twisting theorem | [Hab08] Theorem 9.4, §9.2, p. 34 | Unit-framed unknotted component and sign restrictions match. |
| Charged tetrahedron kernel | [AK] §4 pp. 15–16 | Charges, delta support, Fourier and phase formulas match. |
| Matrix quantum modularity | [GZ] §4.5 equations (4.12)–(4.14), pp. 28–30 | Kept conjectural and retained scalar/matrix weight discrepancy. |
| Cyclotomic P basis | [Hab08] §6.1 p. 21; §8.1 p. 28 | P, P′, P″ and tilde rescalings are distinct. |
| Kashaev volume conjecture | [GZ] §1 equations (1.1), (1.5)–(1.6), pp. 9–11 | Positive-root Kashaev convention requires the explicit GZ conjugation. |
| Kashaev versus AK volume | [AK] §1.9 p. 11 | Decay of AK integrals is distinct from Kashaev growth. |
| Braided integral structure | [Hab08] Theorem 3.1, §3.3, pp. 13–14 | Corrected the completion description. |
| Core/twist data | [HL] Definition 3, §2.14 p. 28; §§2.15–2.16 pp. 29–35 | Two-sided clasp bases and abstract surgery conditions retained. |
| Cyclotomic expansion | [Hab08] Theorem 6.4, §6.2, pp. 21–22 | Coefficients belong to an invariant theorem, not an arbitrary series definition. |
| Expansion versus knot invariant | [Hab08] §6.2 pp. 21–22; §8.2 p. 29 | Scalar factorial convergence does not produce a knot invariant. |
| Band-slide calculus | [HabK] Theorem 1.1 p. 1287, PDF p. 3; Main Lemma/Theorem 2.1 p. 1290, PDF p. 6; §4 pp. 1300–1309, PDF pp. 16–25 | Opposite algebraic slides, rather than two equal slides, preserve the matrix. |
| Formal NZ integral | [GSW] §1 equations (1), (4)–(7), pp. 3–4; §2.2 pp. 6–8; §3.1 pp. 9–10 | Constant 1 and formal Gaussian normalization retained. |
| Quantum algebra/integral forms | [Hab08] §§2.1–2.6 pp. 7–11 | Ambient h-adic and integral image completions remain distinct. |
| General parity group | [HL] §§6.1–6.3 pp. 68–70 | Central parity and n=0 tensor convention retained. |

Additional checks addressed the actual corrections: [AK] Appendix A equations (42), (44)–(50),
pp. 34–35, and Appendix B Definitions 18–20/Theorem 8, pp. 37–39; [GSW] §2.3 pp. 8–9 for
regular refinements; [Neu] §3 pp. 420–424, §12 pp. 460–462, and §§15–16 for the example/branch
conventions; [Thu] Chapter 4 §§4.2, 4.4 pp. 48–50, 54–56 in the
[public lecture notes](https://library.slmath.org/books/gt3m/PDF/4.pdf); and [Pra73] Theorems A–B
p. 256 in the [public original](https://repository.ias.ac.in/36364/1/36364.pdf).
The corrected local product uses [BDH], [1409.7662v2](https://arxiv.org/abs/1409.7662v2), §1
pp. 2–3, §3 Definition 3.1 p. 5, Theorem 4.6 p. 13, Proposition 5.1 p. 13, and Theorem 6.1 /
Corollary 6.2 p. 21; Theorem 6.3 pp. 21–22 distinguishes proper-support pushforward.
The Hörmander book was not newly read or certified; the corrected product has this public primary
source. The separate P.2 volume proof was not certified by any of these checks.

## Current-library overlap and ownership

| Objects/targets searched | Existing owner read | Disposition |
| --- | --- | --- |
| Smooth links, braids, writhe, boundary slopes | Tau Ceti link/Markov/Gauss-code modules; GeometricTopology 4–5 | Imports retained. A one-knot Gauss code or an unframed Markov quotient does not supply a framed multicomponent surgery type. |
| Jones braid representation and normalized trace | Current `KnotTheory/TemperleyLieb.lean`, `jonesTrace_sigma_pow_three`; Jimbo representation and weighted trace | Existing calculations cited in boundaries; new target is comparison with the universal quantum trace and exact inverse variable. |
| Abstract cyclic ribbon graph | `TauCeti.BipartiteRibbonGraph` | Imported abstract structure distinguished from embedded ribbons/coupons with isotopy and module colors. |
| Complete hyperbolic metric, finite volume, closed rigidity | `Hyperbolic/FiniteVolume.lean`, `Hyperbolic/Mostow.lean`; GeometricTopology 7–8 | Deleted the new `IsCompleteHyperbolic` target. Reuse `HyperbolicMetric.HasFiniteVolume` / `IsFiniteVolumeHyperbolic`; current Mostow declarations are predicates. New theorem is cusped and orientation-qualified. |
| Upper-half-space metric and isometries | `Hyperbolic/UpperHalfSpace.lean`: `UpperHalfSpace`, `riemannianMetric`, `similarity` | Carrier, analytic metric and transitive similarities imported. This module explicitly does not prove completeness/curvature and supplies no ideal boundary. |
| Riemannian measure/connection | Current VolumeDensity modules; DifferentialGeometry 12.4; GeometricTopology 7; HopfRinow 1 | Existing measure and connection owners preserved; no replacement volume measure constructed. |
| Surgery H₁/H₂ and stable linking forms | AlgebraicTopology Stages 2–3, 6; IntegralLattices 6A | Existing homology/duality and odd indefinite lattice classification imported. Linking-number/surgery calculation is the new target. |
| Root lattices, PBW, highest-weight dimensions | LieHighestWeight 1, 3, 6; RootSystems | Classical inputs imported; quantum Serre algebras, integral cores and parity extension remain new. |
| General unbounded spectral/Borel calculus | OperatorTheory/SelfAdjointSpectralTheory SA-B04–09, SA-E01–03, including singular point exclusion in SA-E02 | Deleted the duplicate general `boundedFunctionalCalculus` target. Retained only the new Schrödinger pair, conjugated sum and three Φ-specific unitary values. |
| Temperate smooth multipliers/Fourier/tempered distributions | Mathlib `Function.HasTemperateGrowth`, `SchwartzMap.smulLeftCLM`, `TemperedDistribution.smulLeftCLM` and Fourier modules | Existing operators imported. Polynomial bounds on every derivative, not boundedness of the function alone, are required. |
| Local distribution/kernel/wavefront contracts | Current manifold `Distribution.lean`, StandardDistributions, analytic PDE/Fourier matches | Those matches are tangent-subspace distributions or probability laws, not D′ kernels/wavefront products. The missing local carrier, kernel and qualified contraction stay here. |
| Scalar versus matrix quantum cocycles | Q-series QM.5 versus GZ selected knot matrices | Scalar contract imported conditionally; matrix-valued definition and algebraic cancellation remain here. |

No target was assigned to FoundationsAndLibraryIntegration, a literal `UPSTREAM:` placeholder,
or a newly invented existing Tau Ceti theorem. The two removals above are recorded here and in
the handoff without leaving removed stubs in the README. No current roadmap or library file was
changed. Searches also included all nine roadmaps newer than the atlas snapshot and the four
Completed roadmap directories.

## Remaining defects and exact resumption points

### R1. Ideal geometry and the P.2 volume comparison

Affected README: supplier contracts, §§5.1–5.3, 5.9–5.12, and the analytic/quantum-modular uses of
manifold volume in Layers 6–7. The Polylogarithms packet explicitly retains gaps titled
“Milnor's formula for the volume of an ideal tetrahedron” and “Ideal-boundary and oriented
ideal-tetrahedron geometry beyond GeometricTopology layers 7 and 8”. Its scoped accepted fix
reviews preserve these gaps; they do not certify that the supplier is finished.

Needed geometric prefix: identify the ideal boundary with ℂP¹; realize ordered boundary vertices
as oriented geodesic ideal regions; establish finite Riemannian volume and the PSL₂(ℂ), vertex
permutation and subdivision rules. GeometricTopology 7–8 and the current analytic upper-half-space
carrier do not give this contract. The recorded owner proposal is an early prefix of
GeometricTopology, Part II (RT-AREA-topology/8), preceding Polylogarithms P.2 and this package's
manifold comparisons. Importing all of AQ Layer 5 into P.2 creates a cycle. P.2 remains the sole
owner of the Milnor/Lobachevsky comparison with D, including its source/proof gap; no duplicate
tetrahedron-volume formula was moved into this package. Required action: complete and order that
geometric prefix, then close P.2's volume proof and supply its exact comparison API. The new README
explicitly marks the missing prerequisite rather than asserting it exists.

### R2. Full finite étale Habiro descent

Affected README: §§6.8, 7.2 and 7.17. HabiroNumberFields HB.7's
`followup-effective-global-descent` still has `G-global-descent` open and source issue E23
unresolved: additive closure, effective finite-projective descent, actual chart base changes and
conservativity are not supplied by local rank-one freeness. The knot comparison furthermore
requires the full B=R[T]/(δT²−1), including split components; a chosen number-field component is
insufficient. Required action: supply that global result and its extension to the complete finite
étale algebra before claiming the unconditional module comparison. The README keeps the precise
condition instead of silently using a local or selected-component theorem.

HabiroNahmSeries HB.8/HB.9 also retain global-prefactor/regularity, all-order identification,
coefficient-transfer, signed Kummer-orientation and integral-gluing conditions. Section 6.8 retains
them all. They are not certified by this review or discharged by the geometric k=1 GSW theorem.

### R3. Supplier packages and allowed upstream order

The package depends on HabiroCyclotomicCompletions, HabiroNahmSeries, HabiroNumberFields,
K3BlochGroups, Polylogarithms and QSeriesPartitionsAndMockModularForms. None has a package directory
in this clone or a current TauCetiRoadmap entry under those names. Current-library searches also
found no replacement for their full contracts. ArithmeticQuantumTopology and these suppliers have
no assigned unit/bundle in CaraianiNewton's 94-roadmap tier ordering; mentions of Polylogarithms or
Q-series there are outside-family citations, not an ordering for this build. This is an uncertified
ordering, not evidence for an invented tier or permission to cite an arbitrary higher package.

| Supplier input inspected | Current packet verdict | Limitation relevant to this review |
| --- | --- | --- |
| HabiroCyclotomicCompletions | accepted; partial | No upstream package; use the integral ℤ rigidity contract, not its unresolved non-Noetherian generalization. |
| HabiroNahmSeries | accepted scoped fix; partial | No upstream package; HB.8/HB.9 qualifications remain open. |
| HabiroNumberFields | accepted plan | No upstream package; HB.7's explicit global-descent gap remains. |
| K3BlochGroups | accepted scoped fix; partial | No upstream package; convention maps and integral Suslin fibre must be supplied, not identified integrally by fiat. |
| Polylogarithms | accepted scoped fix; partial | No upstream package; the ideal geometry and volume proof of R1 remain open. |
| QSeriesPartitionsAndMockModularForms | needs_changes | No upstream package; its reader's QM.5 Kontsevich inverse-eta multiplier still gives −1 rather than 1 at −I, and full-plan objections remain. |

Required action: the maintainer assigns an admissible supplier-first ordering or an explicit
permitted bundle, completes/reviews those packages and their required exports, and brings them
upstream before this package's draft PR. The Q-series objection is evidence that its package
cannot be treated as accepted, not a claim that every scalar cocycle used here is false. Fixing
its reader, other packets, ownership or tier files is outside #7916's permitted files. This review
does not re-review or certify any of those suppliers.

## Coverage and adversarial mathematics pass

Traced all 106 input target nodes, including their hypotheses, into the README. Its thematic
order differs from packet stage labels: Kashaev's function is now §2.15; root-category cautions are
§4.14; the rational-homology-sphere boundary is §4.9; asymptotic arithmetic is §7.2; formal versus
analytic output is §7.3; and the Habiro export comparison is §7.17. The packet's executable/status
application is represented by the opening status convention, §7.18's ledger and the Suggested
boundary. No target was discarded to meet a size limit. The added supplier, Schrödinger and kernel
subsections expose previously implicit supporting obligations.

The table covers every numbered subsection, its defining identities, named theorem families and
conventions. “Retained” means the stated conditional target survived the adversarial check; it
does not claim a formal proof. The divisions audit separates Laurent polynomial formulas from
fraction-field evaluations, det B from det Λ, S≠0 from componentwise Pochhammer nonvanishing,
strong-color Gauss factors from root bounds, and J-invertibility from a merely formal matrix.

| README statement family | Instances, non-examples and convention witnesses checked | Result |
| --- | --- | --- |
| 0.1 Framed links/linking matrix | Empty link; framings 0/1 with same unframed braid; Hopf off-diagonal 1; Borromean pairwise 0 | Retained; current ownership clarified. |
| 0.2 Surgery/homology | Empty surgery S³; unknot p=0 gives ℤ and p=3 gives ℤ/3; μ/longitude basis | Added exterior/longitude and Stage 6 contracts. |
| 0.3 Admissibility | Empty; diagonal ±1; diagonal 0; Hopf with unit determinant but nonzero off-diagonal | Retained; determinant is not the definition. |
| 0.4 Kirby/Fenn–Rourke | P=I+E₂₁; Hopf slide gives framing 2; +1 blow-down changes remaining framing by −ℓ² | Retained signs and i≠j/symmetry hypotheses. |
| 0.5 Hoste | Split +1 deletion; framing 2 excluded; ℓ=2 blow-down gives −4 and need not be Hoste | Retained admissible domain. |
| 0.6 Band slides | I₂→[[2,1],[1,1]] under one slide; two same-direction slides give [[5,2],[2,1]] | Added noncancelling negative control. |
| 0.7 Refined calculus | Empty/+1 unknot; 0-framed excluded; trefoil homology sphere differs from S³ | Retained domain and descent route. |
| 0.8 Admissible presentation existence | Empty; ±1 single-component surgery; E₈⊕(−1) versus E₈⊕(+1) | Added stabilization-sign witness. |
| 1.1 Ribbon category/trace | Tensor unit; trivial twist/flip in vector spaces; V₁ twist q^(3/4) | Retained duality; no symmetry axiom. |
| 1.2 Topological ribbon Hopf/zero convergence | Ground ring; completed abelian group algebra; hⁿ versus constant 1 and constant h | Added three convergence tests; no infinite-rank rigid category claimed. |
| 1.3 Quantum/integral algebras | Classical h=0 limit; K in odd but not even form; ordered divided-power basis | Retained coefficient rings and changed completion description where inconsistent. |
| 1.4 Ribbon/R matrix | R mod h is 1; V₁ positive twist q^(3/4); qdim v+v⁻¹ | Retained inverse-ribbon framing convention. |
| 1.5 Braided even form | Unit; completed tensor codomains; odd/even compatibility | Corrected e-power image completion. |
| 1.6 Bottom tangles/closure | Trivial n arcs close to n unknots; closed component excluded; no stacking of arbitrary all-bottom tangles | Retained actual category action. |
| 1.7 RT functor | Empty graph 1; straight strand identity; crossing/inverse cancel | Retained coupon/duality and framed isotopy domain. |
| 1.8 Universal sl₂ invariant | Trivial tangle unit; ± kink r⁻¹/r; Hopf not unit | Retained ordered bead signs and framing. |
| 1.9 General universal invariant | n=0 and trivial tensor; specialization to sl₂; R=r=1 cannot detect knots | Retained abstract ribbon-Hopf hypotheses. |
| 1.10 Integrality | Unit bottom knot; zero-linking restriction; nonzero twist outside integral domain | Retained theorem restrictions. |
| 1.11 Core/clasp/twist forms | Dual-basis δ; unit twists 1; one-sided basis not enough | Retained two-sided topological pairing contract. |
| 1.12 Drinfeld–Jimbo | Rank one; a_ij=0 gives commutation; G₂ long d_i=3 | Retained transposed Cartan convention and Serre coefficients. |
| 1.13 Integral cores | PBW index zero weight 1; rank-one comparison; nonzero index needs sqrt-factorial weight | Retained distinct coefficient lattices. |
| 1.14 Tilting/negligible quotient | Unit trace 1; sl₂ r=3 labels 0,1; weight 2 trace 0 | Retained precise root bounds/open alcove. |
| 2.1 Colors/quantum integers | [0]=0,[1]=1,[2]=v+v⁻¹; v=1 gives n; V₂=X²−1 | Added independent-color and specialization tests. |
| 2.2 Colored Jones | Unknot unreduced [2] versus reduced 1; positive framing q^(3/4)[2]; split product | Retained division before root evaluation. |
| 2.3 Jones comparison | Right trefoil t+t³−t⁴; q=2 gives 9/16 under t=q⁻¹ and −6 under t=q | Corrected inverse variable; Lean numerical control. |
| 2.4 P bases | n=0 all 1; P₁=X−v−v⁻¹; denominators {1} versus {3}{2} | Retained fraction-field versus integral rescalings. |
| 2.5 Completed center | σ₀=1; σ₁=C²−q−2−q⁻¹; i>n kills V_n | Retained and audited Lean n=0 boundary. |
| 2.6 Trace duality | (m,n)=(0,0),(0,1); unrescaled quantum-binomial factor | Retained normalization. |
| 2.7 Cyclotomic expansion | Unknot only σ₀; coefficients from actual J; color reconstruction | Retained knot and integrality prerequisites. |
| 2.8 Color determination | n=1 first congruence; n=0 excluded; congruence ideal not zero | Retained integral ideal rather than equality. |
| 2.9 Truncations | N=0 gives 0; n=0,N=1 gives 1; V₁ at N=2 | Retained min(N,n+1) and n<N in Lean theorem. |
| 2.10 P algebra/completion | P₀ unit; P′₁ squared has two distinct rescaling coefficients; infinite twist not finite polynomial | Retained factorial filtration. |
| 2.11 Quantum-trace integrality | Unit/P₀=1; mismatched PBW weights trace 0; arbitrary fraction colors excluded | Retained integral-color restriction. |
| 2.12 Link divisibility | Unknot; algebraically split zero-framed case; Hopf excluded | Retained linking/framing assumptions. |
| 2.13 Expansion is not an invariant | Arbitrary scalar factorial series; non-split Hopf | Retained separation of scalar convergence and knot data. |
| 2.14 Unified Kashaev element | Unknot 1; root 1 only a₀; factorial square with (−1)^n q^−n(n+1)/2 | Retained order/normalization. |
| 2.15 Kashaev/function | N=1 separately; N=2,3,5 exact sums; α→α+1; fifth-root Galois change | Corrected canonical fifth-root value. |
| 3.1 Twist element | V₀ pairing 1; ω₊ω₋=1; surgery uses ω^−f | Retained signs and completed rather than finite algebra. |
| 3.2 Twisting | ±1 surgery on unknotted component; negative surgery uses positive ω | Retained sign and linking hypotheses. |
| 3.3 Unified J | Empty presentation 1; ±1 split components normalize; rational homology sphere excluded | Retained completion/summability and admissible domain. |
| 3.4 Presentation independence | Empty/+1 presentation; single allowed Hoste move; inadmissible link not an input | Retained refined calculus prerequisite. |
| 3.5 First divisibility | q=1 divisor zero; derivative 6; roots −1 and primitive cube root | Retained exact polynomial divisor; Lean derivative example checked. |
| 3.6 Connected sum/orientation | S³ factor 1; mirror q↦q⁻¹; inversion twice identity | Retained orientation rather than complex conjugation alone. |
| 4.1 sl₂ Kirby color | r=2 gives V₀; r=3 excludes V₂; Gauss sums separately nonzero | Retained root/normalization domain. |
| 4.2 WRT | Empty surgery 1; ±1 unknot numerator canceled by corresponding sign denominator | Retained nonzero Gauss factors/root lift. |
| 4.3 Habiro evaluation | Root 1 normalized separately; truncation at exact root order | Retained equality to conventional WRT on its domain. |
| 4.4 Integrality/Galois | Integral root value; conjugate primitive root versus fixed value | Retained equivariance, not pointwise invariance. |
| 4.5 Determination | Integral Habiro ring; injective qualifying infinite roots; changed coefficient ring not covered | Retained exact supplier rigidity. |
| 4.6 Odd-prime uniqueness | Integral formal series with convergent p-adic evaluation; complex analytic convergence not needed | Retained p-adic domain. |
| 4.7 Ohtsuki | S³ series 1; constant coefficient 1; linear coefficient multiple of 6 | Removed unsupplied Casson claim and vacuous test. |
| 4.8 Other completions | Product completion can forget components; rational coefficients change separation | Retained negative boundary. |
| 4.9 Larger manifold domain | 2-framed unknot has H₁=ℤ/2 and is not admissible | Retained integral-homology-sphere domain. |
| 4.10 Quantum parity | v² degree 1 but v nontrivial; K² degree 1; n=0 central group; A₂ commutator sign | Added sign-sensitive parity control. |
| 4.11 General core filtration | n=0 integral scalar Habiro; odd v excluded from degree 1; (q;q)_k vanishes at orders ≤k | Retained coefficient intersection/AL1–AL2. |
| 4.12 General highest-weight colors | λ=0 dimension 1; sl₂ balanced integer; sl₃ ω₁ gives [3]→3 | Retained quantum versus classical supplier comparison. |
| 4.13 Strong Kirby colors | r bound equality excluded; A_odd Gauss vanishing lift excluded; ξ=1 separate | Retained lift rather than root-only data. |
| 4.14 Specialization cautions | r=3 V₂ negligible; multiplication by 2 on finite-free rank one is monic/epic, not invertible | Corrected ring-category explanation. |
| 4.15 General WRT comparison | Separate ± Gauss denominators; admissible ξ/lift; outside domain not asserted | Retained restrictions. |
| 4.16 General unified theorem | sl₂ comparison; root 1 value 1; other roots define extension only | Retained concrete integral core and admissible evaluation set. |
| 5.1 Ideal shapes | z=0,1 excluded; regular z₆; zz′z″=−1; odd permutation inversions | Algebraic controls pass; ideal geometric carrier is R1. |
| 5.2 Cusps/rigidity/refinements | Two figure-eight shapes; dilation 2 incomplete; reverse orientation; height witness; flat 2 versus degenerate 1 | Restricted connectivity and orientation; removed duplicate predicate. |
| 5.3 Gluing/completeness | Product equation versus 2πi branch; negative Im excluded from positive geometry; translation w+1 admitted | Retained positivity/log/peripheral distinctions; volume needs R1. |
| 5.4 Flattenings | p=q=0; regular logs πi/3,πi/3,−2πi/3; w₀ alone does not recover sheet/shape | Retained cut-cover and parity components. |
| 5.5 Extended pre-Bloch | Transfer [1,1]+[0,0]−[1,0]−[0,1]; invalid sheet relation excluded | Retained both relation families and extra ℤ/2 if transfer omitted. |
| 5.6 Extended Bloch kernel | Zero; transfer wedge cancellation; p-sheet change at z=1/2 gives nonzero πi∧log 2 | Added nonzero boundary witness; no integral convention identification. |
| 5.7 Five-term/Pachner | Forgetting sheets; invalid flattening not a lifted relation; alternating signed 2–3 sum | Retained qualified lifted relation. |
| 5.8 Strong flattening | Edge logs zero; odd normal-path parity excluded; ordered versus unordered torsion | Retained separate parity/path conditions. |
| 5.9 Manifold Bloch class | Figure-eight projected 2[z₆]; nonprincipal cusp lift; orientation reversal sign | Retained flattening independence; volume detection needs R1. |
| 5.10 Rogers regulator | z=1/2 gives −π²/12; p+2 changes by −πi log 2; real π² period | Added computed branch/period witnesses. |
| 5.11 Volume/CS | R=iVol−CS; GZ V=−conj R; reverse orientation; regular tetrahedron sum | Retained normalization; P.2 comparison remains R1. |
| 5.12 Number-field class | Figure-eight F=ℚ(√−3); explicit shape solution and convention map; diagram alone insufficient | Retained selected field/isolation inputs. |
| 5.13 Diagram boundary | Figure-eight satisfies geometry/field obligations; trefoil fails hyperbolicity | Retained four separate obligations. |
| 6.1 NZ datum/Hessian | B=0 excluded; z=1 excluded; A=0,B=1,z=1/2 gives Λ=2; det Λ separate | Corrected row selection; linear datum is not a manifold. |
| 6.2 Formal NZ | Constant 1; odd Gaussian moment 0; DG versus GSW prefactor | Retained coefficientwise finiteness/normalization. |
| 6.3 Formal invariance | Nondegenerate 2–3; regular EP paths only; geometric rather than arbitrary representation | Restricted global geometric route; no rootwise theorem inferred. |
| 6.4 NZ–Nahm | B unimodular versus merely nonzero determinant; parity vector; symmetric rational matrix may not be integral | Retained exact integral and sign hypotheses. |
| 6.5 Root datum | k=1; D∗₂=1+x; S=0 excluded; weighted mean 4/3 not 1; related shape roots; square-root sign | Added discriminating finite/product/choice tests; corrected locator. |
| 6.6 Root series | Constant 1; odd √h moments vanish; two cubic vertices contribute at h¹ | Retained filtered expansion and conjectural topology. |
| 6.7 Arithmetic descent | Actual Kummer subgroup; periodic weights; θ rotations compensated by translated finite index; τ^(2k) | Retained arithmetic theorem, not analytic/topological identification. |
| 6.8 Habiro comparison | Nonintegral N excluded; bad primes excluded; B split étale retains both components; unmatched phase fails | Preserved conditional comparison; R2 remains. |
| 6.9 Faddeev definition | b=0 excluded; b=2 and 1/2 height π/4; b=1 inversion constant exp(iπ/6); strip boundary excluded | Added integrability/contour and meromorphic comparison contracts. |
| 6.10 Functional equations/unitarity | b=1; b=exp(πi/3) gives ℏ=1; b=i and 2i excluded; poles treated meromorphically | Added complete unitary-parameter domain. |
| 6.11 Schrödinger pair | Gaussian commutator sign; (1+|x|)^−1 outside position domain; chirp derivative p+q | Reused supplied Borel calculus; added Φ-specific unitary targets. |
| 6.12 Operator pentagon | Standard Schrödinger core; closure p+q; real and unit-circle unitary parameters | Corrected compatibility with all ℏ>0 AK parameters. |
| 6.13 Selected analytic integrals | ε=π pole boundary excluded; b=1 ℏ=1/4; 5₂ phase exp(−iπ/3) | Retained n=2,3 contours, phase and convergence domain. |
| 6.14 Selected volume limits | b→0 positive branch; nondegenerate selected saddle; decay −Vol, not Kashaev growth | Retained explicit uniform deformation/tail obligations. |
| 6.15 Positive/gauge/admissible shapes | Regular charges 1/6; boundary not fully balanced; gauge 1/6 versus 1/3; S³ minus two vertices H₂=ℤ | Added homology and positivity controls. |
| 6.16 Local/tempered kernels | δ² forbidden; empty-WF smooth pair with non-tempered product; e^(x²) local only; identity/constant/zero kernels; divergent fibre | Corrected false global product and test-space contract; public local product source added. |
| 6.17 Charged kernel | Regular a=c=b=1/6; a=0 excluded; delta support off hyperplane zero | Retained Fourier phase and orientation-adjoint conventions. |
| 6.18 Charged pentagon | Five linear charge equations; nonunit scalar exp(πi c_λ²P_e/3); positive domain | Retained admitted kernel contractions and level compensation. |
| 6.19 Leveled state integral | ℏ=1 circle parameter; 4ℏ phase −1 versus 8ℏ phase 1; no boundary output scalar | Added parameter/phase controls; partial composition retained. |
| 6.20 AK invariance | H₂ vanishing required after composite; vertex-preserving positive moves only; adjoint under reversal | Retained homological convergence and qualified equivalence. |
| 7.1 BD theorem | Ten knots; 7₂ excluded; x→+∞ bounded denominator; positive versus negative q | Retained analytic error/domain distinction. |
| 7.2 Perturbative arithmetic | Figure-eight one-loop 3^−1/4 versus GSW 1; 5₂ Im ξ<0; root-order matching separate | Corrected normalization explanation; R2 qualifications retained. |
| 7.3 Formal/analytic boundary | Any formal series lacks remainder estimates; AK leading and BD all-orders outputs differ | Retained theorem/conjecture separation. |
| 7.4 Representation families | Trivial weight 3/2, others 0; |P₄₁|=3, |P₅₂|=4; nonisolated saddle excluded | Retained selected-data rather than arbitrary-representation assertion. |
| 7.5 QMC | c=0 T excluded; S at integer X; bounded denominators and truncations | Retained precise conjecture; no conjecture used as theorem input. |
| 7.6 Kashaev volume | S sends N to −1/N; positive-root/mirror comparison; AK decay is different invariant | Retained conjectural general knot statement. |
| 7.7 Denominator/tweaked cocycle | λ_T=0, λ_S(1)=1; S at 0 excluded; γ↦−γ invariant; S² cancellation | Retained signed denominator and pole exclusions. |
| 7.8 Generalized QMC | Trivial σ reduces to scalar; nontrivial weight zero; cX+d eventually positive | Retained conjectural normalization. |
| 7.9 Series lift | h=0 reduction; exact Möbius infinitesimal coordinate; no differentiation of rational-point asymptotics | Retained coefficientwise conjecture/weight issue. |
| 7.10 Quadratic relations | Figure-eight cancellation uses i²=−1; trivial representation excluded | Retained general and 5₂ conjectural status. |
| 7.11 Coefficient asymptotics | Distinct actions needed; figure-eight phase witness; finite coefficients do not prove large-n error | Retained source discrepancy and conjectural scope. |
| 7.12 Matrix QMC | Scalar entry weight sign; selected square matrices; invertibility not automatic | Retained unresolved conjectural convention comparison. |
| 7.13 Matrix cocycle | J=j̃=I; singular J excluded; A,B noncommuting with AB≠BA | Added explicit ordered product and proved Lean negative control. |
| 7.14 Analytic extension | c=0 no finite pole; c≠0 pole −d/c; two opposite cut planes | Retained conjecture, not inferred from algebra. |
| 7.15 Descendants | q=1 gives 1; q=−1 gives 1+4(−1)^m; cube root 13; Q₂ Taylor coefficient −1/2 | Retained integral H_m but scalar extension for half-row. |
| 7.16 AK comparison | Selected 4₁/5₂ theorem versus general conjecture; explicit phases and limiting domains | Retained no universal formal/analytic NZ comparison. |
| 7.17 Habiro exports | H₀ integral, Q₂ not; rootwise formal series alone no module membership | Retained exact ordinary versus twisted-module distinctions. |
| 7.18 Example ledger | Fifth-root 46±2√5; determinants 5/7; τ=ξ⁻¹ and discriminant /(ξ²); empty cell not zero | Corrected root/field/normalization status. |

### Lean signature audit

Read every declaration in Suggested.lean and audited all 19 admitted signatures, exceeding the
ten-signature requirement. The checked families include: admissible determinant (empty matrix and
rank-one ±1); handle-slide diagonal (symmetry and distinct indices); linking cokernel invariance
(invertible transvection); framing non-descent; ribbon trace tensor order; Chebyshev colors and
quantum dimension; cyclotomic expansion/truncation at n=0; Casimir vanishing for i>n; the six exact
Kashaev values; transfer wedge cancellation; NZ Hessian symmetry versus det B and integral Nahm
symmetry versus unit determinant; the raw Faddeev reciprocal identity; level phase with ℏ≠0;
denominator cocycle with both pole exclusions; matrix cocycle with intermediate J invertibility;
and the descendant congruence in arbitrary commutative rings, including N=0 and unit q=1.

The raw Faddeev identity is a symmetry of two total integral expressions, not a theorem asserting
analytic continuation at inadmissible b or z. Its new README integrability/strip comparison is a
separate target. The Lean NZ record is explicitly a linear-algebra datum, not a hidden certificate
of a hyperbolic triangulation. The finite descendant statement is congruence modulo the factorial
ideal, not exact equality at an arbitrary q. Heavy README definitions are either represented by
their light specializations or named in the closing comment; theorem-only APIs need not all be
duplicated as Lean declarations.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticQuantumTopology.json`:
  **0 errors, 0 warnings**, 106 nodes, 206 API items, 159 packet unit tests, 36 planets. It also
  reports eight retained gaps and **zero certified closed stages**; those are not erased by packaging.
- `lean-check` on the package Suggested file: **exit 0, exactly 19 warnings, all
  “declaration uses sorry”**. The added Jones, cyclic-product, positive-charge and matrix-order
  negative controls are proved examples and elaborate. No language server or library build was run.
- `python3 research/blueprint/intake.py check-files` on the package, review JSON, report and
  handoff: **0 problems**.
- `git diff --check`: **passes**. Only this issue's permitted package files, report and handoff
  are changed. Source locators and formulas are stated in own words; no source excerpt, private
  path or downloaded source file is submitted.

The review has finished its authorized fixes and records `needs_changes`, rather than treating
open supplier contracts as established results. The handoff preserves the exact next actions for
the maintainer and the affected supplier/package workers.
