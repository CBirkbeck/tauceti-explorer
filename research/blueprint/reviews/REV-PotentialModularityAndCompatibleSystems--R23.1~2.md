# Independent round-2 review: potential modularity and compatible systems

Verdict: **accepted**. Completed by Codex, session `codex-IKZVSm`, on 2026-10-08. Refs #7080. Review job: `REV-PotentialModularityAndCompatibleSystems--R23.1~2`.

This independently reviews the revision `BP-PotentialModularityAndCompatibleSystems--R23.1~2`, last changed at `93dbe4a33182e0e7d9f36b5993bd0956d933e407` in PR #7424 by session `codex-BiJOuf`. The checkout used was `79b660d8301c7130d540164b334dc77e8bb5994b`. This session authored none of the original packet, its revision, or the earlier review. The [first review](REV-PotentialModularityAndCompatibleSystems--R23.1.md) and the revision's [handoff](../handoff/BP-PotentialModularityAndCompatibleSystems--R23.1~2.md) were read before checking the deliverables.

All 49 nodes are verified or corrected against the public target passages and the stated supplier boundaries. No unresolved contradiction remains between the corrected packet, reader and suggested-file omissions. Acceptance certifies a complete target-level planning pass: the explicit proof and interface gaps remain open, and it certifies neither a closed proof graph nor compiled Lean.

## Counts and coverage

| Item | Revision input | After review |
| --- | ---: | ---: |
| Nodes | 49 | 49 |
| Definition / construction / lemma / theorem / application | 1 / 3 / 14 / 26 / 5 | 1 / 3 / 14 / 26 / 5 |
| API entries | 36 | 36 |
| Test specifications | 22 | 22 |
| Planets | 17 | 17 |
| Pinned declarations | 9 | 9 |
| Explicit gaps | 22 | 22 |
| Open supplier requests | 33 | 33 |
| Source issues | 9 | 11 |
| Planned / closed stages | 8 / 0 | 8 / 0 |

The per-node verdicts are **17 corrected, 32 verified, zero added and zero unverifiable**. No baseline citation was removed or replaced. The packet retains `status: complete`, every node retains `implementationStatus: unchecked`, and all eight stages retain `planned`. Each stage's targets have a mathematical node or the explicitly described R23.6 export/assembly role. R23.6 has no invented theorem or planet. The compatible-system construction in R24.3–R24.6 remains outside this part. Target-level bundles are appropriate; this review does not claim a lemma-level source decomposition.

## Earlier review requirements

The revision repairs the reader contradictions that prevented the first review's acceptance. Moret–Bailly splitting uses scalar extension to L_v; it allows a completion properly contained in L_v. Taylor's auxiliary data uses q_v=l^f_v, the separate reduced-character branches and coefficient fields over Q. Distinguishedness is on the decomposition group, and the auxiliary prime/field compatibility remains a named gap. The inverse inertia comparison in Lemma 1.5 is consistent with E4.

The prior API extensions and all six additional tests remain present. Odd auxiliary lifting, torsion Fontaine–Laffaille, full Hilbert crystallinity, general Weil restriction, local analytic density and the continuous deformation-point adapter have precise requests or gaps. BCGP's finite-quotient argument has its general number-field interface, rather than an inapplicable CM/Q-Galois theorem. The reader uses the correct function-field Isom base and the corrected BCGP cover. It distinguishes framed from unframed finiteness and gives the NT determinant, prime, residual-image and component hypotheses. No unsupported Lean verification claim survives. The session's own-word rule was applied throughout; inherited prose quotations were replaced by mathematical specifications and source locators.

## Corrections in this review

