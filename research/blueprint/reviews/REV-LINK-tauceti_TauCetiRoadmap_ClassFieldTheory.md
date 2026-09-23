# Independent review: Class field theory links

Job `REV-LINK-tauceti_TauCetiRoadmap_ClassFieldTheory`; issue #87. Reviewer: Codex, session `codex-c83e7a`; 2026-09-23.

**Accepted after correction.** The original packet was a partial checkpoint by Claude Opus 5 (original job `LINK-tauceti_TauCetiRoadmap_ClassFieldTheory`, commit `f66d8b51f39c9bd281d7368a0261610515a8a04e`), not this reviewer. Its catalogue screen was finished; its adversarial endpoint review was explicitly unfinished. I completed that review and refreshed the screen before setting `status: complete`.

The corrected packet emits **91 links** (17 explicit, 74 inferred), has **11 overlap decisions** (7 keep, 4 rescope), and references **8 already-recorded edges** without emitting them again. Of the 98 original links, six were duplicates, three ended at retired LI.4, and one incorrectly used number-field correspondence for the higher-global roadmap's curve reduction. Three new edges are emitted. Two further interfaces found in the completeness probes were already recorded by NumberFieldArithmetic and LocalFieldsRamification.

## Evidence and reading scope

Initial explorer snapshot: `0b1d56c7e8161ccd8c5012266495e6e9f640d615`; final guarded input snapshot: `0a6893f0d05f8fcfe333d655a385607d629107b8`. The original packet and absent-report guards were preserved throughout. Concurrent changes to NumberFieldArithmetic, ModularCurves and AlgebraicCurves link packets were refreshed before final duplicate checks.

I read all **82 distinct original endpoint descriptions**, including the retired endpoint to judge its removal and every overlap endpoint, plus the otherwise unreferenced CFT Layer 3. Thus all **15 CFT layers** were read, together with the scope, conventions and relevant document-wide evidence. LocalFieldsRamification Layer 3 and NumberFieldArithmetic Layer 6 were reused from this session's immediately preceding review only after byte-for-byte equality checks. Eleven additional candidate stages were read in full during completeness probes; other catalogue documents were screened by full-text search, not claimed as fully read.

The screen covers all **218 current catalogue documents**, including the one retirement while judging old references, and **2,007 stage descriptions**. `examined` contains exactly the **216 other active roadmap IDs**, with no self-entry or retired roadmap. Original author reading notes are explicitly retained as `originalScreenNote`; they are not presented as this reviewer's independent reading.

All **223 evidence strings** in emitted and already-recorded edges are literal substrings: **208 stage-local and 15 document-wide**. The original packet had 135 whitespace-normalized rather than literal quotations; all match after restoring source whitespace. No unmatched quotation was rescued by approximate wording. Document-wide evidence is allowed by Protocol §10 and is located separately below. One-sided references are conservatively labelled inferred even where the output/input match is exact.

## Material corrections and mathematical boundaries

