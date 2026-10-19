# Independent package review: Eisenstein ideal and rational torsion

Reviewer: Codex, session `codex-tGg63C`, 2026-10-19. Job `REV-PKG-EisensteinIdealAndRationalTorsion~codex`, issue #11127. Input: the package introduced by the different session `codex-ThgUMA` in #11125, at commit `4cda0476a`.

**Verdict: needs_changes.** The arithmetic targets, source checks and compact Lean signatures substantially meet the package standard. The remaining defect is dependency closure: four general supplier extensions are specified in this consumer's introductory contracts but do not have the required targets in the cited supplier roadmaps. The package is not ready for an upstream draft. This is a completed fixing review, not a checkpoint.

The issue's embedded instructions refer to a Lawrence–Venkatesh title and an earlier review round. The named Eisenstein package and packet are the actual input; neither purported earlier review file existed at the starting commit. This review evaluates that input independently.

## Corrections applied

1. **Formal immersion at bad reduction (§7.9).** The original proof cited good-reduction torsion specialization, although its theorem correctly includes primes dividing the level exactly once. The replacement explicitly uses `HeightsRationalPointsAndObstructions` §§1.15b–1.16: a smooth commutative Néron model has a formal identity chart, and under e<q−1 the logarithm identifies the entire first congruence kernel with an additive characteristic-zero lattice. That kernel has no torsion. Thus a torsion difference with zero reduction vanishes without good reduction. The supplier paragraph, proof, prerequisites and source locator now agree. Checks include split multiplicative reduction, dimension zero and the counterexample ζ_q−1 at e=q−1. The arbitrary-level formal-immersion theorem and squarefree-level number-field corollary retain their full scope.
2. **Norm-19 kernel source (§8.3).** The finite-flat sequence is the Lemma in Mazur–Tate §4, printed p. 47. The generic sequence is the Corollary in §3, p. 45; the construction is on pp. 46–47. The former locator, §4 pp. 45–46, missed the finite-flat statement. The replacement distinguishes the two statements.
3. **Admissible-group convention.** The standing convention and supplier contract now explicitly say commutative and killed by a power of ℓ, in addition to the quasi-finite, flat and filtration conditions. These were implicit in the terminology but belong in the definition's hypotheses.

No target was deleted or weakened. `Suggested.lean` and `metadata.toml` required no edits.

## Required supplier work

These are planning defects, not demands for the supplier mathematics to have been formalised already. A cited dependency must contain the specified mathematical target with its prerequisites, API and tests; an intention to extend it does not establish that link. The allowed deliverable paths do not permit revising the supplier roadmaps. Incorporating four general theories into this arithmetic consumer would also require an ownership and tier decision beyond a local correction. The README keeps the exact contracts visible rather than hiding the gaps.

