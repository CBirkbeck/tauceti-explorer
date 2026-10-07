# BP-GrossZagierAndArithmeticHeights--GZ.0 — completed target-level planning pass

Codex, session **codex-6xAnoq**, 7 October 2026. Refs #744. The bot confirmed the claim at [comment 6033210055](https://github.com/CBirkbeck/tauceti-explorer/issues/744#issuecomment-6033210055). Branch: `codex-6xAnoq-gross-zagier-gz0`.

This continues the first checkpoint, preserving its correct height-convention nodes and replacing its incorrect library-absence and ownership claims. The pass is **complete** under PROTOCOL section 0: all eight scoped stages are planned at target granularity. None is closed. This is a mathematical plan, with every implementation status unchecked. It contains 241 nodes: 25 definitions, 39 constructions, 2 lemmas, 7 comparisons and 168 theorems; 264 API items; 197 named unit tests; 33 planets; and 42 pinned baseline declaration citations. There are 7 explicit gaps and 68 supplier requests.

The three companion deliverables agree on the declarations, hypotheses, names, dependencies, API and tests. The reader gives shared standing notation once, then the full declaration catalogue. The suggested file represents every node and API name and all named tests as examples. Its comments state which unavailable arithmetic, geometric or analytic carrier conditions are omitted; the mathematical packet remains definitive. Admitted prototype signatures do not certify the mathematics.

## Coverage and the next work

| Stage | Status | Owned nodes | Required refinement |
| --- | --- | ---: | --- |
| GZ.0 | planned | 17 | RP.0 compatible-place and full Poincaré/field normalization proof interfaces; source Euler/differential comparison refinements. |
| GZ.1 | planned | 4 | Primary full YZZ Chapter7 proof acquisition and implementation of the RP.0/A2 height/biextension carriers. |
| GZ.2 | planned | 17 | Genus-one admissible existence proof without division by 2g−2; non-split Galois graph descent; full Faltings–Hriljac proof-source and carrier realization. |
| GZ.3 | planned | 11 | Full YZZ Chapter3 rational realization/volume proof-source; exact Manin divisibility/p-unit proof adapters and integral isogeny/twist differential comparisons. |
| GZ.4 | planned | 6 | Every local test-vector conductor case and real/complex Hom topology must be realized by the named GL₂/epsilon suppliers. |
| GZ.5 | planned | 10 | Full coherent theta/Waldspurger proof source at the requested MP.6 interfaces; definite coefficient scalar comparison; Baruch–Mao Maass S6 normalization gate. |
| GZ.6 | planned | 68 | Full YZZ Picard modularity/trace scalar proof source and actual automorphic/Picard carriers; realize the classical regularized projection estimates and exact theta transforms. |
| GZ.7 | planned | 108 | Full YZZ degenerate data and bad-place approximation proof source; equivariant Colmez vertical lift; elliptic/level tensor corrections and local wild refinements. |

An independent review must check the target-level plan, source corrections and ownership. After acceptance, each open stage receives its prescribed refinement job, followed by the roadmap assembly. A continuation should begin with that stage's `coverage.remaining`, affected `gaps.neededBy` and exact `requests.neededBy`, rather than expanding an unrelated proof. The final Gross–Zagier identities in GZ.8 and the p-adic identities in GZ.9 remain outside this part.

The source coverage ledger accounts for all 232 required extraction items exactly once: 203 planned, 16 requested, 1 imported and 12 assigned outside this part to GZ.8. The last group consists of the classical final coefficient identities and their applications. The separate Skinner additions in the issue belong to GZ.9 and are outside this part. No required extraction item is silently discarded. The owned declaration dependency graph is acyclic. In particular, the classical definite square statement uses the already planned coherent Waldspurger identity rather than adding a backwards dependency on the downstream derivative kernel.

## Corrections and ownership reconciliations