1. **Continuous and finite Tate cohomology.** Formation coefficients are smooth discrete objects, not arbitrary discrete underlying `TopRep`s. Finite Tate groups are integer graded and use the finite quotient with invariant coefficients. Continuous cup products and their colimits do not supply negative Tate degrees. Arithmetic Artin maps are the inverse of the degree −2 to 0 Nakayama map. A generic coefficient pairing cannot be replaced by a zero pairing.
2. **Local scope.** Full finite-module duality and local existence use the mixed-characteristic hypotheses of the named theorems. The equal-characteristic residue-primary extension is excluded from CFT. In particular the power-class count and openness do not apply to pth powers in F_q((t)); elements 1+t^m for p not dividing m demonstrate the obstruction. CFT9 supplies the Weil carrier/topology in both characteristics, but its full K* to topological W^ab isomorphism is mixed-characteristic. Density is not surjectivity or injectivity.
3. **Normalization.** Uniformizers map to arithmetic Frobenius. For units of finite K/Q_p, the cyclotomic character is the inverse field norm; omitting the norm is wrong outside Q_p. Geometric normalization is obtained by inversion. Brauer restriction multiplies the invariant by extension degree; corestriction preserves it. Fundamental classes are derived from invariant 1/[U:V], not separately chosen.
4. **Global scope and conductor.** The global formation, invariants and correspondence are number-field constructions. Removed CFT-L54: HL.6 asks for the curve-case reduction, which does not establish a Spec(O_K) use of this source and cannot receive function-field reciprocity from it. CFT12 requires conductor divisibility, including finite exponents and selected real places. Existence of a ray subgroup inside an open subgroup supplies an admissible modulus; least-conductor minimality is additional work (CFT-L32).
5. **Brauer layers.** CFT-L34 now describes the finite idele-layer cohomology using relative local Brauer kernels. At a fixed finite L/K, it is not the sum of all unrestricted Br(K_v). Nor is H2(I_L) to H2(C_L) generally surjective: the H3(L*) obstruction in CFT10 must be killed by refinement before descending the invariant. The Q(sqrt(13),sqrt(17)) regression remains relevant. CFT-L87 preserves this construction.
6. **Symbols and twists.** H2(mu_m) is not H2(mu_m tensor mu_m) without the required Galois-equivariant identification. CFT-L68 and L82 retain the primitive-root choice and change-of-root obligation. CFT14 supplies only quadratic Hilbert reciprocity; higher-power laws in T.7/M.3/CA.1 remain applications with actual coefficient hypotheses. CFT10 can supply the number-field invariant sum, not the function-field or S-integer theorem.
7. **Class fields of orders.** CFT13's ring-class-field wrapper requires [K:Q]=2 and uses invertible proper ideals/Pic, not the whole ideal-class monoid. CFT-L62 is narrowed accordingly. General CM K/F is handled by a new CFT12 input only after HE.0 constructs its relative order/idele quotient; the review does not broaden the fixed upstream wrapper.
8. **Ownership and circularity.** No recommendation moves existing CFT or QFI milestones, removes frozen names, reverses CFT to QFI, or weakens CFT's prohibition on Chebotarev inputs. The elementary overlap with Chebotarev7.1–7.4 is recorded, but a shared isolated helper would need a separate proof/dependency audit and a Part II proposal. No edge is justified by the later stage's name alone.

## Completeness probes

Seven focal layers were selected before searching the full current atlas. Each probe searched suppliers and consumers, then checked plausible complete contracts.

| CFT layer | Search interfaces | Disposition |
|---|---|---|
| 0 | Tate's theorem, Tate–Nakayama, integer Tate cohomology, Herbrand quotient | ET.0 torus component retained; no homotopy-theoretic Tate-spectrum edge. L85 now states lattice/Tor and torus-complex limits. |
| 5 | local duality, Brauer invariant, Euler characteristic, Kummer coefficients | Added L101 to VB0. ES.0 and Selmer L1 use the existing AGD duality owner; p-adic Hodge exponentials need its extended theory, not only finite discrete CFT coefficients. |
| 7 | Artin map, Frobenius normalization, cyclotomic character | Retained actual normalization consumers. Generic cyclotomic/Artin terminology and tame monodromy are insufficient. |
| 9 | Weil groups, Weil–Deligne parameters and topology | R01.2, LP0 and HS1 retained. R06.3, ET.6 and AL.4 use the supplied R01 WD carrier; no new transitive carrier edge. LPV.1 needs inertia/tame character, not reciprocity merely because a placeholder says CFT. |
| 10 | Brauer–Manin, invariant sum, local/global Brauer sequence | RP.2 retained with its evaluation/comparison obligation. No extension from number fields to function fields. |
| 12 | existence, open norm subgroup, class-field correspondence, norm index | Added L102 for the supported n=1 HL.3 correspondence and L103 for general number-field existence in HE.0. Removed unsupported HL.6 curve edge. |
| 13 | ring/ray/Hilbert class fields, Hasse norm, conductor–discriminant | Located NFA2 to CFT11 and LF2 to CFT13 in their existing packets (L99/L100). CM.6/HE.1 use earlier CM/ring-field suppliers; no duplicated transitive edge. |

The eleven extra full-stage reads were ArithmeticGaloisDuality R02.3; EulerSystems ES.0; PadicHodgeRegulators L1; SelmerIwasawaCohomology L1; VectorBundlesAndIsocrystals VB0; LefschetzPencils LPV.1; PadicHodgeTheory R06.3; EndoscopicTransfer ET.6 (including its embedded ET.6a); AutomorphicLFunctions AL.4; ComplexMultiplication CM.6; HeegnerPoint HE.1.

### Newly emitted edges

