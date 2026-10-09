# Fix report: Néron models and semistable abelian varieties

Job `FIX-PKG-NeronModelsAndSemistableAbelianVarieties~adv`, issue #8074.
Agent: Codex, session `codex-1eiMg3`, 2026-10-09.

**Complete; accepted as a roadmap package.** The remaining comparisons identified in
`reviews/REV-PKG-NeronModelsAndSemistableAbelianVarieties.md` are now specified with
construction steps, exact hypotheses, source locators and numerical controls. This
also disposes of the older findings in the `~adv` report, whose Tate-source and
component-obstruction repairs were already present. Acceptance concerns the plan and
its elaborating signatures; it does not certify the packet's proof/carrier gaps as
implemented. No second job was claimed.

## Finding dispositions

| Finding | Disposition in the finished package |
|---|---|
| Signed Weil quotient versus positive period pairing, 4.3 | Fixed. The period projection `beta` and the quotient defined by pairing with the dual torus are distinguished: `alpha(v)(t)=e_A(v,t)=-evaluation(t,beta(v))`. The positive Kummer character is `sigma(root)/root`. Thus `N=u beta` and the Weil-coordinate map is `-u`; the polarised negative sign in Illusie is retained. The toric Tate twist is explicitly removed before writing the adjoint. The ordered rank-one Weil form and non-basis tests are named Lean definitions and proved examples. Convention 7 and the NOS sketch in 5.1 use this distinction. |
| Residue-prime comparison, including characteristic `p`, 4.3 | Fixed. New `FiniteFlatToricFiltration` and `FiniteFlatOrthogonality` in 3.5–3.6 supply the missing group-scheme objects at every positive level, including noninvertible levels. The obstruction is computed in fppf Kummer cohomology modulo integral extensions. Integral generators of Poincaré lines change by units, so the period obstruction is `u mod p^r`; duality and the quotient orientation give `-u` for the Weil obstruction. Named transition maps give the inverse-limit comparison. No geometric-point Tate module or residue-prime inertia-invariant formula substitutes for the finite flat tower. |
| Residue-characteristic-zero formal/uniformisation supplier, 3.13–3.14 | Fixed using the cleared Faltings–Chai source. The completed formal identity comparison, algebraisation, duality, degeneration data, torsion and analytic quotient now have all-characteristic targets and locators. The translation retains their extension class `-c`, period trivialisation `tau^-1` and positive divisor pairing. Raynaud's 1994 residue-characteristic restriction is stated rather than extended by inference. |
| Henselian descent, 4.3 | Fixed. Construct the filtered finite groups and finite-level obstruction on the original henselian trait, compare with completion and descend the obstruction through the splitting cover. Completion preserves the residue field and valuation quotient; reductions at all positive levels determine the completed integral coefficients uniquely. Equivariance follows from this uniqueness. An algebraic period lattice over an incomplete fraction field is not required. |
| Coefficient-prime input originally attributed to Noot 2017 Corollary 2.2, 6.10 | Replaced the inaccessible source dependency with a directly checked primary-source route. The full p-adic Frobenius filtration is constructed from Coleman–Iovita's period boundary, good abelian quotient and torus residue maps; Katz–Messing supplies the good abelian Frobenius polynomial comparison. The two lattice actions and the weight-two toric contribution are retained. Fontaine's residue-prime WD construction is now a named target in 5.3. This proves the needed semistable trace input without relying on an uncollated statement from Noot 2017. |
| Trace comparison over the original field, 6.10 | Fixed. For the same positive-degree Weil element `g`, the closure of `g` and its normalised open inertia kernel is open and has that inertia kernel. Its fixed field is finite, semistability follows from the prime-to-residue criterion, and WD restriction compares the trace of this same `g`. The character recurrence and purity step are explicit; equal traces are not claimed to determine a nilpotent operator on arbitrary WD representations. |
| Earlier component-obstruction sign, 4.6 | Preserved and rechecked. Werner's Poincaré linearisation and the injective-resolution sign combine to the positive inverse-form pairing. The retained values `1/5` and `2/5`, with specified quotient classes, remain distinct from the negative Weil-coordinate pairing in 4.3. This run does not reopen or reattribute the already repaired comparison. |
| Earlier Tate-source, wild and nonsplit comparisons, 2.8–2.9, 6.6–6.9 | Preserved and rechecked. The original Tate §§4–8 locators, positive `I_n` condition, wild discriminant controls, characteristic-two tangent algebra and minimal differential scaling remain. These findings were discharged in the latest review; this fix changes neither their mathematics nor their supplier ownership. |

