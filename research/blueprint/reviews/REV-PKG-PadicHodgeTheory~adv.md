# Independent package review: PadicHodgeTheory

**Verdict: needs_changes.** Codex, session `codex-fSU7Sc`, independently reviewed the package written by `codex-cL2TJD` for #10019. This completes review job #10068; it is not a checkpoint of an unfinished review. The package is not ready for the upstream draft: lower packages already own substantial parts of its proposed foundations, and several claimed comparison/construction dependencies remain open. The corrections below are applied in place. No packet or other roadmap was edited.

## Scope and evidence

Read WORKERS, PACKAGE_REVIEW, PROTOCOL (including §§5, 13, 15, 20), UPSTREAM_GUIDE, the expansion source rules, the PadicMeasuresIwasawaAlgebras exemplar, and the current LocalGaloisGroups and ProfiniteArithmetic roadmaps and representative signatures. Read all ten package layers, its Suggested.lean, metadata, assembly ownership notes, the author's full handoff, and both authoritative packets: `PadicHodgeTheory--P7` (300 targets) and `PadicHodgeTheory--R06.5` (18 targets). The unsuffixed packet is an alternative earlier decomposition, not another 242 targets to concatenate.

The input inventory has 318 targets, 665 API entries, 390 checks, 59 supplier requests and 27 recorded gaps. The target-to-subsection concordance is retained below. Coverage in a subsection does **not** certify that its prerequisites are closed. In particular, the author's table of dispositions does not turn a missing supplier into an existing theorem. The added §5.5 general-base/tensor-torsor targets were also reviewed, independently of that concordance.

The source check used all 27 author-flagged subjects and a fixed random sample of 15 other citation paragraphs (seed 10068). Public PDFs were read at the locators recorded below; this was not a verification of every proof in every reference. No restricted book was copied or quoted. All descriptions and corrections here are in the reviewer's own words.

## Corrections applied

- **§0.2:** corrected the Lean docstring suggesting that the fraction field B_dR is algebraically closed, and added an explicit README negative control. Its discrete valuation gives a counterexample: X²−ξ has no root. C is the algebraically closed residue field. Corrected the related Lean docstring.
- **§0.4:** replaced an incorrect inclusion comparison between integral A_cris and A_inf[1/p] by incomparability, witnessed by t and 1/p. Added the missing membership hypothesis in the generator test for I^[r]A_inf. The elements μ and μ+p have identical reductions modulo p, but the latter is not in ker θ. Added r=0, p=2 and theta negative controls, including a Lean example.
- **§1.2:** Berger I.3.2 does not prove the arbitrary-complete coefficient tensor assertion. Replaced that attribution by the weighted finite-Laurent-family proof: coefficient projections give the lower projective-norm bound, monomial tensors the upper bound, then take completions and compact inverse limits. KL's locators are now explicitly for the definitions.
- **§2.3:** distinguished Tan–Tong's crystalline Poincaré theorem from the completed de Rham integration target. It cannot serve as a locator for that stronger de Rham assertion.
- **§3.5:** added BC Theorem 9.1.11, pp.133–135, for crystalline full faithfulness; Theorem 9.1.8 alone concerns Frobenius and admissibility properties.
- **§3.6:** supplied Conrad Appendix B, Proposition B.4, pp.35–36, for the all-unit criterion for labelled crystalline characters, distinguished from its open-unit, potentially crystalline version.
- **§4.2:** supplied Colmez Proposition IV.2.4(i), p.34, for H¹(H_K,W(m_tilt)⊗T)=0, with the successive mod-p cocycle corrections explaining the complete-limit step.
- **§4.4:** replaced a proposed new Wach–Breuil–Kisin bridge by the existing lower `wachBreuilKisinComparison`, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.26. Kept its p>2 cyclotomic frame and the dual-weight convention; no p=2 Wach bridge was inferred from it.
- **§4.5:** replaced the nonexistent KL §9.6 citation by Liu §2.1, Theorems 2.3 and 4.7. Computed the change from this package's Herr differential to Liu's: degree 0 identity, degree 1 coordinate swap, degree 2 multiplication by −1. Added the nonzero degree-2 witness to README and Lean. Added Nakamura Theorems 5.10–5.11 for B-pair cohomology, with an explicit distinction between that result and the still missing multiplicative chain-level comparison.
- **§5.2:** added Berger Theorem III.2.4, p.17, alongside III.2.3 and the erratum; the inverse/reconstruction assertion needs the former as well.
- **§6.2/§6.4:** replaced irrelevant KW-I global references for integral Fontaine–Laffaille endpoints by FL §§0.8–0.9, pp.551–552, Theorems 3.3 and 6.1, pp.562–563 and 581–582, and KW-II Lemma 3.5(i), pp.22–23. Corrected inherited FL page numbers.
- **§6.4:** replaced a preview/global reference for all-prime Barsotti–Tate realization by Tong Liu, Theorems 1.0.1 and 2.2.1, published pp.662, 666. The stable-lattice theorem includes p=2. Added the direct BLZ reduction argument for the extra Q_p endpoint k=p+1. Corrected the potentially crystalline branch's author attribution to Conrad–Diamond–Taylor (1999), Lemma 2.1.2, author-version p.8, and identified the remaining adapter needed to use that lemma.
- **§9.2:** imposed rank two in the Tate-type module classification; otherwise unrelated summands destroy the claimed normal form. BC Proposition 8.3.8 is a Q_p classification in the opposite covariance, so the finite-K covariant version now has its own short basis/filtration argument rather than an inaccurate attribution.
- Added explicit construction gaps at §§0.6, 2.5, 2.7, 4.5 and 7.6 where the cited text does not supply the promised construction. Added descent/trace tests at §0.1. Preserved all existing checks and target subjects.

## Defects that remain, and the required repair

### 1. Ownership and a lower-tier prerequisite cycle

The scope and supplier sections omit real owners of the very period foundations that Layers 0 and 3 propose to build. These are lower atlas packages, not hypothetical upstream additions:

| Existing owner | Actual supplied object/result | Collision in this package | Required disposition |
|---|---|---|---|
| SelmerIwasawaCohomology §§4.1–4.3 | C and its action, comparison with Mathlib's B_dR carriers, DVR/topology/t/gr, A_cris/B_cris and their embedding, fundamental period sequences with continuous sections | §§0.1–0.4, parts of §3.1 | Import the finite-K foundations; retain only explicitly stronger analytic/relative or integral-period APIs. Assign each extension to its lowest consumer. |
| SelmerIwasawaCohomology §§4.4–4.5 | Fixed fields, dimension bounds, D_cris/D_dR, the predicates and crystalline⇒de Rham | §§3.1, 3.3, 3.5 | Use those definitions. Add the covariant weight dictionary without defining a second predicate. |
| SelmerIwasawaCohomology §§4.6–4.7 | Small-weight rational Fontaine–Laffaille setup and realization | §6.1 | Separate the imported finite-residue theorem from genuine extra generality. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.18 | Tate–Sen H⁰/H¹, character version and normalized trace | §0.1 | Coordinate the lowest ownership before choosing an import. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.1–R07.3.3 | Filtered (φ,N) modules, Hodge/Newton numbers, weak admissibility and admissible⇒weakly admissible/full faithfulness | §§3.4–3.5 | Import these carriers/results and identify the extra filtration/HN APIs. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.26 | Wach/Kisin comparison in its cyclotomic p>2 frame | §4.4 | Corrected locally to an import; retain the exact frame and dual convention. |
| NeronModelsAndSemistableAbelianVarieties §5.3 | B_st, period functors/predicates, tensor/dual, good/semistable abelian comparison, de Rham abelian Tate modules, and `PadicWeilDeligneRealization` | §§0.5, 3.3–3.5, 5.3, 8.3, 9.3 | Import the existing construction and assemble only the additional comparison/normalization results. |

This is not resolved just by replacing §0.1 by an import from finite-flat theory. Selmer §4.4 explicitly records its **unsupplied** Tate–Sen prerequisite; it currently points to LocalFieldsRamification Layer 1, which does not contain that calculation. Finite-flat §R07.1.18 in turn uses Selmer's C/action input. Placing Tate–Sen in tier-13 PadicHodgeTheory and importing it back into these lower packages would violate the tier order. It must move to an early part of the lower owner, with the C/action dependency ordered first, and the affected packages must be rewired together. Those edits lie outside this issue's allowed paths.

The Néron WD recipe also fixes N_K=e_K N_absolute and exports restriction using `iso_smul_monodromy`; this package uses N_absolute. The recipes have the same Weil action and an explicit scalar-normalization comparison, not two independent constructions. For e_K=2 and q=π⁵ the monodromy coefficients are 5 and 5/2. Retain that adapter when redirecting ownership.

### 2. General B-pair chain comparison and relative descent

At §§4.5 and 7.6, specify an actual natural map or resolution producing the chain-level quasi-isomorphism, its common radius domains, and compatibility with restriction, cup products, twists and connecting maps. Nakamura Appendix §5, Theorem 5.11, pp.565–566, proves an isomorphism of cohomological δ-functors. KL Remark 9.5.9 points to this theory; Ding Lemma 2.1 is only a quotient H⁰ calculation. KL Theorem 9.4.5 supplies the local-system comparison, not the promised construction for every nonétale module. The words “chartwise comparison, then hypercover descent” currently assume the key chartwise map and its compatibility. They do not close it. These gaps are now visible in both subsections.

### 3. Concrete construction/proof inputs still missing