1. **Coherent theta inputs.** GZ.5 imports the actual MP.6 quadratic/quaternionic norm instances, toric-theta pairing, measure comparison and global see-saw/projection nodes. Ordinary convergence requires Witt index zero or the strict inequality m−r>n+1. Split binary data and boundary ternary data use regularized identities. GZ does not rebuild Siegel–Weil.
2. **General heights and descent.** RP.0 owns general line-bundle and canonical/local heights, Northcott and the torsion criterion. RP.1 owns general abelian-variety Mordell–Weil. GZ.1 retains the Poincaré/full-polarization convention, coefficient-field and character-valued pairings and elliptic comparison. Mathlib already has the generated additive `AddCommGroup.fg_of_descent'`; its multiplicative source head is the indexed baseline citation. The packet proposes rerouting BSD.1's general Mordell–Weil dependency to RP.1.
3. **Height normalization.** Pinned Tau Ceti uses the half x-height limit, the halved polar form and its Gram regulator. The full polarization and regulator therefore require factors 2 and 2^r. `NumberField.instAdmissibleAbsValues` and the degree-valued total weight already exist, contrary to the old checkpoint's missing-instance claim. The field-extension comparison remains requested from RP.0. The upstream EllipticCurves text/code discrepancy is an upstream note, not an edit to upstream.
4. **Manin constants.** The plan distinguishes integrality, the optimal odd semistable p-unit statement for p not dividing 2N, transfer along an isogeny of degree prime to p, and twists with p not dividing 2ND. It preserves the 2/3 exceptions in the Česnavičius–Neururer–Saha degree divisibility statements and the nonoptimal 11a3 constant-5 counterexample. BSD.6/6a/7a and MIMC consumers receive an explicit request. The underlying Mazur/Edixhoven proof and every consumer normalization are follow-up proof adapters; this pass does not claim a complete reading of the JSW argument.
5. **Arithmetic surface infrastructure.** Upstream StableReduction Layers 1, 4, 5 and 7 own regular/minimal models, vertical intersection matrices and their fibre kernel, projection formulas, dual graphs and semistable base change. GZ.2 imports them. TB.3 supplies generic resistance/Laplacian input; TB.2 supplies descent and TB.6 the Chern-current interface. GZ owns the arithmetic admissible specializations.

The classical self-intersection calculation also retains Conrad's Theorem 9.2 tensor correction. The uncorrected eta/automorphism specialization is restricted to a chosen smooth coarse integral diagram, effective stabilizer one and a place away from N. Elliptic points and level places retain ord(C_x u_x^k) and the integral tensor order. The eta cotangent is dual to the tangent, and twist periods use the differential transport ω/√D.

## Supplier requests

The packet and reader list all 68 requests with exact statements and consuming nodes. The supplier families and counts are:

- AbelianSchemesAndArithmeticModuli: 3.
- AnalyticNumberTheory: 3.
- ArakelovGeometryAndAbelianHeights: 1.
- AutomorphicFormsOnReductiveGroups: 4.
- AutomorphicLFunctionsAndLocalFactors: 5.
- AutomorphicSpectralTheory: 9.
- ComplexMultiplicationAndExplicitReciprocity: 4.
- EndoscopicTransferAndUnitaryTraceComparison: 1.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory: 2.
- GL2AutomorphicRepresentationsAndTransfer: 3.
- HeegnerPointEulerSystems: 5.
- HeightsRationalPointsAndObstructions: 5.
- HilbertModularVarietiesAndShimuraCurves: 2.
- MetaplecticAutomorphicForms: 4.
- ModularCurvesPartII: 6.
- NeronModelsAndSemistableAbelianVarieties: 1.
- RankZeroOneBSD: 1.
- SmoothRepresentationsOfLocalGroups: 1.
- TropicalAndBerkovichArithmetic: 3.
- tauceti: 5.

For `tauceti`, the five requests import upstream StableReduction and JacobianChallenge infrastructure. A stage reference is a need, not evidence that its output has been implemented. Exact matching supplier nodes are used wherever the available packets provide them. Generic objects retain their existing owners.

## Explicit gaps

1. **Full YZZ proof-source acquisition.** The public author erratum and reviewed decomposition supply exact introductory and Chapter7 locators. A full public book/preprint proof was not acquired: Chapter3 realization/volume comparison, Chapter4 Picard modularity and trace scalar, Chapter5 nonzero degenerate test data and split S¹/S² condition, and Chapters6–8 bad-place approximants need primary proof inspection. The corresponding targets are specified, not certified closed.
2. **Arithmetic carriers absent from the pinned baseline.** General algebraic line bundles with point-height machine, dual/Poincaré biextension, arithmetic Green divisors and the actual quaternionic/toric automorphic carriers are not all available as pinned Lean interfaces. Suggested signatures omit conditions that cannot yet be stated; the mathematical packet retains their full hypotheses. Supplier requests must be realized before those arithmetic signatures and their tests can elaborate.
3. **Genus-one resistance-measure proof.** Yuan’s author manuscript Proposition A.5 proves c₁(ωa)=(2g−2)i*μ; comparing this with (2g−2)μa gives the stated formula only for g>1. A separate proof from an admissible degree-one bundle or the good/Tate genus-one models is required. The formula is planned for g>0, with this missing argument explicit.
4. **Elliptic and level tensor comparison refinement.** The primary Conrad Theorem9.2 stabilizer-norm proof is read and planned as cmTensor_stabilizer_height. The blanket historical omission is replaced by this valid tensor identity. Specializing every exceptional j and v|N term to the exact eta/coarse-coordinate formula remains a refinement: retain ord(C_x u_x^k) and ord_(v,x)(Δ), rather than assert the automorphism sum equals every self-intersection.
5. **Historical definite central-value announcement.** Gross–Zagier V §3 only announces proportionality. Nodes use the already specified normalized coherent Waldspurger identity instead; matching its exact scalar and rational eigenspace with the historical b_m,A vector needs the definite theta-coefficient comparison from the toric/theta suppliers.
6. **Half-weight Waldspurger proof normalization.** DIT (5.17) is read in the version of record. Its cited Baruch–Mao 2010 local proof and complete 2-adic plus-space dictionary have not been acquired in this run; S6 of the reviewed extraction remains a precise source-proof gate. The supplier request must establish the 12π comparison, both signs of d and unit half-weight norm; the explicit target is planned, not certified by quotation alone.
7. **Equivariance of the Colmez vertical correction.** Published Yuan–Zhang §8.3 Lemma8.9 uses invariance of a lifted vertical correction that does not follow from fixed CM support alone (inherited source issue PAPER-YUAN-ZHANG-18/E17). Supply an equivariant/invariant vertical lift or an intersection descent proof and retain the t₂ action. The pseudo-kernel node’s corrected target is conditional on this geometric input.