| ID | Source → consumer | Exact contribution and remaining work |
|---|---|---|
| CFT-L101 | CFT5 → VB0 | Local cohomological Brauer invariant. VB0 compares its endomorphism cyclic algebra, fixes Frobenius/sign conventions and proves classification. |
| CFT-L102 | CFT8 → HL.3 | The n=1 correspondence in the mixed / prime-to-p regimes. Wild equal-characteristic and higher-dimensional existence remain source-qualified extensions. |
| CFT-L103 | CFT12 → HE.0 | Number-field class-field existence after the relative CM order/idele subgroup is constructed and shown open of finite index. No higher-degree ringClassField wrapper is claimed. |

All three carry `addedBy: REV-LINK-tauceti_TauCetiRoadmap_ClassFieldTheory`. The two additional discoveries CFT-L99 (NFA2 → CFT11) and CFT-L100 (LF2 → CFT13) appear only in `alreadyRecorded`, with their current owner paths and exact evidence. The original GQF edges L43–47 and elliptic duality edge L84 are likewise referenced there.

## Original-edge decision ledger

IDs L01–L98 preserve the original array order. Every row below follows a full read of both endpoint descriptions. “Keep” concerns the supplier interface, not a claim that the planned theorem is implemented. Detailed quotes and reasons are in the adjacent JSON packet.

