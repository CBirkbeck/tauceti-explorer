# Finite fields: second fix pass

Job `FIX-RT-AREA-finitefields~2`, issue #6208. Codex — `codex-pwZxBT`, 19 October 2026.

This completes the fixes within the seven deliverables of this job. The starting point already contains the accepted parent blueprint, four accepted follow-ups and their assembled reader. Several omissions described in the original red team have consequently been filled since that red team ran. This report distinguishes changes made here from existing contracts that should be retained, and gives concrete handoffs for files outside the issue’s allowed scope. Neither the earlier acceptance verdicts nor successful elaboration certify this revision: `REV-FIX-RT-AREA-finitefields~2` must review it.

The parent packet now has 346 targets: 354 original targets, minus nine misrouted targets, plus the intermediate-field/divisor correspondence. The four unchanged follow-ups contribute 98 targets, giving 444 unique reader entries. Sixteen elementary census targets and seven shared linearized-polynomial targets have FF.0 as their parent. Their legacy identifiers and anchors remain stable. The parent has 469 baseline declarations and 26 planets, with at most six planets on any layer. The CN packet retains 108 targets.

## Findings and disposition

### /1 — Elementary algorithms must precede cohomological bounds

The parent `restructure` proposal now requests distinct elementary algorithm, point-bound and application refinements. Its gap and the reader explicitly distinguish that request from a registered atlas change. The CN.1 import lists only the elementary factorization/certificate exports and the FF.0 presentation comparison. CN.0 already has its early FF.0 supplier; it did not share CN.1’s depth defect.

The sixteen elementary census targets move from FF.2/FF.3 to FF.0. The seven shared linearized/subspace targets move from FF.4 to FF.0. Their exact prerequisite chains, rather than the legacy prefixes of their identifiers, determine their ownership. The suggested file places the monic census and light linearized signatures before the FF.1 section.

The coarse registered FF.2 → FF.3 → FF.4 edges cannot be replaced within these deliverables. The transaction under “Atlas and owner handoffs” below specifies the necessary refinements. Importing all of WC.5 into an undivided FF.3 would retain the obstruction and is explicitly excluded. An FF.4 algorithm that needs a particular FF.3 algorithm may still import it; the repair does not prohibit such a dependency.

### /2 — Nonelliptic point bounds need an explicit supplier

The accepted FF.3 follow-up already contains the WC.5 contract, reproduced as `F3-R04` in the reader. It states, for every r ≥ 1, the bound 2g q^(r/2) for a smooth projective geometrically connected curve, and the geometric-Betti-number bound for a smooth projective geometrically connected variety of positive dimension. It separates dimension zero and requests the rational-point/cohomology comparison and Frobenius convention. This contract is retained, scoped to the point-bound refinement, rather than attached to all factorization targets.

The parent WC.3 request is strengthened with the all-extension curve consequence of its reciprocal-root statement and the explicit projective/affine comparison obligation. This supplies the actual hyperelliptic consumer without pretending its affine character sum is the general WC.5 theorem. Singular, open or disconnected varieties do not inherit a 2g bound without their own comparison. Elliptic certificates retain their elliptic suppliers.

### /3 — GOS and geometric Swan conductors

The parent’s existing requests, gaps and FF.2 targets already state the mathematical inputs. The restructuring request now explicitly asks for one **Part II extension after EDC.2**, rather than presenting an invented substage as an available supplier. Its contract is

χ_c(U,F) = rank(F)(2 − 2g − |D|) − Σ_(x∈D) Sw_x(F),

where C is smooth projective connected over an algebraically closed field of characteristic p, U=C∖D, ℓ≠p and F is lisse with E_λ coefficients. The finite-torsion-to-E_λ passage remains an obligation of that owner. FF.2 and the Kloosterman-moments programme consume the same theorem.

