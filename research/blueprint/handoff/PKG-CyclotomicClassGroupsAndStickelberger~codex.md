# Handoff: PKG-CyclotomicClassGroupsAndStickelberger~codex

Agent: Codex. Session: codex-How5ay. Issue: #11246. Date: 2026-10-20.

The claim bot confirmed this session's claim in comment 6279586690, following claim comment 6279584460. This is a complete package submission for independent review, with exactly the four issue deliverables. No second job was claimed. The README is a mathematical roadmap, not an assertion that its targets have been formalised.

## Delivered and remaining

- README: nine layers, all 47 input nodes, exact supplier contracts, API outlines, discriminating Checks, worked examples, theorem/section/printed-page locators, downstream interfaces and references. It includes all primes and positive prime-power levels; the integral dyadic distinctions are explicit.
- Suggested.lean: nine real-bodied light definitions, ten headline theorem statements and sixteen proved examples. Heavy constructions remain named README targets and are listed in the closing comment. There are no admitted data definitions, auxiliary theorem chains, computational algorithms or conjectural axioms.
- metadata.toml: `topic = "math.NT"`.
- This handoff records coverage, ownership, source corrections and the adversarial pass.

No input target was dropped or left unsupported by a named target and source/proof route. In particular the three input gaps are resolved as described below. The universal Vandiver assertion remains a conjecture in prose, rather than an unsupported theorem. The arithmetic modular quotient, finite-flat models and local Hodge–Tate comparison are substantial future formalisation targets, fully specified in the README; the Lean file does not pretend that their carriers exist at its pins.

The issue's stage-description JSON is absent from this clone. The existing packet's scope, coverage and all 47 nodes, the reader, original suggested file, current upstream roadmaps and sources were used. The packet and its three historical gap entries are inputs and were not edited: their remaining entries do not describe unresolved gaps in this package.

## Input coverage

Every API, hypothesis, construction and end result of these input nodes was reconciled into the indicated sections. Smaller proof steps stay in the prose, as required by target-level planning.

| Input family | Nodes covered | Package location |
| --- | --- | --- |
| C0 | native-class-action; tame-eigenspace; decomposition; real-and-dyadic; prime-above-p | §§0.1–0.5 |
| C1 | hilbert90-comparison; relative-unit-lattice; hilbert91; hilbert92; hilbert93; capitulation-map; hilbert94; one-prime-control | §§1.1–1.7; field Hilbert 90 is imported |
| C2 | stickelberger-element; integral-ideals; smoothing; gauss-factorization; stickelberger-annihilation | §§2.1–2.5 |
| C3 | bernoulli-comparison; projected-annihilator; herbrand; reflection; class-number-formulas | §§3.1–3.4 |
| C4 | relative-class-number-bound; eisenstein-congruence; residual-extension; local-splitting; unramified-extension; herbrand-ribet | §§4.1–4.5, including the newly explicit arithmetic bridges |
| C5 | regular-prime; kummer-criterion; primary-radical; kummer-lemma; regular-tower; dyadic-tower | §§5.1–5.4 |
| C6 | cyclotomic-units; unit-generators; unit-index; vandiver; vandiver-equivalences | §§6.1–6.4 |
| C7 | cyclotomic-tower; cyclotomic-control; class-number-growth | §§7.1–7.3 |
| C8 | mazur-odd-vanishing; unramified-obstruction; etale-duality; eisenstein-export | §§8.1–8.4 |

The three named EisensteinIdealAndRationalTorsion contracts are all present: `cyclotomicClassEigenspaces`, `stickelbergerHerbrandAnnihilator`, and `inverseCharacterUnramifiedQuotient`. They include all-level tame decomposition, arithmetic Artin equivariance, the separate exponent-one and exponent-minus-one vanishing, actual unramified class-field quotients, and constant-coefficient étale duality.

## Closing the input gaps

