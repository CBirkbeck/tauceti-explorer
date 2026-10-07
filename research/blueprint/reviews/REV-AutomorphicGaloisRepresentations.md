# Independent review: AutomorphicGaloisRepresentations

**Verdict: needs_changes.** This is a completed independent review for issue #360, by Codex, session `codex-BsbIeh`, dated 2026-10-07. The reviewed input was the packet and suggested file last changed by `c43ce3ad` (PR #6790); this reviewer did not author that work.

All 61 nodes were assessed at **target level**, together with their source anchors, direct prerequisites, API/tests, planets, library baseline, and all assigned red-team findings (ten IDs, including both IHG suppliers). Clear faults were corrected in the two authorized input files. Six nodes remain unverifiable because the global Hilbert representation and its source normalization adapters are not specified consistently. The local theorems themselves are not rejected: their application to the packet's combined object is unverified. Saito's purity scope also did not cover the broader target being claimed.

The reader document is review input, but is not among issue #360's deliverables. It was therefore left unchanged. Its entire node catalogue was mechanically compared with the original packet: every statement, hypothesis, proof step, acceptance item, API specification and test matched; its coverage and gaps matched too. Thus the faults below also occur in the reader, and the in-place packet corrections now require corresponding reader revisions. This is a completed review submission, **not a checkpoint** or a claim that the mathematical plan is finished.

## Counts and coverage

| Item | Result |
| --- | --- |
| Node verdicts | 27 verified, 28 corrected, 6 unverifiable; 61 total |
| Nodes added / removed | 0 / 0; target-level granularity retained |
| Nodes edited | 29 (including one still unverifiable) |
| Definitions and constructions | 15, all with recorded uses and at least three discriminating tests |
| API items / unit tests | 86 / 63 |
| Planets | 25; retained as key definitions, constructions and named results |
| Baseline declarations | 13 independently read and retained; 0 removed or replaced |
| Source register | 24 original public source payloads; all recorded hashes matched |
| Retained node source anchors | 140; one unrelated auxiliary anchor removed, four locators repaired |
| Source issues | E1–E3 independently confirmed with version/scope qualifications |
| Requests / gaps | 43 / 13, with precise consuming nodes |
| Coverage | R19.1 and R19.6 planned; R19.2–R19.5 partial; no stage closed |

The packet status is now `partial`, rather than `complete`. At 61 nodes it is below the 300-node budget, and four stages contain targets whose source adapters or full scope have not been established. The partial records name the exact remaining work. The rejection is for those unverified target identifications, not merely for honest open source-proof refinements. R19.1 and R19.6 still meet the protocol's **planned** definition: their prerequisite chains terminate in libraries, explicit suppliers, or recorded gaps. No node claims implementation; every `implementationStatus` remains `unchecked`.

## Required mathematical revisions

### 1. Define the global Hilbert object before transporting local theorems

The affected nodes are `R19.2/all-cohomological-hilbert-representation`, `R19.2/hilbert-uniqueness-determinant-oddness-irreducibility`, `R19.3/fixed-eigenform-compatible-family`, `R19.4/all-hilbert-local-global-compatibility`, `R19.5/kisin-hilbert-coefficient-prime`, and `R19.5/skinner-full-hilbert-coefficient-prime`.

For the **same local automorphic representation** π, Carayol's local convention is

σ_C(π) = Rec(π ⊗ |·|^(1/2))∨,

whereas Skinner uses

ρ_S(π) = Rec(π ⊗ |·|^(−1/2)) = σ_C(π)∨ ⊗ |·|^(−1).

