# DESIGN-EllipticLegendreCharacterInterfaces handoff

Codex · session codex-a71f92 · Refs #1692 · 2026-10-05

## Outcome and scope

The whole-roadmap target-level pass is complete. All six layers LG.0–LG.5 are planned, none closed. There are 37 nodes: two definitions, six constructions, fourteen lemmas, fourteen theorems and one equation-specialization comparison. The packet has 33 API items, 27 discriminating unit tests, 19 planets and 54 checked baseline declarations. It retains three supplier requests and four explicit gaps. Every implementation status remains unchecked. Nothing is claimed formalised or independently reviewed.

The seven owned extraction items are covered: PAPER-BENNETT-SIKSEK-20/28 by LG.0’s models, six labelled parameters and normalization; /29 by LG.1’s valuation and unit interfaces; /30 by LG.1’s character support and divisibility; /31 by LG.3’s two-by-four subgroup; /34 by LG.3’s exact minus-one count; /69 by LG.5’s symmetric trace zero; and /77 by LG.4’s corrected order-four witness and descent coordinate. LG.2 supplies their common split-cubic readings of existing native μ. Each node’s catalogueItems and the reader identify these uses.

The roadmap is a Part II of tauceti:TauCetiRoadmap/EllipticCurves, placed in arithmeticgeometry, with that parent and first prerequisite. Generic descent, group law, torsion, reduction and quadratic twists are imported, not re-owned. Six labelled root-ordering parameters are retained even when values coincide. Rational and finite-field domains are separate; singular parameters and characteristic two are excluded from elliptic exports. No progression or large-exponent condition appears in the generic finite-field statements.

## Coverage and resume points

| Stage | Nodes | Planets | Coverage | Exact refinement |
| --- | ---: | ---: | --- | --- |
| LG.0 | 11 | 6 | planned | Refine rational full-torsion normalization against native polynomial factorization and point transport. |
| LG.1 | 5 | 3 | planned | Discharge the minimal-model, ℚ_p-unit and elliptic-conductor supplier requests on their owners; prototype the actual CA.1 character once its native declaration exists. |
| LG.2 | 8 | 4 | planned | Elaborate CRT/quotient signatures against the compiled Tau Ceti pin and prove the split reading compatibility for μ. |
| LG.3 | 7 | 3 | planned | Implement the native halving calculations and finite-abelian two-primary cardinality argument. |
| LG.4 | 4 | 2 | planned | Prove denominator-cleared native doubling identities and compatibility with μ, using the corrected point. |
| LG.5 | 2 | 1 | planned | Discharge the generic BSD.0 finite-field twist comparison request; implement the direct quadratic-character point-count sum. |

Stop at this planned target-level boundary under the protocol budget rule. Independent review must check the source passages, actual pin statements, backward chains, API/tests and native prototype boundary. Implementation work is not authorized or claimed by this planning packet.

## Ownership and supplier contracts

- tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv: For a rational curve at a prime p, transport to ℚ_p and a minimal local equation; good reduction implies integral j; an integral unit-discriminant equation is minimal and has nonsingular reduction; compare rational padicValRat units with ℤ_p-unit reductions. All predicates apply to minimal models. Consumers: EllipticLegendreCharacterInterfaces:LG.1/good-prime-units, EllipticLegendreCharacterInterfaces:LG.1/legendre-good-model.

- ArithmeticGaloisRepresentations:R01.3: The actual elliptic conductor M has an odd prime p in its support iff the curve has bad reduction there, and at odd semistable primes its exponent is 1. Compare with the equation-level local reduction theory; this is not supplied by an unproved identification with the algorithmic Ogg exponent. Consumers: EllipticLegendreCharacterInterfaces:LG.1/character-conductor-divides.

- RankZeroOneBSD:BSD.0: Generic good-prime/finite-field quadratic-twist Euler-factor comparison in native frobeniusTrace normalization: the scalar class d multiplies the trace by quadraticChar(d), including d a square. Its rational all-local-factor and L-function factorization targets remain entirely with BSD.0. Consumers: EllipticLegendreCharacterInterfaces:LG.5/twist-euler-factor-specialization.