**G1, the determinant bound.** The package does not rely on the unread Carlitz–Olson article. Section 4.1 constructs the centered odd residue matrix `2r_p(ab⁻¹)−p`, diagonalizes it using odd characters and the sourced class-number product, and computes its row norm. Its absolute determinant is `(2p)^(d−1)h_p⁻`, and its squared row norm is `p(p−1)(p−2)/6`, with `d=(p−1)/2`. Hadamard gives the strict bound needed by Ribet. The p=3 and p=5 matrices pin the centering, inverse, factor two and determinant normalization. This supplies the irregular-index count before the auxiliary Eisenstein form, without using Ribet's converse.

**G2, the dyadic unit index.** Sharifi's Theorem 4.3.3 remains explicitly odd-prime-only. Sections 6.1–6.3 give the dyadic real ratios with their sign ambiguity, retain −1, prove the distribution comparison, and apply the reduced group determinant and the primitive even-character class-number product. A nontrivial even dyadic primitive conductor is at least eight. The result is the full index `h(K_m⁺)`, without an extra factor two. Conductors two, three and four are separate rank-zero checks; conductor eight supplies `1+√2` and its regulator. The determinant argument handles a zero trivial-character eigenvalue without dividing by it.

**G3, the upward Iwasawa citation.** Layer 7 owns the arithmetic norm limit, Artin realization, exact one-prime control, finite generation and torsion in this cyclotomic tower. It imports only the lower algebraic results from PadicMeasuresIwasawaAlgebras. It never imports IntegralIwasawaTheory. Higher-level inverse-character vanishing also has the independent finite genus/Nakayama proof in §§1.7 and 8.1. No two-roadmap bundle or upward dependency is needed.

## Ownership moves and supplier-request reconciliation

The insertion is after ClassFieldTheory. The following work is stated here because the current lower suppliers do not contain it, or because the input named a higher supplier:

1. The six finite circular-unit notions formerly assigned to IntegralIwasawaTheory Layer 0 move to §§6.1–6.3: the S-unit/intersection definition, real ratio, finite generator relations, real/full quotient comparison, odd-prime index and dyadic index. Inverse-limit units, Euler systems and analytic characteristic ideals stay with their later owners.
2. The arithmetic cyclotomic norm limit, exact control and application of algebraic growth move down to Layer 7. The generic completed-group-ring/structure theorem remains PadicMeasuresIwasawaAlgebras' work.
3. The finite complex Bernoulli special values and logarithmic sums requested from DirichletPadicLFunctions are in §§3.1 and 3.4. Native complex Dirichlet continuation and its functional equation are consumed, not rebuilt. No p-adic analytic interpolation moves down.
4. The modular arithmetic realization and the particular prime-level good-reduction comparison requested from ModularCurvesPartII are in §§4.3–4.4. These include general weight-two modular quotients, the rank-two coefficient factor, Eichler–Shimura on special fibers, and the smooth proper model of the nontrivial-character prime-level quotient. Current ModularForms' analytic comparison is not misrepresented as the arithmetic theorem.
5. Small-ramification generic-fiber full faithfulness, closure and quotient, lattice realization by isogeny, connected–étale descent, p-divisible groups and their local comparison are named general targets in §4.4. Their later finite-flat and arithmetic Galois-representation consumers should import these statements.
6. General abelian-variety prime-to-characteristic torsion counts, the degree polynomial and its Tate characteristic polynomial, numerical intersection polynomial, abelian Riemann–Roch, Rosati positivity and the Frobenius bound are explicit in §4.3. The generic Tate-module carrier is already in current Tau Ceti and does not move or get rebuilt. Proper coherent cohomology and dual/polarization theory remain JacobianChallenge inputs. The algebraic degree/intersection route avoids silently assuming a whole étale cycle-class theory.
7. Local algebraicity and Hodge–Tate character comparison are explicit in §4.4 for all finite local base and coefficient fields, with embedding-indexed weights. The definition uses the character-lattice formula and does not introduce a second restriction-of-scalars-torus construction. The specialization over ℚ_p gives the integer-power character used for irreducibility over ℚ.
8. Generic finite-DVR eigencharacter lifting is in §4.2. ModularForms supplies the finite integral Hecke objects but does not currently state that lifting theorem. The zero/torsion-only modules are excluded, and coincident residual eigenvalues are allowed.
9. The genus exact sequence and number-ring constant étale-torsor comparison are in §§1.7 and 8.3. The Hilbert class field, arithmetic reciprocity and generic unit Herbrand quotient remain ClassFieldTheory's supplied work.