| Subsection | What the source actually supplies | Missing part |
|---|---|---|
| §0.4 | BC p.129 asserts the geometric embedding; FO Exercise 6.3 asks for it. FO Lemma 6.12 uses the separated ξ/p-series ring. | Coefficient-independence/separation proof for that ring and the embedding. A named target is present, but its proof route must justify the separatedness it uses. |
| §0.6 | Disegni–Liu Appendix B.5, pp.91–92, uses the Kato–Tsuji P_l and states the edge lemmas. | Explicit P_l presentation, operators, transitions, topology and convergence. Calling an unspecified PD algebra by that name does not define it. |
| §2.5 | TT Lemma 2.7, pp.7–9, uses Brinon Proposition 6.1.2; TT Proposition 2.23, pp.19–22, refers injection to Brinon Proposition 6.2.1. | Direct proof of the mod-p divided-power coefficient presentation and relative injection/separation, or an accessible fully checked source. Bounded images construct a map but do not prove it injective. The restricted Brinon work was not used. |
| §2.6 | A relative polynomial semistable extension is specified. | Supply the relative logarithmic coefficient-independence argument using the preceding separation result; field transcendence by itself is insufficient. No logarithmic semistable-model theorem is imported backwards. |
| §2.7 | Scholze survey Theorem 3.17, pp.19–20, proves the singular proper statement through a smooth complement and j_! boundary comparison. | Include that restricted compact-support input, or construct an alternative proper-hypercover argument with descent and the dimension bound. The previous claim that compact-support input is unused was unsupported. |
| §6.4 | KW-II Lemma 3.5 states the local implication; CDT Lemma 2.1.2 proves a connected–étale calculation with specific deformation/determinant and residual assumptions. | A lower named contract and proof adapter identifying the potentially crystalline lift with the group in CDT and checking those hypotheses. Its crystalline-lattice equivalence alone does not supply that calculation. The BLZ endpoint route is now supplied separately. |
| §9.3 | Current EllipticCurves Layers 4–5 provide Tate uniformization, twists, and nonsplit multiplicative⇒quadratic split. | The stronger all-p classification “v(j)<0; η ramified iff additive potentially multiplicative, η unramified iff multiplicative” is only assigned to a proposed Part II. Identify a real supplier/extension, with the ramified p=2 minimal-reduction argument. Do not replan the existing twist construction. |

Other supplier qualifications remain visible: RD.2's constant field must be F'_L (not automatically L₀); the degree-one contravariant Dieudonné comparison must retain σ pullback; and the H¹/Kottwitz identification used by the general period torsor is stronger than merely having a Kottwitz map. None is certified by this review merely from an import name.

## Adversarial mathematics pass

The rows cover the assertions, defining properties, API identities and conventions in each numerical subsection, including the checks attached there. “Retained” means no counterexample was found in these instances; it does not override the open construction/dependency findings above. The packet concordance following the table identifies the target statements covered by each row. Every Lean variable block was read separately.

| Statements / definitions / convention | Instances and computations tried | Result / action |
|---|---|---|
| Standing bases, coefficients and topologies | p=2; ramified e=2; finite K versus perfect infinite residue; equal characteristic | General analytic assertions explicitly separate from mixed-characteristic periods. No substitution of C_p for a general completed algebraic closure is licensed. |
| Covariance, twist, filtration, Nφ and Weil direction | Q_p(1): φ=p⁻¹, jump −1, arithmetic Weil=q; N(y)=x; p=2 | Matrix witnesses agree; Nφ=pφN, arithmetic rNr⁻¹=qN. |
| Complex/tensor/dual conventions | Two degree-one terms; shift by 1; jump r and its dual | Cup swap gives −1; shifted differential negates; dual jump is −r. Retained. |
| §0.1 C/action, descent, Ax–Sen, trace and Tate–Sen | Identity action; zero module; finite L/F standard action gives invariants F; r=0 and r=1; trace of 1 and a next-level root of unity | Added discrete-versus-complete descent and three trace tests. H¹(C) is not claimed zero. Ownership remains open. |
| §0.2 tilt, sharp, theta, affinoid and geometric de Rham | ε sharp=1 but ε≠1 at p=2; θ([p♭])=p; ξ nonunit; ξ valuation 1 | Fixed false algebraic-closure assertion using X²−ξ. Nonunit/DVR and coefficient-field tests retained. |
| §0.3 topology, t, B_HT | pⁿ→0 in coefficients; t mod t²; 1+t in C[t,t⁻¹] | Discrete quotient topology fails; gr¹=C(1); 1+t is not a Laurent unit. Retained. |
| §0.4 PD embedding/presentations, I^[r], Frobenius/localizations/sequences | r=0; p=2, γ₂(ξ)=ξ²/2; μ+p; θφ(ξ)=p^p−p; 1/p and t; r=0 quotient zero | Fixed membership and subring comparisons. No claim φ preserves Fil¹. Separation proof remains open. |
| §0.5 B_max, branch logarithms, B_st, kernels/invariants | Unit/trivial branch; q=p; d/du of u and u²; ramified coefficient Frobenius | N(u)=−1, N(u²)=−2u; branch change exponential has stated sign; no Frobenius endomorphism of arbitrary ramified K assumed. Lower ownership remains. |
| §0.6 completed B_st, P_l, edge map | D=0; N=0; constant specialization; φ=p^r restriction | Eigenspace restriction retained; cannot infer the unrestricted edge assertion. P_l construction remains open. |
| §1.1 convergence/norm/convolution | Zero and finite Laurent support; 1+T norm=max(1,ρ); geometric coefficients at ρ<1 and ρ=1; empty I | Convergence hypotheses and positive radii are needed for norm results. Empty I defines all coefficient families but cannot instantiate a norm bound requiring ρ∈I. |
| §1.2 topology, restriction/evaluation, base extension | Compact singleton; coefficient monomial; zero; evaluation of T−c at c; finite and arbitrary complete L | Norm cannot be replaced by point evaluation. Added weighted-basis proof; integral tensor statement requires finite freeness. |
| §1.3 units, differentiation, Robba limit | T a unit; T−c has a zero; derivative of T⁻¹=−T⁻²; zero function | Unit/nonzero distinction and cofinal radius dependence retained. |
| §1.4 bounded/Amice/integral rings, φ, Γ, ψ | Coefficient 1; π; φ(π)=(1+π)^p−1 at p=2; ψ(1)=1 and ψ(1+π)=0 | ψ is not a ring homomorphism. The p inverse in its trace formula is in rational coefficients. |
| §1.5 logarithm/evaluation/localization | First terms π−π²/2; ζ−1 simple zero; n=0; φ(t)=pt, Γ_a(t)=at | Product denominators are nonzero scalars; finite divisibility assertions keep distinct zeros and stage bounds. |
| §2.1 completed/uncompleted structure and inverse limits | Point; toric dimension 0; modulo p; rank zero | Algebraic colimit is not completed without its boundedness/completion theorem. Retained. |
| §2.2 horizontal periods/filtration | Point; Fil⁰; ξ quotient; inverse system of zero modules | Period filtration distinguished from p-adic completion; exactness requires the stated limits hypotheses. |
| §2.3 structural sheaves, connection and Poincaré | d=0; d=1, ∇u=dT; ordered toric logarithm translates by +c t; first two integration terms | Erratum's completed structural object retained; coefficient topology cannot be discrete. TT citation scoped to crystalline analogue. |
| §2.4 toric descent and HT | d=0; one torus coordinate; geometric versus arithmetic Galois; trivial and twisted coefficients | Geometric dlog term and arithmetic C-invariants kept separate; no arbitrary extension claimed HT. |
| §2.5 crystalline sheaves/connection/Frobenius lift | p=2; ξ^p/p; θφ(ξ); lift T^p changed to T^p+pT; d=0 | Lift change adds pT structurally and vanishes horizontally; φ is not filtered. Relative presentation/injection remain open. |
| §2.6 polynomial semistable sheaves | Degree 0, 1, 2 polynomial; N=−d/du; field versus relative affinoid | N kernel is constant in characteristic 0; relative injectivity still needs coefficient proof. |
| §2.7 primitive, finite-image, integral comparison | Point; rank 0; k=0 requires N≥2; one strict subdisc; torsion complex; singular X | A smaller disc is not a cover. Almost finite generation is not freeness. Added singular-proof gap; finite image uses k+2 levels. |
| §3.1 regular periods/dimension | V=0 and Q_p; B_dR over ramified K; fixed line with invertible versus noninvertible period | Dimension bound needs regularity, not arbitrary invariant rings. Duplicate lower foundations remain. |
| §3.2 filtrations/weights/strictness | Zero; one jump r; identity with unequal filtrations; dual/tensor of lines | Bijective filtered map need not be strict; full filtered category not abelian. Retained. |
| §3.3 D_HT/D_dR/D_cris/D_st and descent | Q_p, Q_p(1), zero; finite ramified versus unramified induction; nonsplit log χ extension | HT exactness conditioned on middle object; crystalline induction requires unramified extension. Lower ownership remains. |
| §3.4 filtered φ,N, numbers, WA and HN | Rank 0; rank 1 φ=p with jump 0; slope sum −1+1; stable subline | Degree=t_N−t_H; total degree zero insufficient; all stable subobjects tested. Import carrier from lower finite-flat package. |
| §3.5 fully faithful/admissible/CF | Zero, unit, Tate twist; N=0 and N≠0; finite K versus general perfect residue | Full faithfulness source corrected. General CF is §5.5, not an inference from finite-K Robba theory. |
| §3.6 flags/characters/tensor groups | Rank 0/1; two labels with different weights; finite ramified character; Artin(unit) inverse | All-unit crystalline versus open-unit potentially crystalline distinguished; added Conrad source. |
| §3.7 fundamental complex | D=0; admissible D=unit; nonadmissible slope/filtration mismatch | H¹=0 uses admissibility; arbitrary D not silently included. |
| §4.1 coefficient fields/extended rings/logarithms | K=Q_p; ramified K; F'_K larger than K₀; log degree 0,1 | Erratum's constant field retained; field transcendence cannot replace relative version. |
| §4.2 decompletion/derivatives/plus sequence | (x,−x) maps to zero under addition; trivial T; mod-p cocycle and p-series | Added Colmez IV.2.4; invariants are not assumed right exact. |
| §4.3 étale realization/overconvergence/connection | Zero, unit, Tate twist; direct sum; finite-radius Frobenius | Rank and changed radii retained; connection follows chosen cyclotomic normalization. Lower overlap must be resolved. |
| §4.4 Sen/differential/Wach | Unit; χ; nonintegral weight; p=2; positive weights dualized for Wach | Nonintegral weight fails de Rham; bridge now imported only in its actual p>2 frame. |
| §4.5 B-pairs, Herr, δ-functors, Sen blocks | Zero/unit; slope-one nonétale line; φ=2,γ=3; d¹(1,0)=2; orbit {0}; log χ block dimension 2 | Added sign adapter and source corrections. Sen division factor forces dimension |A|p^s. Full derived map remains open. |
| §5.1 de Rham differential equation/monodromy | Unit; rank zero; nontrivial Tate monodromy; F'_L≠L₀ before enlargement | Preserve enlargement step; do not replace constants by L₀ automatically. |
| §5.2 modification/equivalence/slopes | Unit; φ=p,jump 0; slopes −1,+1; altered positive lattice | Degree-zero unstable object is not étale; reconstruction needs III.2.4 plus erratum. |
| §5.3 pst and WD | Unit, Q_p(1); f_K=2; Φ_K has absolute exponent 2; e=2 normalization | Arithmetic inverse φ^−f, not φ^−1 for general residue degree. Choice independence is isomorphism class. Duplicate Néron recipe must be imported. |
| §5.4 characters, purity, rank-two types | χ and unramified λ; ordinary versus supersingular elliptic H¹; twist of a special type | Weight/inertia do not fix Frobenius; special means N≠0, not a prescribed numerical slope. |
| §5.5 general CF/tensor torsor | GL₁ b=p^m, μ=h gives m−h; unit torsor; inadmissible m=1,h=0; perfect infinite residue | κ−μ sign fixed; inadmissible test does not assert a torsor theorem. Underlying local H¹ identification remains a supplier obligation. |
| §6.1 rational FL/signs | Rank 0/unit; weight 1; p=2 and length<p; Fil^p endpoint | Covariant versus contravariant realizations are dual; no unrestricted integral conclusion at p=2. |
| §6.2 lattices/torsion/essential image | Zero; μ_p; endpoints 0 and p−1 with same tame character; p=2 | Safe window differs from rational length<p; faithful is not essentially surjective. Locators corrected. |
| §6.3 ordinary filtration/extensions | Rank 0; split χ⊕1; Tate extension; finite inertia unipotent in characteristic 0 | Rank 0 ordinary; de Rham hypothesis essential for extension theorem. |
| §6.4 rank two/lifting/BT | p=2; r=1 and r=2; coefficient √p; unit root; k=p and p+1; Tate curve N≠0 | No parity claim for arbitrary E. All-p height-one source corrected; BLZ endpoint argument added; CDT adapter remains. |
| §7.1 lattices/connections/reconstruction | Rank 0, trivial line, nonintegral exponent; two-term differential | Horizontal lattice need not arise from arbitrary unfiltered bundle; equivalence retains integrability/filtration conditions. |
| §7.2 lisse coefficients/proper de Rham | Point, rank 0; P¹ H¹(O)=0, H¹(Ω¹)=K; torsion stalk versus finite-free system | Exact rational map comes after derived/integral comparison; no inferred torsion-freeness of integral cohomology. |
| §7.3 pushforwards/de Rham pairs | Identity map; abelian family dimension 0 and 1; degree 2 Tate line | R¹ is dual Tate system; finite locally constant reduction hypotheses retained in every degree used. |
| §7.4 analytic/diamond interfaces | Point; unit line; arbitrary v-sheaf outside local-system subcategory | No unrestricted equivalence of all v-sheaves/topoi asserted. |
| §7.5 relative periods/curves/patching | Point; unit untilt ideal; generator ξ changed by unit; slope 1; degree 0 unstable sum | Classical adic curve is imported; relative Proj/patching is stronger. Rank-one classification does not imply higher-rank relative statement. |
| §7.6 relative complexes/descent | Zero; unit; differential φ−1 with φ=2 sends 1↦1; pair (1,1) maps to 0 | Sign of connecting map pinned; hypercohomology needed; general derived comparison remains explicit gap. |
| §8.1 geometric comparison | Point; P¹ top line; smooth curve H¹; p=2; proper rigid without semistable model | Potential semistability does not assert existence of a semistable model; general-residue geometric extension not claimed. |
| §8.2 functoriality/dual/twist/trace | Dimension 0 and 1; Q_p(1); dual H¹; scalar-multiplied comparison | Multiplicativity alone does not fix trace scalar; actual map/trace supplier retained. |
| §8.3 abelian/Dieudonné/Hodge | g=0,1; ordinary/supersingular; polarization divisible by p; σ pullback | Weights 0,1 on V_p, negatives on H¹; rational polarization remains invertible. Duplicate lower comparison remains. |
| §9.1 Kummer/lattices/Ext | q=1; root of unity; q=p; root change; matrices (2,3)(5,7)=(10,17) | Cocycle is twisted; finite Kummer not equated with completed continuous Ext without adapter. |
| §9.2 Tate periods/L-invariant | q=p; v=0 rejected for ratio theorem; v=2,ell=4; scaling; branch b=3; p=2 | Added rank-two hypothesis/direct argument; L=2, branch gives 5; scalar matrix tests do not construct a period representation. |
| §9.3 reduction | Zero-dimensional abelian; good supersingular; split Tate; unramified/ramified quadratic twist at p=2 | Compatible actual lattice models required. Existing twist construction imported; stronger Part II classification still unsupplied. |
| §9.4 good-place compatibility | g=0; elliptic polynomial X²−aX+p; dual polynomial X²−(a/p)X+1/p; inverse again | Two inversions recover arithmetic polynomial; equality of total polynomial not equality of arbitrary projector summands. |