The existing `modified-pole-order`, `swan-conductor-of-artin-schreier-sheaf` and `h1c-conductor-bound` targets retain reduction by f↦f+h^p−h. A prime-to-p original pole is already reduced; arbitrary poles are not. For ψ(a)=ψ_can(ba), the relevant order is that of **bf**, as the current statement correctly says. The Kloosterman function x+a/x keeps both poles. Its constant two cannot be justified solely by the one-pole polynomial degree theorem.

The AGR request covers geometric equal-characteristic fields such as F̄_q((t)); it is a requested generalization. Current Tau Ceti’s Artin–Schreier uniformizer-displacement theorem is reused, while normalized-order/completion compatibility and the sheaf-level Swan comparison remain explicit gaps. The finite-residue-field arithmetic ramification roadmap is not asserted to cover this case. The source route remains SGA 4½, [Sommes trig.] 3.2–3.5, printed pp. 189–193, and Raynaud’s finite-torsion theorem, with the inherited reading receipts attributed to their readers.

### /4 — Several-variable Deligne bound

The parent and accepted FF.2 follow-up already supply the required targets. Fresh reading of Weil I 8.4–8.13, printed pp. 302–306, confirms why they must remain separate: n≥1, nontrivial ψ, degree d≥1 prime to p and a smooth projective leading-form hypersurface give the bound (d−1)^n q^(n/2). The cohomology is concentrated in degree n with dimension (d−1)^n, but concentration alone is insufficient.

The reader retains the duality/perfect-pairing and smooth proper compactification contracts of 8.5(ii)–(iii), and the local models, surface resolution, relative-family/local-constancy and Künneth inputs of 8.6–8.13. Those missing shared inputs remain supplier requests and gaps, not proved consequences of WC.3. The weaker [Sommes trig.] 3.8 companion estimate remains a distinct target. No duplicate several-variable theorem was added.

### /5 — Exact-order multiplicative degeneracy

The bound now explicitly requires a nonzero polynomial, exact character order e>1 and the zero-extension convention. The excluded condition is g=c·h^e over the algebraic closure, with c≠0. The converse descent statement also explicitly excludes zero. Being a power h^k with e∤k does not, by itself, settle degeneracy: h may itself be an e-th power. The hypothesis text now makes this distinction.

Two concrete acceptance regressions are added to the bound. For the cubic character on F₇ with χ(3)=exp(2πi/3), χ(x²) has exponent counts (2,2,2) on the six nonzero inputs and sums to zero. In contrast, χ(3x³) has six equal nonzero values, so its sum has modulus six. Here 3 is not a cube in F₇. These tests separate arbitrary powers, base-field cubes and geometric scalar-times-cube degeneracy. The existing mixed-sum targets retain their own additive nontriviality and combined conductor hypotheses.

### /6 — Reuse structural finite-field theory

The packet already cites Frobenius and its order, extension embeddings/uniqueness, relative trace and norm formulas, their surjectivity, and `IsGalois.normalBasis`. These remain baseline imports. No second finite-field, trace, norm or normal-basis-existence theory is planned.

Eight further baseline references are recorded: `FiniteField.Extension.exists_frob_pow_eq`, `IntermediateField.fixedField`, `IntermediateField.mem_fixedField_iff`, `IntermediateField.finrank_fixedField_eq_card`, `IntermediateField.finrank_dvd_of_le_right`, `TauCeti.FiniteField.pow_card_eq_self_iff_mem_range_algebraMap`, `quadraticChar_card_card` and `legendreSym.quadratic_reciprocity`. The fixed-field degree theorem computes [E:E^H], not [E^H:F]; the new proof route uses it with the tower formula in that direction.

The genuinely missing explicit correspondence is now `FF.0/intermediate-field-divisor-correspondence`. It gives K↦[K:F], its inverse as the fixed field of the relative Frobenius power, its q^d-element description, uniqueness, and inclusion iff degree divisibility. Its four API entries and four tests distinguish divisibility order from natural-number order: degree two and degree three fields in degree six are incomparable, and degree four is impossible. Shoup v2, Theorem 19.13 with proof, printed p. 515, and Theorem 19.4, p. 510, give the finite-field argument. The suggested file states the correspondence and selected tests on native `IntermediateField` carriers. The Galois-subring target now imports it explicitly.