1. **Local density and conic test.** MB II 1.6.1–1.6.2 and 2.1 (pp. 183, 185) make the characteristic-zero comparison tautological because the relevant closures coincide. The statement is not empty. Taylor's Theorem G (author pp. 4–5) supplies a finite totally real point field for the conic test, without a quadratic degree bound.
2. **KW input interfaces.** Checked KW Annals bibliography [44]–[45] (p. 253) and removed the unresolved numbering claim; exact unread base-change applicability remains open. Added the existing R22.5 beta residual-modularity predicate as a direct given-lift prerequisite, beside alpha. The dyadic weight and the distinct odd/dyadic lifting guards are retained.
3. **Residual finite-image criterion.** KW Annals Lemma 3.6 (p. 241) concerns the characteristic-p universal deformation ring. In KW II Theorem 10.1 (pp. 90–92), finite universal residual image gives finiteness of R/(p), using the deformation-functor and trace hypotheses. Completeness and Nakayama then give coefficient-module finiteness. The request no longer conflates this with a characteristic-zero finite-image criterion.
4. **Taylor ordinary and determinant statements.** The inverse inertia comparison is expressed in its corrected form without copied prose. The rational prime p splits in the chosen totally real field, so the local field in the ordinary argument is Q_p (Taylor 2002 pp. 13–15). Corollary 1.7 (pp. 15–16) allows two general characters with inertia ratio epsilon^n; it does not impose Theorem 1.6's whole-decomposition-group determinant shape. The nonroutine 2-torsion Brauer obstruction, character square root, compatible totally real field choice and twisting-back input remain explicit in the existing gap.
5. **Taylor local and weight formulas.** In Corollary 1.5 (Taylor 2006 pp. 742–743), both residual character alternatives are restricted to inertia. In Lemma 5.3 (p. 768), the character is the inverse of the whole product of the adelic norm and the l-adic determinant. Arithmetic normalization then gives the Ny and (Ny)^2 Hecke factors. Suggested-file comments now locate Theorem 5.7 at pp. 770–771 and Lemma 5.1/Corollary 5.2 at pp. 765–767.
6. **Two further source slips.** E11 records the unquotiented middle term in the composite display of Lemma 5.1 (p. 766). E12 records the trace subfield and abelian dimension labels on p. 762, compared with Lemma 4.4 (p. 761). The corrected H6 tensor construction is used in the node. These are contextually determined misprints; the intended results are unchanged.
7. **Snowden's general variety.** Proposition 8.2.2 (p. 26) first needs a dense affine open meeting the prescribed local opens before using representable Weil restriction. Added that step and attached the existing analytic-density/property adapter gap to this consumer. The preliminary soluble field and the split field retain their distinct roles.
8. **Ordinary finiteness.** Thorne Theorem 10.2 and Theorem 3.11 (author pp. 56–58, 10–11) use fixed regular Hodge type and semistable ordinary local quotients. The totally real GL2 specialization needs the finite polarized CM restriction adapter. CG's R-dagger and NT's selected potentially crystalline components need explicit local or finite-base-change comparison; they are not identified with these quotients by the word ordinary.
9. **Reader, metadata and omissions.** Applied every node, request, gap, source-issue and coverage correction to the reader. Propagated the missing suggested interfaces to all affected stages. All nine baseline records now include this review's independent confirmation; all 19 source records include the precise passages actually read. Replaced inherited source prose quotations by own-word statements. The Lean changes are comments only, verified by comparing the code after removing nested comments.

The full per-node table below identifies every changed node. No new mathematical node, request, gap, API entry, test or planet was needed; the additional missing inputs fit the existing precise gap/request records.

## Baseline and supplier boundaries

The exact pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All nine declarations and their surrounding implicit parameters were independently read at these commits.

| Declaration | Pinned module and line | Confirmed use and boundary |
| --- | --- | --- |
| `IntermediateField.LinearDisjoint` | `Mathlib/FieldTheory/LinearDisjoint.lean:157` | Tensor multiplication injectivity, not a definition by intersection. |
| `IntermediateField.LinearDisjoint.inf_eq_bot` | Same module, line 394 | Linear disjointness implies trivial intersection. |
| `IntermediateField.LinearDisjoint.iff_inf_eq_bot` | Same module, line 468 | Converse requires the stated Galois and finite-dimensional assumptions. |
| `NumberField.Chebotarev.frobeniusPrimeSet` | `TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.lean:93` | Number-field unramified Artin-class set; no prime-existence or density result. |
| `AlgebraicGeometry.Spec` | `Mathlib/AlgebraicGeometry/Scheme.lean:468` | Scheme spectrum and morphism formulation of field-valued points. |
| `AlgebraicGeometry.Scheme.Modules.pullback` | `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean:182` | For X→Y, pulls Y-module sheaves to X-module sheaves. |
| `TauCeti.AlgebraicGeometry.InvertibleSheaf` | `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:78` | Existing rank-one full subcategory. |
| `TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial` | Same module, line 97 | Existing trivial rank-one sheaf. |
| `TauCeti.AlgebraicGeometry.LineBundleClass.mk_eq_mk_iff` | `TauCeti/AlgebraicGeometry/LineBundle/Class.lean:62` | Unrigidified equality iff an isomorphism exists; boundary compatibility is additional. |

The pinned line-bundle classes provide a commutative monoid, not the relative Picard group, sheaf or representability needed here. H6/AUDIT-15 and SF.3/AUDIT-01 were checked in the reviewed library audit: twisted torsion/local-point geometry is missing, whereas invertible sheaves/classes and function-field divisor/Riemann–Roch theory already exist. No audit row is keyed by this roadmap; that absence was not treated as evidence of nonexistence. Existing foundations are imported and their missing extensions stay with their owners.

Read the complete upstream Chebotarev and GlobalNumberFields reader documents and the ClassFieldTheory layer-7/layer-12 interfaces. Chebotarev layer 10 supplies number-field Dirichlet density and hence primes outside a finite set. It does not directly supply function-field constant-degree conditions or Frobenius tubes for finite étale covers. GlobalNumberFields' additive finite-adele approximation omits the archimedean places; it does not imply projective-module approximation off an arbitrary place. Its norm-one idelic compactness does not establish the full generalized-Jacobian quotient. ClassFieldTheory's finite-order character interface does not supply algebraic CM characters or fixed-degree Grunwald assertions.

