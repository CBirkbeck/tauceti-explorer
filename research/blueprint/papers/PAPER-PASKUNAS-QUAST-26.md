# PAPER-PASKUNAS-QUAST-26: On local Galois deformation rings: generalised reductive groups

Vytautas Paškūnas and Julian Quast, *On local Galois deformation rings: generalised reductive groups*, [Forum of Mathematics, Pi 14 (2026), e15](https://doi.org/10.1017/fmp.2026.10030); arXiv [2404.14622](https://arxiv.org/abs/2404.14622).

Extraction by Claude Code, session `cc-39fac3`, 23 September 2026 (issue #1344). Status: **complete**. Every missing item is routed once.

Confirmed red-team fixes by Codex, session `codex-J6LwjP`, 2 October 2026 (issue #5517). The earlier review below describes the original extraction; these changes await an independent fix review.

The machine-readable extraction is [PAPER-PASKUNAS-QUAST-26.result.json](PAPER-PASKUNAS-QUAST-26.result.json). It has:
- 85 items: 2 library, 3 planned, 80 missing;
- 6 routes: five sources of existing layers and one coalesced Part II;
- 15 prerequisite entries;
- 11 recorded source issues: nine errors and two misprints. E11 concerns the 2025 prerequisite.

## Sources read

- **Original reading:** the published 96-page version was read in full by the extraction worker; arXiv v2 was compared for E1–E2. The original review's source/hash notes are preserved below.
- **Fix reading:** targeted published passages and page images were checked for the corrections, with §11, §15.6 and Appendix A.1 compared against [arXiv v2](https://arxiv.org/pdf/2404.14622v2). The fix did not repeat a whole-paper reading. Its published download has SHA-256 `244ab225…`; the stable v2 PDF has `eaa8fba9…`. Full hashes, URLs, dates and reading scope are in `sourceVersions`.
- **Prerequisite passages read for the fix:** the [2025 generalised-tori paper](https://doi.org/10.1017/fms.2024.137), introduction and pp. 26–34; [Birkbeck 2020](https://jtnb.centre-mersenne.org/item/10.5802/jtnb.1114.pdf), pp. 133–134, 136; [Conrad, Reductive group schemes](https://math.stanford.edu/~conrad/papers/luminysga3.pdf), the locators below. Other prerequisite proofs remain stated inputs.
- **Correction search, 2 October 2026:** the arXiv histories still end at v2 for both papers; Crossref records contain no update fields or related correction; Quast's public publication listings and title-specific searches yielded no relevant correction. Cambridge's article HTML notice pages failed in the browser tool, so this fix makes no claim to have inspected their corrections tabs. The PDFs were accessible. This is a bounded search, not an author corrigendum.

## What the paper proves

**The setting.** Let F/ℚ_p be finite. Let G be a generalised reductive group scheme over O: smooth and affine, with reductive G^0 and finite G/G^0, and no condition on p. Let ρ̄ : Γ_F → G(k) be continuous.

**Theorem 1.1.** R^□_ρ̄ is a local complete intersection, O-flat of relative dimension dim G_k([F:ℚ_p] + 1), and reduced with normal generic fibre. So every ρ̄ lifts to characteristic zero, and the derived deformation ring is homotopy discrete.

**Theorem 1.2 (the Böckle–Juschka conjecture).**
- R^□_ψ → R^□_ρ̄ is flat, where ψ is the projection of ρ̄ to G/G′.
- If π_1(G′) is étale, this map is a bijection on irreducible components.
- The components are labelled by characters of μ = (μ_{p^∞}(E) ⊗ M)^{Gal(E/F)}.

**Theorem 1.3 and Corollary 1.4.** When π_1(G′) is étale:
- the components are complete-intersection normal domains, regular in codimension [F:ℚ_p];
- they are factorial when [F:ℚ_p] ≥ 3.

**Further results.**
- Everything holds with a "fixed partial determinant", which covers L-groups and C-groups (§16).
- R^ps_G, for V. Lafforgue's G-pseudocharacters, is equidimensional of dimension dim G_k[F:ℚ_p] + dim Z(G)_k + 1 (Theorem 1.5).
- Its non-special absolutely irreducible locus is dense (Theorem 1.6).

**The method.** It generalises the GL_d case of Böckle–Iyengar–Paškūnas.
1. **Generic matrices.** A space of generic matrices X^gen_{G,ρ̄^ss} is built inside Gᴺ × X^ps_{GL_d}. Continuity is expressed algebraically or through condensed sets, which makes the space independent of the embedding G ↪ GL_d (§§4–5, 8).
2. **GIT.** The GIT quotient X^git is a finite universal homeomorphism onto Spec R^ps_G (§7). Closed orbits correspond to G-completely reducible representations (Richardson, Bate–Martin–Röhrle; §6).
3. **Induction on dim G.** The special fibre is bounded by induction on dim G (§13), using:
   - the fibre bound through the spaces X^gen_{P,ρ} and the "defect" (§12);
   - W-special loci, where H⁰(Γ_F, W(1)) ≠ 0 (§13.2);
   - two group-theoretic facts (§10): a reductive subgroup not containing G′ has codimension ≥ 2, and (Lie G′_sc)^* has no G′-invariants;
   - Cotner's finiteness theorem for character varieties (§6);
   - a reduction to π_1(G′) étale (Proposition 2.30).
4. **Components and normality.** Components and normality follow from Serre's criterion (§§14–15), using the analysis of R-Levis of codimension 2 (§11).

## What the atlas already has

**The pending Part II.** The Böckle–Iyengar–Paškūnas extraction proposed `LocalGaloisDeformationRingsPartIIComponentsAndNormality` for exactly this theory in the GL_d case. Its brief lists this paper as the consumer that "should extend this Part II".

**Planned or library (5 items).**
- The complete-intersection criterion, Lemma 3.9 (DeformationAndDerivedPatchingAlgebra R03.3).
- Determinant laws and the Cayley–Hamilton quotient (IntegralHeckeAndGaloisDeterminants IHG.0–IHG.1).
- L-groups (ReductiveGroupsPartII RG2.5).
- Condensed sets: Mathlib's `CondensedSet`, `Condensed.discrete` and `CondensedSet.isDiscrete_tfae`.
- Dynamic subgroup carriers and functors: new library item /85 reuses `TauCeti.Cocharacter.parabolic`, `levi`, `unipotent`, `limit`, their pointwise laws and `parabolicFunctor`, `leviFunctor`, `unipotentFunctor` with natural inclusions. The actual statements at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` require a commutative Hopf algebra; the functor packaging requires commutative rings. They have no connectedness hypothesis.

The pinned Mathlib commit is `082e2d37e8b0463410cdb532e111cd43d5a66174`. The reviewed R03.1/R03.3 and VS2 audits were checked. Regular sequences and condensed foundations do not supply the missing complete-intersection, excellence or dynamic scheme theorems. Item /10 still plans the natural scheme identification, representability, smoothness, geometric unipotence, and R-Levi/component assertions. It imports /85's carriers rather than rebuilding them. Upstream roadmaps are unchanged.

**Planned suppliers, cited in notes.**
- Framed GL_2 rings (LocalGaloisDeformationRings R08.1).
- Local duality (Tau Ceti ClassFieldTheory Layer 5, ArithmeticGaloisDuality D7) and the Artin map (Layer 7).
- Reductive groups and the dynamic method (Tau Ceti ReductiveGroups Layers 7–8).
- Invariant theory for parameter stacks (LanglandsParameterStacks LP2–LP3, Fargues–Scholze setting only).

**Not planned anywhere.**
- Non-connected generalised reductive group scheme theory, the scheme-level R-parabolic results beyond /85, and G-complete reducibility.
- Cotner's finiteness theorem.
- The codimension results of §§10–11.
- The local Langlands correspondence for tori.
- C-groups.

## Routes

1. **Coalesced with `LocalGaloisDeformationRingsPartIIComponentsAndNormality`** (65 missing). This is the pending Part II of LocalGaloisDeformationRings from Böckle–Iyengar–Paškūnas; its id, title, parent, area and brief are kept.
   - **What it gains**, as layers following the GL_d ones:
     - generalised reductive groups: the scheme-level R-parabolic results using /85, G-semisimplification, Proposition 2.30;
     - continuity (§4);
     - the G-valued generic matrices, GIT and pseudocharacter comparison (§§5–9);
     - the group theory of §§10–11;
     - the fibre bounds and the induction (§§12–13);
     - the special locus (§14);
     - components and normality with fixed partial determinant (§15), using the corrected finite-map and formal torus interfaces below;
     - L-groups and C-groups (§16).
   - **Stated inputs:** the generalised-tori paper and Cotner's, Martin's, Richardson's and Seshadri's results.
2. **Source of LocalGaloisDeformationRings [R08.1]** (5 missing): G-valued framed functors over the coefficient rings Λ, representability with continuous sections, the presentation relative to φ : G → H, coefficient extension and completions, and central quotients.
3. **Source of DeformationAndDerivedPatchingAlgebra [R03.1, R03.3]** (3 missing, 1 planned).
   - **Missing:** Lemma 5.15, Lemma 14.2, and Serre's criterion with excellence, local complete-intersection factoriality and miracle flatness. A nonlocal ring or scheme receives local factoriality; global UFD requires additional input.
   - **Planned:** Lemma 3.9.
4. **Source of IntegralHeckeAndGaloisDeterminants [IHG.0, IHG.1]** (5 missing).
   - Wang-Erickson's finiteness of E^u.
   - Lafforgue's G-pseudocharacters over O for non-connected G.
   - Quast's deformation theory.
   - Emerson–Morel's comparison.
   - Pseudocharacters of products.
   - This joins the routes of the Böckle–Iyengar–Paškūnas and Böckle–Harris–Khare–Thorne extractions.
5. **Source of ArithmeticGaloisDuality [D7]** (1 missing): local Tate duality and the Euler–Poincaré formula with finite, p-adic or characteristic-p local-field coefficients.
6. **Source of VStackSheavesAndLisseCategories [VS2]** (1 missing): the quasi-compact/quasi-separated condensed-set lemmas of Appendix A, and /84's affine representable condensed-points construction used by /26. No arbitrary-accessible-presheaf API is exported.

No new roadmap is proposed.

## Source issues (`sourceIssues` E1–E11)

- **E1 (error; affects a stated result, not the main theorems).** Proposition 11.5, pp. 55–56, is stated for an algebraically closed κ of any characteristic.
  - **Where the proof fails:** it uses "if ψ = ω^{±1} then ψ^{p−1} = 1", which holds only in characteristic p.
  - **Counterexample in characteristic 0:**
    - take G = PGL_2, P = B_2, κ = ℚ̄_p;
    - take a non-split ρ̃ = (1 b; 0 χ_cyc), so that ψ = ω^{−1};
    - hypotheses (1)–(3) hold;
    - but the line ē_{12} of (Lie SL_2)^*(1) is Γ_F-invariant, so h⁰ ≥ 1.
  - **Why the paper is unaffected:** the only use, Proposition 14.5, is on the special fibre, and Theorem 14.6 reduces all fibres to the special fibre.
  - **Correction:** add char κ = p to Proposition 11.5.
  - **arXiv:** v2 has the same text.
- **E2 (misprint), Lemma 5.5, p. 31.** "A ∈ R^ps_G-alg" should be R^ps_{GL_d}-alg. X^gen_{GL_d} lives over R^ps_{GL_d}, and R^ps_G is introduced only in §7.

The original E1–E2 objects, including their independent verdicts, are unchanged. E3–E11 carry the verified red-team corrections without a self-authored source-issue verdict:

| Issue | Printed passage and corrected input | Reach |
|---|---|---|
| E3 | p. 76: use `Z(G^0)^0 → G^0/G′` and `Z_i → H_i^0`; use a finite map to `H_1 × (G/Z_1)`, factoring through the common-Δ fibre product. Normality of `Z_i` does not imply centrality in disconnected G. | Proof of Proposition 15.1 |
| E4 | p. 68, Proposition 13.25: the split centre is diagonalizable, not necessarily a torus; retain its finite centre. | Proof |
| E5 | p. 85: all three pro-p group occurrences in the labelling construction use Γ_E, and the all-H¹ display must be replaced by the fixed-residual formal interface. | Intermediate stated identification |
| E6 | p. 54, Lemma 11.3: reduce the inverse-image subgroup over the perfect field before asserting generalised reductivity; propagate it to p. 74. | Stated subgroup result |
| E7 | pp. 54–56: a positive multiple of the cocharacter lifts; the composite is `t ↦ t^n`, n>0. | Proof |
| E8 | p. 55: the ē21 action has an additional `2ωbē11` term. Its upper-triangular flag and graded characters are unchanged. | Proof |
| E9 | pp. 51, 52, 63: four Conrad locators bind to [19], *Reductive group schemes*, rather than [16], *Irreducible components of rigid spaces*. | Citation misprints |
| E10 | p. 90, Appendix A.1: an arbitrary accessible functor need not produce a condensed set; use the affine representable functors actually needed. | Stated general construction |
| E11 | **2025 prerequisite**, p. 30, Lemmas 8.4/8.7: an integral normal basis is false for wild E/F; use rational normal basis for rank and cofinal induced lattices for completion. | Prerequisite proof |

These corrections retain the final deformation-ring target statements. They supply proof obligations for the downstream design; they do not claim those proofs have been formalized or that an author has issued a correction.

## Corrected interfaces and regression tests

The affected items have explicit `api`, `unitTests` and prerequisites in the result. Suggested API names describe planned declarations, except the fully qualified imports in /85.

**Total completion (/32).** At x∈X̄∖Y use `Ô_{X,x}[[T]] ≅ R^□_{G,ρ_x}` and the §5.2 local-field coefficient ring Λ. Reduction modulo the same O-uniformizer defining the special fibre gives `Ô_{X̄,x}[[T]] ≅ R^□/ϖ`. The total algebra is characteristic zero when O-flat, and the reduction has characteristic p. Retain T. The published Lemma 5.17 on p. 35 is already correct; this is an extraction mistake.

**Disconnected finite maps (/4, /70).** The connected central-torus isogenies control q on the neutral component. Factor through `H_1 ×_Δ (G/Z_1)`, prove finiteness componentwise after the splitting extension, descend it, and compose with the closed immersion into the full product. Then use /45's finite functoriality, base change to ψ_1, and the product identification. For `G=G_m×C_2`, q has diagonal component map `C_2→C_2²`, which is finite but not surjective. A nontrivial Δ action on the torus must also be allowed. In /64, `SL_2` with centre μ_2 checks the separate diagonalizable-centre repair.

**Reduced subgroup and cocharacters (/54, /69).** In characteristic 2, `SL_2→PGL_2` has kernel μ_2 with algebra κ[ε]/ε². Its reduction is the trivial subgroup; geometric points agree but tangent dimensions are 1 and 0. Define the reduced inverse image over the perfect field, prove the subgroup/smoothness and reductivity assertions, then establish the strict centre-dimension bound before invoking induction in /69. Clear the finite lattice cokernel to lift a positive multiple of the central cocharacter. The diagonal SL_2 torus maps to the PGL_2 torus by exponent 2: exponent 1 does not lift. Positive multiples preserve the signs of all weights and the dynamic subgroup functors (Conrad Theorem 4.1.7(1)). Proposition 11.5 retains E1's characteristic-p restriction.

**Matrix action (/54).** For `A=[[1,b],[0,ψ⁻¹]]`, direct conjugation gives `Ae21A⁻¹=[[b,−ψb²],[ψ⁻¹,−b]]`. Modulo scalars the diagonal term is `2bē11`; after twisting the formula is `ωψ⁻¹ē21 + 2ωbē11 − ωψb²ē12`. The flag with ordered basis `(ē12,ē11,ē21)` remains stable with characters `(ωψ,ω,ωψ⁻¹)`. The invariant-line argument in Lemma 11.4 still follows. Test characteristic 2 and odd characteristic separately.

**Formal torus labels (/71, /77).** Write `J_E=(Γ_E^{ab,p}⊗M_2)^Δ` and `μ=(μ_{p∞}(E)⊗M_2)^Δ`. PQ25 Theorem 9.3 requires the splitting and existence-of-lift hypotheses, possibly after extending coefficients. A chosen lift makes the fixed-residual framed functor a torsor for principal-unit cocycles `Z¹(Γ_F,Hom(M_2,1+m_A))`; use PQ25's pseudodeformation description `O[[J_E]]` for labels and restrict formal characters to μ. The semidirect Teichmüller lift supplies a canonical base component only in that case. Do not equate all cocycles or all H¹ with characters of J_E, or infer a cocycle bijection by restriction when p divides |Δ|. The unramified quadratic sign lattice at odd p distinguishes Γ_E from Γ_F: the latter would give zero sign invariants, while the former gives rank [F:Q_p]. A Frobenius value −1 at odd p gives an unrestricted order-two character with nontrivial residual reduction; it is outside the fixed-residual principal-unit functor and cannot factor through a pro-p group.

**Weil-group input (/81).** The full correspondence uses `H¹_cont(W_{E/F},T̂(Q̄_p))`, or the equivalent W_F parameters, and all continuous characters of T(F). Birkbeck's Theorem 1.0.1 uses divisible topological coefficients. Separately restrict the Galois parameters of /80 and /82 to the Weil group and then use this correspondence. A uniformizer value p is an allowed unramified Weil-side character but has unbounded valuations, so cannot arise from compact Γ_F. A value 1+p has compact principal-unit closure and extends unramified through `Ẑ→Z_p`. No stronger Galois-side bijection is claimed, and Theorems 16.4–16.5 are retained.

**Local factoriality (/76).** A noetherian **local** complete intersection regular at every prime of height≤3 is a UFD. The complete local deformation-ring application survives. For nonlocal rings and schemes use local factoriality. The regular Dedekind hypersurface `Z[√−5]=Z[t]/(t²+5)` has `6=2·3=(1+√−5)(1−√−5)` and no element of norm 2 or 3, so is not a UFD. This is an extraction correction.

**Affine condensed points (/26, /84).** For `X=Spec B` of finite presentation define `X(A)(S)=Hom_{R-alg}(B,A(S))`. Representability preserves the products and descent equalizers; finite presentation supplies accessibility at the required cutoff. These generic results belong to VS2 and are imported into /26. The constant two-element accessible functor fails the empty-product condition (2≠1) and binary disjoint-union condition (2≠4). Lemma A.8 remains valid for the closed affine immersion used here.

**Wild normal-basis input (/71).** Rank uses `E≅F[Δ]` after tensoring with Q_p. For completion choose `Λ_nb=O_F[Δ]θ⊂E` from a rational normal basis, scale it into the exponential domain, and use `π_F^nΛ_nb`. These full Δ-stable lattices are cofinal; their tensors with M under diagonal action are induced after untwisting, giving the H¹ vanishing by Shapiro. For `E=Q_2(√2)`, `Tr(O_E)=2Z_2` whereas `O_E^Δ=Z_2`; a regular `Z_2[C_2]` module has trace onto invariants. The lattice spanned by `1±√2` has index 2 in O_E, is induced, and has trace onto its own invariants `2Z_2`; scaling by 4 puts it in the exponential domain. No claim that O_E or each fractional-ideal lattice is induced remains.

## Prerequisites not yet covered

Fifteen entries. The original fourteen entries retain their source roles; targeted reading and repairs to the torus prerequisites are distinguished above.

**The key inputs:**
- the companion paper on generalised tori (Forum Math. Sigma 2025), which gives the base case and the torus inputs;
- Quast's *Deformations of G-valued pseudocharacters* (Peking Math. J. 2026);
- Böckle–Juschka (Forum Math. Sigma 2023);
- Cotner (IMRN 2024).

**The others:**
- Martin 2003;
- Bate–Martin–Röhrle 2005;
- Richardson 1988;
- Seshadri 1977;
- Emerson–Morel;
- Wang-Erickson 2018;
- Alper 2014;
- Langlands 1997 and Birkbeck 2020 (tori);
- Galatius–Venkatesh 2018;
- Paškūnas–Quast's two 2025 preprints.
- Conrad, *Reductive group schemes*, [public author PDF](https://math.stanford.edu/~conrad/papers/luminysga3.pdf). The four corrected inputs are Example 1.1.16, p. 12 (the semisimple derived group is its own derived group); Example 5.3.9, pp. 170–171 (root-group generation); Theorem 1.2.7, p. 20 (rank-one structure); and Theorem 4.1.7(4), pp. 112–114 (smooth dynamic subgroups and Lie weights). Theorem 4.1.7(1) also supplies positive-multiple invariance, and Corollary 5.3.3 supplies the connected central-torus isogeny.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-PASKUNAS-QUAST-26.result.json` reports no errors.
- Every planned and route stage id exists in `data/atlas.json`.
- The intake file checker, source-issue/version checks, and `git diff --check` pass for the fix.
- Exact Python regression models passed: 4,338 basis-action computations over F₂, F₃, F₅, F₇ and F₁₁; the corrected flag and coefficients; dual-number μ₂ versus reduction; component diagonal; positive-multiple lattice obstruction; sign/regular lattice and wild quadratic trace tests; non-UFD norm/factorization and constant-two condensed counterexamples. These are finite algebraic checks, not Lean proofs of the full theorems.
- All 80 missing items remain routed once, the six route item lists and Part II id are unchanged, and added prerequisite links are acyclic. E1–E2 and their reviews are preserved exactly.
- No Lean file is a deliverable of this job. No suitable compiled build at the pins was available, so no Lean compilation was run.

## Review (REV-PAPER-PASKUNAS-QUAST-26, 23 September 2026)

The independent review, by Claude Code (session `cc-7b31c4`, issue #1345), **accepted** this
extraction and all six routes, and made no correction beyond a source note. The full record is
[REV-PAPER-PASKUNAS-QUAST-26.md](../reviews/REV-PAPER-PASKUNAS-QUAST-26.md).

**Source.** The published Cambridge hash does not reproduce and cannot: a fresh download gave
`b336113e…` against the recorded `c265f54f…`, and every page of the new copy carries a footer with
the date and the requesting IP. A `sha256Note` now records that and names the arXiv e-print
(`05a2306e…`, `defG_REV.tex`, 6796 lines) as the reproducible pin — the sixth instance of this in the
corpus. Both findings are verbatim in that source.

**Structure.** 84 items with all 80 missing ones routed exactly once; all seven source stage ids and
all three planned ids resolve; the Part II title reproduces the parent's atlas title exactly and its
area `langlands` is a galaxy id; the library item's `CondensedSet`, `Condensed.discrete` and
`CondensedSet.isDiscrete_tfae` are all in Mathlib. 112 of 114 locator checks land exactly and the two
others are right too.

**Both findings are confirmed.** `E2` is a substitution slip. `E1` is an error in a stated result and
the review sharpens why: §11 assumes only that `κ` is algebraically closed, and the proof of
Proposition 11.5 disposes of `ψ = ω^{±1}` by "then `ψ^{p−1} = 1`", which holds because the reduction
of the cyclotomic character has order dividing `p − 1` — a characteristic-`p` fact. In characteristic
zero that step fails, and Lemma 11.4, to which the rest of the proof reduces, has `ψ ≠ ω^{±1}` as its
first hypothesis; so the case the proof handles separately is exactly the one its own lemma excludes.
The recorded `PGL₂` counterexample sits in that gap, and the correction's evidence checks out: the
proposition's only application, Proposition 14.5, works throughout on the special fibre, so
`char κ = p` there and nothing downstream is affected.

The review reports one provenance gap it did not fill: no `libraryPins` are recorded. It notes this
is the seventh extraction reviewed that day with the same gap, confirming it as a queue-level
omission.