Consequently a dual alone is not the required conversion. Carayol's determinant χ_π^−1ω^−1 is valid for his σ_C; transporting it to node42's combined “Carayol/Kisin” σ requires an actual comparison of central characters, Hecke operators, coefficient embeddings and twists. The polynomial X²−t_vX+q_vs_v does not define that comparison when t_v and s_v have different source meanings. Saito distinguishes σ_h and σ̌_h, uses inverse-uniformizer Hecke operators, and explicitly explains the **dual coefficient sheaf and Poincaré duality** on pp.14 and18. Kisin §4.3 uses positive-uniformizer operators. These distinctions must be made at the level of the global representations, not only spherical polynomials. See [Carayol §§0.4–0.5, 3](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), [Saito pp.9,14,18](https://arxiv.org/pdf/math/0612077), and [Skinner equation (1), p.242](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf).

Choose one explicit representation, give its infinity/central-character convention and good-prime polynomial, then prove separate adapters for Carayol, Taylor/Kisin, Saito, Skinner and CDN. Recompute the determinant, Hodge degrees, conductor and local factors under those adapters. The existing normalization gap has been expanded to name all consumers. The WD relation remains FNF⁻¹=q⁻¹N for **geometric** Frobenius; the printed Saito sign issue already belongs to the R06 owner.

### 2. Supply purity outside Saito's geometric scope

Node25 now retains the actual standing assumptions: totally real degree g>1; w≥k_τ≥2 and matching parity; a finite discrete-series place when g is even. The weight assertions for N=0, ker N and coker N agree with Saito Theorem2. This corrected theorem does not cover every all-Hilbert form or the classical branch. Give the separate purity inputs needed by the fixed-family target, with their exact projector/vanishing hypotheses and normalization. See [Saito §§1–2, Theorem2](https://arxiv.org/pdf/math/0612077).

The inspected R34.6 Hilbert export has exactly that geometric scope and is currently reviewed `needs_changes`; it also imports a retired R06.6 modular application. It is not a certified independent supplier for the larger all-Hilbert assertion. The exact generic arithmetic-realization transport is now an edge, and the stronger missing input is a recorded gap/request. No other roadmap's packet was edited.

### 3. Finish the named source-proof inputs without inventing local lemmas

These are precise target-level gaps, rather than reasons to split the packet into routine lemmas:

- **Classical all-weight irreducibility:** DFG Lemma5.7 proves rank and pairing. DDT Theorem3.1(c) proves the weight-two irreducibility statement. Supply an independently checked all-weight proof/source; do not use the later Hilbert irreducibility node circularly.
- **Classical all-weight coefficient-prime comparison:** the Hilbert Saito paper has g>1 and cites the earlier classical work. DFG's restricted integral Fontaine–Laffaille comparison and Scholl's λ-adic existence do not alone supply the full p-adic theorem at every coefficient prime, including small primes.
- **Full non-normal-cubic local comparison:** the accepted R17.4 cubic transfer node only supplies almost-all Satake compatibility. Carayol §12.2.1–12.2.2 needs the local assertion at the chosen place. The exact weak node is imported and the stronger local assertion remains explicitly requested.
- **Skinner's remaining branch:** the exact adjoint lift is now imported; after a unitary normalization Sym² is recovered by central-character twist. The GL₃ geometric/period comparison, Wintenberger lifting, Buzzard overconvergent family, Kisin Frobenius-period continuation and eigenline argument are named in the gap. Generic R06 comparison does not produce those arithmetic/family inputs.
- **Integral family conditions:** KW Lemma7.2 proves the fixed unramified character and triangular shape for each eigenform. The unsupported integral-family consequence was removed from node36. An actual finite-projective invariant family line belongs in node60's local-condition verification. Density of field points does not construct it, especially on nilpotent quotients.

The existing Taylor auxiliary-new congruence, bad-reduction, Momose and generalized eigenspace/integral determinant gaps remain honest source-proof refinements. They were not hidden or converted into formalization claims.

## Corrections made in the authorized files

1. **Direct closure edges.** Added density/newform/Eisenstein interfaces already requested but absent from consuming prerequisites. Added the precise Euler-product logarithm and bounded higher-prime-power interface for the cuspidal weight-one argument. Zeta residue and Dirichlet-character nonvanishing are useful baseline statements, but do not by themselves establish prime sums. Added the complete-DVR congruence-kernel/inverse-limit input for the finite-residue Schur–Zassenhaus proof.
2. **Exact supplier scope.** Retained the existing eigenvalue-lifting node. Distinguished the limited cuspidal, prime-to-level weight-shift node from Deligne–Serre6.7's general setting. Weight-one coefficient integrality is imported from the existing sublayer8W of upstream ModularForms layer8 (Deligne–Serre2.7 integral-all-cusps lattice); conjugate eigenforms come from layer8G. These are distinct from layer8’s k≥2 modular-symbol branch, and are not replanned in R15.2. Added exact R14.5 weight-two quotient/dimension, R04.2 deformation/fixed-determinant, R17.4 weak cubic/adjoint, and R34.6 transport edges. Added the R07.4/R21.3 edges actually used in the KW coefficient-prime corollary.
3. **Condition C.** Restricted the fibre API to monic quadratics with nonzero constant coefficient. Added actual Lean signatures for monotonicity, relative index two and fibre counts, and actual split/repeated/irreducible fibres at ℓ=3. The index-two hypothesis concerns G, not the ambient GL₂. Added the sharp top-group and cyclic C(1/4,3) boundary examples.
4. **All-prime rational realizations.** DFG rational λ-adic factors exist for every finite λ. The excluded set only limits crystalline/integral comparison. Integral realizations may have torsion at bad primes; their image in the rational factor is still a full stable lattice. The API no longer calls every integral module a lattice without qualification.
5. **Residual recognition.** Replaced trace-only characteristic-p recognition with full characteristic polynomials. Over F₄ the two semisimple C₃ representations 1⊕1 and χ⊕χ have zero trace everywhere and different determinants. Added the recognition API, test, and a genuine available matrix prototype of the failure.
6. **KW Hecke reconstruction.** Restored coefficient splitting, central-action compatibility, weight hypotheses and the noncompact p=2 level/extension of W₂ from U⁰. Uniqueness is conjugacy until a residual identification is fixed. Eigenform specializations use characteristic-zero coefficient DVRs. The reduced O-flat product representation first supplies a full integral determinant law, then Chenevier2.22(i) reconstructs it. Removed a duplicated edge and the wrong classical residual/geometric-only Hilbert prerequisites. A universal-ring map now names its fixed-determinant/ramification input. The level11,p5 example no longer falsely claims nonexistence: 11a1's Tate module supplies a representation despite reducible residual semisimplification.
7. **Source hypotheses and projector branches.** Restored p odd for Skinner–Wiles; restored Saito's standing hypotheses; separated Scholl's k≥3 projector from the k=2 Jacobian branch.
8. **Wach comparison.** Changed N(T)/π≅D_cris to (N(T)/π)[1/p]≅D_cris(T[1/p]), while retaining the integral quotient as a lattice. Added the rank-one Z_p versus Q_p discriminating test; semilinear basis changes and repeated roots remain explicit.
9. **Locators.** Carayol Corollary0.8 is printed p.411; Chenevier2.22(i) is p.34. NT26's Dimitrov consumer is Lemma5.7 p.41, not Proposition5.4; NT21b's relevant prime choice is Theorem3.1 proof p.26. The NT21 Ribet occurrence was unrelated to large image and was removed. The three edited text excerpts were checked at their exact pages; scans were used for Carayol/Ribet/Bourbaki/Skinner–Wiles formulas where OCR was inadequate.
10. **Review metadata and coverage.** Added all 61 independent node verdicts, all source-issue verdicts, precise remaining work and actual independent read-depth notes. The suggested inventory reproduces the corrected statement/hypothesis/API/test text for every node and expressly marks the unverified Hilbert identifications.

## Pinned baseline and library audit

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`. Every declaration was read at the actual pin, not inferred from a search hit. No baseline citation was removed; the two analytic near-misses were repaired by adding their missing supplier inputs.


The relevant reviewed library-coverage records (AUDIT-31 for R19.1–R19.6) do not report the advanced arithmetic constructions as built. Existing representation, matrix, lattice, dual-number and analytic interfaces are imported. No audited built declaration was re-planned. Tau Ceti source was inspected at its pin even though the shared working checkout was newer; the suggested file imports only Mathlib, whose shared build is at the exact recorded pin.

| Baseline declaration | Independently checked scope and use |
| --- | --- |
| [`mathlib:ModularForm`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Basic.lean) | Holomorphic slash-invariant forms, bounded at cusps; no eigenform or integral Hecke algebra is supplied. |
| [`mathlib:CuspForm`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Basic.lean) | Vanishing-at-cusps substructure; no newform or coefficient-field theorem is supplied. |
| [`mathlib:Matrix.card_GL_field`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean) | Finite-field general-linear cardinality with q=Nat.card of the field. Rank two yields (q²−1)(q²−q). |
| [`mathlib:Subgroup.exists_right_complement'_of_coprime`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/SchurZassenhaus.lean) | Normal finite subgroup and coprime subgroup-cardinality/index; applied at each finite congruence level. |
| [`mathlib:nonempty_sections_of_finite_inverse_system`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/CofilteredSystem.lean) | Nonempty finite fibres over a directed preorder; compatible finite complements need a separately specified inverse system. |
| [`mathlib:DirichletCharacter.LFunction_apply_one_ne_zero`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/Nonvanishing.lean) | Nontrivial character at 1. Euler logarithms and the bounded higher-prime-power remainder are separate imports. |
| [`mathlib:riemannZeta_residue_one`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/RiemannZeta.lean) | Residue limit at 1. It does not itself state the prime-sum asymptotic. |
| [`mathlib:NumberField.Embeddings.finite_of_norm_le`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean) | Finiteness of algebraic integers under simultaneous embedding bounds; the weight-one field and integrality come from upstream8W. |
| [`tauceti:TauCeti.LSeries.landau`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LSeries/Landau.lean) | Nonnegative coefficients and a finite real abscissa; no substitute for the modular Rankin–Selberg input. |
| [`mathlib:Representation`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Basic.lean) | Monoid representation into module endomorphisms; actual algebraic projector prototype uses this carrier. |
| [`mathlib:Submodule.restrictScalars`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Submodule/RestrictScalars.lean) | Underlying set is preserved; actual integral intersection is formed inside the rational module. |
| [`mathlib:DualNumber.eps`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/DualNumber.lean) | The square-zero inr1 element; detects the failure of pointwise specialization on nilpotents. |
| [`mathlib:Matrix.det_fin_two`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean) | Division-free determinant formula over a commutative ring; used in the mixed-coefficient prototype. |

## Public sources and independent read depth

All 24 original PDF payloads matched their recorded SHA-256 digests. Every original node locator and excerpt was checked: 131 of 141 anchors also had a normalized text-layer match; the other ten needed scan/OCR inspection. Text matching alone was not treated as verification of a locator, statement, or proof. The retained register has 140 anchors after removing the unrelated NT21 citation. Four locator repairs and the source-hypothesis corrections are listed above and in the node table below. Earlier workers’ historical read notes were not presented as this reviewer's work.

| Source | Independently checked passages and limits |
| --- | --- |
| [deligne-serre74](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) | Proposition2.7 interface via the upstream8W/8G specification; §§3–8, printed pp.513–527, including statements and the density, ConditionC, lift and cuspidal irreducibility proofs. Integral/general weight-shift scope retained explicitly. |
| [deligne-bourbaki-355](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf) | Scans at printed pp.157,162,166,167: 3.15,4.3,4.8,4.9; ordinary versus supersingular fibre and coefficient exponent. |
| [carayol86-hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) | 0.1–0.11;2.2.2–3.7;4.2–4.8;5.4–6.8;10.3–10.6;11.1–11.4;12.1.2–12.3.2. Original Drinfeld/bad-reduction interiors and full Picard–Lefschetz computation remain imported geometric gaps. |
| [saito-hilbert-padic-hodge](https://arxiv.org/pdf/math/0612077) | Standing multiweights pp.1–4; local conventions and Theorems0/1/2/Claim1 pp.9–13; dual coefficient sheaf pp.14,16–18 and Poincaré comparison p.18. Degree>1 and even-degree discrete-series restriction restored. |
| [chenevier-determinants](https://arxiv.org/pdf/0809.0415) | §§2.18–2.22 and Theorem2.22(i), p.34, including split absolutely irreducible residual hypotheses; profinite continuity discussion pp.42–44. Generic law/reconstruction stay with IHG. |
| [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577) | §1.4, Definition1.10 and almost-strict versus strict distinction, pp.6–7; applied as a family specification, not a proof of the unverified global dictionary. |
| [dfg-arxiv](https://arxiv.org/abs/2512.02348v2) | §1.2; excluded-prime sets pp.13,24,27,30 (scans at24/30); §4.5/Lemma4.12; §5.3 pp.56–58; full Lemma5.7 proof pp.58–59. Rank/pairing does not prove the claimed all-weight irreducibility. |
| [ddt](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) | §3.1 pp.84–87; §§3.3/4.1/4.2 pp.93–95,106–113; full Hecke versus reduced new quotient, coefficient changes and the stated type-Σ exercise. Weight-two irreducibility does not cover all weights. |
| [kw2-2009](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) | §7 pp.57–61, Lemma7.2 proof; Lemma7.7/Corollary7.8 pp.67–68; §9.1.1 pp.78–81; bibliography[53] p.97. Compact-mod-centre, coefficient splitting, central action and p=2 extension checked. |
| [skinner-wiles-1999](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) | Introduction p.6 and scans pp.38–41, (3.2),(3.3),(3.5); p odd and contragredient/character conventions. |
| [scholl90](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf) | §1.0–1.3, pp.1–3; r≥1 projector, homological realization and proof route. Full desingularization proofs in §§2–3 remain recorded gaps; k=2 uses the Jacobian branch. |
| [kisin08-ams](https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf) | §4.3 full proof pp.542–544;2.5.5 p.531;2.7.6–2.7.7 pp.533–534. Arbitrary-A° quotient and positive-uniformizer operators checked; original Taylor congruence source remains a refinement. |
| [skinner09](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) | Introduction pp.241–244; §§2.1–2.3; full2.4.1 pp.252–254 and2.4.2 pp.254–256, including the irreducibility Remark. GL3, family, lifting and period-continuation inputs identified as nonroutine imports. |
| [dimitrov05](https://arxiv.org/pdf/math/0411152) | §3.1 pp.22–23; §3.2 tame-inertia exclusions; Proposition3.5 and §3.4/Proposition3.8 pp.24–26. Conclusion is SL2 over an appropriate subfield, not all GL2 over the residue field. |
| [dasgupta-kakde23](https://math.iisc.ac.in/~maheshkakde/brumerstark.pdf) | §9.1 pp.66–67: CM definition and Lemmas9.1/9.2 with proofs; regular weights and specified ordinary lines. |
| [bgv13](https://mathweb.tifr.res.in/~eghate/hilbertCM.pdf) | Introduction pp.1–2 and real-place/weight-one exception; regular CM scope. |
| [hara-ochiai18](https://arxiv.org/pdf/1507.07309v2) | Ordinary-CM hypotheses and AppendixA PropositionA.3, pp.70–71, with proof; splitting does not replace the source’s ordinary-type assumptions. |
| [ribet75](https://math.berkeley.edu/~ribet/Articles/invent_28.pdf) | Scans pp.250–252, Theorems2.1/2.3 and complete proof ending p.252; regular-weight virtual irreducibility argument. |
| [ribet85](https://math.berkeley.edu/~ribet/Articles/rankin.pdf) | Scans pp.185–186,188–192, Theorems2.1/3.1 and inner twists. Original Momose proof remains a precisely named supplier refinement. |
| [cdn20](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf) | §5.2.1 pp.43–45, Proposition5.2, full geometric assumptions and proof; SD2, distinguished real place, localJL and completed tower actions. |
| [newton-thorne21](https://arxiv.org/pdf/1912.11261v3) | Actual Ribet occurrences inspected; they concern level raising and do not support the former large-image anchor. Auxiliary citation removed; no symmetric-power theorem is planned here. |
| [newton-thorne21b](https://arxiv.org/pdf/2009.07180v2) | Theorem3.1 proof p.26: actual projective-image prime-selection passage. |
| [newton-thorne26](https://arxiv.org/pdf/2212.03595) | Lemma5.7 pp.40–41: actual [Dim05, Proposition3.8] consumer; repaired the old Proposition5.4 locator and misleading read note. |
| [skinner20-published](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf) | §3 printed p.350: non-CM weight-two, squarefree level, trivial character; some-λ density-one ordinarity versus every-λ eventual residual assertions. |

The [published DFG 2004 text](https://www.numdam.org/article/ASENS_2004_4_37_5_663_0.pdf) was checked separately (SHA-256 `385dc212a14bf884a29564375cf6308f310feac2c0b634c418e7bb46d50472a3`). Its organization differs and it has no Theorem2.4 counterpart. The version comparison is recorded in `sourceVersions`.

Source issues all have independent verdicts:

- **E1 confirmed:** Bourbaki3.15’s characteristic-p one-subgroup assertion fails on the ordinary locus. The revised entry says that a stated result is affected and qualifies the original blanket downstream claim; pp.157/162 were inspected on scans.
- **E2 confirmed:** KW authors’ final version, 30 May2009, [53] p.97 has the wrong Saito title/subject class. The actual arXiv abstract identifies the intended Hilbert paper. The published Inventiones bibliography was not inspected, and no correction is asserted for it.
- **E3 confirmed:** DFG arXivv2 pp.24/30 invert the excluded-prime set. Its own pp.9/13/27 and comparison statements show that the intended set consists of divisors. This is scoped to that preprint version, with the differently organized 2004 publication checked separately.

## Closure, ownership and assigned red-team findings

Read upstream SemisimpleAlgebras and ArithmeticDirichletSeries, and the relevant ModularForms/ModularCurves layers, rather than replanning them. In particular, upstream8W is the weight-one integral-all-cusps lattice, while8G owns conjugate eigensystems. The supplier statements in the relevant blueprint packets were checked for the requested strength; weak transfer or generic comparison was not promoted to a stronger arithmetic application. The intra-packet dependency graph is acyclic. Cross-roadmap ownership risks are named below rather than silently repaired in other jobs’ files.

| Assigned finding | Independent disposition |
| --- | --- |
| RT-AREA-langlands-1/25 | R19.6 produces the actual geometric generic module/law; IHG.4 owns generic law descent and IHG.1 reconstruction. Higher-weight/Hilbert and torsion inputs remain conditional. Whole generic algebra, including nilpotents, is required. |
| RT-AREA-langlands-2/2 | Carayol geometric parity/discrete-series scope is retained. Taylor/all-Hilbert targets are separate. The unresolved global source dictionary prevents accepting their downstream identifications. |
| RT-AREA-langlands-2/4 | Cyclic and non-normal cubic cases are distinguished. Imported R17.4/nonnormal-cubic-base-change supplies weak almost-all Satake transfer; the stronger chosen-place assertion remains a request/gap. |
| RT-AREA-langlands-2/5 | Higher-weight Eichler relation has the coefficient I_q*, FV=q^(r+1) and R_q=q^r I_q*. Ordinary/supersingular tests and Bourbaki correction are explicit. |
| RT-AREA-langlands-2/6 | Chenevier2.22(i), with split absolutely irreducible residual determinant, handles finite residue fields. Removed the stale TheoremB acceptance instruction; geometric determinant law must precede reconstruction. |
| RT-AREA-langlands-2/8 | Deligne–Serre is produced once in R19.1; ML.1 and R27.6 consume it. No duplicate Artin construction or edits to those roadmaps. |
| RT-AREA-langlands-2/9 | R14.5 modular quotient/dimension and R14.6 special-fibre Eichler–Shimura are exact weight-two imports. Higher-weight coefficient construction stays here. |
| RT-AREA-langlands-2/10 | R24.5 operations are imports, not potential-modularity existence prerequisites. R34.6 generic transport has a direct edge; its Hilbert export has restricted Saito scope and unresolved ownership/retired dependency, so full family purity is unverified. |
| RT-AREA-langlands-2/14 | Exact R08.3 semistable-height-quotient accepts arbitrary A° and its finite Qp-algebra generic fibre. A universal deformation-ring theorem alone would be insufficient. The arithmetic Kisin application stays here. |
| RT-AREA-padic-2/22 | R06.5 owns generic comparison; R19.5 and AG2.6 own arithmetic applications. Skinner’s GL3/family/period inputs are explicit; no generic comparison stage is asked to supply them implicitly. |

All ten named finding IDs are accounted for; langlands-1/25 covers both IHG.1 and IHG.4 as requested.

## Node-by-node independent verdicts

Each row covers the node’s statement and hypotheses, source locator/excerpt, proof route, prerequisites, acceptance checks, and its API/tests when present. `Corrected` is a verdict on the corrected target, not a claim that its future Lean proof exists. The six `unverifiable` rows require the revisions above. Node IDs below omit the common `AutomorphicGaloisRepresentations:` prefix.

| Node (prefix AutomorphicGaloisRepresentations:) | Verdict | Independent check |
| --- | --- | --- |
| `R19.1/geometric-construction-and-the-eichler-congruence-relation` | verified | Bourbaki 4.8/4.9 retains I_q*, FV=q^(r+1) and R_q=q^r I_q*. Weight-two geometry is the exact R14.6 import; ordinary and supersingular fibres are distinguished. |
| `R19.1/lambda-adic-representation-of-a-weight-k-eigenform` | verified | Deligne–Serre 6.1–6.4 matches the noncuspidal semisimple existence/uniqueness target, arithmetic Frobenius, and compact infinite λ-adic image; the cusp/Eisenstein branch is requested. |
| `R19.1/deligne-serre-condition-c` | corrected | Restricted the fibre formula to monic invertible quadratics. Added actual Lean monotonicity/index-two/fibre signatures and split/repeated/irreducible examples, plus sharp and cyclic boundary tests. |
| `R19.1/mod-lambda-representation-of-a-mod-lambda-eigenform` | corrected | Added actual R15.5/general-weight-shift and Dirichlet-density edges. The existing reduction node only handles a cuspidal integral reduction with ℓ prime to level, so the general 6.7 case remains a precise extension request. |
| `R19.1/rankin-bound-for-a-cuspidal-eigenform` | corrected | Added the upstream newform edge used in Rankin reduction. The pinned Landau statement has its required nonnegative coefficients and finite abscissa; it does not replace the Rankin–Selberg input. |
| `R19.1/weight-one-eigenvalues-outside-a-sparse-set` | corrected | Added density normalization and exact upstream Layers8/8G edges. The existing sublayer8W supplies the weight-one integral-all-cusps lattice, distinct from the k≥2 modular-symbol branch; Layer8G supplies Galois-conjugate eigensystems. No upstream construction is replanned. |
| `R19.1/bounded-semisimple-subgroups-of-gl2` | verified | Deligne–Serre 7.2 classification/counting argument is sound under semisimplicity and η<1/2. The existing irreducible Dickson supplier alone is insufficient; the requested semisimple/Cartan variant is explicit. |
| `R19.1/uniformly-bounded-residual-images-in-weight-one` | corrected | Added the two direct density prerequisites already requested by the proof. One common M and finite-field Chebotarev give Condition C uniformly before applying the subgroup bound. |
| `R19.1/lifting-representations-of-groups-of-order-prime-to-l` | corrected | Put finite residue field in the statement and requested congruence-kernel/reduction/inverse-limit matrix infrastructure. Both pinned complement and finite-inverse-system declarations match that finite-level proof. |
| `R19.1/weight-one-characteristic-zero-lift` | corrected | Added the actual Chebotarev-density edge. Large completely split ℓ avoid the bounded residual order; the finite-image prime-to-ℓ lift and full-polynomial recognition give the characteristic-zero Artin lift. |
| `R19.1/weight-one-cuspidal-irreducibility` | corrected | Added density normalization and the Euler-product logarithm with uniform higher-prime-power remainder. Pinned zeta residue and character nonvanishing are correct but do not alone establish the prime-sum asymptotic. |
| `R19.1/weight-one-artin-representation` | corrected | Added the existing exact recognition node and upstream cusp/Eisenstein weight-one decomposition. The Artin theorem is assembled from the finite lift and separate cuspidal irreducibility argument, not duplicated in ML.1/R27.6. |
| `R19.1/parabolic-realisation-premotive` | corrected | Corrected rational λ-adic realizations to every finite λ in both statement and API. Only crystalline/integral comparison excludes S; DFG §1.2 and §4.5 distinguish these. |
| `R19.1/newform-rank-two-realisation` | corrected | Removed the unsupported assertion that DFG Lemma5.7 proves all-weight absolute irreducibility. Rank/pairing and weight-two irreducibility are checked; the separate all-weight proof is an explicit gap without a circular later-Hilbert input. |
| `R19.1/integral-structure-of-the-newform-premotive` | corrected | Corrected the bad-prime lattice qualification: finitely generated integral realizations still exist at all λ; their image after killing torsion is a full stable lattice. Integral freeness/crystalline comparison outside S is kept separate. |
| `R19.2/hilbert-modular-compatible-system-carayol-theorem-A` | verified | Carayol 0.3/TheoremA keeps a finite discrete-series place in even degree. His historical strictly-compatible terminology controls away-λ local parameters; the modern coefficient-prime strictness is a later target. |
| `R19.2/carayol-sigma-lambda-construction` | verified | Carayol §2 gives the coefficient sheaf, two-dimensional Hecke multiplicity and level independence; over Q parabolic/intersection cohomology is essential. Four API tests distinguish rank and boundary behavior. |
| `R19.2/carayol-twisting-and-determinant` | verified | Carayol §3 only gives the determinant square; §5.5–5.6 removes its quadratic ambiguity. Inverse central character and inverse norm are retained in his named convention. |
| `R19.2/carayol-vanishing-cycle-filtration` | verified | Carayol 4.2–4.8/5.6 gives the filtration and principal-series criteria. Vanishing-cycle/model inputs are exact R18/LPV requests with unread bad-reduction interiors recorded. |
| `R19.2/carayol-special-places` | verified | Carayol 6.7/11.4 gives the special extension with nonzero monodromy. The indecomposability step uses the recorded Picard–Lefschetz input; semisimplified traces would not prove it. |
| `R19.2/carayol-local-fundamental-representation` | verified | Carayol 10.3–10.6 computes the local vanishing part from the fundamental representation and Jacquet–Langlands contragredient. Drinfeld and formal-model constructions stay with R18.5. |
| `R19.2/carayol-ordinary-cuspidal-places` | verified | Carayol 11.2–11.3 reduces an ordinary cuspidal local component to a global CM form. Quadratic globalization and automorphic induction are precise R17.5 inputs, not new objects here. |
| `R19.2/carayol-theorem-b` | verified | Carayol TheoremB covers p≠v and the non-extraordinary cases; it is not silently promoted to the full all-Hilbert theorem. |
| `R19.2/carayol-primitive-restriction-lemma` | verified | Carayol 12.1 primitive tetrahedral/octahedral restriction lemma retains dyadic characteristic, the cubic 2-Sylow restriction and the determinant, including the non-Galois octahedral case. |
| `R19.2/carayol-cubic-base-change-of-extraordinary` | corrected | Added the existing weak non-normal-cubic transfer node. Its almost-all Satake output does not prove Carayol 12.2.2 at the chosen place; the stronger all-place local request remains explicit. |
| `R19.3/strict-compatibility-and-the-monodromy-weight-purity` | corrected | Restored Saito’s degree, multiweight and even-degree finite-discrete-series hypotheses. Removed the unverified all-Hilbert object from this geometric proof and added operations/generic transport edges; general purity remains a separate gap. |
| `R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime` | corrected | Restored the full Hilbert standing hypotheses. Generic comparison is imported rather than replanned; the classical all-weight/small-prime p-adic source input is explicitly recorded rather than attributed to the g>1 paper. |
| `R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility` | verified | Carayol 0.4–0.6 local normalization is verified: half-norm twist then contragredient, including N. It does not by itself identify the combined Kisin/Skinner global object. |
| `R19.4/conductor-and-local-factors-classical` | corrected | Corrected Carayol Corollary0.8 to printed p.411. Classical conductor and bad factors use the appropriate inertia invariants and the matching representation convention. |
| `R19.6/determinants-and-representability-over-a-hecke-algebra` | corrected | Corrected Theorem2.22(i) to p.34 and removed the stale TheoremB acceptance instruction. Split absolutely irreducible residual determinant over a finite field suffices; the law must precede reconstruction. |
| `R19.6/weight-two-tate-module-decomposition` | verified | DDT3.1.1 and the exact R14.5 modular quotient/dimension statements give the weight-two Tate decomposition over K_f⊗Q_ℓ, rather than dimension two over Q_ℓ in every coefficient field. |
| `R19.6/residual-representation-of-a-newform` | corrected | Replaced trace-only recognition by full characteristic polynomials; added the exact residual recognition edge, extensionality API and the characteristic-two scalar-character counterexample. |
| `R19.6/hecke-algebra-representation-quaternionic` | corrected | Restored KW central action, coefficient and noncompact p=2 assumptions; corrected equivalence, specialization rings, Hilbert residual input, determinant-law reconstruction and universal-ring edges. Replaced the false level11,p5 nonexistence example. |
| `R19.6/full-weight-two-hecke-algebra-and-its-galois-representations` | corrected | Added the already requested R15.2 generation interface. DDT’s full Hecke algebra and rank-two generic Tate module retain oldspace nilpotents; the level88 test distinguishes the reduced new quotient. |
| `R19.6/hecke-algebra-representation-classical` | verified | DDT3.24–3.27 construction and coefficient-change maps match the odd-prime/type-Σ hypotheses. The finite-quotient local-condition exercise is honestly recorded, not inferred from field-point embeddings. |
| `R19.6/reduced-hecke-algebra-as-a-localisation` | corrected | Added the upstream newform/local-Hecke polynomial edge. DDT4.6/4.7 identifies this special type-Σ localization as reduced; it does not claim that every full Hecke localization is reduced. |
| `R19.4/quaternionic-sigma-place-local-form` | corrected | Restored KW’s noncompact p=2 coefficient carrier and added the family producer edge. Restricted the conclusion to the fixed-character eigenform assertion actually proved by Lemma7.2; an integral invariant family line is a separate gap. |
| `R19.5/hilbert-local-behaviour-at-p` | corrected | Added the R07.4 and R21.3 inputs used by KW7.8. Its residual irreducibility, unramified-base and norm-factor hypotheses remain; higher weight is not automatically Barsotti–Tate. |
| `R19.2/wiles-ordinary-hilbert-representation` | corrected | Restored p odd from Skinner–Wiles introduction p.6. The source’s contragredient twisting convention explains the displayed second ψ twist; the ordinary theorem is imported from R21.3. |
| `R19.4/nearly-ordinary-hilbert-compatibility-away-from-p` | verified | Skinner–Wiles(3.3), printed p.39, matches the inverse-character/half-norm local normalization and preserves bad-place monodromy. Its identification with node42 is part of the unresolved global dictionary. |
| `R19.1/scholl-projector` | verified | Scholl1.0–1.3 gives the sign projector for r=k−2≥1, cohomological degree and homological realization. The API does not claim an unconditional individual Chow projector. |
| `R19.1/newform-projector-and-coefficient-descent` | corrected | Added the exact weight-two modular quotient/dimension branch; Scholl’s r≥1 projector only applies at k≥3. Rational orbit rather than single complex-embedding projectors and lattice/period cautions remain. |
| `R19.2/all-cohomological-hilbert-representation` | unverifiable | The combined “Carayol/Kisin” object has no verified coefficient/Hecke dictionary. Carayol’s inverse-uniformizer and dual local parameter cannot be identified with Kisin’s displayed polynomial by notation alone. Rebuild this target before acceptance. |
| `R19.2/hilbert-uniqueness-determinant-oddness-irreducibility` | unverifiable | The inverse-central-character determinant is correct for Carayol’s own σ, but is transported to the unverified node42 object without proof. Skinner’s irreducibility argument is valid for his named representation; the conversion must be checked. |
| `R19.2/cm-hilbert-eigenform` | verified | CM is a predicate on the existing regular eigenform, importing quadratic induction/class-field characters. The nonconjugate character hypothesis excludes reducible/noncuspidal induction and weight-one real-quadratic confusion. |
| `R19.2/virtual-reducibility-implies-cm` | verified | The Ribet compact-group/Clifford argument with regular Hodge weights gives virtual irreducibility for non-CM forms; archimedean discrete series forces the inducing quadratic field to be CM. The source has the stated regular-weight restriction. |
| `R19.3/dimitrov-large-image` | corrected | Corrected the Newton–Thorne26 consumer anchor to Lemma5.7 p.41 and [Dim05, Proposition3.8]. Dimitrov’s irreducible/dihedral/exceptional exclusions give a finite-subfield SL₂ conclusion, not full GL₂(κ_λ). |
| `R19.3/ribet-momose-classical-large-image` | corrected | Removed the unrelated NT21 Ribet occurrence and located NT21b Theorem3.1 prime selection at p.26. Ribet85 separates every-λ openness from almost-all residual image and retains the inner-twist/Momose input gap. |
| `R19.3/fixed-eigenform-compatible-family` | unverifiable | The fixed-family target assembles the unverified global Hilbert model/local conversions, and its full purity cannot be obtained from the corrected geometric Saito node. Good-prime polynomials alone do not certify this strict family. |
| `R19.4/all-hilbert-local-global-compatibility` | unverifiable | Skinner equation(1) proves full away-p compatibility for his named representation; translating it to the unspecified Hecke-normalized node42 σ requires the missing dual and norm twist. N is correctly retained, but this identification is unverified. |
| `R19.5/kisin-hilbert-coefficient-prime` | unverifiable | Kisin4.3 and the arbitrary-A° quotient are verified in their own source conventions. The theorem is stated on node42’s unidentified σ, so its transport is not yet certified; residual absolute irreducibility must remain. |
| `R19.5/skinner-full-hilbert-coefficient-prime` | unverifiable | Replaced the unrelated induction stage with the exact adjoint-lift node and recorded GL₃ geometric, Wintenberger, family and period-continuation inputs. Skinner’s theorem is verified in his own convention; its final translation to the packet object remains unverified. |
| `R19.5/ordinary-refinement-and-saturated-lattice` | verified | The unit-root quotient and fixed-lattice intersection use imported R21.3 characters. The actual Lean restrictScalars/intersection/saturation prototype distinguishes an integral lattice from a rational ordinary line. |
| `R19.5/good-nonordinary-crystalline-wach-realisation` | corrected | Corrected N(T)/π to the integral lattice with rational comparison after inverting p, in statement/proof/API; added the rank-one Z_p versus Q_p counterexample. Semilinear basis change and repeated roots remain distinguished. |
| `R19.5/endpoint-weight-local-contract` | verified | Endpoint k=p+1 still gives the characteristic-zero crystalline target but lies outside the chosen [0,p−2] Fontaine–Laffaille comparison. The different weight-two lift and residual-type criterion remain precise imports/gaps. |
| `R19.2/ordinary-cm-primes-split` | verified | DK9.1 and Hara–OchiaiA.3 retain regular CM/ordinary-type hypotheses; splitting alone is not the source’s unconstrained iff criterion. |
| `R19.2/cm-ordinary-line-complex-conjugation` | verified | DK9.2 retains the specified ordinary line and distinct local characters. The nontrivial CM conjugation interchanges the two global character lines; no arbitrary invariant line is substituted. |
| `R19.5/shimura-curve-hk-dR-multiplicity` | verified | CDN5.2.1 Proposition5.2 includes SD₂ weight two, distinguished-real-place central character, local JL(M), completions and tower actions. Its source-normalized multiplicity is verified; broader global dictionary remains separate. |
| `R19.3/skinner-density-one-ordinary-primes` | verified | Skinner20 §3 p.350 uses non-CM weight2, squarefree level and trivial character. Density-one ordinarity is at some λ|p, while eventual residual irreducibility and ramification are for every λ; level-lowering and trace-zero inputs are imported. |
| `R19.6/geometric-hecke-determinant` | verified | The actual generic geometric rank-two module precedes law descent, including oldform nilpotents. IHG.4 owns the generic interpolation; the higher-weight/Hilbert module and nonflat extension are conditional recorded inputs. |
| `R19.6/hecke-family-local-conditions` | verified | Exact local deformation functors/quotients are required on all finite quotients. O-flatness descends an ideal only after vanishing on the entire generic algebra, including nilpotents; ordinary integral flags and torsion functor checks remain explicit gaps. |

## API, tests, suggested file and planets

All 15 definitions/constructions have recorded uses, 86 total API specifications and 63 discriminating tests. The outlines cover the relevant constructor, extensionality, scalar change, cohomological realization, topology, universal property and comparison interfaces rather than requiring users to unfold a definition. No new definition or key theorem was hidden in an unnamed routine proof step. The full inventory uses the corrected packet’s exact statements, hypotheses, prerequisites, APIs and tests.

Available algebraic carriers are used in actual Lean signatures. New finite-group signatures cover `ConditionC.mono`, relative index two and the monic invertible quadratic fibre count. Actual three-element-field fibre tests distinguish split, repeated and irreducible polynomials; the cyclic subgroup and top-group tests exercise sharp boundaries. The characteristic-two matrix test distinguishes trace equality from determinant/characteristic-polynomial equality. Existing rank-two projector, integral-line intersection, dual-number and mixed-coefficient prototypes retain real carriers. Advanced missing Galois/geometric/period/family carriers are named in comments and their signatures omitted; no desired theorem is assumed in a Prop-valued field. The suggested file expressly records `needs_changes` for the unverified Hilbert identifications.

All 25 planets were checked as key definitions, central constructions or named results. No planet was added or removed; the target-level granularity was preserved.

## Checks and questions for the orchestrator

Checks: `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicGaloisRepresentations.json` reports zero errors and warnings. `lean-check research/blueprint/suggested/AutomorphicGaloisRepresentations.lean` elaborates against the pinned Mathlib build with only the permitted `sorry` warnings (21); memory was checked before compiling. This checks types and syntax, not the proofs represented by `sorry`. Metadata, counts, all15 API/test minima, source-issue verdicts, acyclic internal prerequisites, packet/inventory equality, authorized paths and whitespace were checked independently.

The orchestrator should route a revision of this plan, followed by another independent review, with these concrete tasks:

1. Fix the global Hilbert model and all source adapters before restoring the six unverified nodes or marking R19.2–R19.5 planned. Keep the corrected Saito purity scope and supply the missing full-family purity input.
2. Synchronize the reader document with **all** packet corrections (the 28 corrected nodes plus node51’s corrected imports/gap, coverage, source issues and requests). The reader was not an authorized deliverable of this review.
3. Resolve the R34.6 Hilbert export’s retired R06.6 modular dependency/ownership risk. Request the geometric Saito theorem from its actual owner; avoid a cycle where R19 imports an export that depends on R19’s own arithmetic theorem.
4. Identify exact AG2.1b/AG2.6 GL3 geometric/comparison exports and the group-specific overconvergent quaternionic/Hilbert family interface required by Skinner. The generic PadicFamilies L2a gluing input alone does not construct the group-specific family, and importing its later Galois application risks a cycle.
5. Obtain/check the original classical all-weight irreducibility and p-adic comparison sources, the stronger local non-normal-cubic comparison, and the remaining Taylor/Momose/bad-reduction/integral-family proofs named in the packet gaps. The ordinary-family integral invariant line must be proved on the actual algebra, not inferred from field points.

No upstream roadmap, supplier packet, live atlas data, campaign document, or issue state was edited by this review. This job’s full review is complete; the proposed mathematical plan is rejected pending the identified revisions.