## Sources: random sample of 15

Locators refer to the versions linked in the README, not an assumed common pagination. These are independently checked citations; the original selected paragraphs were fixed before the edits.

| Sample | Paragraph | Checked location and outcome |
|---|---|---|
| 1 | §1.2 coefficient extension | KL Definitions 2.1.10/2.2.15, pp.27,33, define the tensor topology; Berger I.3.2, p.7, is not this theorem. Replaced by direct proof. |
| 2 | §1.5 logarithm/zeros | Berger introduction IV.2, V.1.1, pp.26–27,34; compatible with the cyclotomic logarithm/product statement. |
| 3 | §2.3 structural correction | Scholze 2013 Lemmas 6.11–6.12, Proposition 6.10, pp.38–39, with 2016 erratum pp.2–3. Corrected construction rather than naive tensor completion retained. |
| 4 | §3.5 full faithfulness | BC 9.1.8/9.1.9, pp.133–134, and 9.2.13–9.2.14, pp.145–146; added 9.1.11, p.135, for full faithfulness. |
| 5 | §5.2 reconstruction | Berger III.2.3, pp.15–16, III.2.4, p.17, plus erratum §4, p.4. Added missing equivalence locator. |
| 6 | §9.2 L-invariant | BC Proposition 8.3.8, pp.123–126, is Q_p/contravariant; Berger introduction II.4.3, p.18, gives Tate periods. Added finite-K covariant basis proof and rank hypothesis. |
| 7 | §3.3 base change/induction | BC Theorem 2.4.6, p.20; Propositions 6.3.2–6.3.3, 6.3.8, pp.76–80; discussion before 9.3.1, p.146. Kept unramified condition for crystalline/semistable induction. |
| 8 | §3.2 strictness | BC §6.2 and Definition 6.2.5, pp.74–75. Filtration-preserving bijection need not be strict. |
| 9 | §5.1 monodromy | Berger 2002 Theorem 5.19, pp.56–58; FO Theorem B/Remark 6.60, p.142. Constant-field enlargement remains necessary. |
| 10 | §8.1 proper smooth comparison | Scholze 7.11, 8.4, Remark 7.12, pp.46–49; Betts–Stix Propositions 3.18–3.19, pp.26–27. Correct cohomological weight sign. |
| 11 | §6.4 all-p BT | KW-I §9 and BC Part III introduction are not a proof locator for the lattice theorem. Replaced by Tong Liu 1.0.1/2.2.1, pp.662,666, including p=2. |
| 12 | §6.4 FL endpoints | KW-I 4.1/5.1 are global applications. Replaced by FL 0.8–0.9, pp.551–552; 3.3, pp.562–563; 6.1, pp.581–582; KW-II 3.5(i), pp.22–23. |
| 13 | §3.5 general-base CF | FO Theorem A/Proposition A2, pp.140–141; Berger V.2.1/V.2.2, pp.21–22; Guo–Liu–Xu §5.1, pp.835–836. Algebraically closed-residue extension distinguished from finite K. |
| 14 | §2.5 structural crystalline | TT Definition 2.9, Proposition 2.13, Lemma 2.14, Corollaries 2.15–2.19, pp.13–18. Valid in smooth formal absolutely unramified setting. |
| 15 | §2.3 completed Poincaré | Scholze Corollary 6.15/Proposition 8.5, pp.39,49; TT 5.1(1), p.43, is crystalline. Attribution corrected; own completed integration route retained. |

## Sources: every author-flagged subject

The numbers here match the 25 P7 and two R06.5 rows in the author's handoff. A source can confirm a theorem while leaving its underlying proof dependency unverified; those cases are distinguished explicitly.

