# PAPER-XIE-YUAN-22: Geometric Bogomolov conjecture in arbitrary characteristics

Junyi Xie and Xinyi Yuan, *Geometric Bogomolov conjecture in arbitrary characteristics*, Invent. Math. 229 (2022), 607–637 ([publication](https://doi.org/10.1007/s00222-022-01112-1), [inspected arXiv v1](https://arxiv.org/pdf/2108.09722v1)).

Extraction by Claude Code `cc-39fac3`, 29 September 2026; original independent review by Claude Code `cc-fb70e5`. Fixes by Codex `codex-J6LwjP`, 30 September 2026, issue #4997. **Complete extraction and routing**, with source-version and blueprint proof obligations stated below; nothing is claimed formalized.

The [result](PAPER-XIE-YUAN-22.result.json) contains **76 items: 4 library, 11 planned, 61 missing; five routes; 11 prerequisite entries; 19 source issues**. Every missing item has exactly one route. The [fixes report](../redteam/RT-PAPER-XIE-YUAN-22.fixes.md) covers all ten verifier-confirmed findings, including four absent from the generated issue summary.

## Reading and version scope

The original extractor read all 29 pages of arXiv:2108.09722v1. This fix reread pp.1–3, 7, 9–11 and 13–27, with page images at pp.13,16,17,25. The file hash is `2587e70314bddb8f2ed01768f64b4a96b5da0f32d0d5382b4336b2415211c2ab`. These are focused fix checks, not another complete reading.

The Inventiones text remains uncollated. The publisher page serves subscription metadata; its PDF endpoint returned a 17-page PDF rendering of that webpage, not the 31-page article. The arXiv history still lists only v1. The publisher correction listing, title/correction searches and a YMSC lecture listing yielded no corrected primary text. **E1–E19 are about v1 only**; none asserts that the corresponding sentence survives in print. `versionChecks` records the failed acquisition separately from actual `sourceVersions` readings.

Fresh supporting readings were Gubler's [2007 author manuscript](https://gubler.app.uni-regensburg.de/Publikationen/arXiv2bc.pdf), pp.5–8, and [2003 paper](https://www.numdam.org/item/ASNSP_2003_5_2_4_711_0.pdf), pp.751,755–758, for the height conventions; and [Scanlon v1](https://arxiv.org/pdf/math/0303340v1), pp.1–2 and bibliography, for Definition 2.1/Theorem 2.2. Their hashes and exact reading scopes are in `supportingSourceReads`. No full proof reading of these inputs is claimed by this fix.

## The theorem and corrected proof route

Let k be algebraically closed of any characteristic, K/k finitely generated of positive transcendence degree, A/K an abelian variety and X⊆A_{K̄} a closed subvariety. Theorem 1.1 says that dense small points force X to be special: X=tr(Y⊗K̄)+T, with Y defined over the constant field in the geometric trace and T a torsion translate of an abelian subvariety.

1. **Lower transcendence degree.** Two distinct pencils produce relatively algebraically closed subfields k_i⊂K of transcendence degree one. Normalize each geometric generic member H_{k̄_i}; the pulled-back ample bundle is a genuine polarization and gives the same intersection height (E19). Lemma 3.7 transfers small points. Fields of definition are handled by the full Proposition 3.2 with E18's defect induction, Corollary 3.5, and Proposition 3.6 with E1 and E17. A shorter argument for Proposition 3.1 needs only the independent fields acl(k_i) and Lemma 3.4; its full steps are in the item note.
2. **Reduce to good reduction and trivial geometric trace over a curve.** Yamaki's theorem and semistable reduction supply this setting. Finite extensions of K and extensions of algebraically closed constants use the height/trace comparison inputs, not an unspecified change of height convention.
3. **Compute torsion multi-section classes.** Lemma 4.1 uses the relative cube theorem/seesaw, ampleness after twisting from the base and finite pullback of ample bundles. Proposition 4.2 uses the generic degree |m|^(2g), including inseparable degree. The symmetric rigidified good-reduction height is the canonical height because a bundle trivial on the generic fibre comes from the base.
4. **Use the summation map.** For dim X>0, the iterated sum X_r is a torsion subvariety; after translation write A′=X_r and Y=X_{r−1}×X. Put B=(sum)⁻¹(A′). The corrected integral models are 𝒜′_N and ℬ_N=𝒜×_S𝒜′_N, with (x,t)↦(x,t−x) identifying its generic fibre with B. Thus h is a flat projection. Take the closure of Y in ℬ_N. The embedded closures in 𝒜 and 𝒜×𝒜 are not assumed smooth in characteristic p (E16). Proposition 2.1, the torsion class and nefness force height zero for the components above prime-to-p torsion away from the jump locus.
5. **Induct on dimension.** Height zero gives dense small points by Gubler's converse (E3). Induction makes the components torsion; prime-to-p torsion is dense in A′ off the jump locus, and each torsion component contains dense all-torsion points. Manin–Mumford for all torsion and trivial trace, including its positive-characteristic input, completes the proof. Translated torsion components can have a p-primary translation; the argument does not require prime-to-p density in every translated coset.

## Library and ownership audit

The pins remain Mathlib `082e2d3` and Tau Ceti `f790474`. The reviewed coverage audits AUDIT-01 and AUDIT-08 were checked for the affected layers. The fix also searched the declaration index and source trees and read the actual multiplication/isogeny definitions and elliptic canonical-height statement. The four original library items remain abelian varieties/products/base change, multiplication, isogenies and transcendence degree. Existing elliptic canonical heights do not supply general abelian function-field heights; existing Rees algebras/relative normalization do not supply the geometric pencil and height comparison theorem.

The eleven planned items are the original nine plus **multiplication-degree at A3** and **relative-to-absolute-ample at R09.1**. The good-reduction-model item is now just the R11.1 model/mapping-property theorem. The derived good-reduction theorem for subvarieties and quotients is missing and shared with GH19/80 at R11.5. This split prevents a dependency from R11.1 on its own downstream criterion.

## Routes and shared inputs

| Route | Owner | Items | Responsibility |
|---|---|---:|---|
| 1 | HeightsRationalPointsAndObstructions RP.0/RP.1/RP.5 | 12 | Geometric heights and their laws, model/M_K comparison, trace, quotients and positive-characteristic Manin–Mumford. Share GH19/5–6 and the height foundation used by GH19/72. |
| 2 | SchemeAndStackFoundations SF.0/SF.4/SF.5 | 14 | Morphisms, generic-fibre trivial line bundles (DGH21/29), finite pullback of ampleness, arbitrary-characteristic pencil blow-ups and the non-proper intersection argument. SF.5's planned Tor/product comparison and Cartier associativity are explicit. |
| 3 | AbelianSchemesAndArithmeticModuli A1/A2/A3 | 8 | Lemma 4.1, rigidification, seesaw from proper-flat cohomology/base change, projectivity over a regular curve (DGH21/26), and prime-to-p torsion density. Multiplication degree is already planned. |
| 4 | HeightsRationalPointsAndObstructionsPartII | 26 | The full geometric Bogomolov theorem and its paper-specific proof, coalesced with GH19, DGH21, Gao–Ge–Kühne and Yuan. |
| 5 | NeronModelsAndSemistableAbelianVarieties R11.5 | 1 | Good reduction of subvarieties and quotients, shared with GH19/80; R11.1 supplies models. GH19/81's characteristic-zero exactness is excluded from this input. |

Route 5 is new and **awaits independent route acceptance**; the historical paper review accepts only routes 1–4. This job does not edit that review or the generated queue. The fixes review should check the additions to routes 1–4 as well as the new route.

The height conventions are part of the interface. Gubler's mixed subvariety height H is multilinear; Xie–Yuan use H/((dim X+1)deg_L X), which is not multilinear in L. For a finite map onto a same-dimensional image, the degree factor cancels in the normalized height. On a curve cover S′→S of degree d, recomputing the relative geometric height gives ĥ_{S′}=dĥ_S, whereas enlarging a point's field of definition in a fixed normalized M_K height changes nothing. Extending algebraically closed constants preserves the intersection height. These statements carry explicit model, polarization and field hypotheses in the new items.

Prime-to-p torsion density stays in A3 without importing later quotient theory. Let H be its reduced closure, C=H⁰ and N the finite component-group order. For n>1 prime to pN, A[n](k) lies in C(k). The already planned cardinality n^(2dim A)≤n^(2dim C) forces C=A. The quotient proof would instead need divisibility and quotient/Poincaré inputs, which are later in the atlas; it is documented as an alternative, not introduced as a backwards dependency.

The A6 packet's Poincaré reducibility proof records an imperfect-field gap, relevant to k(S) in characteristic p. The R11.5 supplier must close that gap if it uses a complement, or use its prime-to-p Tate-module/Néron–Ogg–Shafarevich proof directly. Extraction completeness does not certify that supplier proof.

## Source issues

Original E1–E15 and their independent verdicts are retained. The following historical table is unchanged; all locators refer to v1.

| id | kind | where | finding |
|----|------|-------|---------|
| E1 | error | Proposition 3.6, proof, first case | The claim "X is special for k′ iff k_A ⊆ k′" is false in the direction ⇐. Counterexample: K the algebraic closure of k(s, t), A = E ⊗ K with E: y² = x(x−1)(x−s) over k′ the algebraic closure of k(s), and X = {P} with x(P) = t. Here k_A = k′ but X is not special over k′. The proposition still holds: run the second case over k_A, with k_{A,X} the field of definition of Φ(X) (Corollary 3.5(ii) for K/k_A). |
| E2 | gap | Proposition 5.4 | Stated for every torsion t, but the proof uses only torsion multi-sections of order prime to char k (smoothness of 𝒯 is needed for Proposition 2.1). §5.3 needs only those, which are dense. |
| E3 | gap | §5.3 | The induction applies Theorem 1.1 to components of *height 0*, but its hypothesis is *dense small points*. The missing converse of Lemma 5.2 is Gubler 2007, Cor. 4.4. |
| E4 | error | Lemma 5.3 | False for dim X = 0: for a torsion point no r has dim X_{r−1} < dim X_r. It needs dim X ≥ 1, the only case §5.3 uses. |
| E5 | gap | Lemma 3.7 / Proposition 3.1 | "Infinitely many k′" and k₁ ≠ k₂ are not argued. Two pencils ⟨s₀, s₁⟩, ⟨s₀, s₂⟩ with s₁/s₀, s₂/s₀ algebraically independent give them. |
| E6 | misprint | Proposition 2.4, proof | The last display ends H₁⋯H_{r−1}·V·H_r, which should be ·X·; two index slips. |
| E7 | misprint | Proposition 2.1, proof | O_B(f*H_i) should be O_B(g*H_i). |
| E8 | misprint | Corollary 3.5, proof | k′ ∩ k_A ⊆ I should be ∈ I. |
| E9 | misprint | Lemma 3.7, proof | π₁ : S × P¹ → P¹ should be → S. |
| E10 | misprint | Proposition 3.1, proof | "Then X is special for A/K/k_i" should be "is not special". |
| E11 | misprint | Proposition 4.2, proof | The symmetric/anti-symmetric decomposition is of ℳ, not ℒ. |
| E12 | misprint | Lemma 5.3, proof | p₂ : B × C → B should be → C. |
| E13 | misprint | Proposition 5.4, proof | The factor a appears twice in the displayed chain. |
| E14 | misprint | Proposition 5.4, proof | "This forces [𝒵_i]·[ℒ_ℬ]^{e+1}" is missing "= 0". |
| E15 | misprint | §1.1 | The integral model is written (𝒜, m, ℒ) instead of (𝒜, π, ℒ). |


| New id | Kind | Passage | Repair |
|---|---|---|---|
| E16 | error | Proposition 5.4, pp.25–26 | Generic abelian subvarieties need not have abelian-scheme closures in characteristic p, even in the trivial-trace setting. Use Néron models and the flat product projection. |
| E17 | error | Proposition 3.6, first paragraph, p.16 | Intersecting algebraically closed subfields with K is not injective and does not preserve specialness as asserted. Use the stable algebraic closure of the compositum of all Galois conjugates, with a minimal-polynomial argument. |
| E18 | gap | Proposition 3.2, pp.13–14; Corollary 3.5(i), p.15 | The flat quasi-finite model requires algebraic independence. The verifier's defect induction proves the dependent case and preserves the full statements. |
| E19 | gap | Lemma 3.7 / Proposition 3.1, pp.17–18 | Normalize the geometric generic member after constant extension; projection and field-extension formulas identify the height with that of a genuine polarization. |

E16–E19 have no source-issue verdict in this file. They originate in the completed red-team verification, whose argument is credited, but their independent verdicts must be recorded by the review of this fix. The endpoint theorem survives with the corrected proofs. The result JSON contains the full arguments and version-search record.

## Remaining blueprint and collation work

The fixes report gives precise handoffs to BP-HeightsRationalPointsAndObstructions, BP-AbelianSchemesAndArithmeticModuli, BP-NeronModelsAndSemistableAbelianVarieties, BP-SchemeAndStackFoundations and the existing Part II design. Their packets are not assigned deliverables here. Complete supplier proofs, APIs, tests and generality checks belong to those jobs. In particular the arbitrary-characteristic Rees-algebra construction cannot be discharged by R09.7's characteristic-zero resolution scope; LPV.3 must agree in the smooth-axis special case.

The `published-version` collation gap remains open for all E1–E19. This fix neither marks the published text read nor changes the historic independent review. No Lean file was requested or compiled; no build at the pinned commits was available, and no build/cache was created.