| Original edge | Decision / exact boundary |
|---|---|
| CFT-L01 | Keep the finite-module equivariant evaluation pairing, with smooth discrete coefficients. |
| CFT-L02 | Keep the smooth discrete subcategory; TopRep with a discrete underlying module alone is insufficient. Formation already abbreviates the shared carrier at the pin. |
| CFT-L03 | Keep the canonical continuous carrier, not a new cohomology theory. |
| CFT-L04 | Keep the low-degree evaluation cup pairing; its perfectness is arithmetic CFT work. |
| CFT-L05 | Keep separable-closure coefficients, equivariant transport, Kummer and H2 torsion comparison; n must be nonzero in the field. |
| CFT-L06 | Keep the embedding-indexed finite Galois quotient dictionary and independence-of-embedding obligation. |
| CFT-L07 | Keep canonical Shapiro and change-of-groups operations. Invariant restriction multiplies by degree; corestriction preserves the invariant. |
| CFT-L08 | Keep finite-quotient Brauer comparison. Formation coefficients are A^V, not unrelated copies of the field units. |
| CFT-L09 | Keep imported all-degree colimit in global cohomology; finite Tate and continuous cohomology are distinct carriers. |
| CFT-L10 | Keep named TopPairing and continuous cup, with a primitive-root choice for the scalar symbol. |
| CFT-L11 | Keep normalized valuation for the unramified coordinate; no norm formula attributed to LF0. |
| CFT-L12 | Keep the power-class count in mixed characteristic or the invertible-exponent regime; no equal-characteristic p-primary count. |
| CFT-L13 | Keep unit filtration and the mixed-characteristic deep logarithm only; a normal-basis lattice is not a free integral ring of integers. |
| CFT-L14 | Keep regime-qualified power-subgroup containments; the conductor is an attained minimum, not a formal infimum. |
| CFT-L15 | Keep openness and finite index as separately proved inputs, respecting full mixed / prime-to-p equal-characteristic existence. |
| CFT-L16 | Keep local Kummer counts at finite number-field places with mu_p present; archimedean factors are separate. |
| CFT-L17 | Keep arithmetic Frobenius for the independent construction of the local invariant. |
| CFT-L18 | Keep unramified Frobenius and unit-norm surjectivity; an arbitrary cyclic generator does not fix reciprocity. |
| CFT-L19 | Keep the named norm group and unramified conductor test. |
| CFT-L20 | Keep the Zhat quotient and maximal unramified field as Weil-group inputs. |
| CFT-L21 | Keep finite ramification quotients for solvability and the unit-norm cohomology interface. |
| CFT-L22 | Keep the shifted norm/Herbrand filtration statement; its index convention is not silently changed. |
| CFT-L23 | Keep different/discriminant and Hasse-Arf as partial inputs; the full character-conductor comparison remains to be proved. |
| CFT-L24 | Keep the absolute Galois/inertia frame; the reciprocity statement mentioned in LF4 is supplied by CFT, not used to build the frame. |
| CFT-L25 | Keep the inertia exact sequence; Weil topology makes inertia open and is not the subspace topology. |
| CFT-L26 | Keep actual archimedean completions for real and complex Brauer invariants. |
| CFT-L27 | Keep normalized product formula for number-field Kummer existence. |
| CFT-L28 | Keep infinite-place completions for the genuine local-etale-algebra norm predicates. |
| CFT-L29 | Keep modulus/ray-class carriers and exponent-sensitive admissibility. |
| CFT-L30 | Keep trivial and narrow moduli; wide and narrow Hilbert fields differ at real places. |
| CFT-L31 | Keep idele-class topology and carrier; C_K itself is not compact. |
| CFT-L32 | Correct: a ray subgroup inside an open norm subgroup gives an admissible modulus, not automatically a least one. Conductor minimality remains CFT work. |
| CFT-L33 | Keep the surjective quotient and exact kernel for the Galois/ray-class comparison. |
| CFT-L34 | Keep placewise actions and norms; H2(I_L) uses relative local Brauer kernels, not unrestricted Br(K_v). |
| CFT-L35 | Keep the concrete idele-class norm and its descent input; no norm index is supplied by GNF. |
| CFT-L36 | Keep norm component formulas; restricted-product assembly additionally uses unramified unit norms. |
| CFT-L37 | Keep the character-conductor dictionary, with the CFT comparison still required. |
| CFT-L38 | Keep rational ray/cyclotomic dictionary; the n=2 mod 4 normalization is essential. |
| CFT-L39 | Keep invertible Picard carrier and conductor congruences; ringClassField only has quadratic-over-Q scope. |
| CFT-L40 | Keep decomposition-group splitting dictionary at unramified primes; Artin=1 implies splitting using its Frobenius generator property. |
| CFT-L41 | Keep ideal Artin prime values for admissible ray factorization; the direct comparison in CFT11 is separately recorded in the NumberFieldArithmetic packet. |
| CFT-L42 | Keep discriminant exponents; no Artin conductor has already been supplied by NFA6. |
| CFT-L43 | Valid Hilbert-product input for admissibility; already recorded by GlobalQuadraticForms. |
| CFT-L44 | Valid norm-index input for square/sign prescription; sign prescription also needs the product formula. Already recorded. |
| CFT-L45 | Valid cyclic Hasse-norm adapter; already recorded by GlobalQuadraticForms. |
| CFT-L46 | Valid product formula under sign transport, including real places; already recorded. |
| CFT-L47 | Valid cyclic Hasse norm for the ternary proof; already recorded. |
| CFT-L48 | Keep local-symbol comparison, with current CFT5 numbering and mixed-characteristic theorem hypotheses. |
| CFT-L49 | Keep cohomological-to-sign product formula; never reverse this dependency. |
| CFT-L50 | Keep the second QFI6E milestone only; the first quaternion comparison uses no CFT cohomology. |
| CFT-L51 | Keep Hilbert field and class-group reciprocity for the genus-field argument; wide and narrow variants remain distinct. |
| CFT-L52 | Keep the n=1 comparison only in the CFT coefficient/characteristic regimes. Higher/wild duality is not supplied. |
| CFT-L53 | Keep the n=1 arithmetic/geometric convention comparison; density alone is not an existence or completion theorem. |
| CFT-L54 | Remove: HL6 asks for a curve-case reduction. The number-field-only CFT12 does not supply global function-field correspondence, and the text does not specify a Spec(O_K) reduction. |
| CFT-L55 | Keep the abstract class-formation Artin map as function-field input; FA4 must establish its own formation and existence. |
| CFT-L56 | Keep finite local reciprocity for equal-characteristic completions; full wild existence and Weil abelianization are not supplied. |
| CFT-L57 | Keep finite local duality as the input to compact/derived extension, with coefficient and characteristic restrictions. |
| CFT-L58 | Keep finite local Tate pairings for Poitou-Tate; the global exact sequence is AGD work. |
| CFT-L59 | Keep number-field Brauer invariants and their sum; no function-field or global Poitou-Tate theorem is supplied. |
| CFT-L60 | Keep arithmetic Frobenius and inverse field-norm cyclotomic convention. |
| CFT-L61 | Keep global principal-idele reciprocity for infinity-type constraints. |
| CFT-L62 | Restrict the ring-class-field export to quadratic fields over Q. HE0 must construct its relative-CM order quotient separately. |
| CFT-L63 | Keep the ray-field construction refining the placeholder; selecting auxiliary primes and cyclic quotients remains ES1 work. |
| CFT-L64 | Keep the arithmetic/geometric Artin comparison for special points; CFT is not the CM reciprocity theorem. |
| CFT-L65 | Keep local Weil carrier, topology and degree for WD representations, in both characteristics; no full reciprocity isomorphism in equal characteristic. |
| CFT-L66 | Keep Artin convention for the CM dictionary; CM ideal/torsion reciprocity remains the consumer theorem. |
| CFT-L67 | Keep imaginary quadratic ring fields and ray fields; general reflex-field CM reciprocity remains CM work. |
| CFT-L68 | Keep primitive-root Kummer/invariant comparison with explicit twists and valid local coefficient regimes. |
| CFT-L69 | Keep number-field sum of invariants as input to higher-power symbol reciprocity. CFT14 itself exports only n=2. |
| CFT-L70 | Keep number-field invariants and zero sum for rational points; evaluation and the algebraic/cohomological Brauer comparison remain RP2 obligations. |
| CFT-L71 | Keep W_K with its Weil topology for continuous parameter cocycles; LocalFieldsRamification alone has no Weil carrier. |
| CFT-L72 | Remove the retired integration endpoint LI4. |
| CFT-L73 | Remove the retired integration endpoint LI4. |
| CFT-L74 | Remove the retired integration endpoint LI4. |
| CFT-L75 | Keep Hilbert/ray reciprocity for class-group/Galois inverse limits; inverse-limit exactness is Iwasawa work. |
| CFT-L76 | Keep admissible ray reciprocity for principal-unit/inertia exact sequences; semilocal closures remain the consumer construction. |
| CFT-L77 | Keep the class-group/Selmer comparison input; the Euler-system bound does not follow from class fields. |
| CFT-L78 | Keep principal-idele reciprocity as an input to source-scoped higher laws, which remain CA1 follow-on work. |
| CFT-L79 | Keep ray-class reciprocity for the tower; the character space and limits remain L0 work. |
| CFT-L80 | Keep global reciprocity as an inferred input to Mennicke-symbol arithmetic. It does not prove SK1 vanishing on its own. |
| CFT-L81 | Keep the GL1 arithmetic-Frobenius normalization test; no GL2 local correspondence is supplied. |
| CFT-L82 | Restrict to local arithmetic input with its twist and coefficient hypotheses. H2(mu_n) is not H2(mu_n tensor mu_n) without a chosen equivariant comparison. |
| CFT-L83 | Restrict the Brauer exact-sequence input to number fields; M3 function-field and S-integer cases need separate inputs. |
| CFT-L84 | Valid finite-local duality input for the Cassels stretch prerequisites; already recorded by EllipticCurves. |
| CFT-L85 | Keep generic finite Tate-Nakayama for the torus lattice component, with Tor1=0 discharged by lattice freeness; not a theorem for every torus complex. |
| CFT-L86 | Keep nonarchimedean local fundamental classes for torus pairings. Archimedean Tate modifications and the complex-level pairing remain ET0/AGD work. |
| CFT-L87 | Keep number-field idele-class formation for global torus pairings. Its invariant is descended after refinement, not an assumed surjection H2(I_L)->H2(C_L). |
| CFT-L88 | Keep local GL1 Artin convention as an input to determinant/central-character compatibility, not the whole GL2 correspondence. |
| CFT-L89 | Keep the geometric convention comparison. Full equal-characteristic torus reciprocity needs the excluded wild extension. |
| CFT-L90 | Keep global arithmetic-to-geometric conversion; CM heights and the Gross-Zagier normalization are additional. |
| CFT-L91 | Keep quadratic-order ring fields for the elliptic CM cycles; no higher-degree order field is supplied. |
| CFT-L92 | Keep the local Brauer invariant calculation at the cyclotomic prime; this alone is not the tame-kernel theorem. |
| CFT-L93 | Keep global reciprocity conventions for degree-one Hecke/Artin comparison; no general Artin holomorphy is asserted. |
| CFT-L94 | Keep the global geometric-Artin conversion, not an unnormalized local character. |
| CFT-L95 | Keep unramified Artin/Frobenius prime values for the GL1 consistency example. |
| CFT-L96 | Keep the topological Weil carrier; constructing the continuous action and Drinfeld lemma is HS1 work. |
| CFT-L97 | Keep Q_p arithmetic-Artin convention in determinant/central-character comparison; Colmez functor remains the consumer theorem. |
| CFT-L98 | Keep finite-idele/ideal valuation dictionary as one input to primeIdeleClass; the GNF4 map is not itself a chosen prime-idele section. |

