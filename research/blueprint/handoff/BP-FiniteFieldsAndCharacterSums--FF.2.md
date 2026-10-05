# Handoff: BP-FiniteFieldsAndCharacterSums--FF.2

Agent: Codex. Session: codex-kKshfL. Issue: #6349. Branch: codex-kKshfL-ff2.
The bot confirmed the session claim before any work. This run claims only this job.

## Submission status

**Complete target-level pass; FF.2 planned, not closed.** The new part packet has 31 nodes: 3 definitions, 2 constructions, 4 lemmas, 17 theorems, 3 comparisons and 2 applications. It has 24 API items, 20 definition/construction tests, 6 candidate planets, 14 checked baseline declarations, 19 supplier requests, 10 explicit gaps and 5 restructuring proposals. Every node keeps implementationStatus unchecked. All 88 accepted parent FF.2 nodes are imports, and the parent packet is unchanged. The pass stops because every in-scope target is accounted for at target level; the protocol does not require filling the node budget after that point.

The reader contains about 14,000 words. It specifies conventions, every new object/theorem, construction/proof steps, direct imports, all API items and tests, supplier contracts, source routes, source correction and assembly boundaries. The new part does not claim to re-certify the entire parent. Its target inventory preserves the parent's original scopes and gaps.

The source-route ledger has 30 entries: 19 current Weil I FF.2 application routes, its original twentieth item now assigned to the shared GOS supplier, both local conductor items, both Weil II family routes and all six Browning–Sawin routes. The GOS and local conductor entries expressly preserve their respective owners. A proposed stage is never used as an already registered prerequisite identifier.

## What this part provides

- A primitive predicate on the existing MulChar carrier, its field/quotient/isomorphism/product API, and a finite-ring nonunit-shift and Gauss-norm proof. The reduction-on-units surjection is proved directly by eventual periodicity and idempotents, without a reducedness assumption.
- The top-coefficient perfect pairing on AdjoinRoot(g), including repeated factors, and the odd primitive-modulus functional equation with the complete modulus degree. The even-character variant is excluded explicitly; the squarefree parent theorem stays squarefree.
- The direct cyclic Artin–Schreier break calculation over perfect residue fields. It supplies a rank-one local calculation, while the actual general geometric conductor API remains a single AGR extension.
- A genuine smooth-leading coefficient scheme, its local models, the historical relative surface-product compactification, the alternative Weil II local-acyclicity mechanism, family lissity, relative concentration/rank/purity and duality by transport of the Fermat pairing. The last proof does not assert vanishing inertia on every exceptional boundary divisor.
- Positive-rank hyper-Kloosterman sums, the compact-direct-image sheaf, the finite-étale-algebra Gauss realization, fiber induction, local monodromy and bound. At zero the sum is (−1)^(k−1) and the sheaf stalk has trace 1. Zero extension is at infinity, not across the origin. The Koszul sign is explicit.
- Katz's A and B Betti constants, a derived projective factor 8 and zeta-ratio factor 9, generic-section Albanese bound, the all-extension Bombieri–Sperber expansion, equality of highest-weight spectra and bounded-family Lang–Weil. Affine Lefschetz, the Euler-degree bound, rational Albanese and quantitative presentation inputs remain precise supplier gaps.
- Connected-cover Chebotarev with a nontrivial constant field. The exact twist identity sums every geometric component separately; component counts need not agree. The density is |C∩Γ_r|/|H|. Uniformity specifies bounded equivariant embedding and boundary data, rather than only a group order.
- Correlation with its full geometric-coinvariant Frobenius main term, geometric-isotypic quasi-orthogonality, the Möbius stabilizer subgroup API and cancellation outside that stabilizer. Arithmetic semisimplicity and stabilizer representability are not assumed.

## Suggested Lean and check receipts

The suggested file **elaborates with exit status 0, with exactly 28 declaration-uses-admission warnings and no other diagnostics**, using lean-check in the shared build at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Memory was checked before every invocation and exceeded 20 GB. No language server, package update, cache download or library build was started.