## Source inspection and version discipline

Primary passages read in this run include Gross–Zagier (1986), I §§3–9, II §§1–5, III §§0–9, IV §§0–6 and V §§1–3; Yuan–Zhang's published 2018 paper §§6.2–9.2; Yuan's 21 August 2024 manuscript Appendix A.1/A.5/A.6; Duke–Imamoḡlu–Tóth §5, Theorem 4 and (5.17); Conrad's author final §§8–9, including the full Theorem 9.2 norm-coordinate proof; Gan–Qiu–Takeda §1.7; the YZZ author erratum items 1–42; the Cai–Shu–Tian normalization sections; and the Jetchev and Česnavičius–Neururer–Saha introductions. Müller–Stoll and the original checkpoint's height sources were re-acquired and used for the normalization comparison.

The Gross–Zagier published scan was read with GDZ OCR of printed pages 225–320. Ambiguous scanned signs and subscripts were reconciled with the amended extraction and remain independent-review points. OCR is not a separate edition or proof certificate. The Colmez author errata dated 11 January and 18 December 2022 are separate versions; the stronger torsion/graph correction in the latter is retained. The published 2023 corrigendum was not acquired. Yuan findings inherited from the reviewed extraction are scoped to the acquired 2024 manuscript, not asserted against the unread 2026 version of record.

**Not acquired:** the full YZZ book/proof text (public full-copy attempts returned HTTP 403); Yuan's published Annals 203 (2026) text; the published Colmez corrigendum; and the cited Baruch–Mao 2010 JLMS normalization proof. YZZ passages described as checked in an independent review are inherited from the reviewed decomposition; they are not claimed as a fresh complete-book reading. The 85 `sourceIssues` retain extraction provenance and correction searches without adding this worker's independent-review verdict. The packet's `sourceVersions` and the table below pin what was actually used.

