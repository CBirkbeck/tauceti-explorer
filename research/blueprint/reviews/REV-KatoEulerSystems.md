# Independent review — REV-KatoEulerSystems

**Verdict: needs_changes.** Issue #443; Codex session `codex-LjgmGv`; 6 October 2026. This is a completed independent review of BP-KatoEulerSystems, authored by a different worker session, `codex-Y3enmR`. It is not a checkpoint.

The source-level plan has substantial useful work. The clear statement, quotation, prerequisite, API and test errors found in this review are corrected in place. Acceptance is withheld because seventeen named suggested signatures omit substantial parts of their packet conclusions: finite index, norm relations, reciprocity, operator transport, local lattices, Iwasawa structure or finite generation. The report distinguishes these omissions from the missing geometric hypotheses that PROTOCOL §13 explicitly permits. The latter alone do not cause rejection. The conditional linear-map constructors and several final algebraic implications are useful prototypes, but none establish arithmetic existence or implementation.

## Counts and scope

| Item | Input | Reviewed output |
| --- | ---: | ---: |
| Mathematical nodes | 40 | 40 |
| Construction nodes | 11 | 11 |
| API items | 49 | 60 |
| Unit tests | 33 | 41 |
| Planets | 23 | 23 |
| Baseline declarations | 12 | 12 |
| Proof-closure gaps | 7 | 12 |
| Supplier requests | 24 | 29 |
| Source issues | 6 | 10, all independently confirmed |

**Node verdicts:** 4 verified, 19 corrected, 17 unverifiable as complete node/signature pairs, zero added. Twenty-five nodes received clear packet corrections or API/test additions, including nodes whose signature still needs revision. Every input node ID is retained. No baseline citation was removed or replaced.

The target-level granularity is appropriate: no splitting into small proof lemmas is required. All five stages remain `planned`, and the packet remains `complete` as a finished target-level pass under §0. Each target has a node or exact import/request/gap. None is `closed`, and none is formalized. Stage counts remain L0:5, L1:6, L2:8, L3:10, L4:11; planet counts 2,4,6,6,5. The internal **node** prerequisite graph is acyclic. Numerical layer labels are not a proof order: L2's canonical map uses the earlier logical input recorded as L4 rational module structure, and the L1 S-integral moment uses Lemma 8.5 recorded at L2. The node chains expose those facts rather than inferring them from a later main-conjecture conclusion.

Only the allowed packet, suggested file, this report and own handoff are changed. [The reader](../readmes/KatoEulerSystems.md) was read in full but is not an allowed deliverable for issue #443. A revision must synchronize it; its pre-review quotations and hypotheses must not override this packet's corrections.

## Sources and actual reading

