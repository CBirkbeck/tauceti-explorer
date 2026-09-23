# Česnavičius (2019): purity for the Brauer group, extraction and routing

Issue [#1328](https://github.com/CBirkbeck/tauceti-explorer/issues/1328). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged checkpoints, whose report follows below as history.
- **The paper.** K. Česnavičius, *Purity for the Brauer group*, Duke Math. J. 168 (2019), 1461–1486.
  - arXiv v4, the author's final version, was re-fetched; its SHA-256 (a62a12bb…) matches the checkpoint.
  - The Duke text is not openly available.
- **Items.** The result has **178 items: 15 library, 13 planned and 150 missing**. Every missing item is routed exactly once, and every numbered statement is an item; all twenty-six were checked against arXiv v4.
- **Mistakes.** Four are recorded under `sourceIssues`.

## This continuation (cc-442dc5)

**Findings.**
- **E1 now affects a stated result.** Proposition 2.2 is stated for arbitrary affine smooth G. For noncommutative G, its proof shows only that the neutral fibre is trivial. Both uses (Proposition 2.3 and Corollary 2.4) have commutative G, so the main theorem is unaffected.
- **E4 now affects nothing.** The misprint in the cited SGA 2 lemma is harmless: the application holds under either reading.
- **E2 and E3.** Proof steps in the cited Gabber–Ramero; unchanged.

**Gaps.**
- G-NONABELIAN is recorded as E1.
- G-SOURCE-VERSION is unavailable.
- The other twenty-three are deferred as cited suppliers' proofs or design work.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once, and the mistakes are recorded.

## Mistakes found (`sourceIssues`)

- **E1** (gap; affects a stated result), Proposition 2.2 and its proof, p.4, in arXiv 1711.06456v4 (1 December 2018, the latest version; PDF SHA-256 a62a12bb…8709); the author's copy of 27 November 2018 on his homepage has the same text; the published text, Duke Math. J. 168 (2019), 1461–1486, was not collated. *Printed:* "Proposition 2.2. For a finite, flat map R → R′ of local rings, an open subscheme V ⊂ Spec R, and an affine, smooth R-group scheme G, if (1) Γ(Spec R, O) ≅ Γ(V, O) via pullback; and (2) every G-torsor is trivial over R; then the following pullback is injective: H¹_et(V, G) ↪ H¹_et(V_{R′}, G). (2.2.1)" Proof: "… every element of X(V) lifts to (Res_{R′/R}(G_{R′}))(V), so, by [Gir71, III.3.2.2], the map H¹_et(V, G) → H¹_et(V, Res_{R′/R}(G_{R′})) (2.2.2) is injective." *Correction:* State Proposition 2.2 for commutative G, which covers both of its uses (Proposition 2.3, with G = Res_{R′/R}(T_{R′})/T, and Corollary 2.4, with G = T). For noncommutative G, supply the missing step: for every G-torsor P over V, the twisted map (^P Res_{R′/R}(G_{R′}))(V) → (^P X)(V) must also be surjective.
- **E2** (misprint; affects the proof), Supporting source GR, math/0201175v3, Proposition5.4.13 proof, p119 (not a finding in the main Česnavičius text). *Printed:* such that t^h ∈ H *Correction:* Choose the finite subideal H with t^h∈H+p_a. This is precisely the condition used later for H_λ+p_(λ,a).
- **E3** (misprint; affects the proof), Supporting source GR, math/0201175v3, Proposition5.4.13 proof, p119 (not a finding in the main Česnavičius text). *Printed:* S̄_λ := R̄_λ ⊗_(R_λ) S *Correction:* The completed finite-stage algebra is S̄_λ=R̄_λ⊗_(R_λ)S_λ, where S_λ=F_λ/J_λ. In the immediately preceding point-ideal list use X_N−c_N for its last generator.
- **E4** (misprint; affects nothing), Supporting source SGA2, Laszlo annotated edition, XI Lemma3.17(e); inherited finding from the 2026-09-22 continuation. *Printed:* pour tout y fermé de X, y ∈ Y *Correction:* Replace y ∈ Y by y ∉ Y in this hypothesis.

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **G-NONABELIAN** (recorded). E1: Proposition 2.2 is established for commutative G, which covers both uses.
- **G-LOCAL** (deferred). A cited supplier's proof (see detail); the paper uses it as an input.
- **G-TOPOS** (deferred). A cited supplier's proof (see detail); the paper uses it as an input.
- **G-LEFSCHETZ** (deferred). A cited supplier's proof (see detail); the paper uses it as an input.
- **G-ELKIK** (deferred). A cited supplier's proof (see detail); the paper uses it as an input.
- **G-GABBER** (deferred). A cited supplier's proof (see detail); the paper uses it as an input.
- **G-QUOTIENT** (deferred). A cited supplier's proof (see detail); the paper uses it as an input.
- **G-GROTHENDIECK** (deferred). A cited supplier's proof (see detail); the paper uses it as an input.
- **G-PERFECT-ETALE** (deferred). A cited supplier's proof (see detail); the paper uses it as an input.
- **G-BMS** (deferred). A cited supplier's proof (see detail); the paper uses it as an input.
- **G-KL** (deferred). A cited supplier's proof (see detail); the paper uses it as an input.
- **G-CHARP-CD** (deferred). A cited supplier's proof (see detail); the paper uses it as an input.
- **G-HUBER** (deferred). A cited supplier's proof (see detail); the paper uses it as an input.
- **G-ADIC-LIMIT** (deferred). A cited supplier's proof (see detail); the paper uses it as an input.
- **G-COHEN** (deferred). A cited supplier's proof (see detail); the paper uses it as an input.
- **G-TOWER-HENSEL** (deferred). A cited supplier's proof (see detail); the paper uses it as an input.
- **G-CONIVEAU** (deferred). A cited supplier's proof (see detail); the paper uses it as an input.
- **G-ABSOLUTE** (deferred). A cited supplier's proof (see detail); the paper uses it as an input.
- **G-CTS** (deferred). A cited supplier's proof (see detail); the paper uses it as an input.
- **G-RESIDUE** (deferred). A cited supplier's proof (see detail); the paper uses it as an input.
- **G-SERRE** (deferred). A cited supplier's proof (see detail); the paper uses it as an input.
- **G-SGA3** (deferred). A cited supplier's proof (see detail); the paper uses it as an input.
- **G-CGP** (deferred). A cited supplier's proof (see detail); the paper uses it as an input.
- **G-SOURCE-VERSION** (unavailable). The Duke text is not openly available; arXiv v4, the author's final version, was read in full.
- **G-CLOSURE** (deferred). Declaration-sized splitting of imported inputs is design work; every numbered statement is an item.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, every missing item is routed exactly once, and every prerequisite target exists. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or *open*, or gives the earlier classification of the findings reclassified here, this continuation supersedes it.

## PAPER-CESNAVICIUS-19 — Purity for the Brauer group

Current worker: Codex, session codex-c83e7a. Refs #1328. Read/check date: 2026-09-23. Earlier checkpoint work by Codex codex-a71f92 and Claude Code cc-fb70e5 / cc-7b31c4 is retained below with its reading boundaries.

Status: **partial checkpoint**. The entire main paper has been read and its named conclusions, constructions, remarks and proof interfaces inventoried. This is not a closed proof plan: the JSON names 25 open source/proof gaps, several requiring further one-declaration decomposition. Nothing in this submission claims a new formalization.

There are 178 items: 15 library imports, 13 existing planned interfaces and 150 missing items. Every missing item has exactly one route. The 42 definitions/constructions carry 126 unexecuted planning tests with canonical kinds, API outlines and use records. All 17 routes are sources for existing proposed roadmaps; no new roadmap or Part II is needed. The 2026-09-23 continuation below records the 19 additions and the narrowed G-ELKIK boundary.

### Source and reading boundary

The main source is the [author's final arXiv version, 1711.06456v4](https://arxiv.org/pdf/1711.06456v4), all 17 pages, including every proof, footnote, remark and the appendix. The arXiv submission date is 1 December 2018; the PDF internally says 4 December 2018. Its metadata identifies Duke Mathematical Journal 168(8) (2019), 1461–1486, DOI [10.1215/00127094-2018-0057](https://doi.org/10.1215/00127094-2018-0057). This supports the publication correspondence, but is not a page-by-page comparison with the unavailable publisher PDF.

SHA-256: a62a12bbe26595aec89d31d24d46774a1ee3eff73c08da0febf5a2b472118709.

The JSON records URLs, hashes, dates and precise reading ranges for the supporting PDFs. In particular:

- [Gabber–Ramero](https://websites.umich.edu/~bhattb/almost_purity_2011/almost_ring_theory.pdf): the selected approximation path through §§5.4.1–5.4.42 and §§5.8.3–5.8.16, including proofs. The available preprint's **Corollary 5.4.42**, not its Lemma 5.4.41, is the projective-module completion theorem cited as GR03 5.4.41 in the main paper. Its Lemma 5.4.41 is the smoothness input. The Elkik proof and GR3.2.16 were freshly read in the 2026-09-23 continuation below; their lower model/étale/cotangent-comparison foundations remain open.
- [Bhatt–Morrow–Scholze](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf): the entire §3.2, Definition 3.5 through Lemma 3.21 and their proofs. This author file is dated 8 January 2019, later than the BMS16 citation; the relevant numbering matches. The earlier θ construction and referenced root-control results remain gaps.
- [Kedlaya–Liu v5](https://arxiv.org/pdf/1301.0792v5): §3.6 through Remark 3.6.24, including the Banach, localization, finite étale and tilting proofs. The input is general Banach Q_p geometry, not only algebras over a chosen perfectoid field. The étale-site conclusion is **Remark 3.6.23** in this version.
- [SGA 2, Laszlo's annotated edition](https://www.cmls.polytechnique.fr/~laszlo/sga2/sga2-smf.pdf): X §2 definitions and Example 2.1's full proof; XI 2.1–2.2 and XI 3.1–3.18, including the parafactoriality theorem and its proof. The VIII–IX coherence and formal-comparison inputs were read in the second continuation below; what is not read is the layer beneath them (SGA 2 IV–V and VII, and EGA 0_III 13.3.1/13.7.7).
- The actual statements and displayed proofs of Stacks [0E9K](https://stacks.math.columbia.edu/tag/0E9K), [069I](https://stacks.math.columbia.edu/tag/069I), [07D3](https://stacks.math.columbia.edu/tag/07D3) and [09Q7](https://stacks.math.columbia.edu/tag/09Q7) were read. Their short proofs still import substantial local algebra.

Other references in the prerequisite ledger are explicitly marked as unread proof inputs or bibliographic pointers. Locating a publisher page is not counted as reading its theorem. The historical Gabber cases (iv)–(vi) in the introduction are not used by this proof and have not been smuggled in as shortcuts.

### Mathematical scope

The central local result is H²_et(U_R,G_m)=0 for a strictly henselian regular local ring R of dimension at least two. The new mixed-characteristic p-primary argument passes through a tower of finite flat **regular local** algebras and the **p-adic completion of their colimit**. Neither the finite stages nor the uncompleted colimit are declared perfectoid.

The dependency spine is:

1. Hartogs extension and an affine diagonal Weil quotient give finite-flat descent. The Picard vanishing needed on the double self-product is local Grothendieck–Lefschetz in dimension at least four.
2. Henselian approximation preserves torsion Brauer classes on a principal generic fibre. Iterating principal completions along a regular parameter system yields injection on punctured H² after maximal-ideal completion.
3. Replace an integral perfectoid model R by the powerbounded subring of A=R[1/p]. The quotient A°/R is killed by each chosen small pseudouniformizer root; it is **not** assumed zero.
4. Scheme/adic comparison, tilting of the full étale site, and affine characteristic-p cohomological dimension give H^i(A,G)=0 for finite commutative étale p-primary G and i≥2. Kummer gives H^i(A,G_m)[p∞]=0 in the same degree range.
5. Combine this with the small-dimensional cases and prime-to-p absolute purity, then use supported cohomology and coniveau to obtain the global theorem.

The small-dimensional and prime-to-p results are genuine external proof engines: Grothendieck's dimension-two argument, Gabber's dimension-three theorem, and Gabber absolute cohomological purity. Smooth purity in EDC.2 does not supply the last one.

The global torus theorem is deliberately stronger than the introductory G_m statement in its permitted base schemes. For arbitrary X and closed Z, it assumes regular local rings of dimension at least two **at every point of Z**, together with quasi-compactness of X minus Z into X. It gives isomorphisms in degrees 0, 1 and 2, and only injection in degree 3. X need not be regular away from Z.

The codimension-one intersection formula for an arbitrary torus additionally assumes H²(V,T)→H²(K,T) is injective for **every nonempty open V**. This holds for G_m, and the paper cites a flasque-torus extension. It does not hold for all tori: the norm-one torus for C/R on P¹_R yields a nonzero generically trivial class.

The residue sequence retains the primary-part exclusions at imperfect characteristic-p residue fields. It is not an unrestricted wild residue theorem, and no surjectivity onto the direct sum is appended.

Appendix A uses Serre's **dimension at most one**, including the extra characteristic-p Brauer-vanishing condition over all finite separable extensions. It proves the equivalent higher fppf vanishing for all finite commutative group schemes, then all finite-type commutative group schemes. It does not assert H¹ vanishing for every such group.

### Two proof-sensitive qualifications

First, Proposition 2.2 is retained in its printed nonabelian scope, with G-NONABELIAN attached. The displayed quotient argument directly proves that the neutral fibre is trivial. For a nonabelian H¹ pointed set, that alone is not full injectivity. A continuation must read Giraud III.3.2.2 and verify the twisted-fibre argument under the exact hypotheses. This checkpoint does not claim the theorem false. All subsequent applications in the main purity proof use commutative groups, where the neutral-kernel argument does suffice; that specialization is a separate item.

Second — sharpened in the second continuation below, which reduces footnote 3 to a single statement — Huber's book has a blanket Noetherian convention. The paper does not apply it directly to R perfectoid. Its proof constructs integral finite-type stages R_j, compares the adic cohomology of their generic pairs with the scheme cohomology of **R_j^h[1/p]**, then passes to limits. Footnote 3 extends qcqs étale descent from perfectoid stages to **Noetherian integral stages with perfectoid completed limit**. That exact extension is a separate item and gap. It is neither automatic from the usual statement nor a reason to demand the stronger affinoid descent owned by A3.

Lemma 2.1's rank-zero edge case is handled on its clopen locus before the positive-rank fppf descent argument. Its product decomposition is an isomorphism of groups only in the commutative case. No false counterexample is claimed from the rank-zero case.

### Ownership decisions

| Supplier | Exact contribution |
| --- | --- |
| SchemeAndStackFoundations SF.0 | Punctured opens, Hartogs/coherent extension and determinant/Picard bridge |
| SF.1 | General scheme-torus descent, diagonal quotient, torsor lifting and finite-type group reductions |
| SF.2 | Coefficient-specific cohomology, Brauer comparison/descent/purity, coniveau, residues and Appendix A field cohomology |
| SF.4 | Henselian approximation, projective presentation groupoid, iterated-completion adapter and local parafactorial/Picard theory |
| DeformationAndDerivedPatchingAlgebra R03.3 | Shared local depth, lci and regular-factorial algebra |
| ReductiveGroupsPartII RG2.0a | The existing Weil restriction/norm owner, extended to the exact arbitrary-affine and finite-flat smoothness scope |
| PerfectoidQuotients Q0:integral-algebra | Integral perfectoid specialization, θ comparison, compatible roots and integral/Tate adapter |
| PerfectoidSpaces P1/P2/P3 | General Banach realization, tilt, rational homeomorphism/sheafiness, finite étale and full-site equivalence |
| PerfectoidSpaces P5/P7 | Noetherian-stage qcqs limit extension; regular finite-flat towers and their completed limit |
| AdicEtaleGeometry A1 | Actual adic étale-site basis and stability |
| ClassicalAdicEtaleCohomology H0/H1:henselian | Adic cohomology continuity and Huber's henselian comparison |
| AdicCoefficientsAndComparisons L2 | Scheme finite-presentation/cohomology continuity |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 | Only the source-scoped finite connected/connected p-group devissage |

These are source refinements of existing proposed layers, not new foundations detached from their owners. At integration, split early site/field/approximation prefixes from later purity suffixes. In particular the generic P1 foundations precede Q0, while the specialized Q0-to-P1 adapter is later; SF.2's early coefficient theory precedes SF.4, and its final purity consumer follows. Adding blanket reverse edges between whole stages would create artificial cycles.

The catalogue pass included new roadmaps, packets, integrated decompositions, reserved IDs and the relevant RS-02/05/25/31 ownership records. Cartier duality and strict henselization are not reassigned from their upstream owners. The current Gille–Parimala paper already uses SF.0–SF.1 for coherent Hartogs and torsor purity; Harpaz–Wittenberg20 uses SF.2 for G_m/purity/residues. The present source coalesces with these uses.

Neither K2SymbolsBrauer's explicit classical symbols nor the Lefschetz-pencil/vanishing-cycle project owns local Brauer purity or the local parafactorial theorem. SF.3's curve/Picard objects also do not by themselves provide the higher-dimensional local theorem.

### Pinned-library findings

The inspected commits are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Actual reused declarations include IsRegularLocalRing; HenselianRing/HenselianLocalRing and the adic-complete instance; IsAzumaya; scheme small étale/fppf topologies; generic CategoryTheory.Sheaf.H; PreTilt and its multiplicative sharp; WittVector and the perfect-field Witt DVR theorem; and Tau Ceti's affine-base finite locally free Cartier dual/equivalence/bidual/base-change API.

Important distinctions:

- Mathlib's BrauerGroup is a field central-simple-algebra quotient, not H²_et of an arbitrary scheme.
- The actual regular-local class and polynomial regularity theorems are not a complete regular-local factoriality/localization library.
- Tau Ceti's field torus category is useful but not arbitrary scheme-torus descent.
- The Cartier dual construction really is present over an arbitrary affine base; Appendix A must import it.
- The inverse-limit and sharp carriers do not themselves define a perfectoid ring or prove tilting.
- Generic sheaf cohomology and global-sections continuity do not prove higher étale continuity.

Reviewed AUDIT-01, AUDIT-17 and AUDIT-18 entries were read, and their conclusions checked against these actual statements. Where no audit entry existed, that absence was not used as evidence of missing mathematics.

The open [Mathlib integral-perfectoid PR #26385](https://github.com/leanprover-community/mathlib4/pull/26385), at the inspected head 75d288cfb2e8c7033535f60168edf49cfbb0daeb, is shape guidance only. Its pseudouniformizer nonzerodivisor condition is narrower than unrestricted BMS integral perfectoid and is compatible with the paper's torsion-free direction. It is not in the pinned baseline.

### Continuation and checks

The complete gap ledger is in the JSON. Resume first with G-NONABELIAN, then G-HUBER/G-ADIC-LIMIT and G-LEFSCHETZ/G-ELKIK. The latter two branches already have substantial direct source reading, so a continuation should extend those proof paths rather than repeat the main-paper inventory. Gabber/absolute purity, Cohen structure and the Appendix A SGA3/Serre/CGP inputs remain mandatory before a complete claim.

The paper checker and a supplemental audit cover JSON validity, unique IDs, exact-one missing-item routing, known owners/stages, acyclic item dependencies, explicit gap references, and three tests plus use-derived APIs for every definition. These are structural checks, not mathematical certification. No Lean file is requested by this issue, and no Lean compilation or test execution is claimed.

### Continuation: G-NONABELIAN made non-blocking (Claude Code, cc-fb70e5, 22 September 2026)

The printed proof of Proposition 2.2 shows that (Res_{R′/R}G_{R′})(V)→X(V) is surjective. That is the untwisted case, which gives only the triviality of the neutral fibre of H¹(V,G)→H¹(V,Res). For noncommutative G, injectivity of this map of pointed sets would also need the twisted maps (^P Res)(V)→(^P X)(V) to be surjective, for G-torsors P on V that need not extend to R. The printed hypotheses do not control these. The question is recorded as a gap, not a counterexample, in `research/blueprint/errata/PAPER-CESNAVICIUS-19.json` (E1).

The extraction now isolates it:
- finite-etale-push keeps only the abelian exactness it is used for, and no longer carries G-NONABELIAN;
- the nonabelian degree-one comparison is a new item, finite-etale-push-nonabelian (gate G-TOPOS), used only by the printed-scope item h1-descent;
- h1-descent has no dependants, so G-NONABELIAN blocks nothing else;
- both uses of Proposition 2.2, in Proposition 2.3 and Corollary 2.4, go through h1-abelian.

The extraction now has 149 items, 127 of them missing; every missing item is still routed once.

### Continuation: the SGA 2 and Scholze reading debts (Claude Code, cc-7b31c4, 22 September 2026)

This continuation takes the next two branches in the handoff's resume order, **G-LEFSCHETZ** and
**G-ADIC-LIMIT**, and reads their named sources at their locators. Both gaps are narrowed to a
precisely stated remainder; neither is closed. The extraction now has **159 items**, 137 of them
missing, every one routed exactly once; the item dependency graph is still acyclic. No new roadmap or
Part II is proposed, and nothing is claimed formalised.

#### What was read

- **SGA 2**, Laszlo's edition (same PDF and SHA-256 as the first checkpoint), extending the earlier
  reading: **VIII §2** Théorème 2.1 with Corollaires 2.2 and 2.3 and Lemmes 2.4–2.5, with the proof;
  **IX §1** Propositions 1.2–1.4 and Exemple 1.5, with the proof; **IX §2** Théorèmes 2.1–2.2 and
  Corollaire 2.3, with the proof; **XI §1** the exact sequence (1.1) and Proposition 1.1.
- **Scholze, *Étale cohomology of diamonds***, [arXiv:1709.07343v2](https://arxiv.org/pdf/1709.07343v2),
  SHA-256 `828adea41601491dc6c35d3d6a29bb94d8f6026861cc76ad4d36ee5e92f4d9f5`: Proposition 6.4 with all of
  (o), (i), (ii), (iii), (iv) and the **complete proof of (ii)**.

Seven new items carry the SGA 2 statements (`sga2-finiteness`, `sga2-depth-coherence`,
`formal-comparison-sections`, `formal-algebraization`, `pic-thickening-sequence`,
`pic-formal-injectivity`, `pic-hypersurface-descent`) and three the Scholze ones
(`adic-spectral-limit`, `adic-finite-etale-limit`, `perfectoid-qcqs-limit`). The first seven join the
existing SF.4 source route beside the parafactoriality and Lefschetz nodes; the last three join the P5
route beside `noetherian-approx` and `qcqs-site-limit`. Each is wired as a prerequisite of the node
that consumes it, with the matching `uses` record.

#### G-LEFSCHETZ: what the local Grothendieck–Lefschetz theorem actually rests on

The chain behind `local-pic-lefschetz` — Pic of the punctured spectrum of a Noetherian local complete
intersection of dimension ≥ 4 vanishes — is now explicit.

1. **SGA 2 X Example 2.1** turns depth into the Lefschetz conditions. Its proof needs three things.
   For Lef: coherence of `u_*(E)` across the finitely many closed points of `X` outside a neighbourhood
   of `Y`, which is **VIII 2.1** applied with the depth reformulation **VIII 2.3** (`prof A_p ≥ 3 − dim A/p`);
   and then the section comparison `Γ(U, E) ≅ Γ(X̂, Ê)`, which is **IX 1.5**, the local case `n = 1` of
   IX Proposition 1.4. For Leff it needs, in addition, algebraization of a coherent sheaf on `X̂`, which
   is **IX 2.3**, the local case of IX Théorème 2.2.
2. **VIII 2.1** is the finiteness theorem: with `c(x) = codim(\overline{\{x\}} ∩ Y, \overline{\{x\}})`,
   vanishing of `H^{i−c(x)}(F_x)` on `U` gives coherence of `H^i_Y(F)`. **VIII 2.3** is its depth form,
   with four equivalent clauses; clause (iv), coherence of `R^i i_*(F|U)` for `i < n`, is the one the
   applications use, and the editor's note records that in the original text it stood only inside the
   proof.
3. **IX 1.4** is proved by reducing, through IX 1.2 and 1.3, to coherence of `R^i f_*(F)` for `i ≤ n`,
   which is again VIII 2.1. **IX 2.2** is proved by checking, using `t`-regularity, that
   `J^kℱ/J^{k+1}ℱ ≅ ℱ/Jℱ`, so that the graded finiteness hypothesis of IX 2.1 reduces to coherence of
   `R^i f_*(ℱ_0)` for `i ≤ 1` — VIII 2.1 once more.
4. **XI 1.1** supplies the infinitesimal obstruction: `0 → P_n → O*_{X_{n+1}} → O*_{X_n} → 1` with
   `P_n = I^{n+1}/I^{n+2}` additive and the first map `x ↦ 1 + x`, whence
   `H¹(Y, P_n) → Pic(X_{n+1}) → Pic(X_n) → H²(Y, P_n)`. **XI 2.1–2.2** turn Lef into injectivity and
   Leff into `colim_U Pic(U) ≅ Pic(X̂)`; **XI 3.12** combines the two with parafactoriality off `Y`.
5. **XI 3.16 and 3.17** are the induction step. Because `t` is `A`-regular, `P_n ≅ O_Y` for every `n`, so
   the vanishing XI 1.1 asks for is just `H^i(Y, O_Y) = 0`, which the excision sequence
   `H^i(Y_0, O) → H^i(Y, O) → H^{i+1}_x(Y_0, O)` gives from `prof A/tA ≥ 3`, resp. `≥ 4`, since `Y_0` is
   affine. Théorème 3.13 (ii) then follows by induction on the length of the regular sequence, the base
   case being regular local rings, factorial by 3.13 (i) and parafactorial by 3.10.

**One reading correction.** Hypothesis (e) of XI Lemme 3.17 is printed in the Laszlo edition as
*« pour tout y fermé de X, y ∈ Y »*. The mathematics requires **y ∉ Y**: (e) exists only to supply
hypothesis 3) of XI Proposition 3.12, which asks for parafactoriality at the points of `X − U` for the
open neighbourhoods `U` of `Y`, and those are exactly the closed points of `X` outside `Y`; points of
`Y` lie in every such `U`, so the printed reading leaves 3.12 unusable. The verification of (e) inside
the proof of 3.13 (ii) covers *every* closed point of `X`, so it does not distinguish the two readings.
The 1968 North-Holland original was not consulted, so this is recorded as a correction to the edition
read, on the item `pic-hypersurface-descent` and in `supportingSources`, and **not** as a finding about
Česnavičius's paper.

**What remains open** is one layer further down, and G-LEFSCHETZ stays open for it: the dualizing-module
and local-duality theory of SGA 2 IV–V and the Ext-coherence criteria of VII, on which the proof of
VIII 2.1 rests; and EGA 0_III 13.3.1 behind the comparison theorem IX 1.1, and EGA 0_III 13.7.7 through
EGA III 3.4.2 behind IX 2.1.

#### G-ADIC-LIMIT: what footnote 3 actually has to prove

Scholze's Proposition 6.4 concerns a cofiltered system `X_i = Spa(R_i, R_i^+)` of **affinoid perfectoid**
spaces with a common pseudouniformizer `ϖ`, and the limit `X = Spa(R, R^+)` with `R^+` the `ϖ`-adic
completion of `colim_i R_i^+`. Part (o) is the homeomorphism `|X| ≅ lim_i |X_i|` of spectral spaces;
part (i) the equivalence `2-colim_i (X_i)_fét ≅ X_fét`; part (ii) the equivalence
`2-colim_i (X_i)_ét,qcqs ≅ X_ét,qcqs`.

Reading the proof of (ii) shows exactly where the hypothesis is used. Faithfulness compares the
quasi-compact open images of the graphs of two maps inside `|Y_i ×_{X_i} Y'_i|` and descends the
equality to a finite stage — that is **(o)** alone. The intermediate step, that a map which becomes an
isomorphism over `X` is one over some `X_j`, is a quasi-compactness argument on images — again (o).
Fullness approximates the graph by a quasi-compact open `V_j` and applies the intermediate step —
again (o). Essential surjectivity reduces a qcqs étale `Y → X` to a composite of a rational open
subset, a **finite étale** map and a rational open subset; the rational opens descend by (o) and the
finite étale map by **(i)**.

So affinoid perfectoidness of the *stages* enters only through (o) and (i). Česnavičius proves (o) for
his own Noetherian stages directly, at (4.10.6), from the continuity criterion for valuations. What his
footnote 3 therefore has to prove, and what this extraction now records as the whole remaining content
of G-ADIC-LIMIT, is **(i) for Noetherian stages**: for a filtered system of affinoid Tate rings with a
common pseudouniformizer, each Noetherian, a ring of definition, and integrally closed in its generic
fibre, whose `ϖ`-adically completed colimit has perfectoid generic fibre, every finite étale algebra
over the limit descends to a stage. That, together with the topos-limit or hypercover continuity of
footnote 4, is what is left. Huber's 3.2.9 itself is untouched and remains **G-HUBER**; his book is not
publicly available and was not read.

#### Numbering, checked independently

The whole source was re-digested from the LaTeX of arXiv:1711.06456v4 (the `subfiles` `finite-flat`,
`completion`, `perfectoid`, `reduction`, `global` and the main file). Every statement environment is on
the `numberingbase` counter, an alias of `subsection`, and the `\brems`/`\remi` blocks advance it once
per item — the step that is easy to miss. That gives **38 numbered statements**: 1.1–1.5, 2.1–2.7,
3.1–3.3, 4.1–4.10, 5.1–5.4, 6.1–6.4 and A.1–A.5. Every number that the compiled PDF prints as a
cross-reference was checked against it, and all agree; the numbers that do not appear in the PDF text
are exactly the remarks inside `\brems` blocks that nothing cites. In particular the existing locators
Proposition 2.2, Corollary 2.5, Lemma 3.1, Theorem 4.10, Theorem 5.3 and Theorem 6.1 are confirmed.

#### On `sourceIssues`

This earlier decision to keep findings only in the separate errata file is superseded by the 2026-09-23 continuation below. Issue instruction5a expressly requires the list in the extraction. E1 is preserved unchanged, supporting-source findings E2–E4 are recorded, and the collector duplication caveat is stated explicitly.

#### Checks run

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CESNAVICIUS-19.result.json` — ok.
- `python3 research/blueprint/intake.py check-files` on the three deliverables — ok.
- A supplemental structural audit: unique ids, every `prerequisites` and `uses` target an existing item,
  every named gap exists and every gap consumer exists, every route names existing items, every missing
  item taken by exactly one route, the item dependency graph acyclic, and every `uses` record matched by
  the corresponding `prerequisites` entry. Zero errors.
- Independent reconstruction of the paper's numbering from the LaTeX, checked against the compiled PDF.
- No Lean file is a deliverable and no compilation or test execution is claimed.

### Continuation of 23 September 2026: the Elkik approximation path

Codex, session `codex-c83e7a`, continued the 159-item checkpoint. All 17 pages of the main paper were freshly read again, with the same recorded hash. The fresh supporting-source work is **Elkik's original journal scan, printed pp553–568**, including all of §§0–II, and **GR §§5.4.1–5.4.14 and §§3.2.1–3.2.18** with proofs. GR §3.2.19–23 and Elkik's opening of §III were context only. Earlier SGA 2, Scholze, BMS, Kedlaya–Liu and later GR reading remains inherited, explicitly distinguished in `supportingSources`.

Elkik's scan is [available from Numdam](https://www.numdam.org/item/10.24033/asens.1258.pdf), SHA-256 `74ddbf6a04ca9fb4e6b9ef0da537231045a293d56242571749cda079349d40c5`. The GR copy is [the Michigan-hosted preprint](https://websites.umich.edu/~bhattb/almost_purity_2011/almost_ring_theory.pdf), SHA-256 `c4ab39ad5cd3f95f12a4c2f1f100f0c9f91578c6cbe2085a1962d111df8d7dc8`. A fresh download from the unversioned arXiv URL is byte-identical: math/0201175v3, 22 July 2002. Its numbering is not silently identified with the 2003 book. Printed Elkik pages 554, 560, 561 and 564–567 and GR page119 were visually checked to resolve bars and exponents.

The new result has **178 items: 15 library, 13 planned, 150 missing**. All 159 inherited IDs and statuses are preserved. All 17 existing source routes and 25 gap IDs remain. The 42 definitions/constructions have 126 planning tests, now with the canonical test kinds. The four new definition/construction interfaces have use-derived APIs and concrete tests. No Lean declarations were implemented or compiled.

#### A finite-conormal proof of the Newton step

Let (F=R[X_1,\ldots,X_N]), (J=(f_1,\ldots,f_q)), (S=F/J), (M=J/J^2), and (d:M\to S^N) be the conormal differential. The pinned `Algebra.Extension.cotangentComplex` already supplies the naive map. Define the ideal

\[
H_{\rm fac}=\{h\in F:\exists u:S^N\to M,\quad u d=h\,\mathrm{id}_M\}.
\]

Ideal laws follow by adding and scaling witnesses; (J\subset H_{\rm fac}). GR's low cotangent comparison identifies this ideal with (H_R(F,J)=\operatorname{Ann}_F\operatorname{Ext}^1_S(L_{S/R},M)). The full-L comparison belongs to **DerivedDeRhamCohomology DD.0** and is still an imported prerequisite. The polynomial argument after that identification does not need the full obstruction-theory construction of GR3.2.16.

Suppose (t) is regular, (h_0(a)=t^h) for (h_0\in H_{\rm fac}), and (f_i(a)\in t^nI). Lift each (u(dX_k)) to (b_k\in J). The factorization equation gives

\[
h_0f_i-\sum_k(\partial_kf_i)b_k\in J^2.
\]

Write (b_k(a)=t^h\delta_k), with \(\delta_k\in t^{n-h}I\). Evaluating the preceding relation and cancelling the regular element (t^h) yields

\[
f_i(a)-\sum_k\partial_kf_i(a)\delta_k\in t^{2n-h}I^2
\subset t^{2n-2h}I^2.
\]

The multivariate Taylor remainder at (a-\delta) lies in ((t^{n-h}I)^2). Thus (b=a-\delta) proves the precise improvement in GR5.4.8. The argument is finite polynomial algebra over arbitrary (R). It is written out as a worker-derived alternative, not attributed to GR's Ext proof.

For iteration one retains **(n>2h)** and increases the powers of (I) as well as those of (t). This produces a (tI)-adically Cauchy sequence in the complete case. A boundary test uses (X^2+3) at (1\in\mathbf Z_2): (n=2,h=1) satisfies the weak inequality but no root exists because (-3\equiv5\pmod8). Cancellation also fails if (t) is a zero divisor: (t\epsilon=0\ne\epsilon) in (k[t,\epsilon]/(\epsilon^2,t\epsilon)).

Elkik's minor–colon ideal is separately defined by (H_{\rm Jac}=\sum_\alpha\Delta_\alpha(J_\alpha:J)). GR5.4.6 gives (H_{\rm Jac}\subset H_{\rm fac}) by an explicit adjugate matrix factorization. These ideals are not literally interchangeable: for (J=(X^2)\subset k[X]) in characteristic2, (H_{\rm Jac}=0) but (H_{\rm fac}=(X^2)). Their images have the same vanishing locus on \(\operatorname{Spec}S\).

#### The original Noetherian approximation proof

The Noetherian convention is printed in **Elkik §0, p554**. It applies to Theorem2bis even though that theorem's local statement omits the word. The extraction now gives separate statements and proof outlines for:

1. **Tougeron's exact-root lemma.** For a Noetherian Henselian pair ((A,\mathfrak a)), maximal Jacobian minors generating an ideal containing \(\mathfrak a^h\), and error in \(\mathfrak a^n\) with (n>2h), adjugate matrices reduce the problem to auxiliary equations with identity Jacobian modulo \(\mathfrak a^{n-2h}\). Henselian smooth lifting solves them and gives correction in \(\mathfrak a^{n-h}\).
2. **Conormal stabilization.** Replace (B=A[X_1,\ldots,X_N]/J) by (C=\operatorname{Sym}_B(J/J^2)), then add (N) zero coordinates to its embedding. On affine smooth opens the total space has relative dimension (N), and its stabilized conormal is free of rank (N+q), where (q) is the chosen number of generators of (J). Projection takes a solution back to (B). This does not assert that the original conormal is globally free.
3. **Principal torsion separation.** For Noetherian (A), the (t)-power torsion ideal is killed by one power of (t). Artin–Rees then gives (A[t^\infty]\cap t^nA=0) for sufficiently large (n). This is the substitute for regular cancellation in Elkik's more general principal argument.
4. **Complete approximation.** Lemma1 uses adjugates, torsion separation and Taylor improvement for a principal ideal. Theorem1 inducts on generators of an ideal of definition; Artin–Rees controls the precision lost when lifting a relation divisible by a fixed power of the first generator.
5. **Principal Henselian approximation.** After stabilization, choose a principal smooth open containing the formal generic image. Solve a selected set of equations with Tougeron's lemma; a power of the defining element kills the remaining relations. Torsion separation kills those residual relations when the approximation is sufficiently deep.
6. **Theorem2bis.** Induct on the number of ideal generators, applying the complete theorem in the completion along one generator and then the principal Henselian theorem to return to (A). Nakayama preserves the chosen smooth open under sufficiently high congruence.

These applications refine **SF.4**. They import the pinned Artin–Rees theorem and Tau Ceti's controlled-preimage theorem. The general Henselian smooth-lifting interface coalesces with **PAPER-CLAUSEN-MATHEW-MORROW-21/044 in SF.0**; no second Henselian carrier is proposed. DD.0 remains the owner of the full cotangent complex. Zavyalov25/142 concerns the later algebraization of admissible formal models, and Colmez–Nizioł17/158 consumes approximation in a Galois comparison.

#### What this closes, and what it leaves open

The previously unread original Elkik proof and GR3.2.16 are now read; their required source-specific statements are split out. The key Newton calculation has a full written finite-conormal argument. **G-ELKIK remains open** for the finite-data Noetherian Henselian model reduction in GR5.4.13, the EGA Henselian/étale and completion foundations, and the full-L/naive low comparison. Their formal adapters are also unimplemented.

Two pinned near misses are deliberately not treated as completion of that work. `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete` assumes global formal smoothness, while the approximation target is only generically smooth. `Algebra.Smooth.exists_subalgebra_fg` descends a smooth algebra to a finite base; it does not on its own preserve the required Henselian pair, arbitrary generically smooth presentation, and all finite witnesses.

The Huber publisher-PDF request returned an HTML page, not the book. G-HUBER stays unread; no paywall workaround or theorem reconstruction is counted as a source reading. Other open proof branches in the earlier sections remain unchanged.

#### Source issues and validation

The issue explicitly requires a `sourceIssues` list, including findings mentioned by earlier workers. This continuation therefore copies **E1** unchanged from the dedicated errata file, records **E2–E3** in the supporting GR preprint, and transfers the inherited SGA2 correction as **E4**. None has a new independent verdict.

E2 corrects the finite subideal condition in GR5.4.13 from (t^h\in H) to (t^h\in H+\mathfrak p_a), precisely the condition used later in that proof. The former is too strong: (f=X^2(X-1)) at (a=1) over \(\mathbf Q[[t]]\) is smooth at the selected root but singular at the double root. E3 corrects the completed finite-stage algebra to \(\bar R_\lambda\otimes_{R_\lambda}S_\lambda\) and the final point-ideal coordinate to (X_N-c_N). The latest arXiv download retains the slips. Published-book correction status is unknown. The statements being proved are unchanged.

**Register integration caveat:** `scripts/errata.py` currently does not coalesce matching IDs across the extraction and dedicated errata file. Copying E1 as required by issue5a therefore produces two occurrences of the same finding in the register. `sourceIssuesRegister` identifies the canonical record. Only the three authorized deliverables were edited; the separate errata file and collector require a later authorized integration change.

Validation: `check_paper.py` and the three-file intake check pass. The supplemental audit passed **2,551 structural assertions**, including all **331 dependency edges**, reverse uses, unchanged inherited statuses, exact routes, test kinds and acyclicity. Exact arithmetic passed **6,383 assertions**, covering 1,296 Newton examples over localizations of the integers, 1,200 multivariate Taylor examples, the strict-boundary counterexample, conormal characteristic2 behavior and stabilization rank counts. These finite diagnostics do not prove the general theorems or execute the 126 Lean planning tests.

## Review (REV-PAPER-CESNAVICIUS-19, 23 September 2026)

An independent review by Claude Code, session cc-d67081, for issue
[#1329](https://github.com/CBirkbeck/tauceti-explorer/issues/1329). **Verdict: accept.**

- **Items, statuses and routes:** unchanged. All 15 library citations were read at the
  pinned commits and all say what the citing item claims; 13 planned items name layers that
  exist; 150 missing items are routed exactly once; all 17 source routes accepted. Four
  citations look unresolved against `declarations.tsv` but all four exist — two known index
  defects, and the review isolated the trigger for one of them (a `namespace` whose name is
  on the next line, `FiniteLocallyFree.lean:157`).
- **Mistakes:** all four confirmed, each now carrying a `review` verdict, and a fifth
  (E5) found by the review in the same Gabber–Ramero proof. E2 was checked against the
  extraction's counterexample; E3, E4 and E5 were confirmed on page images, E4 because
  `∈` versus `∉` is a single glyph and the extraction had inherited it without re-reading.
- **Corrections:** run-together numbering (`Theorem4.10`, `Lemma3.1`) repaired in 593
  places, leaving bibliography keys and section marks untouched; the author's copy recorded
  with its hash and a full collation against arXiv v4, which shows no mathematical
  difference and confirms it predates v4.

Full report: `research/blueprint/reviews/REV-PAPER-CESNAVICIUS-19.md`.