Certified presentations with inverse maps, normal-element certificates, tensor decompositions and the elementary census remain construction/comparison targets. The latter now live in FF.0. Existing noncomputable or existential library results are not described as executable algorithms.

### /7 — Reuse elementary Gauss–Jacobi identities

The parent baseline already contains the Gauss product, quadratic square, Jacobi quotient/product and finite-order power identities with their separate hypotheses. The two quadratic-reciprocity declarations above complete the explicit baseline record. Their actual pinned statements were read; coefficient-characteristic restrictions, primitivity and nontrivial-character exceptions are retained.

The early targets provide normalization and complex modulus/conjugation adapters. They do not repeat a geometric proof of an available scalar identity. The FF.2 Frobenius realization and `gauss-sum-realization-duality` are preserved: a scalar identity alone supplies neither a cohomology object nor its Frobenius-equivariant pairing. The EXT-08 placement handoff below preserves this distinction.

### /8 — Hasse–Davenport lifting and product

`FF.1/hasse-davenport-lifting` already states the lifting identity, with positive extension degree, and allows the trivial multiplicative character when the additive character is nontrivial. Its formulation also treats the valid nontrivial-multiplicative/trivial-additive case. With the agreed convention it reads g_lift=(-1)^(n−1)g^n; the doubly trivial case is separately excluded. The elementary source and the geometric FF.2 interpretation are already distinct, so no competing lifting theorem was added.

The product formula is a separate target. Its accepted FF.1 completion uses an exact Gamma multiplication route. The two chosen-root Dwork coefficient/splitting obligations remain explicit gaps; merely adding a lifting locator cannot close them. The EXT-08 handoff corrects the lifting locator to [Sommes trig.] Theorem 1.15, printed p. 177, and distinguishes 4.5, pp. 197–198, from the later twisted-form interpretation. No unread Ireland–Rosen proof is claimed.

### /9 — Geometric Gauss realizations belong to FF.2

The assembled blueprint already has FF.2 owners for Artin–Schreier and Kummer sheaves, the compact-support trace formula, Gauss Frobenius realization, duality compatibility and the twisted étale-algebra interpretation. The elementary finite-product identity stays in FF.1. Their current prerequisites and separate reader groups are retained.

The original EXT-08 packet is outside this job’s deliverables. The exact old-to-current target map below tells its integration owner how to remove the obsolete early geometric placement without losing its content. A GOS request remains a request until the general owner exists.

### /10 — EXT-08 metadata and promotion

No queue, authored extraction, promoted decomposition or decision file is changed by this job. The parent’s old review object and the four follow-up verdicts are retained as provenance; `fixAudit` explicitly records that this revision awaits a new independent review. The report does not extend those verdicts.

The supported metadata/promotion handoff is detailed below. In particular, `integrated_partial` and genuine source/closure gaps must survive. Deferred supplier links are not invalid active graph edges and must not be activated merely by changing a status string. The finished blueprint now provides the replacement for its covered layers; it should not be overwritten by an obsolete coarse EXT packet.

### /11 — CN.1 consumes finite-field factorization

The starting CN.1 target was already a transport theorem. Its hypotheses, proof route and import inventory now make the contract explicit: a checked nonzero scalar times monic irreducible factors, multiplicities retained, mapped through the FF.0 certified ring equivalence. Constants use the empty list; the FF.3 checker already rejects zero, and zero has a separate output case.

FF.3 retains SFD, DDF, EDF, Cantor–Zassenhaus, Berlekamp, Rabin generation and the mathematical factorization certificates. The import inventory names `factorization-certificate-sound`, `factorization-certificate-complete` and `certified-factorization-algorithm`. CN.1 supplies neither a second factor checker nor a second search proof. FF.3’s bounded-round randomized result is not represented as a worst-case successful deterministic algorithm; operational/expected-cost claims remain against the requested CN.0 semantics.

