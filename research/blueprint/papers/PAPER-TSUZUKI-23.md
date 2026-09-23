# Tsuzuki (2023): extraction and routing

Issue [#1258](https://github.com/CBirkbeck/tauceti-explorer/issues/1258). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged checkpoint of codex-a71f92, whose report follows below as history.
- **The paper.** N. Tsuzuki, *Minimal slope conjecture of F-isocrystals*, Invent. Math. 231 (2023), 39–109.
  - The journal version is closed access. arXiv v3, the latest version, was read (SHA-256 611090d2…).
  - All locators refer to arXiv v3.
- **Items.** The result has **164 items: 7 library, 27 planned and 130 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** Twenty-four are recorded under `sourceIssues`. None affects a stated result.

## This continuation (cc-442dc5)

**What was read.** §§1–3 and 7 of arXiv v3 in full, and the other sections at the findings' locators.

**The `known` field.** Every finding had `known` beginning "uncertain: preprint observation", which `scripts/errata.py` would read as "corrected in print". All are now "new", and the note has moved to `searched`.

**Reclassified findings.** The checkpoint had five findings affecting a stated result. On rereading, each has a clear intended form, and the paper's arguments use that form.
- **E2.** The Gauss norm sup|a_n| is used only on the bounded rings, as in "E and E† are discrete valuation fields under the Gauss norm". Listing the Robba ring is a slip.
- **E7 and E8 (Theorem 3.12, Proposition 3.18).** They fail only for the zero module; nonzero modules are meant, and Definition 3.13 speaks of the "nontrivial" quotient.
- **E9 (Theorem 3.19).**
  - As printed, condition (ii) is impossible: P₁ ⊂ P₂ forces the maximal slope of P₂ to be at least that of P₁.
  - So the graded pieces P_i/P_{i−1} are meant. The proofs of Theorem 3.19(2) and Proposition 3.29 use exactly that form, as does the cited [10, Cor. 5.5].
- **E20 (Definition 7.14).**
  - Weights restricted to Z make Theorem 7.18 false: a Frobenius-2 line over F₃ has weight 2·log₃2.
  - The paper uses purity only in the real-weight form of Abe–Esnault, so it now affects nothing.

**E12, with a repair.** The proof of Lemma 3.31 is circular: part (1) ends by concluding its own hypothesis. A non-circular proof of (1) is available:
- PBQ is a property of the generic ϕ-∇-module.
- Bounded quotients commute with the finite étale generic extension E_{η′}/E_η, by the argument of Proposition 3.14 and Corollary 3.15.

Part (2) then follows as printed. This is recorded in E12's correction and in item 076, and closes G2.

**The other findings.**
- E6, E18 and E19 are errors in proof steps whose conclusions stand.
- E17 and E22 concern coefficient-projector normalizations.
- E24 is Lemma A.1(3)'s Frobenius extension.

These were read at their locators and stand as recorded.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once, and the mistakes are recorded.
- What remains is suppliers' proofs and design work.

## Mistakes found (`sourceIssues`)

- **E1** (misprint; affects nothing), arXiv:1910.03871v3, §1.1 p.1; journal version not collated. *Printed:* discrete valuation field R *Correction:* Use discrete valuation ring R, with fraction field K.
- **E2** (misprint; affects nothing), arXiv:1910.03871v3, §2.1 p.4; journal version not collated. *Printed:* Gauss norm *Correction:* Restrict the finite coefficient supremum to the bounded rings; use radius-indexed norms on the full Robba ring.
- **E3** (misprint; affects nothing), arXiv:1910.03871v3, Definition 2.2(2) p.5; journal version not collated. *Printed:* Kα [[xα ]]0 *Correction:* Use K[[t]]₀ in this local definition.
- **E4** (misprint; affects nothing), arXiv:1910.03871v3, §2.2 p.6; journal version not collated. *Printed:* well-ordered Abelian group *Correction:* Use ordered abelian group Q; require well ordering of the specified supports.
- **E5** (misprint; affects nothing), arXiv:1910.03871v3, Proposition 2.9 proof p.8; Proposition 2.11 p.9; journal version not collated. *Printed:* Lemma 2.5 (4) *Correction:* The growth criterion is Lemma 2.6(4); remove or repair the undefined filtration-length symbol s in the following proposition.
- **E6** (error; affects the proof), arXiv:1910.03871v3, Proposition 3.7 proof p.14; journal version not collated. *Printed:* solvable ∇-module over B is bounded *Correction:* Prove closure of solvable and bounded categories separately by their respective trivializations; do not use solvable⇒bounded.
- **E7** (misprint; affects nothing), arXiv:1910.03871v3, Theorem 3.12 and Definition 3.13 p.15; journal version not collated. *Printed:* nonzero and bounded *Correction:* Add M≠0 to the asserted nonzero quotient, and separately define the bounded quotient of zero to be zero.
- **E8** (misprint; affects nothing), arXiv:1910.03871v3, Proposition 3.18 p.16; journal version not collated. *Printed:* M is PBQ if and only if M ⊗B N is PBQ *Correction:* Require N≠0 in the unit-root tensor detection assertion.
- **E9** (misprint; affects nothing), arXiv:1910.03871v3, Theorem 3.19(1–2) pp.16–17; propagated in 3.29, 4.11 and 6.4; journal version not collated. *Printed:* maximal slope of Pi *Correction:* Use graded pieces G_i=P_i/P_(i−1): the decreasing slopes are λmax(G_i), the bounded quotient is ⊕Top(G_i), and the lifting theorems recover saturations of G_i.
- **E10** (misprint; affects nothing), arXiv:1910.03871v3, Proposition 3.24 and Remark 3.25 p.18; journal version not collated. *Printed:* rankK[[x]]0 L0 = Sol(M0 )(−λmax ) *Correction:* Put dim_K on the solution-space side; use d/dx, not d/dy, in the displayed definition of Sol_λ.
- **E11** (misprint; affects nothing), arXiv:1910.03871v3, Lemma 3.31 p.19; journal version not collated. *Printed:* on C/K (resp. C ′ /K) *Correction:* Assign M† to C′ and N† to C so that f_*M† and f* N† are typed correctly.
- **E12** (gap; affects the proof), arXiv:1910.03871v3, Lemma 3.31 proof p.19; journal version not collated. *Printed:* N is PBQ by Lemma 3.30 *Correction:* Supply an independent finite-étale generic solution/base-change argument for PBQ preservation by pullback before using it to prove the direct-image detection assertion. (cc-442dc5) A non-circular proof of (1): PBQ is a property of the generic ϕ-∇-module, and for the finite étale f the generic module of f*N† is E_{η′} ⊗_{E_η} N_η. The argument of Proposition 3.14 and Corollary 3.15, applied to the finite extension E_{η′}/E_η in place of E_α/E_η, gives (E_{η′} ⊗ N_η)^b = E_{η′} ⊗ N_η^b, so PBQ is preserved. Part (2) then follows as printed.
- **E13** (misprint; affects nothing), arXiv:1910.03871v3, §3.9 p.21; journal version not collated. *Printed:* support forgetting map *Correction:* The domain of the displayed support-forgetting map should be H¹_rig,c(C,L†(χ)), with compact support.
- **E14** (misprint; affects nothing), arXiv:1910.03871v3, Theorem 6.4 p.27; journal version not collated. *Printed:* Mη /Mb *Correction:* Use M/M^b as a convergent F-isocrystal, and say h is a convergent, not necessarily overconvergent, coefficient morphism.
- **E15** (misprint; affects nothing), arXiv:1910.03871v3, Corollary 6.8 proof p.29; journal version not collated. *Printed:* i∗Cα,M ,X N † → i∗Cα,M ,X N † *Correction:* The target of this intermediate isomorphism is the restriction of M†.
- **E16** (misprint; affects nothing), arXiv:1910.03871v3, Proposition 7.5 p.30; journal version not collated. *Printed:* θL1 ,L2 = θL2 ,L3 ◦ θL1 ,L2 *Correction:* The left side must be θL₁,L₃, interpreted through the canonical associativity isomorphism.
- **E17** (gap; affects the proof), arXiv:1910.03871v3, Proposition 7.4 p.30; journal version not collated. *Printed:* perfect pairing *Correction:* Explicitly identify the K-dual with the L-dual through the finite-field trace and apply the multiplication component of L⊗K L before the L-valued evaluation.
- **E18** (error; affects the proof), arXiv:1910.03871v3, Lemma 7.11(3) proof p.33; journal version not collated. *Printed:* L ⊗K L *Correction:* Use L⊗K Qpbar≅∏_{τ:L→Qpbar}Qpbar, or the trace-of-restriction-of-scalars identity directly.
- **E19** (error; affects the proof), arXiv:1910.03871v3, Proposition 7.12 proof p.34; journal version not collated. *Printed:* λ *Correction:* For the trace of the nth Frobenius iterate, replacing F by λF multiplies by λ^n, not λ. Finish using nondegeneracy of trace and the fact that nth powers span L over K in characteristic zero.
- **E20** (error; affects nothing), arXiv:1910.03871v3, Definition 7.14 p.34 and Theorem 7.18 p.37; journal version not collated. *Printed:* w ∈ Z *Correction:* Allow arbitrary real weights, or explicitly normalize by a rank-one twist and then restore its weight. The unrestricted mixedness/purity theorem cannot use integer-only weights.
- **E21** (misprint; affects the proof), arXiv:1910.03871v3, Proposition 7.15(2) proof p.35; journal version not collated. *Printed:* τm *Correction:* The lifted τ_m is an endomorphism of the pulled-back N† lifting (g′)^−1h on its top quotient; the resulting map N†→M† is g′∘τ_m, not (g′)^−1∘τ_m.
- **E22** (gap; affects the proof), arXiv:1910.03871v3, Proposition 7.15(2) pp.35–36 versus Lemma B.1 p.40; journal version not collated. *Printed:* 1/m *Correction:* Derive the normalization after the K_m⊗L coefficient projector before using the displayed 1/m average.
- **E23** (misprint; affects nothing), arXiv:1910.03871v3, Appendix A.1 proof p.38; A.2 p.39; journal version not collated. *Printed:* valuation ring *Correction:* In the comparison with the completed algebraic residue extension use valuation group, not valuation ring; in the tube notation use sp^−1(Z), not sp(Z).
- **E24** (gap; affects the proof), arXiv:1910.03871v3, Lemma A.1(3) proof p.38; journal version not collated. *Printed:* σ = idL ⊗ σ *Correction:* Supply a σ-compatible action on a sufficiently enlarged L, or a different descent construction. Identity on L does not in general glue to σ on K over K^(σ^n).

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **G1, Journal/preprint collation** (unavailable). The Inventiones version is closed access; locators refer to arXiv v3, the latest version.
- **G2, PBQ finite-étale proof** (resolved). E12 records the circular proof of Lemma 3.31, with a repair through the argument of Proposition 3.14 applied to the finite étale generic extension (item 076).
- **G3, External source closure** (deferred). The cited full-faithfulness, unit-root, local-monodromy and extension results are supplier proofs.
- **G4, Legendre/Kummer and K3 example** (deferred). The Legendre/Kummer example rests on the Shioda–Inose and Stienstra–Beukers computations, cited suppliers.
- **G5, Opposite-filtration proof granularity** (deferred). Declaration-level decomposition of the opposite-filtration argument is design work.
- **G6, Coefficient projectors and normalization** (recorded). E17 and E22 record the coefficient-projector and normalization steps; typing them is design work.
- **G7, Abe–Esnault/Ohkubo version and proof closure** (deferred). Abe–Esnault and Ohkubo are cited suppliers; E20 records the weight convention.
- **G8, Final declaration-granularity and ownership reconciliation** (deferred). Declaration granularity and ownership reconciliation are design work.
- **G9, Independent source-finding verification** (deferred). Independent verification of the findings is the review job's task.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result.

The following was also checked:
- **Items and routes.** Item ids are unique, and every missing item is routed exactly once.
- **Findings.** Every finding has `known` equal to "new".

No Lean deliverable is part of a paper job.

**For the reviewer.**
- Check the reclassifications of E2, E7, E8, E9 and E20.
- Check the repair of Lemma 3.31 (E12).

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or classifies E2, E7, E8, E9 or E20 as affecting a stated result, this continuation supersedes it.

## PAPER-TSUZUKI-23: minimal slopes through PBQ and saturation

Status: **partial checkpoint**. Author: Codex, session codex-a71f92. Issue: #1258. Research snapshot: de3c71d7bb5a14a4b0027cb3a46526691ef626e0. Date: 22 September 2026.

The whole public preprint has been read. This is not a claim that the 2023 journal text has been completely collated, that the dependency graph is closed, or that any mathematics has been formalized. The extraction contains 164 items: 7 exact library matches, 27 planned interfaces and 130 missing items, each missing item routed once. There are 339 internal prerequisite edges. All 55 definitions/constructions have three proposed API statements and three discriminating test contracts: 165 of each. The dependency inventory intentionally exposes nine remaining gates. Twenty-four source observations concern the preprint and await independent verification.

### Source and version boundary

The principal source is [Tsuzuki's public v3](https://arxiv.org/pdf/1910.03871v3), 41 numbered pages, uploaded 19 October 2021 and dated 20 October on its title page. Its SHA-256 is `611090d2e371483ff7996170368255462eeae03e5277c93a2ec406ac47c18457`. All of §§1–7, Appendices A and B and the bibliography were read. PDF pages 16 and 34 were also inspected visually: the PBQ indices, trace-twist factor and integer-weight restriction are genuinely printed, not merely text-extraction artifacts.

The [publisher record](https://doi.org/10.1007/s00222-022-01146-5) identifies Inventiones mathematicae 231 (2023), 39–109. The title, author, abstract and main-result scope match, but that is not a statement-by-statement comparison of the 71-page publication. The ordinary publisher PDF request did not yield a public full-text PDF. The accessible appendix and metadata do not close this gap. The arXiv version note specifically says the proofs of 5.2 and 6.1 changed; a continuation must use v3 or the verified final replacements.

Three supporting sources were fetched with SHA-256 provenance in the JSON. In [Chiarellotto–Tsuzuki 2011](https://doi.org/10.4171/DM/326), the bounded/split equivalence, maximal PBQ construction, filtration and bounded-disc descent statements were checked at pp.46 and 55–59. [Ohkubo's public v1](https://arxiv.org/abs/1809.04065) §12 pp.44–47 was read through the indicated part of Proposition 12.12; the full log-growth proof was not read. [Abe–Esnault's public v1](https://arxiv.org/abs/1607.07112) was checked for coefficient/weight definitions, mixedness and the Lefschetz theorem. Its mixedness theorem is numbered 2.6, whereas Tsuzuki cites published 2.7. These version differences are preserved, not silently equated.

### What the targets actually say

Fix a complete discretely valued mixed-characteristic field K with perfect residue field k and a lift σ of q-power Frobenius. In the local and curve sections the coefficient field is not automatically Frac W(k), k need not be finite, and q can be a positive power of p. For a nonzero slope-filtered object write Top(M)=M/M¹ for its maximal-slope quotient in the decreasing filtration. Duality changes this to the minimal-slope subobject and reverses slopes and arrow directions.

The curve theorem, Corollary 6.5, starts with h:Top(N)→Top(M) between convergent realizations of overconvergent coefficients. If both coefficients are irreducible and h is nonzero, or if both are PBQ and saturated and h is an isomorphism, there is a **unique overconvergent isomorphism inducing that very h**. Remark 6.6 permits the weaker hypothesis of a specified pure quotient with all kernel slopes smaller, using a dense slope-filtered open and restriction full faithfulness.

The higher-dimensional theorem changes hypotheses and conclusion. In §7, k=Fq, K=Frac W(k) and σ=id; coefficients are in Qpbar via a finite-field-of-definition 2-colimit. Theorem 7.20(1) says a nonzero h between maximal-slope quotients of irreducibles implies the original coefficients are isomorphic. It does not on its own identify a lift of the specified h. For compatibility, part (2) additionally asks, after a finite constant-field extension, for a smooth curve preserving irreducibility and inducing a bijection on endomorphisms. Proposition 7.15 and Corollary 7.16 use the equivalent intermediate endomorphism-surjectivity mechanism and yield uniqueness.

Later results mentioned in Remark 1.5 are not used to strengthen Tsuzuki's theorem silently. Nor is a convergent maximal-slope quotient assumed overconvergent.

### The analytic and PBQ chain

There are three different analytic coefficient objects. The Amice field E has bounded Laurent coefficients and a negative tail tending to zero. Its bounded Robba subfield E† has exponential negative-tail decay for some inner radius. The full Robba ring allows unbounded coefficients provided the Laurent series converges on an annulus with outer radius one. The bounded power-series ring is different again from all analytic functions on the open disc. A radius-indexed norm belongs on the full Robba ring; its coefficient supremum can be infinite.

The generalized Ẽ construction is also not simply HahnSeries Q K. It imposes well ordering above each valuation threshold. A family can therefore have a non-well-ordered total support while remaining admissible. Its residue is the ordinary Hahn field k((t^Q)). The coefficient threshold N_a(l), convolution bounds, linear-growth characterization, Hensel estimates and Frobenius-equation overconvergence establish the extended dagger tools. The library supplies Hahn carriers and support combinatorics, but not these mixed-characteristic analytic fields.

The opposite filtration exists after passing to the extended dagger field. Its highest-slope piece descends from the complete extension by a cyclic-vector/Frobenius-equation argument. The key local theorem is carefully asymmetric: N† injects E†-linearly into a pure E-module and spans it over E. The induced map E⊗N†→M is surjective, not necessarily injective. Its maximal-slope quotient has exactly the target's rank. This is the quasi-saturation rank theorem underlying subsequent rigidity.

On a generic disc, solvability means analytic triviality; boundedness means triviality with bounded analytic coefficients. A logarithmic unipotent connection distinguishes them. Frobenius implies solvability; pure slope implies boundedness after the allowed normalization, while Proposition 3.9(2) itself states the unit-root case. Boundedness is equivalent to splitting of the slope filtration. The maximal bounded quotient M/Mᵇ is characterized by the smallest possible kernel, and it commutes with the generic-to-local scalar extensions proved in §3.

PBQ means the nonzero maximal bounded quotient is pure. Nonzero quotients preserve its maximal slope. Direct sums require equal maximal slopes. Tensor detection by a unit-root object requires that object to be nonzero. For the PBQ filtration P_i, always set G_i=P_i/P_(i−1). The strict decreasing sequence is λmax(G_i), and the bounded quotient is the direct sum of Top(G_i). Applying Top to the nested P_i instead repeats the highest slope.

The filtration descends to the bounded-disc lattice and to E† by different external theorems. It globalizes on a curve using lattices at all interior points and boundary points. The gluing theorem uses the unit-root representation correspondence, finite local monodromy, determinant lines and recovery of a rank-r submodule as a wedge-map kernel. These are actual obligations, not consequences of the word “descent”.

### Saturation and global lifting

Saturation here is injectivity of the map from the dagger object into its convergent maximal-slope quotient. It is not the usual saturation of a submodule in an integral lattice. Saturation of an object is the **image quotient** of this map; the natural arrow goes from the original object onto its saturation.

The local rank theorem makes quasi-saturated objects saturated. The local irreducibility criterion adds PBQ and irreducibility of the maximal-slope quotient. Given a bounded-quotient isomorphism, Theorem 4.11 recovers the direct sums of the saturated **graded PBQ pieces**, not their extension classes. The strong local theorem is its one-step specialization.

On varieties, saturation is defined on eligible affine dense opens without assuming a global slope filtration. Proposition 5.2 proves that one such open suffices. The image's overconvergence uses noetherianity, Frobenius flatness and Berthelot's affine realization criterion. The saturation quotient is then extended globally using the precise subobject-extension input.

Proposition 6.1 is the delicate passage back to curves. If a surjection N→M onto a pure convergent object is injective on the specified overconvergent section module, an excess top-quotient rank would produce a nonzero overconvergent kernel. Its boundary dagger kernel need not complete to the entire convergent kernel. The proof first compares their highest-slope ranks, then their maximal PBQ pieces, and only then glues. The extraction keeps this intermediate kernel argument separate.

The extension examples in 6.3 provide useful acceptance cases. Smaller, equal and larger subobject slopes lead to different PBQ/saturation behavior. The splitting conclusion in the larger-slope case has the extra rank-two hypothesis. The Legendre/Kummer example in §3.9 is rank three: its rank-two twisted cohomology object is extended by a rank-one constant Frobenius twist. The K3 calculation and root-of-unity normalization remain explicitly unverified rather than being called a self-extension or a completed example.

### Finite coefficients, weights and Chebotarev

An L-structure is an algebra action L→End_F(M†), not just the instruction to tensor everything with L. The tensor product uses the multiplication component of L₁⊗K L₂; its normalized rank is underlying rank divided by [L:K]. The dual is identified through the field-trace pairing. The 2-colimit to Qpbar must preserve the coefficient projector and finite fields of definition.

Changing the geometric constant field and changing the Frobenius iterate are separate operations. The raw Appendix B induction has n summands and a trace-unit composite n[L:K]. The projected Qpbar functors of §7 have pullback rank unchanged and pushforward rank multiplied by n. An explicit projector comparison is needed before the 1/m averaging in the compatible-lift proof. This checkpoint records the distinction and does not guess that the printed averaging constant is wrong.

Closed-point Frobenius is linearized by the degree-n iterate. Local polynomials have degree the normalized rank. Restriction-of-scalars traces are sums over embeddings only after a splitting extension; a non-Galois L does not make L⊗K L a split product. In the trace formula proof a scalar twist λF changes F^n by λ^n, not λ. The repair uses that nth powers span a characteristic-zero field, together with trace nondegeneracy.

The arbitrary-coefficient purity theorem must allow real weights. On Spec F3, the irreducible line with Frobenius 2 has weight 2 log_3(2), not an integer. Abe–Esnault's finite-determinant normalization and subsequent untwist explain why an integer-only convention cannot cover every coefficient.

The Chebotarev argument in this paper assumes pure Hom coefficient. Equal local fibers on a dense open yield equal relevant local factors; a weight-zero Hom pole at q^(−d), compact-support weight bounds and Poincaré duality give a nonzero global morphism. The Lefschetz step can use different curves for M and N: opposite rank inequalities force equal ranks and fiber isomorphisms. The extra endomorphism condition is then what recovers the particular given h.

### Library audit and unique owners

The pinned Mathlib and Tau Ceti trees were searched, and each claimed library statement was read. The exact library matches are the Witt-vector point carrier, rank-one classification, residue Hahn-series carrier, finite antidiagonals, union, additive sum and positive-support closure. The additive declarations generated by to_additive were checked against their source statements; the closure name is also used explicitly in HahnSeries/Summable.lean.

Mathlib's rank-one classification is not general Dieudonné–Manin, its isocrystal class has no connection or scheme, and its Amice transform is not the Amice field. The Tau Ceti Hahn inverse file is a useful near match, not evidence of overconvergent coefficient theory.

The reviewed coverage file has no entries for the three queried related roadmaps. This absence was recorded; it was not converted into a built or unbuilt verdict. The parent RD document and all its stage descriptions, the VectorBundles document, related catalogue/decomposition/packet screens, and the pending Esnault–Groechenig routes were inspected. The upstream AdicSpaces and LocalFieldsRamification documents supplied the required density models.

| Owner | Contract supplied | Boundary |
|---|---|---|
| RD.0 | Dagger/Amice/Robba rings, threshold series, local flatness and intersections | No new analytic-ring owner in Part II |
| RD.1 | Differential Frobenius modules, slopes, full-faithfulness leaves and bounded/split foundations | PBQ reconstruction is additional |
| RD.2 | The precise local-monodromy input | Do not equate finite unit-root monodromy with arbitrary unipotence |
| RD.3 | Frames, coefficients, gluing, projectors and scoped full faithfulness | No automatic essential surjectivity |
| RD.4–RD.6 | Cohomology, duality, trace and weights | Real weights and support/Frobenius normalization retained |
| VectorBundlesAndIsocrystals:VB0 | General pointwise Dieudonné–Manin | No duplicate classification roadmap |
| Proposed minimal-slope Part II | Bounded quotients, PBQ, saturation, local/global lifting, pure-Hom/Lefschetz argument | Imports all parent foundations |

The pending `PadicDifferentialEquationsPartIIRigidCompanions` from PAPER-ESNAULT-GROECHENIG-20 concerns rigid arithmetic connections and companion bijections. It is not the PBQ/minimal-slope owner. Its generic p-adic Chebotarev need should import the precise pure-Hom result here when hypotheses match; no second general companion-existence theory is proposed. Abe's crystalline-companion paper is already in the queue as PAPER-ABE-18 and must not be added again.

### Source observations and proof gates

All E1–E24 entries include locator, printed fragment, correction or missing step, reach, and correction-search record. None claims a new published error. The most substantive issues are E2 (full Robba Gauss norm), E6 (solvability versus boundedness in a proof), E7–E8 (zero cases), E9 (graded PBQ indices), E12 (finite-étale proof), E18–E20 (splitting field, scalar twist, weight range), E22 (projected trace comparison) and E24 (Frobenius tensor compatibility). The remaining entries record type/index/coordinate misprints and the coefficient-dual pairing gap rather than silently repairing them.

The nine gates are:

- G1 — Journal/preprint collation: The complete public arXiv v3 (41 numbered pages) was read. The journal metadata is Inventiones 231 (2023), 39–109, but its 71-page final text was not fully available for line-by-line collation. Match final theorem numbering, hypotheses, appendix changes and corrections; do not treat preprint findings as verified published errors.

- G2 — PBQ finite-étale proof: Replace Lemma 3.31's circular-looking printed proof with a precise generic solution/scalar-extension argument. Read the finite-étale direct-image construction in [47], then prove the correct pullback and direct-image detection statements.

- G3 — External source closure: Read exact hypotheses and proofs of [15], [31]–[34], [44]–[48], Katz correspondence, finite local monodromy, full faithfulness and extension of subobjects. Parent stages are owners, not proof certificates. Verify de Jong correction history. Split the two input assertions currently collected under denseff.

- G4 — Legendre/Kummer and K3 example: Read Shioda–Inose and Stienstra–Beukers case A, distinguish compactified K3 cohomology from the open surface used in the Leray comparison, calculate the root-of-unity factor and show the selected Ext class is nonzero. The recorded rank-three extension is source-stated, not validated in this checkpoint.

- G5 — Opposite-filtration proof granularity: Split the rank-r reduction of 2.14, generic cyclic-vector integrality, generalized-series Hensel root estimates and the external Hahn algebraic-closure theorem into individual located proof leaves. The source was read but this dependency inventory is not a closed proof graph.

- G6 — Coefficient projectors and normalization: Type the finite coefficient dual pairing, σ-compatible extension in A.1(3), and projected unit/trace diagram in 7.15(2) completely. The raw trace-unit factor is n[L:K]; derive the projected factor n, rather than guessing between n and n². See E17,E22,E24.

- G7 — Abe–Esnault/Ohkubo version and proof closure: The public source passages listed in provenance were read. Collate their published numbering and full supporting proofs, especially Drinfeld/Tannakian finite-set Lefschetz, finite-determinant twisting, and Ohkubo's general log-growth comparison/splitting inputs. AE arXiv v1 labels mixedness 2.6, whereas Tsuzuki cites published 2.7.

- G8 — Final declaration-granularity and ownership reconciliation: Separate remaining multi-part estimate/base-change/tower statements where proofs are not simultaneous; complete omitted foundational leaves (weak completion, Elkik lifting, Noetherian/coherent descent and tensor-category construction). Recheck the latest queue and accepted plans, especially the pending rigid-companions successor, before design.

- G9 — Independent source-finding verification: All observations concern the stated preprint version. None has an independent review verdict. Resolve journal changes and mathematical repair scopes before promoting them as confirmed source errors; the source-issue list distinguishes proof gaps from false statements.

The prerequisite list in the JSON distinguishes inspected public source passages from citations read only in Tsuzuki's bibliography. The latter bibliography links are deliberately not represented as downloaded independent texts. A parent stage's broad scope or a paper already queued does not close a source proof.

### Inventory index

Exact statements, dependencies, API contracts and tests are in the adjacent result JSON. This index makes the coverage and routing auditable without treating every missing item as a new roadmap.

| Item | Name | Status / owner |
|---|---|---|
| 001 | Witt-vector point isocrystal | library / Mathlib |
| 002 | Rank-one Dieudonné–Manin baseline | library / Mathlib |
| 003 | General pointwise slope classification | planned / VB0 |
| 004 | Amice field | planned / RD.0 |
| 005 | Bounded Robba field | planned / RD.0 |
| 006 | Full Robba ring | planned / RD.0 |
| 007 | Bounded disc series | planned / RD.0 |
| 008 | Coefficient-compatible Frobenius lifts | planned / RD.0 |
| 009 | Frobenius module | planned / RD.1 |
| 010 | Differential module | planned / RD.1 |
| 011 | Horizontal Frobenius differential module | planned / RD.1 |
| 012 | Overconvergent and bounded-disc lattices | missing / RD.1 |
| 013 | Exact tensor category of differential Frobenius modules | planned / RD.1 |
| 014 | Local overconvergent full faithfulness | missing / RD.1 |
| 015 | Unit-root Frobenius module | planned / RD.1 |
| 016 | q-normalized rational Frobenius slope | planned / RD.1 |
| 017 | Decreasing slope filtration and top quotient | planned / RD.1 |
| 018 | Slope filtration is horizontal | missing / RD.1 |
| 019 | Residue Hahn series | library / Mathlib |
| 020 | Valuationwise generalized Amice series | missing / RD.0 |
| 021 | Finite antidiagonals of well-ordered supports | library / Mathlib |
| 022 | Coefficient threshold function | missing / RD.0 |
| 023 | Threshold estimates | missing / RD.0 |
| 024 | Linear threshold criterion for overconvergence | missing / RD.0 |
| 025 | Uniform negative-support bound on powers | missing / RD.0 |
| 026 | Extended complete discrete valuation field | missing / RD.0 |
| 027 | Henselian extended bounded Robba field | missing / RD.0 |
| 028 | Intersection and linear disjointness | missing / RD.0 |
| 029 | Frobenius-fixed extended coefficients | missing / RD.0 |
| 030 | Integral Frobenius equations force overconvergence | missing / RD.1 |
| 031 | Unit-root trivialization over Ẽ | missing / RD.1 |
| 032 | Unit-root trivialization over Ẽ† | missing / RD.1 |
| 033 | Opposite filtration over the extended dagger field | missing / RD.1 |
| 034 | Descent of the highest extended slope piece | missing / RD.1 |
| 035 | Quasi-saturated local rank equality | missing / proposed Part II |
| 036 | Rank-one extended target detects highest slope | missing / RD.1 |
| 037 | Overconvergent F-isocrystal on a smooth variety | planned / RD.3 |
| 038 | Weak completions and partial overconvergence | planned / RD.0 |
| 039 | Generic and closed-point localizations | missing / RD.0 |
| 040 | Flat maps in the one-boundary-point square | missing / RD.0 |
| 041 | Local and global intersection descriptions | missing / RD.0 |
| 042 | Affine and generic evaluation of coefficients | planned / RD.3 |
| 043 | Generic slope filtration and local scalar extension | missing / RD.1 |
| 044 | Taylor map to the generic disc | missing / RD.1 |
| 045 | Solvable and bounded generic-disc modules | planned / RD.1 |
| 046 | Coordinate independence of solvability and boundedness | missing / RD.1 |
| 047 | Closure under abelian tensor operations | missing / RD.1 |
| 048 | Detection of generic solution conditions after local extension | missing / RD.1 |
| 049 | Frobenius supplies solvability | missing / RD.1 |
| 050 | Unit-root Frobenius supplies boundedness | missing / RD.1 |
| 051 | Boundedness equivalent to slope splitting | missing / RD.1 |
| 052 | Descent intersection after perfected generic extension | missing / RD.0 |
| 053 | Maximally bounded quotient | missing / proposed Part II |
| 054 | Generic solution and bounded solution spaces | missing / proposed Part II |
| 055 | Solutions and bounded solutions commute with generic-local extension | missing / proposed Part II |
| 056 | Bounded kernel commutes with local extension | missing / proposed Part II |
| 057 | Pure of bounded quotient | missing / proposed Part II |
| 058 | Same-slope PBQ direct sums | missing / proposed Part II |
| 059 | Nonzero quotients preserve PBQ and maximal slope | missing / proposed Part II |
| 060 | PBQ detected by nonzero unit-root tensoring | missing / proposed Part II |
| 061 | Generic PBQ filtration | missing / proposed Part II |
| 062 | Bounded quotient from graded PBQ top quotients | missing / proposed Part II |
| 063 | Generic PBQ filtration commutes with local extension | missing / proposed Part II |
| 064 | PBQ over bounded-disc and dagger rings | missing / proposed Part II |
| 065 | PBQ filtration descends to a bounded-disc lattice | missing / proposed Part II |
| 066 | PBQ filtration descends to a bounded Robba lattice | missing / proposed Part II |
| 067 | Logarithmic-growth solution filtration | missing / proposed Part II |
| 068 | PBQ log-growth and Frobenius comparison | missing / proposed Part II |
| 069 | Bounded solutions of a PBQ disc module | missing / proposed Part II |
| 070 | PBQ overconvergent coefficient on a curve | missing / proposed Part II |
| 071 | Global PBQ filtration on a curve | missing / proposed Part II |
| 072 | Irreducible curve coefficients are PBQ | missing / proposed Part II |
| 073 | Global bounded quotient when slopes exist | missing / proposed Part II |
| 074 | Same-slope direct sum for curve PBQ objects | missing / proposed Part II |
| 075 | Nonzero curve quotients preserve PBQ slope | missing / proposed Part II |
| 076 | PBQ and finite étale curve maps | missing / proposed Part II |
| 077 | Globalizing unit-root local lattices | missing / RD.3 |
| 078 | Globalizing subobjects by interior and boundary lattices | missing / RD.3 |
| 079 | Kummer-twisted Legendre PBQ example | missing / proposed Part II |
| 080 | Local saturation by the maximal-slope quotient | missing / proposed Part II |
| 081 | Quasi-saturated embedding | missing / proposed Part II |
| 082 | Image in a pure target is a dagger differential Frobenius module | missing / proposed Part II |
| 083 | Injection into a pure target identifies maximal slope | missing / proposed Part II |
| 084 | Image rank bound and equality criterion | missing / proposed Part II |
| 085 | Local saturation quotient | missing / proposed Part II |
| 086 | Quasi-saturated implies saturated | missing / proposed Part II |
| 087 | Local irreducibility criterion | missing / proposed Part II |
| 088 | Local recovery of saturated graded PBQ pieces | missing / proposed Part II |
| 089 | Strong local maximal-slope lifting | missing / proposed Part II |
| 090 | Saturation of a variety coefficient | missing / proposed Part II |
| 091 | Saturation can be checked on one affine dense open | missing / proposed Part II |
| 092 | Overconvergent image of the top-quotient section map | missing / RD.3 |
| 093 | Dense restriction preserves and detects saturation | missing / proposed Part II |
| 094 | Irreducible overconvergent variety coefficients are saturated | missing / proposed Part II |
| 095 | Saturation under finite étale pullback | missing / proposed Part II |
| 096 | Saturation under finite coefficient extension and Frobenius iteration | missing / proposed Part II |
| 097 | Canonical saturation quotient on a variety | missing / proposed Part II |
| 098 | Dense restriction and extension of overconvergent subobjects | missing / RD.3 |
| 099 | Overconvergent-to-convergent full faithfulness | planned / RD.3 |
| 100 | Curve quasi-saturation rank equality | missing / proposed Part II |
| 101 | Boundary kernel's maximal PBQ piece descends | missing / proposed Part II |
| 102 | Curve irreducibility criterion | missing / proposed Part II |
| 103 | Extensions with smaller subobject slope | missing / proposed Part II |
| 104 | Equal-slope extensions | missing / proposed Part II |
| 105 | Extensions with larger subobject slope | missing / proposed Part II |
| 106 | Global recovery of saturated graded PBQ pieces | missing / proposed Part II |
| 107 | Strong maximal-slope lifting on curves | missing / proposed Part II |
| 108 | Weaker maximal-quotient hypothesis suffices | missing / proposed Part II |
| 109 | Dual minimal-slope formulation | missing / proposed Part II |
| 110 | Lefschetz condition through a closed point | missing / proposed Part II |
| 111 | Curve lift when the target stays irreducible | missing / proposed Part II |
| 112 | Curve lift when the source stays irreducible | missing / proposed Part II |
| 113 | Closed fibers identified by two Lefschetz curves | missing / proposed Part II |
| 114 | Unit-root source gives a compatible global surjection | missing / proposed Part II |
| 115 | Finite coefficient-field structure | missing / RD.3 |
| 116 | Tensor product with coefficient projector | missing / RD.3 |
| 117 | Dual with finite coefficient structure | missing / RD.3 |
| 118 | Coefficient extension functor | missing / RD.3 |
| 119 | Algebraically closed p-adic coefficients | missing / RD.3 |
| 120 | Underlying coefficient of an absolutely irreducible object is isotypic | missing / RD.3 |
| 121 | Changing the finite base field's Frobenius convention | missing / RD.3 |
| 122 | Finite constant-field pullback and pushforward | missing / RD.3 |
| 123 | Rigid cohomology with finite-field coefficient action | planned / RD.4 |
| 124 | Cohomological base change with coefficient projector | missing / RD.4 |
| 125 | Linearized closed-point Frobenius | missing / RD.3 |
| 126 | Fiber trace under rational-point and coefficient changes | missing / RD.6 |
| 127 | Rigid Lefschetz trace formula over coefficient fields | planned / RD.6 |
| 128 | Coefficient L-function | planned / RD.6 |
| 129 | Cohomological determinant formula | planned / RD.6 |
| 130 | Iota purity and mixedness | missing / RD.6 |
| 131 | Finiteness of rigid cohomology with Frobenius coefficients | planned / RD.5 |
| 132 | Compact-support Poincaré duality | planned / RD.5 |
| 133 | Compact-support weight bounds | planned / RD.6 |
| 134 | Pure-Hom Chebotarev identification | missing / proposed Part II |
| 135 | Prescribed morphism from endomorphism-surjectivity | missing / proposed Part II |
| 136 | Lefschetz condition with Qpbar coefficients | missing / proposed Part II |
| 137 | Lefschetz fibers imply global isomorphism | missing / proposed Part II |
| 138 | Faithfulness of restriction of endomorphisms | missing / RD.3 |
| 139 | Curve endomorphism preservation controls the top quotient | missing / proposed Part II |
| 140 | Abe–Esnault mixedness and irreducible purity | missing / RD.6 |
| 141 | Abe–Esnault irreducibility-preserving curves | missing / proposed Part II |
| 142 | Higher-dimensional minimal-slope isomorphism | missing / proposed Part II |
| 143 | Compatible higher-dimensional lift under curve endomorphism condition | missing / proposed Part II |
| 144 | Finite fixed coefficient field | missing / RD.0 |
| 145 | Unramified extension aligning fixed coefficients | missing / RD.0 |
| 146 | Enlarging Frobenius coefficients to contain a finite p-adic field | missing / RD.0 |
| 147 | Tubes and strict neighborhoods | planned / RD.3 |
| 148 | Frobenius lift extends to strict neighborhoods | missing / RD.3 |
| 149 | Affine realization equivalence with Frobenius | planned / RD.3 |
| 150 | Raw coefficient extension and Frobenius iteration | missing / RD.3 |
| 151 | Cyclic induction with restriction of scalars | missing / RD.3 |
| 152 | Adjunction unit and Frobenius trace | missing / RD.3 |
| 153 | Trace-unit degree and tower laws | missing / RD.3 |
| 154 | Pure slope boundedness after normalization | missing / RD.1 |
| 155 | Union of well-ordered supports | library / Mathlib |
| 156 | Sum of well-ordered supports | library / Mathlib |
| 157 | Positive support has well-ordered additive closure | library / Mathlib |
| 158 | Algebraic closure of the divisible residue Hahn field | missing / RD.0 |
| 159 | Cyclic vector for the relevant Frobenius difference module | missing / RD.1 |
| 160 | Unit-root generic coefficient and p-adic representation | missing / RD.3 |
| 161 | Unit-root dagger lattice implies finite local monodromy | missing / RD.2 |
| 162 | Overconvergent unit-root coefficients from finite boundary monodromy | missing / RD.3 |
| 163 | Full faithfulness from bounded-disc lattices | missing / RD.1 |
| 164 | Slope filtrations on a dense open | missing / RD.3 |

### Verification

The paper checker and intake file check passed (three files, zero problems). The checker unit tests passed 9/9 and source-issue tests 7/7. The scratch structural audit passed, as did 1,718 exact-arithmetic assertions; results are recorded in the handoff and JSON. The structural audit checks unique routes for every missing item, graph acyclicity and all definition API/test counts. Exact arithmetic tests target the PBQ counterexample, q-slope normalization, cyclic trace degree, field-trace pairing and nth-power spanning repair. These are diagnostic checks of finite examples and extraction structure, not proofs of the paper's theorems.

No suggested Lean file is authorized by this paper issue; none was written or compiled.