| Finding | Required target and affected consumers | Existing boundary and completion criterion |
| --- | --- | --- |
| C1: integral modular differentials | An integral weight-two cusp-form/relative-dualizing comparison at 2, 3 and the level, with q-expansions, residues, stack/coarse corrections, integral Serre duality for H¹(O), and Hecke adjoints. Used already by §§0.3–0.4 and later multiplicity-one/winding/formal-immersion arguments. | `ModularCurvesPartII` §7.2 is over ℂ and explicitly does not claim arbitrary integral base change; §§7.5–7.6 are rational pairings. `ModularForms`' integral coefficient pairing does not by itself identify the whole integral geometric lattice at bad primes. Add the general comparison in the owning supplier with exact hypotheses and numbered targets; reconnect this package to them. Source: Mazur II §§4–6, pp. 78–90, and §9, pp. 94–96. |
| C2: global admissible-group arithmetic | Marked quasi-finite ℤ-models, global prolongations and subquotients, geometric δ and α, finite fppf cohomology and h¹−h⁰≤δ−α, global constant/cyclotomic rank-one classification, odd purity/saturation, and the dyadic D/*-type theory. Used by §§1.4, 3–4, 6.1 and the integral descents. | `FiniteFlatGroupsAndIntegralPadicHodgeTheory` §§R07.1.24, .30–.35 give local model/classification results; .38–.39 give gluing and a Hom/Ext sequence. In particular .39's `mayerVietoris_mu_Z` does discuss computing Ext¹_ℤ(μ_ℓ,ℤ/ℓ); that is not the missing global cohomology inequality or saturation theory. Add the additional global targets in the named Part II direction and give exact incoming references here. Sources: Mazur I §§1–5, pp. 43–61; II §17, pp. 129–135. |
| C3: connected Néron cohomology and optimal quotients | Connected-model fppf sequences with component defects, the image of H¹(ℤ,𝒥⁰) in global cohomology and its Sha comparison away from 2 with the weaker dyadic assertion; separately optimal-new-quotient cotangent injectivity away from 2, including p∥N. Used by §§6.2, 6.5 and 7.9. | `NeronModelsAndSemistableAbelianVarieties` §6.4 concerns same-dimensional isogeny lattices with torsion cokernel; its own check permits failure modulo the residue characteristic. It gives neither general connected-model exactness nor the optimal-quotient cotangent theorem. Its Part II genus-one-fibration material does not fill this gap. Supply the two general outputs and their hypotheses in the owner, then cite actual sections. Sources: Mazur III §3, pp. 148–151; Mazur 1978 §§1–2(e), pp. 134–141. The local formal-kernel argument fixed above does not depend on this cohomology extension. |
| C4: inverse cyclotomic ideal-class eigenspace | For odd prime P≥5, vanishing of the χ_P⁻¹ eigenspace of the P-primary ideal class group of ℚ(ζ_P), with the equivariant unramified-extension quotient interface used in §7.7. | Current `ClassFieldTheory` Layer 13 supplies reciprocity, not this Stickelberger/Herbrand eigenspace consequence. Its idelic Herbrand quotient is a different assertion. No corresponding numbered Part II target was found. Add the ideal-class theorem and equivariant interface in the owner. The relevant Bernoulli value is B₂=1/6, so this does not assume regularity or full class number one. Source: Mazur I Proposition 2.8 and Corollaries 2.9–2.10, pp. 52–54. |

The roadmap is new and has no entry in the current tier order. Before acceptance, its placement must follow all its actual suppliers, including these extensions; placing it immediately after heights alone does not suffice. No upward citation or `FoundationsAndLibraryIntegration`/`UPSTREAM:` placeholder was introduced to bypass that ordering.

## Fidelity, form and definitions

All 56 numbered targets of the input are retained in nine layers. The opening summary, ownership boundaries, conventions, supplier contracts, ordered prose targets, worked examples and per-layer dependencies follow the current upstream form. I read current `ClassFieldTheory` and `ModularCurves` as models. The README remains below the issue's 200 KB ceiling and carries no job/review/checkpoint narrative. The source text has been restated mathematically rather than excerpted or summarised section by section. Metadata is exactly `topic = "math.NT"`.

I checked the definition/construction subsections for named API and at least three discriminating prose Checks: the index; full order/character/image ideal; cusp class and integral closure; Shimura subgroup; component retraction; ideal torsion; local completions; connected ideal-supported quotients; good auxiliary primes; winding element; quadratic modular unit; dyadic group/embeddings; normalized winding map; diamond-integer action; and finite-flat π-kernel. The explicit level-13 curve and cyclotomic certificates also have computed checks. The global admissible supplier contract has API and geometric-fibre checks but still requires C2's owning targets. None of these tests substitutes its desired conclusion as an assumption.

## Current-upstream and pinned-library audit

The current read-only roadmaps were checked at `0d144d044dacebca17b654695b6f1ad58f159b27`, and the current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The reviewed library-coverage data has no entry for this new roadmap. Searches covered mathematical objects and hypotheses, not just proposed declaration names: full versus cuspidal Hecke orders, component retractions, Shimura kernels, finite-flat models, winding and integral conjugation lattices, connected abelian quotients, toric uniformization and cyclotomic ideal classes.

The audit included the nine roadmaps newer than the atlas snapshot—AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry—and Completed, including ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts. The generic profinite/local-Galois and lattice objects there do not supply the Eisenstein-specific targets. `IntegralHeckeAndGaloisDeterminants`' operator images and determinants do not include the prime-level order, exact index or winding theorem. Current `ModularCurves` explicitly leaves Eisenstein arithmetic and the integral bad-fibre extension outside its interface. No further duplicated target needed removal; the package's existing boundaries already import the generic objects.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, I read the statements of:

- `WeierstrassCurve.Affine.Point` and `WeierstrassCurve.IsElliptic` (actual nonsingular point group and unit discriminant), `orderOf`/`addOrderOf` and `orderOf_ofAdd_eq_addOrderOf` (identity order 1, infinite order 0).
- `Nat.forall_exists_prime_gt_and_modEq` (nonzero modulus and coprime residue), `LeftCosetModule.deg` (degree +1 on an invertible single coset), and `TauCeti.AlgebraicGeometry.AbelianVariety` (the genuine group-scheme carrier).
- `NumberField.exists_ideal_in_class_of_norm_le`, `RingOfIntegers.isPrincipalIdealRing_of_isPrincipal_of_norm_le_of_isPrime`, and `IsCyclotomicExtension.Rat.discr_prime`, `isIntegralClosure_adjoin_singleton`, `integralPowerBasis`.

The generic quotient has an existing supplier: heights §1.0, using abelian schemes §§A3.3 and A6.3–A6.5. Heights §§1.15a–1.16 also supply the local formal inverse at 13. Néron §§3.13–3.14 supply all-n generic Raynaud torsion, including n divisible by the residue characteristic; §3.5 alone would not. These three suspected gaps are discharged by existing targets. The generic Hecke degree is not substituted for the Fricke character. The fixed cyclotomic class-number certificate is not already supplied by the library's fifth-cyclotomic calculation.

## Direct source audit

The random sample is reproducible: Python's `random.Random('codex-tGg63C').sample` on the ordered list of 56 numbered subsections, sample size 15. Each entry below was read in the primary source. Printed page numbers, rather than PDF indices, are used. Public sources: [Mazur 1977](https://www.numdam.org/item/PMIHES_1977__47__33_0.pdf), [Mazur 1978](https://www.math.columbia.edu/~goldfeld/Mazur-Goldfeld1978.pdf), [Mazur–Tate 1973](https://gdz.sub.uni-goettingen.de/download/PPN356556735_0022/PPN356556735_0022___LOG_0008.pdf), and [Mazur–Wiles 1984](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0076/LOG_0020.pdf). The latter two scans were read as rendered pages.

| Sample | Locator read | Finding |
| --- | --- | --- |
| 0.1 | Mazur 1977 Introduction p. 35; II §11 pp. 98–99 | Positive numerator and small-level cases agree. |
| 1.1 | II §11 pp. 98–99 | Cusp difference and annihilation agree with the chosen sign. |
| 1.4 | II Proposition 11.1/11.3–11.4 pp. 98–99; §12 pp. 103–104; Appendix A.1 p. 173 and component presentation pp. 174–180 | Exact order and integral/bad-fibre assertions supported; dyadic constancy is not assumed. |
| 2.2 | II §7 pp. 90–92, §9 pp. 94–96, §10 pp. 97–98 | Completed factors and residue primes match; no Eisenstein prime at the level. |
| 2.4 | II §10 pp. 97–98; III Lemma 3.4 pp. 150–151 | Connected support quotient and rational exactness are distinguished from ideal torsion. |
| 3.3 | II §16 definition/Proposition 16.1 pp. 124–125 | The exceptional l=ℓ=2 test is fourth powers. |
| 3.4 | II §15 pp. 120–124, §16 pp. 124–128; Mazur–Wiles §8.I.1 p. 187 | Ordinary Weil duality repair is included; structural conclusions are odd-primary. |
| 4.7 | II Lemma 18.7, Propositions 18.8–18.9, Theorem 18.10 pp. 137–139 | Factor-two normalization and dyadic sign ambiguity retained. |
| 7.7 | I Proposition 2.8 and Corollaries 2.9–2.10 pp. 52–54; III §5 p. 158 | Inverse-character vanishing is sourced, but its general supplier target is missing (C4). |
| 7.8 | III §5 pp. 157–160 | Isogeny iteration preserves the constant point; the local Tate parameter distinguishes the resulting modular points despite twists. |
| 7.9 | Mazur 1978 §1(c) p. 135; §2(d–e) pp. 140–141; Proposition 3.1 pp. 142–143; Corollaries 4.3–4.4 pp. 144–146 | General level and bad fibres supported; repaired the specialization dependency rather than adding good reduction. |
| 8.1 | Mazur–Tate §3 pp. 43–44; Sutherland level-13 row; Bruin–Derickx–Stoll §3 p. 3 | Model, cusps and good reduction supported. Independent divisor/count computations support the certificate; no rank-zero assertion is used in proving the cusp intersection. |
| 8.2 | Mazur–Tate §2 pp. 41–43 and §3 pp. 44–45 | Order-six diamond action and conjugate norm-19 factors agree. |
| 8.8 | Mazur 1977 Corollary 5.2 and reductions pp. 156–160; Mazur–Tate p. 41 | The two exclusions plus occurrence cover every prime. |
| 8.9 | Mazur 1977 II Proposition 14.1 pp. 113–115 and III §5 pp. 156–160; Mazur 1978 Corollary 4.4 p. 145 | Fixed-vector conclusion is supported; reducibility/isogeny exclusion would be stronger and is not asserted. |

I also checked every source-sensitive item highlighted in the input handoff and the supplier contracts, beyond that sample:

- Mazur I §§1–2 pp. 43–54 for admissibility, geometric-fibre lengths and the cohomology/class-group statements; II §5 pp. 83–87 for the integral congruence obstruction and all-positive-m cusp criterion; II §9 pp. 94–96 for the integral Hecke/cohomology lattice.
- II §§11–12 pp. 98–108 for the scheme intersection and quadratic-unit order; II §14 pp. 113–115 for residual constituents; II §§16–18 pp. 124–139 for odd/dyadic multiplicity and winding. Mazur–Wiles §8.I.1–3 pp. 187–188 supplies the ordinary-duality proof, replacement Siegel-product identity and corrected marked-generator/diamond Hecke term. These corrections are already respected. The exact-order statement for the quadratic unit is Proposition 12.2; the restricted dyadic argument on p. 107 should not be mistaken for an independent proof of its whole minimality assertion.
- Mazur III §3 pp. 148–151 and §5 pp. 156–160 for the Néron/Sha comparison, component escape, inverse conjugation character, local unramifiedness and isogeny contradiction. The cusp-label discrepancy with II §1 p. 64 is handled consistently by the fixed forgetful map and the Tate subgroup, rather than copying opposite names.
- The cleared Deligne–Rapoport volume, VI §5 pp. 282–283 and VII §§1–2 pp. 296–302, for cusp descent and integral Tate boundary charts; the cleared Faltings–Chai volume, III Theorem 7.1 and Corollaries 7.2–7.4 pp. 76–77, and §8 pp. 77–78, for the all-n Raynaud generic torsion sequence. Both were read in place; no restricted files or passages are included in this submission.
- Mazur–Tate §§3–4 pp. 43–48 for the norm-19 sequence, local/global Kummer diagram and cyclotomic descent; the finite-flat sequence's exact p. 47 locator is fixed. The [Sutherland model row](https://math.mit.edu/~drew/X1/X1opt13.txt) and [Bruin–Derickx–Stoll §3 p. 3](https://www.mathe2.uni-bayreuth.de/stoll/papers/cyc13-v6.pdf) were read directly. The latter's rank-zero result is not used circularly to verify the package's rank-zero descent.

No essential sampled assertion was left unsourced. C1–C4 are missing planning interfaces despite readable mathematical sources, not unavailable-source gaps.

## Adversarial pass

Each row includes the subsection's defining equations and API as well as its main statement. Computational results below were independently recomputed with exact integer/rational arithmetic. They are checks of the plan, not claimed Lean proofs. Heavy-carrier examples remain in the README; no artificial carrier was added merely to encode them in Lean.

| Statement | Instances or attempted failure | Assessment and change |
| --- | --- | --- |
| Conventions and supplier contracts | Zero Jacobian; ℓ=P; ℓ=2; a field versus mixed-characteristic DVR; equality e=ℓ−1; residue cardinality 1 | Standing prime and characteristic-zero assumptions exclude the invalid instances; integral and generic groups remain distinct. Made commutativity and ℓ-power annihilation explicit. C1–C4 remain. |
| 0.1 index | P=2,3,5,7,13 → 1; P=11 → 5; P=17 → 4; nonprime P=1 → 0 | Positivity and index-one classification retain primeness. Lean examples exercise the real formula. |
| 0.2 full order and character | Cuspidal algebra zero; scalar identity; w and U_P; scalar 5 at level 11 | Product order handles genus zero. Character sends w to −1 and U_P to +1; abstract Hecke degree alone would give the wrong sign. Image ideal and character kernel have different domains. |
| 0.3 integral congruence | m=1,4,5,25 and P; P=13,17; residue 2 and 3 | Cusp condition ranges over every positive m; the holomorphic-away-from-P test requires coprimality. The dyadic numerator is not discarded. C1 affects the lattice input. |
| 0.4 duality/index | Genus zero, rank one, n=1, a nonlocal Hecke order | Invertible module is not a chosen globally free module. ℤ/n handles the zero quotient; integral comparison still needs C1. |
| 1.1 cusp class | Swap 0/∞; levels 11/13 | Sign changes under w; class zero exactly at the genus-zero levels. Flatness is not built into the generic definition. |
| 1.2 cusp Hecke action | T₂ at P=11; w; l=P | Values are 3c and −c; U_P is treated separately. Annihilator n is the positive integer from Layer 0. |
| 1.3 components | P=2,3,11,17; elliptic fixed points j=0,1728 | Correct values 0,0,5,4; weighted resolution and Frobenius descent are needed, not an unweighted graph count. |
| 1.4 exact order/model | n=1,5,4; fibres at 2 and P | Odd model is constant; even model contains μ₂ and need not be constant. The P-fibre splits by c. C2 supplies the general integral machinery. |
| 1.5 Shimura subgroup | Trivial deck group; cyclic order 5; base change at P | Canonical object is Uᴰ. Identifying it with μ_n requires a generator, and does not identify it with constant ℤ/n over ℚ. |
| 1.6 intersection | Odd n=5; even n=4 or 10 | Odd intersection zero, even intersection μ₂. At P, n∣P−1 permits the stated component isomorphism. No dyadic direct sum follows. |
| 1.7 component retraction | Identity section; c; zero Jacobian | Retraction sends c to its component coordinate and vanishes on the identity subgroup; inverse is addition. Rational rather than arbitrary geometric components are used. |
| 2.1 ideal kernels | Unit ideal; (m); inclusion a⊂b; bad fibre | Kernel inclusion reverses. Nonzero integer in the ideal ensures generic finiteness; schematic closure is not replaced by the possibly nonflat full special-fibre kernel. |
| 2.2 completions | n=1,5,10; candidate coefficient ℓ=P | Exactly primes dividing n contribute, never P. Zero and product cases fit the completion definition. |
| 2.3 quotient | a=0 or T; scalar 5 at level 11 | γ_a is the completion kernel, and the sum of endomorphism images is connected. J/IJ would be zero and is not the Eisenstein quotient. Existing heights/abelian-scheme targets supply the general quotient. |
| 2.4 support | No support; two residual primes on different characteristic-zero components | Retains the union of meeting components, not one chosen local factor. Good reduction is asserted away from P only. |
| 3.1 constituents | ℓ≠P and ℓ=P; rank-one character; nonsplit torus | Level-primary case uses all-n Raynaud uniformization, not the prime-to-residue filtration. Unramified period/character lattices give inertia constituents 1 and χ_P. |
| 3.2 étale multiplicity | Rank-one étale piece versus full rank-two Tate module; ℓ=2 | The statement concerns the dual étale constituent. Odd constant cuspidal line cannot be used to bypass dyadic saturation. |
| 3.3 good primes | (P,ℓ,l)=(11,5,2),(11,5,31),(17,2,2) | First and third pass, second fails. Fourth powers at 17 are {1,4,13,16}; replacing the exceptional test by nonsquares fails. |
| 3.4 existence/principality | Nonempty coprime residue classes; odd ℓ versus 2 | Dirichlet applies with nonzero modulus and coprimality. Structural consequences here remain odd-primary, with the corrected ordinary duality input. C2 is still needed. |
| 3.5 odd kernel | ℓ=5 at level 11; ℓ=2 at level 17 | Two disjoint rank-one lines exhaust the odd kernel. No extension of that direct sum to the dyadic case is claimed. |
| 4.1 winding element | Path from ∞ to 0; reversed path; n=5 | Boundary is c and changes sign on reversal. A rational winding element need not itself be integral, while n times it is. |
| 4.2 quadratic unit | P=17,41,73 | Exact Bernoulli sums 8,32,88 give proposed orders 2,8,22. Deck involution sends f to −1/f. Uses corrected Siegel-product argument, not the invalid original A+B inference. |
| 4.3 exceptional D | P=17 versus 41; generic conjugation at 2 | Rank-four group is killed by 2 and splits over ℚ(i); it is not cyclic order 4 or the sum of the already intersecting cusp/Shimura lines. Global construction remains C2. |
| 4.4 D intersection | J⁺ and D; ramified quadratic cover; coefficient 2 | Scheme intersection is zero by ramified-cover geometry; dividing by 2 on the lattice would be invalid. |
| 4.5 dyadic multiplicity | Level 17; n=1; plus quotient | D supplies the missing dyadic directions. Completed Tate rank is two; minus-factor containment is a separate assertion, including its zero case. |
| 4.6 integral conjugation module | Coefficients ℤ₂ and odd ℤ_ℓ; rank zero | Two-element group-ring basis works at 2. Eigenspace splitting over ℤ₂ is not assumed. |
| 4.7 normalized winding | Basis e,σe; map e+σe ↦ 2[e]; change chosen dyadic root | Natural map is ×2; the normalized map is integral via freeness. Dyadic choice permits a sign, not arbitrary inversion of 2. |
| 4.8 winding isomorphism | η_l; good and bad l; odd and dyadic coefficient | Domain is the ideal, target the plus homology lattice. Generator equivalence uses the stated good-prime condition in its correct branch. |
| 5.1 quotient torsion | Zero quotient; arbitrary quotient not Hecke-equivariant; geometric lift | All torsion primes divide n; I-primary conclusion is reserved for Hecke-equivariant quotients. A rational lift is not silently assumed. |
| 5.2 Ogg torsion | Genus zero; P=11; positive-rank J | J(ℚ)_tors=C includes all primary parts; it does not claim J(ℚ)=C before taking the Eisenstein quotient. |
| 5.3 maximal μ-type | Constant Cartier dual versus a nonsplit torus character | μ-type is the stronger condition in the convention. The maximality statement does not encompass all groups merely of multiplicative type. |
| 5.4 quotient torsion | Plus and minus factors; n even | C maps isomorphically to the stated torsion groups; plus rational torsion is zero. Retains the dyadic proof rather than deducing it from odd primes. |
| 6.1 bounded cohomology | Zero group; geometric versus rational residue points; increasing m | Lengths are zero in the trivial case; δ and α have the same linear term m·d with bounded errors. Counting rational points would fail under an unramified twist. C2 remains essential. |
| 6.2 MW/Sha finiteness | Component defects; residue 2; finite H⁰ versus its limit | Bound on the cohomology tower is not itself an arbitrary Néron exactness theorem. The needed connected-model comparison is C3. |
| 6.3 rank-zero quotient | Tensoring rational points with ℚ; annihilator supported off Eisenstein components | Exactness is after rationalization/up to isogeny; no surjectivity on integral rational-point groups is inferred. General quotient exists in the supplier. |
| 6.4 rational points | P=13 → 0; P=17 → ℤ/4 | Full quotient group equals the cuspidal image. Zero genus is retained rather than excluded. |
| 6.5 Sha | Odd primary part versus 2-primary part | Odd part vanishes; dyadic statement is finiteness, not unproved vanishing. Uses the weaker comparison in C3. |
| 6.6 modular-point finiteness | Positive genus versus P=13; zero quotient | Nonconstant Abel–Jacobi projection and nonzero quotient are required. Finite rational points of the quotient then give finite curve fibres. |
| 7.1 boundary moduli | Width-one ∞ versus width-P 0; DVR residue q≠P | Identity μ_P direction is ∞ for the chosen forgetful map; opposite cusp labels would reverse the descent. |
| 7.2 Tate quotient | Identity μ_P versus component subgroup | Parameters go to q^P versus a P-th root, multiplying versus dividing the j-pole valuation. No sign-free interchange of cusps is used. |
| 7.3 semistability | P=11; additive ramification e≤6; P=13 | Inequality 6<P−1 is adequate for large-prime argument; level 13 is reserved for the separate branch. |
| 7.4 small reductions | Residue 2,3; identity component; P-fibre of the level structure | Hasse/additive bounds exclude staying in the small identity group; constant section retains its P-component information. |
| 7.5 component escape | Odd good prime; multiplicative fibre; n=1 | Good-reduction torsion injection is used only at good odd primes. Cusp image is nonzero in positive genus; genus-zero levels are not forced into the argument. |
| 7.6 division field | Upper triangular matrix with diagonal 1,χ_P; multiplicative and good P-adic places | Conjugation on Hom(μ_P,ℤ/P) is χ_P⁻¹. Extension has degree at most P and is unramified; K is totally imaginary. |
| 7.7 class-group obstruction | Inverse eigenspace versus whole class group; B₂=1/6 | Numerator 1 kills only the required eigenspace. Does not assert every P regular. Source valid, supplier target missing (C4). |
| 7.8 isogeny iteration | μ_P quotient; quadratic twists; nonsplit multiplicative components | Rational component of odd P-order forces split multiplicative reduction at 3. Pole valuation grows by P at every step, giving distinct modular points even when twists share j-values. |
| 7.9 formal immersion | N squarefree/composite; p∥N; q=2; e=q−1; bad Tate reduction; zero-dimensional kernel | Preserves arbitrary-level theorem and squarefree corollary. Replaced good-reduction specialization by the already supplied torsion-free formal kernel. C1 and C3 still supply the cotangent argument. |
| 8.1 level-13 curve/cusps | Six rational cusps; degree-two pencil; fields 2,4,3,9; singular-reduction candidates | Determinant of five divisor relations is 19. Curve counts are 6,6,6,8 and both Jacobian orders 19. Degree-two cusp sums cover all 19 residues with only the canonical class repeated; geometric intersection follows without rank zero. Sextic discriminant is −2¹²·13²; characteristic-2 and infinity charts are separately smooth. |
| 8.2 diamond integers | γ²−γ+1; (3+2γ)(5−2γ)=19; conjugate factors | Order is six, not three. Each kernel factor has geometric 19-dimension two. π labels are fixed by which factor kills rational cusp torsion. |
| 8.3 finite-flat kernel | Generic versus integral sequence; local invariants at 13; rank | Kernel scheme has rank 19² although it has no nonzero ℚ₁₃-point. Isotropic conjugate factors yield the μ₁₉ quotient. Corrected source to §4 Lemma p. 47. |
| 8.4 local surjectivity | Formal pro-13 subgroup and finite quotient; arbitrary injective endomorphism | πbar/19 is a formal inverse. Formal surjectivity plus zero full kernel makes the induced finite-quotient map injective; finiteness then gives surjectivity. Infinite-group injectivity alone would fail. |
| 8.5 cohomology/class number | Degree-12 descent; primes 3,13; local units; all small ideal norms | Exact norm determinants are 13,27,53,79,131,157; Minkowski upper bound <307 and prime enumeration are exhaustive. Conjugates cover all primes. Local valuation detects the global Kummer generator 13. Local H⁰(μ₁₉)=0 justifies the diagram injection. |
| 8.6 rank zero | Positive O-rank versus finite O-module; π-surjective module | Nonunit π cannot surject on a positive-rank finitely generated module. The independently established torsion/intersection certificate leaves exactly six cusps. |
| 8.7 occurrence | Each intermediate multiple of (0,0) on four models | Exact orders 2,3,5,7; discriminants 64,−27,−11,−1664. Native generalized Weierstrass addition verifies every nonzero preceding multiple. |
| 8.8 all prime orders | P=2,3,5,7,11,13,17; identity; infinite order; singular model | Case split exhaustive. Native identity order 1 and infinite order 0 cannot be prime. Ellipticity is explicit in the Lean theorem. |
| 8.9 consumer representation | Fixed vector versus nontrivial-character stable line; rational 11-isogeny | Fixed-vector exclusion follows. Stable line can remain, so no residual irreducibility theorem is smuggled in. |

The exact scratch calculations used finite-field pair enumeration; a fraction-free integer determinant for the relation lattice, resultant and cyclotomic multiplication matrices; rational quadratic-character Bernoulli sums; exhaustive small-prime/order enumeration; rational comparison with the displayed Minkowski bound; and the generalized Weierstrass addition law. The field-enumeration order differs from the README's lexicographic order, but reindexing gives its displayed solution vectors. All asserted values passed. The complete input certificates remain in the README, so no scratch program is needed to resume.

## Lean signature and validation results

`Suggested.lean` has 102 lines, one real-bodied definition, two proved examples and nine theorem targets. All ten named declarations were compared, rather than claiming a sample of ten theorems when only nine exist:

| Declaration | Statement comparison |
| --- | --- |
| `cuspidalIndex` | Natural-number quotient by gcd; prime hypotheses belong to its API theorems. |
| `cuspidalIndex_pos` | P prime; positive value. |
| `cuspidalIndex_num` | P prime; rational numerator uses absolute integer numerator. |
| `cuspidalIndex_dvd` | P prime; exact gcd factorization and divisibility. |
| `cuspidalIndex_eq_one` | P prime; exactly five small levels. |
| `isogeny_iteration` | P prime, five exclusions, rational Weierstrass model, ellipticity and actual nonsingular point. |
| `cyclotomic13_classNumber_one` | Native `CyclotomicField 13 ℚ` and `NumberField.classNumber`, full class number one. |
| `order_thirteen_exclusion` | Rational elliptic model, native point, exact additive-order exclusion. |
| `occurring_small_primes` | Existential elliptic model and native point for each of 2,3,5,7; ellipticity included in the existential. |
| `all_prime_torsion` | Prime-order hypothesis on an elliptic rational model implies precisely the four allowed primes. |

The closing comment retains the README's heavy constructions. There are no admitted examples, sorry-bodied data definitions, synthetic `Prop` carriers, weakened geometric substitutes or unrelated numerical examples. `import Mathlib` and the namespace/docstring/layer order conform to the current compact-file rule.

- `lean-check` on the package's absolute `Suggested.lean` path: **exit 0; nine warnings, all `declaration uses sorry`; no errors or other warnings**. Only that wrapper was used, after checking memory. No Lean change followed this successful independent compilation.
- `python3 scripts/check_blueprint.py research/blueprint/packets/EisensteinIdealAndRationalTorsion.json`: **zero errors and warnings**. The unchanged input's nine layers are planned, none closed; that structural result does not discharge C1–C4.
- `python3 research/blueprint/intake.py check-files` on the changed deliverables: **zero problems**.
- `git diff --check`: **passed**. No restricted passage or private filesystem path is committed.

Acceptance requires C1–C4's actual supplier targets and a consistent ordering/reference update, followed by a closure recheck. Repeating Lean elaboration alone would not resolve those defects.