The following fine supplier statements were read, with their hypotheses and scope:

- `DeformationAndDerivedPatchingAlgebra:R03.4/characteristic-zero-points-from-finiteness-and-dimension`.
- `GL2ModularityLifting:R22.3/minimal-ring-finite`.
- `GL2ModularityLifting:R22.5/kw-residual-modularity`.
- `GL2ModularityLifting:R22.5/solvable-base-change-reduction`.
- `GL2ModularityLifting:R22.5/kw-odd-prime-lifting`.
- `GL2ModularityLifting:R22.6/kw-dyadic-lifting`.
- `GlobalGaloisDeformations:R04.2/carayol-trace-theorem`.
- `GlobalGaloisDeformations:R04.3/global-dimension-lower-bound`.
- `GlobalGaloisDeformations:R04.6/kw-deformation-data`.
- `GlobalGaloisDeformations:R04.6/trace-subring-universal-representation`.
- `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`.
- `AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`.
- `PadicHodgeTheory:R06.4/fontaine-laffaille-crystalline-comparison`.
- `LocalGaloisDeformationRings:R08.6/export-completed-tensor-product`.
- `LocalGaloisDeformationRings:R08.6/local-nonemptiness`.
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting`.
- `PadicFamilies:L5/hida-control-nearly-ordinary`.
- `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-functor`.
- `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`.
- `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`.
- `GL2ModularityLifting:R22.5/kw-residual-modularity-beta` (independently read in its supplier packet; the existing weight-two/conductor predicate added to the consuming node).

These 21 contracts are partial suppliers where indicated. R03.4's finite-local-algebra extraction does not supply continuity or a residue-compatible deformation point. R06.4's rational Fontaine–Laffaille comparison and R19.5's restricted crystallinity do not supply the full torsion/Hilbert conclusions. Hida specialization is not the complete family/local-type nonemptiness argument. Away-p semistable tensor-domain hypotheses and the odd/dyadic lifting cases are kept distinct. Snowden Theorem 7.6.1 was read independently (pp. 23, 25); its global-lifting contract is still requested from R04.6, without an R24.2 dependency cycle.

## Assigned confirmed red-team findings

Read the finding and its independent verification for each of the eight assigned items.

| Finding | Checked result in this packet and reader |
| --- | --- |
| RT-AREA-langlands-2/3 | Residual modularity keeps the Hida, Gross/weight and auxiliary lifting inputs distinct and explicit. |
| RT-AREA-langlands-2/23 | H6 owns twisted simultaneous torsion, pairings, connectedness and all local points; R23.2 applies that object. |
| RT-AREA-langlands-2/24 | Base change/descent belongs to R17.4/R17.6, while R23.5 records the controlled extension and conditional descent interface. |
| RT-AREA-langlands-2/25 | MB's local tensor splitting permits proper subfields as completions and retains incompleteness. |
| RT-AREA-langlands-2/26 | CHT 4.1.1–4.1.2 use divisible characters and soluble local extensions with auxiliary ramification, without an unrestricted fixed cyclic degree. |
| RT-AREA-langlands-2/27 | Frobenius-prime existence is an imported Chebotarev conclusion, not the pinned prime-set definition. Function-field conditions remain open. |
| RT-AREA-langlands-2/28 | Snowden supplies general totally real residual targets; BCGP's F1/F field control, KW's weights and the dyadic branch remain separate. |
| RT-AREA-langlands-2/29 | Thorne's polarized CM finiteness needs the GL2 adapter; CG's unrestricted away-p conditions and R-dagger comparison remain precise. |

## Public sources and source issues

All 19 downloaded public PDF artifacts match the recorded SHA-256 hashes. The packet and reader retain their URLs, editions, hashes and dated reading scope. The following are records of passages checked for the targets, not claims to have read every paper's entire proof or citation tree. No restricted book was used.

| Public artifact | Independent reading scope |
| --- | --- |
| [moret-bailly-1989-II](https://www.numdam.org/item/10.24033/asens.1582.pdf) | Sections 1–3, printed pp. 181–193: Skolem objects, density and reductions, rigidified Picard/divisor fibration, both degree inequalities, approximation and compact quotient. Page images independently checked on pp. 181–183, 189 and 192, including tensor scalar field, approximation polynomial, fibration degree bound and E3. |
| [moret-bailly-1989-I](https://www.numdam.org/item/10.24033/asens.1581.pdf) | Printed pp. 161–163, 1.3, 1.5, 1.7 and 1.11: normalized integral points, property (T), arithmetic bases and the empty-local-data/Rumely proof route. This does not certify the part-I Picard proof or any cited book. |
| [taylor-2002-fontaine-mazur](https://virtualmath1.stanford.edu/~rltaylor/fm.pdf) | Theorem G and section 1 target passages, printed pp. 4–16. Page images independently read on pp. 7–16 for all auxiliary character choices, local points, Lemma 1.5, Theorem 1.6 and Corollary 1.7; E4–E6 checked and the p-adic norm/Teichmuller branches recomputed. Published text not obtained. |
| [kw-serre-modularity-II](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) | Theorem 6.1 and all branches, printed pp. 53–57; Theorem 3.1/Proposition 3.2, pp. 18–19; Proposition 4.5, p. 42–43, and Corollary 4.7, pp. 45–46; Theorem 8.2, pp. 70–71; section 9.1 setup and Theorem 9.7, pp. 78–80, 89–90; Theorem 10.1 and section 10.3, pp. 90–93. This checks target statements and imported proof boundaries, not the full patching proof. |
| [kw-annals-2009](https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf) | Theorem 2.1 and proof, printed pp. 234–237; Lemma 3.6 and proof, p. 241; Lemma 3.9 minimal-inertia statement and proof, pp. 242–243; bibliography [44]–[45], p. 253. The finite-image criterion is for the characteristic-p deformation functor. |
| [taylor-2006-meromorphic-continuation](https://ems.press/content/book-chapter-files/27484) | Section 1 target passages, printed pp. 739–743; section 4, pp. 755–763, including Proposition 4.1, its proof and Corollary 4.6; section 5 target statements and proofs, pp. 764–771; corrections pp. 776–777. Images pp. 762, 766–767, 776–777 checked. Corrected whole-product weight-shift inverse; independently confirmed E9/E10 and added E11/E12. |
| [qian](https://par.nsf.gov/servlets/purl/10388233) | Opening section 2 disjointness statements, and Proposition 4.2 with the three local condition classes and its application. Lemma 2.1 remains outside this packet. |
| [cht](https://pmihes.centre-mersenne.org/item/10.1007/s10240-008-0016-1.pdf) | Lemma 4.1.1 and Lemma 4.1.2, printed pp. 116–117, with complete proofs: divisible-character extension with auxiliary ramification, soluble Galois completions and disjointness, without a prescribed cyclic degree. |
| [blght](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf) | Proposition 6.2 and proof, author pp. 40–41: preliminary extension, invariant local conditions, product local opens and restriction of scalars. |
| [bhkt](https://arxiv.org/pdf/1609.03491v2) | Author version v2 section 9, pp. 50–52: Isom torsor setup, Lemma 9.1, Proposition 9.2, Theorem 9.3 and proofs, compared with the publication and explicit 2025 correction. |
| [bianchi](https://arxiv.org/pdf/2309.15880v3) | Proposition 4.5.1 and proof, author pp. 48–49: equivariant CM local fields, every-conjugacy-class tubes and surjective finite-quotient specialization; the exact-completion refinement remains imported. |
| [bcgp-published](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf) | Propositions 9.1.11–9.1.12, printed pp. 458–459, and Lemma 9.2.7, pp. 462–463. The latter uses K and L-prime/K-prime with independently prescribed completions above split places; it does not supply the erroneous descent to K. |
| [snowden](https://arxiv.org/pdf/0905.4266) | Theorem 5.1.1–5.1.2, pp. 15–16; section 5.2 approximation; section 5.3 moduli application; Proposition 5.4.1 and its induced character proof, pp. 17–18; Theorem 4.4.2, p. 13; Theorem 7.6.1 and proof, pp. 23, 25; Theorem 8.1.1 and Propositions 8.2.1–8.2.2, pp. 25–26. Original residual, auxiliary residual and descent hypotheses remain distinct. |
| [calegari](https://arxiv.org/pdf/1012.4819) | Theorem 3.1 and Proposition 3.2, author pp. 5–6, complete statements and proofs: free permutation quotient, local Krasner argument, Jordan and full avoidance-field disjointness. |
| [thorne](https://www.dpmms.cam.ac.uk/~jat58/bigness.pdf) | Theorem 10.2 with polarized setup and proof, author pp. 56–58; Theorems 3.9 and 3.11, pp. 10–11, identifying the fixed-weight semistable ordinary local quotient. Patchwork/adequacy proof not certified. Certificate verification failed on download; matching recorded SHA-256 was obtained with verification disabled. |
| [cg](https://math.uchicago.edu/~fcale/papers/CG.pdf) | Theorem 4.8 proof, PDF pp. 65–68: chi_phi, ordinary R-dagger/eigenvalue problem, unrestricted away-p rings, and unframed finiteness citation. No proof of the multiplicity theorem is planned here. |
| [newton-thorne](https://arxiv.org/pdf/2212.03595v2) | Section 3 setup and Lemma 3.1 proof, author pp. 12–14, including determinant, p>=5, large SL2 image, Hodge–Tate {0,2} selected components and extraction. Lemma 2.6, p. 12, checks the Steinberg-to-ordinary input. |
| [bhkt-published](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf) | Section 9, printed pp. 76–79: relative Isom torsor, Lemma 9.1, Proposition 9.2 and Theorem 9.3 with the fixed-constants/split-place argument. |
| [bhkt-correction](https://arxiv.org/pdf/2502.20611v1) | Author p. 28 only: explicit correction to the base of the finite-etale Isom scheme and selection of a nonconstant point. Other results in this paper are outside the present reading. |

Critical displayed formulas were checked on page images: MB's tensor scalar field, divisor-fibration degree bound and lemma number; Taylor's auxiliary characters, ordinary comparison, quotient display and trace/dimension labels. Thorne's download initially failed certificate verification; disabling verification produced the exact recorded artifact hash. This transport limitation does not establish publisher authenticity beyond the matched public artifact.

Every `sourceIssues` entry has this review's independent `confirmed` verdict. The nine inherited issues were rechecked rather than adopted on the previous review's authority. E2–E6 concern the explicitly identified author-copy or Numdam passages; Taylor 2002's published text was not obtained, so the author-copy findings are not attributed to unseen published wording. E7 is checked against published BCGP 9.1.12 and the different-completion construction in 9.2.7. E8 is checked against published BHKT 9.1, author v2 and the explicit 2025 correction. E9 compares Taylor 2006's corrections with the 2002 auxiliary norm; E10 compares the printed symmetric powers with the weight-i+2 coefficient convention.

New **E11**: the middle term of the composite on Taylor 2006 p. 766 must be the quotient by beta rather than the unquotiented source module. This follows from Lemma 5.1's statement (p. 765) and the kappa/beta calculation (p. 767). New **E12**: the pairing on p. 762 traces from EM to E, and B=A tensor O_EM has dimension [EM:Q]. The preceding pairing and Lemma 4.4 (p. 761) fix these labels. Both are harmless misprints and are used in their corrected forms. A scoped search of Taylor's author page, the publisher-hosted chapter, its pp. 776–777 corrections and targeted public search found no correction to these slips as of 2026-10-08. This is the recorded search scope, not a universal priority claim.

## API, tests, planets and validation

| Object | API entries | Test specifications | Distinguishing examples |
| --- | ---: | ---: | --- |
| Skolem data / integral point | 10 | 5 | Completeness obstruction, scalar splitting and every embedding. |
| Rigidified Picard / divisor fibration | 11 | 7 | Boundary-sensitive equality, quotient descent and forgetting the rigidification. |
| Auxiliary totally real field | 7 | 4 | The actual witness object, image/type guard and dyadic weight. |
| Taylor auxiliary data | 8 | 6 | Full local-character distinction, norm and unit/conjugate choices. |

The existing API outlines expose constructors, object equality/descent, functoriality, compatibility and examples without claiming the omitted geometric objects exist. The 22 tests would distinguish plausible wrong mathematical definitions. Every API/test name is present in the reader and accounted for by a declaration or explicit omission in the suggested file. The 17 planets name central objects/results, with at most six per stage and no process-only planet.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/PotentialModularityAndCompatibleSystems--R23.1.json`: zero errors, zero warnings.
- `scripts/check_errata.py` on a scratch-only `errata-v1` projection of this packet's issues/versions: passed.
- Consistency check: every node statement, hypothesis, proof step, acceptance item, request, gap and coverage item agrees with the reader; all 49 review IDs and the 17 actual node edits match; all 19 artifact hashes match; all 36 API and 22 test names are accounted for.
- Lean comment-stripping comparison: code is unchanged by this review. `git diff --check`: passed.