Executable node signatures cover IsPrimitiveMulChar, primitiveFiniteRingGaussNorm, polynomialQuotientFrobeniusPairing, hyperKloosterman and hyperKloostermanBound. Nine packet API signatures and eight packet tests are executable; the file also has the concrete ℤ/4ℤ Gauss-value acceptance instance. Arithmetic support definitions have actual function bodies on baseline carriers and admitted structure-law proofs, not opaque proposition fields.

The other three definition/construction objects lack the required geometric carriers: UniversalPolynomialFamily, HyperKloostermanSheaf and GeometricMobiusStabilizer. Their 15 API items and 12 tests have their exact names and mathematical signatures in the carrier ledger. All 31 packet node ids appear there, including the nonexecuted named geometric theorems and the primitive-modulus series theorem which awaits the parent's series conventions. These are omissions under PROTOCOL.md §13, not executable geometric signatures. A compiling file does not establish those constructions or discharge gap/prototype-carriers.

Validation receipts:

- python3 scripts/check_blueprint.py research/blueprint/packets/FiniteFieldsAndCharacterSums--FF.2.json: 0 errors and 0 warnings; complete packet, one planned stage, zero closed stages.
- All API/test names occur in the reader and suggested file, either as executable signatures/examples or in the explicit carrier ledger.
- All 31 node statements, 24 API contracts and 20 test contracts occur in the reader; every new node id is disjoint from the parent.
- The dependency graph is acyclic. Direct foreign-stage consumers have a matching request. All definition/construction APIs and tests meet their minimum sizes.
- All 12 source SHA-256 hashes agree with the public PDFs downloaded for this pass. All node excerpts match normalized extracted text; Sommes trigonométriques p. 221 was also inspected as an image to distinguish extension at infinity from extension across 0.
- The changed-path and whitespace checks pass. Only this issue's three deliverables and this handoff are submitted. No private paths, source PDFs or extracted texts are committed.

## Confirmed red-team findings

| Finding | Handling |
| --- | --- |
| RT-AREA-finitefields/3 | One GOS Part II owner after EDC.2; continuation of the parent request and Deligne-74 route 6. AGR's arithmetic stage is a near miss for geometric k̄((t)) conductors, so its extension is requested. The new direct break calculation supplies the rank-one input. The classical independent parent routes are retained. |
| RT-AREA-finitefields/4 | The parent's several-variable numerical bound is imported. Distinct universal-family, local-model, relative compactification, local-acyclicity, lissity, family-cohomology and duality targets account for its missing Weil I/II mechanism. |
| RT-AREA-finitefields/5 | The inherited multiplicative exception is c·g^ord(χ), not an arbitrary perfect power. The reader retains the cubic-character X² control and constants which are not ground-field powers; the mixed condition stays separate. |
| RT-AREA-finitefields/10 | Recorded as a maintainer-only upstream integration task. No queue, decomposition or DECISIONS edits are authorized or made. |
| RT-AREA-etale/7 | Uniform bounded families and constant-field coset Chebotarev are planned at FF.2 with their proof gaps. BN-23/87 and HW-16/24,/88 routing rejections need maintainer review; no gate is overridden. |
| RT-AREA-etale/14 | The accepted parent Lψ and global Fourier objects remain the sole owners. LPV.0 gets a local/global stationary-phase comparison request and the shared coefficient generalization. GeneralBasesFourier is a proposal, not a registered imported node. |

## Precise remaining obligations

No stage is mathematically closed by this submission. The following gaps must be discharged at their identified owners before the affected targets close.

### gos-owner

The parent request and PAPER-DELIGNE-74 route 6 identify one Part II extension after EDC.2. No registered stage/node presently states the theorem. The Raynaud source read is finite torsion; its complete E_λ passage must be proved at that owner. The genus, boundary count and Swan terms remain explicit. The parent’s cohomological curve bounds remain conditional on this shared input.

Consumers: `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-cohomology`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-fiber-cohomology`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-local-monodromy`, `FiniteFieldsAndCharacterSums:FF.2/trace-correlation-main-term`.

### geometric-conductor