| Flag | Source actually read | Review disposition |
|---|---|---|
| P7 1 | Berger 2002 Proposition 2.25, pp.24–25; FO Lemma 6.12, pp.119–121 | Logarithmic transcendence has a source; the enlarged coefficient/separation input is still not proved by the displayed series. |
| P7 2 | Colmez IV.1.4, IV.2.3–IV.2.4, pp.33–34 | Read the mod-p induction/p-series proof and added precise source/route. |
| P7 3 | Berger 2004 Wach material and lower finite-flat §R07.4.26 | Bridge is already owned below; corrected import and p>2 frame. |
| P7 4 | Liu §2.1, Theorems 2.3 and 4.7, pp.7–9,11–12,25 | Corrected citation and differential adapter. Residue trace still has to be transported through the adapter. |
| P7 5 | TT Proposition 2.23, pp.19–22 | Map construction read; the relative injection proof is referred to Brinon. Marked remaining proof, not certified from TT alone. |
| P7 6 | TT Lemma 2.7, pp.7–9 | Truncated PD presentation is referred to Brinon 6.1.2. Marked direct presentation proof needed. |
| P7 7 | §2.6's proposed polynomial construction, compared with TT's crystalline setting | No source for the full proposed relative injectivity; retained as explicit construction obligation depending on separation. |
| P7 8 | KL tensor definitions; Scholze corrected structural proof; TT completion estimates; §7 supplier hypotheses | Fixed scalar-extension route; boundedness/closed-image conditions retained. This is not certification of every new analytic argument. |
| P7 9 | BC §9.1, pp.128–131; FO Exercise 6.3, p.114 | Field embedding is sourced, but its coefficient proof remains an open plan detail. |
| P7 10 | FO Lemma 6.12 and proof, pp.119–121 | The series ring is used as separated; explicit independent separation proof remains needed. |
| P7 11 | CF Theorem 4.3 and §6.2; FO A/A2; Berger V.2.1–V.2.2 | General-base analytic route retained; finite-K route kept separate. External ownership rewiring is not done by this review. |
| P7 12 | Fontaine 1982 public Annals article, §§5.5, 6.2–6.6, pp.563–567; FL 8.4 | Read the relevant public BT-period construction/comparison, not an uncleared book. Does not alone certify all FL integral essential-image dependencies. |
| P7 13 | Breuil–Schneider §4, pp.13–15 | Recipe and transport read; independence is up to generally noncanonical isomorphism. |
| P7 14 | Berger 2008 Appendix B and erratum | Actual constants F'_L retained. Lower RD.2 export still needs coordinated correction. |
| P7 15 | FL 3.3, 6.1, 7.14–7.15, 8.4 | Kept endpoint restrictions and separated full faithfulness from essential image; corrected pagination. |
| P7 16 | Disegni–Liu Appendix B.5, pp.91–92, Lemmas B.13–B.14/Remark B.15 | Edge theorem sourced; P_l presentation not supplied there. Explicit gap added. |
| P7 17 | Conrad Appendix B, Proposition B.4 and proof, pp.35–36 | All-unit character criterion confirmed and source added. |
| P7 18 | CF general-base argument; Wintenberger §§4.1–4.5, especially Proposition 4.5.3, pp.1329–1332 | κ−μ convention confirmed. Full H¹/Kottwitz foundation is an import obligation, not established just from the map's existence. |
| P7 19 | Fontaine 2004 §2.6, pp.39–43, §3.7, pp.67–69 | Sen-orbit/simple-block and division-algebra restrictions supported. |
| P7 20 | KL §§9.3–9.5; Ding Lemma 2.1; Nakamura Appendix §5, Theorems 5.10–5.11, pp.565–566 | Cohomological comparison supported; multiplicative chain map/general relative derived descent remain gaps. |
| P7 21 | KW-II 3.4–3.5, pp.22–23; BLZ §4.1; CDT 2.1.2, p.8 | BLZ proof route supplied; corrected CDT attribution. Its general-use hypothesis/connected–étale adapter remains a lower contract. |
| P7 22 | Scholze survey 3.17 and proof, pp.19–20; Zavyalov 5.5.1, pp.81–82 | Survey uses j_! comparison. Marked missing restricted input/alternative descent proof. |
| P7 23 | Survey smooth-complement proof preceding/within 3.17 | General log/compact support can remain outgoing, but the restricted input for the preceding proper proof cannot be disclaimed. |
| P7 24 | Scholze 2013 Lemmas 5.3–5.4, pp.28–30; BMS §5 | k≤N−2 indexing and almost-free/Frobenius issue checked; no arbitrary-submodule shortcut accepted. |
| P7 25 | §8.1 compared with the finite-K hypotheses in its sources | General-perfect-residue geometric comparison is not claimed; no false extension from algebraic CF. |
| R06.5 1 | §8.3, finite-flat Dieudonné export and CrystallineCohomology CR.7.2 | σ-pullback/contravariance boundary retained. Full BBM proof not checked; uncleared volume not used. |
| R06.5 2 | Current EllipticCurves Layers 4–5 and their Suggested.lean; BC Example 9.2.9, p.143; Berger II.4.1, p.17 | Existing Tate/twist construction is not replanned. Complete ramified potentially multiplicative classification remains an unsupplied Part II contract. |

## Library and current-upstream duplication audit

Pinned elaboration baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Also inspected current TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read-only. The library-coverage file was inspected: it has no dedicated PadicHodgeTheory audit entry to treat as certification.

Searches used mathematical objects (theta kernels, completion/localization, semilinear Frobenius, two-sided coefficient decay/convolution, cyclotomic completion, curve windows/quotients, Kummer cocycles, Tate specialization), not just this package's names. The nine roadmaps newer than the atlas snapshot and Completed roadmaps were included in the search. Two current roadmaps were read as models; relevant hits were read in the declarations themselves.

| Existing item read | Exact boundary / consequence |
|---|---|
| Mathlib FontaineTheta and BDeRham | The carriers require completeness/nonunit assumptions; they do not by themselves assert the geometric DVR, natural topology or comparison theorem. `thetaDR` is a genuine composite of evaluation and `kerLift`, not a replacement carrier. |
| Mathlib WittVector.Isocrystal | Existing semilinear carrier and rank-one algebraically closed-residue classification are inputs. General filtered/relative higher-rank results are stronger. |
| Tau Ceti TwoSidedSeries Basic/Convolution/Ring | Cofinite decay and convolution supply radius one. The arbitrary-positive-radius/interval norm statements are additional; the radius-one equivalence is an adapter. |
| Tau Ceti FarguesFontaine Y/Window/Quotient | `spaY`, perfect-R Frobenius homeomorphism, window topology, `spaX` and quotient map are already inputs. No scheme-Proj/relative untilt patching theorem was found in those declarations. |
| Current AdicSpaces §§6.1–6.4; AlgebraicVectorBundles Layer 0C | Classical interval/sheaf curve and vector-bundle tensor operations are imported. Retained relative period-lattice, filtration and descent variants state their additional scope. |
| Current LocalGaloisGroups, especially Layers 5/7 | Cyclotomic orientation, completion action and multiplicative p-completion are existing inputs. No second completion carrier is needed for §9.1. |
| Current ClassFieldTheory; Tau Ceti KummerMap | Finite Kummer with its unit/invertibility hypotheses is available. Completed continuous lattice/Ext comparison is an adapter, not the finite theorem renamed. |
| Current EllipticCurves Layers 2/4/5; current TateCurveSpecialization | Tate-module, pointwise Tate uniformization, curve specialization and quadratic twist objects are existing inputs. The residue-characteristic coefficient adapter and periods differ. The stronger twist/reduction contract remains separate as described above. |
| Newer DifferentialGeometry, IntegralLattices, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic, RealAlgebraicGeometry and Completed roadmaps | No hit supplying the retained period/Robba/Herr/geometric-comparison target families. General linear/topological background is not a period theorem. |

No additional current-main target removal was justified beyond the already imported boundaries. The Wach bridge was removed as newly owned work and redirected to its lower package. The substantial lower-package collisions are reported above and prevent acceptance; they have not been concealed by claiming the current-main audit was clean.

## Lean signatures and tests

All eight light definitions have real bodies: thetaDR, laurentConvergesOn, gaussNorm, kummerMatrix, tateLInvariant, tatePhiMatrix, tateMonodromyMatrix, tateFiltrationVector. No sorry'd carrier/data definition was introduced. Heavy objects remain README targets and are identified by family in the closing comment. The file stays far below 5,000 lines and follows the namespace/layer order of the exemplar.

Ten signature checks, in addition to reading every variable block:

| Signature | Hypotheses/generality and adversarial check |
|---|---|
| `cpIntegers_p_not_unit`, `cpIntegers_complete`, `cpIntegers_frobenius_surjective` | p prime, actual PadicComplexInt; p=2 allowed. Not asserted for arbitrary valuation subrings. |
| `bdrPlus_complete_dvr` | Actual Mathlib completion; completeness/nonunit instances explicit; existential domain instance used for the DVR. Does not claim algebraically closed fraction field. |
| `thetaDR_coe`, `thetaDR_surjective` | Source is localization of actual Witt/PreTilt, target localization of O_C; no arbitrary map called theta. |
| `norm_coeff_mul_le_gaussNorm`, `gaussNorm_eq_zero_iff` | Convergence, positive radius and membership in I all present. Not false for an unbounded family under a conditional supremum. |
| `laurentConvergesOn_singleton_one` | Same cofinite-decay condition as existing restricted coefficients, over a normed field. |
| `laurentConvergesOn_convolution`, `gaussNorm_convolution` | Complete ultrametric field appears before these declarations; actual discrete convolution. No multiplicativity promised over an arbitrary archimedean norm. |
| `kummerMatrix_mul`, `_det`, `_coboundary` | CommRing generality is correct: these are algebraic identities; multiplicative character invertibility belongs to the representation construction. |
| `tateLInvariant_scale`, `_branch` | Field; valuation denominator nonzero, and common scale nonzero when cancellation is used. Zero denominator is not justified by Lean's total division. |
| `tateNormalForm_iso` | Both valuations nonzero and both basis scales nonzero; exactly the scalar diagonal-intertwiner/filtration calculation in the README, not a construction of Galois representations. |
| `tateMonodromy_frobenius`, `_arithmeticFrobenius` | Field and r≠0; inverse period matrix versus arithmetic matrix; transposed N is a negative control. |

