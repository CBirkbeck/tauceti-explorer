# Independent review: REV-PAPER-JANNSEN-16

Reviewer: Codex — codex-a71f92. Issue #1173. Date: 23 September 2026.
Verdict: **revise**. The independent review is finished; the underlying extraction remains **partial**.

## Independence, claim and source scope

Input was Claude Code cc-39fac3's PAPER-JANNSEN-16, issue #1172, PR #1967, merged as `12b76f65bcc0bd8da3ecc374b8a13bc7ef49972a`. I did not author the input. Claim comment 5803485610 was confirmed by bot comment 5803487410; I reread the whole issue after confirmation.

The working source snapshot was `f7ea9466f360de703863c6a7b0cf18cac9ba6046`. I followed WORKERS, PROTOCOL §§0/15/16/18, UPSTREAM_GUIDE and the expansion faithfulness protocol. Only the four named deliverables and this job's handoff are submitted. The paper PDF, v2 source/PDF, page images, review notes and regression script stay in scratch.

I read all 71 pages of the [published paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p01-p.pdf), including references, and all original 61 items, 9 routes and 9 source findings. I inspected page images for the p-degree bound (p. 43), divisor/variance claims (p. 53), and homology-versus-complex premise (p. 59). Selected counterparts in [v2](https://arxiv.org/pdf/0910.2803v2) and [its TeX](https://arxiv.org/src/0910.2803v2) were checked. I do not claim a second complete v2 reading or full readings of every cited prerequisite.

The hashes and version-number mapping are in the revised paper report. The published paper, not removed v2 §§6–7, controls the hypotheses used here.

## Outcome

84 records: 4 library, 9 planned, 71 missing; all 71 missing records routed exactly once. 9 route verdicts, with directions 2/3/5/7/8 supported and 1/4/6/9 held. 18 prerequisite entries, 23 confirmed retained source findings, 12 explicit closure gaps.

The overall revise verdict prevents any route being applied by the current queue generator. Individual accept verdicts identify directions I would retain during repair; they are not a declaration that the inventory is gap-free.

The most consequential new counterexample is to Proposition 5.4. On X=P¹×P¹ take Y₁ and the added divisor to be two distinct fibres of the first projection. All printed connectedness/transversality conditions hold. The weight chain is 0→A²→A, with sum up to the harmless orientation signs, so H_1=A. The dual cochain cokernel also equals A. The proof's asserted surjection from the intersection component group to the curve-stratum component group is actually 0→A. The missing nonemptiness hypothesis is now explicit. Generic ample hyperplanes satisfy it, so this is not a refutation of the later Hasse theorems.

Other substantive checks:

- The all-n weak-approximation statement on p. 23 fails for p-th powers over F_p(t); the completion has uncountably many classes while the global field is countable. For a,b in F_p[[t^p]], differentiation separates the classes of 1+ta and 1+tb. The theorem only needs the invertible ℓ-primary case.
- With G=C₂ swapping Z² and H=1, transfer after projection sends (a,b) to (a+b,a+b), not 2(a,b). Projection after transfer is multiplication by 2, the order actually needed for finite-field descent.
- H¹_cont(Zhat,Z)=0 whereas the trivial-module coinvariants are Z. The finite-field H¹ identification needs torsion coefficients, as all its actual applications have.
- Theorem 5.13 assumes the homology of C factors through motives. Applying C to an abstract motive complex is not justified by this hypothesis. Chosen geometric hyperenvelopes and an E₂-page comparison supply the indicated repair; the full construction remains a proof-provider task.
- The isolated d=0 form of Theorem 3.17 gives Q_ℓ/Z_ℓ→0 and cannot be injective. Its use is positive-dimensional; that hypothesis is restored.
- Original E9's criticism of the p. 64 reference to Lemma 5.17 was withdrawn. That lemma proves the descent used in Proposition 5.16, so invoking it for the comparison is not independently shown wrong. Four genuinely bad references remain in E9.

## Library check and precise reuse

The pinned BASELINE manifest agrees with Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Read declarations, not only names:

- [continuousCohomology](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean#L131): homology of homogeneous continuous cochains. Added /75.
- [TauCeti.KummerCoeff](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean#L113): roots of unity in a separable closure with their actual action. Added /76.
- [CategoryTheory.SpectralSequence](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/SpectralSequence/Basic.lean#L36): abstract pages and homology identifications. Added /77, not a geometric spectral sequence.
- [CategoryTheory.PreOneHypercover](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Hypercover/One.lean#L47): one-stage categorical data. Added /78, not an all-degree motivic envelope.

No-ignore library searches covered Kato/Hasse, Poitou–Tate, Gersten/Bloch–Ogus, unramified cohomology, weight homology, hyperenvelopes, alterations, norm-residue, logarithmic Witt/purity, Bertini, Pythagoras, torus cocharacters, approximation and weight filtrations. The searches found no implementation of the complete paper-specific statements. They did find existing arithmetic approximation, torus cocharacter and Hodge-theoretic weight APIs; the latter is not a Galois-weight theorem. In particular, the cocharacter finite-free/pairing declarations in Torus/Cocharacter/Basic.lean and the function-field place approximation statement were opened. The new inventory is partial and does not claim that the four added library entries exhaust every reusable dependency.

Reviewed audit entries read: AUDIT-01 R09.7/SF.2; AUDIT-02 R02.2/R02.4; AUDIT-03 HL.2/HL.6; AUDIT-18 DWP.0/DWP.10/EDC.3/EDC.4/L5; AUDIT-19 R34.1/R34.5; AUDIT-22 E2; AUDIT-30 M.5. No keyed MC.1 or CR.4 audit entry was available in that snapshot. Their actual current layer descriptions were read, and no missing audit is treated as certification.

Descriptions checked include HL.2/HL.6, R02.2/R02.4, SF.2, DWP.0/7/8/9/10, R34.1/R34.5, EDC.3/4, M.5 with its subbranches, R09.7 with its subbranches, MC.0–MC.4, CR.3/4/5, RD.7, E2 and L5. The upstream ProfiniteCohomology Layer 10 owns all-degree transfer; its source-qualified interface is imported as /79. QuadraticFormInvariants Layer 4 explicitly excludes general Pfister and function-field theory, so the old claim to import that entire package from the parent was corrected.

## Every in-place inventory change

Original ids /1–61 are preserved. This table lists every changed record and field; corrections themselves are in the JSON.

| Item | Changed fields |
| --- | --- |
| 1 | note |
| 2 | statement |
| 3 | name, statement, note |
| 8 | statement, note |
| 9 | name, statement, note |
| 11 | name, statement, note |
| 16 | name, statement |
| 17 | locator |
| 18 | locator, planned, note |
| 19 | locator |
| 20 | locator, note |
| 22 | statement |
| 23 | kind, name, statement, locator |
| 26 | name, statement, locator |
| 29 | note |
| 31 | name, statement, locator |
| 35 | statement, note |
| 43 | status, planned, note |
| 46 | name, statement, locator |
| 47 | statement |
| 49 | name, statement, locator, note |
| 50 | statement, note |
| 54 | name, statement, note |
| 55 | name, statement, locator |
| 56 | statement, note |
| 57 | statement, note |
| 60 | name, statement, note |
| 61 | statement, note |

Added records:

- /62–65 split Theorem 1.5(b), Theorem 2.5(a),(b), and Lemma 2.6 from their former bundles.
- /66 separates Theorem 2.12 from the generic specialization theorem /26.
- /67–68 separate residue-kernel and proper-model comparisons from definition /31.
- /69–70 separate the function-field criterion and niveau construction from definition /46.
- /71–72 separate Corollaries 5.5 and 5.6 from corrected Proposition 5.4.
- /73–74 separate natural transformations and hyperenvelope descent.
- /75–78 record the existing baseline carriers listed above.
- /79 imports the upstream all-degree cohomological transfer/colimit supplier.
- /80–84 record coinvariant transfer, torsion finite-field H¹, the Pythagoras-number definition, the Bertini interface, and the norm-residue coefficient consequence.

Top-level changes: complete→partial; independent review metadata and G1–G12 added; summary rewritten; reviewer reading scope appended without claiming the original author's full v2 read as my own. Four prerequisite entries added (Jan90, CTJ91, KMP07, Gillet/SGA4), and Jan88's incorrect weight-sequence attribution removed. The primary prerequisites are proof sources to acquire/decompose, not papers claimed to have been fully read.

All nine route descriptions were considered. Routes 1 and 4 retain their proposed owner but are rejected at current granularity; route 6 explicitly becomes a held ownership proposal. Routes 2/3/5 have tightened imports, indices and coefficient restrictions. Route 7 drops the unsupported arbitrary-coinvariant injectivity claim and imports upstream cohomological transfer. Route 8 corrects the parent's scope and adds /82. Route 9 drops its unverified optional alteration branch, adds the new corrected records and a mandatory review gate. No new rival roadmap id was created.

## Source findings

Every retained entry below has an independent confirmed verdict; E9 is the narrowed finding described above. E1–E9 were the original entries; E10–E23 are additions.

| Finding | Kind | Reach | Checked locator |
| --- | --- | --- | --- |
| E1 | misprint | nothing | §2, discussion of the weight spectral sequence (2.1), p. 17, and the paragraph before Proposition 2.2, p. 18 (published); same in arXiv v2 |
| E2 | misprint | nothing | Proof of Theorem 1.5, p. 16 (published); same in arXiv v2 |
| E3 | misprint | nothing | Proof of Theorem 2.10, p. 24 (published); same in arXiv v2 |
| E4 | misprint | nothing | Statement of Theorem 3.17 and Case 3.17.A, p. 35 (published); same in arXiv v2 |
| E5 | misprint | nothing | Case 3.8.B of the proof of Theorem 3.8, pp. 38–39 (published); same in arXiv v2 |
| E6 | gap | the proof | Proof of Theorem 3.1, induction step, p. 29 (published); same in arXiv v2 |
| E7 | gap | the proof | Proof of Theorem 5.12, property 4.24(iii), p. 65 (published) |
| E8 | misprint | a stated result | Statement of Theorem 0.11, p. 7 (published); arXiv v2 Theorem 0.7 likewise |
| E9 | misprint | nothing | Published cross-references: p. 7 history paragraph; Lemma 4.24 p. 51; Remark 4.25 p. 52; Proposition 5.16 p. 61 |
| E10 | error | a stated result | Proposition 5.4, pp. 53–54; same statement in arXiv v2 §5 |
| E11 | misprint | a stated result | Condition (∗), p. 43, compared with Lemma 4.23(a), p. 51 |
| E12 | error | the proof | Proof of Theorem 2.5(b), p. 23; same in arXiv v2 p. 19 |
| E13 | misprint | nothing | Proof of Proposition 2.2, pp. 19–20 |
| E14 | error | a stated result | Case 3.17.B, p. 37, and Lemma 4.20 proof, p. 49; same broad assertion in v2 |
| E15 | error | a stated result | Proof of Theorem 5.10, p. 57 |
| E16 | gap | the proof | Proof of Theorem 5.13, p. 59 |
| E17 | misprint | nothing | Definition 5.3, p. 53; same in arXiv v2 |
| E18 | misprint | a stated result | Isolated statement of Theorem 3.17, p. 35 |
| E19 | misprint | nothing | Equations (5.14) and (5.18), pp. 59 and 61 |
| E20 | misprint | nothing | Proposition 5.16(i)–(ii), p. 61, and Lemma 5.17, pp. 61–62 |
| E21 | misprint | nothing | Theorem 5.9(ii), p. 55 |
| E22 | misprint | nothing | Proof of Theorem 5.13, pp. 59–60 |
| E23 | misprint | nothing | Equation (4.12) and its following defining sentence, p. 46 |

The full reasons, corrected expressions and counterexamples are in sourceIssues. E8's reach is changed to a stated result. Search provenance on all entries is replaced by the actual independent search scope, not a copied assertion that I read all of v2.

Correction search: [journal article](https://annals.math.princeton.edu/2016/183-1/p01), [arXiv history](https://arxiv.org/abs/0910.2803), Crossref relation/update metadata, and [Regensburg's institutional record](https://epub.uni-regensburg.de/41804/), plus title/author erratum searches. No correction located. Author-homepage attempts failed and are explicitly recorded as a limitation.

The minor unchecked flags in G12 and the unresolved reasoning in G3–G11 are not confirmed errata. In particular no arbitrary-DVR, wild-rigidity or primary-field main theorem is declared false from an incomplete provider check.

## Closure gaps and resumption instructions

### G1: Atomic extraction of the Kato core

Consumers: /8, /14, /15, /21, /30, /34, /36, /41, /42, /44, /45, /47, /53, /58, /59.

Separate each map, degree/twist convention, residue construction, square-zero, finite-support proof, local/global comparison, real-place case and finite/infinite coefficient implication. Lemma 1.3 alone has four conclusions. No single item may stand for the complete chain of imported proofs. HL.6 is the correct destination for the core, but the present route is held rather than represented as blueprint-ready.

### G2: Coefficient and finite-group algebra providers

Consumers: /1, /2, /17, /21, /84.

Separate all Tate twists and transition maps, the Brauer comparison, wild logarithmic exact sequences, equivalence of lattices with divisible cofinite torsion modules, Ext¹ base change for a finite group and the integral-lattice descent used on p. 20. Library /75–78 are partial carriers only. Do not infer an all-twist coefficient interface from μ_n alone. Existing Tau Ceti torus cocharacter finite-free/pairing APIs were found and opened; import these rather than planning a bare lattice again. Arithmetic weak-approximation APIs also exist; the prime-to-characteristic quotient/splitting-torus adapters are the missing comparison.

### G3: Global/local cohomological dimension and HS compatibility

Consumers: /14, /15, /34, /41, /45, /60, /61.

Supply actual field cd_ℓ bounds, high-degree localization at real places, H¹ archimedean and H² finite-set surjectivity, compact dual/limit conventions, and compatibility of Hochschild–Serre with residues and corestrictions. The field-constant components in Lemma 4.20 require the tensor-product/induced-module treatment. Do not assert cd_p equals transcendence degree of an arbitrary characteristic-p field.

### G4: Strong density and wild specialization

Consumers: /26, /66, /29.

Split (SD), (FP), Greenberg's theorem, étale filtered limits and Chevalley/open-image specialization. The source proof uses fixed discrete étale coefficients; verify the logarithmic Hodge–Witt functor's limit and specialization properties before claiming all n. This is an extraction closure gap, not a verified counterexample to Theorem 2.12. EDC.4 imports affine Artin vanishing from its PR196 supplier; record the exact provider rather than duplicate the proof.

### G5: Unramified and Gersten scope

Consumers: /31, /32, /33, /35, /67, /68.

Read CTHK97 and the p-primary Gersten providers rather than conflate universal exactness with ordinary exactness. Distinguish all DVRs from divisorial valuations, and products of residue fields from a single geometrically integral component. Clarify the direct-sum/finite-support assertions in the arbitrary-valuation argument on pp. 39–40. No source mistake is confirmed for this unresolved scope question.

### G6: Geometric logarithmic purity and p-adic weights

Consumers: /19, /28.

Independently source-check and split Gros Gysin maps/transitivity, Suwa purity at the exact twist, affine logarithmic vanishing, Milne/Katz–Messing weights and Gros–Suwa base change. CR.4, CR.5, RD.7 and HL.2 are distinct suppliers; choose one extension owner for the unowned scheme-level package, with explicit imports.

### G7: Homology formalism versus motivic descent ownership

Consumers: /46, /54, /55, /56, /69, /70, /73, /74.

Settle one owner for general homology theories, niveau sequences and the function-field criterion. Decompose the GS96/Gillet/SGA4 proof of hyperenvelope descent and independence. Correcting E16's domain problem is not a full construction. E2 and L5 supply ordinary hypercover machinery, not automatic motivic-envelope descent.

### G8: Proper/projective motives and resolution adapters

Consumers: /43, /48, /54, /56, /57, /58.

Jannsen switches between smooth projective and smooth proper generators. MC.0–MC.1 explicitly begin with projective varieties; R09.7d supplies quasi-projective compactification. Source-check the proper-to-projective correspondence adapter and KMP07 variance convention, as well as arbitrary-proper RS1. Do not manufacture rigid duals within effective motives.

### G9: Bertini, connected strata and finite-field descent

Consumers: /21, /49, /50, /52, /59, /71, /72, /80, /83.

Prove the nonempty/connected stratum Bertini interface and its exact base hypotheses, then finite-field prime-power extension and norm descent. Keep E10's corrected hypothesis and the independent affine-complement condition. Split the universal-coefficient and freeness arguments.

### G10: Primary versus geometrically integral function-field models

Consumers: /3, /4, /5, /14, /24.

In imperfect characteristic, K separably closed in F does not imply a geometrically integral smooth model over K; e.g. F=F_p(t^(1/p))(u) over F_p(t). Provide the purely inseparable constant-field reduction and compatibility maps before using such a model. This is an identified proof-provider gap, not an independently confirmed false main theorem.

### G11: Coinvariant Chow-correspondence action

Consumers: /58, /59.

Check the primary BV97 and Gros–Suwa operations and the Galois-equivariant correspondence descent, including dimension/twist signs. An arbitrary cup product does not descend to coinvariants: for C₂ swapping the factors of Z×Z, [e₁]=[e₂] but [e₁²]≠[e₁e₂]. Correspondences defined over k can still act by equivariant operators; construct that action rather than assume a coinvariant ring.

### G12: Remaining source-level microchecks

Consumers: /8, /26, /33, /40, /47, /58, /59.

The line-by-line reading also flagged minor labels on pp. 33, 40–42, 44, 47 and 64–65 and the set-valued proof's use of 'vanishes'. The report records them as continuation checks where no full version/image/type audit was completed. They are not certified findings in sourceIssues. Complete the remaining prerequisite readings and atomic sweep before changing partial to complete.

## Tests and submission boundary

Passed:

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-JANNSEN-16.result.json`.
- `python3 -m unittest tests.test_check_paper tests.test_papers_queue tests.test_source_issues`: 19 tests.
- Scratch `verify_jannsen_review.py`: 635 integrity and finite-model assertions, covering unique ids, every missing route exactly once, one verdict per route, finding review metadata, gap consumers, corrected restrictions, the disjoint-fibre chain over Z/n for 2≤n≤17, the swapped-module transfer example, and spectral weight separation.

The scratch computations are regression evidence for small models, not Lean proofs of the geometric claims. The derivative/countability and compactness arguments are given mathematically above. No Lean file was requested or changed, and no Lean compilation is claimed.

Submit exactly PAPER-JANNSEN-16.result.json, PAPER-JANNSEN-16.md, PAPER-JANNSEN-16.review.json, this review, and the REV-PAPER-JANNSEN-16 handoff. The PDFs, notes, test script and generated registry/queue data are excluded.