All twelve input requests were checked: Chebotarev uses its existing prime-selection theorem; ClassFieldTheory Layers 5, 11 and 13 supply the indicated local/global reciprocity, Hilbert field, Herbrand and conductor–discriminant contracts; the generic genus and constant-torsor additions are supplied here. The conductor–discriminant request against GlobalNumberFields was corrected to ClassFieldTheory Layer 13. ModularForms Layers 0, 2, 4 and 8 supply their existing forms/Hecke/newform/coefficient objects, while the precise integral prime-level comparison and lifting step are stated here. NumberFieldArithmetic's different/ramification criterion is consumed without duplication.

## Duplication audit

The pinned sources were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The current read-only roadmaps were checked at `0d144d044dacebca17b654695b6f1ad58f159b27`, and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches used objects, formulas and structures as well as proposed names. The current nine roadmaps absent from the atlas snapshot and Completed directories were included in the search; no new cyclotomic target was found there. No command built or changed either read-only tree.

The package cites, rather than replans:

- Native cyclotomic fields, Galois/root-power equivalence, rings of integers, ramification, norms, maximal real subfields and full class numbers.
- `ClassGroup.mulEquivHom` and its ideal-class computation. Only scalar extension, the Sylow comparison and arithmetic eigenspaces are new targets.
- Field Hilbert 90; native Tate-cohomology carriers; existing Teichmüller lifting.
- `IsPrimitiveRoot.geom_sum_isUnit` and `associated_sub_one_pow_sub_one_of_coprime`. The ratio's integrality/unit theorem was removed as new work; finite circular subgroup and generator comparisons remain.
- `NumberField.IsCMField.indexRealUnits`, `indexRealUnits_eq_one_or_two`, `unitsMulComplexConjInv` and `regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv`. A duplicate generic Hasse-index definition, its value theorem and the CM regulator comparison were removed. The missing prime-power Q=1 specialization remains.
- `NumberField.Units.regOfFamily`, its determinant formula and `regOfFamily_div_regulator`. The circular family is new; the general regulator/index theorem is not.
- Native Dedekind-zeta residue and analytic class-number formula, and Dirichlet-character continuation **and functional equation**. Only finite special-value, Euler-product and character-product comparisons remain.
- NumberFieldArithmetic's different/ramification criterion; ClassFieldTheory's conductor–discriminant formula, reciprocity, Hilbert class fields and generic unit Herbrand quotient.
- ModularForms' forms, Eisenstein/Fourier, Hecke, newform and integral coefficient objects; ModularCurves' integral curves; JacobianChallenge's cohomology, Jacobians, duals, polarizations and cube/square.
- IntegralHeckeAndGaloisDeterminants §1.4's oriented nonsplit lattice theorem. The package supplies its arithmetic representation and local finite-flat argument, rather than another lattice proof.
- Current `TauCeti.TateModule` and its topology, functoriality, projection surjectivity and rank-from-cardinality theorem. The existing elliptic-curve specialization is not planned again; the general abelian-variety count and comparison remain. This generic module is newer than the Suggested.lean pins, so no unavailable import was added there.
- PadicMeasuresIwasawaAlgebras' integral tame projectors, completed group ring, structure/length theorem, compact inverse-limit exactness and topological Nakayama. The accepted PR #780 exemplar provides the exact contracts; its directory is absent from the supplied current-main tree. It is cited as an existing roadmap, never as compiled code at the pin.

## Source audit and corrections

Sources were read directly, and statements and proof routes are written in our own words. No source passages or source files are committed. Public source versions are fixed by the hashes below. The cleared Deligne–Rapoport volume was read in place, without making a copy or text extract; its V §3, Theorem 3.2 and Example 3.7(i), DeRa-112–113 (volume 254–255), were checked. No uncleared Washington, Lang, Mumford or Serre book copy was used. Milne's author notes provide the abelian-variety statements actually cited. Tate citations concern *p-Divisible Groups*, not Tate's thesis.