| Version/source | Read | SHA-256 |
| --- | --- | --- |
| [https://arxiv.org/abs/1509.08748v2](https://arxiv.org/abs/1509.08748v2) | 2026-09-28 | `10576e85c77e8e7c590671840586bc4680e638d03daf7802e230a4897ac3384c` |
| [https://arxiv.org/abs/1408.1733v2](https://arxiv.org/abs/1408.1733v2) | 2026-09-28 | `8d908543404abfbd9c1708ad9af696c4fb71595701bd67cb5bff11b3a8d6ac43` |
| [Conrad, Gross–Zagier revisited, MSRI Publications 49 (2004)](https://library.slmath.org/books/Book49/files/05conrad.pdf) | 2026-09-28 | `31396cc7f513d6237155b6afa923c6ef76d2f37101db598d58bea25f0aa677ca` |
| [Explicit Gross–Zagier and Waldspurger formulae; arXiv:1408.1733v2](https://arxiv.org/pdf/1408.1733v2) | 2026-10-07 | `8d908543404abfbd9c1708ad9af696c4fb71595701bd67cb5bff11b3a8d6ac43` |
| [Heegner points and derivatives of L-series; Invent. Math. 84 (1986), 225–320](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf) | 2026-10-07 | `a9a52cb8662e03f19ace81dcfbf24bf873bf9c46ba89a8c890727b9541abdbf5` |
| [Gross–Zagier formula for GL(2); CRM lecture notes](https://web.math.princeton.edu/~shouwu/publications/crmnote.pdf) | 2026-10-07 | `1f46be497752b0795dbef8b06b423ef7bea5203096d3480c6da2642c333e73f0` |
| [Erratum to The Gross–Zagier Formula on Shimura Curves; 28 June 2026](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/erratum-GZSC.pdf) | 2026-10-07 | `e4c4eaeb197ceaf18b02955d90a56e52e4776eca1f31c88c16074adaf19d8d1e` |
| [Global divisibility of Heegner points and Tamagawa numbers; Compositio Math. 144 (2008)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/475417137355BE27B3888862CADB0286/S0010437X08003497a.pdf/global_divisibility_of_heegner_points_and_tamagawa_numbers.pdf) | 2026-10-07 | `f887790bbbf0a1831685f697cfe20b403ca515be4c4176705efa24e3077307ed` |
| [The Manin constant and the modular degree; arXiv:1911.09446, 3 November 2022](https://arxiv.org/pdf/1911.09446) | 2026-10-07 | `4d76a0daf4ffa103a4a96f6fafe6de22c44e194cd2c47489c75be8967f1d5448` |
| [Geometric invariants for real quadratic fields; Ann. Math. 184 (2016), 949–990](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf) | 2026-10-07 | `a67de7157f76ee700bc2e6a0034a920adc390022d4ff528aa80084f829f35f61` |
| [On the averaged Colmez conjecture; Ann. Math. 187 (2018), 533–638](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf) | 2026-10-07 | `29dfd5f19dec401116f1eaf0305305acf5f2fc68aa3c90d4eb6e5222de50d507` |
| [The regularized Siegel–Weil formula (the second term identity) and the Rallis inner product formula; arXiv:1207.4709v3](https://arxiv.org/pdf/1207.4709v3) | 2026-10-07 | `cde6b7ad22b974d4159f8cedd1e14a00bf4b05ec977ab750b54fdceb067adac5` |
| [Arithmetic bigness and a uniform Bogomolov-type result; author manuscript 21 August 2024; Ann. Math. 203 (2026), 15–119 has not been acquired](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf) | 2026-10-07 | `b36f4860cc0f098ef062523e8a5147e8172d1e4e357fc76a63cd7c0d782a813e` |
| [Conrad, Gross–Zagier revisited, author final copy; §§8–9](https://math.stanford.edu/~conrad/papers/gzfinal.pdf) | 2026-10-07 | `7eac62b943ebd035de37f40df6054e1300ba4a0f02356cca919635eef994fdbe` |
| [Erratum to On the averaged Colmez conjecture; 11 January 2022 author version; published Annals 198 (2023) text not acquired](https://web.math.princeton.edu/~shouwu/publications/Erratum.pdf) | 2026-10-07 | `6e89ac290a087287ae314fb52ef82cf95125b6c224084a9a094e2ff774ce58f2` |
| [Erratum to On the averaged Colmez conjecture; 18 December 2022 author version; published Annals 198 (2023) text not acquired](https://web.math.princeton.edu/~shouwu/publications/Erratum5.pdf) | 2026-10-07 | `18b46acd0f6be352d4bc5b4d7797650be3e228712e13de94bbb45ec25b576c91` |

## Validation and Lean limitations

- `scripts/check_blueprint.py` with the pinned declaration index: **0 errors, 0 warnings**, 241 nodes, all eight stages planned.
- `scripts/check_errata.py` on an errata-v1 wrapper of the packet's 85 findings and version records: **0 errors**.
- Intake deliverable checks: allowed paths, valid JSON and no private local paths.
- Additional consistency checks: exact required-source set and uniqueness, owned DAG acyclicity, all node/API declaration names present, all 197 exact named-test comments present before examples, reader node coverage and unchecked implementation statuses.

**The complete suggested Lean file did not compile.** `lean-check` stopped at the missing compiled module `TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight`. The shared Mathlib build is at the required pin, but it does not supply the required compiled Tau Ceti height interface. No library build, update, cache download, language server, repository copy or second Lean process was started.

A Mathlib-only check extracted the 231 newly added node blocks and the three independent original nodes (completed derivative, unit index, Artin convention), with their API and examples, without faking Tau Ceti declarations. It **passed for 234 node signatures, 244 API items and 181 named tests**, plus one auxiliary example checking the actual rational-module action on A⊗ℚ via tensor symmetry. Its only warnings were 613 admitted-declaration warnings. The seven original Tau-dependent nodes were not elaborated: x-canonical height, BSD height pairing, BSD regulator, height convention dictionary, rational canonical height, trace versus average, and real period components. The full file's 198 examples include all 197 packet tests and one auxiliary convention example. These checks establish syntax and types only; many geometric hypotheses cannot be expressed until supplier carriers exist.

The scratch sources, generators and logs are removed after PR submission as WORKERS.md requires. No continuation depends on their paths: the declarations, exact remaining work, locators, version hashes and ownership requests are preserved in these four deliverables. This run submits one job and stops.