Noot 2017 was **not** retrieved or read. The author landing page, publisher metadata
and HAL catalogue identify the article, but they do not establish Corollary 2.2.
No assertion in the repaired proof uses that corollary. The replacement above is a
change of proof input, not a claim that the inaccessible article was collated.

## Source chain checked directly

All mathematical descriptions below are our own statements about the inputs. No
source excerpts or source files enter the repository. Faltings–Chai was read in
place from the maintainer's cleared library; no other copy was used or made.

| Input | Exact locator and use |
|---|---|
| Faltings–Chai, *Degeneration of Abelian Varieties* | II §§1–3, pp. 33–37: formal torus, abelian quotient, extension algebraisation and duality over complete normal bases, with no residue-characteristic restriction. |
| Faltings–Chai | II Theorem 6.2 and Remark 6.3, pp. 51–52: degeneration-data conventions, the inverted extension/period data and polarised positivity. |
| Faltings–Chai | III Theorem 7.1, Corollary 7.2, p. 76; Corollaries 7.3–7.4, p. 77: finite flat torsion, the divisor pairing modulo the torsion level, and toric/period Cartier duality. |
| Faltings–Chai | III §8 and Proposition 8.1, pp. 77–78: analytic quotient over a complete DVR and comparison with the Néron identity model. |
| Raynaud 1994 | §2.4.1, p. 298, and §3.1, p. 299: dual lattice exchange and the torsion cone with its period projection. |
| Raynaud 1994 | §4.3, pp. 308–309; §4.6 equation (7), p. 314, and Proposition 4.6.1, p. 315: positive valuation/Kummer convention and the inertia operator. The standing §4 residue-characteristic hypothesis is retained. |
| Raynaud 1994 | §§4.7.3–4.7.4, p. 317: the homological three-piece Frobenius description and weights; the package dualises it for cohomology. |
| Illusie 2021 | Formulas (4.3)–(4.11), pp. 94–95, Theorem 4.1 and footnote 12, p. 95: the signed Weil construction and negative polarised form. Remark 4.2, p. 95, also separates the coefficient-prime construction from the prime-to-residue formula. |
| SGA 7 I, Exposé IX | Lemma 9.4.3, p. 428; Corollary 9.4.4 and formula (9.4.5), p. 429; §9.4.6, p. 430: fppf extension obstruction, the valuation quotient and Galois descent. |
| SGA 7 I, Exposé IX | §9.5, especially (9.5.4)–(9.5.5), p. 433; §9.6, pp. 436–438: compatible prime-power obstructions and the toric, finite, dual and étale partial extensions. Generic-BT full faithfulness is not needed to define the finite-level filtration from its Néron model. |
| SGA 7 I, Exposé IX | Theorem 10.4, p. 444: integral monodromy pairing and its functoriality, after translating the signed quotient convention. |
| Coleman–Iovita, arXiv math/9701229v1 | Introduction, pp. 2–3: the full split-semistable comparison with `D_st(V_p(A))^*`. Chapter I §2(i), pp. 9–10: period boundary and torus residue maps; §2(ii), pp. 11–12: vector-extension splitting and Frobenius on the three pieces. The public version states the semistable comparison in its introduction; its promised Chapter II proof is absent from that version. The package states the comparison as a theorem target and separately specifies nonsplit unramified descent. |
| Katz–Messing 1974 | Theorem 1, pp. 74–75: crystalline and étale Frobenius characteristic polynomials for smooth projective varieties over finite fields. The application here is the degree-one cohomology of the good abelian quotient, with powers handled by Newton identities. |
| Fontaine, Exposé VIII, 1994 | §1.1.1, pp. 322–323; §1.3.5, p. 329; Theorem 2.3.2, pp. 336–337; §2.3.7, pp. 339–340: `D_pst`, the action `w phi^(-alpha(w))`, the WD relation and exact tensor functor. The scan was inspected to resolve a corrupted text extraction of the formula. |
| Fontaine, Exposé VIII | §§2.4.1–2.4.2, p. 342: geometric compatibility and invariance of the isomorphism class over the rational field, distinguished from existence of a rational vector-space model. |
| Noot 2013 | §2.3, p. 254; Corollary 2.7, pp. 256–257: the common prime-to-residue geometric WD parameter and its meaning of being defined over `ℚ`. |
| BCGP 2021 | Lemma 2.5.1, p. 189; Proposition 2.8.1, pp. 194–195: purity recovers monodromy from the semisimple Weil representation, and the positive-degree base-change argument. The page image confirms that strict compatibility uses a parameter over `ℚ̄`, not a chosen `ℚ`-vector-space form. Definition 2.8.2, p. 195, fixes the inverse-cyclotomic cohomological multiplier. |

