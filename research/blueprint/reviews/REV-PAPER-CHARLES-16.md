# REV-PAPER-CHARLES-16 — independent review

Reviewer: **Codex — codex-hjdg0j**, 24 September 2026. Refs #1189.

**Verdict: revise.** Accept source routes **5, 6, 8, 9**; reject activation of **1, 2, 3, 4, 7**. The extraction has 173 items: 16 library, 17 planned, 140 missing. All missing items have exactly one route. This is a useful inventory, but its earlier `complete` claim confused numbered-statement coverage with proof-input closure. G1 and G3–G6 still require source and proof work. The corrected result is `partial`.

This worker did not write this extraction or any earlier review of it. The source documents and pinned declarations were checked independently. Earlier workers' historical reading claims are preserved as history, not adopted as this reviewer's evidence. The closed earlier review PR's body and maintainer comments were read to establish independence; its review files were not used as a source of verdicts.

## Reading evidence and limits

The full 40-page published Charles paper, the full 20-page LMS arXiv v5 manuscript, and the two-page Charles 2013 erratum were independently read. Charles's older author draft was checked only at pp.24–25. Nikulin's published statements 1.13.4 and 1.15.1–1.15.5 were inspected through the publisher PDF (printed pp.124,128–130); this is not a full read of his local classification/strong-approximation proofs, and some OCR formulas are damaged.

