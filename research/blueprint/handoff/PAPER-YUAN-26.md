# Handoff: PAPER-YUAN-26

Issue #1050. Original checkpoint PR #1266: Codex, session `codex-c83e7a`. Second checkpoint: ChatGPT / GPT-6 Astra Pro, session `astra-ao-9c47e2`, 21 September 2026. **Third checkpoint: Claude Code, session `cc-fb70e5`, 23 September 2026.**

**Still a partial paper job**, but the machine result is no longer unchanged and three of the seven "resume in this order" items below are now closed. Current state: 271 items (237 missing, 29 planned, 5 library), **12 routes**, 14 prerequisites, **30 source issues**, **6 gaps**; `check_paper.py` reports ok; every missing item has exactly one route and none is taken twice.

## What the third checkpoint did

1. **Resume-item 2, first half: closed as far as it can be.** The published Annals text is unobtainable — subscription-only, Project Euclid exposes only the abstract. The author's PDF was re-downloaded and its sha256 is **byte-for-byte** the one the first worker recorded, so the homepage serves no newer manuscript; and arXiv:2108.05625's latest version is **v4 of 30 April 2024**, *older* than the August 2024 manuscript, with no journal reference. Recorded as the gap `theorem-4-19-published-wording`. Do not spend more effort here without institutional access.
2. **Resume-item 1, the ledger: applied.** `/262`–`/266` and `/170` were the six intentionally unrouted items; all six are now routed. `/262`–`/266` carry the **corrected** Theorem 4.19 hypothesis (maximal variation over the field of constants `k`) and sit with `/185`–`/189` in the `HeightsRationalPointsAndObstructionsPartII` route; `/170` carries an explicit geometric quotient and is a **source of `ArakelovGeometryAndAbelianHeights` R35.5–R35.6**, the import the second checkpoint recommended. The Theorem 4.19 obstruction was re-verified **in the manuscript itself** (the second checkpoint had checked only arXiv v4) and shown to be a *false* statement, not merely an unproven one, since the canonical height of p. 100 is taken over `k` and so vanishes on constant points. It is now `E1`.
3. **`sourceIssues` written, 30 of them.** The list was empty in both earlier checkpoints. The paper was read in full by four parallel readers (§§1–2, §3, §§4.1–4.4, §§4.5–4.6+Appendix A), each returning a numbering inventory; between them they account for all 44 numbered statements with no gaps, so **statement-level coverage is now verified**. Every candidate was re-checked at its locator by this session, in rendered clips where glyph-level. Two errors, four gaps, twenty-four misprints.
4. **A defect in the inherited routes, fixed.** All four Part II routes carried `"area": "diophantine"`, which is **not an id in `data/galaxies.json`**; `check_paper.py` only tests that the field is non-empty, so it passed silently. Now `arithmeticgeometry`. **Check the other papers' routes for the same thing.**
5. Added the Faltings–Chai prerequisite (the `[FC, Chap. V, Prop. 4.6]` input that `/170` rests on) and six `gaps` entries; rewrote the report's front matter as the reader-facing routing explanation the job asks for, keeping the first two checkpoints' technical record below it and annotating the four passages it superseded.

## Resume in this order

1. **Close the granularity obligation — this is the only thing keeping the status `partial`.** Statement coverage is verified, so what remains is splitting the roughly forty items that still bundle several assertions, and separating the flatness, genericity and base-change steps inside proofs. The first worker's list: `/7`–`/13`, `/23`–`/28`, `/44`, `/69`, `/74`, `/77`, `/79`, `/85`, `/106`, `/115`–`/117`, `/124`–`/127`, `/130`, `/139`–`/141`, `/143`, `/151`–`/154`, `/158`, `/162`, `/190`–`/195`, `/197`, `/200`–`/210`, `/217`–`/219`, `/222`, `/230`, `/233`–`/234`. Also audit the introductory historical results and the uniform Mordell–Lang large-point input. When that is done the status can go to `complete`.
2. **Resume-item 2, second half: `[FC, Chap. V, Prop. 4.6]` is still unread**, and `/170` depends on it. Recover the primary statement: whether it is for one fixed number field or for varying fields of bounded degree, and over which notion of isomorphism the finiteness holds. Web search does not reach the book's text; Chapter V is "Modular Forms and the Minimal Compactification". Gap `fc-v-prop-4-6-unread`.
3. **Resume-item 3, local descent interfaces**, unchanged from the second checkpoint and still open: nonsplit residue-orbit weights, model and resolution compatibility, the general descent comparison, and controlled Laplacian approximation. Keep raw lengths, residue-weighted degrees and geometric base change distinct. Note that `E3` is a new, independent datum here: the paper's own base-change recipe for `δ` on p. 49 divides by `[K′:K]` where it must divide by the ramification index, which its own preceding clause contradicts.
4. **Resume-item 4, imported proof inputs**, unchanged: the Yuan–Zhang theory, YZ1, BLR, the moduli inputs, Bost and Faltings–Moret-Bailly normalizations, Wilms, de Jong, Carney, Gross–Schoen. Gap `imported-proof-inputs-not-audited`.
5. **Resume-item 6, the four Part II briefs** remain provisional pending reconciliation against the packet, decomposition and link inventory. Gap `part-ii-briefs-provisional`. The DY.1 ownership question stays settled as the second checkpoint left it.