Fifteen additional retained locators were selected reproducibly, with seed `8074`,
from the following twenty-element pool: Conrad 2.6, 2.16, 3.1, 4.1, 4.4, Example 4.6,
5.4, 5.5, Remark 5.6, 4.3, 5.8, 5.9, 6.5, 7.12, 7.14; Raynaud 4.7.3, 4.7.4;
SGA IX 11.5, 12.1; BCGP 2.8.2. Their direct source spot-checks were:

| Sample | Result |
|---|---|
| Conrad Theorem 5.8, pp. 20–22 | Unipotence criterion confirmed; the repaired package's divisible-system descent remains essential. |
| Conrad Theorem 5.5, pp. 18–20 | Finite/toric annihilators confirmed, with the coefficient-prime argument kept distinct from inertia invariants. |
| SGA IX Theorem 12.1, pp. 465–467 | The separated quotient has a degree map; its degree-zero kernel, not the whole quotient, is the abelian variety's finite-type Néron model. |
| Conrad Remark 5.6, p. 18 | Square-zero inertia requires the coefficient prime to differ from the residue characteristic. |
| Conrad Theorem 4.4 and Corollary 4.5, pp. 10–11 | Semistable identity base change confirmed; no full-model ramified isomorphism follows. |
| Conrad Example 4.6, pp. 11–12 | Component map is multiplication by the ramification index. |
| Conrad Proposition 4.1, pp. 8–9 | Identity-fibre isogeny and semistability under isogeny confirmed. |
| Conrad Theorem 2.6, pp. 3–4 | Chevalley decomposition retains perfectness for the general smooth connected group. |
| Conrad Lemma 5.4, pp. 17–18 | Heights `t,t+2a` and saturated Tate submodules confirmed; retained correction to the printed corank. |
| Conrad Theorem 7.12, p. 34 | Relative Picard representability is an algebraic-space result; the regular semistable scheme comparison uses 7.13. |
| Conrad Proposition 6.5, pp. 23–24 | The full-level semistability criterion requires `N≥3`, invertible in the residue field. |
| Conrad Theorem 3.1, pp. 7–8 | Torus and abelian quotient descend even over an imperfect field in the semi-abelian case. |
| Conrad Lemma 5.9, p. 21 | Equality of rational invariant spaces is confirmed; the subsequent finite-level inference is not used. |
| BCGP Definition 2.8.2, p. 195 | `H¹` is cohomological, with multiplier `epsilon^-1`. |
| Conrad Proposition 2.16, p. 6 | Unique maximal torus over arbitrary fields; product with the unipotent group only over perfect fields. |

Public-source receipts, accessed 2026-10-09 (URL and SHA-256):