The kept definitions' tests include zero/finite Laurent support, divergent unit-circle coefficients, non-pointwise Gauss norm, zero monodromy versus nonzero nilpotent monodromy, p=2 reciprocal Frobenius, Kummer root-change sign, branch scaling and filtration transversality. The new Herr coordinate-swap test is proved by rational computation. The theta kernel negative control elaborates with sorry. These examples pin elementary identities only; they do not prove the heavy source theorems.

## Supplier closure audit and bundle consistency

The 59 input requests were checked against the current supplier sections, tier order and package statements. The following concordance records every edge and its review qualification. “Retained” means the contract is stated with the indicated scope, not that every lower theorem has been formalized. The review does not modify external supplier packages.

| Request | Supplier | Independent disposition |
|---|---|---|
| P7 1 | `PhiGammaModulesAndIwasawaCohomology:PG.0` | §4.1 owned descent/rings; PG is higher, so no incoming PG edge. Lower finite-flat overlap still needs resolution. |
| P7 2 | `PhiGammaModulesAndIwasawaCohomology:PG.1` | §4.3 owned étale equivalence; higher PG imports it, subject to lower-owner reconciliation. |
| P7 3 | `PhiGammaModulesAndIwasawaCohomology:PG.2` | §§4.2–4.3 owned overconvergence/localization; radii and constants retained. |
| P7 4 | `PhiGammaModulesAndIwasawaCohomology:PG.3` | §4.5 owned Herr theory; finite torsion first, sign adapter corrected; full derived map open. |
| P7 5 | `PhiGammaModulesAndIwasawaCohomology:PG.5` | Full Iwasawa comparison is outgoing PG work; no incoming prerequisite retained. |
| P7 6 | `PhiGammaModulesAndIwasawaCohomology:PG.6` | §4.4 Wach theory; bridge now imports exact finite-flat R07.4.26, p>2 frame. |
| P7 7 | `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3` | §§6.1–6.2 import FL; rational window and restricted integral endpoint kept distinct. |
| P7 8 | `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4` | §§4.4,6.4 import height-one/lattice theory; Wach bridge corrected, CDT residual adapter open. |
| P7 9 | `AInfCohomology:AI.3` | Early A_inf sheaf only, §§2.1–2.3,7.1; later proper comparisons excluded from these inputs. |
| P7 10 | `AdicEtaleGeometry:A1` | Corrected pro-étale site/projection and perfectoid basis, §§2.1,7.2; retained. |
| P7 11 | `AdicEtaleGeometry:A2` | Toric charts and étale forms, §§2.1,2.3; structural completion remains owned here. |
| P7 12 | `ClassicalAdicEtaleCohomology:H0` | Derived/Čech/continuous cohomology, §§2.4,2.7,7.3,7.6; all-module chain comparison not inferred. |
| P7 13 | `AdicSpacesPartII:R0` | Algebraic toric models, §2.3; no global toric-chart assumption. |
| P7 14 | `AdicSpacesPartII:R2` | Smooth formal models and local Frobenius lifts, §2.5; unramified base and lift dependence retained. |
| P7 15 | `AdicSpacesPartII:R3` | Coherent proper finiteness/closed images, §§1.2,7.2–7.3; completion exchanges still need stated bounds. |
| P7 16 | `CrystallineCohomology:CR.0` | PD envelopes/completion, §2.5; relative coefficient/injection proofs remain open. |
| P7 17 | `AlgebraicModuliForArithmeticGeometry:A0-extension` | Finite normalization over excellent W(k) model, §2.3, routed to actual SchemeAndStackFoundations SF.0. |
| P7 18 | `CrystallineCohomology:CR.0` | PD envelope, §0.4; embedding and separation are additional targets, not envelope consequences. |
| P7 19 | `ArithmeticGaloisRepresentations:R01.1` | Representation carriers/tensors/duals/induction, §3.3; continuous topology retained. |
| P7 20 | `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration` | Ramification/trace input, §0.1; not a supplier of the missing full Tate–Sen theorem. |
| P7 21 | `PhiGammaModulesAndIwasawaCohomology:PG.0` | §4.1, same PG.0 move as request 1; use F′_K rather than automatically K₀. |
| P7 22 | `PhiGammaModulesAndIwasawaCohomology:PG.1` | §4.3, same higher-PG equivalence move as request 2. |
| P7 23 | `PhiGammaModulesAndIwasawaCohomology:PG.2` | §§4.2–4.3, same higher-PG overconvergence move as request 3. |
| P7 24 | `ArithmeticGaloisRepresentations:R01.2` | WD carrier in §5.3 retained; recipe is already owned by lower Néron §5.3 and must be imported. |
| P7 25 | `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3` | Lower FL input, §§6.1–6.2; endpoints and covariance remain explicit. |
| P7 26 | `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4` | Lower all-p stable lattice/height-one input, §6.4; extra CDT reduction adapter is not supplied just by classification. |
| P7 27 | `AInfCohomology:AI.0:integral` | Early integral ε,μ,kernel, §0.2; supplied tilt and roots are not reconstructed. |
| P7 28 | `PerfectoidSpaces:P0` | Almost-module calculus, §2.7; finite-image argument uses k+2 cover levels. |
| P7 29 | `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors` | Arithmetic Artin, §3.6; units have inverse norm cyclotomic orientation. |
| P7 30 | `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules` | Tensor representations/cocharacters, §3.6; filtered realizations are additional. |
| P7 31 | `BunGAndNewtonStrata:BG1` | Minimal B(G)/Newton/period-torsor moved to §5.5; H¹/Kottwitz identification must be supplied beyond the map. |
| P7 32 | `VectorBundlesAndIsocrystals:VB4` | Filtered HN §3.4/modification §5.2/relative comparison §§7.5–7.6 moved down; analytic/geometric degrees opposite. |
| P7 33 | `ArithmeticGaloisDuality:R02.1` | Continuous cups/trace, §4.5; χ_ur cup κ(p) trace +1, transported through Herr sign adapter. |
| P7 34 | `PadicDifferentialEquationsAndRigidCohomology:RD.2` | Lower slope/local monodromy, §§5.1–5.2; F′_L correction still needed in the lower export. |
| P7 35 | `DiamondsAndVStacks:D1` | Associated diamond, §7.4; no new diamond construction. |
| P7 36 | `DiamondsAndVStacks:D2` | Perfectoid pullback/descent, §7.4; not unrestricted v-sheaf equivalence. |
| P7 37 | `DiamondsAndVStacks:D3` | Finite locally free descent, §7.4; retained on the coefficient categories used. |
| P7 38 | `DiamondsAndVStacks:D6` | Pro-étale topos comparison, §7.4; no equality of full v-topoi claimed. |
| P7 39 | `RelativeFarguesFontaine:RF0` | Relative uniform interval/Robba rings moved down to §7.5; classical AdicSpaces rings imported. |
| P7 40 | `PerfectoidSpaces:P2` | Tilting/completed tensors, §7.5; retain hypotheses on perfect uniform base. |
| P7 41 | `PerfectoidSpaces:P3` | Finite étale/Artin–Schreier–Witt descent, §7.5; integral almost qualifications retained. |
| P7 42 | `VectorBundlesAndIsocrystals:VB2:classification` | Higher-rank point slope comparison moved to §7.5; not inferred solely from Mathlib rank one. |
| P7 43 | `RelativeFarguesFontaine:RF1` | Relative Proj/adic comparison moved to §7.5; existing classical quotient boundary retained. |
| P7 44 | `RelativeFarguesFontaine:RF2:untilts` | Untilting divisor/completion moved to §7.5; equation-unit independence explicit. |
| P7 45 | `RelativeFarguesFontaine:RF4:vector-bundles` | Minimal patching §7.5 and all-module descent §7.6 moved down; derived comparison remains open. |
| R06.5 1 | `ClassicalAdicEtaleCohomology:H5` | §8.1 algebraic/analytic étale agreement, with actual maps, Galois action, cups and twists. |
| R06.5 2 | `DerivedDeRhamCohomology:DD.2` | §8.1 proper de Rham GAGA/perfectness; comparison map is the §7.2 map. |
| R06.5 3 | `CrystallineCohomology:CR.3` | §8.1 rational crystalline/BO comparison with Frobenius and trace; retained. |
| R06.5 4 | `AInfCohomology:AI.5` | §§8.1–8.2 actual early-to-global integral crystalline map; rational agreement must use §7.2. |
| R06.5 5 | `AInfCohomology:AI.6` | §§8.1–8.2 actual semistable map and normalized N; do not assume the later rational agreement to construct it. |
| R06.5 6 | `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2` | §8.3 degree-one contravariant Dieudonné/σ-pullback input; full BBM proof not independently certified. |
| R06.5 7 | `NeronModelsAndSemistableAbelianVarieties:R11.1` | §9.3 good-reduction predicate imported; not a replacement definition. |
| R06.5 8 | `NeronModelsAndSemistableAbelianVarieties:R11.3` | §9.3 compatible actual stable-lattice finite-flat models; single finite level/isogeny data insufficient. |
| R06.5 9 | `ArithmeticGaloisDuality:R02.1` | §9.1 compact H¹/inverse limit/rational Ext; finite Kummer alone insufficient. |
| R06.5 10 | `PadicDifferentialEquationsAndRigidCohomology:RD.7` | §9.4 Katz–Messing with geometric operator, followed by dual/arithmetic inversion; retained. |
| R06.5 11 | `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality` | §9.1 existing finite Kummer, extended by the continuous completion adapter. |
| R06.5 12 | `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group` | §9.1 normalized v_p and unit logarithm; existing completion used. |
| R06.5 13 | `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv` | §9.2 existing Tate uniformization; additional coefficient-prime-p torsion adapter retained. |
| R06.5 14 | `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5` | §9.3 existing twists imported; stronger ramification/reduction classification still an unsupplied Part II contract. |


