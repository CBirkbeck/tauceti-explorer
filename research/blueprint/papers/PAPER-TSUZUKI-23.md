# Tsuzuki: minimal slope conjecture of F-isocrystals

**Extraction status: partial.** Independent review `REV-PAPER-TSUZUKI-23`, issue #1259,
Codex session `codex-hjdg0j`, 2026-09-23: **revise**. All three corrected routes are
accepted as ownership decisions. Source and proof closure remains required.

165 items (7 library, 27 planned, 131 missing); 346 acyclic dependency edges; 55 definitions/constructions with 166 API contracts and 166 planning tests; three routes; 26 independently confirmed source findings.

The primary text is [arXiv:1910.03871v3](https://arxiv.org/pdf/1910.03871v3),
41 numbered pages, SHA-256
`611090d2e371483ff7996170368255462eeae03e5277c93a2ec406ac47c18457`.
The reviewer read all pages and inspected images of pp.15,16,19,20,30,33,34,38.
The [publisher record](https://link.springer.com/article/10.1007/s00222-022-01146-5)
identifies Inventiones mathematicae 231 (2023), 39–109 and publicly displays
Appendices A–B. Those appendices were read; E23 and E24 persist there.
The main journal text remains unavailable, so the other findings are certified
for v3 only. The arXiv history still lists v3 as latest and records changed proofs
of 5.2 and 6.1.

## Mathematical targets and conventions

For local and curve results, K is the paper's complete discretely valued field
of mixed characteristic, with perfect residue field k and specified q-Frobenius.
Neither finite k nor unramified K is implicit. Frobenius slopes are q-normalized:
m/n uses m in Z and positive n. Duality negates slopes and reverses arrows.

Corollary 6.5 starts with h:Top(N)→Top(M) between convergent maximal-slope
quotients. If both overconvergent coefficients are irreducible and h≠0, or both
are PBQ and saturated and h is invertible, there is a **unique overconvergent
isomorphism inducing h**. Remark 6.6 weakens full slope filtrations to specified
pure top quotients with strictly smaller kernel slopes, followed by dense
restriction and full faithfulness.

Theorem 7.20 works over finite Fq with Qpbar coefficients. Its first part gives
an isomorphism from nonzero h between top quotients. Its compatible-lift part
retains the additional endomorphism condition after finite constant extension.
The review does not strengthen this to the later general theorem mentioned in
the introduction.

The analytic rings remain distinct. E has bounded Laurent coefficients with
negative tail tending to zero; E† adds exponential decay at a suitable inner
radius; the full Robba ring permits unbounded coefficients and uses radius norms.
The extended Ẽ has well-ordered support at each valuation threshold, not
necessarily well-ordered total support. Its residue is a Hahn field.

For the generic field of a lifted curve, localize at the vertical prime,
complete that valuation ring, then invert p. This gives residue k(C); it is not
an unspecified ideal-adic completion of a field. This order is now explicit in
item 039 and its API/test contracts.

Boundedness of solutions is stronger than solvability. Frobenius supplies
solvability; purity supplies boundedness after the allowed normalization.
The maximal bounded quotient has a universal minimal kernel, with zero treated
separately. PBQ requires its nonzero bounded quotient to have one slope.
For an increasing PBQ filtration P_i, the decreasing slopes and bounded quotient
formula use G_i=P_i/P_(i−1). The sums of Top(P_i) would repeat the highest slope.
Saturation is the image **quotient** in the top slope quotient, not an integral
lattice enlargement. Recovery of saturated graded pieces does not recover
extension classes.

Finite coefficient categories use multiplication projectors, field-trace duality
and normalized rank. The raw Appendix-B unit/trace factor is n[L:K]; its projected
comparison is an explicit obligation. In a trace of F^n, twisting F by lambda
multiplies the trace by lambda^n. Arbitrary constant twists require real weights:
the F3 coefficient line with Frobenius 2 has nonintegral weight.

## Pinned baseline and ownership

Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti at
`f790474821cf4256814db967cb154e7af3d0c369`. The reviewer read all seven library
declarations, including standing hypotheses and generated additive declarations;
eight source files were compared byte-for-byte with the pinned remote files.

Mathlib supplies the Witt-vector isocrystal carrier, **rank-one** classification,
Hahn carrier, finite antidiagonals, union, additive sum and positive-support
closure. It does not thereby supply general Dieudonné–Manin, mixed-characteristic
generalized Amice fields, connections or geometric coefficients. Its Amice
transform is a measure transform. Tau Ceti's Hahn inverse file supplies
leading-coefficient formulas, not PBQ theory.

The current reviewed coverage has no entries for RD, VB or CrystallineCohomology;
this is recorded as an absent audit, not evidence that everything is missing.
Both owning READMEs and their atlas stages were checked in full.

| Route | Owner | Contract |
|---|---|---|
| 1 — accepted | PadicDifferentialEquationsAndRigidCohomology, RD.0–RD.6 | Analytic rings, differential Frobenius modules, local monodromy, frames, coefficients, gluing, cohomology, duality, trace and weights. Item 165's rank-one normalization/gluing belongs at RD.3. |
| 2 — accepted | VectorBundlesAndIsocrystals:VB0 | General pointwise Dieudonné–Manin with coefficient and slope conventions, beyond Mathlib's rank-one theorem. |
| 3 — accepted | PadicDifferentialEquationsPartIIMinimalSlope | PBQ, bounded quotients, saturation and minimal-slope lifting; exact parent title restored. |

Generic coefficient Chebotarev already has a shared supplier proposal:
`PAPER-ABE-18/51` in `PadicDifferentialEquationsPartIIArithmeticDModules`.
Item 134 is now its minimal-slope application, with mixedness/purity from item
140 and dense full faithfulness made dependencies. The pure-Hom pole argument
in Tsuzuki is an alternative proof at that common owner.
`PAPER-ESNAULT-GROECHENIG-20/109` is another consumer through the rigid-companions
continuation. The exact arithmetic-D-module stage is pending design; no fictional
built stage or second generic Chebotarev programme is introduced here.

## Source findings and open proof work

Every inherited finding has an independent verdict, and E25–E26 were added.
E7/E8 need nonzero hypotheses; E20 affects the unrestricted purity theorem as
stated. E9 is a clear graded-index misprint with the corrected convention verified
in CT11 and Ohkubo; the intended graded theorem is not refuted.

E12's suggested finite-étale repair remains a candidate argument. The printed
Proposition 3.14 compares Eη with Eα. Applying its proof to Eη′/Eη also needs the
compatible Taylor/generic-disc comparison, bounded-solution annihilator descent,
slope preservation and finite-étale adjunction. Merely naming Proposition 3.14
does not close those steps.

E25 records another missing reduction: the rank-one step of Lemma 3.33 applies
the unit-root Lemma 3.32 to an arbitrary rank-one generic line. A constant line
with F=q already shows that rank one does not imply unit-root. Item 165/G10
records normalization, untwisting and coefficient descent, including the embedding.
E26 corrects finite-L versus Qpbar fiber notation in Lemma 7.11; ordinary K-trace
must be taken on the finite L-model, not an infinite-dimensional Qpbar space.

| Finding | Kind / reach | Correction |
|---|---|---|
| E1 | misprint; nothing | Use discrete valuation ring R, with fraction field K. |
| E2 | misprint; nothing | Restrict the finite coefficient supremum to the bounded rings; use radius-indexed norms on the full Robba ring. |
| E3 | misprint; nothing | Use K[[t]]₀ in this local definition. |
| E4 | misprint; nothing | Use ordered abelian group Q; require well ordering of the specified supports. |
| E5 | misprint; nothing | The growth criterion is Lemma 2.6(4); remove or repair the undefined filtration-length symbol s in the following proposition. |
| E6 | error; the proof | Prove closure of solvable and bounded categories separately by their respective trivializations; do not use solvable⇒bounded. |
| E7 | error; a stated result | Add M≠0 to the asserted nonzero quotient, and separately define the bounded quotient of zero to be zero. |
| E8 | error; a stated result | Require N≠0 in the unit-root tensor detection assertion. |
| E9 | misprint; nothing | Use graded pieces G_i=P_i/P_(i−1): the decreasing slopes are λmax(G_i), the bounded quotient is ⊕Top(G_i), and the lifting theorems recover saturations of G_i. |
| E10 | misprint; nothing | Put dim_K on the solution-space side; use d/dx, not d/dy, in the displayed definition of Sol_λ. |
| E11 | misprint; nothing | Assign M† to C′ and N† to C so that f_*M† and f* N† are typed correctly. |
| E12 | gap; the proof | Supply an independent finite-étale generic solution/base-change argument for PBQ preservation by pullback before using it to prove the direct-image detection assertion. (cc-442dc5) A non-circular proof of (1): PBQ is a property of the generic ϕ-∇-module, and for the finite étale f the generic module of f*N† is E_{η′} ⊗_{E_η} N_η. The argument of Proposition 3.14 and Corollary 3.15, applied to the finite extension E_{η′}/E_η in place of E_α/E_η, gives (E_{η′} ⊗ N_η)^b = E_{η′} ⊗ N_η^b, so PBQ is preserved. Part (2) then follows as printed. Independent review: this is a proposed repair outline. Its finite-étale generic-disc comparison and bounded-kernel descent are not proved by the stated generic-local Proposition 3.14 alone; G2 remains open. |
| E13 | misprint; nothing | The domain of the displayed support-forgetting map should be H¹_rig,c(C,L†(χ)), with compact support. |
| E14 | misprint; nothing | Use M/M^b as a convergent F-isocrystal, and say h is a convergent, not necessarily overconvergent, coefficient morphism. |
| E15 | misprint; nothing | The target of this intermediate isomorphism is the restriction of M†. |
| E16 | misprint; nothing | The left side must be θL₁,L₃, interpreted through the canonical associativity isomorphism. |
| E17 | gap; the proof | Explicitly identify the K-dual with the L-dual through the finite-field trace and apply the multiplication component of L⊗K L before the L-valued evaluation. |
| E18 | error; the proof | Use L⊗K Qpbar≅∏_{τ:L→Qpbar}Qpbar, or the trace-of-restriction-of-scalars identity directly. |
| E19 | error; the proof | For the trace of the nth Frobenius iterate, replacing F by λF multiplies by λ^n, not λ. Finish using nondegeneracy of trace and the fact that nth powers span L over K in characteristic zero. |
| E20 | error; a stated result | Allow arbitrary real weights, or explicitly normalize by a rank-one twist and then restore its weight. The unrestricted mixedness/purity theorem cannot use integer-only weights. |
| E21 | misprint; the proof | The lifted τ_m is an endomorphism of the pulled-back N† lifting (g′)^−1h on its top quotient; the resulting map N†→M† is g′∘τ_m, not (g′)^−1∘τ_m. |
| E22 | gap; the proof | Derive the normalization after the K_m⊗L coefficient projector before using the displayed 1/m average. |
| E23 | misprint; nothing | In the comparison with the completed algebraic residue extension use valuation group, not valuation ring; in the tube notation use sp^−1(Z), not sp(Z). |
| E24 | gap; the proof | Supply a σ-compatible action on a sufficiently enlarged L, or a different descent construction. Identity on L does not in general glue to σ on K over K^(σ^n). |
| E25 | gap; the proof | Normalize the arbitrary rank-one generic object to unit-root by an allowed constant Frobenius twist, after a compatible finite coefficient extension if needed; then untwist and descend the global object and embedding. Supply these comparisons before applying the unit-root Lemma 3.32. |
| E26 | misprint; nothing | In (1) use the finite L-model M_alpha,L as the target of the L-isomorphism; in (3) take the K-trace on restriction of scalars of that finite L-model, then extend the resulting equality to Qpbar. |

All findings are version-scoped. Correction searches checked arXiv history, the publisher article and bounded primary-site searches. The author homepage was found in search, but full fetch failed; no exhaustive novelty claim is made.

| Gate | Status | Required work |
|---|---|---|
| G1 | unavailable | The complete public arXiv v3 (41 numbered pages) was read. The journal metadata is Inventiones 231 (2023), 39–109, but its 71-page final text was not fully available for line-by-line collation. Match final theorem numbering, hypotheses, appendix changes and corrections; do not treat preprint findings as verified published errors. Independent review collated publicly displayed journal Appendices A–B; E23–E24 persist. Main journal §§1–7 remain unavailable. |
| G2 | open | Replace Lemma 3.31's circular-looking printed proof with a precise generic solution/scalar-extension argument. Read the finite-étale direct-image construction in [47], then prove the correct pullback and direct-image detection statements. Make the finite-étale generic-disc/Taylor identification and isometric coefficient map explicit, descend the annihilator of bounded solutions, and check Frobenius slopes and the pull-push counit. The inherited repair is plausible but these comparisons are not written out. |
| G3 | open | Read exact hypotheses and proofs of [15], [31]–[34], [44]–[48], Katz correspondence, finite local monodromy, full faithfulness and extension of subobjects. Parent stages are owners, not proof certificates. Verify de Jong correction history. Split the two input assertions currently collected under denseff. |
| G4 | open | Read Shioda–Inose and Stienstra–Beukers case A, distinguish compactified K3 cohomology from the open surface used in the Leray comparison, calculate the root-of-unity factor and show the selected Ext class is nonzero. The recorded rank-three extension is source-stated, not validated in this checkpoint. |
| G5 | open | Split the rank-r reduction of 2.14, generic cyclic-vector integrality, generalized-series Hensel root estimates and the external Hahn algebraic-closure theorem into individual located proof leaves. The source was read but this dependency inventory is not a closed proof graph. |
| G6 | open | Type the finite coefficient dual pairing, σ-compatible extension in A.1(3), and projected unit/trace diagram in 7.15(2) completely. The raw trace-unit factor is n[L:K]; derive the projected factor n, rather than guessing between n and n². See E17,E22,E24. |
| G7 | open | The public source passages listed in provenance were read. Collate their published numbering and full supporting proofs, especially Drinfeld/Tannakian finite-set Lefschetz, finite-determinant twisting, and Ohkubo's general log-growth comparison/splitting inputs. AE arXiv v1 labels mixedness 2.6, whereas Tsuzuki cites published 2.7. |
| G8 | open | Separate remaining multi-part estimate/base-change/tower statements where proofs are not simultaneous; complete omitted foundational leaves (weak completion, Elkik lifting, Noetherian/coherent descent and tensor-category construction). Recheck the latest queue and accepted plans, especially the pending rigid-companions successor, before design. The generic coefficient Chebotarev owner is the shared arithmetic-D-module continuation proposed by PAPER-ABE-18/51; item 134 is its minimal-slope application. Keep the final named import and proof graph explicit when that design supplies stages. |
| G9 | resolved | All observations concern the stated preprint version. None has an independent review verdict. Resolve journal changes and mathematical repair scopes before promoting them as confirmed source errors; the source-issue list distinguishes proof gaps from false statements. |
| G10 | open | Lemma 3.33 invokes the unit-root Lemma 3.32 for an arbitrary rank-one generic line. Construct a compatible finite coefficient extension and constant Frobenius twist to normalize its slope, check every interior and boundary lattice, apply the unit-root result, untwist, and descend the object together with its embedding. Supply a precise descent theorem at RD.3 and retain Appendix A.1 compatibility gate G6. See E25. |

The supplier reading ledger is precise: CT11 pp.46,55–59; Ohkubo v1 pp.44–47
(including the descent proof, not the proof of Proposition 12.12); Abe–Esnault
v1 pp.6,11–12,15–16. Downloads reproduce the hashes in auxiliarySources.
Their other supporting proofs are not silently certified by these readings.

## Validation and item index

The paper checker passed; the five-file intake check reported zero problems.
Their actual results are recorded in the review and handoff. Structural checking
verifies every ID and planned/source-stage reference, exactly one route per
missing item, the acyclic graph and complete API/use/test lists.
Seven exact arithmetic diagnostic groups check signed slopes, graded PBQ indices,
scalar twisting, finite differences, trace duality, the raw degree factor and
Frobenius tensor compatibility. These are not Lean tests. No Lean file was
required, written or compiled.

The original 164 IDs are retained; item 165 is the newly isolated rank-one step.

| Item | Name | Status |
|---|---|---|
| 001 | Witt-vector point isocrystal | library |
| 002 | Rank-one Dieudonné–Manin baseline | library |
| 003 | General pointwise slope classification | planned |
| 004 | Amice field | planned |
| 005 | Bounded Robba field | planned |
| 006 | Full Robba ring | planned |
| 007 | Bounded disc series | planned |
| 008 | Coefficient-compatible Frobenius lifts | planned |
| 009 | Frobenius module | planned |
| 010 | Differential module | planned |
| 011 | Horizontal Frobenius differential module | planned |
| 012 | Overconvergent and bounded-disc lattices | missing |
| 013 | Exact tensor category of differential Frobenius modules | planned |
| 014 | Local overconvergent full faithfulness | missing |
| 015 | Unit-root Frobenius module | planned |
| 016 | q-normalized rational Frobenius slope | planned |
| 017 | Decreasing slope filtration and top quotient | planned |
| 018 | Slope filtration is horizontal | missing |
| 019 | Residue Hahn series | library |
| 020 | Valuationwise generalized Amice series | missing |
| 021 | Finite antidiagonals of well-ordered supports | library |
| 022 | Coefficient threshold function | missing |
| 023 | Threshold estimates | missing |
| 024 | Linear threshold criterion for overconvergence | missing |
| 025 | Uniform negative-support bound on powers | missing |
| 026 | Extended complete discrete valuation field | missing |
| 027 | Henselian extended bounded Robba field | missing |
| 028 | Intersection and linear disjointness | missing |
| 029 | Frobenius-fixed extended coefficients | missing |
| 030 | Integral Frobenius equations force overconvergence | missing |
| 031 | Unit-root trivialization over Ẽ | missing |
| 032 | Unit-root trivialization over Ẽ† | missing |
| 033 | Opposite filtration over the extended dagger field | missing |
| 034 | Descent of the highest extended slope piece | missing |
| 035 | Quasi-saturated local rank equality | missing |
| 036 | Rank-one extended target detects highest slope | missing |
| 037 | Overconvergent F-isocrystal on a smooth variety | planned |
| 038 | Weak completions and partial overconvergence | planned |
| 039 | Generic and closed-point localizations | missing |
| 040 | Flat maps in the one-boundary-point square | missing |
| 041 | Local and global intersection descriptions | missing |
| 042 | Affine and generic evaluation of coefficients | planned |
| 043 | Generic slope filtration and local scalar extension | missing |
| 044 | Taylor map to the generic disc | missing |
| 045 | Solvable and bounded generic-disc modules | planned |
| 046 | Coordinate independence of solvability and boundedness | missing |
| 047 | Closure under abelian tensor operations | missing |
| 048 | Detection of generic solution conditions after local extension | missing |
| 049 | Frobenius supplies solvability | missing |
| 050 | Unit-root Frobenius supplies boundedness | missing |
| 051 | Boundedness equivalent to slope splitting | missing |
| 052 | Descent intersection after perfected generic extension | missing |
| 053 | Maximally bounded quotient | missing |
| 054 | Generic solution and bounded solution spaces | missing |
| 055 | Solutions and bounded solutions commute with generic-local extension | missing |
| 056 | Bounded kernel commutes with local extension | missing |
| 057 | Pure of bounded quotient | missing |
| 058 | Same-slope PBQ direct sums | missing |
| 059 | Nonzero quotients preserve PBQ and maximal slope | missing |
| 060 | PBQ detected by nonzero unit-root tensoring | missing |
| 061 | Generic PBQ filtration | missing |
| 062 | Bounded quotient from graded PBQ top quotients | missing |
| 063 | Generic PBQ filtration commutes with local extension | missing |
| 064 | PBQ over bounded-disc and dagger rings | missing |
| 065 | PBQ filtration descends to a bounded-disc lattice | missing |
| 066 | PBQ filtration descends to a bounded Robba lattice | missing |
| 067 | Logarithmic-growth solution filtration | missing |
| 068 | PBQ log-growth and Frobenius comparison | missing |
| 069 | Bounded solutions of a PBQ disc module | missing |
| 070 | PBQ overconvergent coefficient on a curve | missing |
| 071 | Global PBQ filtration on a curve | missing |
| 072 | Irreducible curve coefficients are PBQ | missing |
| 073 | Global bounded quotient when slopes exist | missing |
| 074 | Same-slope direct sum for curve PBQ objects | missing |
| 075 | Nonzero curve quotients preserve PBQ slope | missing |
| 076 | PBQ and finite étale curve maps | missing |
| 077 | Globalizing unit-root local lattices | missing |
| 078 | Globalizing subobjects by interior and boundary lattices | missing |
| 079 | Kummer-twisted Legendre PBQ example | missing |
| 080 | Local saturation by the maximal-slope quotient | missing |
| 081 | Quasi-saturated embedding | missing |
| 082 | Image in a pure target is a dagger differential Frobenius module | missing |
| 083 | Injection into a pure target identifies maximal slope | missing |
| 084 | Image rank bound and equality criterion | missing |
| 085 | Local saturation quotient | missing |
| 086 | Quasi-saturated implies saturated | missing |
| 087 | Local irreducibility criterion | missing |
| 088 | Local recovery of saturated graded PBQ pieces | missing |
| 089 | Strong local maximal-slope lifting | missing |
| 090 | Saturation of a variety coefficient | missing |
| 091 | Saturation can be checked on one affine dense open | missing |
| 092 | Overconvergent image of the top-quotient section map | missing |
| 093 | Dense restriction preserves and detects saturation | missing |
| 094 | Irreducible overconvergent variety coefficients are saturated | missing |
| 095 | Saturation under finite étale pullback | missing |
| 096 | Saturation under finite coefficient extension and Frobenius iteration | missing |
| 097 | Canonical saturation quotient on a variety | missing |
| 098 | Dense restriction and extension of overconvergent subobjects | missing |
| 099 | Overconvergent-to-convergent full faithfulness | planned |
| 100 | Curve quasi-saturation rank equality | missing |
| 101 | Boundary kernel's maximal PBQ piece descends | missing |
| 102 | Curve irreducibility criterion | missing |
| 103 | Extensions with smaller subobject slope | missing |
| 104 | Equal-slope extensions | missing |
| 105 | Extensions with larger subobject slope | missing |
| 106 | Global recovery of saturated graded PBQ pieces | missing |
| 107 | Strong maximal-slope lifting on curves | missing |
| 108 | Weaker maximal-quotient hypothesis suffices | missing |
| 109 | Dual minimal-slope formulation | missing |
| 110 | Lefschetz condition through a closed point | missing |
| 111 | Curve lift when the target stays irreducible | missing |
| 112 | Curve lift when the source stays irreducible | missing |
| 113 | Closed fibers identified by two Lefschetz curves | missing |
| 114 | Unit-root source gives a compatible global surjection | missing |
| 115 | Finite coefficient-field structure | missing |
| 116 | Tensor product with coefficient projector | missing |
| 117 | Dual with finite coefficient structure | missing |
| 118 | Coefficient extension functor | missing |
| 119 | Algebraically closed p-adic coefficients | missing |
| 120 | Underlying coefficient of an absolutely irreducible object is isotypic | missing |
| 121 | Changing the finite base field's Frobenius convention | missing |
| 122 | Finite constant-field pullback and pushforward | missing |
| 123 | Rigid cohomology with finite-field coefficient action | planned |
| 124 | Cohomological base change with coefficient projector | missing |
| 125 | Linearized closed-point Frobenius | missing |
| 126 | Fiber trace under rational-point and coefficient changes | missing |
| 127 | Rigid Lefschetz trace formula over coefficient fields | planned |
| 128 | Coefficient L-function | planned |
| 129 | Cohomological determinant formula | planned |
| 130 | Iota purity and mixedness | missing |
| 131 | Finiteness of rigid cohomology with Frobenius coefficients | planned |
| 132 | Compact-support Poincaré duality | planned |
| 133 | Compact-support weight bounds | planned |
| 134 | Pure-Hom Chebotarev application | missing |
| 135 | Prescribed morphism from endomorphism-surjectivity | missing |
| 136 | Lefschetz condition with Qpbar coefficients | missing |
| 137 | Lefschetz fibers imply global isomorphism | missing |
| 138 | Faithfulness of restriction of endomorphisms | missing |
| 139 | Curve endomorphism preservation controls the top quotient | missing |
| 140 | Abe–Esnault mixedness and irreducible purity | missing |
| 141 | Abe–Esnault irreducibility-preserving curves | missing |
| 142 | Higher-dimensional minimal-slope isomorphism | missing |
| 143 | Compatible higher-dimensional lift under curve endomorphism condition | missing |
| 144 | Finite fixed coefficient field | missing |
| 145 | Unramified extension aligning fixed coefficients | missing |
| 146 | Enlarging Frobenius coefficients to contain a finite p-adic field | missing |
| 147 | Tubes and strict neighborhoods | planned |
| 148 | Frobenius lift extends to strict neighborhoods | missing |
| 149 | Affine realization equivalence with Frobenius | planned |
| 150 | Raw coefficient extension and Frobenius iteration | missing |
| 151 | Cyclic induction with restriction of scalars | missing |
| 152 | Adjunction unit and Frobenius trace | missing |
| 153 | Trace-unit degree and tower laws | missing |
| 154 | Pure slope boundedness after normalization | missing |
| 155 | Union of well-ordered supports | library |
| 156 | Sum of well-ordered supports | library |
| 157 | Positive support has well-ordered additive closure | library |
| 158 | Algebraic closure of the divisible residue Hahn field | missing |
| 159 | Cyclic vector for the relevant Frobenius difference module | missing |
| 160 | Unit-root generic coefficient and p-adic representation | missing |
| 161 | Unit-root dagger lattice implies finite local monodromy | missing |
| 162 | Overconvergent unit-root coefficients from finite boundary monodromy | missing |
| 163 | Full faithfulness from bounded-disc lattices | missing |
| 164 | Slope filtrations on a dense open | missing |
| 165 | Rank-one globalization after slope normalization | missing |

Submission audit: the paper checker passes and the five-file intake reports zero problems. The archive comparison contains exactly the five authorized paths, with no deletions or other additions. Eleven reviewed-input/rule files and twelve ownership/coverage records were refreshed at main commit 4058acaafd33d62d93fd82266ca696813e996b11. No Lean was compiled.