| Source | Receipt |
|---|---|
| Raynaud | [PDF](https://www.numdam.org/item/AST_1994__223__295_0.pdf); `b0cf9b1a112beb11937a5efb36e40c19a6b819d53fcd28325fb465352d460a45` |
| Illusie | [PDF](https://www.numdam.org/item/10.5802/afst.1667.pdf); `e5669fedbc97b874fc7b2ec2230ad8722ff69c0e77dc9aee8bca5f0aaa19d219` |
| SGA 7 I | [PDF](https://library.slmath.org/nonmsri/sga/sga/pdf/sga7-1.pdf); `17286b0f0bec451068e0a5fa2c39e93de28e7c1ecee6739487cfac11c03c8dab` |
| Coleman–Iovita | [PDF](https://arxiv.org/pdf/math/9701229v1); `797d8361ffdb5db2460a5830ef913a8ea7d9cefc6803ae4b8265d651fa039530` |
| Katz–Messing | [PDF](https://web.math.princeton.edu/~nmk/old/katzmessing.pdf); `9283138c8620fe8570f217c41d9a077f0b5fbc7d793ea97f4aed12396c2afa53` |
| Fontaine Exposé VIII | [PDF](https://www.numdam.org/item/AST_1994__223__321_0.pdf); `703c5bceab7d660c132a98c89f73804977c5629923d5dc38cf4b92d63c82db1d` |
| Noot 2013 | [PDF](https://msp.org/ant/2013/7-2/ant-v7-n2-p01-p.pdf); `69025855ac88df5b83d5f36bef797c6cea16877af237b596b1c82698f52cc011` |
| BCGP 2021 | [PDF](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf); `b4cc8b016615bcaf4b92bdf826ec1e285f6aca842ebd9f13712e1c498f8454af` |
| Conrad | [PDF](https://math.stanford.edu/~conrad/DarmonCM/2011Notes/SemistableReduction.pdf); `bfbad9fc883b2a6ac6e5f842abc664c2ebc84c348b9d80fa4ca6313b37e28173` |
| Werner | [PDF](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0486/LOG_0012.pdf); `70ab8703d40cbfb9dc32d4943c79c63acc9ceb771c429b9e7736eb1f9bd54cfe` |

## Library audit, ownership and maintainer routing

The elaboration baseline is Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The current Tau Ceti audit is at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; current TauCetiRoadmap was checked
through `618e0b30d21791d6a492ce88ba8602745697b21a`.

The audit searched mathematical objects as well as names: smooth marked models,
identity/component quotients, character lattices, multiplication kernels and
Cartier duals, alternating two-variable evaluation, integral adjoints/cokernels,
formal torus extensions, torsion cones, Frobenius traces and monodromy operators.
It included the nine roadmaps newer than the atlas snapshot and the Completed
roadmaps. The moving upstream checkout acquired AdelicAlgebraicGroups and
IntegralHeckeAndGaloisDeterminants changes during the run; those supply no duplicate
of the geometric or p-adic adapters here. No Lake command ran in either audit checkout.

| Boundary | Outcome |
|---|---|
| Mathlib `Matrix.trace`, `Matrix.det_fin_two`, finite sums, `ZMod` and linear maps | Imported unchanged. New arithmetic wrappers expose the two specific period/torus conventions; they do not re-plan generic matrix or quotient arithmetic. |
| Tau Ceti's numerical Picard group and degree | Retained actual import and the two `#check` anchors. The intersection comparison is a consumer of that library API. |
| Tau Ceti `IntegralLattice.discriminantPairing` and IntegralLattices Layer 1D | Existing symmetric single-lattice form remains a boundary. The retained two-lattice form here has different lattices and no assumed symmetry. No duplicate symmetric target was added. |
| StableReduction Layer 5 | Owns geometric Kodaira configurations. The earlier duplicate deletion remains intact; the Néron/equation/splitness comparisons are different targets. |
| AbelianSchemesAndArithmeticModuli A3 and A4 | Corrected the BT/Tate attribution to A4/etale-tate-module and A4/p-divisible-group. The trace construction explicitly consumes A4/universal-vector-extension and A4/abelian-h1-de-rham. These are lower-tier named targets, not assertions that their proofs are already implemented. |
| ArithmeticGaloisRepresentations R01.1–R01.2 | Owns character comparison, the WD carrier, its linear algebra and prime-to-residue construction. The residue-prime period functor is not supplied by its prime-to-residue `ofEllAdic` constructor. |

**Maintainer routing:** this issue permits no packet edits. When synchronising the
owning packet, attach `FiniteFlatToricFiltration` and `FiniteFlatOrthogonality` to the
3.5–3.6 development, the all-characteristic Raynaud/one-motive interfaces to
3.13–3.14, and the signed finite-flat/descent APIs to 4.3. The minimal
`PadicWeilDeligneRealization` and its period input belong to 5.3; redirect the
higher-tier PadicHodgeTheory construction to this owner. The degree-one good-abelian
Frobenius comparison and full three-piece trace belong to 6.10; higher-tier general
crystalline and rigid comparison roadmaps should consume this abelian special case.
No new general crystalline theory, generic one-motive category or BT full-faithfulness
theorem is silently imported. Preserve the explicit lower A3/A4 contracts above.
The packet's 78 nodes, 39 proof/carrier gaps, 14 requests and zero closed stages remain
unchanged; package acceptance is not proof closure.

## Adversarial pass on changed statements

Each row covers the indicated definition/theorem, its API and the displayed Checks.
Geometric carriers without pinned APIs are stated in the README and named in the
short closing Lean comment. Arithmetic witnesses are actual typed declarations;
the new numerical examples are proved, not merely accepted through `sorry`.

| Statement / API | Instances and computed result | Change / result |
|---|---|---|
| Supplier conventions | A3 finite-level torsion versus A4 BT towers; coefficient prime equal to `char K`; generic WD carrier versus `ofEllAdic` | Repaired the contracts; no upward p-adic supplier remains. |
| Convention 7 | `[5]`, `[1]`, `[0]`; torus zero; `(1,1),(1,2)` | Positive period values `5,1,0`, inverse values `1/5,2/5`; Weil quotient has the opposite orientation. |
| 3.5 `FiniteFlatToricFiltration` | `g=0`; `m=1`; `m=0,g>0`; split Tate at `m=p` in characteristic `p`; supersingular good elliptic fibre | Rank-one trivial finite schemes at `g=0` or `m=1`; zero level excluded; Tate ranks `p,p,1,p`; supersingular full rank `p²` despite zero geometric-point group. |
| 3.5 inclusions/quotients/transitions | Surface `t=a=1`; finite-flat level `m`; divisibility `p^r | p^(r+1)` | Ranks `m,m³,m²,m`; Tate ranks `1,3,4`; transitions are multiplication-kernel maps, not an arbitrary map between groups of the same size. |
| 3.5 toric lift/completion | Imperfect residue field; strict henselian splitting cover; incomplete henselian DVR | Cartier-dual étale quotient lifts over the henselian finite scheme. A connected–étale splitting over an arbitrary imperfect field is not assumed. Completion recovers `T[m],G[m],B[m]`; no abelian scheme over the incomplete trait is inferred. |
| 3.6 `FiniteFlatOrthogonality` | Good reduction; `m=1`; equal-characteristic Tate at `m=p` | Annihilators are respectively zero, trivial and `μ_p`; period quotient is `D(μ_p)=ℤ/p`. Pointwise pairing with the sole geometric point of `μ_p` is an invalid replacement. |
| 3.6 inverse-limit orthogonality | `ℓ ≠ char K`, including mixed-characteristic `ℓ=p`; equal-characteristic `ℓ=p` | Tate assertion only in the first scope; finite-flat assertion in both. Rank and saturation agree, with the Tate twist retained. |
| 3.13 formal identity/algebraisation | Good reduction; split Tate; `ℂ[[π]]`; disconnected full Néron fibre | `G=B` or `G=𝔾_m,B=0`; characteristic-zero residue is covered; full components are not recovered from identity completion. |
| 3.13 uniqueness/duality/base change | Identity extension; nonsplit torus; finite unramified extension | Comparisons preserve the marking/formal identity, `B^∨` and Galois action. Constancy of the torus over the original field is not imposed. |
| 3.14 `RaynaudOneMotive` | `Y=0`; rank one; nonsplit lattice; `n=0,1,2` | Good case has no period quotient; rank-one root class maps to `1 mod n`; `n=1` trivial; `n=0` excluded; nonsplit action retained. |
| 3.14 torsion/dual/bidual APIs | `(y,g)` with `ng=iota(y)`; `(0,zeta)`; dual toric evaluation | Quotient sends these to `y mod n` and zero; duality exchanges `X,Y`; evaluation order is the one used in 4.3. These are generic finite-flat sequences, not integral good-reduction claims. |
| 3.14 polarised positivity | Tate valuation `5`; polarisation `[2]`; zero lattice | Values `5,10`; zero lattice has vacuous positive definiteness. The source's inversions accompany the convention change. |
| 4.3 `periodProjection` / `weilQuotient` | `(0,1),(1,0),(2,3),(0,0)` | Period values `1,0,3,0`; Weil values `-1,0,-3,0`. All examples proved. |
| 4.3 `weilForm`, additivity and skew | Basis vectors in both orders; `(2,3),(5,-7)`; equal and zero vectors | Values `1,-1,-29,29,0,0`; alternating form is bilinear, not symmetric. Examples proved. |
| 4.3 `operator_eq_weil_coordinates` | `n=0,1,2,5`; period basis; toric basis | Operator images `(0,0),(1,0),(2,0),(5,0)`; kills the toric basis. Replacing the quotient by `alpha` requires coefficient `-n`. |
| 4.3 coefficient-prime sign/transition | `p=2`, levels `2,4`; valuation `5`; level `1` | Positive and Weil classes are `1,3 mod 4`, both `1 mod 2`, both zero mod 1. The mod-4 check detects the sign that mod 2 misses; examples proved. |
| 4.3 fppf valuation construction | Equal characteristic `2`; unit change of Poincaré generator; nonzero abelian quotient | Kummer is fppf; generator change has valuation zero. Only the torus is pushed out by a character; no nonexistent character on all of `G` is used. |
| 4.3 henselian descent | Completion; unramified splitting cover; ramification index `2` | First two keep integral values and residue actions; ramification multiplies the pairing by `2`. Integral coefficients are separated by their prime-power reductions. |
| 5.1 NOS comparison | Tate valuation `5`; torus zero; finite-level trivial action only | Weil map `[-5]` is still nonzero, so full unramified Tate action excludes a torus. Negation changes no kernel; finite-level triviality alone still fails the criterion. |
| 5.3 `D_pst` / p-adic WD | Zero module; unit; `ℚ_p(-1)`; residue size `2` | Dimensions/traces `0,1,1`/`0,1,2`; geometric Frobenius on the twist is `2`, not `1/2`. Scalar cancellation gives a linear action over `P₀`. |
| 5.3 WD monodromy relation | Split `F=diag(1,2)` and `N=[[0,5],[0,0]]`; nonsplit `F=diag(-1,-2)`; `N=0` | `NF` and `FN` entries `10,5`; `-10,-5`; `0,0`. Geometric conjugation scales by `1/2`; arithmetic degree has the reciprocal convention. Proved matrix examples. |
| 5.3 restriction/normalisation | Unramified extension; ramification index `2`; `q=π⁵,e=2` | Unscaled `N_p` restricts literally; `N=eN_p` scales under ramification. WD isomorphism uses the supplied nonzero-scalar API. Coefficients `5/2` and `5` remain distinct integrally. |
| 6.10 good-abelian Frobenius polynomial | `B=0`; good elliptic quotient; powers of Frobenius | Empty factor/trace zero; usual elliptic polynomial; all positive powers agree by Newton identities. This compares actions, not just dimensions. |
| 6.10 full trace filtration | Split Tate `q=2`; nonsplit action `-1`; a good elliptic quotient of trace `1` | Full traces `3,-3,4`; invariant traces `1,-1,2`. The missing Euler-factor piece is weight two, not the weight-zero period piece. |
| 6.10 `toricFrobenius` API | `delta=±1,0`; `d=0,1,2`; `q=1,2` | Trace `delta(1+q^d)`, determinant `q^d delta²`; degree zero `delta·1`; zero action zero matrix. Arithmetic degeneracies are allowed; geometric invertibility excludes zero action. |
| 6.10 nonsplit power | `q=2`, square of a nonsplit generator | The chosen element has `delta=(-1)²=1` and trace `5`; retaining `delta=-1` after squaring would be wrong. |
| 6.10 trace descent | Positive degree `d`; `d=0`; arbitrary Frobenius lift | Residue subgroup `d·Ẑ` has finite index only for positive `d`; the cyclic closure has no extra inertia kernel. Compare the same `g`, not a substituted lift. |
| 6.10 character and purity export | Inertia elements; positive, zero and negative powers; arbitrary WD pair; `q=1` | Invertible-Frobenius recurrence extends the trace character; nilpotent comparison additionally uses purity. The weight-separation argument requires a genuine finite field, `q≥2`. |
| 6.10 rationality/exterior powers | `i=0,1,2g,>2g`; zero variety; automorphisms fixing `ℚ` | Rank one at `i=0`, zero above `2g`, dual multiplier at `i=1`; common geometric parameter is invariant. No unjustified rational vector-space form is asserted. |
| 6.11 supplier reference | Toric case `B=0`; good ordinary elliptic; supersingular quotient | BT and ordinary deformation references now identify the actual A4 targets. The reduction predicate still depends on the abelian quotient's p-rank. |

## Regression pass through the retained package

Every retained target subsection was read against its hypotheses, API and Checks.
The following compact table records those tests; detailed prior source receipts and
repairs remain in the two review reports, which this job does not edit.

| Targets | Instances / result |
|---|---|
| Conventions 1–6, 8–11 | Field versus DVR; generic marking; lft torus; rank zero; geometric versus rational components; multigraph orientation; Tate/cohomological duality; unit discriminant. No hypothesis was weakened. |
| 1.1–1.4 | Identity restriction, smooth nonextendible map, two marked models and compositions. Full smooth tests and marking-preserving uniqueness remain. |
| 1.5–1.7 | Zero homomorphism versus nonzero translation; weak blowup model; good model and torus. Group extension, weak/full mapping property and existence remain separate. |
| 1.8–1.11 | Zero/good abelian scheme; bad Tate curve; multiple bad places; unramified versus ramified base change; nonfree global determinant line. Local freeness is not promoted to a global basis. |
| 2.1–2.4 | Good non-affine identity fibre; `I_1,I_4,I_5`; perfect/imperfect field; torus characters. Nonsplit rational fixed counts `1,2,1` differ from geometric size. |
| 2.5–2.7 | Tate isogeny with `n,m>1` versus `n=1`; smooth henselian lifting versus finite-field Lang; multiple regular components. No unconditional nonzero component-map assertion remains. |
| 2.8–2.9 | `I_n,n>0`; tame table versus `p=2,3`; wild `II*` at discriminant valuation `14` over `ℚ₂`, wild `IV` at valuation `7` over `ℚ₃`. Tame valuations `10,4` are not imposed at these primes. |
| 3.1–3.4 | Zero/good/Tate/additive fibres; henselisation; ramification `e=1,2,0`. Identity base change and component multiplication have distinct scopes; `e=0` is algebraic only. |
| 3.7–3.9 | Nonzero square-zero Tate shear; one node, tree and reducible special fibre; degree-zero quotient. Total generic degree zero and zero multidegree are not conflated. |
| 3.10–3.12 | Dimension zero; Jacobian factor over the infinite fraction field; unipotent shear and its prime-th power; full levels `2,3,4`. Saturated/divisible descent remains; finite fixed-point equality is not inferred. |
| 4.1–4.2 | Loop, tree, parallel edges, empty/disconnected graph. Boundary is target minus source; rank formula needs nonempty connected vertices. |
| 4.4–4.5 | Edge lengths `0,1,5`; reversed orientation; zero lattice; integral versus rational cokernel. Positive geometric thickness excludes zero; rationalisation does not retain components. |
| 4.6–4.7 | Classes `(1,1),(1,2)` modulo `5`; different lifts; zero denominator; two lattices; gcd of fibre multiplicities greater than one. Signed obstruction remains positive; inverse form needs finite cokernel and nonzero denominator. |
| 4.8–4.10 | Split quadratic algebra versus field; characteristic `2` excluded from hyperelliptic equation; `g=1`; diagonal `μ₂`; conjugate even/odd factors. Orders `8,4` and parity distinction remain. |
| 4.11–4.13 | Trivial/nontrivial odd-factor torsor; rational Weierstrass point; split torus; nodal family with changing toric rank. Splitness alone does not kill the Brauer boundary; a fibrewise extension need not have constant toric rank. |
| 5.2 | Good isogeny; coefficient prime dividing degree; characteristic-prime isogeny; `[n]` in characteristic `p`. Rational Tate isomorphism is not an integral lattice isomorphism; nonzero integer multiplication must be invertible in the rational coefficient field. |
| 5.3 retained period predicates | Zero/trivial representation; ramified scalar fields; additive and Tate curves. De Rham, semistable and crystalline are distinct; no canonical log branch is assumed. |
| 5.4–5.7 | Good/multiplicative/wild additive reduction; `t=0,1,2`; split/nonsplit Euler factors; residual prime dividing the dual geometric component order. Wild data retain finite inertia action and the residual conductor can drop. |
| 6.1–6.4 | Tate isogeny adjoints; `[m]`; noninjective vertical maps; ramified semistable differentials; residue-prime differential cokernel. Snake short exactness and differential isomorphism are not asserted without their hypotheses. |
| 6.5–6.9 | Unit discriminant; minimal versus nonminimal equation; characteristic-two split/nonsplit tangent algebra; rational versus geometric Tamagawa counts; `u=5` coordinate scaling. Differential factors are `1/5` and `5` in opposite directions. |
| 6.12–6.14 | Saturated ordinary rank-two submodule; reduction modulo `2`; `C₃` action versus a `2`-group; centraliser order `48` versus point-stabiliser intersection `8`; genus zero and moduli `0,1`. Strict matrix bound retains `N>1,g>0`; the residual-image condition is not weakened. |
| Worked examples | Good, split/nonsplit multiplicative, double edge, `X₀(11)` and `q=8` over `ℚ₂`. Component counts, Euler factors, wild conductor and residual drop remain different invariants. |

Ten typed-signature comparisons with the README were also checked:
`NeronMappingProperty`, `NeronModel.extend_restrict`,
`ComponentGroup.card_fixedPoints_neg`, `LatticePairing.discriminantPairing_mk`,
`TateMonodromy.periodProjection`, `weilForm`, `weilQuotient`,
`operator_eq_weil_coordinates`, `SemistableTrace.toricFrobenius` and
`frobenius_monodromy_relation`. The new coordinate objects quantify over arbitrary
integers/rational scalars; geometric positivity, nonzero action and `q≥2` are imposed
only on their geometric applications. No theorem silently acquires a geometric
hypothesis from an unrelated `variable` or `include` block.

## Validation and submission scope

- `lean-check research/blueprint/packages/NeronModelsAndSemistableAbelianVarieties/Suggested.lean`:
  **exit 0, 134 warnings, all `declaration uses sorry`, no errors or other warnings**.
  The new signed quotient, modular class, trace, determinant and Frobenius/monodromy
  numerical witnesses have proved bodies. The two numerical Picard `#check` outputs
  are the only additional mathematical output. Memory was above 20 GB before each
  compile; only one compile ran at a time, through the shared pinned wrapper.
- `python3 scripts/check_blueprint.py research/blueprint/packets/NeronModelsAndSemistableAbelianVarieties.json`:
  **0 errors, 0 warnings**, unchanged 78 nodes / 39 gaps / 14 requests / zero closed stages.
- `python3 research/blueprint/intake.py check-files` on the four issue deliverables:
  **4 files, 0 problems**.
- `git diff --check`: **exit 0**.
- README is below 200 KB. Existing layer shape, APIs and discriminating Checks remain;
  new geometric targets have names in the Lean closing comment rather than vacuous carriers.
  No `True` placeholder, `Prop := sorry`, `lemma`, source passage or private path was added.

Only the README, Suggested file, review JSON and this handoff change. The metadata,
packets, public reader, data and earlier reviews remain untouched. Nothing remains
for this fix job. The next implementation or upstream worker should use the finished
package and the ownership-routing note above; scratch sources and logs are not needed.