The same-tier A_inf/Prismatic/PerfectoidQuotients bundle was checked against ASM-PadicHodgeTheory's ownership changes. The order must be: early integral sheaves and kernels; local/primitive comparison here; de Rham map in §7.2; global integral crystalline/semistable maps; rational agreement and the top Tate-line normalization. The minimal relative patching in §7.5 consumes early integral data, not a later global comparison that consumes it. General CohomologyComparisons/log compact support, local Langlands/Jacquet–Langlands, full PG Iwasawa theory and higher curve classifications are outgoing consumers. The ownership/cycle defect above is separate from these otherwise useful bundle separations.

## Input target concordance

All 318 node IDs in the two authoritative packets have an entry below. IDs are grouped by the subsection whose assertions were tested in the adversarial table; only the shared `PadicHodgeTheory:` prefix is suppressed. This is an inventory of the checked input statements, not a claim that a gap was closed. Imported targets must remain covered when the ownership repair is performed.

| Subsection | Input targets |
|---|---|
| §0.1 | `R06.1/cp-integers-p-adically-complete`; `R06.1/galois-action-on-cp`; `R06.1/semilinear-galois-descent`; `R06.1/ax-sen-lemma`; `R06.1/ax-sen-tate-invariants`; `R06.1/tate-trace-almost-surjective`; `R06.1/tate-sen-axioms-cyclotomic`; `R06.1/tate-sen-vanishing-on-hk`; `R06.1/tate-sen-theorem` |
| §0.2 | `R06.1/tilt-of-cp-and-special-elements`; `R06.1/explicit-generator-of-ker-theta`; `R06.1/bdr-plus-of-perfectoid-affinoid-algebras`; `R06.1/de-rham-period-ring`; `R06.1/bdr-plus-complete-dvr`; `R06.1/arithmetic-and-perfectoid-constructions-agree` |
| §0.3 | `R06.1/bdr-natural-topology`; `R06.1/algebraic-closure-in-bdr-plus`; `R06.1/fontaine-element-t`; `R06.1/hodge-tate-period-ring`; `R06.1/bdr-filtration-and-graded`; `R06.1/de-rham-invariants` |
| §0.4 | `R06.1/acris-embedding-into-bdr-plus`; `R06.1/frobenius-kernel-ideals-of-ainf`; `R06.1/t-in-acris`; `R06.1/frobenius-on-acris`; `R06.1/acris-completed-tensor-description`; `R06.1/acris-embedding-injective`; `R06.1/crystalline-period-ring`; `R06.1/galois-action-on-acris-continuous`; `R06.1/filtration-i-r-of-acris`; `R06.1/divided-frobenius-exact-sequence`; `R06.1/bcris-twisted-frobenius-sequences`; `R06.1/fundamental-exact-sequence` |
| §0.5 | `R06.1/bmax-period-ring`; `R06.1/k-tensor-bmax-injective`; `R06.1/k-tensor-bcris-injective`; `R06.1/crystalline-logarithm`; `R06.1/semistable-period-ring`; `R06.1/log-extension-to-kbar`; `R06.1/bst-embedding-into-bdr`; `R06.1/log-p-flat-transcendental`; `R06.1/k-tensor-bst-injective`; `R06.1/crystalline-semistable-invariants`; `R06.1/period-ring-invariants` |
| §0.6 | `R06.1/breuil-completed-semistable-rings`; `R06.1/completed-bst-nilpotent-part`; `R06.1/frobenius-restricted-monodromy-edge` |
| §1.1 | `P7:annulus-foundations/annulus-laurent-ring`; `P7:annulus-foundations/gauss-norm`; `P7:annulus-foundations/gauss-norm-multiplicative`; `P7:annulus-foundations/gauss-norm-maximum-principle` |
| §1.2 | `P7:annulus-foundations/frechet-topology`; `P7:annulus-foundations/restriction-maps`; `P7:annulus-foundations/annulus-limit-comparison`; `P7:annulus-foundations/evaluation-at-points`; `P7:annulus-foundations/gauss-norm-is-spectral-norm`; `P7:annulus-foundations/identity-principle`; `P7:annulus-foundations/coefficient-extension`; `P7:annulus-foundations/completed-base-change` |
| §1.3 | `P7:annulus-foundations/newton-polygon-breaks`; `P7:annulus-foundations/weierstrass-preparation-on-circles`; `P7:annulus-foundations/robba-ring`; `P7:annulus-foundations/annulus-factor-theorem`; `P7:annulus-foundations/annulus-derivation` |
| §1.4 | `P7:annulus-foundations/amice-ring`; `P7:annulus-foundations/bounded-robba-ring`; `P7:annulus-foundations/amice-ring-complete-dvf`; `P7:annulus-foundations/overconvergent-cyclotomic-rings`; `P7:annulus-foundations/cyclotomic-frobenius`; `P7:annulus-foundations/cyclotomic-gamma-action` |
| §1.5 | `P7:annulus-foundations/cyclotomic-log-element-t`; `P7:annulus-foundations/cyclotomic-derivation`; `P7:annulus-foundations/localisation-at-roots-of-unity`; `P7:annulus-foundations/cyclotomic-log-robba-ring` |
| §2.1 | `P8:local-rational/toric-charts-for-smooth-spaces`; `P8:local-rational/proetale-structure-sheaves-and-valuations`; `P8:local-rational/integral-elements-via-valuations`; `P8:local-rational/completed-structure-sheaf-on-affinoid-perfectoids`; `P8:local-rational/affinoid-perfectoid-objects-and-etale-pullbacks`; `P8:local-rational/perfectoid-torus-cover-completed-tensor` |
| §2.2 | `P8:local-rational/period-sheaves-definitions`; `P8:local-rational/period-sheaves-on-affinoid-perfectoids`; `P8:local-rational/rational-acyclicity-of-de-rham-period-sheaves`; `P8:local-rational/de-rham-period-sheaf`; `P8:local-rational/period-sheaves-on-profinite-products`; `P8:local-rational/graded-de-rham-period-sheaf-tate-twist` |
| §2.3 | `P8:local-rational/corrected-structural-de-rham-sheaf`; `P8:local-rational/structural-de-rham-sheaf-connection`; `P8:local-rational/bdr-plus-power-series-extension-lemma`; `P8:local-rational/etale-algebras-over-torus-models`; `P8:local-rational/structural-algebra-structure-on-bdr-power-series`; `P8:local-rational/local-structure-of-structural-de-rham-sheaf`; `P8:local-rational/connection-and-filtration-in-local-coordinates`; `P8:local-rational/structural-de-rham-sheaf`; `P8:local-rational/formal-poincare-lemma`; `P8:local-rational/poincare-lemma-and-faltings-extension`; `P8:local-rational/faltings-extension`; `P8:local-rational/graded-structural-de-rham-sheaf-local-description`; `P8:local-rational/relative-poincare-lemma` |
| §2.4 | `P8:local-rational/gamma-action-on-log-coordinates`; `P8:local-rational/tate-descent-for-completed-cyclotomic-tensor`; `P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base`; `P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf`; `P8:local-rational/pushforward-of-structural-de-rham-sheaf`; `P8:local-rational/higher-direct-images-of-twisted-completed-structure-sheaf`; `P8:local-rational/geometric-hodge-tate-pushforward` |
| §2.5 | `P8:local-rational/crystalline-period-sheaves`; `P8:local-rational/almost-limit-lemma-for-acris-modules`; `P8:local-rational/crystalline-period-sheaves-on-affinoid-perfectoids`; `P8:local-rational/frobenius-on-crystalline-period-sheaves`; `P8:local-rational/crystalline-to-de-rham-period-sheaf-embedding`; `P8:local-rational/structural-crystalline-period-sheaves`; `P8:local-rational/local-structure-of-structural-crystalline-sheaf`; `P8:local-rational/crystalline-poincare-lemma`; `P8:local-rational/structural-crystalline-sheaf-on-affinoid-perfectoids`; `P8:local-rational/frobenius-on-structural-crystalline-sheaf`; `P8:local-rational/structural-crystalline-to-de-rham-embedding` |
| §2.6 | `P8:local-rational/semistable-period-sheaves`; `P8:local-rational/structural-semistable-period-sheaves` |
| §2.7 | `P8:local-rational/nested-affinoid-covers`; `P8:local-rational/finite-image-spectral-sequence`; `P8:local-rational/primitive-local-cohomology`; `P8:local-rational/primitive-global-almost-finiteness`; `P8:local-rational/primitive-comparison-mod-p`; `P8:local-rational/relative-primitive-comparison`; `P8:local-rational/integral-etale-finiteness`; `P8:local-rational/primitive-ainf-comparison`; `P8:local-rational/primitive-bdr-plus-comparison`; `P8:local-rational/etale-proetale-torsion-comparison`; `P8:local-rational/primitive-comparison-proper-singular` |
| §3.1 | `R06.2/regular-period-ring`; `R06.2/admissibility-dimension-bound`; `R06.2/admissible-category-tannakian`; `R06.2/period-rings-are-regular` |
| §3.2 | `R06.2/filtered-vector-spaces`; `R06.2/hodge-number-tH`; `R06.2/hodge-tate-weight-convention` |
| §3.3 | `R06.2/period-functors`; `R06.2/admissible-representations`; `R06.2/serre-tate-injectivity`; `R06.2/hodge-tate-decomposition-tate`; `R06.2/hodge-tate-base-change`; `R06.2/hodge-tate-graded-equivalence`; `R06.2/ddr-of-tate-twists`; `R06.2/de-rham-implies-hodge-tate`; `R06.2/ddr-exact-strict-tensor`; `R06.2/de-rham-base-change`; `R06.2/induction-and-restriction-of-scalars`; `R06.2/hodge-tate-characters-are-de-rham`; `R06.2/extension-with-separated-weights-de-rham` |
| §3.4 | `R06.2/filtered-phi-n-modules`; `R06.2/monodromy-nilpotent`; `R06.2/newton-number-tN`; `R06.2/slope-decomposition`; `R06.2/weak-admissibility`; `R06.2/weakly-admissible-two-out-of-three`; `R06.2/weakly-admissible-category-abelian`; `R06.2/filtered-hardernarasimhan-interface` |
| §3.5 | `R06.2/rank-one-filtered-modules`; `R06.2/filtered-phi-n-modules-with-descent-data`; `R06.2/dcris-dst-filtered-phi-n-modules`; `R06.2/crystalline-semistable-de-rham-implications`; `R06.2/dst-exact-tensor-fully-faithful`; `R06.2/crystalline-subobjects-strict`; `R06.2/crystalline-semistable-base-change`; `R06.2/frobenius-twisted-units-surjective`; `R06.2/dcris-of-tate-twists-and-unramified`; `R06.2/potentially-unramified-and-characters`; `R06.2/coefficient-field-base-change`; `R06.2/period-functors-transport-of-structure`; `R06.2/admissible-implies-weakly-admissible`; `R06.2/vst-rank-one`; `R06.2/vst-continuity`; `R06.2/colmez-fontaine-bigness-criterion`; `R06.2/colmez-fontaine-theorem` |
| §3.6 | `R06.2/regular-ordinary-representation`; `R06.2/crystalline-ordinary-slope-criterion`; `R06.2/maximal-monodromy-ordinary-criterion`; `R06.2/regular-ordinarity-descent`; `R06.2/crystalline-character-classification`; `R06.2/crystalline-character-torsion-interpolation`; `R06.2/g-valued-filtered-functor`; `R06.2/crystalline-equivalence-over-breve-base`; `R06.2/fixed-bound-fiber-functor-triviality` |
| §3.7 | `R06.2/classical-fundamental-complex`; `R06.2/admissible-fundamental-sequence` |
| §4.1 | `P7/robba-ring-of-p-adic-field`; `P7/extended-robba-ring-with-galois-action`; `P7/berger-robba-identification`; `P7/robba-ring-tensor-identity`; `P7/log-extended-period-rings` |
| §4.2 | `P7/localisation-maps-p-adic-field`; `P7/extended-localisation-maps`; `P7/nabla-operator-on-robba-ring`; `P7/extended-robba-plus-decomposition`; `P7/frobenius-regularisation`; `P7/decompletion-operators`; `P7/theta-iota-kernel`; `P7/t-divisibility-criterion`; `P7/theta-iota-surjective-onto-Kn`; `P7/principal-parts-interpolation`; `P7/ideals-dividing-powers-of-t` |
| §4.3 | `P7/robba-realisation-comparison`; `P7/cyclotomic-eigenvectors-in-log-ring`; `P7/semistable-periods-in-extended-robba-ring`; `P7/berger-dcris-dst-dictionary`; `P7/berger-comparison-isomorphisms`; `P7/connection-on-robba-realisation`; `P7/antiderivatives-on-log-robba-ring`; `P7/unipotent-crystal`; `P7/unipotent-connection-criterion`; `P7/semistability-criterion-unipotent-connection` |
| §4.4 | `P7/sen-module`; `P7/fontaine-dif-module`; `P7/ddr-via-robba-realisation`; `P7/wach-dcris-comparison`; `P7/integral-dcris-lattice`; `P7/wach-fontaine-laffaille-comparison` |
| §4.5 | `P7/classical-b-pair`; `P7/labelled-bdr-realisation`; `P7/b-pair-robba-equivalence`; `P7/b-pair-herr-comparison`; `P7/fontaine-bdr-classification` |
| §5.1 | `R06.3/closed-submodules-of-free-robba-modules`; `R06.3/lie-algebra-trivial-gamma-action`; `R06.3/de-rham-iff-dif-connection-trivial`; `R06.3/approximation-in-dif-module`; `R06.3/de-rham-lattice-Ns`; `R06.3/determinant-of-stable-submodule`; `R06.3/de-rham-differential-equation`; `R06.3/robba-lattice-implies-de-rham`; `R06.3/de-rham-differential-equation-has-frobenius-structure`; `R06.3/p-adic-monodromy-theorem` |
| §5.2 | `R06.3/filtered-module-robba-modification`; `R06.3/filtered-module-robba-equivalence`; `R06.3/weak-admissibility-robba-slope-zero`; `R06.3/colmez-fontaine-proof-via-robba` |
| §5.3 | `R06.3/potentially-semistable-dieudonne-module`; `R06.3/fontaine-weil-deligne-functor`; `R06.3/weil-deligne-independence-of-choices`; `R06.3/weil-deligne-parameter`; `R06.3/weil-deligne-descent` |
| §5.4 | `R06.3/convention-comparison-with-r01`; `R06.3/tate-curve-weil-deligne-example`; `R06.3/hodge-and-inertial-type-do-not-determine-frobenius`; `R06.3/sen-zero-finite-inertia`; `R06.3/de-rham-purity-predicate`; `R06.3/rank-two-potentially-semistable-types` |
| §6.1 | `R06.4/fontaine-laffaille-crystalline-comparison`; `R06.4/fontaine-laffaille-sign-dictionary`; `R06.4/small-weight-admissibility` |
| §6.2 | `R06.4/fontaine-laffaille-endpoint-non-example`; `R06.4/fontaine-laffaille-rational-consequences` |
| §6.3 | `R06.4/ordinary-representation`; `R06.4/ordinary-implies-semistable` |
| §6.4 | `R06.4/two-dimensional-ordinarity-criterion`; `R06.4/barsotti-tate-crystalline-criterion`; `R06.4/weight-p-endpoint-branch`; `R06.4/weight-p-plus-one-branch` |
| §7.1 | `P8/bdr-plus-local-system`; `P8/bdr-plus-local-systems-and-integrable-connections`; `P8/vector-bundles-on-analytic-etale-and-proetale-sites`; `P8/filtered-module-with-integrable-connection`; `P8/associated-bdr-plus-local-system`; `P8/boundary-map-of-associated-local-system`; `P8/position-of-associated-local-system`; `P8/tensor-compatibility-of-associated-local-systems` |
| §7.2 | `P8/coherent-cohomology-against-graded-structural-sheaf`; `P8/proper-smooth-bdr-local-system-comparison`; `P8/affinoid-k-pi-one-for-p-torsion`; `P8/lisse-zp-sheaf`; `P8/lisse-sheaves-etale-proetale-equivalence`; `P8/de-rham-lisse-sheaf`; `P8/etale-to-bdr-plus-comparison-for-lisse-sheaves`; `P8/de-rham-comparison-for-de-rham-lisse-sheaves` |
| §7.3 | `P8/relative-completed-structure-sheaf-computations`; `P8/relative-pushforward-of-graded-structural-sheaf`; `P8/relative-bdr-plus-local-system-comparison`; `P8/relative-de-rham-comparison`; `P8/degree-one-abelian-comparison`; `P8/de-rham-pair`; `P8/completion-descent-for-horizontal-morphisms`; `P8/proper-smooth-pushforward-de-rham-pairs`; `P8/de-rham-pushforward-cup-and-base-change` |
| §7.4 | `P8/analytic-diamond-bdr-local-systems`; `P8/coherent-coefficients-geometric-pushforward`; `P8/proper-proetale-coherent-base-change`; `P8/relative-hodge-tate-filtration` |
| §7.5 | `P8/relative-witt-robba-period-sheaves`; `P8/relative-phi-module`; `P8/relative-pure-locus`; `P8/relative-integral-etale-equivalence`; `P8/relative-rational-etale-equivalence`; `P8/relative-b-pair`; `P8/relative-all-module-bundle-b-pair-equivalence` |
| §7.6 | `P8/relative-phi-cohomology`; `P8/relative-b-pair-cohomology`; `P8/relative-period-cohomology-comparison` |
| §8.1 | `P8/proper-smooth-de-rham-comparison-application`; `P8/algebraic-analytic-period-comparison`; `R06.5/proper-smooth-de-rham-comparison`; `R06.5/crystalline-comparison-good-reduction`; `R06.5/proper-semistable-period-comparison`; `R06.5/proper-smooth-potential-semistability` |
| §8.2 | `R06.5/geometric-period-functoriality-duality-twists` |
| §8.3 | `R06.5/abelian-scheme-dcris`; `R06.5/abelian-variety-hodge-tate-weights`; `R06.5/weil-pairing-duality`; `R06.5/elliptic-curve-ordinary-supersingular` |
| §9.1 | `R06.6/kummer-representation` |
| §9.2 | `R06.6/kummer-representations-semistable`; `R06.6/tate-curve-tate-module`; `R06.6/tate-curve-filtered-phi-n-module`; `R06.6/tate-curve-l-invariant` |
| §9.3 | `R06.6/good-reduction-iff-crystalline`; `R06.6/semistable-reduction-semistable`; `R06.6/multiplicative-reduction-elliptic-curves` |
| §9.4 | `R06.6/local-global-compatibility-good-reduction` |