The rank-one Artin–Schreier break is proved by the direct uniformizer calculation in this packet. The actual ℓ-adic Swan definition and tensor/break API over k̄((t)) still need AGR’s equal-characteristic extension. No unramified base-change theorem from a finite-residue-field local-fields stage is assumed.

Consumers: `FiniteFieldsAndCharacterSums:FF.2/geometric-artin-schreier-break`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-fiber-cohomology`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-local-monodromy`, `FiniteFieldsAndCharacterSums:FF.2/trace-correlation-main-term`, `FiniteFieldsAndCharacterSums:FF.2/mobius-autocorrelation-bound`.

### surface-resolution

Weil I 8.9/8.10 needs termination, equivariance and étale/product-compatible resolution of the specific normalized surface pair; a relative normal-crossings boundary makes ordinary and compact cohomology locally constant. Duality is checked at the clean one-variable Fermat fiber and transported through this family, rather than asserting inertia vanishing along every exceptional boundary divisor. SF.4 does not yet provide this contract. The Weil II lissity proof does not depend on this historical route.

Consumers: `FiniteFieldsAndCharacterSums:FF.2/relative-artin-schreier-compactification`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-boundary-clean-duality`, `FiniteFieldsAndCharacterSums:FF.2/bombieri-sperber-albanese-expansion`.

### general-base-acyclicity

LPV.0’s trait contract does not provide all of Weil II 3.7.3 over the coefficient scheme. Its requested locally constant-product/proper-pushforward theorem and DWP.5’s 1.8.12 family-weight constancy must be exported with actual carriers before the relative nodes can be closed.

Consumers: `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-local-acyclicity`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-lissity`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-cohomology`.

### affine-lefschetz

Katz’s smooth affine induction uses a generic affine hyperplane with isomorphism/injection in the specified ordinary-cohomology degrees. Projective smooth weak Lefschetz is a near miss. A single Part II extension at the duality/Lefschetz owner is requested.

Consumers: `FiniteFieldsAndCharacterSums:FF.2/smooth-affine-betti-bound`.

### explicit-euler-degree

Katz supplies the target formula and the Betti-number deductions, but the full Dwork/Newton-polytope degree and ℓ-adic Euler comparison proof of |χ_c|≤2^r(r+1+rδ)^N was not decomposed. The RD.6 extension request states that exact theorem. This gap propagates through A,B and the projective constant to uniform Lang–Weil.

Consumers: `FiniteFieldsAndCharacterSums:FF.2/smooth-affine-betti-bound`, `FiniteFieldsAndCharacterSums:FF.2/explicit-projective-betti-bound`, `FiniteFieldsAndCharacterSums:FF.2/uniform-lang-weil-family`.

### rational-albanese

The existing abelian-scheme A2 stage does not construct Alb_w of a general singular variety; SF.3’s smooth-plane-curve formula does not prove the normalized singular-section inequality. Their Part II contracts, together with Picard/Tate and surface comparisons, are needed to close the parent uniform Lang–Weil proof.

Consumers: `FiniteFieldsAndCharacterSums:FF.2/albanese-linear-section-bound`, `FiniteFieldsAndCharacterSums:FF.2/bombieri-sperber-albanese-expansion`, `FiniteFieldsAndCharacterSums:FF.2/top-weight-albanese-comparison`.

### bounded-presentations

For the fixed-X pencil proof, bound the center, bad fibers and their cohomology uniformly using fixed embedding data. For arbitrary affine bounded equations, supply quantitative saturation/homogenization bounds rather than taking an unchecked projective closure. For Chebotarev twists, descend a finite G-stable generating linear system and its bounded boundary presentation. These are separate precise SF.0/SF.1 requested extensions.

Consumers: `FiniteFieldsAndCharacterSums:FF.2/bombieri-sperber-albanese-expansion`, `FiniteFieldsAndCharacterSums:FF.2/uniform-lang-weil-family`, `FiniteFieldsAndCharacterSums:FF.2/constant-field-coset-chebotarev`.

### local-global-fourier

The global FT and L_ψ stay at their accepted parent FF.2 owner; the unregistered GeneralBasesFourier Part II owns local kernels/vanishing cycles. The LPV.0 request specifies the stationary-phase comparison and normalization. Laumon §§2.3–2.4 were read for this contract, not fully decomposed. Abe A19’s torsion/local-regular-finite-Z_ℓ coefficients exceed the parent’s E-field character sheaf: commission the shared coefficient-change API at SF.2/EDC.0 before marking those entire items supplied.

Consumers: `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-local-acyclicity`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-local-monodromy`.