The exact CA.1/quadratic-character-of-a-squareclass node supplies the primitive rational-squareclass character, including its odd conductor formula; no duplicate primitive-character construction is proposed. ModularCurves 9E retains the moduli-level six Möbius transformations and invariant-ring discussion. The tuple in LG.0 is an ordered-root coordinate adapter, not another moduli action. No dependency on the moduli construction is needed for this elementary calculation.

The actual elliptic conductor is not a displayed discriminant or an unproved algorithmic Ogg exponent. The existing EllipticCurves Layer 4 text was read and explicitly withholds identification with the ramification conductor. R01.3’s conductor/reduction scope was read in full before making the precise support request. BSD.0 retains generic good and bad local factors, rational twist factors and L-function identities. LG.5 exports only the coefficient-specialized finite-field trace identity.

The organizational rescope note preserves the current six layer ids and suggests a maintainer-selected organization of thin elliptic Part IIs. It makes no edit to the upstream roadmap or links and introduces no supplier ticket.

## Gaps

- Compiled Tau Ceti baseline is not available: Native source statements are inspected at f790474, but no compiled Tau Ceti build at that pin is available. The publication includes native signatures and imports, plus a separately elaborated Mathlib-only projection; it does not certify full native elaboration. Do not build libraries or download caches.

- Generic local reduction/minimalization and conductor comparison requests: The local ℚ_p and minimal-equation unit bridge is requested from EllipticCurves Layer 4; the actual conductor support comparison is requested from ArithmeticGaloisRepresentations R01.3, whose stated scope covers it. No unexamined global odd-primitive split-model lemma is used as an assumed input.

- Generic twist Euler-factor comparison remains a supplier request: BSD.0 plans the comparison but the inspected packets do not contain a finer node for it. This packet supplies only the native equation specialization and retains an explicit request rather than proving a second generic comparison.

- Native squareclass-character and actual conductor signatures require their owner declarations: The exact mathematical CA.1 primitive squareclass-character node is imported, but it has no native construction declaration at the pin. The actual elliptic-conductor comparison is requested from R01.3. The two character/conductor signatures are explicitly omitted from the suggested file until these objects can be named; no Prop-valued surrogate or local duplicate is introduced.

## Prototype and verification receipts

The complete native suggested file **was not compiled**. The pinned Tau Ceti sources exist, but no existing compiled Tau Ceti build at f790474 was available. No Lake project, cache download, library build or language server was started. Its Mathlib-only projection uses actual native carriers, affine point operations and the minimal ℚ_p good-reduction condition. It does not substitute arbitrary propositions for unavailable character or conductor objects.

The full suggested file contains all eight definition/construction signatures, all 33 API item signatures and all 27 labelled example signatures. It includes 35 of the 37 target names. The two omitted mathematical targets are legendre_character_odd_support and legendre_character_odd_conductor_dvd: CA.1’s primitive squareclass-character construction and R01.3’s actual conductor interface have no implemented native declaration at the pin. They are explicitly named as omissions in the suggested file, with full contracts in LG.1 and an explicit gap. No local character/conductor stand-in is introduced. Native Tau Ceti portions are source-shaped signatures, not certified elaboration.

Mathlib-only projection: Lean 4.34.0-rc2 at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, exit 0, zero errors, 61 expected admission warnings and zero other warnings. Elapsed 6.711 seconds; peak RSS 3312232 KiB (about 3.2 GiB); 33 GiB available at start. Projection SHA-256 6119a5354b00ddf9eeedbedf3a55a11c277871ad8b97082e0b10714709f552d4; log SHA-256 04d91d75d9d0deb444158ce258cc538569d5c86b139e324f559b9b3a7c9b6689.

Admission-free scratch Mathlib kernel check: eleven example statements using actual point addition, plus the six nonsingularity witnesses and ellipticity of both coefficient models. It checks corrected points (4,3) and (3,4) doubling to (1,0), minus-one points (2,4) and (3,3) doubling to (0,0), nonzero doubles, root doubles, the printed (4,4) failing membership, and both discriminants in 𝔽₅. Exit 0, zero errors and zero warnings; 1.006 seconds; peak RSS 2495712 KiB (about 2.4 GiB). Source SHA-256 cf7b40aeaf52b3979f63c6b71b1978f8af7b3373fe16ee159b0e88bb804d645b; log SHA-256 082d1ca9000f17b9e89dbe907fed27bfd15e1d498944b725695e42dfaaa3e106. These finite kernel proofs do not prove the universal target signatures.

