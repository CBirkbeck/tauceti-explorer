# Independent review: Euler systems and Kolyvagin systems, ES.0–ES.7

Reviewer: Codex, session `codex-gzS1x9`. Job `REV-EulerSystemsAndKolyvaginSystems--ES.0`; Refs #400. Date: 2026-10-06.
Original author: Claude Opus 5.5, session `claude-NX8bF9` (planning issue #723). This reviewer did none of that planning.

**Verdict: needs_changes. The independent review is finished.** Clear errors are corrected in the [packet](../packets/EulerSystemsAndKolyvaginSystems--ES.0.json) and [suggested file](../suggested/EulerSystemsAndKolyvaginSystems--ES.0.lean). The plan still lacks the arithmetic signatures required by PROTOCOL §13, has unfulfilled supplier contracts at broader coefficient generality, and repeats general exterior-bidual algebra owned by L6. A compilable algebraic seed does not resolve those problems. This is a completed review submission, not a checkpoint of an unfinished review.

## Counts and inspection scope

| Item | Reviewed result |
| --- | --- |
| Nodes | 84, unchanged: 30 definitions, 10 constructions, 31 theorems, 7 lemmas, 5 applications, 1 comparison |
| Per-node verdicts | 45 verified, 28 corrected, 11 unverifiable; no added nodes |
| API / unit tests | 250 / 158 (was 250 / 153); all 40 definitions/constructions have at least three tests |
| Planets | 35, unchanged; 6/3/3/5/5/5/4/4 in ES.0–ES.7, with source-derived names and no stage above six |
| Baseline declarations | All 19 confirmed: 13 Mathlib, 6 Tau Ceti; none removed or replaced |
| Source excerpts | All 175 found in the independently downloaded primary PDFs; printed page locators additionally checked |
| Requests / gaps | 6 / 11 (was 5 / 4) |
| Coverage | ES.1/2/3/5 planned; ES.0/4/6/7 partial; none closed |
| Packet status | `partial` (was `complete`); 84 nodes is below the 300-node budget and four stages have open target/interface work |
| Source findings | E1 confirmed; E2/E3 added and confirmed, scoped to the versions actually inspected |

I read the binding protocols, UPSTREAM_GUIDE, the ClassFieldTheory and ProfiniteCohomology upstream documents, the campaign targets, the author's reader document, the applicable accepted RS-04 material and confirmed red-team findings. I inspected every node's statement, hypotheses, proof outline, API, tests, acceptance and prerequisites, and the cited source passages in context. The audit is at **target level**: routine arguments and cited source proofs are not expanded into new lemma nodes. Excerpt matching is a locator aid, not a proof check. The report does not certify every interior step of the unexpanded BSS §5.4/§6.5 arguments, nor a future Lean implementation.

## Mathematical corrections

The following corrections have explicit witnesses rather than just changed wording.

- The DVR Cartier dual is discrete torsion, so `SelmerTriple.dual` cannot return another finite-free lattice triple. The finite principal-artinian case and its coefficient-duality identification are distinguished.
- MR 2016 Definition 3.4 uses a signed core rank; MR 2004 uses its nonnegative positive part. The Selmer/free-factor isomorphism now assumes signed rank r≥0, not the tautology χ≥0. The elliptic tests retain their p≥5/surjective-residual hypotheses.
- A finite-order unramified twist with ρ(p)=1 has divisible local Cartier-dual invariants, so its propagated canonical condition on T/pᵏT is the whole local H¹. The original counterexample was false. A genuine local counterexample uses ψ(Fr_p)=1+p, where H⁰(T*)≅Z/p and H²(T)[p]≠0. Lattice relaxation and finite-level propagation are separated in the elliptic example too.
- Rubin's τ fixes the maximal p-Hilbert class extension, not automatically the full Hilbert class field or MR 2016's extra field L. Irreducibility does not imply absolute irreducibility. The implication and test now name the additional assumptions.
- Chebotarev does not make an arbitrary chosen prime set P infinite. The unrestricted Frobenius set and the (H.5)/(H.7) containment needed for a restricted set are separated.
- The finite–singular comparison is natural under compatible quotient-polynomial maps, especially reductions of one lattice. It is not natural under arbitrary equivariant maps: over F₅ the fixed rank-one line has Q(1)=4 while its inclusion into Fr=diag(1,2) has Q(1)=1. The quotient test now uses Z/p²→Z/p rather than an identity square.
- Twists need not compose strictly when character conductors cancel. With compatible generators, twisting by χ then χ⁻¹ gives Cor_(FLχ/F)(c_FLχ), hence the applicable Euler-factor product times c_F. It is not automatically c_F. The conductor non-example also excludes a false assertion about the zero system.
- Rubin's rigidity example needs the maximal abelian extension **unramified at the primes dividing N**. With the printed outside-N restriction, its tower contains a cyclotomic Z_p-extension and the isolated arbitrary initial class fails the norm relation. Source finding E2 records both publicly inspected author copies.
- For a locally cyclic graph sheaf with a hub, sections embed into its cyclic hub stalk. This need not be an ideal of a general R: a single Z_p/p stalk over Z_p is a counterexample. Free rank-one hub stalks and principal-artinian rings restore the ideal conclusion (E3).
- The zero-class divisibility bound uses a supremum allowing infinity. The artinian invariant k−length(Rκ_n) is k for zero, whereas the DVR invariant is infinity. Scaling truncates at k at finite level; the elementary-divisor scaling assertion requires the rank-one admissibility hypotheses. A nonzero system with zero initial class and the zero system are distinguished in the sharpness example.
- The finite-level abundant-localization argument uses a lifted Smith-normal-form matrix when the exponent c<n. If c≥n, the prescribed target is zero; set the auxiliary matrix to zero. An inverse of a possibly noninvertible finite-ring matrix is not a proof. Both adjugate identities AC=CA=λᶜI are retained for the image/spanning argument.
- Howard's ideal convention is I_ℓ⊆pᵏR; the displayed pᵏZ_p notation is read by extension of scalars, not as an inclusion of an R-ideal into Z_p.
- Bidual reflexivity uses noetherian/finitely generated hypotheses. Rank-reduction/kernel formulas use positive r when degree r−1 occurs; contraction from r+s to r allows every r≥0, rather than an unnecessary r≥s condition.
- The inverse-limit Stark/regulator theorem retains the core-vertex condition 4.2 at **every modulus**, in addition to 4.7. The former stub test compared KS₁ at χ>1 with KS′_χ, which are different exterior ranks; it cannot prove a strict submodule inclusion. The corrected comparison is honest, and the missing same-rank witness is a gap.
- The minus-part Rubin-lattice witness uses the sign action of C₂ on Z². A trivial C₂ action has zero minus part. Since (1−σ)²=2(1−σ), determinant integrality admits the half-lattice. This is an algebraic witness, not a claim about a named arithmetic unit group or strictness for every arithmetic lattice.
- Rank-one comparison of the higher Euler-system module needs a common admissible tower (6.7) and the universal-norm/unramified dictionary, not just the degree-one bidual/reflexivity identity.
- The higher derivative first reduces **uninduced** B=T/MT over the full group ring R̄[Gal(E(n)/K)]. Only invariant descent and Shapiro move to the induced A over K. No product splitting of that Galois group is assumed. The §6.4 determinant correction is now explicit: Δ₁=1, Δ_q=0, zero diagonal and off-diagonal P_(q_j)^(q_i); κ(c)_n=Σ_(d|n)(κ′(c_d)⊗Π_(q|d)(σ_q−1))Δ_(n/d). The two-prime test has the negative cross-term. Failure of 6.11 prevents invoking the local-relation theorem; it does not make the determinant expression undefined.
- The zeroth Fitting equality for a basis does not require a principal ideal ring. The higher component-ideal equality keeps the source's principal-ring assumption.

Five discriminating tests were added: `canonicalStructure_quotient_finite_order_trivial_local`, `finiteSingular_not_natural_inclusion`, `EulerSystem.twist_inverse_norm`, `sections_cyclic_not_ideal_dvr`, and `TauCeti.EulerSystems.higherDerivative_two_primes`. Existing incorrect or vacuous tests were corrected rather than multiplied.

## Complete in-place change ledger

The table records all node-level statement/API/test/hypothesis/locator edits. Request, coverage, gap, version and review metadata changes are described separately below. No mathematical nodes were split or added.

| Node | Changed fields | Reason |
| --- | --- | --- |
| `ES.0/selmer-triple` | api | The DVR Cartier dual is not a lattice. |
| `ES.0/core-rank` | acceptance, api, statement, tests | Distinguish the signed 2016 convention from the positive-part 2004 convention. The condition χ ≥ 0 was tautological and did not exclude negative signed core rank. Carry the admissibility hypotheses of the elliptic example into its tests. Carry the elliptic example hypotheses. |
| `ES.0/canonical-selmer-structure` | tests | The finite-order example in the original test has divisible dual invariants and gives equality. Add the positive test that disproves the original counterexample. Relaxing on the lattice and then propagating need not relax the finite quotient. |
| `ES.0/hypotheses-implications` | acceptance, proofSteps, statement | Rubin fixes the p-Hilbert class field and assumes irreducibility, not the stronger 2016 hypotheses. Do not infer the stronger full-Hilbert-field condition. The original acceptance conflated one hypothesis with every implication. |
| `ES.0/example-cyclotomic-twist` | acceptance | Use the lattice dual invariants before reduction. |
| `ES.0/example-elliptic` | statement | Separate the lattice and finite-level canonical conditions. |
| `ES.1/kolyvagin-primes` | api, proofSteps | Chebotarev needs a nonempty allowed Frobenius subset, not an arbitrary prime set. Respect the distinction between unrestricted and chosen prime sets. |
| `ES.1/finite-singular-decomposition` | prerequisites | Separate local reciprocity from its duality supplier. |
| `ES.1/finite-singular-comparison` | api, tests | Functoriality fails when the characteristic polynomial changes. Add a counterexample to the overbroad functoriality claim. Replace the identity square by a genuine coefficient-reduction square. |
| `ES.1/transverse-duality` | prerequisites | Separate local reciprocity from its duality supplier. |
| `ES.1/reducibility-depth` | sources | Correct source page locators against the printed page headers. |
| `ES.1/selmer-field-saturation` | sources | Correct source page locators against the printed page headers. |
| `ES.1/abundant-tuples` | sources | Correct source page locators against the printed page headers. |
| `ES.2/twisting` | acceptance, tests | Twisting composition can introduce Euler factors when character conductors cancel. The universal non-example was false for the zero Euler system. State the exact cancellation computation. |
| `ES.2/rigidity-variants` | statement, tests | Correct the reversed ramification condition in the isolated-class example (source issue E2). |
| `ES.4/sheaf-monodromy` | acceptance, statement, tests | Correct the general-ring ideal claim (source issue E3). Make the hub hypothesis explicit in the primitive-section consequence. Add a discriminating test for the ring restriction. |
| `ES.4/stub-sheaf` | sources | Correct source page locators against the printed page headers. |
| `ES.4/kolyvagin-bound` | acceptance, statement | Use the untruncated supremum for a vacuous zero-class bound, not a nonexistent maximum. Qualify scaling for the DVR case. |
| `ES.4/rubin-bound` | sources | Correct source page locators against the printed page headers. |
| `ES.4/abundant-localization` | proofSteps, sources, statement | Both scaled-inverse identities are needed for the spanning assertion. Make the finite-ring scaled-inverse argument sound. Correct source page locators against the printed page headers. |
| `ES.5/divisibility-invariants` | acceptance, api, hypotheses, statement, tests | The artinian invariant is truncated at the ring length. Do not apply the structure theorem to arbitrary systems. Scaling in an artinian ring saturates at k. Replace the artinian threshold ∞ by k. Respect the two zero conventions. Add a boundary case detecting truncation. Avoid asserting nonvanishing after every artinian scaling. Keep finite-length and DVR invariants separate. |
| `ES.5/sharpness-examples` | sources, statement | The zero system alone cannot imply an infinite dual Selmer group. Explicitly cover the zero system. Correct source page locators against the printed page headers. |
| `ES.5/howard-hypotheses` | statement | Extend the p-power scalar ideal to the coefficient ring R; the published notation uses ℤ_p. |
| `ES.6/exterior-bidual` | sources | Correct source page locators against the printed page headers. |
| `ES.6/bidual-functoriality` | hypotheses | Restore the standing noetherian convention and the range where contractions are defined. Remove the unnecessary r≥s condition: Proposition 2.3 allows every nonnegative r. |
| `ES.6/stark-structure` | hypotheses, statement | The order theorem assumes a finite-level core vertex at every level, not 4.7 alone. Restore the all-level hypothesis from the paragraph before Definition 4.11. |
| `ES.6/kolyvagin-systems-rank-r` | tests | The original test compared different exterior ranks to assert a submodule inclusion. |
| `ES.6/regulator-isomorphism` | statement | Restore the all-level hypothesis of §5.5. |
| `ES.6/rubin-lattice` | sources, tests | A trivial-action lattice has zero minus part and could not test the asserted minus lattice. Correct source page locators against the printed page headers. |
| `ES.7/higher-rank-euler-systems` | api, statement | The literal equality with the Rubin carrier also needs the admissible tower and ramification comparison. The reflexive degree-one bidual identity alone is insufficient for the whole module equality. |
| `ES.7/higher-kolyvagin-derivative` | statement, tests | Fix the coefficient module and ring before invariant descent. Supply the actual determinant formula, available before §6.5. The correction formula is defined independently of the local theorem’s injectivity hypothesis. Add a two-prime determinant test. |
| `ES.7/fitting-bounds` | statement | Retain the stronger source equality for the zeroth Fitting bound. |
| `ES.7/rubin-brumer-stark` | sources, tests | Correct source page locators against the printed page headers. Qualify strictness of the Rubin lattice rather than assert it for every rank≥2 arithmetic lattice. |
| `ES.7/rank-one-comparison` | hypotheses, statement | Carry the ramification comparison into the summary. Give each asserted comparison its own hypotheses. |

Supplier edits also replace the old ClassFieldTheory Layer 12 reference with the native Layer 13 reference throughout the affected prerequisites. Layer 7 supplies local reciprocity; a new Layer 5 request and direct prerequisites supply local duality for finite–singular decomposition/transverse annihilators. The general-R L2 and L6 bidual-transfer requests name their actual carriers, normalization and maps. `upstreamNotes` records the native-layer observation without editing upstream documents. The ES.6 sub-layer proposal imports general algebra from L6 and retains the arithmetic specialization.

## Baseline verification at the pins

Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.
All cited declaration bodies were read at those commits, including Tau Ceti bodies retrieved at the pin rather than inferred from a newer checkout. The accepted library audit's ES.0–ES.7 entries do not already provide the proposed arithmetic systems. Reusing a group ring, exterior power or Frobenius-prime-set carrier does not implement descent.

| Declaration | Confirmed scope / use |
| --- | --- |
| [`mathlib:Squarefree`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Squarefree/Basic.lean) | Squarefree elements of a monoid; used for the index set N(P) of squarefree products. |
| [`mathlib:Module.length`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Length.lean) | The length of a module as an element of ℕ∞. |
| [`mathlib:LinearMap.charpoly`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Charpoly/Basic.lean) | The characteristic polynomial of an endomorphism of a finite free module; the Euler polynomials are its reversals. |
| [`mathlib:LinearMap.aeval_self_charpoly`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Charpoly/Basic.lean) | Cayley–Hamilton: aeval f f.charpoly = 0. |
| [`mathlib:MonoidAlgebra`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MonoidAlgebra/Defs.lean) | The group ring k[G], in which N_Γ and D_σ live. |
| [`mathlib:Representation.norm`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Basic.lean) | For a representation ρ of a finite group, norm ρ = Σ_g ρ g. |
| [`mathlib:SimpleGraph`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Combinatorics/SimpleGraph/Basic.lean) | Simple graphs; the graph X(P) is one. |
| [`mathlib:exteriorPower.pairingDual`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Pairing.lean) | The linear map ⋀^n(Dual R M) → Dual R (⋀^n M), with pairingDual (ιMulti f) (ιMulti v) = det(f j (v i)). |
| [`mathlib:exteriorPower.bijective_pairingDual`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basis.lean) | pairingDual R M n is bijective for M finite free. |
| [`mathlib:exteriorPower.map`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean) | Functoriality of exterior powers. |
| [`mathlib:Module.Dual`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dual/Defs.lean) | The dual module M →ₗ[R] R. |
| [`mathlib:Module.IsReflexive`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dual/Defs.lean) | Reflexive modules: evaluation M → Dual (Dual M) is bijective. |
| [`mathlib:Module.Injective`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Injective.lean) | Injective modules; R self-injective is Module.Injective R R. |
| [`tauceti:TauCeti.ContCohomology.explicitCor1`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction.lean) | Corestriction H¹(U, M) → H¹(G, M) for a finite-index subgroup, on continuous cochains of discrete modules. |
| [`tauceti:TauCeti.ContCohomology.explicitCor1_comp_res1`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction.lean) | cor ∘ res = multiplication by the index on H¹. |
| [`tauceti:TauCeti.ContCohomology.DiscreteShortExact.explicitCor_delta0`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/DeltaNaturality.lean) | Corestriction commutes with the connecting map δ⁰ of a short exact sequence of discrete modules (Rubin, Proposition IV.4.5(iii)). |
| [`tauceti:NumberField.Chebotarev.frobeniusPrimeSet`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.lean) | The set of primes of K unramified in L whose Artin symbol is a given conjugacy class. |
| [`tauceti:NumberField.artinSymbol`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/ArtinSymbol.lean) | The Artin symbol (Frobenius conjugacy class) of an unramified prime in a finite Galois extension of number fields. |
| [`tauceti:TauCeti.GlobalNumberFields.RayClassGroup`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/Global/RayClass/Basic.lean) | The ray class group of a modulus: ideals prime to the modulus modulo the ray. |

No baseline citation was deleted. The continuous corestriction declarations supply the **discrete additive** theory at the stated scope, not automatically the R-linear compact-lattice maps indexed by extensions of number fields. Their field/subgroup, coefficient, linearity and compact/discrete transports are now an explicit adapter gap. Characteristic-polynomial and exterior-pairing comparisons retain finite-free/projective hypotheses. The public exterior-bidual definition/map prototype composes imported exteriorPower and Module.Dual APIs; it is not a second exterior-power carrier.

## Supplier and closure audit

The direct external node statements were read; the following grouping lists their exact IDs. L6 is a requested stage, not a claim that a packet already has the requested nodes.

| Supplier | Exact inspected nodes / scope |
| --- | --- |
| ArithmeticGaloisDuality R02.1 | `carrier-comparison`, `continuous-section-long-exact`: discrete/compact comparisons and LES with a continuous-section hypothesis |
| ArithmeticGaloisDuality R02.2 | `compact-five-term`: the stronger compact exact sequence retains finite-cohomology hypotheses |
| ArithmeticGaloisDuality R02.4/R02.5 | `unramified-exact-annihilators`, `greenberg-wiles-formula`: finite local prime-to-residue-characteristic duality and finite global length formula, with archimedean terms |
| SelmerIwasawaCohomology L1 | `lattice-pairing-compatibility`, `orthogonal-complement`: O-adic lattice/discrete coefficients |
| SelmerIwasawaCohomology L2 | `selmer-data`, `galois-selmer-group`, `selmer-kernel`, `condition-propagation`, `change-of-conditions`, `dual-selmer-structure`, `finite-condition-lattice-duality`, `lattice-passage`, `pontryagin-dual`, `selmer-limits`, `selmer-structure-poitou-tate`, `unramified-condition`, `unramified-dimension-count`: abstract local-condition data do not extend the actual O-adic duality theorems to all R; limits retain exactness/surjectivity conditions |
| SelmerIwasawaCohomology L3 | `semilocal-cohomology`, `universal-norms-unramified`: discrete/rational and unramified-tower comparisons with their ramification/decomposition hypotheses |
| PadicMeasuresIwasawaAlgebras L6 | Campaign Layer 6 and packet coverage/gap: owns coefficient-order/exact-dual/exterior-bidual integrality and base-change algebra; currently no proposed declarations close the new transfer request |
| Upstream ClassFieldTheory | Native Layer 13 for ray/Hilbert class fields, Layer 7 for normalized absolute Artin, Layer 5 for local duality; existing ray class groups alone do not supply class fields |

The eleven gaps retain the original MR/BSS Stark comparison, principal-artinian versus Gorenstein core-rank comparison, unexpanded BSS proof/version boundary, and exceptional-prime arithmetic ownership. Seven precise gaps were added: actual arithmetic Lean signatures/adapters; general-R Selmer duality; exterior-bidual ownership; bidual transfer/norm/invariant descent; weak-hypothesis Cassels pairing; same-rank stub non-example; and the conditional Rubin–Stark application/comparison.

The CGLS error route is particularly material: `howard-descent-with-errors` cannot cite the current `cassels-structure` as a sufficient prerequisite because that node assumes Howard's absolute residual irreducibility. CGLS Proposition 3.3.2 instead needs its weaker residual-invariant/cartesian/self-dual pairing statement. The new request names it, but a request alone does not erase the incompatible direct edge.

For higher descent, BSS Lemma 6.9 explicitly omits the non-routine bidual corestriction/group-norm comparison and points to [21, Remark 2.12]. Ordinary functoriality does not change the coefficient group ring. The new L6 contract names reduction map (9), corestriction/norm and invariant descent; until exact supplier nodes and comparisons are supplied, the derivative proof is not closed.

Partial coverage is retained precisely rather than made to look complete. ES.4's classical all-prime/error-uniformity targets and ES.7's conditional class-group application still need target statements. ES.0 needs the promised general-R arithmetic interfaces, and ES.6 needs owner reconciliation and the same-rank discriminating test. The four other stages have target-level nodes and honest refinement lists; this review does not require lemma-level source decomposition from them. Smoothing is the cyclotomic owner's arithmetic construction, not an invented generic operation.

## Versions, locators and source findings

The first eight PDFs below were independently downloaded and their SHA256 hashes match the original packet. The ninth is an additional, bounded book-format author-copy comparison. Hashes and exact URLs are also in `sourceVersions`.

| Source | Version actually inspected | SHA256 |
| --- | --- | --- |
| [mr-ks](https://web.archive.org/web/2020id_/https://www.math.uci.edu/~krubin/preprints/kolysys.pdf) | author copy | `4cc432d0d719a51c8dd1d2b27829014b9f090f7c53f179d6c628e6208c84e01f` |
| [rubin-es](https://swc-math.github.io/notes/files/99RubinES.pdf) | author copy | `de47655dc35066fd01f2e76a37076ad03dee62e816130586c7674e520be73d50` |
| [mr-higher](https://arxiv.org/pdf/1312.4052v1) | preprint | `15ec72e48fab1790e5b96e7172b4af88c974b0d487a515cdbd9dd0ced3ea4ee8` |
| [bss2](https://arxiv.org/pdf/1805.08448v1) | preprint | `2f6da843d3dcedde65a2b04b80c711863306f9fd9ab20580d245d2c4d2f06429` |
| [howard](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1BF8414258216C1575963BBDA814CB2F/S0010437X04000569a.pdf/the-heegner-point-kolyvagin-system.pdf) | published | `89082beb9117b111558f1c62356a0610602781ec2a2b3487ce561920cf4d78d7` |
| [dk](https://arxiv.org/pdf/2010.00657v3) | preprint | `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099` |
| [ltxzz](https://arxiv.org/pdf/1912.11942) | preprint | `84dc7c8369298314bd4e7ece5a45e5e096f39bd376f08c4c489950873c46fe86` |
| [cgls](https://arxiv.org/pdf/2008.02571v2) | preprint | `7cd995e0d9ee1c931f728da8b39603c4205fa0a84c25df27d44b4451a81a2c59` |
| [rubin-es-book-copy](https://www.wstein.org/people/rubin/book/hEulerSystems.pdf) | author copy — §9.1/title/contents only | `1b0229731e38bfaaa55b38a219c055019d1c7db1f0ecec3c083125da87b6e8e4` |

Page corrections: LTXZZ v3 Definition 2.3.2/Lemma 2.3.3 are on p.14, Lemma 2.3.4 on p.15, Lemma 2.3.5 on pp.15–16, Definition 2.6.5 on p.20 and Proposition 2.4.6(2) on p.17. MR04 Theorems 4.3.4/4.4.1 are on pp.41/45 and Proposition 6.2.6 on p.75. Rubin Appendix A Corollary 2.6 is on p.148. DK's §1.2 definitions, equations (8)–(10) and Conjecture 1.5 are on p.8, not p.9. The locator audit did not replace chapter-relative numbering with book numbering.

- **E1, BSS II v1 Hypothesis 4.7(ii): confirmed.** K(T) trivializes T, so an element fixing it cannot produce rank-one coinvariants for a higher-rank T. The finite-level hypothesis and Remark 4.9 identify the intended subgroup. [arXiv's history](https://arxiv.org/abs/1805.08448) lists only v1. The located KCL accepted PDF returned HTTP 403, so no accepted-version correction is claimed.
- **E2, Rubin rigidity example: added/confirmed in the two author copies read.** The outside-N wording is in the SWC draft p.133 and Stein's book-format copy §9.1 p.175. The latter's text extraction has a broken font map; the passage and page header were read from the rendered page. It has no publisher imprint, so neither copy is certified as the version of record. The corrected at-N restriction is used in the node.
- **E3, MR04 Proposition 3.4.4(ii): added/confirmed in the archived author copy.** The single-vertex Z_p/p sheaf is an explicit counterexample at the chapter's general-ring scope. The later principal-artinian applications are not invalidated. The AMS version-of-record PDF returned HTTP 403; a published-version accusation is not made.

Searches for the respective errata, arXiv revisions and accessible author/accepted copies found no explicit correction. `searched` lists both successful searches and access failures, and each finding has its required independent-review verdict. The previously reviewed LTXZZ and CGLS extraction corrections remain cited, rather than being re-recorded as newly discovered here. Publication collation remains a maintainer question.

## Suggested Lean file and tests

The original typed part was read and elaborated before changes. The reviewed file has an added finite–singular quotient-polynomial F₅ witness and the identity law needed by its generic `InverseSystem`. The zero-family check no longer claims to test the arithmetic conductor-one stalk. The comment inventory was regenerated from the corrected packet, including hypotheses, API, tests and acceptance statements; old `[typed above]` marks are now `[prototype above]` with an explicit scope warning. There are 62 such API/test references in the inventory, and the other 346 API/test items have no associated typed prototype. Some of those 62 cover only a polynomial or abstract module part of the arithmetic statement. All named arithmetic theorem statements remain comments.

This fails PROTOCOL §13 even though all proposed names occur in the inventory. The absence of arithmetic carriers is recorded as a gap, not filled by arbitrary Prop fields or opaque stand-ins. The generic SelmerTriple/Tower/InverseSystem is not a proof that an arithmetic carrier exists or specializes correctly. Revision must provide actual carrier-level signatures, API lemmas, examples and named theorem statements, using the planned supplier dictionaries honestly.

Checks completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/EulerSystemsAndKolyvaginSystems--ES.0.json`: **0 errors, 0 warnings** after status/coverage correction.
- `lean-check research/blueprint/suggested/EulerSystemsAndKolyvaginSystems--ES.0.lean`: **exit 0**, **50 warnings**, all `declaration uses sorry`. Available memory was 98 GiB before the single compile. No language server or library build was started.
- All 175 source excerpts match the corresponding independently downloaded PDF text after Unicode normalization and removal of non-alphanumeric characters; source locator pages checked separately.
- All packet nodes remain `implementationStatus: unchecked`; tests and API names resolve in the suggested inventory; JSON/source-issue schema, minimum-three-tests and per-node verdict coverage checked.
- Scope/whitespace/diff checks cover only the three review deliverables and this job's handoff note.

The shared Lean build checks the Mathlib algebraic seed at the pinned Mathlib. It does not import Tau Ceti arithmetic modules or prove the later Tau Ceti checkout interchangeable with the packet's pin. Tau Ceti baseline bodies were checked separately at the exact recorded commit.

## Confirmed red-team findings and reader synchronization

**RT-AREA-iwasawa-1/10:** checked against the confirmed finding, campaign and reader. Generic Howard H.0–H.5/self-dual descent belongs to ES.5; Heegner HE.6 verifies those hypotheses for T_pE and applies the theorem. Howard's Λ-adic Theorem 2.2.10 belongs to ES.8, outside this packet. The Heegner and generalized-cycle edge proposals are retained; no arithmetic verification is silently imported into the generic theorem.

**RT-AREA-iwasawa-1/36:** checked against the confirmed finding, packet and reader. The proposed ES.2→ECMC L0/Kato L2 and ES.4/ES.8→Kato L4 edges, and removal of generic ECMC→Kato edges unless a cyclotomic-unit statement is actually used, remain correct. The carrier, conductor presentation, polynomial dictionary and Rubin bound are the supplying nodes. This review edits no live graph.

The reader document is read-only in this review issue. Its red-team ownership/edge text already matches these two findings, but its generated mathematics now needs synchronization with the corrected packet. Revision should regenerate every changed node's statement/API/test/hypothesis/source locator listed above, replace ClassFieldTheory Layer 12 with Layer 13 and separate Layer 5 duality, include the general-R/L6 contracts, fix the scope statement claiming no replanning of another owner, replace its complete/planned coverage claims and 403-item prototype accounting, and record E1–E3 with the precise version/access limits. The report does not silently change that unauthorized file.

## Questions for the orchestrator / revision acceptance

1. Assign the general-R Selmer/coefficient-duality and weak-hypothesis CGLS pairing contracts to L1/L2 with exact supplier nodes and transports. Retain the old O-adic nodes at their actual scopes.
2. Reconcile ES.6 generic bidual nodes with PadicMeasuresIwasawaAlgebras L6's single ownership. Keep arithmetic contractions/transitions in ES and request the non-routine transfer/invariant-descent identities explicitly.
3. Complete the arithmetic suggested signatures/examples and named theorem statements. A comment inventory cannot satisfy §13; an abstract prototype needs its specialization maps and hypotheses.
4. State the missing classical error-tolerant/all-prime targets and conditional BSS Rubin–Stark class-group application, including a comparison with the narrower DK minus-unit construction. Supply the same-rank stub witness or a different discriminating test.
5. Synchronize the reader and arrange publisher/accepted-version collation for the scoped source findings. No author contact is authorized or attempted.

## Per-node verdict ledger

`verified` means the target-level source statement, conventions and cited inputs were checked at the stated scope; it is not a formalization or full-proof claim. `corrected` records an in-place correction. `unverifiable` identifies an unfulfilled or contradictory prerequisite/interface remaining after corrections. Every node is included once.

| Node | Verdict | Note |
| --- | --- | --- |
| `ES.0/selmer-triple` | unverifiable | Actual general-R Selmer/Cartier-dual carriers and supplier coefficient extension remain open. Corrections: The DVR Cartier dual is not a lattice. |
| `ES.0/quotient-category` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.0/cartesian-condition` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.0/cartesian-length-linearity` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.0/quotient-dual-propagation` | unverifiable | General-R orthogonal propagation needs the enlarged supplier contract. |
| `ES.0/selmer-torsion-identification` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.0/selmer-length-difference` | unverifiable | General-R length duality is not supplied by the cited O-adic L1/L2 nodes. |
| `ES.0/core-rank` | corrected | Distinguish the signed 2016 convention from the positive-part 2004 convention. The condition χ ≥ 0 was tautological and did not exclude negative signed core rank. Carry the admissibility hypotheses of the elliptic example into its tests. Carry the elliptic example hypotheses. |
| `ES.0/core-rank-independence-of-modulus` | unverifiable | General coefficient propagation/duality contract remains unfulfilled. |
| `ES.0/canonical-selmer-structure` | corrected | The finite-order example in the original test has divisible dual invariants and gives equality. Add the positive test that disproves the original counterexample. Relaxing on the lattice and then propagating need not relax the finite quotient. |
| `ES.0/core-rank-formula` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.0/hypotheses-mr2004` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.0/hypotheses-mr2016` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.0/hypotheses-implications` | corrected | Rubin fixes the p-Hilbert class field and assumes irreducibility, not the stronger 2016 hypotheses. Do not infer the stronger full-Hilbert-field condition. The original acceptance conflated one hypothesis with every implication. |
| `ES.0/example-cyclotomic-twist` | corrected | Use the lattice dual invariants before reduction. |
| `ES.0/example-elliptic` | corrected | Separate the lattice and finite-level canonical conditions. |
| `ES.0/non-example-inadmissible` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.1/ray-class-tower` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.1/conductor-ideal` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.1/kolyvagin-primes` | corrected | Chebotarev needs a nonempty allowed Frobenius subset, not an arbitrary prime set. Respect the distinction between unrestricted and chosen prime sets. |
| `ES.1/finite-singular-decomposition` | corrected | Separate local reciprocity from its duality supplier. |
| `ES.1/transverse-condition` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.1/finite-singular-comparison` | corrected | Functoriality fails when the characteristic polynomial changes. Add a counterexample to the overbroad functoriality claim. Replace the identity square by a genuine coefficient-reduction square. |
| `ES.1/modified-selmer-structures` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.1/transverse-duality` | corrected | Separate local reciprocity from its duality supplier. |
| `ES.1/chebotarev-nonvanishing` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.1/chebotarev-prescribed-kernels` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.1/rubin-prime-selection` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.1/reducibility-depth` | corrected | Correct source page locators against the printed page headers. |
| `ES.1/selmer-field-saturation` | corrected | Correct source page locators against the printed page headers. |
| `ES.1/abundant-tuples` | corrected | Correct source page locators against the printed page headers. |
| `ES.2/euler-polynomial` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.2/euler-system-module` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.2/classes-unramified-outside-p` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.2/conductor-presentation` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.2/twisting` | corrected | Twisting composition can introduce Euler factors when character conductors cancel. The universal non-example was false for the zero Euler system. State the exact cancellation computation. |
| `ES.2/euler-factor-change` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.2/universal-euler-system` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.2/rigidity-variants` | corrected | Correct the reversed ramification condition in the isolated-class example (source issue E2). |
| `ES.3/derivative-operators` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.3/derivative-invariance` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.3/lifting-to-induced-module` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.3/derivative-class` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.3/derivative-local-properties` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.3/congruence` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.3/kolyvagin-system-module` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.3/finite-part-formula` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.3/euler-to-kolyvagin` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.3/two-prime-test` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.3/anticyclotomic-derivative` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.4/selmer-sheaf` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.4/sheaf-monodromy` | corrected | Correct the general-ring ideal claim (source issue E3). Make the hub hypothesis explicit in the primitive-section consequence. Add a discriminating test for the ring restriction. |
| `ES.4/vertex-step` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.4/core-vertices` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.4/leading-vertices` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.4/stub-sheaf` | corrected | Correct source page locators against the printed page headers. |
| `ES.4/kolyvagin-bound` | corrected | Use the untruncated supremum for a vacuous zero-class bound, not a nonexistent maximum. Qualify scaling for the DVR case. |
| `ES.4/rubin-hypotheses` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.4/rubin-bound` | corrected | Correct source page locators against the printed page headers. |
| `ES.4/variant-bounds` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.4/abundant-localization` | corrected | Both scaled-inverse identities are needed for the spanning assertion. Make the finite-ring scaled-inverse argument sound. Correct source page locators against the printed page headers. |
| `ES.4/howard-descent-with-errors` | unverifiable | The direct Howard Cassels prerequisite has absolute residual irreducibility; CGLS’s weak-hypothesis pairing is missing. |
| `ES.5/divisibility-invariants` | corrected | The artinian invariant is truncated at the ring length. Do not apply the structure theorem to arbitrary systems. Scaling in an artinian ring saturates at k. Replace the artinian threshold ∞ by k. Respect the two zero conventions. Add a boundary case detecting truncation. Avoid asserting nonvanishing after every artinian scaling. Keep finite-length and DVR invariants separate. |
| `ES.5/rank-one-module-theorem` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.5/structure-theorem` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.5/kolyvagin-dual-selmer` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.5/sharpness-examples` | corrected | The zero system alone cannot imply an infinite dual Selmer group. Explicitly cover the zero system. Correct source page locators against the printed page headers. |
| `ES.5/howard-hypotheses` | corrected | Extend the p-power scalar ideal to the coefficient ring R; the published notation uses ℤ_p. |
| `ES.5/cassels-structure` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.5/howard-stub` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.5/howard-dvr-theorem` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.6/exterior-bidual` | unverifiable | Generic algebra duplicates the L6 owner; replace by imports and arithmetic adapters. Corrections: Correct source page locators against the printed page headers. |
| `ES.6/bidual-functoriality` | unverifiable | The L6 ownership and exact change-of-rings supplier contracts remain unresolved. Corrections: Restore the standing noetherian convention and the range where contractions are defined. Remove the unnecessary r≥s condition: Proposition 2.3 allows every nonnegative r. |
| `ES.6/stark-systems` | unverifiable | Arithmetic Y_n and transitions are not instantiated; only a generic inverse-system prototype exists. |
| `ES.6/stark-structure` | corrected | The order theorem assumes a finite-level core vertex at every level, not 4.7 alone. Restore the all-level hypothesis from the paragraph before Definition 4.11. |
| `ES.6/bss-hypotheses` | verified | Source/hypotheses and target-level outline checked; shared arithmetic-signature gap still applies. |
| `ES.6/kolyvagin-systems-rank-r` | unverifiable | The advertised same-rank strict-inclusion test remains missing after removing the false comparison. Corrections: The original test compared different exterior ranks to assert a submodule inclusion. |
| `ES.6/regulator-isomorphism` | corrected | Restore the all-level hypothesis of §5.5. |
| `ES.6/rubin-lattice` | corrected | A trivial-action lattice has zero minus part and could not test the asserted minus lattice. Correct source page locators against the printed page headers. |
| `ES.7/higher-rank-euler-systems` | corrected | The literal equality with the Rubin carrier also needs the admissible tower and ramification comparison. The reflexive degree-one bidual identity alone is insufficient for the whole module equality. |
| `ES.7/higher-kolyvagin-derivative` | unverifiable | The exact determinant formula is corrected, but bidual transfer/norm/descent has no fulfilled direct supplier contract. Corrections: Fix the coefficient module and ring before invariant descent. Supply the actual determinant formula, available before §6.5. The correction formula is defined independently of the local theorem’s injectivity hypothesis. Add a two-prime determinant test. |
| `ES.7/fitting-bounds` | corrected | Retain the stronger source equality for the zeroth Fitting bound. |
| `ES.7/rubin-brumer-stark` | unverifiable | The conditional BSS Rubin–Stark class-group application and its relation to the specialized DK construction have no statement node. Corrections: Correct source page locators against the printed page headers. Qualify strictness of the Rubin lattice rather than assert it for every rank≥2 arithmetic lattice. |
| `ES.7/rank-one-comparison` | corrected | Carry the ramification comparison into the summary. Give each asserted comparison its own hypotheses. |