### prototype-carriers

The pinned libraries lack the actual smooth-leading open coefficient scheme with its étale sheaf category, Rf!, local conductors, Alb_w comparison objects and Möbius sheaf pullback stabilizer. Their signatures/API/tests are documented in the prototype name ledger and intentionally omitted from executable Lean under protocol §13. The two representable definitions use baseline MulChar and finite-field sum carriers; no theorem is replaced by a Prop-valued placeholder.

Consumers: `FiniteFieldsAndCharacterSums:FF.2/universal-smooth-leading-polynomial-family`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-sheaf`, `FiniteFieldsAndCharacterSums:FF.2/geometric-mobius-stabilizer`.

## Requests to supplier roadmaps

The packet contains the following 19 exact requests. No messages were sent to other workers or maintainers; the requests are the reviewable packet records.

- **SchemeAndStackFoundations:SF.0**: Actual affine coefficient and projective schemes, smooth loci and projective singularity incidence; normalization commuting with étale maps; geometric component and dimension conventions. Extension needed: bounded homogeneous generators after saturation/projective closure in terms of (N,r,δ), and bounded degree/number of exceptional loci in a fixed generic hyperplane pencil. The existing stage is not credited with a quantitative elimination theorem.
- **SchemeAndStackFoundations:SF.1**: Effective Galois descent of each quasi-projective component under g⁻¹Frob_q^r, performed separately over F_{q^r}; descent of a finite G-stable generating linear system and its projective embedding, with equation degrees and boundary presentation unchanged by twisting. Use a finite span of generating sections and their G-orbits, not all H⁰ on a quasi-projective scheme.
- **SchemeAndStackFoundations:SF.2**: Genuine étale sites, finite-character torsor pushout and π₁ representations; constructible E-coefficients, compact direct image with base change, projection formula, Künneth (including degree signs), trace formula over every finite extension, excision/Mayer–Vietoris, affine vanishing and proper pushforward of locally acyclic complexes. Supply the specialization/local-monodromy argument of Sommes trig. 7.9–7.12 for R^(k−1)π!, not the invalid implication that constant stalk dimension alone gives lissity.
- **SchemeAndStackFoundations:SF.4**: Part II extension: equivariant resolution of the normalized Artin–Schreier surface models of Weil I 8.8–8.9, with termination, étale/smooth-product compatibility, relative gluing and relative normal-crossings boundary; also resolution of projective normal surfaces for Ghorpade–Lachaud 10.9/11.7. No general resolution in positive-characteristic dimensions≥3 is requested or assumed.
- **SchemeAndStackFoundations:SF.3**: Part II extension of the smooth-curve contract: normalization genus of a possibly singular integral projective degree-d curve is at most (d−1)(d−2)/2 via generic birational plane projection and arithmetic-genus comparison. The smooth plane-curve genus formula alone does not suffice.
- **EtaleDualityAndPerverseSheaves:EDC.0**: Actual constructible E-adic derived categories and their cohomology sheaves, on scheme étale sites, with support and coefficient-extension conventions. These are the carriers of L_ψ, Rπ!, the universal family and pullback isomorphisms; no private Prop-valued carrier substitutes are planned.
- **EtaleDualityAndPerverseSheaves:EDC.2**: Poincaré duality and the Frobenius-equivariant H²_c=geometric-coinvariants(−1) formula on smooth affine curves; clean extension from vanishing inertia and compatibility with deck-character decomposition; Gysin and duality for the normal-surface Albanese comparison. Continue the one existing parent GOS request: for C/k smooth projective connected of genus g, U=C−S, F lisse E_λ with ℓ≠char k, χ_c(U,F)=rk(F)(2−2g−|S|)−Σ Sw_s(F). Register its single Euler-characteristic supplier after EDC.2, as EtaleDualityAndPerverseSheaves Part II: CurveEulerCharacteristic, coordinated with PAPER-DELIGNE-74 route 6. Prove finite-torsion/lattice/inverse-limit/coefficient-extension passages; Raynaud Part I alone is not yet an E_λ-adic proof.
- **EtaleDualityAndPerverseSheaves:EDC.4**: Part II extension: for smooth connected affine V⊂A^N of dimension n≥2, a dense open of affine hyperplanes gives smooth connected V∩H with H^i(V,Q_ℓ)→H^i(V∩H,Q_ℓ) isomorphism for i≤n−2 and injection for i=n−1. EDC.4 presently exports projective smooth weak Lefschetz and smooth-center blowup, not this affine theorem.
- **LefschetzPencilsAndVanishingCycles:LPV.0**: Part II general-base extension: local acyclicity of a constructible complex pulled back from a fixed étale local product over any finite-type coefficient base, and proper pushforward then lissity with base change, as SGA 4½ [Th. finitude] 2.16/A.2 used by Weil II 3.7.3. Also coordinate the proposed GeneralBasesFourier extension: compare compactified global Rpr₂!(pr₁*K⊗L_ψ(xy))[1] nearby/vanishing cycles with the local R¹Φ kernels π/π′, π′/π and 1/(ππ′), including finite singularities and infinity. Fix geometric Frobenius, shift [1], inversion x↦−x and twist (−1), and Laumon 2.4.3.3’s exclusions of geometrically constant subquotients in local duality. GeneralBasesFourier is a proposal, not a registered prerequisite id.
- **ArithmeticGaloisRepresentations:R01.3**: Part II equal-characteristic extension: conductors of continuous ℓ-adic representations of geometric complete DVRs k̄((t)), ℓ≠p, using finite wild inertia and break decomposition; integrality/additivity and the lower/upper finite-image conductor relation. Include Sw(V⊗W)≤rk(W)Sw(V)+rk(V)Sw(W), tame unipotent invariants, and twisting by a strictly larger rank-one break. R01.3’s arithmetic wording and finite-residue-field LocalFieldsRamification do not already export this geometric contract. FF.2 proves its rank-one Artin–Schreier break, not a second general conductor definition.
- **DeligneWeightsAndPurity:DWP.5**: Weil II 1.8.12: weights of a mixed lisse sheaf are constant on a connected normal parameter scheme, for a fixed embedding, with a separate all-conjugate application for algebraic sheaves. This family-weight constancy is additional to generic local-weight terminology.
- **DeligneWeightsAndPurity:DWP.7**: The actual sharp direct-image bounds: H^i_c of a weight-zero algebraic sheaf has weights≤i, and ordinary cohomology on smooth varieties has the dual lower bounds. State both fixed-embedding ι versions and algebraic all-conjugate versions; purity on the clean image follows from the two bounds. Do not identify these with a numerical assertion about an arbitrary trace function.
- **DeligneWeightsAndPurity:DWP.8**: Geometric semisimplicity of pure lisse sheaves, weight filtration/quotients and generalized Frobenius eigenvalue conventions. Arithmetic semisimplicity is not asserted; traces of powers remain valid with Jordan blocks.
- **DeligneWeightsAndPurity:DWP.1**: Weil weight-one bounds for the characteristic roots of Frobenius on an abelian variety, and compatibility with its Tate-module Frobenius convention and isogeny invariance, used for Alb_w spectra.
- **AbelianSchemesAndArithmeticModuli:A2**: Part II extension: the rational-map universal Albanese–Weil variety of a general projective integral variety, functoriality under rational maps and purely inseparable isogeny invariance; normal-projective Picard/Tate comparison and generic-linear-section maps of Ghorpade–Lachaud 9.4/9.6. A2’s existing abelian-scheme dual/Picard functor is imported as the foundation but is not a general singular-variety Albanese. Distinguish Alb_w from Alb_s and Pic_w from Pic_s.
- **PadicDifferentialEquationsAndRigidCohomology:RD.6**: Part II extension: the Adolphson–Sperber Euler characteristic degree bound |χ_c(V,Q_ℓ)|≤2^r(r+1+rδ)^N for a closed affine V⊂A^N defined by r equations of degree≤δ, including singular/nonreduced V, with rigid/exponential-sum degree computation and comparison to ℓ-adic Euler characteristic. RD.6 presently plans traces/Fourier/weights, not this explicit Newton-polytope degree theorem. Its complete p-adic proof is not claimed decomposed here.
- **FunctionFieldArithmetic:FA.5**: The finite-cover constant-field quotient and arithmetic Frobenius coset convention, G/H≅Gal(F_{q^m}/F_q), plus curve Chebotarev with genus/conductor-controlled errors. FF.2 extends the variety twist application to this convention and imports the one-variable theorem.
- **WeilConjectures:WC.5:power-sum-converse**: Import the finite-spectrum power-sum estimate recorded in the parent; extend its proof explicitly to a finite signed sum Σc_jλ_j^r, c_j∈ℤ, by grouping equal roots and using exponential-sequence independence. If it is O(B^r) for every r, all nonzero coefficients on roots of modulus>B vanish. Used with B=q^(n−1) and candidate roots of modulus q^(n−1/2).
- **tauceti:TauCetiRoadmap/AlgebraicCurves#layer-8-constant-field-extensions-galois-ramification-and-inseparability-**: Import the existing arbitrary-residue lower ramification/completion bridge as its document states. Do not import its explicitly excluded upper-numbering theorem for infinite residue fields. FF.2’s direct cyclic calculation and the separate AGR conductor extension supply that missing geometric case.

## Public sources read and proof scope

- **kowalski-expsums-elementary**: [public version](https://people.math.ethz.ch/~kowalski/exponential-sums-elementary.pdf), accessed 2026-10-05. Chapter 4, primitive Dirichlet characters, Proposition 4.8 and (4.11)–(4.12), Proposition 4.11 and (4.15)–(4.16), pp. 41–47; parent corrections E709/E720/E721/E723 consulted.
- **DELIGNE-SGA45-SOMMES-TRIG**: [public version](https://publications.ias.edu/sites/default/files/Number32.pdf), accessed 2026-10-05. §3.2(3.2.1), §3.5(3.5.4) and §4.3/4.11–4.12, pp. 189–191, 196–202; §§7.1–7.15, pp. 218–226: product fibers, cohomology, local monodromy and induction; page 221 inspected as an image; §§5–6 screened for scope: algebraic Hecke characters are not FF.2 target inputs.
- **DELIGNE-WEIL-I**: [public version](https://www.numdam.org/item/PMIHES_1974__43__273_0.pdf), accessed 2026-10-05. §8.4–8.13, pp. 302–306: trace decomposition, compactification, local models, family, Künneth and the local break.
- **DELIGNE-WEIL-II**: [public version](https://www.numdam.org/item/PMIHES_1980__52__137_0.pdf), accessed 2026-10-05. §3.7.2–3.7.4, pp. 215–216: universal family, local acyclicity/lissity and Fermat reduction; §1.8.10–1.8.13, pp. 177–178: weight constancy/purity on connected parameter bases.
- **FKMS-APPLIED-L-ADIC**: [public version](https://arxiv.org/pdf/1712.03173v3), accessed 2026-10-05. §4.3.3/Theorem 4.4, hyper-Kloosterman normalization; §5, (5.1)–(5.4) and Theorem 5.2, pp. 13–14: full Hom main term and geometric isotypicity; §6.1–6.3 Fourier conventions and §7.1, Definition 7.1/Proposition 7.2/Examples 7.3, pp. 19–20; classification screened, not planned.
- **LAUMON-FOURIER**: [public version](https://www.numdam.org/item/PMIHES_1987__65__131_0.pdf), accessed 2026-10-05. §1.2 pp. 140–142, global transform normalization, via parent verified citations; §2.1–2.4 pp. 150–164: geometric local conductors, local kernels and their nearby/vanishing-cycle comparison; 2.4.3.3 local-duality exclusions; proof §2.5 not fully decomposed.
- **GHORPADE-LACHAUD-02**: [public version](https://arxiv.org/pdf/0808.2169v1), accessed 2026-10-05. §5 explicit Betti bound; §9.1–9.6 rational Albanese/Picard and generic sections; §10.7–10.9 highest odd weight; §11.1–11.7 uniform Lang–Weil and the Bombieri–Sperber pencil proof.
- **KATZ-BETTI**: [public version](https://web.math.princeton.edu/~nmk/BettiSum14.pdf), accessed 2026-10-05. Part I: axiomatic setup, Theorems 1–3 and their proofs, pp. 1–4; Part II read for coefficient scope; its compatible-system generalization is not a target here.
- **SERRE-RESIDUE**: [public version](https://www.numdam.org/item/BSMF_1961__89__105_0.pdf), accessed 2026-10-05. §4.4, Lemma 4′, pp. 144–145; equal-characteristic Artin–Schreier case.
- **RAYNAUD-GOS**: [public version](https://www.numdam.org/item/SB_1964-1966__9__129_0.pdf), accessed 2026-10-05. Exposé 286, Part I: Swan module and Euler characteristic theorem, pp. 129–140.
- **MEAGHER-CHEBOTAREV**: [public version](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/72DECC8EB5E120B1218B4A3AC4129C62/S0004972718000448a.pdf/a-simple-proof-of-chebotarevs-density-theorem-over-finite-fields.pdf), accessed 2026-10-05. Theorem 1.1 and proof, pp. 196–200; Appendix A, Proposition A.2, pp. 201–202.
- **ADOLPHSON-SPERBER-DEGREE**: [public version](https://www.numdam.org/item/CM_1988__68_2_125_0.pdf), accessed 2026-10-05. Introduction and §5.22–5.27; Euler-bound input only, not a decomposition of the full p-adic proof.

Ekedahl's 1990 private/nonpublic lemma was not read; the publicly available Meagher twist proof supplies the alternative. The general local-conductor, relative-resolution, rational-Albanese and Adolphson–Sperber supplier proofs are not certified as read/decomposed: the exact missing contracts are the gaps above. Raynaud's read formulation is finite torsion and does not itself prove the E-adic passage. Laumon's §§2.1–2.4 were read for the comparison and kernel conventions; §2.5's proof was not fully decomposed. Ghorpade–Lachaud's cited Lang/Chow arguments for general Albanese and sections remain an A2 supplier proof request. This reading boundary is explicit in the packet sourceVersions ledger.

The new source observation E800 concerns Meagher Appendix A, Proposition A.2, p. 201: all H⁰ of a very ample line bundle on a quasi-projective scheme need not be finite-dimensional. A¹ with its trivial line bundle gives k[t]. A finite generating linear system and the finite span of its G-orbits repair the descent step. The public publisher/title/erratum search found no correction; novelty is not established and this finding awaits independent verification. Parent source corrections are imported without duplicate entries.

## Assembly and follow-up

Independent review should check the exact hypotheses and source matches, especially the general finite-ring primitivity proof, the simultaneous Kloosterman induction, the finite-spectrum signed converse, the pencil uniformity gap and the sum over component twists. It should verify E800 independently.

Follow-up work registers the one GOS supplier, establishes the requested geometric conductor and general-base acyclicity interfaces, decomposes the surface-resolution, affine Lefschetz, explicit Euler-degree and rational-Albanese inputs, supplies quantitative presentation/descent bounds, and then replaces the geometric carrier ledger by real signatures. Local/global Fourier comparison retains its inversion, shift and Tate-twist conventions. These tasks extend existing owners as Part II rather than adding parallel foundations to FF.2.

Assembly must reconcile the parent's six FF.2 planets with the six part-local candidates. The packet proposes a combined six and a subdivision; these are proposals, and this part does not edit atlas placement. Maintain the parent ids and coordinate the unresolved upstream integration/routing notes. The parent packet already exceeds the node budget; this pass changes only the new part and does not add to it.

No scratch asset is needed to resume or review. Public URLs, hashes, exact source reading scopes, all mathematical contracts and checks are in the submitted files. The scratch directory is removed after the pull request opens. This run stops after this pull request and does not claim another job.