| Source | Version and independent read | SHA-256 of downloaded file |
|---|---|---|
| [Charles 2016](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf) | Published pp.487–526, all 40 PDF pages | `3425f2697b3600f7920f1bdce67681339d06a20dfaf39ea4fdc2a0baebc940e2` |
| [Lieblich–Maulik–Snowden](https://arxiv.org/pdf/1107.1221) | arXiv v5, all 20 pages | `66ee971cf9449a7e76ca9a1a2f7332b54ec86330476ba115b08ab7670baa22d5` |
| [Charles 2013 erratum](https://www.math.ens.psl.eu/~charles/erratum.pdf) | Both pages; applies to the 2013 paper, not the 2016 paper | `ac3fcd9d25336725102f99a49e0ecd956f500cc2c6c88e8fcb27dd987d998b38` |
| [Charles author draft](https://www.imo.universite-paris-saclay.fr/~francois.charles/Zarhin_K3.pdf) | pp.24–25 only | `b859a0b875c1a6dcf4d5b04ba66ba7d7bfbefa50d08ed264ac5dee5822b8793a` |

[Nikulin, Integral symmetric bilinear forms and some of their applications](https://www.mathnet.ru/eng/im1677) supplies the genus/embedding boundary. The published LMS file was not freshly acquired by this reviewer; LMS verdicts here are based on the fully read arXiv v5. The inherited published-LMS comparison is not represented as an independent check.

The [Annals article page](https://annals.math.princeton.edu/2016/184-2/p04), [LMS arXiv record](https://arxiv.org/abs/1107.1221), author draft and separate erratum, and title-plus-erratum/correction searches were checked on 24 September. No correction to these particular passages was identified by those checks. Earlier Crossref checks are historical; no exhaustive priority or novelty claim is made.

The remaining Langer, Lieblich, Yoshioka, Mukai, Fontaine–Messing, Saint-Donat, global Torelli, Kisin, André, Rizov and Cassels proof interiors have **not** all been independently acquired and read. That limitation is a reason to reject the affected routes, not a reason to treat their proof obligations as complete. Charles's birational-to-a-Hilbert-scheme sentence on p.494 is stronger than the deformation statement extracted in item16; this review has not established the precise additional source/counterexample needed to classify that sentence as an erratum.

Two complete upstream roadmap documents were read for density and scope: `content/tau-ceti/Completed/IntegralLattices/README.md` and `content/tau-ceti/HodgeStructures/README.md`. Their completed linear algebra is imported. They do not supply Nikulin classification, K3 surfaces, analytic period maps or Kuga–Satake.

## Routes and owner contracts

### Route 1: reject

Reject activation. Correct K3/IHS owner direction, but items12,16,21–29,49–50,65–66,74–85,100–105,127–129,143 still depend on unexpanded source interiors. G1/G3/G4/G6 are open; source E21 is not discharged by a Tate-dependent rank assertion. Conditional item113 and the p≥5 prime-choice composition do not close the all-characteristic or partner hypotheses.

### Route 2: reject

Reject activation. Correct Part II parent and fixed-determinant/sign interface, with E15 rejected. The GIT/boundedness, period-index existence, K₀ realization, nonemptiness and twisted universal-family proof leaves have not been extracted from Langer/Lieblich/Yoshioka. Endpoint statements plus a future-reading instruction are not a closed brief.

### Route 3: reject

Reject activation. Correct generic-fiber parent and good-prime restriction; PEL normalization is not a substitute. Kisin/Deligne/André/Rizov and the corrected 2013 argument still require source-level proof decomposition and actual primitive filtered-lattice comparisons. The two-page erratum alone does not supply these proofs.

### Route 4: reject

Reject activation as a complete source packet. GN.2/GN.3 are the right owners beyond the completed lattice API, and the explicit primitive plane and local norm adapters are sound targets. G5 still defers the Nikulin genus/embedding proof interior; Cassels finiteness and local integral-lattice proof leaves remain unexpanded. No new copy of completed gluing or of Chebotarev is needed.

### Route 5: accept

Accept as a source route for the three scoped contracts: the zero-cycle Brauer obstruction in R09.3, and the stated K=0/fiberwise-big boundedness inputs in R09.1. The owner documents and AUDIT-01 distinguish these planned targets from the existing lower-level library API. This does not accept the K3 geometric route.

### Route 6: accept

Accept as a source route into V2/V3. These stages explicitly own Baily–Borel algebraicity and Borel algebraicity; the K3 period-map construction remains in rejected route1. AUDIT-11 records the general theorems as not built.

### Route 7: reject

Reject activation until early (1,1)/trace-descent leaves and late K3 Tate applications have explicit separate owner/dependency contracts. The proposed owner MC.7 is correct, but importing the whole stage into the K3 proof would create a cycle. The late endpoints also retain the unclosed route1 hypotheses.

### Route 8: accept

Accept as a source route: SF.5 explicitly owns intersection products, surface RR, adjunction and Hodge index. These are imports for the K3 application. AUDIT-01 does not credit the full target statements as implemented.

### Route 9: accept

Accept as a source route: A5 explicitly owns the complex abelian/integral Hodge comparison and its Hom identification. The application uses that comparison for endomorphisms of H¹; it does not require the general Hodge conjecture. AUDIT-08 records the target as not built.


The owner checks used the current atlas stage descriptions and `data/library-coverage.json`, with their underlying reviewed audits:

| Items / interface | Owner | Audit consequence |
|---|---|---|
| 45; 56,58 | R09.3; R09.1 | AUDIT-01: lower-level descent/scheme material is partly present; these Brauer/boundedness targets are not credited as built. |
| 62,64 | Shimura V2,V3 | AUDIT-11: neither full algebraicity theorem is built. |
| 90,125,130,133 and rational extension descent | MC.7 | The stage owns the statements, but has no direct reviewed coverage entry establishing them. Early (1,1)/trace and late Tate must be separated. |
| 134,139–141 | SF.5 | AUDIT-01: existing cycle/coherent pieces do not provide the stated surface intersection/RR package. |
| 135 | Abelian A5 | AUDIT-08: complex abelian/Hodge Hom comparison is not built. |
| 119 | Upstream Chebotarev Layer10 | AUDIT-03: the final density/identity-class infinitude target is not built; reuse the actual Artin/splitting API below. |
| split-local-embedding | Upstream NumberFieldArithmetic Layer5 | AUDIT-04: the canonical completion map is partly present, but local degree/semilocal comparison remains planned. Do not use an arbitrary completion algebra structure. |
| Missing lattice/arithmetic items | GN.2,GN.3 | AUDIT-02: GN.2 partly built, GN.3 not built; completed discriminant/gluing APIs are imports, not replanned targets. |

The good-prime orthogonal-model brief was checked against PEL M4 and ShimuraCompactifications C5: those explicitly exclude a blanket integral canonical-model conclusion. CR.1–CR.4 supply crystalline sites/cohomology with their own torsion and source gates; CP.2 is rational, CP.5's integral reconstruction retains adjacent-degree torsion hypotheses. R07.3's safe Fontaine–Laffaille range is [0,p−2] over an unramified base. ComplexComparisonPartII C5 does not manufacture integral lattices by complexification. These restrictions remain material to items28,82–85,143.

## Pinned-library audit

Every cited declaration was read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each source file's Git blob hash was checked against the corresponding pinned tree. This is a source-statement audit; no elaboration is claimed.

| Cited declaration | Pinned source |
|---|---|
| `mathlib:CliffordAlgebra` | [Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean:74](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean#L74) |
| `mathlib:CliffordAlgebra.ι` | [Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean:114](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean#L114) |
| `mathlib:CliffordAlgebra.ι_sq_scalar` | [Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean:122](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean#L122) |
| `mathlib:FiniteField.exists_root_sum_quadratic` | [Mathlib/FieldTheory/Finite/Basic.lean:81](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Finite/Basic.lean#L81) |
| `mathlib:Nat.infinite_setOfPred_prime_and_eq_mod` | [Mathlib/NumberTheory/LSeries/PrimesInAP.lean:430](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/PrimesInAP.lean#L430) |
| `mathlib:QuadraticForm.equivalent_weightedSumSquares_units_of_nondegenerate'` | [Mathlib/LinearAlgebra/QuadraticForm/IsometryEquiv.lean:177](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/QuadraticForm/IsometryEquiv.lean#L177) |
| `mathlib:hensels_lemma` | [Mathlib/NumberTheory/Padics/Hensel.lean:461](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/Hensel.lean#L461) |
| `tauceti:AlgHom.IsArithFrobAt.apply_eq_pow_absNorm_of_pow_eq_one` | [TauCeti/NumberTheory/NumberField/Cyclotomic/Frobenius.lean:96](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/Cyclotomic/Frobenius.lean#L96) |
| `tauceti:AlgHom.IsArithFrobAt.autToPow_eq_absNorm` | [TauCeti/NumberTheory/NumberField/Cyclotomic/Frobenius.lean:133](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/Cyclotomic/Frobenius.lean#L133) |
| `tauceti:NumberField.artinSymbol_eq_one_iff_ncard_primesOver_eq_finrank` | [TauCeti/NumberTheory/NumberField/ArtinSymbol.lean:223](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/ArtinSymbol.lean#L223) |
| `tauceti:NumberField.bijective_algebraMap_quotient_of_ncard_primesOver_eq_finrank` | [TauCeti/NumberTheory/NumberField/SplitsCompletely.lean:124](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/SplitsCompletely.lean#L124) |
| `tauceti:NumberField.ncard_primesOver_eq_finrank_iff` | [TauCeti/NumberTheory/NumberField/SplitsCompletely.lean:82](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/SplitsCompletely.lean#L82) |
| `tauceti:TauCeti.Hodge.PeriodDomain.Point` | [TauCeti/Geometry/Hodge/PeriodDomain.lean:71](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Geometry/Hodge/PeriodDomain.lean#L71) |
| `tauceti:TauCeti.IntegralLattice` | [TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:61](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/IntegralLattice/Basic.lean#L61) |
| `tauceti:TauCeti.IntegralLattice.IntermediateCarrier.discriminantOrthogonalQuotientIsometry` | [TauCeti/LinearAlgebra/IntegralLattice/Overlattice/OrthogonalQuotient/Quadratic.lean:216](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/OrthogonalQuotient/Quadratic.lean#L216) |
| `tauceti:TauCeti.IntegralLattice.IntermediateCarrier.discriminantOrthogonalQuotientIsometry_mk` | [TauCeti/LinearAlgebra/IntegralLattice/Overlattice/OrthogonalQuotient/Quadratic.lean:230](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/OrthogonalQuotient/Quadratic.lean#L230) |
| `tauceti:TauCeti.IntegralLattice.IntermediateCarrier.isEven_iff_isIsotropic_discriminantSubgroup` | [TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.lean:254](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.lean#L254) |
| `tauceti:TauCeti.IntegralLattice.discriminantPairing_rankOneClass_self` | [TauCeti/LinearAlgebra/IntegralLattice/RankOne.lean:352](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/IntegralLattice/RankOne.lean#L352) |
| `tauceti:TauCeti.IntegralLattice.discriminantQuadraticMap` | [TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.lean:122](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.lean#L122) |
| `tauceti:TauCeti.IntegralLattice.discriminantQuadraticMap_mk` | [TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.lean:129](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.lean#L129) |
| `tauceti:TauCeti.IntegralLattice.discriminantQuadraticMap_rankOneClass` | [TauCeti/LinearAlgebra/IntegralLattice/RankOne.lean:371](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/IntegralLattice/RankOne.lean#L371) |
| `tauceti:TauCeti.IntegralLattice.discriminantQuadraticMap_zsmul_rankOneClass` | [TauCeti/LinearAlgebra/IntegralLattice/RankOne.lean:359](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/IntegralLattice/RankOne.lean#L359) |
| `tauceti:TauCeti.IntegralLattice.discriminant_eq_mul_relIndex_sq` | [TauCeti/LinearAlgebra/IntegralLattice/Index.lean:90](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/IntegralLattice/Index.lean#L90) |
| `tauceti:TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup` | [TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.lean:343](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.lean#L343) |
| `tauceti:TauCeti.RegularFormClass.discr` | [TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Discriminant.lean:95](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Discriminant.lean#L95) |
| `tauceti:TauCeti.RegularFormClass.discr_add` | [TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Discriminant.lean:114](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Discriminant.lean#L114) |

The lattice carrier is a rational ambient space with an integral full lattice; it is not automatically the ℓ-adic lattice of a geometric realization. The quadratic discriminant map needs evenness, and the orthogonal quotient comparison needs the even overlattice/nondegenerate hypotheses. The rank-one formulas are under `NeZero m`. These declarations construct gluing and quotient forms; they do not prove Nikulin's primitive-embedding classification or Cassels finiteness.

The Hodge `PeriodDomain.Point` is a point carrier, not an analytic manifold or a period map. The full Clifford algebra is available, including its universal map and square relation, but no Kuga–Satake abelian variety follows from it. Finite-field quadratic sums and nondegenerate diagonalization (field, invertible 2, finite dimension) support item115's adapter. Hensel's simple-root theorem supports unit lifting, not the false assertion that every nonunit is represented. Prime progression infinitude and the Artin/complete-splitting/Frobenius formulas have exactly their stated number-field, Galois, prime and coprimality hypotheses; they do not themselves supply general Chebotarev infinitude.

## Search audit for all missing items

The independent searches covered both full pinned Lean trees, every atlas stage description, all six proposed-roadmap JSON files, reservation IDs, research plans/links/restructuring proposals, and applied data decompositions/links/restructurings. Each of the 140 missing item IDs is assigned to at least one search group below. Raw hit totals include false positives and already-credited suppliers; they are not theorem counts or a proof of absence.

| Search group | Missing item IDs (prefix PAPER-CHARLES-16/) | Pattern | Mathlib / Tau Ceti hits |
|---|---|---|---|
| k3 | 1, 10, 101, 102, 104, 105, 106, 108, 109, 11, 111, 112, 113, 114, 12, 120, 121, 122, 123, 124, 126, 127, 128, 129, 13, 136, 137, 138, 14, 143, 15, 16, 17, 18, 19, 2, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 3, 34, 35, 4, 41, 42, 43, 44, 46, 47, 48, 49, 5, 50, 51, 52, 53, 54, 55, 57, 59, 6, 61, 63, 65, 66, 67, 68, 69, 7, 70, 71, 72, 73, 74, 75, 8, 85, 86, 88, 89, 9, 91, 92, 93, 94, 95, 96, k3-determinant, prime-choice-data, simultaneous-k3-norm | `\bK3\b&#124;K3Surface&#124;Mukai&#124;Beauville&#124;superspecial&#124;holomorphic.symplectic` | 0 / 0 |
| moduli | 100, 103, 8, 9, 97, 98, 99 | `Gieseker&#124;twisted.sheaf&#124;period.index&#124;fixed.determinant&#124;gerbe` | 3 / 0 |
| ks | 77, 78, 79, 80, 81, 82, 83, 84 | `Kuga&#124;Satake&#124;orthogonal.integral&#124;spin.level` | 0 / 0 |
| lattice | 107, 36, 37, 38, 39, 40, 87, explicit-orthogonal-class, explicit-positive-plane, explicit-prime-to-n, explicit-primitive-splitting, hyperbolic-genus-uniqueness, negative-rank-one-complement, nikulin-embedding-data, nonprimitive-obstruction | `primitive.embedding&#124;Nikulin&#124;genus&#124;discriminant.*quotient&#124;quotient.*discriminant&#124;bounded.*discriminant` | 1 / 3117 |
| norm | 110, 115, 142, cayley-discriminant, compatible-system-norm, integral-orthogonal-split, rank-one-norm, reciprocal-discriminant, reciprocal-pair, unit-norm-primitive, unit-representation-lift | `represent.*unit&#124;unit.*norm&#124;sum.quadratic&#124;unimodular&#124;reciprocal.*eigen&#124;cayley.*discriminant` | 845 / 940 |
| primes | 118, 131, prime-power-residues | `quadratic.residue&#124;eq_mod&#124;hensel&#124;Chebotarev&#124;frobeniusPrimeSet` | 122 / 312 |
| tate_descent | 132 | `Tate.*descen&#124;descen.*Tate&#124;cycle.*trace&#124;trace.*cycle` | 9 / 83 |

Disposition of the matches: there is no K3/Mukai implementation in either pin. `K3BlochGroups` is algebraic K₃, while PS.8's selected K3 hypergeometric examples do not own the general geometry required here. Geometric Satake, Kuga–Sato and Beauville–Laszlo hits are different constructions. Fixed determinant in Galois deformation theory is not the moduli of determinant-rigidified twisted sheaves. No existing reservation or proposed-roadmap file supplies the three new/Part II geometric constructions.

The broad `genus` search mostly finds number-field genus theory, curves and modular curves; the relevant integral-lattice hits are precisely the gluing/index/quotient APIs audited above. A refined `Nikulin|primitive.?embedding|Cassels|cayley.*discr|reciprocal.*discr` search found reference-level Cassels hits, not the missing embedding/finiteness theorem. Norm searches find ordinary analytic norms, matrix unimodularity and the rational integral-lattice API; the finite-field/Hensel suppliers still need their local quadratic-lattice adapters. Quadratic reciprocity, finite group order and root lifting provide the ingredients for items118,131 and prime-power-residues, but not a second Chebotarev implementation. Trace/cycle hits include linear traces and contour cycles; item132 was narrowed to the K3 integral consequence, importing the existing planned generic rational Tate-descent contract instead of duplicating it.

## Mathematical corrections and source verdicts

E3 and E15 are rejected. All other inherited findings are confirmed with the scope below. E22–E26 are additional findings from this independent reading. A confirmed gap means the displayed argument needs an additional proof; it does not assert that the paper's main theorem is false.

### E1 — confirmed (error)

Corollary 2.8 and its proof, pp.499–500, in the published version, Annals of Mathematics 184 (2016), 487–526 (publisher PDF, SHA-256 3425f269…40e2)

Confirmed by the index-discriminant identity: the multiplier is v²/I², times a p-primary index square. For v=(1,0,−1), v²=2 and I=2, so the prime-to-p multiplier is 1/2 in odd characteristic. The printed integral λ cannot express it. This does not invalidate the later valuation bound.

### E2 — confirmed (error)

Proposition 2.9, p.500, as used in the proof of Theorem 2.10, p.503, in the published version, Annals of Mathematics 184 (2016), 487–526 (publisher PDF, SHA-256 3425f269…40e2)

Confirmed. The proof starts with a primitive embedding not assumed in the statement. The lattice diag(8,8) embeds nonprimitively into ⟨2⟩⊕U but cannot embed primitively: mod 2, x²+yz has three nonzero isotropic vectors and no two-dimensional totally isotropic plane. Taking m=1 satisfies every congruence condition. The explicit split plane fixes the consumer.

### E3 — rejected (gap)

Proof of Proposition 3.1, p.506, in the published version, Annals of Mathematics 184 (2016), 487–526 (publisher PDF, SHA-256 3425f269…40e2)

Rejected. This passage is in the branch C=2C_red with L=O(C), hence r=4(C_red)² is a positive multiple of four (and at least eight by K3 parity). Thus 3r−4>r already holds. The proposed r=2 counterexample violates the branch hypothesis. In the reduced branch the two point divisors subtract two, not four. This verdict does not certify the other jet/separability steps.

### E4 — confirmed (misprint)

Proof of Proposition 3.16, p.516, in the published version, Annals of Mathematics 184 (2016), 487–526 (publisher PDF, SHA-256 3425f269…40e2)

Confirmed by the preceding setup on p.513: level n≥3 and p∤n is required. The reversed inequality on p.516 is a misprint.

### E5 — confirmed (error)

Proposition 3.17, p.517, in the published version, Annals of Mathematics 184 (2016), 487–526 (publisher PDF, SHA-256 3425f269…40e2)

Confirmed as a distinction between underlying surfaces and polarized pairs. Powers of a fixed polarization produce arbitrarily large degrees; choosing an admissible prime congruence gives infinitely many pairs satisfying the displayed numerical conditions. The bounded-lattice argument can count underlying surfaces, not those pairs.

### E6 — confirmed (error)

§4.1, the definition of N_{α/r}(X) and (4.1), pp.518–519, in the published version, Annals of Mathematics 184 (2016), 487–526 (publisher PDF, SHA-256 3425f269…40e2)

Confirmed in the source convention: exp(−α/r)(r,α+D,0)=(r,D,d/r) when αD=0 and α²=−2d. For ℓ∤d this is not integral, although the original vector belongs to the displayed span. Define the span directly; also state the even-integral norm condition when using a Z-valued lattice carrier.

### E7 — confirmed (misprint)

Proof of Theorem 1.3, p.522, in the published version, Annals of Mathematics 184 (2016), 487–526 (publisher PDF, SHA-256 3425f269…40e2)

Confirmed: the line bundle just constructed on X_n is H_n. B denotes the initial divisor class and cannot carry its growing square.

### E8 — confirmed (gap)

Charles Lemma 4.5, p. 521

Confirmed as a proof gap, not a counterexample to the final Tate theorem. Bounds on valuations leave unit square classes undetermined. The conditional Cayley repair supplies a rational square class only with pairing compatibility, the common characteristic polynomial and exclusion of −1 on the whole cohomology. Its finite extension is part of the repair.

### E9 — confirmed (misprint)

Charles Proposition 3.1 proof, final display p. 506

Confirmed: the final linear series is 4L, with square 16r and h⁰=8r+2 under the stated vanishing, not the numbers for L. Earlier replacements must also be propagated.

### E10 — confirmed (misprint)

LMS Lemma 3.5.1 proof, published p. 302 and arXiv v5 p. 15

Confirmed in LMS arXiv v5: a reciprocal block V_λ⊕V_(1/λ) with dim V_λ=d has Gram determinant (−1)^d times a square. The final total-rank formula remains correct.

### E11 — confirmed (error)

LMS Lemma 3.5.2 proof, published p. 302 and arXiv v5 p. 16

Confirmed in LMS arXiv v5: the unimodular rank-two form x²+y² over Z_3 cannot represent 3, as already seen modulo 9. Representation of units is sufficient after excluding the finitely many primes dividing the fixed nonzero rational target.

### E12 — confirmed (error)

LMS Proposition 2.1.2, published pp. 287–288 and arXiv v5 p. 3

Confirmed in LMS arXiv v5. Without the displayed weight-q^w similitude, the orthogonality step fails. Gram [[ℓ^m,1],[1,0]] with φ=diag(1,−1) has full discriminant −1 and fixed-lattice discriminant ℓ^m. The K3 application has the additional pairing compatibility.

### E13 — confirmed (misprint)

Charles (3.4) and Lemma 3.12, p. 514

Confirmed by comparison with (3.3): the crystalline realization carries the primitive orthogonal complement and Tate twist (1). Neither can be silently erased when passing to (3.4) or Lemma 3.12.

### E14 — confirmed (misprint)

Charles §4.1 p. 519, gerbe convention; compare LMS §3.3 arXiv v5 p. 11

Confirmed as a convention mismatch with the LMS definition explicitly imported on p.519. The positive exponential convention there uses the gerbe −[α_n]; simultaneous reversal would also be consistent.

### E15 — rejected (gap)

Charles §4.1 p. 519, simple-sheaf moduli paragraph; LMS Definition 3.4.1 arXiv v5 p. 13

Rejected. Charles explicitly identifies his stack with the LMS stack M_X(v); LMS Definition 3.4.1 defines objects (F,φ:det F≃O(D)). Thus the determinant condition is already imported. The μ_r/G_m distinction belongs in the interface but is not an omitted source hypothesis.

### E16 — confirmed (gap)

Charles §4.1 p. 519, isotropic moduli assertion; LMS Proposition 3.4.2 proof arXiv v5 p. 13

Confirmed as a missing hypothesis for the cited automatic-stability proof. A primitive ℓ-adic numerator does not force exact geometric Brauer order: a primitive algebraic class can have zero Brauer image. The corrected consumer must establish exact order after algebraic closure, separately from rank and isotropy.

### E17 — confirmed (misprint)

Charles p. 522, partner-pairing and Theorem 1.4 proof

Confirmed by the Mukai pairing: (r,γ+D,0)·(0,D,0)=D²=+2d. The partner divisor B_n belongs to X_n. These are local sign/carrier slips.

### E18 — confirmed (misprint)

Proof of Proposition 2.9, p. 501, in the published version (Annals 184 (2016))

Confirmed: the lattice parameter is d and n is not defined in that proof. The finite-prime exclusion must be (2d)!.

### E19 — confirmed (misprint)

Proof of Proposition 2.9, p. 501, in the published version

Confirmed: the new lattice has discriminant group A_(2md); the occurrence of n is inconsistent with the transported parameter m.

### E20 — confirmed (misprint)

Proof of Proposition 3.17, p. 517, in the published version

Confirmed: Theorem 2.10 supplies a fourfold with v²=2. The expression n−2 is not the square of that Mukai vector.

### E21 — confirmed (gap)

Proof of Theorem 1.3, pp. 522–523, in the published version

Confirmed narrowly as an unverified application hypothesis. The reduction to nonsuperspecial X does not itself prove nonsuperspeciality for infinitely many X_n. Item127 correctly retains that premise. A separate exceptional-case finiteness or comparison proof may repair it; this review does not infer superspecial Picard rank by assuming the Tate theorem being proved.

### E22 — confirmed (error)

Proposition 3.10 proof, pp.512–513 (published Charles 2016)

The square-zero extension P_n⊂P_(n+1) has ideal I^(n+1)/I^(n+2). Already its first step has 19 conormal directions. The tensor is finite free, so killing a nonzero multiple still kills the obstruction.

### E23 — confirmed (misprint)

Theorem 2.4(vii) proof, p.497 (published Charles 2016)

The variety has dimension 2n. Poincaré duality pairs degrees 2 and 4n−2 and total twist 2n. The written degree and twists do not type-check.

### E24 — confirmed (misprint)

Proposition 2.6 proof, p.498, Hilbert–Chow open stratum (published Charles 2016)

The entire construction lies over S^(n)_*. For n≥3 the excluded triple-point locus is nonempty, and the quotient cannot equal the full Hilbert scheme. The following cohomology restriction argument already uses the correct open subset.

### E25 — confirmed (misprint)

Theorem 2.4(vi) proof, p.496, cycle-class cokernels (published Charles 2016)

The quotient Z_ℓ/Z contains prime-to-ℓ torsion: 1/q mod Z for q≠ℓ has order q. Thus the printed uncompleted map does not have a torsion-free abelian cokernel. The intended ℓ-adic saturation is compatible with the diagram on p.497.

### E26 — confirmed (misprint)

Theorem 2.4(i) p.493; Proposition 2.6 p.498; Theorem 2.10 proof p.504 (published Charles 2016)

These statements concern the moduli variety. A sheaf on X cannot directly define Hodge cohomology on M_H(v), and a zero-cycle on the latter induces Brauer transfer from the latter.


The clear extraction fixes are applied in place: item50/G1 no longer treats the inadmissible r=2 double curve as a counterexample; item74 has the correct obstruction tensor; item95 distinguishes an even integral form from a general ℓ-adic-valued pairing; item97 explicitly unpacks the determinant convention; item113 excludes −1 on the whole H² and uses an extension killing all root-of-unity eigenvalues; item120 points to the all-characteristic gap G3; item132 imports rational descent and retains only the additional K3 integral step. Items15,24,27,45,136 record the corrected carriers, degree/twist, completion and open stratum. Conditional prime-selection and partner statements stay conditional.

The Cayley calculation is valid under its hypotheses: on V′ without eigenvalues ±1, C=(F−1)(F+1)⁻¹ is invertible skew-adjoint, so det(B)det(C) is a square and det(B)≡g(1)g(−1). With the separately supplied geometric K3 determinant −1 and nondegenerate NS, this gives disc(T)≡−g(1)g(−1)disc(NS). Bounded valuations alone do not give that square class. No assumption of the desired Tate theorem is used to identify superspecial partner Picard ranks.

## Item-by-item disposition

Every item statement, locator, status, API/test specification where supplied, and explicit use/prerequisite reference was checked. `library` below means the exact scoped API just audited; `planned` means the named owner promises it, not that it is implemented. `missing` means keep as a proposed target, subject to its route's verdict and open proof leaves. The register does not certify the omitted supplier interiors. The changes column identifies local corrections; all other entries retain their statements under these qualifications.

| Item | Name | Status | Review disposition |
|---|---|---|---|
| 1 | K3 surfaces | missing | Proposed; route/gap qualifications apply |
| 2 | Numerical Néron–Severi lattice | missing | Proposed; route/gap qualifications apply |
| 3 | K3 cycle-class injection and torsion freeness | missing | Proposed; route/gap qualifications apply |
| 4 | ℓ-adic Mukai lattice | missing | Proposed; route/gap qualifications apply |
| 5 | Algebraic Mukai lattice | missing | Proposed; route/gap qualifications apply |
| 6 | Sheaf Mukai vector | missing | Proposed; route/gap qualifications apply |
| 7 | Mukai Riemann–Roch pairing | missing | Proposed; route/gap qualifications apply |
| 8 | Gieseker stability | missing | Proposed; route/gap qualifications apply |
| 9 | Stable-sheaf moduli space | missing | Proposed; route/gap qualifications apply |
| 10 | Condition (C) | missing | Proposed; route/gap qualifications apply |
| 11 | Coprimality excludes strictly semistable sheaves | missing | Proposed; route/gap qualifications apply |
| 12 | Lifting up to ten divisor classes | missing | Proposed; route/gap qualifications apply |
| 13 | Finite-height K3 lifting with Picard data | missing | Proposed; route/gap qualifications apply |
| 14 | Dimension argument for simultaneous lifting | missing | Proposed; route/gap qualifications apply |
| 15 | Smooth symplectic stable-sheaf moduli | missing | E26 carrier |
| 16 | Hilbert-scheme deformation type | missing | Proposed; route/gap qualifications apply |
| 17 | Irreducible holomorphic symplectic variety | missing | Proposed; route/gap qualifications apply |
| 18 | Hilbert scheme of points on a K3 surface | missing | Proposed; route/gap qualifications apply |
| 19 | Prime-to-characteristic Beauville–Bogomolov form | missing | Proposed; route/gap qualifications apply |
| 20 | Beauville–Bogomolov form on NS | missing | Proposed; route/gap qualifications apply |
| 21 | Mukai cohomological isometry | missing | Proposed; route/gap qualifications apply |
| 22 | Integral algebraic Mukai map | missing | Proposed; route/gap qualifications apply |
| 23 | Prime-primary cokernel of the algebraic Mukai map | missing | Proposed; route/gap qualifications apply |
| 24 | Quasi-universal sheaf correspondence and descent | missing | E23/E25 degree, twist and completion |
| 25 | Degeneration for a Witt-lifted sheaf moduli space | missing | Proposed; route/gap qualifications apply |
| 26 | Degree-one Hodge numbers of Witt-lifted moduli | missing | Proposed; route/gap qualifications apply |
| 27 | Integral low-degree cohomology of K3 Hilbert schemes | missing | E24 open stratum |
| 28 | Crystalline torsion-freeness in the small-degree lifting regime | missing | Proposed; route/gap qualifications apply |
| 29 | Saturated NS specialization and integral generic Mukai map | missing | Proposed; route/gap qualifications apply |
| 30 | Integral symmetric lattice carrier | library | Pinned declaration scope verified |
| 31 | Half-norm discriminant quadratic form | library | Pinned declaration scope verified |
| 32 | Discriminant under a full sublattice | library | Pinned declaration scope verified |
| 33 | Even-overlattice isotropy criterion | library | Pinned declaration scope verified |
| 34 | Corrected nonisotropic Mukai discriminant formula | missing | Proposed; route/gap qualifications apply |
| 35 | Hilbert-square counterexample to integer multiplier | missing | Proposed; route/gap qualifications apply |
| 36 | Rank-three lattice Λ₂d | missing | Proposed; route/gap qualifications apply |
| 37 | Nikulin primitive embedding criterion in signature (2,1) | missing | Proposed; route/gap qualifications apply |
| 38 | Congruence transport from a primitive initial embedding | missing | Proposed; route/gap qualifications apply |
| 39 | Cyclic gluing-quotient transport | missing | Proposed; route/gap qualifications apply |
| 40 | Generator rescaling congruence | missing | Proposed; route/gap qualifications apply |
| 41 | Norm-two Mukai vector and positive orthogonal class | missing | Proposed; route/gap qualifications apply |
| 42 | Zarhin analogue over arbitrary fields | missing | Proposed; route/gap qualifications apply |
| 43 | Prime-to-n positive and ample classes | missing | Proposed; route/gap qualifications apply |
| 44 | Witt lifting of the Zarhin triple | missing | Proposed; route/gap qualifications apply |
| 45 | Brauer obstruction killed by a zero-cycle degree | planned | E26 Brauer carrier |
| 46 | Hilbert-square descent exponent | missing | Proposed; route/gap qualifications apply |
| 47 | Six-dimensional descent variant | missing | Proposed; route/gap qualifications apply |
| 48 | Positive-square K3 classes can be made nef | missing | Proposed; route/gap qualifications apply |
| 49 | K3 nef Riemann–Roch and fixed components | missing | Proposed; route/gap qualifications apply |
| 50 | K3 birational boundedness at fixed positive square | missing | E3 rejected; G1 open, E9 retained |
| 51 | Finite geometric K3 classes at fixed positive square | missing | Proposed; route/gap qualifications apply |
| 52 | Uniform extension killing the geometric NS action | missing | Proposed; route/gap qualifications apply |
| 53 | Finite forms of a K3 surface in odd characteristic | missing | Proposed; route/gap qualifications apply |
| 54 | Positive integral IHS class implies projectivity and bigness up to sign | missing | Proposed; route/gap qualifications apply |
| 55 | Local Torelli and rank-one deformation | missing | Proposed; route/gap qualifications apply |
| 56 | Kollár–Matsusaka boundedness used here | planned | Owner/audit checked |
| 57 | Finite polarized deformation representatives | missing | Proposed; route/gap qualifications apply |
| 58 | Uniform birational sections in a fiberwise-big family | planned | Owner/audit checked |
| 59 | Orthogonal IHS period domain | missing | Proposed; route/gap qualifications apply |
| 60 | Existing polarized Hodge period-domain points | library | Pinned declaration scope verified |
| 61 | Polarized monodromy is arithmetic | missing | Proposed; route/gap qualifications apply |
| 62 | Baily–Borel algebraicity | planned | Owner/audit checked |
| 63 | Family period map and its algebraicity | missing | Proposed; route/gap qualifications apply |
| 64 | Borel algebraicity input | planned | Owner/audit checked |
| 65 | IHS global Torelli in parallel-transport scope | missing | Proposed; route/gap qualifications apply |
| 66 | Surjectivity and algebraized period-covering families | missing | Proposed; route/gap qualifications apply |
| 67 | Birational IHS Picard and section transport | missing | Proposed; route/gap qualifications apply |
| 68 | Weak birational Matsusaka for IHS varieties | missing | Proposed; route/gap qualifications apply |
| 69 | Birationally bounded IHS family | missing | Proposed; route/gap qualifications apply |
| 70 | Admissible triple | missing | Proposed; route/gap qualifications apply |
| 71 | Strong admissibility | missing | Proposed; route/gap qualifications apply |
| 72 | Superspecial K3 surface | missing | Proposed; route/gap qualifications apply |
| 73 | Smooth polarized deformation of a nonsuperspecial K3 | missing | Proposed; route/gap qualifications apply |
| 74 | Obstruction-killing lift of a moduli line bundle | missing | E22 obstruction tensor |
| 75 | Zarhin fourfolds are strongly admissible | missing | Proposed; route/gap qualifications apply |
| 76 | Full Clifford algebra | library | Pinned declaration scope verified |
| 77 | Kuga–Satake Hodge construction | missing | Proposed; route/gap qualifications apply |
| 78 | Spin level and orthogonal Shimura data | missing | Proposed; route/gap qualifications apply |
| 79 | Descent of the IHS orthogonal period map | missing | Proposed; route/gap qualifications apply |
| 80 | Integral Kuga–Satake mapping | missing | Proposed; route/gap qualifications apply |
| 81 | Clifford-equivariant étale comparison | missing | Proposed; route/gap qualifications apply |
| 82 | Primitive filtered crystalline Kuga–Satake embedding | missing | Proposed; route/gap qualifications apply |
| 83 | Good-prime integral orthogonal model and finite KS map | missing | Proposed; route/gap qualifications apply |
| 84 | Finite primitive crystalline realizations over a fixed KS variety | missing | Proposed; route/gap qualifications apply |
| 85 | Special endomorphisms identify the primitive NS lattice | missing | Proposed; route/gap qualifications apply |
| 86 | Finite NS lattices for strongly admissible triples | missing | Proposed; route/gap qualifications apply |
| 87 | Finite integral lattices of bounded rank and discriminant | missing | Proposed; route/gap qualifications apply |
| 88 | Corrected unpolarized K3 finiteness | missing | Proposed; route/gap qualifications apply |
| 89 | Unbounded polarizations defeat the printed finiteness conclusion | missing | Proposed; route/gap qualifications apply |
| 90 | Tate conjecture for K3 divisors | planned | Owner/audit checked |
| 91 | Tate–Brauer finiteness criterion | missing | Proposed; route/gap qualifications apply |
| 92 | Arithmetic transcendental ℓ-adic lattice | missing | Proposed; route/gap qualifications apply |
| 93 | ℓ-adic B-fields and Kummer Brauer classes | missing | Proposed; route/gap qualifications apply |
| 94 | Rational exponential Mukai transform | missing | Proposed; route/gap qualifications apply |
| 95 | Corrected integral twisted Mukai lattice | missing | Even-integral norm scope |
| 96 | Failure of the literal integral-preimage definition | missing | Proposed; route/gap qualifications apply |
| 97 | Fixed-determinant twisted sheaf stack | missing | E15 rejected; imported determinant |
| 98 | Twisted Chern character and Mukai vector | missing | Proposed; route/gap qualifications apply |
| 99 | Exact geometric Brauer order gives automatic stability | missing | Proposed; route/gap qualifications apply |
| 100 | Integral twisted vectors are realized by perfect complexes | missing | Proposed; route/gap qualifications apply |
| 101 | Isotropic twisted K3 moduli gerbe | missing | Proposed; route/gap qualifications apply |
| 102 | Universal twisted Fourier–Mukai equivalence | missing | Proposed; route/gap qualifications apply |
| 103 | Coprime pairing makes twisted partner fine | missing | Proposed; route/gap qualifications apply |
| 104 | Twisted-lattice discriminant | missing | Proposed; route/gap qualifications apply |
| 105 | Isotropic Mukai cohomological quotient | missing | Proposed; route/gap qualifications apply |
| 106 | Isotropic numerical Mukai map | missing | Proposed; route/gap qualifications apply |
| 107 | Primitive isotropic quotient determinant | missing | Proposed; route/gap qualifications apply |
| 108 | Discriminant growth formula for twisted partners | missing | Proposed; route/gap qualifications apply |
| 109 | Finiteness implies Tate via twisted partners | missing | Proposed; route/gap qualifications apply |
| 110 | Frobenius-invariant lattice discriminant bounds | missing | Proposed; route/gap qualifications apply |
| 111 | K3 Frobenius semisimplicity | missing | Proposed; route/gap qualifications apply |
| 112 | Nonzero transcendental invariants from infinite Brauer | missing | Proposed; route/gap qualifications apply |
| 113 | Norm-one vectors in the transcendental lattice (corrected Lemma 4.5) | missing | Whole-H² eigenvalue scope; conditional repair |
| 114 | Safe norm-representation substitute after quadratic extension | missing | Proposed; route/gap qualifications apply |
| 115 | Unit representation over an odd finite field | missing | Proposed; route/gap qualifications apply |
| 116 | Hensel root lifting | library | Pinned declaration scope verified |
| 117 | Dirichlet primes in a unit residue class | library | Pinned declaration scope verified |
| 118 | Simultaneous quadratic-residue primes | missing | Proposed; route/gap qualifications apply |
| 119 | Simultaneous splitting and congruence prime choice | planned | Owner/audit checked |
| 120 | Primitive isotropic vectors from a B-field | missing | G3 dependency |
| 121 | Infinite twisted K3 partner sequence | missing | Proposed; route/gap qualifications apply |
| 122 | Unbounded ℓ-discriminant, bounded p-discriminant | missing | Proposed; route/gap qualifications apply |
| 123 | Orthogonal positive/negative divisor pair | missing | Proposed; route/gap qualifications apply |
| 124 | Fixed-square divisors on twisted partners | missing | Proposed; route/gap qualifications apply |
| 125 | Tate for K3 surfaces of Picard rank at least two | planned | Owner/audit checked |
| 126 | Growing-square classes on partners | missing | Proposed; route/gap qualifications apply |
| 127 | Hypotheses of Proposition 3.17 for the twisted partners | missing | Proposed; route/gap qualifications apply |
| 128 | Special-fiber ampleness from a rank-one projective deformation | missing | Proposed; route/gap qualifications apply |
| 129 | Superspecial reduction | missing | Proposed; route/gap qualifications apply |
| 130 | Tate for K3 surfaces in characteristic at least five | planned | Owner/audit checked |
| 131 | Power congruence subsequence | missing | Proposed; route/gap qualifications apply |
| 132 | Integral K3 Tate consequence after rational finite-field descent | missing | Import rational descent; separate integral step |
| 133 | Lefschetz (1,1) theorem for divisors | planned | Owner/audit checked |
| 134 | Intersection products on smooth projective surfaces | planned | Owner/audit checked |
| 135 | Hodge endomorphisms of abelian H¹ | planned | Owner/audit checked |
| 136 | Degree-two Hodge numbers of Witt-lifted moduli | missing | E26 Hodge carrier |
| 137 | Finite arithmetic K3 classes at fixed positive square | missing | Proposed; route/gap qualifications apply |
| 138 | K3 birational maps are isomorphisms | missing | Proposed; route/gap qualifications apply |
| 139 | Surface Riemann–Roch | planned | Owner/audit checked |
| 140 | Surface adjunction | planned | Owner/audit checked |
| 141 | Hodge index theorem | planned | Owner/audit checked |
| 142 | Local unit-norm lift | missing | Proposed; route/gap qualifications apply |
| gluing-overlattice-order | Existing even-overlattice order equivalence | library | Pinned declaration scope verified |
| gluing-quotient-isometry | Existing discriminant isometry of an even overlattice | library | Pinned declaration scope verified |
| rank-one-generator | Existing rank-one discriminant generator formula | library | Pinned declaration scope verified |
| nikulin-embedding-data | Primitive embedding data with complement identification | missing | Proposed; route/gap qualifications apply |
| hyperbolic-genus-uniqueness | Genus uniqueness for a lattice containing a hyperbolic plane | missing | Proposed; route/gap qualifications apply |
| negative-rank-one-complement | Rank-one complement specialization | missing | Proposed; route/gap qualifications apply |
| nonprimitive-obstruction | Counterexample to the arbitrary-sublattice formulation | missing | Proposed; route/gap qualifications apply |
| explicit-primitive-splitting | An explicit split primitive positive-plane carrier | missing | Proposed; route/gap qualifications apply |
| explicit-positive-plane | Positive-definite Gram matrix for the Zarhin plane | missing | Proposed; route/gap qualifications apply |
| explicit-orthogonal-class | Positive class orthogonal to the norm-two vector | missing | Proposed; route/gap qualifications apply |
| explicit-prime-to-n | Prime-to-n orthogonal norm by one explicit choice | missing | Proposed; route/gap qualifications apply |
| finite-quadratic-sums | Two quadratic polynomials over a finite odd field | library | Pinned declaration scope verified |
| diagonalization | Nondegenerate quadratic forms diagonalize with unit weights | library | Pinned declaration scope verified |
| discriminant-sum | Existing plain discriminant and its orthogonal-sum law | library | Pinned declaration scope verified |
| split-criterion | Identity Artin class and complete splitting | library | Pinned declaration scope verified |
| cyclotomic-frobenius | Arithmetic Frobenius on roots of unity | library | Pinned declaration scope verified |
| split-local-embedding | A completely split prime gives a Q_l embedding | planned | Owner/audit checked |
| reciprocal-pair | Reciprocal eigenspaces form a hyperbolic block | missing | Proposed; route/gap qualifications apply |
| reciprocal-discriminant | Discriminant of the squared-isometry fixed space | missing | Proposed; route/gap qualifications apply |
| integral-orthogonal-split | Unimodular sublattices split integrally | missing | Proposed; route/gap qualifications apply |
| unit-representation-lift | Unimodular odd-adic lattices represent units in rank at least two | missing | Proposed; route/gap qualifications apply |
| rank-one-norm | A square discriminant solves the rank-one norm equation | missing | Proposed; route/gap qualifications apply |
| k3-determinant | The geometric K3 pairing has determinant square class minus one | missing | Proposed; route/gap qualifications apply |
| compatible-system-norm | Norm selection from split orthogonal compatible systems | missing | Proposed; route/gap qualifications apply |
| prime-power-residues | Residue squares lift to every prime power | missing | Proposed; route/gap qualifications apply |
| prime-choice-data | The common splitting field for the K3 prime choice | missing | Proposed; route/gap qualifications apply |
| finite-extension-tate-descent | Rational divisor Tate descends along a finite extension | planned | Owner/audit checked |
| simultaneous-k3-norm | The composed K3 prime choice in characteristic at least five | missing | Proposed; route/gap qualifications apply |
| unit-norm-primitive | Unit norm detects primitive classes and exact quotient order | missing | Proposed; route/gap qualifications apply |
| cayley-discriminant | Determinant of an isometry space without eigenvalues ±1 | missing | Proposed; route/gap qualifications apply |
| 143 | Low-degree Hodge–de Rham degeneration for admissible triples | missing | Proposed; route/gap qualifications apply |

## Validation and handoff

The independent structural check verifies all 173 unique items, exactly one route for each of the 140 missing items, all explicit planned/prerequisite stages, 46 use targets, all 26 source verdicts, and an acyclic explicit item graph with 90 edges. This is not a global closure claim: the MC.7 early/late split and unexpanded supplier dependencies remain open, hence the rejected routes.

Fourteen exact arithmetic/regression checks passed: the 1/2 index factor; the mod-2 primitive-embedding obstruction and explicit positive plane; the valid double-curve inequality; integral untwisting; reciprocal determinant sign; the Z₃ nonrepresentation counterexample; the missing-similitude counterexample family; reciprocal Cayley identities; finite-field unit representation examples; prime-power root lifting; the 19-dimensional first conormal quotient; and prime-to-ℓ torsion in the uncompleted quotient. Finite examples check the stated regressions, not the geometric theorems.

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-CHARLES-16.result.json` passed with no errors. The four-file allowlist passed, and 239 input blobs and the tracked world-file sets were unchanged at publication preparation against main `159adf77754ac55d2814ed00701e0998889d9928`. No Lean deliverable is requested by this issue. **No Lean compilation was run or is claimed for this review.**

The next extraction worker should first close G1's characteristic-two jet/separability argument and G4's projective family/partner hypotheses, then audit the small-characteristic suppliers in G3 and expand the source interiors in G5/G6. Preserve the accepted shared owners and completed lattice imports. Split MC.7's early suppliers from late Tate applications before constructing stage dependency edges. Revisit rejected routes only after these source-level obligations are visible as explicit items/proof leaves. The review itself is complete; `revise` is the verdict on its input, not a checkpoint in the review.