## Validation and handoff

The review report itself is the handoff allowed by this issue. Resume with the ownership matrix and the numbered unresolved constructions above; the packet IDs and every supplier edge are preserved here. Do not infer upstream readiness from the successful Lean elaboration. The 318 heavy targets are plans, not formalized declarations.

Validation: `lean-check` exited 0 at the pinned build, with 51 warnings, all “declaration uses `sorry`”, and no other diagnostic. The final Suggested.lean has 458 lines. `check_sorry_data.py` exited 0. `intake.py check-files` reported 4 files and 0 problems; `git diff --check` passed. Metadata remains the valid `topic = "math.NT"` entry. No files outside this issue’s four changed deliverables were edited.


## Public-source version record

Access date: **2026-10-16** for every row. URLs identify the public PDF or its source landing page; the SHA-256 fingerprints the PDF used during the check. These records preserve the version after scratch cleanup. The source tables above state what was read and what remains uncertified; inclusion in this retrieval record alone is not proof verification. No PDF or extracted source passage is included in the repository.

| Source key | Public source | SHA-256 of PDF |
|---|---|---|
| allen-2016 | [source](https://arxiv.org/abs/1411.7661v2) | `3674da657a12c0f7843aba5078560ebb18f4b3e571b5be5449b9d7b423ca9879` |
| bcgp25 | [source](https://arxiv.org/abs/2502.20645v1) | `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c` |
| berger-2002 | [source](https://arxiv.org/abs/math/0102179v3) | `142e7948f3c2da0cba0e0e764c2543cb3f0cf039470711fae729c9c3d2f54f6c` |
| berger-2004 | [source](https://perso.ens-lyon.fr/laurent.berger/articles/article06.pdf) | `52e188211dfba449a92e5a8a66cc65379fe17688e6384a8eb6ece3a19a932110` |
| berger-2008 | [source](https://arxiv.org/abs/math/0406601v1) | `72559978a50bc293f23353ba85c4fa65b61b2f9efb6b1dc39c8866890964de36` |
| berger-errata | [source](https://perso.ens-lyon.fr/laurent.berger/articles/errata.pdf) | `bb42b4f8d684882625adb4b0994cbaeb214141522d4f7ac27237e69317e92f5d` |
| berger-intro | [source](https://arxiv.org/abs/math/0210184v1) | `fac038cb2e7a3c939f7b0c85d1060985876abc5d55407d7172fc1f6f2cc16ecc` |
| betts-stix | [source](https://arxiv.org/abs/2204.13674v1) | `7d4b7d49c09b979ce4485251ea6f77527fcdb7c516ed7296d20c42e947ef0c18` |
| bhatt-morrow-scholze | [source](https://arxiv.org/pdf/1602.03148v3) | `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a` |
| bip | [source](https://arxiv.org/abs/2110.01638v2) | `b48dad0a42d8cacea0a4ae80d5f3a5e89c3a13bf2e03beb8527081422b5853c4` |
| blz | [source](https://www.math.buffalo.edu/~hjzhu/Papers/mathann.pdf) | `766762870ec04d749ae9d21b2bee3328b68b8b71df14c8cbf3a20d8b089caa8a` |
| bms | [source](https://arxiv.org/abs/1602.03148v3) | `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a` |
| breuil-schneider-2007 | [source](https://arxiv.org/abs/math/0603499v1) | `82f3f5148806a00bc56a2e01614200269b4dbe9e0b739d63f36f11ad6709aee2` |
| brinon-conrad | [source](https://math.stanford.edu/~conrad/papers/notes.pdf) | `f27d508bc64b3c9e2e9de5041429b2cb6a909b2cd72ff8096c20493f27b5a187` |
| caraiani-scholze | [source](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf) | `4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a` |
| cdn20b | [source](https://arxiv.org/abs/1704.08928) | `15e4868f5b11ad113e2806b5e9884d7b100f529e67c6cd6030f24cf8e3ae9073` |
| cdn23 | [source](https://arxiv.org/abs/2204.11214) | `c5711666b845a48f6fc2cd944b22bbde0c45567fe29dacb00a3429619baecbee` |
| cdt | [source](https://math.stanford.edu/~conrad/papers/cdtmaster.pdf) | `e9dac063b9db6fd7b34e79907ce09095688b1fd8b1ea48c8527797b6090ae91c` |
| cf | [source](https://webusers.imj-prg.fr/~pierre.colmez/CF.pdf) | `f0b5c51191831415b39cd363cc9eb5ba759d1ea7e46d9b4c1d15cea0a7aa6490` |
| ck | [source](https://arxiv.org/abs/1710.06145v3) | `47000db58599c20831223f43df1d13466c913fdda617070f5cc3458631d36c57` |
| cn | [source](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf) | `bb1628cf1f4321243e6070be2abae99f72a41e237e70a7eb1ec1fc03cc2cd52a` |
| coleman-iovita | [source](https://arxiv.org/abs/math/9701229v1) | `797d8361ffdb5db2460a5830ef913a8ea7d9cefc6803ae4b8265d651fa039530` |
| colmez-2002 | [source](https://webusers.imj-prg.fr/~pierre.colmez/jussieucorps.pdf) | `3675d316c726cde8f55d3d3582e270e94d2dc1d814196e7cbf7b38d42e3d0c63` |
| colmez-iwasawa98 | [source](https://webusers.imj-prg.fr/~pierre.colmez/iwasawa-deRham.pdf) | `8a454d9e6969a4c2e1b259d276af06ecf7445ef0fe066aa25bd7d8d698893f3e` |
| colmez-niziol | [source](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf) | `bb1628cf1f4321243e6070be2abae99f72a41e237e70a7eb1ec1fc03cc2cd52a` |
| conrad-local | [source](https://math.stanford.edu/~conrad/papers/locchar.pdf) | `782fe71a3c7f26ccd67943d468f73540d384e2de5d474bf8369475b8b631d9bd` |
| ding | [source](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf) | `741a49c0677a77b22c9759a016e215882b70dc760eb9e41fd2fe45cc633d05ba` |
| disegni-liu | [source](https://arxiv.org/abs/2204.09239) | `1f759774cdbf8700c5978b6ea45c1bf63c99b993136a82a45a907320fef53bfa` |
| ff18 | [source](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf) | `cc159f38a3801c736b71ecea363496abe7706550bfb416600718ee9933922ca3` |
| fontaine-bt1982 | [source](https://annals.math.princeton.edu/1982/115-3/p03) | `611725452393b53e3e2d2eeb75c3a464df4fdce7aa9b9a95d2256bbfa032d997` |
| fontaine-laffaille | [source](http://www.numdam.org/item?id=ASENS_1982_4_15_4_547_0) | `c049a7bff113a45f8bbcffc93118bd2e651e84f8b4a38305f7cb24b34c2011a2` |
| fontaine-ouyang | [source](https://www.imo.universite-paris-saclay.fr/~fontaine/galoisrep.pdf) | `56590ae4bc10cc274491a37c1ab65af2eb1f712227bc295fe986d66c3204059f` |
| fontaine04 | [source](https://www.numdam.org/item/AST_2004__295__1_0.pdf) | `a9dd9aeecf4fb0cb6f53d925096b4f30935806acdbccc54e00ae6422a408b68b` |
| glx | [source](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf) | `c40fe1fc5e0941812cf3aca5ba77c471ee49122c63ed7b0d864d322136031485` |
| heuer | [source](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf) | `7608fff18ccbc47b96bd54cfe01f31f8ccd9953889834cc9f6c39787563175cd` |
| howe-klevdal | [source](https://arxiv.org/abs/2308.11064v2) | `c133b06bec1209a04f84d1c2984b78ce2242ba85fc1b72cf5a662002685cab8a` |
| katz-messing | [source](https://web.math.princeton.edu/~nmk/old/katzmessing.pdf) | `9283138c8620fe8570f217c41d9a077f0b5fbc7d793ea97f4aed12396c2afa53` |
| kedlaya-liu | [source](https://arxiv.org/abs/1301.0792v5) | `a6a117423db62aec072442bb15b70e3175bcc3b631bdcd6d74f740e3c6cfd942` |
| kedlaya-overview | [source](https://arxiv.org/abs/math/0501361v2) | `31d9e39eacbab5bef5b2f7b09ef66e97854eced3f3d94b559a6f113252dcf275` |
| kw-serre-modularity-I | [source](https://www.math.ucla.edu/~shekhar/papers/results.pdf) | `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82` |
| kw-serre-modularity-II | [source](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) | `53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4` |
| lazard-1962 | [source](http://www.numdam.org/item/PMIHES_1962__14__47_0/) | `8d18aea92a0857251622ce008e8204c8fb353a5127a179e71fcce2bb73ffaf31` |
| liu-duality | [source](https://arxiv.org/pdf/0711.4346v2) | `07ff79cb2cf2e8d41c516c056996eafd1b8bcd877bcd307123f25b34b384ed24` |
| liu-height-one | [source](https://www.numdam.org/item/10.5802/jtnb.852.pdf) | `a65f1cfa7f1c7d8b868fb70a82996d39d87574f0a264a8ac83af8246292f336d` |
| nakamura | [source](https://www.ms.u-tokyo.ac.jp/journal/pdf/jms200401.pdf) | `fbe7c28975b83867433bf480b356d8fcb18e88e473910bd44162039ca3242f98` |
| qian-dwork | [source](https://arxiv.org/abs/2103.00106v1) | `87c4ee8499f3a615a81307e17d38d6f00ab544da9d22384f213bbc06052722e9` |
| sch13-padic-hodge | [source](https://people.mpim-bonn.mpg.de/scholze/pAdicHodgeTheory.pdf) | `73dded06286031066e9d98b638e065d650688f1e36e877f4d711331a3508dee3` |
| sch16-erratum | [source](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf) | `3cfa56b9e3875c04240d97739dccd58091e41f714c101d5470b95172f73cb235` |
| scholze-arxiv | [source](https://arxiv.org/abs/1205.3463v2) | `ed9187b3269adb7e9964369470073ce8760ef56ef0c0b89538c0a1509f811959` |
| scholze-errata | [source](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf) | `3cfa56b9e3875c04240d97739dccd58091e41f714c101d5470b95172f73cb235` |
| scholze-rigid | [source](https://arxiv.org/abs/1205.3463v2) | `ed9187b3269adb7e9964369470073ce8760ef56ef0c0b89538c0a1509f811959` |
| scholze-survey | [source](https://arxiv.org/abs/1303.5948) | `c18d6f9ff5da4a7939b85d9355230acf05a74813950eb07b06035f5787fd271d` |
| tan-tong | [source](https://arxiv.org/abs/1510.05543v2) | `1de1a71b63784868c3028087398a15f9f478194c554b2437c809079b2a6da7cb` |
| wintenberger-correct | [source](https://www.numdam.org/item/AIF_1997__47_5_1289_0/) | `c5c13c392529639169e99aedf02bfaa805d1f1f5c0f5a5d1432468e0fa82c37d` |
| zavyalov | [source](https://arxiv.org/abs/2111.01830v3) | `a984d973782649972a835b302e20ec91fc9c1abc5e5b43c7eccc5934b9c2c951` |