The suggested transport theorem preserves the factor list, with constant, repeated-factor and zero-rejection examples. The rest of the CN suggested file is brought into the binding streamlined shape: admitted data definitions and their dependent scaffolding remain full reader targets, while selected real-bodied light functions/predicates and native-carrier milestones elaborate. All 108 reader/packet targets remain. The authored and promoted EXT-08 CN copies require the external handoff below.

### /12 — FA.7 imports the same certificates

The FF reader retains the ownership boundary and the CN gap now points out the historical foreign ownership record. FA.7’s files are outside this job. Its owner must import the elementary factorization component and the relevant exact point certificates, retaining place enumeration, Riemann–Roch computations, ray characters, conductors, completions and Artin/ramified L-polynomial services.

Only in the smooth projective geometrically connected genus-g curve setting do counts through r=g, Newton identities and the correctly normalized functional equation determine the zeta numerator. That assembly is FA.7 work; it is not a substitute for every Artin or ramified L-polynomial computation. See the actionable handoff below.

### /13 — One early linearized/Ore owner

The seven shared parent targets now belong to FF.0: the support definition and evaluation linearity, composition closure, root-space and separability statements, and the subspace polynomial with its linearizedness theorem. The reader states compatible commutative coefficient/target algebras, with fields required only where the root/subspace theorem needs them. The polynomial-law versus finite-function distinction is explicit and has a suggested-file example: X²−X over F₂ is nonzero as a polynomial and induces zero on F₂.

Mathlib’s `SkewPolynomial` is reused. Fresh reading of Wu–Liu v2, §2.1, Theorems 2.1–2.2, pp. 5–6, distinguishes the formal composition algebra from its finite-function quotient. The accepted follow-up’s `FF.4/frobenius-ore-polynomial-comparison` is the single existing comparison target. Its packet cannot be edited here, so its parent must still be moved to FF.0 by that owner before it becomes an early DM.0 import. This remaining binding is an explicit gap; DM.0 is not authorized to build a second comparison. Specialized quotient-function, trace, Dickson and permutation applications remain later.

### /14 — Code-family contracts

The parent and accepted FF.4 follow-up already contain the missing code-family targets and their APIs/tests. They are retained, using native submodule, divisor, place and Weil-differential carriers. The cyclic ideal correspondence has n>0 and does not require coprimality. The primitive-root/simple-root BCH route requires gcd(n,q)=1 and allows arbitrary starting offset. Singleton and positive-distance conclusions respect the nonzero-code convention. Ordinary RS has distinct evaluation points and 1≤k≤n≤q; k=0 is handled as the zero code.

For AG codes, the reader keeps exact constants, distinct rational places disjoint from the evaluation divisor’s other support, the kernel dimension ℓ(G)−ℓ(G−D), the qualified Goppa distance bound and residue-code duality. The native Weil-differential route consumes AlgebraicCurves Layers 3–5. A Kähler-residue formulation would also require the Layer-9 comparison; it is not silently identified with the native route. Current upstream AlgebraicCodingTheory supplies the generic carrier/linear algebra and explicitly leaves these families to another roadmap. No duplicate generic-code theory was added.

### /17 — Target-specific source routes

The starting accepted packets already replace the blanket Shoup/Deligne attribution by target-specific editions, locators and reading receipts. These are retained. Representative routes are:

| Work | Existing source and exact locator |
|---|---|
| Finite-field census and factorization | Shoup v2, Theorems 19.10–19.14, pp. 513–516; Chapter 20, §§20.1–20.5 |
| Coprime Hensel factor lifting | Milne, Algebraic Number Theory, Theorem 7.33 and Lemma 7.35, pp. 121–122; Remarks 7.36–7.37, pp. 122–123 |
| Schoof | Sutherland 18.783 (2023), Lecture 8, Algorithm 8.1, p. 1; Schoof (1995), §5, pp. 233–235 |
| Galois rings | Goresky–Klapper, public 2009 draft, Chapter 4, especially §4.5, pp. 109–110; the follow-up retains its edition-specific corrections |
| Linearized laws and composition | Shallue §1.4, p. 14; Ben-Sasson–Etzion–Gabizon–Raviv §II, p. 3; Wu–Liu §2.1, pp. 5–6 |
| Cyclic ideals / BCH | Szőnyi, Cyclic codes, p. 2; Bazlov, Week 9, Chapter 9; exact statements and proof gates are in the accepted follow-up |
| Singleton / RS | Guruswami–Rudra–Sudan, Theorem 4.3.1, p. 79; Definition 5.2.1, p. 98, Claim 5.2.3, pp. 99–100, Theorem 5.2.4, p. 100 |
| AG duality | Couvreur–Randriambololona, arXiv:2009.01281v1, Theorem 12, p. 9, with the native differential comparison specified separately |
| Correlations and finite-plane spectra | Goresky–Klapper, Kuang and Vinh–Dung, and the FF.4 spectral-transfer/Katz follow-up contracts; the remaining Lang-sheaf, Euler-characteristic and spherical-normalization gaps are preserved |

These are **inherited proof receipts**, except for the fresh scoped readings separately recorded below. This run does not claim a fresh proof audit of all 46 consolidated source records. `content/campaign-guide/EXTENSION_SOURCES.md` is outside the deliverables: its registry update is handed to the maintainer with these exact source IDs. Suggested books are acquisition leads until actually read, not evidence for a completed proof route. No private library file was used or copied.

### /18 — BKK ownership routing

Nine parent FF.1 targets are removed, together with their reader blocks and the residue-character planet. They have no remaining prerequisite consumers in the assembled FF/CN target set. They are not replaced by external placeholder targets under the wrong owner. Their source receipts and existing source corrections are preserved.

| BKK item / removed FF.1 suffix | Owner and locator in arXiv:2007.14567v3 |
|---|---|
| 8 / `fourier-transform-of-integer-measure` | PM.0; §2.4, p. 13 |
| 25 / `fourier-gap-from-residue-anticoncentration` | AC.0; Lemma 3.6 and proof, pp. 24–25; the modulus can be composite |
| 13 / `residue-character-at-infinity`, `residue-pairing-duality` | FA.2; §4, pp. 28–29 and (4.1), p. 29 |
| 14 / `negative-power-torus`, `haar-measure-on-negative-power-torus` | FA.2; §6 and Remark 6.1, pp. 31–32 |
| 15 / `reduced-polynomial-fractions` | FA.2 as the single construction owner; §4 p. 30 and Lemmas 6.2–6.3, p. 33; ES.1/sieve consumers import it |
| 20 / `torus-character-orthogonality` | FA.2; §6, p. 32 |
| 21 / `torus-finite-coordinate-integral` | FA.2; Lemma 6.1, p. 32 |
| 73 / retained census | FF.0, using the stable FF.3 census IDs; Proposition 8.1, p. 39 |
| 130 / retained modulus-T special case | FF.0, using the prescribed-constant-coefficient targets; proof of Lemma 3.2, §3.1, p. 20. General prime-polynomial residue-class distribution remains FA.5 |

The packet’s `fixAudit` lists every removed and reparented identifier. Route/extraction files and foreign packets cannot be changed here; the transaction below specifies their update. A route correction establishes ownership, not the imported theorem or a source-closure claim.

## Atlas and owner handoffs

These changes require the maintainer’s supported registration/promotion pipeline. They are proposed transactions, not active edges, and no new prerequisite below purports to name an already registered stage.

