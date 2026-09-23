# Qian (2023): extraction and routing

Issue [#1252](https://github.com/CBirkbeck/tauceti-explorer/issues/1252). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged checkpoint of codex-a71f92, whose report follows below as history.
- **The paper.** L. Qian, *Potential automorphy for GL_n*, Invent. Math. 231 (2023), 1239–1275. The published PDF (NSF PAR copy) matches the checkpoint's hash (77969caa…).
- **Items.** The result has **112 items: 9 library, 17 planned and 86 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** Thirteen are recorded under `sourceIssues`. E13 concerns arXiv v1 and is already corrected in the published version.

## This continuation (cc-442dc5)

**E2 now affects a stated result (Theorem 1.4).**
- **The cited theorem.** Theorem 1.4 is deduced from ACC+ Theorem 6.1.2. Condition (4) of that theorem reads "There exists σ ∈ G_F − G_F(ζ_p) such that ρ(σ) is a scalar. We have p > n." This wording appears in arXiv 1812.09999v1, the version Qian cites, and in v2.
- **The proof.** It says it suffices to verify conditions (3) and (4), and that "all conditions except decomposed genericity follows from the corresponding conditions of r". But Theorem 1.4 assumes only that l is odd.
- **The consequence.** For odd l ≤ n, Theorem 1.4 is not established by the paper. Item 010 states the l > n version.
- **What is unaffected.** Theorem 1.1 (residual) does not use ACC+ 6.1.2.

**E1 was confirmed.**
- **The problem.** Lemma 3.12 asserts that N is maximally nilpotent with no condition on t. But for t ∈ O_{F_v} with t^N − 1 a unit, Lemma 3.11(2) makes V_t crystalline, so N = 0.
- **The fix.** The hypothesis v(t) < 0 is needed. It holds in §4's application.

**The other findings** were read at their locators and stand as recorded.

**Gaps.** S8 and S9 are recorded as findings. The others are deferred as cited suppliers' proofs or design work.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once, and the mistakes are recorded, including the unestablished prime range of Theorem 1.4.

## Mistakes found (`sourceIssues`)

- **E1** (error; affects a stated result), Main paper Lemma3.12, publisher PDF pp.29–30. *Printed:* is maximally nilpotent *Correction:* Add v(t)<0 at the local place in the statement, as used in its proof and in §4; item071 has this hypothesis.
- **E2** (gap; affects a stated result), Main paper Theorem1.4, PDF p.3, and its final proof PDF p.36; ACC+ published Theorem6.1.2(4), pp.1029–1030. *Printed:* Let l be an odd prime number. *Correction:* For the cited proof impose l>n, or supply a different lifting theorem covering the remaining odd-prime range. Item010 uses the verified l>n range; the broader assertion remains open in this extraction.
- **E3** (misprint; affects nothing), Main paper final paragraph of Theorem1.4 proof, publisher PDF p.36. *Printed:* F′ *Correction:* Replace the field asserted disjoint from the normal closure over Q by K=L'L F_suff(zeta_N); then F'=FK and ACC+ Lemma7.1.7 applies. Item089 retains these distinct fields.
- **E4** (misprint; affects nothing), Main paper Lemma2.3 proof, last displayed target, publisher PDF p.12. *Printed:* N∤l^(r/2)−1 *Correction:* Use N∤l^(r/2)+1.
- **E5** (error; affects the proof), Main paper §4 determinant-character preparation, publisher PDF p.32. *Printed:* n|#(k(λ)×) *Correction:* Replace n by its prime-to-l part m, where n=l^a m; all n-th roots of unity means m|(l^r−1). The l^a power map is an automorphism on finite-field units.
- **E6** (gap; affects the proof), Main paper §4 auxiliary-prime determinant quotient, publisher PDF p.32, last paragraph before W. *Printed:* (k(λ′)×)^n *Correction:* Supplement Lemma3.9 with the direct cancellation detV/detSymH1=(q^((N−2n−1)/2)∏g(v,b))^n. At l'≡1modN the factor belongs to Q_l'; hence reduction lands in n-th powers of F_l'. The coefficient-field notation in the preceding image assertion must consistently refer to l', not the unrelated original prime.
- **E7** (gap; affects the proof), Main paper §4 use of Lemma2.1 at lambda', publisher PDF p.32, following Proposition4.1. *Printed:* Lemma 2.1 *Correction:* Ensure k(lambda') contains mu_n; one sufficient extra choice is l'≡1modlcm(N,n), in addition to the printed prime conditions. Item074 records this repair.
- **E8** (misprint; affects nothing), Main paper Lemma3.11(1), publisher PDF p.29. *Printed:* G_F *Correction:* Use G_Fv for the representation attached to a parameter t∈F_v.
- **E9** (misprint; affects nothing), Main paper §4, determinant of Sym^(n−1)r_(E,l'), publisher PDF p.32. *Printed:* (χ_cyc)^(n(n−1)/2) *Correction:* With r_(E,l') defined in Proposition4.1 as H^1_et(E,F_l') and chi_cyc the action on roots of unity, use exponent −n(n−1)/2. Alternatively explicitly change to the Tate-module dual convention throughout.
- **E10** (misprint; affects nothing), Main paper Lemma3.3(2) proof, publisher PDF p.19 (PDF image checked). *Printed:* W(k)[1/p]≅C *Correction:* Choose an abstract embedding W(k)[1/p]→C and base change the model along it; no surjectivity is needed.
- **E11** (error; affects a stated result), Qian, Ordinarity of Local Galois Representation Arising from Dwork Motives, arXiv2103.00106v1 Lemma4.2, PDF p.20; cited in main Lemma3.12/Remark3.13. *Printed:* Then r is regular and ordinary. *Correction:* Restore the consecutive labelled Hodge–Tate hypothesis in BLGHT Lemma2.2(2): weights0,...,n−1, or a rigorously justified de Rham character shift. Item103 uses this corrected criterion; item105 is restricted to the selected family with item067.
- **E12** (gap; affects the proof), Qian arXiv2103.00106v1 Theorems1.6/3.2, PDF pp.4–5 and14–18, inverse-limit proof. *Printed:* log smooth *Correction:* For the comparison proved by this argument, require the lift to be proper (or provide replacement finiteness and completion hypotheses). Items098–099 use the proper case actually needed for Dwork.
- **E13** (gap; affects the proof), Main paper arXiv2104.09761v1 end of Theorem1.1 proof, PDF pp.24–26; corrected publisher Lemma4.3 and Remarks3.13/4.4. *Printed:* ordinarily automorphic *Correction:* Use the published Steinberg/central-character argument: away-from-l maximal monodromy plus Varma's bound forces Steinberg, and the labelled-weight valuation calculation proves automorphic ordinarity.

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **S1, Global character roots and Moret–Bailly originals** (deferred). Global character roots and Moret–Bailly are cited suppliers.
- **S2, Fermat, hypergeometric and rank-two source leaves** (deferred). Fermat, hypergeometric and rank-two inputs are cited suppliers.
- **S3, Finite transvection and PSL classification** (deferred). The finite transvection and PSL classification are cited suppliers.
- **S4, Ordinary automorphic Hecke calculation** (deferred). The ordinary Hecke calculation is Geraghty's, a cited supplier.
- **S5, Coefficient transfer and cuspidal recognition** (deferred). Coefficient transfer and cuspidal recognition are cited suppliers.
- **S6, Varma and local Langlands original proof chain** (deferred). Varma and the local Langlands chain are cited suppliers.
- **S7, Toroidal refinement and logarithmic comparisons** (deferred). The toroidal refinement and log comparisons (KKMSD, Illusie, Hyodo–Kato, Tsuji) are cited suppliers.
- **S8, Repair and delimit the companion ordinarity theorem** (recorded). The companion paper's slips are E11 and E12; items 103 and 105 use the corrected criterion.
- **S9, Independent review of source findings and missing prime range** (recorded). The prime range of Theorem 1.4 is E2 (now affecting a stated result); item 010 states the l > n version. Independent review of the findings is the review job's task.
- **S10, Complete itemization and final ownership audit** (deferred). Itemization refinement and the ownership audit are design work.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result.

The following was also checked:
- **Items and routes.** Item ids are unique, and every missing item is routed exactly once.
- **The cited hypothesis.** ACC+ Theorem 6.1.2(4) was read in arXiv v1 and v2.

No Lean deliverable is part of a paper job.

**For the reviewer.**
- Check E2 against ACC+ Theorem 6.1.2(4).

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or classifies E2 as affecting only the proof, this continuation supersedes it.

## PAPER-QIAN-23 — partial extraction and routing

Codex — codex-a71f92; issue #1252; 2026-09-22.

This is a substantive checkpoint, not a complete extraction or a formalization. The JSON contains 112 items: 9 pinned-library items, 17 planned items and 86 missing items; all missing items have exactly one route. All 38 definitions/constructions have use-derived API outlines and three mathematical test specifications. All 74 theorem items have proof outlines, and the recorded dependencies form an acyclic graph. S1–S10 delimit what is still needed.

### What the paper proves

For a CM field F, a finite avoidance extension F_av/F, n≥2 and odd l, every continuous semisimple residual representation G_F→GL_n(F_(l^s)) becomes ordinarily automorphic after a finite CM Galois extension F'/F linearly disjoint from F_av. This is Theorem1.1; it does not assume polarization or residual irreducibility. The proof uses a deliberately asymmetric character of a Dwork family, full special-linear geometric monodromy, determinant-preserving frames, and a switch between two coefficient primes. The geometric objects remain distinct from the automorphic realization and the endpoint theorem. [Published paper](https://par.nsf.gov/servlets/purl/10388233).

Theorem1.4 treats a supplied ordinary regular potentially semistable l-adic lift, with absolute residual irreducibility, decomposed genericity, enormous cyclotomic image and a scalar element outside the cyclotomic subgroup. Its citation of ACC+6.1.2 leaves a prime-bound gap: the latter assumes l>n. Item010 retains that bound; the printed wider odd-prime range is an unresolved obligation, not silently adopted. [ACC+ published source](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Theorem6.1.2.

### Versions and reading coverage

Read all37pages of the publisher-formatted main PDF, §§1–4, all proofs, remarks and bibliography, and all24pages of [Qian's local-ordinarity companion](https://arxiv.org/pdf/2103.00106). The main PDF is the online-first journal version with the correct DOI; its footer is the publisher's running123, so main-paper page locators are PDF-page counts. It includes the corrected ordinary-automorphy argument missing from arXivv1. The [publisher record](https://link.springer.com/article/10.1007/s00222-022-01161-6) identifies the final2023volume231, pages1239–1275.

The JSON records public URLs, SHA-256 hashes and exact selected portions of ACC+, BLGHT, Varma and the early main-paper arXiv version. Those selected reads are not described as whole-source reads. In particular Varma's introductory results and Definition1 were read, not the complete proof or the2024publication PDF. Original Deligne, Levelt, finite-group classification, global duality and semistable comparison leaves remain explicit gaps. The [Deligne volume record](https://link.springer.com/book/10.1007/978-3-540-38955-2) lists a chapter erratum which must accompany its §7 extraction. The [Zalesskii–Serezhkin publication record](https://doi.org/10.1070/IM1976v010n01ABEH001676) was authenticated, but the attempted English-PDF link redirected to the portal.

| Source portion | Principal extraction |
|---|---|
| §1 | Residual/ordinary/automorphic definitions and both endpoints; items001–010,111 |
| §2 | Avoidance, character roots, Sha/duality, auxiliary modulus, slopes and symmetric powers; 011–028,106,112 |
| §3 | Family, characters, realizations, monodromy, torsors, determinants and Hodge/period calculations; 029–071,107–110 |
| §4 | Lifting, auxiliary seed, point construction, coefficient transfer and Steinberg ordinary bridge; 072–090 |
| Local-ordinarity companion §§1–4 | Equivariant semistable models, log/HK/GAGA/monodromy comparisons, corrected ordinary criterion and descent; 091–105 |

The late-numbered items split distinct outputs of Lemma2.2, Proposition3.2, rank-two monodromy, Varma's two assertions, real-coefficient descent and the cohomology carriers. Imported theorem packages still need finer subdivision after their original sources are read; this is one reason status remains partial.

### Baseline and ownership evidence

Baseline: Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and TauCetif790474821cf4256814db967cb154e7af3d0c369. Every positively cited declaration was opened and its statement/hypotheses read. The positive cases are the finite-Galois linear-disjointness/intersection equivalence, Goursat, generic Gauss sums and their shift/product identities, and continuous H1/H2 carriers with trivial-action H1. The Gauss-sum sign wrapper is explicit. None of these supplies Fermat cohomology, Poitou–Tate duality or the finite classical-group classification.

Reviewed audits read: AUDIT31 G7/R01.1/R01.2 and AG2.4/AG2.5/AG2.7; AUDIT02 R02.4; AUDIT01 complex C3/C5; AUDIT19 LPV.1. The JSON records the exact declaration files and the bounded library searches. No merged audit entry found for a target is not evidence that no implementation exists. Relevant owner documents/stage descriptions were read before routing.

The final overlap check found PAPER-CALEGARI-GERAGHTY-18/dwork-family and sec10-dwork-point, which already identify the polarized Dwork input as missing and route its endpoint use to ML.2. This proposal therefore does not claim to discover the shared family for the first time. The design brief requires one common family/projector interface, specialization to the different characters, and explicit reconciliation of that coarse source allocation. Do not make ML.2's completed automorphy theorem an input to its own geometric prerequisite. S10 is an acceptance gate for this coordination; no earlier extraction is edited here.

### Routes

| Route | Owner | Layers or proposal | Items |
|---|---|---|---:|
| 1 | ModularityAndLanglandsExtensions | ML.0, ML.2 | 5 |
| 2 | ModularityAndLanglandsExtensions | ML.3 | 1 |
| 3 | ArithmeticGaloisRepresentations | R01.1, R01.4, R01.5, R01.6, G7 | 7 |
| 4 | AutomorphicGaloisRepresentationsPartII | AG2.0, AG2.4, AG2.5, AG2.7 | 6 |
| 5 | PadicHodgeTheory | R06.2, R06.3 | 5 |
| 6 | PotentialAutomorphyInfrastructure | PA.2 | 5 |
| 7 | PotentialAutomorphyInfrastructure | PA.3 | 1 |
| 8 | PotentialAutomorphyInfrastructure | PA.5 | 1 |
| 9 | PotentialModularityAndCompatibleSystems | R23.1 | 3 |
| 10 | ArithmeticGaloisDuality | R02.2, R02.4 | 7 |
| 11 | SchemeAndStackFoundations | SF.4 | 3 |
| 12 | CrystallineCohomology | CR.5, CR.6 | 6 |
| 13 | CohomologyComparisons | CP.4 | 1 |
| 14 | ComplexComparisonPartII | C2, C3, C5 | 1 |
| 15 | LefschetzPencilsAndVanishingCycles | LPV.1 | 2 |
| 16 | PotentialAutomorphyDworkMotivesPartII | Proposed Part II | 49 |

#### Route 1: ModularityAndLanglandsExtensions

Place automorphic/residual witnesses and the two potential-automorphy endpoint assemblies in ML.0/ML.2. The new Dwork owner only constructs the switching family and controlled point; it must not depend on this endpoint. Item010 records the supported l>n range and keeps Qian's wider assertion open.

#### Route 2: ModularityAndLanglandsExtensions

The elliptic symmetric-power seed is a source-qualified instance in the symmetric-power endpoint direction, with its full avoidance quantifiers. It is not a new general symmetric-power or modularity roadmap.

#### Route 3: ArithmeticGaloisRepresentations

Reuse the owner of continuous arithmetic representations, residual tensor/symmetric powers and general residual-image criteria. Add the explicit enormous-image, finite-group and avoidance source contracts here; no replacement of upstream class field theory or a duplicate generic residual-image theory. The transvection classification is not certified until S3 is discharged.

#### Route 4: AutomorphicGaloisRepresentationsPartII

This owner already plans automorphic Galois realization, local normalization, Varma's semisimplified/monodromy-bound compatibility and decomposed genericity. Keep a monodromy bound distinct from equality; genericity is a ratio exclusion, not pairwise distinctness.

#### Route 5: PadicHodgeTheory

Use the period-functor, filtered phi/N-module and local p-adic representation owner for regular ordinary flags, the crystalline criterion, the correctly Hodge-bounded maximal-N criterion, and descent. Import geometric comparisons from CP.4; do not prove B_st a second time here.

#### Route 6: PotentialAutomorphyInfrastructure

The GL_n ordinary tower, normalized positive Hecke operators and ordinary local–global interfaces belong to PA.2. Qian's Steinberg/central-character bridge is additional source material here, not a GL2 Hida-theory replan. The Galois-to-automorphic implication is restricted to the proved Dwork/Steinberg setting.

#### Route 7: PotentialAutomorphyInfrastructure

The ordinary lifting theorem is an imported, fully qualified proof interface for PA.3's support/patching infrastructure. Its potential-automorphy application is assembled in ML.2, not claimed as a new PA endpoint. Preserve p>n and the scalar-outside-cyclotomic condition.

#### Route 8: PotentialAutomorphyInfrastructure

Coefficient-prime transfer and automorphic recognition are the PA.5 bridge. Import generic compatible-system operations from PotentialModularityAndCompatibleSystems:R24.5:operations, not the separate two-dimensional existence theorem. Smooth proper realizations alone do not settle the semisimplicity gate S5.

#### Route 9: PotentialModularityAndCompatibleSystems

Reuse the generic Moret–Bailly/field-avoidance existence interfaces in R23.1, including the determinant-character root extension. These do not require or recreate the Hilbert-modular moduli problem of R23.2. The cohomological obstruction mechanism is owned separately by ArithmeticGaloisDuality.

#### Route 10: ArithmeticGaloisDuality

Global Sha kernels, Poitou–Tate pairing and transfer calculations belong here. Import the already-existing continuous cohomology carriers and the upstream ProfiniteCohomology maps; import finite local duality/invariants from ClassFieldTheory. Do not re-plan those upstream roadmaps.

#### Route 11: SchemeAndStackFoundations

Use the semistable-model/alteration owner for the equivariant Dwork blowup instance and its ramified semistable refinement. Full toroidal cone-complex subdivision remains S7; compare the existing nonarchimedean toric proposal before introducing any generic new machinery.

#### Route 12: CrystallineCohomology

Log structures, log differentials, the dlog monodromy triangle and proper mixed-characteristic Hyodo–Kato comparison stay with CR.5/CR.6. Finite-level transition maps and finiteness are explicit; this route does not claim the full geometric B_st comparison.

#### Route 13: CohomologyComparisons

CP.4 owns the geometric semistable period comparison and its phi/N/filtration compatibility, applied to the character projector. Reuse CP.2/CP.3 for other crystalline/de Rham interfaces; the Dwork family only consumes those comparisons.

#### Route 14: ComplexComparisonPartII

Add the proper logarithmic GAGA application to the existing coherent-GAGA and complex-comparison owners, importing CR.5's log differentials. Ordinary smooth de Rham comparison alone is not an asserted theorem for the singular log special fibre.

#### Route 15: LefschetzPencilsAndVanishingCycles

General nilpotent monodromy, analytic nearby degeneration and the Gauss–Manin residue interface belong with LPV.1, importing ComplexComparisonPartII:C5 and CR.5 for the log-de-Rham description. The Dwork companion-matrix computation remains in the family-specific extension.

#### Route 16: PotentialAutomorphyDworkMotivesPartII

The atlas has general potential-automorphy infrastructure and endpoints, but no layers for this asymmetric Dwork family's full-SL monodromy, determinant-root compatibility and two-prime switching torsor. Add those geometric layers in the existing direction, not a competing endpoint roadmap. Existing PAPER-CALEGARI-GERAGHTY-18/dwork-family and sec10-dwork-point already identify the shared polarized family as missing and route its endpoint use to ML.2; this proposal must supply/reuse one shared geometric carrier rather than create a second definition.

Build the geometric switching package for n≥2, odd l, N odd with N>100n+100 and gcd(N,nl)=1, the selected exponent multiset and the CM base containing zeta_N. Final family theorems: the cyclotomic eigensheaves have rank n; for n>2 their residual geometric monodromy is SL_n(k(lambda)) under the residue-degree/nonunitary condition, while n=2 uses the real-cyclotomic descent and SL2=Sp2; two distinct admitted residual primes with max characteristic>10 give product monodromy and a geometrically connected fixed-determinant isomorphism torsor (Proposition3.8). Prove the Gauss determinant formula and prime-specific n-th-power matching, the consecutive labelled Hodge weights, crystallinity at good fibres, ordinary behavior near t=0 when l≡1 modN, and maximal away-from-l monodromy only at v(t)<0. The controlled-point output is item081: prescribed two twisted residual realizations at a CM Galois extension, original-prime negative valuations, auxiliary-prime positive valuations, and precisely based avoidance intersections. Supply finite avoidance fields and the auxiliary seed representation as INPUTS to this geometric theorem; do not import an automorphy endpoint to construct its torsor. Use generic motive projectors and realizations from Algebraic cycles, pure and mixed motives (MotivesAndAlgebraicCycles:MC.1,MC.2); models from Scheme, stack, cohomology and intersection foundations (SchemeAndStackFoundations:SF.4); log/HK structures from Crystalline cohomology, de Rham–Witt and logarithmic foundations (CrystallineCohomology:CR.5,CR.6); B_st from Cohomology comparisons (CohomologyComparisons:CP.4); Betti/de Rham comparison from Complex Comparison PartII (ComplexComparisonPartII:C3,C5); generic monodromy from Lefschetz pencils, nearby cycles and vanishing cycles (LefschetzPencilsAndVanishingCycles:LPV.1); local ordinary criteria from P-adic Hodge theory and geometric comparison (PadicHodgeTheory:R06.2,R06.3); image criteria from Arithmetic Galois representations and conductors (ArithmeticGaloisRepresentations:G7); character-root duality from Global Galois duality and compact coefficients (ArithmeticGaloisDuality:R02.2,R02.4); and Moret–Bailly from Potential Modularity And Compatible Systems (PotentialModularityAndCompatibleSystems:R23.1). Reuse pinned linear disjointness, Goursat and Gauss sums. PotentialAutomorphyInfrastructure:PA.2/PA.3/PA.5 consume this package for ordinary automorphy, lifting and coefficient transfer; ModularityAndLanglandsExtensions:ML.2 owns Theorems1.1/1.4 and ML.3 the seed. There is no reverse import from these endpoint assemblies. Resolve S1–S10 and source corrections before certifying closure; particularly do not use Qian2021 Lemma4.2 without Hodge bounds or erase the p>n lifting hypothesis. Ownership coordination: read PAPER-CALEGARI-GERAGHTY-18/dwork-family, sec10-dwork-point and its ML.2 source route. Reuse its common hypersurface, symmetry and rank-two/BLGHT interfaces; specialize a single character-projector family to the polarized and asymmetric characters. ML.2 is the consumer of these geometric inputs, not an imported automorphy result. Before design acceptance reconcile the existing coarse ML.2 source allocation with this reusable prerequisite package, at definition-level granularity and without an ML.2→family→ML.2 cycle. This extraction does not edit or supersede the earlier route. The additional Qian layers are the asymmetric character, full-SL monodromy, determinant matching and unpolarized switching conditions; no second shared Dwork implementation is authorized.

### Source findings

There are13 findings, all awaiting independent review except that E13 records an identified published correction; it is still logged for verification. The full records give short source excerpts, locators, correction arguments, effect and the correction search. The author page, arXiv versions and publisher were checked; “new” means no correction found in that limited search, not a priority claim. No author was contacted.

- E1: Lemma3.12 needs v(t)<0. At t=0 good reduction gives N=0, contradicting maximality for rank n≥2; the main application already chooses negative valuation.
- E2: The cited ACC+ lifting theorem requires l>n, absent from Theorem1.4. Item010 records the supported range, without asserting that the wider theorem is false. Residual Theorem1.1 chooses a sufficiently large auxiliary prime and is not affected by this particular omission.
- E3: In the final avoidance paragraph, K=L'L F_suff(zeta_N), not F'=FK, is disjoint from the residual normal closure over Q. Both F' and that normal closure contain F.
- E4: The final target in Lemma2.3's proof has a minus sign where its nonunitary exclusion and subsequent argument require a plus sign.
- E5: The finite-field roots-of-unity condition concerns the prime-to-l part m of n=l^a m, not n|(l^r−1). The case n=l=3 detects the difference.
- E6: Lemma3.9 only supplies n-th powers after a quadratic coefficient extension. For the auxiliary prime, direct cancellation with detSymH1 gives (q^((N−2n−1)/2)∏g(v,b))^n in Q_l', resolving the smaller-field descent; the prime notation must also be consistent.
- E7: The literal auxiliary use of Lemma2.1 requires mu_n in F_l'. Add l'≡1modn to the auxiliary prime choice, compatibly with l'≡1modN and the density/finite exclusions.
- E8: Lemma3.11(1) is a representation of G_Fv for a local parameter, not automatically of G_F.
- E9: The positive cyclotomic determinant exponent in §4 is the Tate-module convention. For the defined H1_et realization it is negative; item077 fixes geometric Frobenius to avoid conflating conventions. This sign finding particularly needs independent normalization review.
- E10: The unramified p-adic fraction field W(k)[1/p] is not isomorphic to C. An abstract embedding, followed by base change, is enough for Lemma3.3's comparison.
- E11: The companion's Lemma4.2 omits BLGHT2.2(2)'s consecutive Hodge weights. A maximal nilpotent N alone does not imply an ordinary flag; the filtered-module witness below demonstrates the obstruction.
- E12: The companion's inverse-limit proof invokes proper coherent pushforward and finite generation despite stating only log smoothness. The extracted comparison explicitly assumes the proper setting used for Dwork.
- E13: The early arXiv ordinary-automorphy inference is corrected in the published Lemma4.3/Remarks3.13 and4.4. Follow the Steinberg/central-character proof, not an unqualified reversal of local–global ordinarity.

For E11, take a filtered (phi,N)-module over Q_p with phi(e1)=p e1, phi(e2)=p²e2, N(e2)=e1 and N(e1)=0. Put Fil0=D, Fil1=Fil2=Fil3=<e1+e2>, Fil4=0. Then Nphi=p phiN and tH(D)=tN(D)=3. The only proper nonzero phi,N-stable line is <e1>, with tH=0<tN=1. Thus D is weakly admissible but has no admissible line; the corresponding semistable representation has maximal N but no ordinary flag. This uses the standard admissibility equivalence, whose source-level expansion remains S8. BLGHT2.2(2) explicitly assumes weights0,...,n−1. Qian's selected family has consecutive weights, but the labelled character shift must still be supplied; the companion's arbitrary-character endpoint is not certified by this checkpoint.

### Prerequisites and handoff

The new prerequisite requests are the local-ordinarity companion, Beukers–Heckman, Deligne's Fermat calculations (with the listed erratum), and Zalesskii–Serezhkin. BLGHT is already requested by CG18 and should be reused, not queued twice. ACC+ already has a programme paper job; Varma, Geraghty, global duality, log geometry and geometric comparisons are source-depth obligations of their existing owners, not new duplicate roadmaps.

#### S1 — Global character roots and Moret–Bailly originals

Read NSW8.6.7,9.1.6,9.1.9 and the exact Moret–Bailly/CHT4.1.2 variant in their original sources. Decompose local obstruction killing, finite support, restriction/corestriction squares, totally real realization, Galois closure and simultaneous avoidance. The paper's proofs are read but those imported leaves are not closed.

#### S2 — Fermat, hypergeometric and rank-two source leaves

Read Deligne's Fermat cohomology §§7.4,7.6,7.10, Beukers–Heckman/Levelt3.5 and the remaining BLGHT4.3/4.7 proofs. Split integral torsion-freeness, analytic/étale lattice comparison, Picard–Lefschetz, residue Hodge calculation and real descent into qualified independent imports. Do not promote a finite-field Gauss identity to a cohomology theorem. The publisher lists an erratum to Deligne's chapter; check it before extracting §7.

#### S3 — Finite transvection and PSL classification

Read the original Zalesskii–Serezhkin main theorem, qualify all fields/dimensions, and verify the classical-group normal-subgroup and cross-characteristic quotient arguments including exceptional small isomorphisms. Item051 is a contract used by Qian, explicitly not an original-source-verified classification.

#### S4 — Ordinary automorphic Hecke calculation

Read Geraghty's published Definition5.3/Lemma5.4 with the correct publication numbering and the precise polarized and nonpolarized local–global directions. Expand the positive diagonal monoid, normalized Hecke eigenvalues and the labelled parallel-weight generalization in Lemma4.3; current items retain the bridge but not every imported proof lemma.

#### S5 — Coefficient transfer and cuspidal recognition

Close the compatibility/projector coefficient field, semisimplicity of the selected realizations, irreducibility after base change, cuspidality and descent interfaces in the switch. Equal good-prime polynomials yield only semisimplified recognition without extra input. Read the underlying potential-automorphy/compatible-system proof leaves beyond the selected ACC+ passages.

#### S6 — Varma and local Langlands original proof chain

The v1 intro main statements and Definition1 were read, not the full paper. Collate with the 2024 FMS publication and extract the local Langlands Sp normalization, inertia, Steinberg and monodromy-order proof inputs. No unrestricted bad-prime monodromy equality is claimed.

#### S7 — Toroidal refinement and logarithmic comparisons

Read the exact KKMSD cone-complex subdivision, Illusie log-comparison/Gauss–Manin, Hyodo–Kato, Ogus and Tsuji inputs. Resolve generic ownership against the existing AnalyticToricGeometryNonarchimedeanPartII proposal, rather than creating another toric foundation. Verify properness and finite-generation hypotheses through every limit and comparison.

#### S8 — Repair and delimit the companion ordinarity theorem

Independently check E11's filtered-module witness against the admissibility theorem, supply a crystalline/de Rham character with the specified labelled shift M(a), and verify its preservation of maximal N. The chosen Dwork family has consecutive weights; the companion's arbitrary-character Theorem1.1 needs a separate Hodge-weight argument and is not certified by this checkpoint.

#### S9 — Independent review of source findings and missing prime range

Review all thirteen source issues at the recorded versions, especially l>n in E2, the finite-field root condition in E7, the convention-sensitive E9 determinant sign, and E11. Seek an applicable small-prime lifting theorem if retaining the full printed Theorem1.4. 'No correction found' is limited to the logged search.

#### S10 — Complete itemization and final ownership audit

After closing the preceding original-source leaves, split the remaining imported multi-step packages (finite classical groups, toroidal refinement, the lifting proof, ordinary Hecke operators and comparison diagrams) into every required definition and theorem. Recheck reviewed audits and concurrent routes, provide exact implementation files/planet choices in the subsequent design/blueprint jobs, and only then assess complete status. No Lean deliverable is authorized by this paper issue. In particular reconcile CG18's existing dwork-family/sec10-dwork-point source allocation to ML.2 with the shared geometric carrier of the proposed extension; reject duplicate definitions or a coarse-stage dependency cycle.

### Validation

The paper validator, exact-three-file intake check, paper/source-issue test suites, and structural checks are run before submission; their final results are recorded in the JSON. Separate mathematical spotchecks passed8852 assertions across n=2,3,4,5,6,7,8,11,12: exponent-list length/sum, complement cardinality/sum, stabilizer, all unit-embedding Hodge grades, opposite-residue Gauss multiplicities, and the characteristic3 root condition. The filtered-module witness was checked arithmetically. These are finite sanity checks, not proofs of the general statements.

No Lean file was created or compiled: only this report, its JSON and the handoff note are authorized. Planning API/test names must not be interpreted as existing declarations. Status remains partial regardless of validator success.