## Overlap decisions

**CFT-O01: keep.** Keep existing upstream interfaces and implement the comparisons through one shared generic restriction isomorphism. The algebraic/separable Galois group equivalence is common, but continuity and coefficient-action transport are part of the contract. Do not remove or relocate frozen names in these existing roadmaps; a proposed shared-interface extension belongs in a separately scoped Part II. No claim is made that the whole comparison is already built.

**CFT-O02: keep.** Reuse the pinned TauCeti.UnitsCoeff and its discrete continuous action on the separable-closure group. Preserve CFT unitsRep through the required group/coefficient dictionary and the smooth TopRep packaging. Equality of bare additive groups does not eliminate equivariant transport, and there is no justification to delete a frozen upstream name or change LocalFieldsRamification.

**CFT-O03: keep.** Use GNF7 openness, quotient surjectivity/kernel, and GNF2 finite_rayClassGroup to discharge the CFT13 packaging lemmas. Keep the frozen interfaces; this is reuse plus comparison, not a second proof of ray finiteness and not a proposed move of an existing upstream layer.

**CFT-O04: keep.** Keep both upstream scopes and the mandated CFT -> QFI direction. CFT14 must supply the cohomological local-value calculations needed by its existing quadratic-reciprocity target; QFI6C retains its norm-equation calculation and checks agreement through 6E. The reviewer does not move quadratic reciprocity or make CFT depend on QFI. A more general reusable computation interface may be proposed in Part II, with its proof route audited before adding an edge.

