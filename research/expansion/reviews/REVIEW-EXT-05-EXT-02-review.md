# Independent review REVIEW-EXT-05-EXT-02 — EXT-05 and EXT-02 draft packets

Reviewer: `independent-review-REVIEW-EXT-05-EXT-02`. Date: 2026-09-16.
Scope: the draft packets in `research/expansion/external/EXT-05/` and
`research/expansion/external/EXT-02/`. The reviewer did not write any of them.

Method, applied to every packet below. Each node's statement, hypotheses, proof
steps, acceptance items, source locators and excerpts were compared against the
cited passage of the source. Sources were read from fresh `pdftotext` extractions
of the library PDFs, made in the reviewer's scratch directory
(`scratch/text/`, never in the
repository) with explicit `[[PDFPAGE n]]` markers so that printed-page claims and
the packets' stated page conventions could be checked against the page numbers
actually printed in the text. The SHA-256 recorded in each packet's `sources`
entry was matched against `references/CATALOGUE.json`. Every link was checked for
direction, for the exact place where the consumer's proof uses the supplier's
output, and for existence of both endpoints; every `parentStageId`, coverage
`stageId` and gap `neededBy` was checked against `data/atlas.json` for existence
and owner. Implementation status was left `unchecked` everywhere. No Lean, no
sorries, no tickets. Packet `status` stays `partial` in every case.

## Source provenance

All source PDFs used were already in the supplied library; **nothing had to be
fetched from the public internet**, so no new provenance records were added to any
packet's `sources`. SHA-256 values in the packets match the catalogue records:

| Packet source id | Library file | SHA-256 matches catalogue |
| --- | --- | --- |
| `FS-geometrization` | `references/papers/FarguesScholze_Geometrization.pdf` | yes |
| `BS17-witt-grassmannian` | `references/papers/BhattScholze_WittAffineGrassmannian.pdf` | yes |
| `Keel99-basepoint` | `references/papers/R02_DF_Keel.pdf` | yes |
| `SW20-berkeley` / `ScholzeWeinstein-Berkeley-2020` | `references/papers/ScholzeWeinstein_Berkeley.pdf` | yes |

Page conventions verified against the extractions: Fargues–Scholze printed page =
PDF page (checked at pp. 190, 197, 235); Keel printed page = PDF page + 252
(checked at printed pp. 262–263); Bhatt–Scholze 2017 printed page = PDF page
(checked at pp. 2–3, 32–35).

---

## 1. EXT-05 / GeometricSatakeAndFusion.json

Review status **accepted**. Nodes 23: **17 verified, 6 corrected, 0 unverifiable**.
Links 24: all directions correct, all endpoints are nodes of this packet (there
are no cross-roadmap links, so no supplier-scope question arises). Structure: all
23 `parentStageId` and all 14 coverage `stageId` values exist and are owned by
`GeometricSatakeAndFusion`; coverage accounts for all 14 stages of the roadmap.

### Corrections

1. **`GS0:Witt-geometry/witt-lattice-functor-and-representability`.** Bhatt–Scholze
   Definition 8.1 defines `Gr_{≤λ}` as a functor on `Perf`, which their Definition
   3.2 fixes as the category of **perfect qcqs F_p-schemes** with the v-topology —
   not on perfect `F_p`-algebras, as the packet's statement said. The title's
   equation "Theorem 8.3 (= Theorem 1.1)" was also wrong: Theorem 1.1 is stated for
   `Gr^{Waff,[a,b]}` on perfect **rings** (lattices between `p^aW(R)^n` and
   `p^bW(R)^n`), and the outline says the earlier sections "are exploited to prove
   Theorem 1.1 in §8". Statement rewritten to carry both forms, title corrected, a
   separate source entry added for Theorem 1.1 (printed p. 2), and the hypothesis
   list now records that the translation between the two indexings was not read.
   Proof step 1 (the two constructions of `L`) was re-anchored word for word to the
   read introduction, pp. 2–3.
2. **`GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles`.** Corollary
   VI.3.8 is printed on **p. 207**, not p. 206 — p. 206 ends with the close of the
   VI.3.7 proof. Locator fixed. The source's annotation also names `[GHKR10]`
   alongside `[MV07, Thm 3.2]` and `[Zhu17, Cor. 2.8]`; recorded. Proof step 2 was
   rewritten to follow the printed argument (triviality of `L` on `Gr^Witt_B` from
   the universal filtration of `Ξ`, unique extension of the section across the
   closed union `⋃_{λ'≤λ} S_{λ'}`, valuative criterion) and to name its two unread
   imports.
3. **`GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`.** The printed
   proof's general-`G` step was absent from the proof steps: closed immersion
   `G ↪ GL_n` compatible with torus and Borel, equality of the congruence
   subquotients forced by containment of `L⁺P_µ^-` and `(L⁺U_a)^{≥µ(a)}`, then the
   identification `L⁺G/(L⁺G)_µ ≅ Gr_{G,Div¹,µ}` using **`[SW20, Prop. 20.3.7]`** and
   **`[Sch17a, Lemma 12.5]`**. Step added; both imports recorded as unread.
4. **`GS1/integral-family-comparison`.** The packet asserted that "the proof of
   Corollary VI.6.7 was not printed in the passage read". **It is printed**, on
   p. 215, and is two lines: base change of `RHom` in `S`, plus the equivalence
   between locally constant sheaves with perfect fibres on such an `S` and perfect
   `Λ`-modules. The packet-authored specialization mechanism in the proof steps was
   replaced by the source's actual argument, and the matching GS1 coverage item was
   removed.
5. **`GS4:rational-reductivity/rational-semisimplicity`.** The statement stopped at
   semisimplicity and reductivity; p. 236 also concludes **finite type** (finitely
   many tensor generators, since `A_µ ⋆ A_µ'` contains `A_{µ+µ'}` and `X_*^+` is a
   finitely generated monoid) and **connectedness**. Statement and proof step
   extended, naming `[DM82, Prop. 2.20, Cor. 2.22, Prop. 2.23]` and `[MV07, §7]`.
6. **Locator and transliteration fixes.** Proposition VI.7.4 is printed on **p. 217**,
   not p. 218 (node source and one link). Definition/Proposition VI.9.4 is stated on
   **p. 228** with its proof on p. 229. In `dual-group-identification`, the excerpt
   rendered `Ĝ(Z_ℓ) ⊂ Ĝ(Q_ℓ)` as "G-hat(Z-hat_l) in G-hat(Q-hat_l)"; corrected.
7. **`GS2:correspondences/satake-category-and-fibre-functor`.** Two clauses of the
   statement had no source entry (that `^p j_{µ!}Λ[d_µ]` and `^p Rj_{µ*}Λ[d_µ]` lie
   in `Sat`; that the image of `Sat` is Verdier-duality stable with `D² = id`).
   Propositions VI.7.9 (p. 222) and VI.7.12 (p. 223) added.

### New gap added

"Imported results invoked inside the inspected proofs but not named in any node",
listing nine groups with exact locators: `[dJvdP96, Prop. 3.2.2]` / `[KL15, Prop.
8.2.20]` / `[SW20, Lemma 17.1.8]` (p. 192); `[Sch17a, §27 before Prop. 27.5]`
(p. 194); `[Sch17a, Props. 9.7, 11.23, Lemma 15.6]`, `[Hub94, Prop. 3.8]` (p. 196);
`[SW20, Prop. 20.3.7]`, `[Sch17a, Lemma 12.5]` (p. 199); `[SW20, Lemma 14.2.3]` and
the BS17 v-descent results (p. 206); `[Zhu17, Lemma 2.1]`, `[Gai01, Prop. 1]`,
`[Lus83]`, `[Zhu17, §1.4.2]` (p. 220); `[DM82, Prop. 2.20, Cor. 2.22, Prop. 2.23]`,
`[MV07, §7]` (p. 236); Kodaira's lemma `[Kol96, VI.2.16]` and Keel's own 1.4–1.6,
1.8 with `[Kol95, 8.4]`, `[Ar70, 6.1]` (p. 263); Bhatt–Scholze Lemmas 8.9–8.11,
Prop. 6.1, Lemma 7.9 (pp. 34–35).

### Checked and confirmed, not changed