Locators corrected or distinguished include Sharifi Proposition 1.5.18, p.34 (not p.33); Corollary 3.1.6, p.76 (not an example); Mazur I equations (2.4)–(2.6), pp.50–51 (not pp.52–53); and Deligne–Rapoport's article vs volume page labels. Milne's 2008 course notes and 2022 article notes use different numbering and are separate references. The good-reduction torsion comparison cites only the forward direction of Milne IV Theorem 3.5, p.141; no Néron criterion is silently required. Stacks' online §33.45 is printed Varieties §45, pp.101–104.

The four source issues in the input were rechecked and corrected in the mathematical statements, without editing the input errata list:

| Source issue | Correction used | Control |
| --- | --- | --- |
| Sharifi Lemma 4.3.4 proof, pp.109–110 | `Φ_(p^j)(1)=p`, and all intermediate prime-power factors occur | `Φ₉(1)=3`; rational norm of `1−ζ₈` is 2 |
| Sharifi Lemma 4.5.5, p.115 | Nontrivial Gauss product uses field cardinality q; trivial character excluded | Over a field of size ℓ² the factor is ℓ²; trivial negative Gauss sum is 1 |
| Sharifi Theorem 4.5.7 proof, p.117 | Choose a generator of the finite residue-unit group | The exponent comparison needs a nontrivial residue value |
| Keith Conrad Theorem 1 proof, p.7 | Logarithmic sum must retain the final factor from its product | At m=2 the printed shortened sum is empty; our proof instead uses Hilbert's unramified radical |

An additional discrepancy was found in Sharifi Theorem 4.4.2, p.111: the displayed exceptional δ condition uses roots of unity of F, whereas the proof on pp.112–113 uses roots of unity of E. Section 3.3 uses μ(E), as required by the Kummer radical. It also states both inequalities over a common unramified coefficient residue field, avoiding the source's confusing absolute-rank/residue-degree conversion. This should receive independent confirmation in review; the proof route and corrected condition are explicit rather than an unmarked transcription.

Public source SHA-256 values:

| Source/version | SHA-256 |
| --- | --- |
| Sharifi, 189-page author PDF | `e5308be4c3d9ded6002cefb50df64b31f62b584b6ff68be7f21dc939f2508c26` |
| Ribet, author-hosted Inventiones scan | `6985813b4026bb0fd7098aed3f816262e0922f62a5d2dab22e29bcc2eb323471` |
| Mazur, Numdam PDF | `c20c7e73be20d6cc961127504b6be019f7707e0ee6154ba1fac0bbfd5973be8a` |
| Raynaud, Numdam PDF | `05cad2f5c2c33a2eea5739d255a8bb7de724e48e38dadb30507adc5e84f2edfe` |
| Hilbert, e-rara public-domain OCR | `e4d58252f805f00213729aee8231f51577eee03c676dc95058c6ee5e56efd519` |
| Keith Conrad, Kummer's Lemma, 8 pages | `4739a256159d1cf74184a34849d2ef3b6a5fd6dcb18ece90d02ea52bb99f1bc2` |
| Soulé, arXiv math/9812171v1 | `1e1acc3e9e375379fd863606a81943b616195cd6432081383826bf38c2ce57dd` |
| Tate, p-Divisible Groups scan | `720bf7128d4f048853435b083d18d0d863056c1f991942192a7f00daa7e424aa` |
| Milne, AV course v2.00 (2008) | `f5ca4e63e5092a4b102daad1470e4cbed5fe8f82115e3a28c8881e3f67f6aaef` |
| Milne, AV article notes (2022) | `bffdf81c57c77420b5454b31270007989d12f332abea62424be15c424079fc7c` |
| Milne, CFT v4.03 (2020) | `50d79af78250a9f1117ad9d337e0b231704a533fc707966ed1bfa52e13d498f5` |
| Brian Conrad, locchar, Dec.11 2011 | `782fe71a3c7f26ccd67943d468f73540d384e2de5d474bf8369475b8b631d9bd` |
| Stacks, Varieties PDF served Oct.20 2026 | `ed339c312c86721e3f830876da14cabe89a96e83e454a78b7cd355555f4bca45` |

## Adversarial mathematics pass