## What not to redo

- Do not re-derive the split-reduction unit-versus-logarithmic normalization bridge; the second checkpoint settled it and §3 of the report records it.
- Do not re-search for a newer manuscript or a published PDF (item 1 above).
- Do not re-check the Theorem 4.19 obstruction; it is verified in the primary text and recorded as `E1`, with its `searched` field stating plainly that the typeset Annals wording may differ.
- Do not re-flag the two negatives the readers established: Theorem 1.1/4.7 correctly says non-isotrivial "over `k̄`", and Propositions 4.16 and 4.18 state their base fields correctly.
- Do not re-report lost overlines, hats or bold faces from the PDF text layer as misprints; the readers were warned and this session re-checked every glyph-level candidate in a rendered clip.

## Preserved from the earlier checkpoints

The record below, and the technical sections of the report, are the first two checkpoints' work and should be kept. Original item-id ranges and contributor provenance are unchanged; no id was reused or retired.

## What was inherited

The original worker read the whole 126-page author manuscript dated 21 August 2024, including proofs, appendix and references. Its acquisition hash is `b36f4860cc0f098ef062523e8a5147e8172d1e4e357fc76a63cd7c0d782a813e`. The publication revision date agrees, but the final typeset text was not obtained. Earlier arXiv v4 is useful for overbars but must not silently replace that later edition.

The original worker searched both full pinned source archives, read the five cited substrate declarations, read the complete upstream JacobianChallenge and StableReduction documents, and inspected relevant reviewed audits and links. Those are retained records, not a claim that this continuation repeated all of them. The report preserves the original source hashes and the important mathematical repairs.

## New work completed in this continuation

### 1. Local normalization is now an explicit comparison

Read the report's §3 before revisiting the old normalization warnings.

With `lambda_K=-log|pi_K|=log e_K`, the regular split reduction graph with unit edges and the fixed-absolute-value skeleton differ by multiplication of all lengths by `lambda_K`. Under the scaling map s, if `F(s(x))=lambda_K*f(x)`, then

```text
Delta_log F = s_* Delta_unit f,
||1|| = e_K^(-f) = exp(-F).
```

The report gives the interior-density and vertex-derivative calculation. It follows that the Chern-measure comparison has no extra scalar multiplying model-degree mass. The normalized Green function scales by `lambda_K`, while its probability measure is pushed forward. Absolute-value rescaling and finite extension of the same absolute value are separate operations.

For L/K with ramification e and residue degree f, retain the defectless assumption where `[L:K]=e*f` is used. In the split smooth-disc calculation, raw intersection length `n_L` is normalized by e. Residue-weighted degree `f*n_L` is normalized by the full degree. An unramified extension with f>1 is a negative control against dividing raw length by `[L:K]`. A ramified regular-node base change gives e subedges of logarithmic length `lambda_K/e`.

Primary conventions were checked in Zhang 1993 §1.2 and §4, and selected Zhang 2008 §§3.1–3.2 pages. The 1993 local setup assumes algebraically closed residue field and unit base normalization. This explains why its degree denominator must not be transplanted into an arbitrary-residue-field, raw-length API.

**Still open:** geometric residue-orbit weights for nonsplit reduction, full model/resolution compatibility and the general descent comparison. The disc calculation is not a proof of all of those. Controlled approximation is still required for arbitrary continuous metrics; mere uniform convergence does not control Laplacians.

### 2. A precise geometric Northcott route is available

Read Pazuki, *Theta height and Faltings height*, Theorem 1.1, Corollary 1.3, Definitions 2.1/2.6, and §5.2.1, using page images to confirm the geometric-isomorphism bars. Its theta Northcott statement is about Qbar-isomorphism classes of polarized pairs admitting bounded-degree fields of definition.

For `a=max(h_theta,1)` and `b=max(h_F,1)`, the checked estimate is

```text
|a-b/2| <= C_2(g,r)*log(min(a,b)+2).
```

Hence `h_F<=H` gives the explicit theta bound `a<=B/2+C_2(g,r)*log(B+2)`, with `B=max(H,1)`. The report gives the route from Yuan's normalized admissible self-intersection bound to geometric finiteness via principally polarized Jacobians and Torelli.

**Still open:** match metric normalizations; justify bounded-degree realization of the symmetric polarization line bundle/theta data; verify FC V Proposition 4.6 or an exactly equivalent primary formulation; separately prove any fixed-field twist-finiteness conclusion. Do not turn geometric Northcott into fixed-K isomorphism finiteness by changing the quotient without a proof. `/170` remains unrouted. The Lang–Silverman discussion elsewhere in Pazuki is not used.

### 3. The function-field obstruction was independently rechecked

Read arXiv v4 §1.6 and Theorem 4.19 with proof. For `K=k(t)`, `S=Spec K`, a constant curve of genus greater than one and a constant degree-one class, K-relative variation as printed admits the example, whereas constant points have height zero and are Zariski dense. The report spells out density after base change. The source proof needs bigness over the constant field, not merely variation over K.