**CFT-O05: keep.** Keep local Artin normalization tests and the field-generic cup-norm theorem separate, comparing them downstream through the coefficient and sign dictionaries. QFI7C carries invertible 2 rather than a local-field hypothesis. No QFI -> CFT edge is admitted.

**CFT-O06: keep.** The overlap in elementary auxiliary-prime/disjointness arguments is real, but keep the source roadmap's explicit ban on Chebotarev inputs unchanged. Chebotarev7.1-7.4 outlines a reciprocity-free construction; that observation does not authorize importing the entire stage or weakening CFT10. A separately proved, precisely isolated arithmetic helper could be proposed in Part II. No dependency is added from an unaudited proof route, and the later tagged-fibre assertions of Chebotarev7.5 are not used.

**CFT-O07: rescope.** Propose HL3 reuse of CFT7 map normalization and CFT8 correspondence only in their actual regimes: all finite K/Q_p and prime-to-p equal characteristic. HL2/HL3 retain the genuinely new wild characteristic-p and higher-dimensional constructions. Their curriculum still requires primary proof-leaf extraction, so this recommendation does not declare a proved complete wild supplier or infer injectivity from density.

**CFT-O08: rescope.** Propose HE0 import the quadratic-over-Q ringClassField/Pic/Artin wrapper and retain its conductor-change kernels, unit indices and dihedral action. For general CM K/F, HE0 constructs and proves its relative order/idele quotient, then applies CFT12's number-field correspondence (CFT-L103). Do not broaden CFT13. General-number-field orders/Pic are supplied by GNF11; their relevant relative specialization still needs an explicit comparison.

**CFT-O09: rescope.** Propose T7 import CFT14 for n=2 and CFT10 sumLocalInv_eq_zero for the number-field higher-power calculation, retaining the actual twisted-symbol and primitive-root comparison. The nonquadratic product formula remains a source-qualified T7/M3 application or a future CFT Part II proposal. Do not rewrite CFT14 to promise all n, and do not apply number-field global invariants to function fields.

**CFT-O10: rescope.** Propose RP2 reuse of CFT5/10 local invariants and the number-field zero-sum theorem. RP2 keeps evaluation, adelic pairing, finite support and comparison between its algebraic/cohomological Brauer carriers. Rational-point orthogonality follows only after this commuting comparison; importing an invariant name alone does not construct the pairing.

**CFT-O11: keep.** Reuse the existing Mathlib legendreSym.quadratic_reciprocity with prime, oddness and distinctness hypotheses. CA1 integrates that elementary result; CFT14 supplies its independently specified derivation from the Hilbert product formula. Keep both comparison tasks without assigning CA1 ownership of a theorem already proved in Mathlib.

## Pinned library reuse

I consulted the reviewed AUDIT-03 entries before treating roadmap targets as future work: CFT0, 1, 5 and 14 are partly built, the other eleven layers are marked not built. The following positive reuse claims were independently checked in exact source blobs; audit prose alone was not treated as proof of a declaration.