The pass covered every defining formula, theorem, identity, API claim, convention and consumer interface, grouped below by its mathematical family. The row's section range includes all its subordinate API statements. The completed Lean build checks types; the following computations and hypothesis checks are separate mathematical checks. Heavy carriers are tested in the README, following the later package-shape rule; only tests of definitions expressible at the pins are in Lean.

| Statement/family | Instances tried | Result and change |
| --- | --- | --- |
| Conductor, level and native class conventions | m=1,2,4; r=0,1,2; full class group vs p-part | Arithmetic m≥2,r≥1; light boundary values stated; full class number retained |
| Covariant Galois/Artin action, §0.1 | ζ₅ under 2 and 3; pure tensor; trivial class group | Inverse automorphisms distinguished; both root values and tensor action proved in Lean |
| Sylow/tensor scalar comparison, §0.1 | classes of orders p,p² and prime-to-p; zero ring/module | Tensor with ℤ_p retains p²; ℚ_p would erase it; scalar action uses reduction at the actual exponent |
| Tame eigenspaces/projectors, §0.2 | p=5, exponents 1,3,−1; wild level two; zero module | Image is ω^i, not ω^(−i); Γ action retained; inverse membership formula proved |
| Unique sum and projector algebra, §§0.2–0.3 | zero module; one-dimensional pure character; p=2 | Orthogonal sum uses p−1 invertible; no wild semisimplicity or dyadic division by two |
| Norm/extension and real plus comparison, §§0.3–0.4 | quadratic two-prime orbit; p-torsion; c=±1 | Nj is degree; jN is orbit sum; only odd p allows N/2; extension not asserted injective generally |
| Three dyadic minus objects, §0.4 | ℤ/2 with c=1; ℤ/4 with c=1; zero group | Anti-invariants→minus quotient can be zero between equal-order groups; only two-torsion defects claimed |
| Unique conductor prime/split quotient, §0.5 | m=2,4,9; unit ideal; ramified extensions | Principal prime class kills no extra class quotient; its norm is p; splitting does not remove ramified extensions |
| Saturated relative units, §1.1 | real quadratic; cubic over imaginary quadratic; unit with u^ℓ in base | Saturation prevents quotient torsion; rank is (ℓ−1)d; projective cyclotomic module, not globally free |
| Relative rank hypothesis, §1.1 | imaginary quadratic over ℚ | No-infinite-ramification hypothesis necessary; not extrapolated to CM/real quadratic steps |
| Fundamental system, §1.2 | odd vs even multiples in ℤ; (1−ζ) times generator; nonprincipal projective rank one | Residue basis detects divisibility; no global free generator assumption |
| Unit cohomology/Hilbert 90 and 92, §1.3 | degree one; quadratic units with norm ±1; ℚ(i)/ℚ | Cardinalities 1,2,4; infinite factor changes ℚ(i) count; field witness need not be unit |
| Invariant ideal residues/Hilbert 93, §1.4 | inert unramified prime; totally ramified prime; two ramified primes | Only e>1 contributes; direct sum preserved; different criterion imported |
| Capitulation map and its entire API, §1.5 | principal base ideal; replace α by uα; inverse class; degree one | Cocycle is gα/α; choice changes by coboundary; injective with stated image, not always onto |
| Hilbert 94, §1.6 | cyclic degree one; prime degree; kernel order four | Exact norm-index cardinality, kernel killed by degree; no cyclicity claim |
| Genus quotient and sequence, §1.7 | trivial group; no inertia; one total inertia; two inertia groups | Nontrivial inertia kernel retained; general sequence is abelian, cyclic case gives coinvariants |
| One-prime vanishing/control, §1.7 | unramified step; one totally ramified prime; several primes; nonabelian p-group | Unique-prime hypothesis retained where needed; no cancellation of degree used for norm surjectivity |
| θ coefficients/conjugation/augmentation, §2.1 | m=1,2,3,5; even/trivial characters | θ₁=0 boundary; θ₂=1/2; unequal inverse-index coefficients at 5 proved in Lean |
| Denominator vs image ideal, §2.2 | m=2,3; b=1 and 1+m; unit ideal | J₂=2ℤ,I₂=ℤ; (2c−1)θ₃=1; all integer lifts needed; rational saturation not substituted |
| Positive smoothing/API, §2.3 | m=5,b=2,6; m=2,b=3; b=0,1 | Floors nonnegative; residue lift affects b; zero/one boundaries explicit; unequal coefficient pair proved |
| Gauss compatibility and descent, §2.4 | m=2; reindex generator; x=0,m; trivial character; field size ℓ² | Inverse inertia scalar and q-product fixed; valuation upstairs vs ideal downstairs distinguished |
| All-conductor annihilation, §2.5 | m=2,3; full vs p-primary class; arbitrary nonsplit prime | Integral smoothings only; Chebotarev prime representative construction supplies split auxiliary prime |
| Finite Bernoulli definition, §3.1 | χ₃,χ₄; trivial conductor one; characteristic dividing m | Values −1/3,−1/2 proved; light value at one is 0; arithmetic assumptions exclude division in characteristic p |
| Primitive/inflated and Kummer comparisons, §3.1 | new Euler prime; zero Euler factor; p=5,k=2; exceptional ω⁻¹ | Primitive conductors retained; integral residue 3; exceptional pB value is a unit, not B itself |
| Character annihilator/Herbrand, §3.2 | i=1,−1; p=3,5; zero component | Exceptional b=1+p treated separately; nonzero finite p-module cannot be killed by a unit |
| Unramified Kummer radical, §3.3 | x=1; multiply by y^p; valuation one; real place | Actual field extension tied to radical; ramified valuation excluded; ideal-class map choice-independent |
| Reflection/coefficients, §3.3 | common k→k′; χ=ω; E=K_p; index zero | Correct μ(E) δ; dimensions over one k; no residue-degree mismatch; reflected ranks not claimed isomorphic |
| Hasse index specialization, §3.4 | K₃,K₄,K₈,K₂ | Generic index/regulator duplication removed; only prime-power Q=1 is new; K₂ not treated as CM |
| Relative class number/analytic products, §3.4 | K₃,K₄,K₈; empty even product; inflated conductor | Roots w=6,4 and weighted regulator correct; rational ratio vs integral specialization distinguished |
| Odd matrix/Hadamard bound, §4.1 | p=3,5; row/column sign; even-character counterexample | Matrices [−1] and [[−3,1],[−1,−3]] proved; determinant normalization fixed without unread article |
| Irregular count and auxiliary form, §§4.1–4.2 | d small; k=2; involution fixed points | Bound proved before Ribet; empty divisibility instance at k=2; orbit count keeps fixed-point multiplicities |
| Eisenstein integral comparisons, §4.2 | constant; q coefficient; prime coefficient; nontrivial ε | Single coefficient prime and integral lattice; G₂/G₁ weight difference is formal-series congruence |
| Finite eigencharacter lift, §4.2 | rank one; diag(1,1+ϖ); zero module; torsion module | Generic lift allows repeated residual values; nonzero finite free lattice necessary; theorem supplied here |
| Cuspidal/all-Hecke/newform lift, §4.2 | nontrivial ε value; k=2; old level-one space | Two Eisenstein eigenvalues separated; all operators including p; no characteristic-zero eigenlift assumed |
| Modular quotient and coefficient factor, §4.3 | rational coefficient elliptic factor; [E:ℚ]>1; lattice rescaling | Actual A_f, rank two over E_λ, not full ℚ_p rank two; arithmetic Frobenius determinant ε(ℓ)ℓ |
| General abelian torsion/Tate comparison, §4.3 | g=0,1,2; n=0; ℓ=characteristic | Level zero cardinality one; rank 2g via existing carrier; excludes inseparable geometric-point count |
| Numerical Euler/intersection API, §4.3 | point; ℙ¹ O(a),a<0; ℙ¹×ℙ¹; trivial line; support dimension drop | Mixed coefficient normalization, additivity and projection degree; no full diagonal factorial confusion |
| Degree/endomorphism polynomial, §4.3 | zero endomorphism; scalar [a]; product; g=0; rational denominator | Degree 2g and trace 2ga; polynomial one at g=0; integrality only for integral endomorphism |
| Abelian Riemann–Roch, §4.3 | point; elliptic degree zero/positive; product polarization | χ and square-degree distinct; factorial retained; inseparable polarization allowed |
| Rosati/trace/Frobenius, §4.3 | elliptic [n]; product matrix transpose; α=0; g=0; q=1 | Positive only for nonzero α; trace/intersection denominator only for g>0; q=1 has no finite-field instance |
| Local/global line character and irreducibility, §4.3 | arbitrary continuous nonintegral character; local unramified infinite-order character; n₁+n₂=1 | Hodge–Tate hypothesis supplied; global finite ray quotient, not local finiteness assertion; good reduction precedes chosen lattice |
| Oriented residual lattice/conjugation, §§4.3–4.5 | upper triangular [1,b;0,d]; coincident characters excluded | Existing lattice theorem consumed; conjugation factor d⁻¹ gives class exponent 1−k |
| Finite-flat full faithfulness, §4.4 | field vs DVR; e=p−1; p=2; finite vector group | Mixed-characteristic complete DVR and e<p−1 explicit; does not create a model of every representation |
| Closure/quotient/scalar/connected–étale API, §4.4 | constant subgroup; μ_p special fiber; zero subgroup | Flat closure by ideal contraction; quotient and scalars constructed; μ_p is connected in characteristic p |
| Stable lattice→isogeny/good model, §4.4 | full Tate lattice vs E_λ factor; finite index; homothety | Extend by other factors; quotient by finite stable subgroup; generic representation not chosen independently |
| P-divisible carrier/dual/formal comparison, §4.4 | zero; μ_(p∞); ℚ_p/ℤ_p; group killed by p alone | h=0 permitted; dimension sum h; finite killed-by-p group is not a positive-height system |
| P-divisible Tate module, §4.4 | characteristic-zero geometric fiber vs characteristic-p geometric points | Ω and base map specified; rank-h result only when char Ω≠p; existing inverse-limit carrier used |
| Completed-field cohomology/Hodge–Tate, §4.4 | μ and constant factors; nonzero twist; twist zero | Constant Hom of μ has twist −1; no false H¹(C)=0; untwisted H¹ is one-dimensional |
| Local algebraicity/weight API, §4.4 | χ_p on units; trivial; infinite unramified; u^s,s∉ℤ; nonsplit coefficient tensor | Arithmetic Artin gives u⁻¹; integer embedding weights; no arbitrary continuous character theorem |
| Prime-level good reduction/local splitting, §4.4 | p=3 empty range; e=(p−1)/2; replacing real field by full cyclotomic field | Real local field satisfies strict bound; connected complement descended to full decomposition group |
| Unramified extension and Herbrand–Ribet, §4.5 | zero/nonzero additive subgroup of 𝔽; p=37,k=32; p=3 | Nonzero need not have order p; exponent 5 at (37,32); all ramification checked before Artin |
| Regularity/Kummer criterion, §5.1 | p=1,2,3,37; full vs relative class number | Predicate false at 1; regular 2,3; 37 irregular; native regular-3 check proved; reflection handles plus part |
| Primary radical, §5.2 | v=1; congruence λ vs λ^p; nonunit valuation | Extension may be trivial; divided polynomial has unit derivative; no unconditional degree-p assertion |
| Kummer unit lemma, §5.3 | u=±1,ζ_p; modulus p vs λ | ζ_p excluded by actual modulus; u/σu gains λ; unramified radical then invariant-unit norm kills class |
| Regular/dyadic/real towers, §5.4 | r=1,2; ℚ→ℚ(i); higher dyadic real norm | Two base fields before no-infinite-ramification argument; no division by two in dyadic descent |
| Circular S-units/intersection/ratios, §6.1 | m=2,8; a=1,−1,2; nonprimitive difference | Nonunits excluded by intersection; native ratio integrality imported; all levels and μ retained |
| Real ratios, §6.1 | (m,a)=(8,3),(5,2); m=4; dyadic representative plus m | Unit 1+√2 may have negative conjugate; dyadic sign ambiguity retained; −1 essential |
| Distribution/norm/full-real quotients, §6.2 | 8→4 rational norm; 4→2; odd initial step | Actual relative conjugates used; common valuations cancel; numerical index not confused with class-group isomorphism |
| Circular regulator/index, §6.3 | rank zero m=2,3,4; m=8; conductor 8→16; zero trivial eigenvalue | Torsion factor and determinant factors checked; dyadic proof stated rather than erasing odd-prime hypothesis |
| Vandiver predicate/equivalences, §6.4 | p=1,2,3; nonzero odd abstract component; prime-to-p unit quotient | Conjecture not asserted; regularity stronger; weak conditional Lean example deleted |
| Tower/inverse limit/action/projections, §7.1 | n=0,1,2; p=2; zero and constant finite systems | Dyadic base K₄; norm direction; γ=1+T; compactness/continuity explicit |
| Artin descent/control, §7.2 | n=0; one vs several primes; direct vs inverse limit | Exact X/TX at base; inertia correction vanishes only by total one-prime ramification/genus sequence |
| Finite generation/torsion, §7.3 | zero; free Λ summand; noncompact candidate | Compact Nakayama precedes finite generation; free summand contradicts finite controlled coinvariants |
| Growth invariants/shifts, §7.3 | Λ/(p),Λ/(T−p),Λ/(T); n=0 tail; base shift s | Lengths p^n,n+1; infinite coinvariants excluded; ν integer; μ scales by p^s and ν adds sλ |
| Low odd/inverse vanishing, §8.1 | p=3,5,691; −9 at p=5; all r | Reduce character first; exceptional exponent one separate; minus-eleven exclusion 691 retained |
| Universal inverse quotient, §8.2 | zero; ℤ/25 with ω⁻¹ vs ω; ramified/nonabelian extension | Actual Artin quotient required; arbitrary abstract action or nonabelian group cannot invoke theorem |
| Constant étale vs Kummer dual, §8.3 | p=5 source exponent 3; constant vs μ₅ target; characteristic-p special fiber | Actions 2 and 4 proved in Lean; shifts −i vs 1−i; μ_p not an étale coefficient sheaf at p |
| Hom character API, §8.3 | source=target; trivial source/target/group; p=5 | target/source formula; two unequal target actions proved; matches all README uses |
| Consumer interfaces, §8.4 and downstream | arbitrary division field; ramified quotient; regular/nonregular prime | Requires actual abelian unramified p-quotient and tame conjugation; does not assume Vandiver/main conjecture |