This corroborates the existing objection in the earlier arXiv text. **The final typeset theorem is still not read**, so no journal-erratum claim is made. `/184` retains actual bigness over k, `/185`–`/189` remain number-field branches, and `/262`–`/266` remain unrouted source claims. The main uniform theorem `/128` excludes the isotrivial pair in this test and is unaffected by this particular example.

### 4. The suspected dynamics duplication was checked

The full ArithmeticDynamics, TropicalAndBerkovichArithmetic, and ArakelovGeometryAndAbelianHeights proposed documents were read.

DY.1 supplies the scalar canonical-height limit over number fields, not `/47`'s nef adelic bundle over a quasi-projective base. Keep the family bundle in the adelic direction; import the fibrewise scalar uniqueness/comparison statement instead of constructing a second scalar Tate-height API.

TB.1/TB.2/TB.3/TB.6 already supply logarithmic lengths, refinements, graph Laplacians, model metrics and degree weights; GZ.2 supplies the classical pairing. The new normalization comparison connects those owners rather than creating another graph roadmap. R35.5–R35.6 already plans the theta/Faltings comparison used by the geometric Northcott route.

No new routes, IDs or accepted design claims were created. The four original Part II briefs remain provisional.

## Resume in this order

1. **Update the machine extraction from the report ledger.** The report now gives item-level actions for `/47`, `/94`, `/170`, `/184`, `/220`–`/230`, and `/262`–`/266`. The JSON has not yet been edited to split the new normalization/descent obligations. Add genuinely separate adapter items only after checking their existing suppliers; do not relabel general nonsplit descent as proved by the scalar examples.
2. **Finish the two source-statement questions.** Obtain the final published wording of Theorem 4.19, and FC V Proposition 4.6 or an equivalent primary proof. The concrete constant-family obstruction and geometric Northcott route are already recorded; do not restart from vague searches or silently repair the theorem's hypotheses.
3. **Close the remaining local descent interfaces.** Distinguish raw lengths, residue-weighted degrees and geometric base change. Check nonsplit vertices/nodes and model resolution, and use controlled Laplacian approximation. The unit/logarithmic scaling calculation itself is no longer an unresolved guess.
4. **Close imported proof inputs.** Finish exact YZ2 v6 completion, analytification, pairing, volume, dynamics and base-change results; YZ1 Corollary 2.2/Theorem 5.16; BLR Picard descent; DM/LMB/CLM/MFK/van Geemen–Oort/FC moduli inputs; Bost/Faltings–Moret-Bailly normalizations; Wilms delta, de Jong tau, Carney and the original Gross–Schoen construction. The existing prerequisite list is not exhaustive, and selected source statements are not a full audit of their proofs.
5. **Complete granularity.** The original worker flagged further splitting at `/7`–`/13`, `/23`–`/28`, `/44`, `/69`, `/74`, `/77`, `/79`, `/85`, `/106`, `/115`–`/117`, `/124`–`/127`, `/130`, `/139`–`/141`, `/143`, `/151`–`/154`, `/158`, `/162`, `/190`–`/195`, `/197`, `/200`–`/210`, `/217`–`/219`, `/222`, `/230`, `/233`–`/234`. Expand inherited settings and check flatness, genericity and base-change steps inside proofs. Audit introductory historical results and the uniform Mordell–Lang large-point input.
6. **Refresh overlap and design ownership.** The full packet/accepted-decomposition/link inventory still needs reconciliation before activating the four Part II briefs. Recheck generic intersection/grid bounds, relative Picard versus R11.4/A0-extension, and the most natural curve-moduli parent. The DY.1 carrier distinction is now resolved; do not reroute the entire family bundle there. General stacks, abelian schemes, graphs and metrics remain imports.
7. **Validate actual completion, not just syntax.** Preserve visible source gaps. Every missing item must have exactly one justified route before `complete`, and the full paper/prerequisite granularity must be closed. No Lean file belongs to this paper job.

## Validation performed

The real `check_paper.py` CLI passes against the full atlas/proposed-roadmap loader. All eight `test_check_paper.py` tests pass. A custom check confirms 271 unique IDs, valid route references, disjoint missing-item routes and exactly the six unrouted IDs above.

Exact rational scalar checks for `1<=e,f<=6`, `1<=n<=7` pass all 252 normalization cases. All 210 cases with f>1 reject dividing raw length by the full degree. These are elementary regression checks, not instantiated curve examples or Lean proofs. No Lean compilation was run.

The full repository snapshot used for these checks was recovered from Pages workflow run `35638002941`, artifact `10656618031`, commit `2f01d6e7039e8e770477900434aff85f86ea23cc`, verified ZIP SHA-256 `7fe2ced465afb1399367d47934e500bf5005431e881b9b01953c27c934d767f4`. This resolves the oversized audit/atlas reader problem without changing workflows. Use a current artifact if this one expires. It is not a PDF checksum.

New source reads used browser text and screenshots; binary downloads failed. The report explicitly distinguishes inherited acquisition hashes from newly verified reading. Keep that distinction when continuing.