| Pin / source | Verified public declaration and scope |
|---|---|
| Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, `RepresentationTheory/Homological/TateCohomology/Basic.lean`, lines 140/145 | `tateCohomologyFunctor`, `tateCohomology` on the existing finite-group carrier. This is not Tate's theorem or an all-integer cup product. |
| Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, `RepresentationTheory/Homological/TateCohomology/LowDegree.lean`, lines 88/302 | `H0IsoNormQuotient` for a finite group representation over a commutative ring; `HNegTwoAddEquivAbelianization` for trivial integral coefficients. These are reusable low-degree identifications, not reciprocity. |
| Same Tau Ceti pin, `NumberTheory/ClassFieldTheory/Formation/Basic.lean`, line 123 | `Formation` is an abbreviation of `SmoothDiscreteTopRep` over a compact totally disconnected topological group, at universe zero. Do not rebuild a representation bundle. |
| Same Tau Ceti pin, `FieldTheory/GaloisCohomology/Coefficients.lean`, lines 90–117 | `UnitsCoeff` and `KummerCoeff` carry the discrete topology and continuous separable-Galois action. Reuse them with the required equivariant dictionary, not as bare abstract groups. |
| Same Mathlib pin, `NumberTheory/LegendreSymbol/QuadraticReciprocity.lean`, line 107 | `legendreSym.quadratic_reciprocity` assumes prime p,q, p≠2, q≠2 and p≠q. Its RHS uses `(-1)^(p/2*(q/2))`. CFT's derivation from the product formula is distinct from constructing this existing elementary result. |

Source bytes were checked against the recursive trees at those pins (five files). No claim is made that the full local invariant, local duality, global correspondence, generic Tate–Nakayama theorem or a missing comparison has thereby been implemented. No Lean compilation was run.

## Document-wide quote locations

For these 15 occurrences only, line numbers are relative to the owning roadmap's raw README at the guarded atlas snapshot, rather than relative to a stage excerpt. All other evidence is stage-local. The JSON holds the literal text in each case.

| Link / evidence | Owning document | README line |
|---|---|---|
| CFT-L02 / 3 | tauceti:TauCetiRoadmap/ClassFieldTheory | 241 |
| CFT-L10 / 2 | tauceti:TauCetiRoadmap/ClassFieldTheory | 157 |
| CFT-L58 / 3 | ArithmeticGaloisDuality | 15 |
| CFT-L60 / 3 | MordellLawrenceVenkatesh | 47 |
| CFT-L65 / 3 | ArithmeticGaloisRepresentations | 15 |
| CFT-L66 / 3 | ComplexMultiplicationAndExplicitReciprocity | 5 |
| CFT-L68 / 3 | K2SymbolsBrauer | 8 |
| CFT-L69 / 2 | K2SymbolsBrauer | 8 |
| CFT-L77 / 3 | EulerSystemsCyclotomicMainConjecture | 18 |
| CFT-L79 / 3 | AutomorphicPadicLFunctions | 18 |
| CFT-L82 / 3 | MotivicEtaleKTheory | 14 |
| CFT-L88 / 3 | GL2AutomorphicRepresentationsAndTransfer | 15 |
| CFT-L90 / 2 | tauceti:TauCetiRoadmap/ClassFieldTheory | 440 |
| CFT-L94 / 2 | tauceti:TauCetiRoadmap/ClassFieldTheory | 440 |
| CFT-L98 / 2 | tauceti:TauCetiRoadmap/ClassFieldTheory | 1508 |

## Validation

- `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_ClassFieldTheory.json`: 0 errors, 0 warnings; no recorded-stage cycle.
- `python3 research/blueprint/intake.py check-files research/blueprint/links/tauceti_TauCetiRoadmap_ClassFieldTheory.json research/blueprint/reviews/REV-LINK-tauceti_TauCetiRoadmap_ClassFieldTheory.md`: 0 errors.
- Independent assertions: 223 literal quotations, all 216 other active IDs exactly once, 91 unique emitted pairs, no cross-packet duplicate, eight referenced pairs still present at their owner paths, all 98 original decisions, all eleven overlaps, five source-blob checks, and the three `addedBy` markers.
- Only the two authorized deliverables are submitted. The original packet blob and absent-report guards, plus every current input blob, are rechecked before creating the publication tree.