- The summary's claim that the decomposition theorem enters **exactly once** as a
  proof input: a full-text search of the source finds the phrase at pp. 187, 190,
  219 (all signposts) and p. 220, where it is the actual input inside the proof of
  VI.7.5. Confirmed.
- Proposition IV.1.18 (p. 112) is verbatim the VI.2.4 statement, with the printed
  deferral "We defer the proof to Proposition VI.2.4". Confirmed, so the claimed
  ordering constraint GS0:Schubert-smoothness → Bun_G chart is real.
- Remark VI.2.1's retention of the `π = 0` divisor with `B⁺_dR(C♯) = W_{O_E}(C)`;
  VI.2.3's attribution to `[SW20, Prop. 20.3.6]` and its disjoint-union-over-`π₁(G)`
  index poset; VI.2.8's bound in terms of the weights of the **sum** of the `µ_j`
  on `Lie G`; Bhatt–Scholze Remark 1.4's hypothesis change; Keel 1.8 being only
  sketched; and the `GS4:classical-Satake-comparison` `not_read` verdict, which a
  section-by-section pass over FS Chapter VI confirms (the chapter ends at VI.12).

### Unverifiable items

None. Every node was either verified or corrected against the printed source.

### Supplier questions for the orchestrator

- None arising from this packet: it contains no cross-roadmap links. The four
  reading boundaries it names (Zhu's mixed-characteristic Satake paper, BS17 §§2–7
  and 8.2–8.3, Keel §§1–2, FS IV.6–IV.7) remain open and are correctly recorded as
  gaps rather than as inputs.

---

## 2. EXT-05 / RelativeFarguesFontaine.json

Review status **accepted**. Nodes 24: **18 verified, 6 corrected, 0 unverifiable**.
Links 15: all directions correct; 14 are internal to the packet, 1 is a proposed new
cross-roadmap stage edge (below). Structure: all 24 `parentStageId` and all 11
coverage `stageId` values exist and are owned by `RelativeFarguesFontaine`; coverage
accounts for all 11 stages. Sources: `FS-geometrization`,
`SW20-berkeley`, `BMS18-integral`, `GR02-almost` — SHA-256 of all four matches the
catalogue; SW20 printed page = PDF page − 10 confirmed at printed pp. 38, 46–47,
170–171, 179–181.

### Corrections

1. **`RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness`** — misquoted excerpt.
   The excerpt of the key computation read
   `(R^flat/varpi ⊗_{F_q} O_{E_infty}/pi)`. The printed formula on p. 48 (verified with
   `pdftotext -layout`) is `(R^+/ϖ ⊗_{F_q} O_{E_∞}/π)`. Corrected and extended through
   the BMS18 Lemma 3.21 conclusion. The packet's own proof step already had `R^+`
   correctly, so this was a quoting error only.
2. **`RF1/diamond-formula-and-map-to-base`** — hypothesis 2 asserted that the quotients
   by `(φ^ℤ × id)` and `(id × φ^ℤ)` "are different as v-sheaf quotients". Fargues–Scholze
   assert only that the absolute Frobenius acts trivially **on the topological space**.
   Rewritten to say exactly that and to disclaim the v-sheaf comparison.
3. **`RF1/frobenius-quotient-and-presentation`** — FS prove Proposition II.1.16 with
   "This follows directly from the definitions." The packet's first two proof steps are
   reconstructions; now labelled `PACKET-AUTHORED RECONSTRUCTION`, with the third step
   recording what the source actually prints.
4. **`RF4:vector-bundles/meromorphic-modification-at-a-divisor`** — the SW20 19.1.2
   excerpt silently elided the ambient space from "Recall that `S♯ ↪ S ×̇ Spa Z_p ×_{…} U`
   is a closed Cartier divisor"; restored. Locator narrowed from "pp. 170–171" to
   "p. 170" (the proof ends there; p. 171 begins Lemma 19.1.4).
5. **`RF2:untilts/div1-moduli-and-properness`** — hypothesis 1 (over `Perf_k`,
   `Div¹ = Spd Ĕ/φ^ℤ`) was unsourced; the printed p. 61 sentence was added as a source
   entry.
6. **`RF2:untilts/BdR-completion-and-filtration`** — the complete-DVR clause was
   supported only by the p. 193 "product of complete discrete valuation rings" remark;
   the explicit `d = 1` statement on printed p. 196 was added. The generator-independence
   clause is a packet-authored inference and is now labelled as such.

### Cross-roadmap link reviewed: `FarguesFontaineDiamonds:F4 → RelativeFarguesFontaine:RF2:untilts`