After checking available memory, ran `lean-check` on the suggested file. It stopped at the first import because the compiled `TauCeti.AlgebraicGeometry.LineBundle.Class` object is absent in the shared build. Its Mathlib checkout matches the pin, but its Tau Ceti checkout differs. Relevant line-bundle source blobs were compared with the pin and are unchanged; this does not substitute for a compiled import. **No whole-file elaboration or fragment elaboration is certified by this review.** The revision's historical fragment result remains attributed to its author. No extra Lean code, library build, cache download or language server was used.

## Per-node record

The full IDs and these own-word notes are also in `review.checked`. Each row records the source boundary and any clear correction; open nonroutine proof inputs are the corresponding explicit gaps/requests.

| # | Stage / node key | Verdict | Evidence or correction |
| ---: | --- | --- | --- |
| 1 | `R23.1/skolem-datum-and-integral-point` | verified | MB II 1.1–1.2/1.5/1.8, pp. 181–184: all embeddings and scalar splitting are correct. Full Skolem conditions/geometric comparison are explicitly omitted in Lean, with five discriminating tests and ten API items. |
| 2 | `R23.1/density-of-algebraic-and-separable-local-points` | corrected | MB II 1.6.1–1.6.2/2.1, pp. 183,185: checked the separable-root approximation and excellence hypothesis. Replaced the misleading characteristic-zero empty-statement wording by the equality of closures. |
| 3 | `R23.1/elementary-reductions-of-skolem-data` | verified | MB II 1.4/1.9/1.10, pp. 182–184: Chow, shrinking and spreading-out are imported from SF.4, with the local-density gap preserved. No relative-Picard duplication. |
| 4 | `R23.1/reduction-to-relative-dimension-one` | verified | MB II 2.2–2.4, pp. 185–187: finite horizontal subscheme and Bertini reduction account for the curve target; missing geometric suppliers stay explicit. |
| 5 | `R23.1/generalized-picard-functor-and-effective-divisor-fibration` | verified | MB II 3.1–3.6, pp. 187–189: boundary-compatible isomorphism quotient, kernel units, degree d>=2g+z-1 and fibre dimension checked. Existing line bundles/classes do not provide relative Picard representability. Seven tests and eleven API items distinguish rigidification. |
| 6 | `R23.1/local-picard-open-sets-and-strong-approximation` | verified | MB II 3.7–3.8, pp. 190–191: d>=2g+z differs from the fibration bound. An omitted place is essential; general projective-module approximation is an exact extension request to GlobalNumberFields. |
| 7 | `R23.1/quasi-compactness-of-the-generalized-jacobian-quotient` | verified | MB II 3.9–3.10.4, pp. 191–193: checked compact quotient, powers accumulating at identity and the omitted-place S-unit argument. The idelic norm-one supplier does not discharge this quotient; E3 is confirmed. |
| 8 | `R23.1/moret-bailly-theorem-incomplete-skolem-data-have-integral-points` | verified | MB II 1.3/1.5, p. 182, and MB I 1.7/1.11, pp. 162–163: scalar extension is to L_v and need not prescribe equality of completions; incompleteness is retained. |
| 9 | `R23.1/taylor-theorem-g-split-completely-points-are-dense` | corrected | Taylor Theorem G, printed pp. 4–5, via MB II 1.3: smooth geometric irreducibility/local opens give density over the maximal split field. Removed an unsupported quadratic degree bound from its conic acceptance test. |
| 10 | `R23.1/forcing-linear-disjointness-by-extra-split-places` | verified | KW II Theorem 6.1 proof, pp. 55–56, Snowden 5.2.2 and pinned disjointness: Galois split places meet each required Frobenius class. Prime existence and almost-all local points are imports, not the pinned set definition. |
| 11 | `R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F` | verified | KW II Theorem 6.1, pp. 53–57: read every branch, local-containment/image condition and dyadic exception. Independent auxiliary lifting, Hida and weight/level suppliers remain explicit; no original global lift is assumed. |
| 12 | `R23.3/kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity` | corrected | KW Annals Theorem 2.1, pp. 234–237: p odd, k!=p and ordinary/nonordinary outputs match. Clarified the checked [44]/[45] bibliography ambiguity while retaining the unread exact base-change theorem as a gap. |
| 13 | `R24.1/auxiliary-totally-real-field-for-the-finiteness-argument` | verified | KW II 10.1, pp. 90–91: the type-A witness has the dyadic weight-two guard; type BC and residual inertia data remain separate. E2 is independently confirmed; four tests concern the actual reduced object. |
| 14 | `R24.1/kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring` | corrected | KW II Theorem 10.1, pp. 90–92, and KW Annals Lemma 3.6, p. 241: clarified that finite universal image first gives finiteness of R/(p), with trace-generation and deformation hypotheses, then completeness gives coefficient-module finiteness. |
| 15 | `R24.2/characteristic-zero-points-of-R-bar-S-psi-give-lifts-of-required-type` | verified | KW II 4.5/4.7 and 10.3.1, pp. 42–46,92: finite local ring plus positive dimension gives a characteristic-zero integral point; R03.4 is algebraic only. Local continuity/residue/framing adapters stay open. |
| 16 | `R23.1/theorem-g-from-moret-bailly` | verified | MB II 1.3/1.5/1.9 and Taylor Theorem G: the extra inverted place and local analytic-density input justify the open-set deduction. The proof does not substitute weak approximation for strong approximation. |
| 17 | `R23.4/potential-modularity-of-a-given-lift` | corrected | KW II 10.3.2 and 9.7, pp. 89–93: a lift is input data. Added the existing fine beta predicate beside alpha and preserved the odd/dyadic lifting split and their exact hypotheses. |
| 18 | `R23.5/control-of-the-extension` | verified | KW II 6.1(iii), pp. 54–57: split, contained local extension, image preservation and avoidance are distinct. Automorphic descent belongs to R17.4/R17.6 and is conditional on its own hypotheses. |
| 19 | `R23.2/taylor-auxiliary-data-p-L-psi-N-M` | verified | Taylor 2002 pp. 7–9 and 2006 pp. 776–777: independently checked q_v norm, both local character branches, full decomposition-group distinction and the unit conjugate. General field-choice compatibility remains a separate gap; six tests and eight API items remain honest fragments. |
| 20 | `R23.2/taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions` | corrected | Taylor 2002 Lemma 1.1, pp. 8–9: precise determinant/local character construction matches. Removed the inherited prose quotation of E5; global algebraic CM character and S-unit inputs remain beyond finite-order CFT. |
| 21 | `R23.2/local-points-at-l-p-infinity-and-the-point-over-E` | verified | Taylor 2002 pp. 10–13 and 2006 pp. 761–762: H6 owns twisted schemes, local points, connectedness and family; this node only applies approximation to all prescribed opens. |
| 22 | `R23.3/taylor-lemma-1-5-ordinary-shape-of-the-lambda-adic-tate-module-at-l` | corrected | Taylor Lemma 1.5, pp. 13–15: n range, semisimplicity guard, reduction type and ordinary shape checked. Rephrased the inverse inertia comparison using n=1, with E4 confirmed and no Lean-check claim. |
| 23 | `R23.3/modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar` | corrected | Taylor pp. 13,15: clarified why the chosen rational p splits in F and E_x=Q_p. Auxiliary residual modularity is independent; CM-induced exceptional lifting and cross-prime compatibility remain exact imports/gaps. |
| 24 | `R23.3/taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l` | corrected | Taylor Theorem 1.6/Corollary 1.7, pp. 15–16, and corrected determinant argument p. 777: restored general two-character Corollary shape and inertia ratio. Explicitly retained the Brauer/square-root/twisting-back input, alongside the unprinted proof. |
| 25 | `R23.3/taylor-2006-potential-modularity-when-residually-irreducible-at-l` | corrected | Taylor Proposition 4.1/Corollary 4.6 and proof, pp. 755–763: niveau-two exponents, split l, even degree and central character match. Removed a prose quotation and used the corrected trace/dimension from the H6 tensor construction (new E12). |
| 26 | `R23.3/taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations` | corrected | Taylor Lemma 1.3, pp. 740–741: Jacquet–Langlands and the integral Hecke Galois realization are different suppliers. Replaced the source prose quotation by those own-word interface requirements. |
| 27 | `R23.3/taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l` | corrected | Taylor Lemma 1.4/Corollary 1.5, pp. 742–743: both residual character shapes are inertia restrictions. Corrected the second group label and clarified the separate full crystallinity/torsion Fontaine–Laffaille requests. |
| 28 | `R23.3/taylor-2006-lemma-5-1-corollary-5-2-weight-reduction` | corrected | Taylor Lemma 5.1/Corollary 5.2, pp. 765–767: Symm^i convention, localized V condition and quotient-domain injection match. Added the p. 766 missing quotient as E11; E10 remains confirmed. |
| 29 | `R23.3/taylor-2006-lemma-5-3-weight-shift` | corrected | Taylor Lemma 5.3, p. 768: corrected the inverse of the whole norm-times-l-adic determinant character, giving the required Ny and (Ny)^2 Hecke factors. The polynomial determinant identity matches; no Lean proof is claimed. |
| 30 | `R23.3/taylor-2006-lemmas-5-4-5-6-weight-and-level` | corrected | Taylor Lemmas 5.4–5.6, pp. 768–770: l>3, exact conductor/weight changes and unread CDT/base-change boundaries checked. Rephrased the inherited source quotation. |
| 31 | `R23.3/taylor-2006-theorem-5-7-serre-weight-at-level-one` | verified | Taylor Theorem 5.7, pp. 770–771: locally irreducible residual branch, Serre weight, even degree and complete splitting match. The separate p=3 input is not silently covered by l>3; fixed suggested comment pages. |
| 32 | `R23.1/frobenius-primes-generate` | verified | Snowden 5.2.2 and upstream Chebotarev layer 10: number-field outside-finite-set existence is imported. Function-field arithmetic Frobenius and constant-degree conditions remain an exact gap. |
| 33 | `R23.1/cht-character-extension` | verified | CHT Lemma 4.1.1, pp. 116–117: divisible roots of unity and a finite ray-class quotient permit auxiliary ramification, with no prescribed cyclic degree. Global and local reciprocity conventions are separate imports. |
| 34 | `R23.1/cht-soluble-prescribed-completions` | verified | CHT Lemma 4.1.2, p. 117: induction on soluble local Galois groups gives exact completions and disjointness. No unrestricted fixed-degree Grunwald assertion or function-field substitution. |
| 35 | `R23.1/tower-linear-disjointness` | verified | Qian opening section 2 and pinned field API: linear disjointness passes through the preliminary field; intersection is only an equivalent criterion with the stated Galois assumptions. |
| 36 | `R23.1/moret-bailly-three-local-conditions` | verified | Qian Proposition 4.2: S1 split rational opens, S2 invariant unramified opens and S3 algebraic-closure opens remain distinct; real places produce total reality. |
| 37 | `R23.1/moret-bailly-over-a-preliminary-extension` | verified | BLGHT Proposition 6.2, pp. 40–41: preliminary-field Weil restriction, every local factor and conjugate-stable opens checked. Affine reduction plus A6 geometric product is honest; property/topology adapter remains missing. |
| 38 | `R23.1/surjective-specialisation-finite-quotient` | verified | Bianchi Proposition 4.5.1, pp. 48–49: exact equivariant CM completions and finite-quotient surjectivity need Frobenius tubes and Jordan. This stronger completion refinement is not inferred from ordinary Skolem splitting. |
| 39 | `R23.1/function-field-isomorphism-torsor` | verified | BHKT Lemma 9.1, published pp. 76–77/v2 pp. 50–51, and 2025 correction p. 28: finite etale base is Y_K, geometric surjectivity gives connected curve, nonconstant point gives field embedding. E8 confirmed. |
| 40 | `R23.1/function-field-point-with-fixed-constants` | verified | BHKT Proposition 9.2, pp. 77–78: additional split places kill Galois intersections and coprime degrees kill constant extensions. Almost-all local points and function-field Chebotarev remain explicit imports. |
| 41 | `R23.1/potential-global-galois-local-data` | verified | Calegari Theorem 3.1, pp. 5–6, and BHKT 9.3, p. 79: free quotient/Krasner/Jordan number-field route and MB90 function-field route have distinct conclusions. Stronger Galois/avoidance/constant constraints are not added to MB90. |
| 42 | `R23.2/restriction-of-scalars-moduli-application` | verified | BCGP 9.1.11 and Snowden 5.3: R23.2 evaluates H6’s supplied simultaneous-torsion family after restriction of scalars; it does not duplicate the scheme or local ordinary tube. |
| 43 | `R23.1/snowden-soluble-preliminary-field` | corrected | Snowden Proposition 8.2.2, p. 26: added the dense affine reduction before Weil restriction, preserving all local opens by analytic density. F1 handles local completions; F2 is split and avoids F1 times the avoidance field. |
| 44 | `R23.3/snowden-totally-real-potential-residual-modularity` | verified | Snowden 5.1.1,5.4.1,8.1.1–8.2.1, pp. 15–18,25–26: original residual needs no A1/A2; auxiliary and residual-descent inputs do. Read 7.6.1 independently and retained its exact owner/request without an R24.2 cycle. |
| 45 | `R23.3/bcgp-controlled-residual-modularity` | verified | BCGP Proposition 9.1.11, p. 458: representation over F1, ordinary weight-zero witness over F1F-prime, split p/q and avoidance over F all match; no original-field modularity asserted. |
| 46 | `R23.5/bcgp-local-galois-data-without-descent` | verified | BCGP Proposition 9.1.12, pp. 458–459, and Lemma 9.2.7, pp. 462–463: cover is L-prime over KE-prime with differing split-place data; no descent to K. E7 confirmed against the published version. |
| 47 | `R24.1/ordinary-global-ring-finiteness` | corrected | Thorne 10.2, pp. 56–58, and 3.11, pp. 10–11: tightened the local problem to fixed-weight semistable ordinary rings. The CM GL_n theorem needs a finite polarized totally-real GL2 adapter, not mere terminology. |
| 48 | `R24.1/cg-ordinary-ring-finiteness` | verified | CG18 Theorem 4.8 proof, PDF pp. 65–68: R_phi is unframed, R-dagger is the chosen ordinary/eigenvalue local problem and away-p conditions are unrestricted. Its Thorne comparison and exceptional-image input remain the precise gap. |
| 49 | `R24.2/newton-thorne-khare-wintenberger-extraction` | verified | Newton–Thorne section 3/Lemma 3.1, pp. 12–14: p>=5, determinant, large residual image and selected {0,2}/Steinberg/regular components checked. Finiteness needs the local comparison; algebraic extraction does not by itself provide continuity or automorphy. |

## Orchestrator follow-up

No correction remains necessary for this review to be accepted. The packet's 22 gaps and 33 open requests are the precise remaining mathematical work, rather than requests to repeat this target-level review.

1. Route the existing determinant-twist gap to the owner of the global 2-torsion Brauer/character-square-root input, including compatible totally real/split field choice and twisting back. Finite-order CFT alone is insufficient.
2. Preserve the R04.6 ownership of Snowden's independent global-lifting interface and the R21.4/R04.6 polarized ordinary-finiteness adapter. CG/NT local-ring comparisons must be supplied with their exact finite-base-change hypotheses.
3. Request the extension of upstream GlobalNumberFields for arbitrary omitted-place projective-module approximation and the generalized-Jacobian quotient. Function-field Chebotarev/constant-degree and finite-cover Frobenius specialization are separate supplier interfaces.
4. Before certifying the suggested file, provide the required compiled imports at the pinned Tau Ceti baseline. The existing full-object API/test omissions then need their suppliers; the present arithmetic/objectwise examples do not close that work.
5. During assembly, fold the R23.6 process/export panel into the introduction and export ledger unless a separate mathematical target is supplied. It introduces no new theorem here.