The ten Lean theorem signatures were separately checked against their README versions: unique tame sum; all-conductor positive smoothing; Herbrand–Ribet; Kummer criterion; unit lemma; regular odd-prime tower; dyadic tower; regular implies Vandiver; eventual class-number growth with dyadic shift; inverse-character vanishing. Their variables contain the needed primality, nonzero conductor, oddness/range, Teichmüller reduction, integral-unit congruence and eventual-index hypotheses. No premise supplies its conclusion. The prime-level eigenspace file is explicitly the light specialization of the all-level README definition, and the finite Bernoulli/matrix definitions retain harmless boundary values with arithmetic hypotheses attached to the theorems.

## Validation and submission

- `lean-check research/blueprint/packages/CyclotomicClassGroupsAndStickelberger/Suggested.lean`: completed successfully at the pinned shared environment; ten warnings, all `declaration uses sorry`, and no other warnings or errors. All sixteen examples are proved. The final body has nine light definitions and ten sorry-backed theorem statements; the closing comment names the omitted constructions. Available memory was above the required threshold; no Lean server or Lake build/update/cache command was started.
- `python3 scripts/check_blueprint.py research/blueprint/packets/CyclotomicClassGroupsAndStickelberger.json`: zero errors, zero warnings; 47 nodes and nine stages. Its three historical input gaps were left untouched and resolved in the package as above.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: four files, zero problems. The README is 149,056 bytes, within the required 50–200 KB range; all nine layers have Examples and Dependencies subsections. The four deliverables are the entire change scope.
- `git diff --cached --check`: passed for the four staged deliverables.

No suspicious source instructions were encountered. Fetched material was treated as mathematical data; no fetched code was executed. After opening the one PR, the runner records its URL and this session stops. The next mathematical step is the independent package review, especially the newly explicit modular/abelian/local comparison chains and the two elementary determinant arguments. No checkpoint or unfinished worker task is being handed off.