Independent exact-arithmetic regression counts, over odd primes below 80: halvingCriterion=80002, rootDescentProducts=4482, twistTraceSigns=747, traceZeroInstances=448, exactMinusOneValuations=6, minusOneWitnesses=12, correctedHalvingWitnesses=384, printedWitnessFailures=360, twoByFourInstances=424, labelledParameterTuples=705, rationalValuationCases=2820. The minus-one counts at p=5,13,29,37,53,61 are 8,8,40,40,40,72. Rational parameters use numerators −24 through 24 and denominators 1 through 15, excluding 0,1, and valuations at 3,5,7,11. Repeated rational enumeration cases are counted as cases, not claimed distinct rational values. Regression source SHA-256 ae57e439605c82e378658dcf2c019c3ab8921761035cbde5eb9f66450c491c8a; receipt SHA-256 8899b4d8e0fc479de24e85f0c524567cae645613bb72ade9e66294022fccf174. The independently coded group law and finite enumeration are diagnostics, not a proof of universal group structure.

Unmodified official check_blueprint.py and check_errata.py: zero errors, zero warnings and zero module/index mismatches against the read-only Git-object world at 2ca01c09de792789b2ee5ab787af303aacfdad33, with only this new roadmap definition overlaid. Graph validation peak RSS 2220500 KiB; 1.73 seconds. No repository snapshot or shared checkout mutation was used. Validation receipt SHA-256 2883e11d1fe60d341ad6a5def20b9ecd627d4444bf8b505162209b9b671cfc24.

All Lean checks ran serially with one worker thread, an 8 GiB Lean limit, a 20-minute timeout and an available-memory gate of at least 20 GiB. A subsequent fall in shared-machine available memory stopped further Lean starts. Fresh-base graph revalidation has its own eight-GiB available-memory gate and four-GiB address-space cap; if that gate remains unsatisfied, the successful fixed-base validation above remains the stated result and the Swarm submission check supplies authoritative fresh-base validation. No owned background process is left running. Disk-backed scratch is under ten MiB and is recoverably removed after submission.

## Sources and the corrected witness

Bennett–Siksek’s complete 38-page publisher version was read in the adjoining design, including §§1–12 and references. For this design §§5–6 pp.366–372 were reread, including full relevant proofs of Lemmas 6.2,6.3,6.5 and the local part of Lemma 6.6. Publisher PDF SHA-256: 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf. The source text is not submitted. No missing paper passage is disguised as an examined source; generic supplier proof and implementation closure remain their owners’ work.

The packet records one reused source finding, PAPER-BENNETT-SIKSEK-20/E14, as its own E1 with priorFinding and priorReview attribution. The existing independent REV-ERRATA-PAPER-BENNETT-SIKSEK-20 confirms the printed Lemma 6.6 point correction. The new plan does not invent a review object for itself. The bounded journal, DOI, arXiv and author-page correction searches are inherited and attributed from that finding, not presented as new exhaustive searches. No author contact is made.

The corrected point is (2λ+4itv,8itv(t+iv)). In the denominator-cleared doubling calculation r²−s²=2 and the coefficient is a₂=−(2r²−s²), not −(r²+s²). The printed point fails at p=5,t=v=2,i=3; the corrected point is (4,3), with double (1,0). For i=2 the correct point is (3,4). The fresh regression caught and removed a draft typo (3,2) in that second example before publication; this was an authoring error, not another source finding.

Review should pay particular attention to the exact two-primary argument: absence of order-eight points does not itself exclude a group Z/4×Z/4. The additional root-halving test excludes that order-sixteen case. Also check that good-prime j-integrality is not strengthened to j-unit, that six root labels are not changed to six distinct values, that root squareclasses never use zero, and that conductor-one characters remain allowed.