This is the packet's own proposed new edge. Reading F4's atlas description confirms a
real dependency and not shared vocabulary: F4 says it owns "the fixed-field case of
FS II.1.4 … the maximum/annulus boundary estimate to obtain the lower bound for
multiplication by the primitive generator. … These analytic estimates are owned here."
RF2:untilts needs exactly that estimate, and FS's own proof licenses the reduction
("Note that this question immediately reduces to the case that `S` is a geometric
point", p. 50).

**But F4's stated scope does not cover everything the consumer needs.** F4 is written
over `ℚ_p` ("maps `S → Spd ℚ_p`", "marked untilts of `S` over `ℚ_p`") and for a fixed
perfectoid field `F`. The ramified relative assembly used in RF2:untilts —
`ξ = π − a[ϖ]` over `W_{O_E}(R^+)`, the `|[ϖ]| = 1/q` normalization of the spectral
norm, and the passage from the geometric-point estimate to a general affinoid
perfectoid `S` — is not in F4's scope. The link was **annotated** rather than removed
(the coefficient-independent one-variable maximum-modulus/Shilov statement genuinely is
F4's), and a **new gap** records the missing supplier for the ramified relative step.
Atlas state: F4's only listed consumer is `RelativeFarguesFontaine:RF3`, and
RF2:untilts' `requires` does not contain F4, so integrating this packet adds a stage
edge. A reachability check over `stageEdges` confirms **no cycle** is created.

### Checked and confirmed, not changed

- The packet's gap about **`[GR03, Proposition 5.4.21]`** was independently verified: in
  the library copy (arXiv:math/0201175v3), Proposition 5.4.21 (PDF p. 121) is the
  henselian-approximation density statement "`X(R[t^{-1}]) → X(R^∧[t^{-1}])` has dense
  image", not a torsor statement. The edition mismatch the packet flags is real.
- `[Far20b]`'s absence from the library re-checked against `CATALOGUE.json`.
- Verbatim at the cited pages: the Shilov-boundary estimate `|ξa| ≥ q^{-n}|a|` with the
  `|[ϖ]| = 1/q` normalization; the split-injectivity route to sheafiness; the product
  Cartier equation with v-descent of line bundles and the affineness scope (cases (i),
  (ii) global, case (iii) only local in the analytic topology); Remark VI.1.3's deferral
  to `[Far20b]`; the `O(n) = E(Ĕ, π^{-n}σ)` sign convention cross-checked against
  `H⁰(X_S,O(1)) = H⁰(Y_S,O)^{φ=π}`; the ampleness-free construction of `X_S → X_S^alg`;
  SW20 Lemma 5.2.9's two subtleties; SW20 Theorem 19.5.2's smoothness and
  sousperfectoidness hypotheses.

### Unverifiable items

None. Every node was verified or corrected against the printed source.

### Supplier questions for the orchestrator

1. **F4 scope.** Accept `F4 → RF2:untilts` as an analytic-estimate-only edge with the
   recorded limitation, or widen F4's stage text from `ℚ_p` to a general nonarchimedean
   local coefficient field `E`, or add the ramified relative estimate as an explicit
   obligation of RF2:untilts. (New stage edge either way; acyclic.)
2. **RF roadmap scope.** The packet flags that FS II.1.6–II.1.14 and II.1.22 (classical
   points of `Y_C`/`X_C`) correspond to no RelativeFarguesFontaine stage text and are
   decomposed in the `VectorBundlesAndIsocrystals` packet instead. Confirm that placement
   or extend an RF stage.

---

## 3. EXT-05 / VStackSheavesAndLisseCategories.json

Review status **accepted**. Nodes 21: **17 verified, 4 corrected, 0 unverifiable**.
Links 20 → **21** (one added by the reviewer, below); all directions correct, every
endpoint is a node of this packet, so no supplier-stage scope question arises.
Structure: all 21 `parentStageId` and all 6 coverage `stageId` values exist and are
owned by `VStackSheavesAndLisseCategories`; coverage accounts for all 6 stages.
Sources: `FS-geometrization`, `Scholze-condensed` — SHA-256 of both matches the
catalogue; Condensed printed page = PDF page confirmed at pp. 33, 35–36.

### Corrections

1. **`VS3/lisse-category-definition`** — hypothesis 4 said the existence of the right
   adjoint "is not purely formal". Fargues–Scholze write the opposite on p. 269: "The
   existence of the right adjoint is formal", and "The description of the kernel is
   formal". What is not formal is the ambient set-up — `D_■(X,Λ)` is not presentable but
   a large filtered colimit of presentable `D_■(X_κ,Λ)`, and one must check
   `D_lis(X,Λ) ⊂ D_■(X_κ,Λ)` for some κ before gluing. Hypothesis and matching proof step
   rewritten to the printed text.
2. **`VS2/solid-abelian-groups`** — the Remark 5.2 excerpt stopped one sentence early,
   quoting only Scholze's doubt ("it is not clear that conversely …") and omitting his
   own resolution, "However, Theorem 5.8 will show that these implications are both
   true." Restored.
3. **`VS5/verdier-biduality-and-reflexivity`** — the Theorem V.6.2 excerpt began
   mid-sentence ("is reflexive as a complex of admissible …"); replaced by the complete
   statement. Added the p. 182 remark that `Bun_G`, being a cohomologically smooth Artin
   stack of dimension 0, has a dualizing complex locally isomorphic to `Λ[0]`, and that
   `D_U` may be replaced by `Λ` in the reflexivity definition.
4. **`VS5/bernstein-zelevinsky-duality`** — the packet recorded that only the statement,
   footnotes and first lines of the proof had been read. The **full proof is printed on
   p. 181**; it was read in this review and the proof steps were replaced by it
   (Haar-measure normalization; the generators `Rg_{K!}Λ`; the identification of
   `π_♮(A ⊗ B)` with `(i_b^* B)^K` via Corollary V.4.4; the involutivity argument; the
   regular-representation comparison). The node's last clause — concentration on an open
   substack, and the comparison with the classical involution for **basic** `b` — is on
   p. 181, not p. 180, and had no source entry; one was added.

### Link added by the reviewer

`VS0/partial-compactly-supported-vanishing → VS5/bernstein-zelevinsky-duality`. The
involutivity half of Theorem V.5.1 invokes Theorem IV.5.3 a **second** time — FS reduce
`π_♮(A^b_K ⊗ Rj_*B') = 0` to `RΓ_c(M̃_b/K, Rj_{K*}A') = 0` and write "this follows from
Theorem IV.5.3, applied as before with `X = M̃_b^∘` and `S = Spa k((t))`". The packet's
graph recorded only the Proposition V.4.2 consumption.

### Checked and confirmed, not changed

Definition IV.1.1 with Remarks IV.1.2/IV.1.3 (the "probably unwanted very mild
separatedness condition"; `Bun_G` and `[*/G(E)]` not quasiseparated); the explicit
statement that FS do **not** build a full six-functor formalism for stacky maps and
Remark IV.1.14's warning that `Rg^!(Rf^!Λ) = R(f∘g)^!Λ` is not known in general;
Definition IV.2.1(b) with FS's reason for adding perfect-constructibility ("there are no
specializations from `Gr_{G,µ}` into `Gr_{G,≤µ} \ Gr_{G,µ}`"); Proposition IV.2.13's
spatiality and bounded-cohomological-dimension hypotheses and the `[Sch17a, 23.12(ii)]`,
`[Sch17a, 20.17]` imports in its proof; Theorem IV.2.23(iii), Definition IV.2.31,
Propositions IV.2.32/IV.2.33; Theorem IV.4.2 with FS's own "we are unable to prove a
direct relation of this sort"; Lemma IV.5.1, Definition IV.5.2, Theorem IV.5.3,
Remark IV.5.4 and **the whole chain of reductions in the IV.5.3 proof, pp. 153–155** —
the packet's five proof steps follow it accurately, including the profinite-set argument
on p. 155 that a single map `k((u)) → L` suffices; Theorem V.1.1; Propositions V.2.1,
V.2.2, Corollary V.2.3; Theorem V.4.1 (bottom of p. 177) and Proposition V.4.2;
Theorem V.6.1; Theorem V.7.1 and Proposition V.7.2; Definition VII.1.1 and both
VII-introduction warnings; Definition VII.6.1 with its "not … locally constant sheaves"
disclaimer; Propositions VII.6.4–VII.6.6; Proposition VII.7.1's proof.

### Unverifiable items

None.

### Supplier questions for the orchestrator

None from this packet — it has no cross-roadmap links. Its recorded reading boundaries
(FS IV.3, the body of IV.4, IV.6, IV.7, V.3, VII.2–VII.5, and the proof of Condensed
Theorem 5.8) are correctly held as gaps rather than as inputs.

---

## 4. EXT-05 / VectorBundlesAndIsocrystals.json

Review status **accepted**. Nodes 23: **19 verified, 4 corrected, 0 unverifiable**.
Links 23: all directions correct; every endpoint is a node of this packet, so no
supplier-stage scope question arises. Structure: all 23 `parentStageId` and all 10
coverage `stageId` values exist and are owned by `VectorBundlesAndIsocrystals`; coverage
accounts for all 10 stages. Sources: `FS-geometrization`, `FF18-courbes`, `SW13-moduli`
— SHA-256 of all three matches the catalogue. Page conventions verified: FF18 printed =
PDF − 10 (checked at printed pp. 26, 152, 213–214, 286–288); SW13 printed = PDF page
(checked at pp. 3, 22, 29).

### Corrections

1. **`VB1/degree-rank-slope-and-HN-formalism`** — locator `pp. 214` normalized to
   `p. 214`. More substantively, a source entry for **Théorèmes 5.5.2 and 5.5.3
   (printed p. 213)** was added: that is where Fargues–Fontaine actually fix the polygon
   convention, and it is **not** the one Fargues–Scholze use (see below).
2. **`VB0/endomorphism-division-algebra`** — the hypothesis glossing `E_h` as the
   degree-`h` unramified extension had no anchor; Definition 8.2.7 uses `E_h` without
   restating it. The defining sentence (printed p. 152, "`E_h = W_{O_E}(F_{q^h})`
   l'extension non-ramifiée de degré h de E associée") was added as a source entry.
3. **`VB3:positive-basic-examples/lubin-tate-universal-cover`** — the excerpt from the
   proof of Proposition II.2.2 stopped at "gives the desired …". The displayed identity
   `B^{φ=π}_{R,[1,∞]} = Hom_{O_E}(E/O_E, G(R^{♯+}/π))[1/π] = G̃(R^{♯+})` and the following
   sentence were restored, so that the compression the packet flags is visible in the
   excerpt itself.
4. **HN-convention gap sharpened.** With exact locators, and a third normalization found
   during review:
   - FS p. 74: HN polygon = **convex hull** of `(i, d_i)`, first coordinate the **rank**.
   - FF18 p. 213 (Thm 5.5.2, 5.5.3): `HN(X)` = "l'unique polygone **concave**" and
     "l'enveloppe **concave** des points `(deg(X'), rg(X'))`" — coordinates
     **(degree, rank)**, concave.
   - Colmez's preface p. 26 (§2.5.3, Prop. 2.36) states Dieudonné–Manin with the block
     `φ(e_h) = π^d e_1`, whereas FF18 §8.2 (p. 287) uses `φ(e_h) = π^{-d} e_1`.

   So: an axis swap, a convex/concave flip, and a block-sign flip, on top of `E(−)`
   reversing slopes. Neither source reconciles them. This is a live normalization risk
   for any consumer comparing an isocrystal Newton polygon with a bundle HN polygon.

### Checked and confirmed, not changed

The packet's judgement that **Fargues–Scholze compress the step from `[SW13, Theorem A]`
to the explicit `B^{φ=π}` identification** is correct: Theorem A (read at printed p. 3)
is a full-faithfulness statement about the Dieudonné module functor over f-semiperfect
rings, and no intermediate argument is printed in the proof of Proposition II.2.2. The
packet's Colmez-preface claim (Dieudonné–Manin appears only as a "Rappelons l'énoncé",
over `Q̆_p`, without proof) was independently verified at printed p. 26.

Verbatim at the cited pages: FF18 Definition 8.2.5 with its "abus de notation" remark,
the standard block, Proposition 8.2.6, Definition 8.2.7, Proposition 8.2.8 with its full
proof, the 8.2.3 scalar-extension adjunction; FS Propositions II.2.1, II.2.5 (all four
parts, with "for all affinoid S" in (iii)), Theorem II.2.6, Proposition II.2.7,
Propositions II.2.9–II.2.13, Theorem II.2.14 with its full induction, Lemma II.2.15 with
footnote 5, Proposition II.2.16, Lemma II.2.17, Theorem II.2.19 with proof, Corollary
II.2.20, Propositions II.3.1, II.3.5, II.3.6, II.3.7, II.1.11 and II.1.22 with its
footnote; SW13 Theorem A, Proposition 3.1.3(iii) and Lemma 3.5.1.

### Unverifiable items

None.

### Supplier questions for the orchestrator

1. **Fix one HN/slope convention in the roadmap text** and record the translation to the
   other two (FF18's concave `(deg, rg)` polygon; FS's convex `(rank, deg)` polygon;
   the two block normalizations for Dieudonné–Manin). Every downstream comparison of a
   Newton polygon with an HN polygon depends on this.
2. **Brauer invariant of `D_λ`.** The VB0 stage text makes `inv(D_λ)` an explicit
   obligation; nothing in the read sources computes it. Decide whether to source it from
   the campaign's own local-field/Brauer material or to read Serre, *Corps locaux*.

---

## 5. EXT-02 / AdicCoefficientsAndComparisons.json

Review status **accepted**. Nodes 14: **11 verified, 3 corrected, 0 unverifiable**.
Links 20; coverage 7/7 stages; all 14 `parentStageId` values exist and are owned by
`AdicCoefficientsAndComparisons`. Sources: `Scholze-EtCohDiamonds-2026-04-14`,
`deJong-Alterations-1996`, `BhattScholze-ProEtale-2015`, `Huber-EtaleCohomology-1996` —
SHA-256 of each matches the catalogue. Page conventions verified: EtCohDiamonds printed =
PDF page (pp. 161–167); **de Jong printed = PDF + 49** (checked at printed pp. 65–67,
78–79, 82–83); **Huber printed = PDF − 10** (checked at printed pp. 228, 324).

### Link endpoints — cross-packet references

Of the 20 links, 15 are internal. **Five point from nodes of sibling packets in the same
EXT-02 job**, not from atlas stage ids:

| Supplier node | Packet | Supplies |
| --- | --- | --- |
| `ClassicalAdicEtaleCohomology:H5/proper-comparison-3-7-2` | `ClassicalAdicEtaleCohomology.json` | Huber Thm 3.7.2, used in the proofs of 27.4 and 27.5 |
| `ClassicalAdicEtaleCohomology:H5/comparison-over-nonarchimedean-fields-3-8-1` | same | Huber Thm 3.8.1, used at the end of 27.2 |
| `AdicEtaleGeometry:A4/diamond-of-analytic-adic-space-and-etale-site-15-6` | `AdicEtaleGeometry.json` | ECD Lemma 15.6, used in 27.5 and for the rigid-space identification in 27.2 |

All three node ids **were checked and do exist**, and each supplier node's statement does
cover what the consumer's proof uses. Consequence for integration: these three packets
have to be promoted together, or the links re-pointed at stage ids.

### Corrections

1. **`L5/de-jong-6-5-strictly-semistable-alteration`** — de Jong **2.16** (the definition
   of strictly semi-stable over a trait) is on printed **p. 59**, not p. 58 (PDF p. 10;
   printed = PDF + 49; item 2.15 opens p. 59). Locator fixed.
2. **Link `…3-8-1 → L3/full-faithfulness-27-2`** — its reason claimed both Huber 3.8.1
   **and** Huber 6.1.1 ("H5's finite-dimensionality obligation"). The named supplier node
   states only Theorem 3.8.1, and `ClassicalAdicEtaleCohomology`'s H5 stage has exactly
   two nodes (3.7.2 and 3.8.1) — **none for 6.1.1**. The reason was rewritten to supply
   3.8.1 only, pointing at the packet's own already-recorded 6.1.1 gap, and the Huber
   locator now states the split explicitly (3.8.1 printed p. 228 supplied; 6.1.1 printed
   p. 324 not supplied).
3. **`L3/full-faithfulness-27-2`** — the packet attributes the identification of
   `X_C^◇` with the diamond of the rigid space to **Lemma 15.6**. Scholze names no lemma
   at that point (printed p. 164): he writes only "by the identification of `X_C^♢` with
   the diamond associated to the rigid space to `C` associated to `X_C`". A hypothesis
   recording that this is the packet's inference was added.

### Checked and confirmed, not changed

The whole of ECD §26 and §27 was read line by line and the packet's long reconstruction
of the proof of 27.2 follows the printed argument accurately — the reduction to
`Spec F̄_p[X_i^{1/p^∞}]`, Theorem 19.5, the exhaustion by balls `X_{C,(n_i)}`, the
automorphisms `t ↦ t^n`, `[Hub96, Prop. 6.1.1]`, overconvergence, and the closing
`[Hub96, Thm. 3.8.1]`. Likewise 27.3–27.7, including the `T = {x ≠ 0} ⊂ Spa O[[x]]` test
space, and the computations 27.6 leaves unwritten (which the packet holds as a gap).
Bhatt–Scholze Definition 3.4.1 and Lemma 3.5.7(5) were read and match.

On de Jong: the numdam OCR is genuinely poor (displays are garbled), and the packet's own
annotation "(OCR of the display cleaned)" on the Theorem 4.1 excerpt is accurate and is
the right disclosure — the surrounding prose matches at printed p. 66.

### Unverifiable items

None.

### Supplier questions for the orchestrator

1. **Promote `AdicCoefficientsAndComparisons`, `ClassicalAdicEtaleCohomology` and
   `AdicEtaleGeometry` together**, or re-point the five cross-packet links at stage ids.
   As written they are node→node references across packets in one job, which the protocol's
   packet format does not itself provide for.
2. **Huber Proposition 6.1.1 has no owner.** It is a named input to the proof of
   ECD 27.2 but no node in `ClassicalAdicEtaleCohomology`'s H5 covers it. Decide whether
   H5 should gain a 6.1.1 node or whether the finiteness input belongs elsewhere.

---

## 6. EXT-02 / AdicEtaleGeometry.json

Review status **accepted**. Nodes 10: **10 verified, 0 corrected, 0 unverifiable**.
Links 16; coverage 5/5 stages; all 10 `parentStageId` values exist and are owned by
`AdicEtaleGeometry`. Sources: `Huber-EtaleCohomology-1996`, `Scholze-pAdicHodge-2013`,
`Scholze-pAdicHodge-Erratum`, `Scholze-EtCohDiamonds-2026-04-14` — SHA-256 of each
matches the catalogue. **Huber printed page = PDF − 10**, confirmed at printed pp. 47, 48,
61, 79, 87, 108.

### Link endpoints

Ten links have as **source** a node of `AdicSpacesPartII.json`, the sibling packet in this
job; all ten ids were checked and exist there. One link targets the atlas stage
`DiamondsAndVStacks:D6` — see the correction below.

### Correction (structural, not mathematical)

**The link into `DiamondsAndVStacks:D6` was re-pointed.** It previously ran from the node
that decomposes ECD Definition 15.5 and Lemma 15.6. But D6's own atlas description charges
D6 with proving exactly those — "Using A4, prove ECD 15.2–15.4 … **Prove ECD Lemma 15.6
in full**" — while A4's description confines A4 to "the étale-category comparison needed
in ECD 15.3–15.4". As written, the edge asserted that A4 supplies D6 with the statement D6
is charged to prove. The source is now
`A4/spd-of-tate-huber-pair-and-perfectoid-torsor`, which is what A4 genuinely supplies:
the finite-étale `G_i`-torsor tower, the perfectoid uniform completion `Â_∞`, the
universally open qcqs quasi-pro-étale presentation, and `|Spd(A,A⁺)| = |Spa(A,A⁺)|`.

A **new gap** records the ownership question and its knock-on effect: the
`AdicCoefficientsAndComparisons` packet carries **two links whose source is the 15.6
node**, so if that node is re-parented to D6 those two links must be re-pointed too.
No mathematical defect is involved — ECD Lemma 15.6 and its proof were verified verbatim
at printed p. 91. The packet itself already flagged the ownership in the node's title and
closing sentence; the gap makes it an explicit orchestrator decision.

### Checked and confirmed

**The erratum handling is exact.** Both items of Scholze's erratum were read at p. 1, and
the packet's statement reproduces them precisely: the transfinite-composition restriction
on covers, the counterexample to Proposition 3.7(i) via Ribes–Zalesskii Example 5.6.9,
"for countable limits, the definitions are unchanged", "we do not change the category
`X_proét` … only the class of covers gets restricted", and the deletion of Proposition 3.8
and the last sentence of Proposition 3.13.

Also verbatim at the cited pages: Huber Proposition 1.2.2 (both cases) and the `[Hu, 3.5]`
step of its proof; (1.4.2); Propositions 1.6.7, 1.6.8 (including (c) and (d)), Corollary
1.6.10, Proposition 1.7.5, Corollary 1.3.9; the Chapter 2 introduction's
conservative-fibre-functor and algebraically-closed-affinoid-field statements — the node
correctly keeps higher-rank plus rings. ECD Theorem 6.1 (i)–(iii) with its
`[Fal02]`/`[KL15]`/`[Sch12]` attributions, Definition 6.2, Proposition 6.4 (o)–(iii) with
proof and the (iv) sketch, Lemmas 15.1–15.3 (with the explicit equations
`x^{p^n} − ϖ_0 x = ϖ_0` and `x^p − ϖ^p x − f`), Proposition 15.4, Definition 15.5 and
Lemma 15.6 with proof.

### Unverifiable items

None.

### Supplier questions for the orchestrator

1. **Re-parent or keep?** `A4/diamond-of-analytic-adic-space-and-etale-site-15-6` decomposes
   a D6-owned statement under an A4 parent. Either re-parent it to `DiamondsAndVStacks:D6`
   (which moves it out of this packet, since a packet concerns one roadmap) or keep it as
   a recorded endpoint. If it moves, the two `AdicCoefficientsAndComparisons` links that
   consume it must be re-pointed at D6.
2. **Stage-edge consequence.** `data/atlas.json` already lists
   `AdicCoefficientsAndComparisons:L1` among D6's consumers, so D6 → L1 exists; what does
   not exist is D6 → L3 / D6 → L4, which the re-pointing in (1) would require.

---

## 7. EXT-02 / AdicSpacesPartII.json

Review status **accepted**. Nodes 24: **24 verified, 0 corrected, 0 unverifiable**.
Links 14 (13 internal, 1 cross-roadmap); coverage 8/8 stages; all 24 `parentStageId`
values exist and are owned by `AdicSpacesPartII`.

### Source fetched

**Conrad, "Modular curves and rigid-analytic spaces", is not in the supplied library.**
It was re-fetched during this review into the scratch directory (never into the
repository):

| Field | Value |
| --- | --- |
| URL | `https://math.stanford.edu/~conrad/papers/genpaper.pdf` |
| Retrieved | 2026-09-16 |
| SHA-256 | `ab6daecb7fa0679170fdd6b92021f206a9c990f621fc246eb146c3220d64e2bc` |
| Size | 584 100 bytes, 52 PDF pages |

The hash **matches byte for byte** the value the packet already recorded, so the packet's
provenance was correct; the `sources` entry was annotated with the verification.

The other four sources are in the library and their SHA-256 values match
`CATALOGUE.json`. Page conventions, each checked against printed page numbers in the
extractions: Huber printed = PDF − 10; Conrad printed = PDF page; Kedlaya–Liu cited by PDF
page of the supplied copy; Berkeley printed = PDF − 10; **BHW printed = PDF + 1707**
(printed 1724 = PDF 17).

### No corrections needed

**Every one of the 24 nodes' locators resolved to the claimed printed page.** Spot-checked
individually: Huber 1.3.1/1.3.3 (p. 51), 1.3.9 (p. 54), 1.3.17 (p. 59), 1.6.5 (p. 78),
1.6.10 (p. 80), 1.7.5 (p. 87), 1.5.2 (p. 66), 1.2.3 (p. 49), 1.9.6 (p. 98), (1.1.11)
(p. 42), 2.1.4 (p. 111), §3.5 opening (p. 201); Conrad 3.1.1/3.1.5 (p. 16), 3.1.6 (p. 17),
4.1.1 (p. 26) + proof (p. 27), A.1.1 (p. 36), A.1.2/A.1.3 (p. 37), A.1.4/A.1.5 (p. 38),
B.3.3/B.3.4 (p. 50); Kedlaya–Liu 2.4.23 (p. 46), 2.4.24 (p. 47), 2.5.20 (pp. 51–52),
2.7.7 (p. 58), 2.8.10 (p. 62); Berkeley 6.3.1/6.3.3 (p. 47), 6.3.4 (p. 48); BHW 3.2/3.3/3.4
(p. 1724), 3.5 (p. 1725).

Two wording observations, left in place:
- The BHW Corollary 3.4 excerpt normalizes the source's "a rigid space smooth over a
  perfectoid extension **of** `L′/L`" to "over a perfectoid extension `L′/L`". The
  source's phrase is itself a slip; the packet's reading is the intended one.
- The Huber excerpts come from a scan whose **formula OCR is unreliable**, which the
  packet's `edition` field states explicitly. Every excerpt checked here is prose that
  survives the OCR intact.

### Cross-roadmap link reviewed

`AdicSpacesPartII:R2/generic-fibre-functor-d → ClassicalAdicEtaleCohomology:H1:formal-adic-comparison`.
Direction and scope checked by reading the consumer's atlas description: it says "For a
formal scheme of type (S) in Hub96 §1.9, construct the specialization morphism
`λ_X : d(X)_et → X_et`", and Huber's §3.5 opens (printed p. 201) with "In (1.9.1) we
associated with every formal scheme X of type (S) an analytic adic space `d(X)`. In this
paragraph we study the relation between the étale cohomology of X and the étale cohomology
of `d(X)` induced by the morphism of sites `λ_X`". The consumer genuinely uses the
supplier's output (the functor `d` and the carrier `d(X)`) and constructs `λ_X` itself —
a real dependency, not shared vocabulary.

**Integration note:** `H1:formal-adic-comparison`'s atlas `requires` are
`['AdicSpacesPartII:F0', 'ClassicalAdicEtaleCohomology:H1:henselian']`, so this is a **new
stage edge** `R2 → H1:formal-adic-comparison`. A reachability check over `stageEdges`
confirms it creates **no cycle**.

### Unverifiable items

None.

### Supplier questions for the orchestrator

1. Accept the new stage edge `R2 → ClassicalAdicEtaleCohomology:H1:formal-adic-comparison`
   (acyclic), or route the generic-fibre functor through `AdicSpacesPartII:F0`, which is
   what that stage currently requires.
2. **Conrad is not in the library.** The packet's hash is right and the paper is freely
   available from the author's site; consider adding it to `CATALOGUE.json` so future
   workers do not have to re-fetch it.

---

## 8. EXT-02 / ClassicalAdicEtaleCohomology.json

Review status **accepted**. Nodes 18: **15 verified, 3 corrected, 0 unverifiable**.
Links 19 (15 internal, 4 from `AdicSpacesPartII.json` nodes — all four ids checked and
present); coverage 10/10 stages; all 18 `parentStageId` values exist and are owned by
`ClassicalAdicEtaleCohomology`. Single source: Huber 1996, SHA-256 matches the catalogue.
**Printed page = PDF − 10**, re-checked throughout.

Every locator resolved: 2.4.2 (p. 125), 2.4.6 (p. 129), 2.6.1 (p. 138), §3.1 opening
(p. 163), 3.1.3 (p. 164), 3.1.6 (p. 166), 3.1.8 (p. 167), 3.1.12 (foot of p. 169 → p. 170,
where the quoted sentence sits), 3.1.13.iii (p. 171), proof of 3.1.12(3) (p. 172), 3.2.1
(p. 174), 3.2.5 (pp. 178–179), 3.2.10 (p. 180), 3.2.11 (p. 181), 3.3.3 (p. 184), §3.4
(p. 193), §3.5 opening (p. 201), 3.5.1 (p. 202), (3.5.3)/(3.5.5) (pp. 203–204), 3.5.6
(p. 204), 3.5.8 (p. 205), 3.5.9–3.5.11 (p. 206), (3.5.12) (p. 207), 3.5.13 (p. 208),
3.5.14–3.5.15 (p. 209), 3.5.16–3.5.17 (p. 210), 3.6.1 (p. 211), step (IV) (p. 213), step
(IX) (p. 219), 3.7.2 (pp. 226–227), 3.7.3 (p. 227), 3.8.1 (p. 228), 3.8.2 proof (p. 229).
**No locator error.**

### The packet's own OCR gap — resolved

The packet flagged that "the displays of 3.5.8.ii, 3.5.11(i),(ii), 3.5.13(*), 3.5.14
(partly), 3.5.16 and 3.5.17 are absent from the OCR text", recorded reconstructions from
the proofs, and asked for the pages to be rendered before promotion. **That was done in
this review**: printed pages 205, 206, 208, 209 and 210 were rendered at 150 dpi with
`pdftoppm` into the scratch directory (never into the repository) and read as images.

**Every reconstruction is correct as written**: 3.5.8(i)/(ii), 3.5.9, 3.5.10, 3.5.13(*),
3.5.14, 3.5.15, 3.5.16. The gap was rewritten to record the resolution; only §3.6's
nine-step proof (pp. 211–219) remains unrendered.

### Corrections (all three found in the page images)

1. **`…/stalks-of-higher-direct-images-lambda`** — Theorem 3.5.8 distinguishes
   `F'_∞ := d(f)*(F)` on `d(Y_∞^∧, f^{-1}(L))` from `F_∞`, its **preimage** on
   `d(Y_∞^∧, {z})`. The packet used one symbol for both. Also the index category is
   `ȳ`-pointed, not `y`-pointed.
2. **`…/restriction-and-extension-by-zero-3-5-11`** — the packet rendered clause (ii) as
   `j_! ∘ R⁺λ'_* → R⁺λ_* ∘ d(i)_!` "(with j = i the open inclusion)". The printed
   statement uses the **same morphism `i`** throughout: `i_! ∘ R⁺λ'_* → R⁺λ_* ∘ d(i)_!`.
   Rewritten to the printed form, with both functor categories restored.
3. **`…/vanishing-cycles-comparison-3-5-17`** — the reconstruction had
   `R⁺Γ(X_s̄, RΨ_η(K))`. The printed display is `R⁺Γ(Ȳ, c*K) = R⁺Γ(X_s, RΨ_η K)` — the
   closed fibre itself, not a geometric fibre; the residue field is already assumed
   separably algebraically closed. Fixed. **The packet's substantive point survives and is
   confirmed**: the object compared is the nearby-cycle complex `RΨ`, not the cone `RΦ`,
   exactly as the stage text demands.

### Cross-packet links

Four links have as source a node of `AdicSpacesPartII.json`; in each case the consumer's
printed proof does use the supplier's output — 1.9.1's functor `d` and 1.9.4's `σ` for
`λ_X` and for `a`; 1.7.3 for the étaleness of `d(f)` in 3.5.1.i; 1.9.5's `φ_Z` for the
natural transformation in 3.5.13.i; 1.2.7's scheme-times-adic fibre product for `X^ad` in
3.7.1. Note one of these **duplicates, at node level, the stage-level edge** the
`AdicSpacesPartII` packet proposes into `H1:formal-adic-comparison`.

### Unverifiable items

None.

### Supplier questions for the orchestrator

1. **Duplicate edge.** `AdicSpacesPartII:R2/generic-fibre-functor-d` appears both as a
   stage-level edge into `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison` (in the
   `AdicSpacesPartII` packet) and as a node-level edge into
   `…/specialization-morphism-of-sites-lambda` (here). Keep one.
2. **Huber 6.1.1 still has no node** in H5 — see §5's question 2; it is a named input to
   ECD 27.2 in the `AdicCoefficientsAndComparisons` packet.

---

## 9. EXT-05 / HeckeStacksAndLocalShtukas.json *(additional packet found in the job directory)*

Review status **accepted**. Nodes 13: **12 verified, 1 corrected, 0 unverifiable**.
Links 13, all internal; coverage 5/5 stages; all `parentStageId` values exist and are owned
by `HeckeStacksAndLocalShtukas`. Sources `FS-geometrization`, `SW20-berkeley` — SHA-256
both match the catalogue.

### Corrections (all in `HS4/isogeny-product-and-weil-restriction-diagrams`)

1. **Theorem IX.6.1 is printed on p. 330, not p. 328.** Section IX.6 opens on p. 330; the
   preceding page ends the proof of the Bernstein–Zelevinsky compatibility.
2. **Proposition IX.6.3 is printed on p. 331, not p. 329.**
3. The node statement's middle clause (`G = G_1 × G_2`) had **no source entry**;
   Proposition IX.6.2 (p. 331) was added. Its printed display repeats
   `Z^geom(G_1,Λ)` where the second factor should be `Z^geom(G_2,Λ)`; the excerpt
   reproduces the source as printed and says so.

Both excerpts matched the printed text verbatim — only the page numbers were wrong.

### Checked and confirmed

The packet's two central distinctions are exactly what the source says. FS write at
printed p. 321 that the monoidal structure exists at the ∞-categorical level because the
solid convolution "makes use only of pullback … We would have to work harder to obtain
this structure when explicitly using lower-`!` functors" — so the packet's insistence on
`p_{2♮}` rather than a naive lower-shriek is source-borne, not stylistic. And the Weil
action really is a map of **condensed animated groups** (Proposition IX.1.1 and the
enrichment discussion, p. 320), with finite-set functoriality as coCartesian-fibration
functoriality (Theorem IX.0.1 (ii)–(iii), p. 318).

Also verbatim: Proposition IX.2.1 with its Demazure-resolution kernel (p. 322);
Theorem IX.2.2 with proof and Corollary IX.2.4 (pp. 322–323); Theorem IX.3.1 with proof
including the "small sin … changing the meaning of the letter" warning (pp. 324–325);
Proposition IX.5.1 with proof (pp. 327–328); FS III.3 (p. 97); Scholze–Weinstein
Definition 23.1.1 (pp. 216–217) and Theorem 23.1.4 (p. 217).

The five gaps (FS VII.4–VII.5; FS IV.7 Drinfeld's lemma; Berkeley 23.2–23.5 and Lecture
24; the missing creation/annihilation and triangle identities for HS4; and the observation
that IX.6 is really about Bernstein centres so only part of it belongs to HS4) are
accurate boundaries, not disguised inputs.

### Unverifiable items / supplier questions

None.

---

## 10. EXT-05 / LanglandsParameterStacks.json *(additional packet found in the job directory)*

Review status **accepted**. Nodes 16: **14 verified, 2 corrected, 0 unverifiable**.
Links 17, all internal; coverage 8/8 stages; all `parentStageId` values exist and are owned
by `LanglandsParameterStacks`. Sources `FS-geometrization`, `DHKM-parameters` — SHA-256
both match the catalogue; DHKM printed page = PDF page, checked at pp. 1, 2, 6.

### Corrections — three locators, each located by full-text search and the page read

1. **Definition VIII.3.1** (semisimple L-parameters) is on printed **p. 286**, not p. 285;
   p. 285 ends with the standard-parabolic bijection.
2. **Proposition VIII.3.2** (`[DHKM20, Prop. 4.13]`, the closed-orbit characterisation) is
   likewise on **p. 286**, not p. 285.
3. **Proposition VIII.5.19** (if `π₁(G°)_tor` has order prime to `ℓ` then so does
   `π₁(H°)_tor`, for `H = G^P` with `P` finite solvable of order prime to `ℓ`) is on
   printed **p. 310**, not p. 308. p. 308 carries Remark VIII.5.18, whose locator is
   correct.

All three excerpts match the printed text verbatim at the corrected pages.

### Checked and confirmed

Theorems VIII.0.1/VIII.0.2 (pp. 277–278); Definition VIII.1.1 (p. 278); Theorem VIII.1.3
with the discretization argument, the exact sequences, the tangent-space computation and
the Euler-characteristic/dimension estimates in its proof (pp. 279–280); Proposition
VIII.3.5 and the VIII.3.2 finite-free-group presentation (pp. 287–288); Definition VIII.3.4
(p. 287); Proposition VIII.3.7's generators and relations (p. 288); Proposition VIII.3.8
(p. 290); Theorem VIII.4.1 and Definition VIII.4.2 (p. 291); Theorem VIII.5.1 (p. 293);
Definition VIII.5.4 with the explicit warning that `Perf` is **not** stable under truncation
(pp. 294–295); Corollary VIII.5.7 (p. 295); Proposition VIII.5.8 (p. 296); Propositions
VIII.5.14 (p. 301) and VIII.5.15 (p. 302); Remark VIII.5.18's counterexample showing the
centre hypothesis cannot be weakened (p. 308).

DHKM's abstract (p. 1), the Bellovin–Gee / Dotto–Helm–Moss comparison in the introduction
(p. 2) and Theorem 1.3 with its caveat on pure absolute dimension (p. 6) were read and
match. **The packet's use of DHKM as an independent check on the dimension normalisation
is sound** and is exactly the kind of cross-source confirmation the protocol asks for.

### Unverifiable items / supplier questions

None.

---

## 11. EXT-02 / DeligneWeightsAndPurity.json *(additional packet found in the job directory)*

Review status **accepted**. Nodes 9: **6 verified, 3 corrected, 0 unverifiable**.
Links 9, all internal; coverage 11/11 stages (nine of them honestly marked `not_read`);
all `parentStageId` values exist and are owned by `DeligneWeightsAndPurity`. Sources
`Deligne-WeilI-1974`, `Deligne-WeilII-1980` — SHA-256 both match the catalogue.

**Page conventions established from the numdam running heads and used throughout:**
Weil I printed = PDF **+ 271** (PDF 3 = 274, PDF 13 = 284, PDF 15 = 286); Weil II printed
= PDF **+ 135** (PDF 18 = 153, PDF 69 = 204, PDF 72 = 207). Every locator resolved against
these.

### The packet's own OCR gap — resolved

The packet asked for "the exponents in (3.8)–(3.9) and the diagram of (3.3.8)" to be
"verif[ied] on rendered pages before promotion". Done: Weil I printed p. 286 and Weil II
printed p. 206 were rendered at 150 dpi and read.

**Both reconstructions are correct.**
- Corollary (3.8) prints `|α| ≤ q^{(β+1)/2 + 1/2}` — the packet's `q^{β/2+1}`.
- Corollary (3.9) prints `q^{(β+1)/2 − 1/2} ≤ |α| ≤ q^{(β+1)/2 + 1/2}` — the packet's
  `q^{β/2} ≤ |α| ≤ q^{β/2+1}`.
- The convergence bound in the proof of (3.8) is `|t| < q^{−β/2−1}`, as reconstructed, and
  the affine-line point count is as described.
- Corollary (3.3.8)'s diagram is a **pair** of `(r,s)` plots captioned "si `i ≤ d`" and
  "si `i ≥ d`"; in each a line of slope −1 separates a region marked `H^i_c` from one
  marked "`H^i`, X lisse"; in the `i ≥ d` plot the `H^i_c` region is the inner square cut
  off at `r = d`. The corollary's prose — lower triangle for compact supports, upper
  triangle for ordinary cohomology with X smooth — is confirmed.

The gap was rewritten to record the resolution.

### Corrections

1. **Weil I (3.1) locator.** The item opens on printed p. 283, but the quoted sentence
   (the definition of weight `β`) is the **first sentence of p. 284**. Locator widened and
   made explicit.
2. **Corollary (3.3.8) had no source entry** although the node asserts its content; one
   was added at printed p. 206, carrying the diagram description read from the page image.
3. The hypothesis in the (3.8)–(3.9) node that described the exponents as reconstructed
   "from the visible fragments" now records the confirmation instead.

### Checked and confirmed

Théorème (3.2)'s three hypotheses and conclusion with the "U affine, `F ≠ 0`" reduction;
Lemmes (3.3)–(3.5); the H. Weyl citation in (3.7); Scholie (2.10) and the (2.14 E)
delegation to SGA 4 XVIII (3.2.5); Weil II Définition (1.2.2), (1.2.6), Théorème (3.3.1)
with its dévissages (a)–(f) and the curve reduction via (3.2.3) and (1.8.4), (3.3.2),
Corollaires (3.3.3)–(3.3.6), (3.3.7), (3.3.9), and the variants (3.3.10)–(3.3.11) —
including "Dans tout ceci, l'hypothèse « lisse » n'apparaît que pour justifier la dualité
de Poincaré", exactly the scope caveat the packet preserves.

### Unverifiable items / supplier questions

None. The four gaps (Weyl's invariant theory for the `Sp`-coinvariants; the SGA 5 trace
formula and SGA 4 XVIII duality imports; Weil II 3.2.3 and 1.8.4; the OCR losses, now
resolved) are accurate boundaries.

---

## 12. EXT-02 / EtaleDualityAndPerverseSheaves.json *(additional packet found in the job directory)*

Review status **accepted**. Nodes 2: **1 verified, 1 corrected, 0 unverifiable**. Links 7;
coverage 13/13 stages (eleven honestly `not_read`). This is a deliberately thin packet and
says so in its own summary.

### Correction

**Weil I Théorème (2.12) is printed on p. 283, not p. 282** — p. 282 ends with item (2.11)
(the stalk of `j_*F` at a missing point as local-monodromy invariants). Locator fixed, and
the one-fragment excerpt ("est une dualité parfaite") replaced by the full printed
statement of the pairing.

### Links reviewed

Six links come from sibling-packet nodes — four from `AdicCoefficientsAndComparisons`
(L3 ×2, L4, L6) and two from `ClassicalAdicEtaleCohomology` (H5 ×2); all six ids exist.
EDC.6's atlas description **licenses** them: "Through AdicCoefficientsAndComparisons L2–L6
prove the applicable scheme/adic/diamond operation comparisons, preserving the source's
qcqs, finite-dimensional and ℓ-invertibility hypotheses."

The seventh runs **out** of this packet, from its EDC.2 node into a
`DeligneWeightsAndPurity` node. Its mathematical claim was independently confirmed: the
150 dpi rendering of Weil I p. 286 shows the proof of Corollary (3.9) using Poincaré
duality (2.12) for the lower bound. And `DWP.2`'s `requires` does contain
`EtaleDualityAndPerverseSheaves:EDC.2`, so the stage edge already exists.

**New gap added:** EDC.6's `requires` is `[L2, L5, L6, …]` — it contains neither L3 nor L4
and no `ClassicalAdicEtaleCohomology` stage. Integrating adds three stage edges
(L3 → EDC.6, L4 → EDC.6, H5 → EDC.6); a reachability check confirms all three are acyclic.

### Checked and confirmed

The EDC.6 index node's hypothesis-by-hypothesis summary of ECD 27.1–27.7 and Huber
3.7.2/3.8.1 agrees with what I verified directly in the two sibling packets — in
particular the restriction of 27.6–27.7 to finite coefficients killed by an integer prime
to `p`, the qcqs/finite-type hypotheses of 27.4/27.5, and the torsion hypothesis of Huber
3.7.2. The node correctly presents itself as an **index with a cross-reference proof
step**, which is the right shape for a stage whose description calls the material
"transport of the scheme construction, not a second construction of diamond six
operations". The EDC.2 node's record that Weil I does **not** prove (2.12) — Deligne
delegates it to SGA 4 XVIII (3.2.5) plus a local computation, adding "L'énoncé figurera
explicitement dans la version définitive de SGA 5" — is exact.

---

## 13. EXT-02 / LefschetzPencilsAndVanishingCycles.json *(additional packet found in the job directory)*

Review status **accepted**. Nodes 9: **6 verified, 3 corrected, 0 unverifiable**. Links 12
(11 internal, 1 from a `ClassicalAdicEtaleCohomology` node that exists and does supply what
the consumer needs). Coverage 10/10 stages. Single source: SGA 7 II, SHA-256 matching the
catalogue.

**The OCR of this IAS scan is unusable for Greek letters and even confuses "nul" with
"seul"**, which the packet's `edition` field states. Page mapping was therefore established
from the running heads — Exposé XIII internal = PDF − 89; Exposé XV internal = PDF − 172 —
and **every load-bearing statement was re-read from rendered page images** (pdftoppm at
170–300 dpi, into the scratch directory only): XIII pp. 17, 19 and XV pp. 24, 25, 27, 28.
Every locator in the packet resolves correctly; **no locator error was found**.

### Corrections — all three substantive, all found in the page images

1. **`LPV.2/…-3-1-2`.** The source writes `Σ'` for the quadratic singular locus and `Σ` for
   the subset where `X_η` is smooth nearby; the packet uses `Σ` and `E` for the same two
   sets. Under that map, Proposition 3.1.2(ii) says `R^nΦ(Λ)` is zero **outside E** — the
   packet said "outside Σ", i.e. outside the *larger* set, which is weaker than the source
   and inconsistent with the packet's own proof step ("by 2.2.4 RΦ vanishes outside E").
   Worse, **part (iii) is stated with `ψ`, not `Φ`**: the duality is between
   `(R^nψ(Λ))_x̄` and `H^n_{x̄}(R^nψ_η(Λ))`. The packet had `Φ` in both slots. Both fixed;
   excerpt replaced by the full printed statement; notation-map hypothesis added.
2. **`LPV.2/…-3-2`.** Proposition 3.2.1(i) is about `H^n_{x}(R^nψ_η(Λ(m)))`, not `R^nΦ`
   (confirmed at 300 dpi). Part (ii)'s parenthetical is "pour `a ∈ R^nΦ_η(Λ(m))`" — so the
   source really does use **both** functors on the same page, which is exactly why the
   confusion matters. Statement and excerpt corrected.
3. **`LPV.2/…-3-3`.** The character of 3.3.2 is the source's **`ε_b`**, which the packet had
   renamed `c_b` throughout — including inside quoted excerpts of Propositions 3.3.5 and
   3.3.6. Renamed back. Two further errors in the packet's rendering of 3.3.2 were fixed
   from the page image: the **target is `Z/(n)(1)`** (then `Λ(1)`), not `μ_n`; and the
   formula is `ε_b^{(n)}(σ) = (σ ⁿ√b)/ⁿ√b` — the `n`-th root of **`b`, with no minus
   sign** — where the packet had `ⁿ√(−b)`. A source entry for 3.3.2 (printed p. 27) was
   added, since the node asserted its content with none.

### Checked and confirmed

XIII 1.4.3 with (1.4.3.1)–(1.4.3.4) and 2.1.1 (both printed p. 17), verbatim — including
`Var(στ) = Var(σ) q Var(τ) + Var(σ) + Var(τ)` and the `Λ = Z/ℓ^n` remark; Proposition 2.1.4
and Reformulation 2.1.5 (p. 19); the (2.1.2.4) triangle and (2.1.2.5) variation; 3.1.2's
proof paragraph; 3.2.1's generator conditions `(δ,δ) = (−1)^m·2` and `Tr(δ) = 0` for
`n = 0`, Complément 3.2.2's Clifford-centre description and 3.2.3's uniformizer character
(p. 25); Propositions 3.3.5 and 3.3.6 with their exact formulas and the start of step (A)
(p. 28); 3.3.3's composite diagram with the primitive quotient (XII 3.5) and the `±δ` basis
(p. 27).

**One point left open**: in the (2.1.2.4) triangle the subscript of the middle term was not
legible at 170 dpi. The packet writes `RΨ_η(K_η)`, which is what (2.1.2.2) forces, so no
change was made.

The packet's distinction between `RΨ` (nearby cycles) and `RΦ` (vanishing cycles) in the
**LPV.0** nodes is correct and is exactly the distinction the `ClassicalAdicEtaleCohomology`
stage text insists on; the errors corrected here were confined to the **LPV.2** nodes.

### Unverifiable items / supplier questions

None. The packet's four gaps are accurate boundaries; the first was extended to record
which pages have now been read from images and which still rest on the OCR.

---

## Whole-job dependency check (run after all thirteen packets)

Every link of all thirteen packets was collected and checked twice: once as a **node
graph**, and once **lifted to stage level** (each node replaced by its `parentStageId`) and
unioned with `data/atlas.json`'s 3 508 `stageEdges`.

**Node level: acyclic.** 197 nodes, 210 edges, no cycle.

**Stage level: one reversed link and six order conflicts.**

### 1. One genuinely reversed link — corrected

`AdicSpacesPartII:R4/etale-site-and-rigid-comparison → AdicEtaleGeometry:A1/etale-site-and-geometric-points`
(in `AdicEtaleGeometry.json`). Both stage texts say the opposite:

- A1: "This milestone **owns** the site, geometric-point, basis/slice comparison … constructions".
- R4: "R4 is the **early site reexport** … Transport the elementary site and sheaf
  operations **from A1** without constructing a second site."

and the atlas agrees — `AdicSpacesPartII:R4` **requires** `AdicEtaleGeometry:A1`. The
link's own `reason` even said "R4 is the reexport, A1 the owner per both stage texts". As
written it created a two-cycle `A1 → R4 → A1`. **Reversed**, with the supply spelled out,
and a gap added.

### 2. Six links where the atlas substage order is the reverse of the source's proof order

These are **not** errors in the packets: at node level each direction is what the source
proves. They conflict only with the atlas's *substage* ordering. Nothing was reversed,
because reversing would misstate the source. Each is now recorded as a gap in its packet.

| Packet | Implied stage edge | Atlas has | Source evidence |
| --- | --- | --- | --- |
| GeometricSatake | `GS2:Satake-closure → GS3:fusion` | `GS3:fusion → GS2:Satake-closure` | VI.9.5's proof (p. 229) opens "By Proposition VI.8.2 …"; VI.8.2 (p. 226) is proved from IV.2.24, VI.6.2, VI.7.12 — **no fusion** — and both VI.8.1(iii) and VI.8.2 sit in §VI.8, *before* §VI.9 |
| RelativeFF | `RF0 → RF0:integral-Y` | reverse | `𝒴_S := Spa W_{O_E}(R⁺) \ V([ϖ])` (p. 47) |
| RelativeFF | `RF2:untilts → RF2:integral-divisors` | reverse | VI.1.2's proof (p. 191): "Each of the `ξ_i` defines a closed Cartier divisor by Proposition II.1.4" |
| VectorBundles | `VB2:ampleness → VB1` | reverse | II.2.10's proof (p. 68) opens "By Proposition II.2.9, any line bundle becomes trivial after removing one closed point" |
| VectorBundles | `VB2:classification → VB2:ampleness` | reverse | II.2.9's proof uses the classical points and the PID property (II.1.11, II.1.22) |
| VectorBundles | `VB3:positive-basic-examples → VB1` | reverse | II.2.5(iv)'s proof (p. 63): "`BC(O(1)) ≅ Spd F_q[[x^{1/p^∞}]]` by Proposition II.2.2" — and II.2.2's own proof says "as in the proof of Proposition II.2.5 **below**", so the two are **mutually referential** in the source |

The GeometricSatake case is the sharpest: the node
`GS2:Satake-closure/convolution-preserves-satake-and-dualizability` bundles two results
with different positions in the source's order — VI.8.1(iii), the closure theorem that
GS2:Satake-closure owns, and VI.8.2, dualizability, which is prior to fusion and is what
VI.9.5 actually consumes.

**Orchestrator decision** (recorded identically in all four gaps): (i) keep these as
node-level edges and do not lift them to stage edges at integration; (ii) re-parent or
split the offending node so its stage matches the source's order; or (iii) revise the atlas
substage ordering. **Option (iii) is the one the source supports in each case.**