| Source | Public text obtained | Version |
| --- | --- | --- |
| `kato-2004-asterisque-295` | [p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0.pdf) | Asterisque 295 (2004), pp. 117-290; Numdam digitisation AST_2004__295__117_0 (inspected 2026-09-15) |
| `rubin-euler-systems-draft` | [Euler systems (author's course draft of the Annals of Mathematics Studies 147 monograph)](https://swc-math.github.io/notes/files/99RubinES.pdf) | Public author draft distributed with the 1999 Arizona Winter School notes; inspected independently 6 October 2026. No line-by-line collation with the published AMS 147 book is claimed. |
| `nakamura-2023-published` | [Zeta morphisms for rank two universal deformations](https://link.springer.com/content/pdf/10.1007/s00222-023-01203-7.pdf) | Inventiones Mathematicae 234 (2023), 171–290; published PDF, DOI 10.1007/s00222-023-01203-7 |
| `burungale-tian-2025-v2` | [A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin](https://arxiv.org/pdf/2506.03465v2) | arXiv:2506.03465v2, 11 October 2025 (7 pages), author version of Annals of Mathematics 203 (2026), 1–14 |

All four downloaded PDF SHA-256 digests match the packet. Every node locator/excerpt was collated with these texts; damaged OCR was compared with page images at the key displays. This does not claim a complete independent proof of the entire books or of [KK3]. In Kato, the review read the node passages in §§1–2, 4.2.4, 6.3–6.6, 7, 8–9, 12–13, 15–17, especially 13.9–13.14 and 17.11–17.13; §§10–11 were read at their reduction/comparison passages. Nakamura §2.3 Lemma 2.10, §3.1–3.3, Appendix A and §5.1 were checked where cited. Rubin's public AWS Chapter II hypothesis/bound passages and Chapter III §5 were checked. Burungale–Tian v2 Theorems 2.3–2.4 and Remark 2.5 corroborate the all-prime rational statements; no publisher-PDF collation is asserted.

Rubin E2–E3 concern the **AWS author draft only**. The AMS 147 version of record was not obtained or collated; an additional public book-copy URL returned HTTP 403. The issue catalogue's Festschrift reference does not make the AWS text that article. No accusation is made against an unread edition. The source-version access note now makes this limitation explicit. The Burungale–Tian title metadata is corrected to the actual title of v2.

The source excerpts are short mathematical transcriptions or damaged-OCR excerpts, not claims that an ellipsis contains all hypotheses verbatim. In particular the moment identity, filtration endpoint, fine-moduli bounds, triangular matrix, Ash–Stevens index and integral/rational display now have explicit corrected readings. The full source statements and `match` explanations govern them.

## Pinned baseline and overlap audit

The actual twelve declaration statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, not inferred from a name search. Tau Ceti's recorded pin is `f790474821cf4256814db967cb154e7af3d0c369`. The packet has no cited Tau Ceti declaration entry: its Tau Ceti prerequisites are roadmap exports, not claims that those targets are already implemented.

| Confirmed declaration at the exact pin | What its statement supplies |
| --- | --- |
| [`mathlib:PowerSeries`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/Basic.lean) | MvPowerSeries Unit R; formal coefficients only, with no convergence or fractional q branch. |
| [`mathlib:UpperHalfPlane`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Complex/UpperHalfPlane/Basic.lean) | Complex point with positive imaginary part; the analytic carrier only. |
| [`mathlib:ModularForm`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Basic.lean) | Slash-invariant, differentiable, bounded-at-cusps form; schemes and exact source normalization are additional inputs. |
| [`mathlib:CuspForm`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Basic.lean) | Slash-invariant, differentiable form vanishing at cusps; no newform/Galois realization is supplied. |
| [`mathlib:Units`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Units/Defs.lean) | Value and inverse with both inverse-product laws; coordinate-ring units fit this carrier. |
| [`mathlib:AlgebraicGeometry.Scheme`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Scheme.lean) | Locally ringed space locally isomorphic to spectra; it does not construct modular moduli/correspondences. |
| [`mathlib:PadicInt`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicIntegers.lean) | Subtype of Q_p with norm at most one, with prime-p assumptions; matches the stated coefficient ring. |
| [`mathlib:DirichletCharacter`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/DirichletCharacter/Basic.lean) | MulChar (ZMod n) R; embeddings, primitive conductor and period normalization remain additional data. |
| [`mathlib:LSeries`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/Basic.lean) | Total tsum of Dirichlet terms; no analytic continuation or modular nonvanishing theorem. |
| [`mathlib:LinearMap`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/LinearMap/Defs.lean) | Bundled additive semilinear map; ordinary linear maps use the identity ring homomorphism. |
| [`mathlib:Submodule`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Submodule/Defs.lean) | Additive submonoid closed under scalar action; correct for filtration steps and zeta spans. |
| [`mathlib:Submodule.span`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Span/Defs.lean) | Intersection of submodules containing the set; correct for the generated image submodule. |

All twelve remain valid within these limits. In particular `LSeries` must not be treated as analytic continuation, `PowerSeries` as a convergent fractional-q product, or `ModularForm`/`Scheme` as the required arithmetic moduli and cohomology construction. No near miss was promoted into baseline coverage.

The reviewed [library audit](../../../data/library-coverage.json) and Kato L0–L4 audit entries show no fully implemented target being replanned. Mathlib's general linear algebra and coefficient carriers remain imports. Generic Steinberg symbols, scheme K transfers, finite étale Chern maps, Euler systems, Iwasawa algebras, Selmer duality, modular-symbol periods and regulators stay with their existing owners. EllipticRegulators ER.7 consumes these Siegel units; it is not a reason to redefine generic K₂/regulator theory here. Two nearby upstream roadmap documents, ModularForms and EllipticCurves, were read for the ownership/convention checks.

## Supplier checks and closure

All 66 original foreign references were resolved and their supplier statements read, including promoted and blueprint nodes. A supplier title or stage name is not assumed to provide greater generality than its statement.

- ES.2 owns the Euler-system carrier, conductor presentation and Euler-factor changes. ES.4/ES.8 own the finite/Iwasawa bounds. The packet imports them directly; no generic theorem is routed through a cyclotomic-unit application.
- R07 L3's global Iwasawa twist has the needed all-prime semilinear convention. R09 L2's local twist is odd-prime and is replaced where used globally. Exact localization/specialization compatibility is requested, not silently inferred.
- R09 L3's crystalline/growth/interpolation/Coleman exports are odd-prime. They cannot supply all-prime Kato 16.2/17.4 or the unrestricted rational elliptic statement at two. A dyadic domain/export gap now names the affected consumers. The original de Rham and integral ordinary-image request remains distinct.
- R19.1's parabolic premotive cannot supply the full open-curve H¹ with Eisenstein forms. The moment/filtration nodes now request finite étale and log de Rham comparison from ModularCurvesPartII R14.3.
- Nakamura's full-level construction uses the completed Borel–Moore classical coefficient map, with **literal integral dual** coefficients. This is requested from R31.2, building on CompletedCohomologyPartII CC.6/CC.7. It is not replaced by the ordinary symmetric Tate-monomial moment or by an integral symmetric-power self-duality.
- The integral zeta-span inclusion comes from expressing geometric generators in canonical generators (13.10), not the reverse fraction-field expression. Finiteness needs all height-one localizations and the semilocal finite-support theorem, not merely Ash–Stevens spanning or a characteristic ideal of one. The R08 L4 request covers the full tame algebra at two. Canonical construction and rational membership are treated jointly in 13.9–13.12.
- The R10 critical family principle requires a decent point, a common affinoid neighborhood, a dense noncritical locus and nonvanishing normalizations. These were missing and are restored. PadicFamilies L4 consumes Kato and cannot provide its construction without a cycle.
- R14.1's existing Γ₁ correspondence statements do not automatically give low-level/two-index/full-level maps. The original precise extension request is retained. The finite Chern sign/denominator convention, scheme-transfer projection formula and Weil/Poincaré twist were checked against their actual owners.

The five new gaps extend the existing seven, rather than rebuilding supplier mathematics. All neededBy IDs and stage `remaining` lists are updated:

| No. | Explicit gap | Consumers |
| --- | --- | --- |
| 1 | Big-local-field reciprocity proof closure | `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements` |
| 2 | All-prime CM module-structure supplier is not staged | `KatoEulerSystems:L4/rational-iwasawa-module-structure`, `KatoEulerSystems:L2/rational-kato-zeta-morphism`, `KatoEulerSystems:L4/nonvanishing-of-the-zeta-submodule-at-height-zero`, `KatoEulerSystems:L4/cohomological-divisibility-one-direction` |
| 3 | Critical arithmetic family compatibility | `KatoEulerSystems:L3/critical-and-bad-reduction-comparison-domain` |
| 4 | General de Rham scalar and integral ordinary image exports | `KatoEulerSystems:L3/refined-scalar-regulator-of-the-kato-class`, `KatoEulerSystems:L3/critical-and-bad-reduction-comparison-domain`, `KatoEulerSystems:L4/ordinary-selmer-divisibility` |
| 5 | Modular strict-Selmer/H² and rank-one comparison | `KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra`, `KatoEulerSystems:L4/rational-iwasawa-module-structure`, `KatoEulerSystems:L4/cohomological-divisibility-one-direction` |
| 6 | Integral elliptic control and no-finite-submodule criterion | `KatoEulerSystems:L4/elliptic-no-finite-iwasawa-submodule`, `KatoEulerSystems:L4/elliptic-rank-zero-p-part-upper-bound` |
| 7 | Complete period normalization comparison | `KatoEulerSystems:L3/noncritical-analytic-arithmetic-comparison` |
| 8 | Open modular-curve coefficient comparison | `KatoEulerSystems:L1/etale-chern-moment-map-into-modular-local-system`, `KatoEulerSystems:L3/dual-exponential-map-on-the-modular-local-system` |
| 9 | Completed Borel–Moore classical moment export | `KatoEulerSystems:L2/full-level-hecke-linear-zeta-classes` |
| 10 | Dyadic regulator and Coleman domain | `KatoEulerSystems:L3/refined-scalar-regulator-of-the-kato-class`, `KatoEulerSystems:L3/noncritical-analytic-arithmetic-comparison`, `KatoEulerSystems:L3/critical-and-bad-reduction-comparison-domain`, `KatoEulerSystems:L4/ordinary-selmer-divisibility`, `KatoEulerSystems:L4/elliptic-ordinary-and-multiplicative-divisibility` |
| 11 | Global-to-local twist compatibility | `KatoEulerSystems:L3/zeta-class-interpolation-of-complex-L-values`, `KatoEulerSystems:L2/nakamura-twisted-zeta-morphism` |
| 12 | Finite-support theorem for the full cyclotomic algebra | `KatoEulerSystems:L2/integral-zeta-submodule-and-finite-index`, `KatoEulerSystems:L2/rational-kato-zeta-morphism` |

The unstaged all-prime CM elliptic-unit theorem, complete big-local-field [KK3] input, strict-Selmer/H² adapter, ordinary integral image, Greenberg control and period dictionary are honest unresolved proof-closure work. Their existence is not certified by this review. Such precise gaps are compatible with `planned`; they are not the reason this completed pass is sent back.

## Seven required red-team repairs

| Finding | Independent check |
| --- | --- |
| RT-AREA-iwasawa-1/36 | Packet and reader route the carrier through ES.2 and bounds through ES.4/ES.8. Inherited atlas edges still require the maintainer's separate change; none were edited here. |
| RT-AREA-iwasawa-3/2 | Packet and reader use T_pE=H_p(1), hence Sym Tate=Sym H(k−2), giving 2−r+(k−2)=k−r. The packet's source excerpt had the reverse identity and is corrected here; reader synchronization is required. |
| RT-AREA-iwasawa-3/3 | Both away-from-p norm cases retain ℓ^(−r), quadratic exponent k−1−2r, and the two nontrivial reciprocity cases retain p^(−r). When p divides M the factor is one. T′ is not renormalized. |
| RT-AREA-iwasawa-3/4 | Packet and reader main statements give filtration steps, with equal interior steps and zero associated graded pieces; i≥k vanishes. Their excerpt used i>k, corrected in the packet. |
| RT-AREA-iwasawa-3/5 | Actual formula order is twist k−r, specialize, loc_p, exp*. Semilinear κ action and dual-form/period convention retained; all-prime supplier corrected. |
| RT-AREA-iwasawa-3/6 | Packet and reader use Pontryagin-dual residue H¹, inverse corestriction dual to direct restriction, and cd_p=0 for the residue-field union. The suggested Q-valued toy dual is insufficient and is a revision requirement. |
| RT-AREA-iwasawa-3/7 | Packet and reader use divisor pushforward, div(N_a f)=a_*div(f), in the theta existence proof. For c=5,a=2 the pullback is 25E[2]−E[10], with coefficient 24 at nonzero 2-torsion, whereas the original divisor has coefficient zero. |

## Independently reviewed source issues

All six input findings are confirmed independently, not by accepting the author's or another reviewer's verdict. Four more entries E7–E10 are added with this review's own confirmations. Each includes a locator, version, reason, correction and bounded correction search. Searches finding no notice do not establish exhaustive novelty.

| Finding | Locator/version | Verdict | Correction |
| --- | --- | --- | --- |
| `KatoEulerSystems/E1` | Published Astérisque 295 (2004), 1.9 p.124 and repeated in 3.10 | confirmed | w = 1/12 − a/(2N) + a²/(2N²) = B₂(a/N)/2. |
| `KatoEulerSystems/E2` | 1999 AWS public author draft, III.5.1 p.48 | confirmed | Add p>2 for the displayed formal-logarithm lattice; at p=2 retain the actual λ_E(E₁(Q₂)) lattice. |
| `KatoEulerSystems/E3` | 1999 AWS public author draft, III.5.8(ii) and proof p.50 | confirmed | For the vanishing add p>2; at p=2 keep finite cohomology. The Hyp(Q_∞,T) assertion is unchanged. |
| `KatoEulerSystems/E4` | Published Invent. Math. 234 (2023), §3.1.3 p.207 | confirmed | For the Kato unit cited here use c²[0]−E[c]; the displayed divisor characterizes its inverse. |
| `KatoEulerSystems/E5` | Appendix A, proof of Theorem A.1, p. 267 | confirmed | (c² − c^{k+1−j}σ_c)(d² − d^{j+1}σ_d)∏ … |
| `KatoEulerSystems/E6` | Appendix A, before Lemma A.3 and in its statement, p. 268 | confirmed | H¹(Y_1(N_f), 𝒱^*_{k/A})(1) (and Y_1(N_f) in Lemma A.3) |
| `KatoEulerSystems/E7` | Published Invent. Math. 234 (2023), §3.1.2 pp.205–206, equation (7) and preceding symmetric-power pairing | confirmed | Require (k−2)! invertible for this symmetric-power self-duality, in particular use rational coefficients. Integrally retain the literal dual, which corresponds to a divided-power lattice; do not replace it by the symmetric-power Tate lattice. |
| `KatoEulerSystems/E8` | Published Astérisque 295 (2004), Theorem 12.5(4), p.222; proof 13.14, p.234 | confirmed | In the stronger integral clause use H²(T)_𝔭 and H¹(T)_𝔭/Z(f,T)_𝔭. Keep the rational display as the literal printed excerpt and distinguish it from this contextual correction. |
| `KatoEulerSystems/E9` | Published Astérisque 295 (2004), Theorem 17.4(3), p.273; compared with 17.6 p.274 and proof 17.13 pp.279–280 | confirmed | The periods belong to f*: goodness is for U⊂V_Fλ(f*) with U≅T*(1−k), so the bound is on X(T). |
| `KatoEulerSystems/E10` | Published Invent. Math. 234 (2023), §5.1 p.254, proof of Theorem 5.2 and paragraph before Conjecture 5.3 | confirmed | Theorem 12.5(4) of Kato; Conjecture 5.1 is decomposed into its η-components. |

The computational evidence is reproducible without a repository copy or a Lean build:

- **E1:** substitute a=2,N=5 in B₂(a/N)/2; it is −11/300, while the printed missing-square expression is −23/300. Both printed occurrences were checked as images.
- **E2:** for y²+xy=x³+1, the discriminant is −433 and a₁=1. With the integral formal parameter, log(t)=t+t²/2+Σ_(n≥3)b_n t^n/n. At t=2u its first terms are 2u+2u², divisible by four; n−v₂(n)≥2 for n≥3 handles the tail. The E₂ log is an isomorphism onto 4Z₂, hence log(E₁)=4Z₂, contradicting the displayed 2Z₂ lattice. This affects the stated draft result at two.
- **E3:** enumerate the 96 matrices over Z/4 of odd determinant and their reduction action on F₂². A cochain has 192 binary coordinates. Impose both coordinates of f(gh)−f(g)−g f(h)=0 for every ordered pair. Binary Gaussian elimination gives relation rank 189, so dim Z¹=3. The two coboundaries g↦(g−1)e_i have rank two. Thus dim H¹=1. Inflation to GL₂(Z₂) is injective; its natural divisible module has zero invariants, so multiplication by two injects this class into H¹(GL₂(Z₂),(Q₂/Z₂)²)[2]. Only the claimed integral vanishing is false; the rational unipotent argument survives.
- **E7:** at p=2,k=4 use basis x²,xy,y² of ordinary Sym²(Z₂²). Equivariance under diag(3,1) forces an antidiagonal pairing B with entries a,b,c. For U=[[1,1,1],[0,1,2],[0,0,1]], UᵗBU=B forces a=c=−2b. Then det B=−4b³ is never a unit. The published arbitrary integral self-duality fails; retain literal dual/divided powers, or invert (k−2)!. No rational theorem is withdrawn.
- **E8/E9:** these are contextual misprints, not claims that Kato's intended theorems fail. Proof 13.14 invokes the integral 13.4(3) inequality, while 17.6/17.13 explicitly use the dual f* lattice. The printed rational 12.5(4) inequality is weaker and vacuous over p, rather than a false rational inequality.

## API, tests, planets and suggested file

Eleven API items were added: cTheta auxiliary compatibility/base change; Beilinson bilinearity; moment extensionality; Euler-adapter extensionality; full-level extensionality; canonical-map uniqueness/span characterization; twisted-map extensionality; modular-exp* coercion; scalar projection additivity. Their packet names appear as declarations in the suggested file. These additions use explicit compatibility equations or existing carrier extensionality, without opaque proposition fields.

Eight tests were added, including nonzero identity-map specializations for the moment, zeta, full-level, canonical, twisted and scalar constructions, identity pullback of the Siegel unit and coercion of the modular exp*. Seven existing tests were strengthened: actual rational smoothing inequality, both identity entries of the Beilinson symbol, constructed p-direction classes, adapter repeated-prime components, constructed full-level norm values, actual canonical-map sign and actual twisted sign. These tests expose constant or zero maps that the old zero/additivity-only or unrelated arithmetic examples could pass. The geometric tests still require their owner-supplied carriers; successful elaboration is not execution of geometric mathematics.

Planets remain within six per layer. Three names were corrected to short source-based object names: Étale Chern moment map, Modular dual exponential and Ordinary Selmer divisibility. No bookkeeping or test is made a planet. The inherited target ownership remains unchanged.

The file keeps individual Mathlib imports, actual Units/LinearMap/Submodule/Polynomial carriers and admitted proofs. No opaque proposition placeholder or second generic regulator/Euler-system definition was introduced. The formal complex interpolation displays leave unexpressible arithmetic hypotheses out as §13 permits; taken with wholly arbitrary data they are not true universal theorems. For example an empty character sum and δ=L=1 at k=2,r=1 give 0=1. This is a reminder of the deliberate omission, not by itself a reason for rejecting a prototype. The separate failure below is the omission of expressible **conclusions** and essential maps, even at the abstract-signature level.

## Per-node decisions

`unverifiable` means the complete named node/signature pair cannot yet be approved. The mathematical source check and every clear correction for that node are still recorded. It does not mean the source theorem is disbelieved.

| Node | Verdict | Evidence and limit |
| --- | --- | --- |
| `KatoEulerSystems:L0/theta-function-c-normalised` | **corrected** | Kato 1.3/1.10, Cartier divisor, norm uniqueness and pushforward proof checked; base change and c,d compatibility APIs added. Conditional uniqueness prototype is honest about missing geometry. |
| `KatoEulerSystems:L0/siegel-units-and-c-independent-rationalisation` | **corrected** | Kato 1.1/1.4/1.9 and total/full-level constant-field conventions checked; E1 acceptance conflict resolved; identity-pullback and actual smoothing tests exclude constant constructions. |
| `KatoEulerSystems:L0/siegel-unit-galois-action-and-distribution` | **unverifiable** | Source action and distribution formulas checked. The suggested declaration only applies a linear map to an already-assumed sum identity; it states neither indexed Galois action nor the distribution identity. |
| `KatoEulerSystems:L0/siegel-unit-degeneracy-product-formula` | **unverifiable** | The α/β level-degeneracy product and root choices were checked against Kato 1.6. The suggested declaration is only preservation of a finite product by a ring map, with no degeneracy formula. |
| `KatoEulerSystems:L1/beilinson-element-in-K2-of-Y-M-N` | **corrected** | Kato 2.1–2.2 checked with M,N≥2, M+N≥5, two separate auxiliaries and both units on the same curve. Added direct descent edge and bilinearity API; both identity entries tested. |
| `KatoEulerSystems:L1/K2-norm-projection-formula-and-level-norm-relation` | **unverifiable** | Source 2.3/2.11 and standing levels corrected. The generic projection identity is a useful part, but the named signature omits the level-change norm relation for the actual two-index elements. Clear packet corrections are retained; the signature revision remains required. |
| `KatoEulerSystems:L1/euler-factor-norm-relation-at-auxiliary-primes` | **unverifiable** | The good/bad auxiliary-prime cases of 2.4/2.12 are correct in the packet. The suggested declaration merely expands an operator; it has no transfer between levels or norm relation. |
| `KatoEulerSystems:L1/etale-chern-moment-map-into-modular-local-system` | **corrected** | Kato 8.4–8.5 composite and k−r twist checked. Reversed source excerpt corrected; open-curve and integrality inputs explicit; extensionality and nonzero composite test added. |
| `KatoEulerSystems:L1/hecke-and-diamond-equivariance-of-the-moment-map` | **verified** | Kato 8.8–8.9 equivariance checked against the two-index correspondence request; the conditional linear-map compatibility signature retains the operator scaling. |
| `KatoEulerSystems:L2/integrality-of-the-cyclotomic-limit-in-S-integral-cohomology` | **unverifiable** | Lemma 8.5 and the dual residue-H¹ argument checked. The signature assumes restriction is zero and dualizes into Q; this loses finite p-primary Pontryagin duality and states no S-integral lifting conclusion. |
| `KatoEulerSystems:L2/p-adic-zeta-elements-and-their-norm-relations` | **corrected** | Kato 8.1/8.7 and 9.5 normalizations checked, retaining ℓ^(−r), ℓ^(k−1−2r), bad-level cases and repeated p-direction. Tests now use constructed classes and a nonzero moment. |
| `KatoEulerSystems:L2/euler-system-datum-for-the-modular-lattice` | **corrected** | Kato 13.1–13.3 arithmetic-Frobenius convention and the ES.2 carrier/conductor/Euler-factor-change statements checked. Extensionality added; repeated-prime test uses adapter components. |
| `KatoEulerSystems:L2/integral-zeta-submodule-and-finite-index` | **unverifiable** | The inclusion direction and 13.12 height-one argument were corrected. The named Lean theorem gives only membership under an assumed inclusion; it has no finite quotient conclusion. Clear packet corrections are retained; the signature revision remains required. |
| `KatoEulerSystems:L3/dual-exponential-map-on-the-modular-local-system` | **corrected** | Kato 9.2–9.4 filtration steps and endpoint checked; open/log comparison requested. Generic exp* stays imported, with a coercion API/test rather than a second definition. |
| `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements` | **unverifiable** | The p^(−r) and bad-level cases of 9.5 are source-correct; KK3 is an honest gap. The suggested signature only expands id−p^(−r)A, with neither exp* of a zeta class nor the Eisenstein-product value. |
| `KatoEulerSystems:L3/zeta-class-interpolation-of-complex-L-values` | **corrected** | Kato 12.5 and Burungale–Tian 2.4 formula checked: global twist k−r precedes specialization, loc_p and exp*. Replaced odd-prime local twist supplier; missing actual arithmetic hypotheses in the formal formula are explicitly permitted omissions under §13. |
| `KatoEulerSystems:L3/beilinson-regulator-and-the-archimedean-zeta-value` | **unverifiable** | Kato 2.5–2.7 uses the derivative at zero and the actual Deligne regulator. The signature only distinguishes two arbitrary complex numbers and omits the regulator-value equation. |
| `KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra` | **corrected** | Kato 13.4 and Rubin II.3 packages checked with parity (ii), purity (iii), cyclotomic irreducibility, rational/integral τ distinction and strict-H² adapter. Natural-length prototype captures only the explicitly described inequality consequence. |
| `KatoEulerSystems:L4/nonvanishing-of-the-zeta-submodule-at-height-zero` | **corrected** | Kato 13.5–13.7 and Burungale–Tian 2.4 checked; δ_{L,L} excerpt fixed. Source theorem concerns actual canonical-map span at every component; generic nonzero-span prototype is explicitly conditional. |
| `KatoEulerSystems:L4/cohomological-divisibility-one-direction` | **corrected** | Kato 12.5(3)–(4), 13.13–13.14 and Nakamura 5.2 checked; E8 distinguishes literal rational display from intended integral lattice inequality. Exceptional local length and stronger image hypotheses retained. |
| `KatoEulerSystems:L4/ordinary-selmer-divisibility` | **corrected** | Kato 17.1–17.6 and proof 17.13 checked; E9 corrects goodness to f* and the dual lattice U≅T*(1−k). Dyadic/integral regulator and strict-Selmer suppliers remain explicit conditions. |
| `KatoEulerSystems:L4/cm-exclusion-and-the-separate-treatment` | **unverifiable** | Rational unipotents, integral full-image hypotheses and the CM exclusion checked. Cancellation x*b=0 iff b=0 supplies neither the representation-image theorem nor its rational/integral rank-one quotient. |
| `KatoEulerSystems:L0/analytic-product-cusp-divisor-and-integrality` | **unverifiable** | Bernoulli exponent, cusp-width conversion and integrality hypotheses checked, with E1 confirmed. The named signature contains only one numerical leading-exponent value and no q-product, cusp divisor or integrality statement. |
| `KatoEulerSystems:L1/chern-symbol-normalization-and-denominators` | **unverifiable** | Imported finite Chern sign and denominator hypotheses checked. Negating an arbitrary additive map does not state c_(2,2)=−cup or ch_(2,2)=cup on scheme K₂ symbols. |
| `KatoEulerSystems:L2/full-level-hecke-linear-zeta-classes` | **corrected** | Nakamura equations (9)–(16) checked. Integral coefficients are literal duals; the completed BM moment export is requested; rational self-duality no longer supplies this construction. Extensionality and nonzero-map tests added. |
| `KatoEulerSystems:L2/hecke-dual-twist-dictionary` | **unverifiable** | The dictionary is corrected to the rational/factorial-invertible domain, preserving the two different central powers. Its named signature is just a power identity, with no Hecke operators, dual coefficients or transport. Clear packet corrections are retained; the signature revision remains required. |
| `KatoEulerSystems:L2/rational-kato-zeta-morphism` | **corrected** | Kato 12.5(1)–(2), 13.9–13.12 checked. Fractional construction and rational membership are a joint argument, with direct generator, nonvanishing and finite-support inputs; uniqueness and nonzero/sign tests added. |
| `KatoEulerSystems:L3/archimedean-period-quotient-and-critical-values` | **verified** | Kato 4.2.4, 6.3–6.6 and the §7 reduction checked, including f*, signs, exclusions, product/smoothing exponents and E¹=F¹. The formal formula omits its unexpressible geometric inputs as §13 allows; it is not a theorem for arbitrary periods. |
| `KatoEulerSystems:L3/parabolic-full-level-characterisation` | **verified** | Nakamura Lemma 3.4/Corollary 3.6 checked: only rational parabolic cohomology with Drinfeld–Manin splitting and inverse-limit exp* injectivity, never the open curve. Prototype records the conditional uniqueness implication. |
| `KatoEulerSystems:L2/nakamura-twisted-zeta-morphism` | **corrected** | Nakamura Appendix A checked with actual source/output twists and positive conjugation, after the Γ₁/dual-form dictionary; all-prime global twist and localization compatibility now explicit. Extensionality and constructed-map sign tests added. |
| `KatoEulerSystems:L3/refined-scalar-regulator-of-the-kato-class` | **corrected** | Kato 16.4–16.6 refinement and normalized η pairing checked. Added projection additivity/nonzero identity test; de Rham and dyadic domains explicitly requested from the regulator owner. |
| `KatoEulerSystems:L3/noncritical-analytic-arithmetic-comparison` | **corrected** | Kato 16.2/16.6 interpolation and small-slope uniqueness checked against R10/R09, with precise period and dyadic requests. The abstract separating-evaluation implication is a conditional core, not a completed arithmetic comparison. |
| `KatoEulerSystems:L3/critical-and-bad-reduction-comparison-domain` | **corrected** | R10 family statement read; decency, common affinoid domain, dense noncritical locus and nonvanishing periods restored. Compatible arithmetic family remains an explicit condition; no cycle through PadicFamilies L4. |
| `KatoEulerSystems:L4/analytic-twist-nonvanishing` | **corrected** | Kato 13.5–13.7 and AWS III.5.6 checked. Corrected 13.5(2) to even-weight central values; use functional equation off the center and nonvanishing at k−1 for k≥3. |
| `KatoEulerSystems:L4/rational-iwasawa-module-structure` | **unverifiable** | All-prime Kato 12.4, including its separate CM proof supplier, checked. A rank-one basis is an input to the prototype; H² torsion and integral H¹ torsion-freeness are absent, and rational freeness is not stated as a conclusion of the arithmetic inputs. Clear packet corrections are retained; the signature revision remains required. |
| `KatoEulerSystems:L3/elliptic-dual-exponential-and-kato-period` | **unverifiable** | AWS III.5.1–5.3 and the odd-prime correction E2 checked. The identity localIndex*p⁻¹*p=localIndex states neither the exp* image lattice nor the Kato period equation. |
| `KatoEulerSystems:L4/elliptic-cyclotomic-mordell-weil-finiteness` | **unverifiable** | Source application checked and uniform finite-layer descent supplied. The prototype only gives membership under fixedLayer=top; finite generation does not occur in its conclusion. Clear packet corrections are retained; the signature revision remains required. |
| `KatoEulerSystems:L4/elliptic-ordinary-and-multiplicative-divisibility` | **unverifiable** | Coleman and ordinary/multiplicative bounds checked, keeping the split augmentation factor and precise dyadic supplier gap. The prototype simply unfolds an assumed divisibility and omits torsion, rational/integral cases and the Coleman image. Clear packet corrections are retained; the signature revision remains required. |
| `KatoEulerSystems:L4/elliptic-no-finite-iwasawa-submodule` | **unverifiable** | The local torsion exclusions and Greenberg/norm-freeness requests match AWS III.5.17. The prototype assumes the desired no-finite-submodule criterion itself; it does not state the elliptic theorem under its arithmetic hypotheses. |
| `KatoEulerSystems:L4/elliptic-rank-zero-p-part-upper-bound` | **verified** | AWS III.5.11/5.18 checked: nonzero L-value, odd good p, full image, bad unit/local-torsion exclusions and exact control cancellation retained. Conclusion is an upper bound only. |

## Exact changes by node

### KatoEulerSystems:L0/siegel-units-and-c-independent-rationalisation

- Resolved the contradictory acceptance item using confirmed E1, rather than requiring an unspecified clean edition.
- Added construction-sensitive test siegel_identity_pullback.
- Strengthened test siegel_integral_not_equal to exercise its construction.

### KatoEulerSystems:L1/beilinson-element-in-K2-of-Y-M-N

- Added direct prerequisite KatoEulerSystems:L0/siegel-unit-galois-action-and-distribution.
- Corrected OCR ≥ in the source excerpt; retained the standing fine-moduli boundary.
- Added beilinsonElement_bilinear API and a conditional typed prototype using the imported compatibility or extensionality law.
- Strengthened beilinson_identity_entry in the suggested file to test both identity entries, matching the packet.

### KatoEulerSystems:L1/K2-norm-projection-formula-and-level-norm-relation

- Restored standing lower-level hypotheses and corrected the ≥ and triangular-matrix OCR transcriptions.

### KatoEulerSystems:L1/etale-chern-moment-map-into-modular-local-system

- Added direct prerequisite KatoEulerSystems:L2/integrality-of-the-cyclotomic-limit-in-S-integral-cohomology.
- Repaired the reversed excerpt; replaced the parabolic-only supplier with an open-curve comparison request and added the direct integrality edge.
- Added direct prerequisite ModularCurvesPartII:R14.3.
- Recorded supplier gap: Open modular-curve coefficient comparison.
- Added API chernMoment_ext.
- Added construction-sensitive test moment_identity_maps.

### KatoEulerSystems:L3/dual-exponential-map-on-the-modular-local-system

- Corrected the filtration endpoint in the excerpt and removed the parabolic-only cohomology supplier.
- Added direct prerequisite ModularCurvesPartII:R14.3.
- Recorded supplier gap: Open modular-curve coefficient comparison.
- Added API modularDualExp_coe.
- Added construction-sensitive test dualExp_coercion.

### KatoEulerSystems:L3/zeta-class-interpolation-of-complex-L-values

- Replaced the odd-prime local twist supplier by the all-prime global semilinear Iwasawa twist supplier.
- Added direct prerequisite SelmerIwasawaCohomology:L3.
- Recorded supplier gap: Global-to-local twist compatibility.

### KatoEulerSystems:L2/nakamura-twisted-zeta-morphism

- Replaced the odd-prime local twist supplier by the all-prime global semilinear Iwasawa twist supplier.
- Added direct prerequisite SelmerIwasawaCohomology:L3.
- Recorded supplier gap: Global-to-local twist compatibility.
- Added API twistedKatoZeta_ext.
- Added construction-sensitive test twisted_identity_maps.
- Strengthened test twisted_positive_sign to exercise its construction.

### KatoEulerSystems:L2/full-level-hecke-linear-zeta-classes

- Replaced the false integral symmetric-power duality and separated the integral construction from the rational dictionary.
- Added direct prerequisite CompletedCohomologyAndLocalGlobalCompatibility:R31.2.
- Recorded supplier gap: Completed Borel–Moore classical moment export.
- Added API fullLevelZeta_ext.
- Added construction-sensitive test fullLevel_identity_moment.
- Strengthened test fullLevel_new_prime to exercise its construction.

### KatoEulerSystems:L2/hecke-dual-twist-dictionary

- Restricted the self-duality transport to coefficients where the factorial is invertible; retained the rational all-prime dictionary.

### KatoEulerSystems:L3/refined-scalar-regulator-of-the-kato-class

- Added direct prerequisite PadicHodgeRegulators:L3.
- Recorded supplier gap: Dyadic regulator and Coleman domain.
- Added API katoScalarRegulator_projection_add.
- Added construction-sensitive test scalar_identity_maps.

### KatoEulerSystems:L3/noncritical-analytic-arithmetic-comparison

- Added direct prerequisite PadicHodgeRegulators:L3.
- Recorded supplier gap: Dyadic regulator and Coleman domain.

### KatoEulerSystems:L3/critical-and-bad-reduction-comparison-domain

- Recorded supplier gap: Dyadic regulator and Coleman domain.
- Restored decency, the common affinoid neighborhood, dense locus and nonvanishing normalization hypotheses from the actual family supplier.

### KatoEulerSystems:L4/ordinary-selmer-divisibility

- Added direct prerequisite PadicHodgeRegulators:L3.
- Recorded supplier gap: Dyadic regulator and Coleman domain.
- Corrected the good-period representation to the dual f* lattice U≅T*(1−k), using 17.6 and 17.13.

### KatoEulerSystems:L4/elliptic-ordinary-and-multiplicative-divisibility

- Added direct prerequisite PadicHodgeRegulators:L3.
- Recorded supplier gap: Dyadic regulator and Coleman domain.

### KatoEulerSystems:L2/integral-zeta-submodule-and-finite-index

- Added direct prerequisite KatoEulerSystems:L4/analytic-twist-nonvanishing.
- Added direct prerequisite ModularSymbolsPadicLFunctions:L0.
- Repaired the inclusion direction and supplied the missing height-one and finite-support arguments, with a precise algebraic request.
- Added direct prerequisite PadicMeasuresIwasawaAlgebras:L4.
- Recorded supplier gap: Finite-support theorem for the full cyclotomic algebra.

### KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra

- Added direct prerequisite AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation.
- Restored the distinct parity hypothesis and correctly indexed purity in Kato 13.4.

### KatoEulerSystems:L4/nonvanishing-of-the-zeta-submodule-at-height-zero

- Corrected the full-level Ash–Stevens generator indices in the source excerpt.

### KatoEulerSystems:L4/analytic-twist-nonvanishing

- Restricted the Rohrlich citation to even weight at the central value; separated functional-equation nonvanishing off the center.

### KatoEulerSystems:L4/rational-iwasawa-module-structure

- Corrected Theorem 12.4 printed page 220 to 221.

### KatoEulerSystems:L4/elliptic-cyclotomic-mordell-weil-finiteness

- Added the uniform fixed-layer descent argument using the finite torsion exponent.

### KatoEulerSystems:L4/cohomological-divisibility-one-direction

- Recorded the integral lattice inequality as the contextual correction E8 and cited its proof 13.14.
- Corrected the purported integral quotation to the literal rational display; corrected the local H² calculation reference to 13.13.

### KatoEulerSystems:L2/rational-kato-zeta-morphism

- Added API katoZetaMap_unique.
- Added API katoZetaSubmodule_eq_span.
- Added construction-sensitive test katoMap_generator_one.
- Made the fraction-module construction and rational-membership argument explicit; added its direct generator/nonvanishing/finite-support suppliers to avoid a proof-sketch bootstrap.
- Strengthened katoMap_sign to use a nonzero value of the constructed map.

### KatoEulerSystems:L2/p-adic-zeta-elements-and-their-norm-relations

- Added construction-sensitive test zeta_identity_moment.
- Strengthened test zeta_p_direction to exercise its construction.

### KatoEulerSystems:L2/euler-system-datum-for-the-modular-lattice

- Strengthened test euler_repeated_prime to exercise its construction.
- Added katoEulerAdapter_ext API and a conditional typed prototype using the imported compatibility or extensionality law.

### KatoEulerSystems:L0/theta-function-c-normalised

- Added the c,d auxiliary compatibility API, with explicit common divisor/norm conditions in the prototype.
- Added cTheta_baseChange API and a conditional typed prototype using the imported compatibility or extensionality law.

Top-level changes are the corrected Burungale–Tian title and Rubin version/access metadata, new source-review objects and E7–E10, five new supplier requests/gaps, updated stage remaining lists, and this review object. The suggested file adds the corresponding API/test signatures, repairs the seven tests described above and warns explicitly about its unresolved theorem omissions. No mathematical node was added, deleted or promoted.

## Required revision and orchestrator decisions

1. Make the seventeen `unverifiable` named signatures state the packet conclusions, even where carriers must remain abstract. In particular include the finite quotient for `integralZetaFiniteIndex`, actual norm/transfer relations, the exp*/regulator-value equations, literal dual/coefficient/operator transport, the local lattice and period equalities, H² torsion/H¹ structure, and finite generation. Expressible conclusions must not be replaced by an algebraic afterthought. Unexpressible hypotheses may still be omitted and documented, without opaque propositions.
2. Synchronize the read-only reader with the reviewed packet. Its reversed moment excerpt, endpoint excerpt, unresolved-Bernoulli wording, integral self-duality, good-period lattice and missing supplier domains must not remain authoritative after a revised submission.
3. Route the five precise new exports to their owners; decide the unstaged early CM owner before advertising proof closure. Preserve the original KK3, integral control and period gaps. An accepted planning pass can retain honest gaps; it must not assert that an odd-prime or parabolic supplier has stronger scope.
4. Retain literal integral duals throughout the full-level construction and use the rational Hecke dictionary only on its stated domain. Record E7 as a source issue, rather than silently changing the source convention.
5. Keep the existing atlas-edge handoff and critical-family cycle boundary. This review does not authorize promotion or modification of upstream Tau Ceti roadmaps.

No response from the user is needed to finish this review; these are routing requirements for the next revision job.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/KatoEulerSystems.json`: zero errors, zero warnings on the final reviewed packet.
- Source-issue and source-version validators pass for all ten entries; `check_errata.py` is run on an errata-schema projection, since its standalone CLI requires `errata-v1`, not a blueprint packet.
- All 40 node declaration names, 60 API names and 41 test labels occur in the suggested file; every construction has at least three tests. Internal node graph acyclicity and the 22 inherited IDs are checked.
- `lean-check` completed successfully at exact Mathlib pin 082e2d37e8b0463410cdb532e111cd43d5a66174, with **zero errors and 133 warnings, all admitted-proof warnings**. Three checks were sequential, with over 100 GB available before each, no language server or library build. Final suggested-file SHA-256: `42ee81651d07322a517ae565106c1bd0cd4750b862fb5ffeecc22f5a6e336807`.
- The shared Tau Ceti tree is newer than the cited pin. This file imports only Mathlib, so elaboration verifies its exact pinned Mathlib primitives; it does not claim a two-tree pinned Tau Ceti compilation or any completed arithmetic implementation.

The submission handoff records the final checks and precise revision requirements. Scratch sources and logs are removed after the PR opens; all evidence needed by the next worker is in this report and the packet's public URLs, versions, digests and source-issue arguments.