1. **Register elementary and bound refinements before recomputing depths.** Separate FF.3’s factorization/Hensel targets and their cost targets from point-bound/fast-reconstruction targets. The elementary side contains SFD, DDF, EDF, irreducibility/Rabin generation, Cantor–Zassenhaus, Berlekamp, irreducible sampling, factor certificates and Hensel lifting; its internal closure uses FF.0, CN.0 and the precise arithmetic/Hensel suppliers. Exact naive point enumeration, reconstruction identities and certificate soundness also have an elementary specification component. Keep Schoof’s Hasse/CRT recovery and geometric comparisons with their actual elliptic suppliers; put `weil-error-bound-for-hyperelliptic-counts` with FF.2/WC.3, and the general `F3-R04` contract with WC.5. The polynomial sets counting hyperelliptic presentations are elementary combinatorics, not curve error bounds.
2. **Split the FF.4 algebraic and geometric application paths.** Galois rings, formal linearized/permutation criteria, recurrence identities and elementary cyclic/BCH/RS results must not inherit all FF.2 or all FF.3. AG-code/native-curve comparisons retain AlgebraicCurves; GL₂ homogeneous-space/spherical results retain CharacterTheory; actual weight/conductor/spectral bounds retain FF.2/DWP/EDC. Some correlation identities use only orthogonality or quadratic-form algebra and must not be assigned Weil dependencies solely because of their title. Use the transitive exact-node prerequisites to assign each target, not a broad topic label. FF.5 imports each actual estimate/certificate it packages directly. CN.1 takes only the elementary factorization component; CN.3 and FA.7 take their selected point-count contracts. Preserve a specific FF.3→FF.4 algorithm import if an algorithmic consumer needs it. Recompute depths and test cycles only after registering the chosen refinement IDs and rebinding these targets.
3. **Bind the single early Ore export.** In `packets/FiniteFieldsAndCharacterSums--FF.4.json`, change the parent/realisation of `FF.4/frobenius-ore-polynomial-comparison` to FF.0, keeping its ID, statement and existing Mathlib skew-polynomial baseline. Update its reader/consumer references in the next authorized follow-up pass. Then bind DM.0 to FF.0’s core and this comparison. DM.0 keeps Drinfeld-module structure. Do not conflate the formal algebra with the quotient of finite-field functions.
4. **Register GOS once.** Add the Part II extension after EDC.2 with the formula and coefficients above, including its finite-torsion passage and geometric conductor prerequisites. Bind FF.2 and Kloosterman-moment consumers to it. AGR’s equal-characteristic request remains a supplier obligation until implemented/planned at the needed generality. The relative compactification/local-constancy/resolution requests for Weil I 8.5 remain separate shared inputs.
5. **Reconcile EXT-08 through supported decisions and promotion.** The relevant foreign paths are `research/expansion/external/EXT-08/{FiniteFieldsAndCharacterSums,ComputationalNumberTheory,ExponentialSumsAndCircleMethod}.json`, `research/expansion/queue.json`, the generated decision register, and the corresponding promoted decompositions. Read the accepted `REVIEW-EXT-08-EXT-16-review.md` §§7–8; reconcile the map below, correct the 1.15 lifting locator, use the existing DWP.6 weight supplier where applicable, retain comparison/conductor gaps, regenerate decisions and preserve `integrated_partial`. Maintain `deferredLinks` until the supplier refinement is available. Do not overwrite the finished blueprint’s finer reviewed layers with the old coarse decomposition. The independent review/intake, rather than this worker, decides promotion.
6. **Resolve the FA.7/RS-04 ownership record.** Replace FA.7’s own finite-field factorization theory by imports of `FF.3/factorization-certificate-sound`, `factorization-certificate-complete`, `certified-factorization-algorithm` and FF.0’s checked presentation maps. Add selected exact point-count certificates with their model hypotheses. Keep FA.7’s other services and the qualified zeta-numerator assembly described under /12. Route this through the authorized FA blueprint/review/fix job, not a second FF implementation.
7. **Update BKK routes and the source registry.** In `PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23`, send items 8→PM.0, 25→AC.0, 13/14/15/20/21→FA.2, 73→FF.0, and 130→FA.5 except for the isolated FF.0 modulus-T contract. Consumers use those suppliers. Update `EXTENSION_SOURCES.md` from the existing target-specific source records and their original reading attribution, retaining all source gaps. Neither that registry nor foreign packets are editable in this job.

The current destinations for the old EXT-08 finite-field content are:

| Old suffix | Current destination (all prefixes are `FiniteFieldsAndCharacterSums:` unless stated) |
|---|---|
| `irreducible-polynomial-census-and-existence` | FF.0 parent of `FF.3/gauss-product-formula` and the census chain; finite-field existence is baseline |
| `frobenius-automorphism-and-exact-order` | Existing Frobenius/order baseline and `FF.0/frobenius-minimal-polynomial-of-an-element` |
| `subfield-lattice-and-uniqueness-up-to-F-isomorphism` | Existing embeddings/uniqueness baseline plus `FF.0/intermediate-field-divisor-correspondence` |
| `norm-and-trace-surjectivity` | Existing trace/norm baseline and the FF.0 parent of `FF.3/norm-from-minimal-polynomial` |
| `lang-torsor-character-sheaves` | `FF.2/artin-schreier-sheaf`, `kummer-sheaf`, `character-sheaf-trace-formula` |
| `gauss-sum-cohomological-realization` | `FF.2/gauss-sum-frobenius-eigenvalue` |
| `gauss-sum-absolute-value-by-duality` | Early scalar adapter `FF.1/gauss-sum-absolute-value`, separate `FF.2/gauss-sum-realization-duality` |
| `etale-algebra-gauss-sums-and-hasse-davenport-shape` | `FF.1/etale-algebra-gauss-sum-product`; `FF.2/etale-algebra-gauss-sum-twisted-form` |
| `euler-poincare-with-swan-conductors` | Requested single EDC Part II owner, not an FF.1 definition |
| `modified-pole-order-and-artin-schreier-normalization` | `FF.2/modified-pole-order`, `artin-schreier-reduced-form`, `artin-schreier-invariance` |
| `one-variable-artin-schreier-weil-bound` | `FF.2/artin-schreier-sum-on-curve-bound`, with its conductor/weight frontiers |
| `kloosterman-rank-two-and-eigenvalue-pairing` | `FF.2/involution-eigenvalue-pairing`, `kloosterman-l-function`, `kloosterman-bound` |
| `multivariable-polynomial-exponential-sum-bound` | `FF.2/elementary-n-variable-bound`; the stronger Weil I 8.4 theorem is separate |
| CN.1 finite-field factorization | FF.3 algorithm/certificate owners; CN.1 retains only the coefficient-presentation transport |

The issue explicitly assigns /1–/14, /17 and /18. Rejected /15 and /19 do not justify removing the specialized code or application contracts. Low-severity /16 and /20 are not separately fixed here; the existing reader already records the native curve/character-theory inputs and the DWP.6 distinction. The integration handoff preserves those contracts without claiming the additional comparison theorems are built.

## Evidence and validation

Fresh primary-source readings are recorded in the parent `sourceVersions`: Shoup v2 Theorem 19.4, p. 510, Theorems 19.10–19.14 and Exercise 19.1, pp. 513–516; Deligne Weil I 8.4–8.13, pp. 302–306; Wu–Liu arXiv v2 §2.1, pp. 5–6; BKK arXiv v3 §2.4 p. 13, Lemma 3.2 proof p. 20, §§4–6 pp. 28–33, Proposition 8.1 p. 39 and Lemma 11.1 pp. 54–55. Available fresh PDF hashes are in those receipts. Shoup was read in the browser; its new receipt does not assert a fresh file hash. The other source receipts remain inherited. This report and the revised targets state the mathematics in our own words.

Pinned Mathlib/Tau Ceti declarations were read in the shared source trees. The current upstream roadmap checkout (`0d144d044dacebca17b654695b6f1ad58f159b27`) and current Tau Ceti (`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`) were also inspected, including AlgebraicCodingTheory, LocalGaloisGroups and the finite-field library. No build was run there. No claim is made that finite-residue arithmetic local Galois theory supplies geometric Swan conductors.

Validation results are recorded in the handoff. Successful elaboration checks only that these planning signatures are well typed at the pins; their admitted proofs remain targets. No stage is declared mathematically closed by this fix.
