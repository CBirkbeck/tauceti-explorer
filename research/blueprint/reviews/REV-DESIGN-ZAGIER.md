# REV-DESIGN-ZAGIER — independent review

Reviewer: Claude (session `claude-f556Sk`), issue #78. The work under review is the design `DESIGN-ZAGIER` by Codex (`codex-eztB21`, pull request #10356): the new roadmap `ZagierConjecturePolylogarithms`, *Polylogarithms, Part II: the weight-four Zagier theorem*. This review did none of that work.

**Verdict: accepted, with corrections made in place.** The plan is sound in its architecture. The two separate regulator obligations, the 5/16 calibration of the canonical period on cycles, the explicit/inductive distinction and the honest empty-determinant case are all right. The errors found were all fixable here, so nothing goes back to the designer. What remains open is recorded as seven gaps and nine requests.

## Files reviewed and corrected

- `research/blueprint/packets/ZagierConjecturePolylogarithms.json`: 45 nodes checked (26 corrected, 19 verified), requests, gaps, source issues and restructure proposal revised, review object written.
- `research/blueprint/readmes/ZagierConjecturePolylogarithms.md`: regenerated from the corrected packet. The hand-written introduction and closing sections were edited to match. Packet-derived text now escapes `*`, `$` and `_` after a non-word character, so the atlas renderer shows `L*₄`, `r*₇(3)`, `δ_{G₄}` and `Σ_s` literally.
- `research/blueprint/roadmaps/ZagierConjecturePolylogarithms.json`: stage `requires` lists recomputed from the corrected node prerequisites. The Z.3 description now names the two request owners, and the Z.4 description names the degree-eight identity.
- `research/blueprint/suggested/ZagierConjecturePolylogarithms.lean`: two coefficient `example`s added, for the degree-eight cancellation and the corrected a₃ normalization.

## Counts

| | before | after |
|---|---|---|
| nodes (def / constr / comparison / theorem) | 45 (10 / 18 / 3 / 14) | 45 (10 / 18 / 3 / 14) |
| API items / unit tests | 114 / 84 | 114 / 84 (kinds mapped to the five protocol kinds, Lean-style names) |
| planets | 31 | 30 |
| baseline declarations | 5 | 7 |
| gaps | 7 | 7 (CONST closed, C8-SQUARE added) |
| requests | 8 | 9 (P3-SPEC added; MT-2 and IND retargeted) |
| source issues | 4 | 8 (E05–E08 added; all eight have review verdicts) |
| stages planned / closed | 6 / 0 | 6 / 0 |

`python3 scripts/check_blueprint.py` on the packet, with the pinned declaration index, reports 0 errors and 0 warnings. The packet's source issues also pass `check_issues` from `scripts/source_issues.py`, and its source versions pass `versions_checked` from `scripts/check_errata.py`. `lean-check` on the suggested file elaborates against Mathlib 082e2d3. Its only warnings are the ten `declaration uses sorry` warnings, one for each stated theorem or example.

## Sources (item 1)

I downloaded all six sources again into scratch: GR arXiv:1803.08585v5, G08 arXiv:0803.0297v4, G09 arXiv:0908.2238, M20 arXiv:2003.06521, G00 arXiv:math/0011168, and the scan of G93. Every SHA-256 matches the packet. I read GR in full, with pp. 71 and 91–92 checked against the page images for the coefficients. In GR the PDF page equals the printed page. I read the cited parts of the other sources, and the G93 pp. 189–191 scan visually.

- Every `match` field was a word-for-word copy of the node's `statement`. Each is now rewritten in my own words to say what the source states at the locator. Citations of a second source were folded into the GR locator before. They are now separate source entries for G08, G09, G00, G93 and M20.
- Locators corrected:
  - Equations (23)–(28) are in §1.2, not §1.3.
  - (94)–(102) and Proposition 4.4 are in §4.3, not §4.2.
  - (106) is in §5.1 (Lemma 5.1, p. 54).
  - Corollary 1.15 is on p. 16.
  - GR §2 has numbered items, not subsections 2.1–2.3.
  - (233)–(236) are in §9.2, pp. 89–90.
  - (191) is on p. 77.
  - The regulator statement for K₇ is Theorem 1.3(iv), p. 7.
- No verbatim excerpt was found or added.

## Baseline (item 2)

I re-read all five declarations at Mathlib 082e2d3:

- `Finsupp.linearCombination` and `linearCombination_single`;
- `Submodule.Quotient.mk` and `mk_eq_zero`;
- `ExteriorAlgebra` and `ι_sq_zero`;
- `TensorProduct.lift`;
- `Matrix.det` with `det_mul` and `det_fin_zero`.

Each is confirmed and provides what its citing nodes use. For the special-derivation comparison I added `FreeLieAlgebra` (Mathlib/Algebra/Lie/Free.lean) and `LieDerivation` (Mathlib/Algebra/Lie/Derivation/Basic.lean), both read at the pin.

## Corrections of substance (items 3–5, 7, 8)

1. **Analytic results used for algebraic identities.** Three nodes cited `Polylogarithms:P.3/trilogarithm-functional-relations`: `Z.1/trilogarithm-reduction`, `Z.4/symbolic-bloch-modules` and `Z.5/scissors-trilogarithm-map`. Three others cited `P.1/bloch-wigner-five-term`: `Z.2/cluster-two-form`, `Z.3/freeness-extension-proof` and `Z.5/chern-residue-extension`. Both cited nodes are statements about real-valued functions on C. They cannot prove identities in B₃(F) or B₂(F) for an arbitrary field. They are replaced by the algebraic groups and boundaries: `P.3/trilogarithm-group`, `P.3/coordinate-relation`, `P.3/seven-term-configuration-relation`, `P.3/weight-three-complex`, `K3BlochGroups:V.3/pre-bloch-group` and `V.3/bloch-boundary`.
2. **The isomorphism B₃-exp ≅ L₃.** The forward map is fine. Its well-definedness follows from GR (29) and Lemma 5.2(i), and its surjectivity from (29). For the inverse I checked, case by case, that table (26) is compatible with sending D₂₁ to the right side of (29). For example, if a>0=b the image specializes to [1−1/v₀]₃+[1−v₀]₃−[1]₃=−[v₀]₃, and if a=b<0 it specializes to 2[u₀/v₀]₃. So every specialization of Q₃ goes to a specialization of the 22-term relation. That these lie in R₃(F) is the step GR attributes to Gon95 §5. P.3 itself leaves its degenerate cases as statements to prove. It is now request **P3-SPEC** to `Polylogarithms:P.3`.
3. **Circular and backwards dependencies on the parent.**
   - `Z.6/kappa-regulator`, `Z.6/all-cycle-regulator-image` and `Z.6/explicit-zagier-four` listed `Polylogarithms:P.4/weight-four-regulator-input` as a prerequisite. That node is the statement-only interface these theorems discharge, so citing it was circular. The edge is removed and recorded under `uses` instead.
   - `explicit-zagier-four` also cited `P.4/period-calibration`. That node assumes the period map is an isomorphism onto K₇, which κ need not be. It is replaced by `BorelRegulators:R.4/regulator-lattice`, `R.4/regulator-real-isomorphism`, `R.5/leading-term-functional-equation` and `P.4/zagier-determinant`. I rechecked the exponent count 4d−4N=−4(r₁+r₂).
   - `Z.3/classical-subspace` depended on `P.4/explicit-weight-four-complex`, the parent node that consumes it. That edge is removed.
   - As a result, Z.3 no longer requires P.4.
   - The restructure proposal had P.4 importing the Z-nodes. Since Z.5 and Z.6 depend on P.4, that would create a cycle in the stage graph. The proposal now says P.4 names the Z-targets as the owners of its interfaces without citing them.
4. **Cluster boundary identities.** The pentagon square is GR Lemma 3.15 and uses the five-term relation (79). Q₃ enters only the hexagon square (Proposition 4.4). Statement and proof steps are corrected. The planet is renamed after the source's cluster polylogarithm map, and the near-duplicate planet on `cluster-low-cells` is removed.
5. **Degree-eight chain conditions (new source issue E05, new gap C8-SQUARE).** `configuration-identities` listed only the three squares of GR §10. A chain map from the dual Bigrassmannian complex also needs three more conditions: R₇³∂+R₇²p=0 on C₈(3), R₇²∂=0 on C₈(2) and R₅¹∂=0 on C₆(1). GR Lemma 7.9 claims that the Λ²B₂ part of R₇³∂ vanishes on C₈(3) by itself. That is false.
   - I evaluated both wedges with the alternating form (D∘σ₁)∧(D∘σ₂), where D is Bloch–Wigner and σ₁, σ₂ are two independent random complex configurations. The two vanishing claims inside GR's proof hold numerically. The step from the five-term relation for (1|4,5,6,7,8) to a single symmetric wedge does not: the wedge Y is nonzero.
   - The R₇²p wedge is exactly −9 times the R₇³∂ wedge, to twelve digits, for four random seeds. With the coefficients −3/28 and −1/84 of (166), and the total differential ∂+p, the two cancel. R₇²∂ vanishes on C₈(2) to the same precision.
   - So Theorem 7.6 holds, and the descent of δ to G₄ (Proposition 7.8) follows from the combined identity and p²=0. That descent is now proved in `configuration-identities`, which avoids a dependency cycle with `configuration-formulas`.
   - A numerical check is not a proof. The finite symbolic certificates are gap C8-SQUARE.
   - FLAG-SIGNS is narrowed accordingly. The squares hold with D=∂+p as printed, so only the flag map of Theorem 7.1 still needs a sign certificate.
6. **Normalization of a₃ (new source issue E06).** By GR (236), the triple-ratio class normalized by (167) is three times G00's r₃ (G00 (7) has the factor 1/15, GR (144) has 1/5). GR's a′₃ is built from the normalized class, so it is three times G00's. Footnote 24 claims it is one third. G00 sets a₃=(1/6)a′₃−(1/3)a″₃, and its proof of Theorem 3.2 forces that ratio. The μ₃ of GR equals that of G00. GR's printed (1/2)a′₃−(1/3)a″₃ therefore makes the a′₃ coefficient nine times too large. `scissors-trilogarithm-map` now uses G00's map. Written with GR's normalized class, the a′₃ coefficient is 1/18. Its acceptance and test are corrected.
7. **The symbolic b₃ and its constants (E01 reclassified; gap CONST closed).** The symbolic b₃ evaluates only modulo Q[1]₃. Every identity proved with it in GR §10, however, comes after the cobracket, and δ₃[1]₃=[1]₂⊗u(1)=0. R₇³ itself is defined by its explicit formula in B₃⊗U. So the constant-free calculation suffices, and E01 is a misprint in the stated codomain that affects nothing. `symbolic-bloch-modules` is rewritten accordingly.
8. **The motivic fundamental group request.** MT-2 was addressed to `AnabelianGeometryAndNonabelianChabauty:NC.2`, which is now a TauCetiRoadmap pull request (stage `pr`) and cannot be asked to grow. MT-2 now goes to `PeriodsAndSpecialValues:PS.9`, which already owns the motivic fundamental group of the three-punctured line. NC.2 is cited through its nodes `tannakian-groups` and `tensor-paths`.
9. **Smaller corrections.**
   - `Z.3/cyclic-tensor-coalgebra` is linear algebra on words. Its motivic prerequisites (MC.6, NC.2, PS.9) are removed, and it no longer sits in gap MT.
   - `Z.3/cyclic-special-derivations` is the algebraic comparison of G08 Lemma 8.1 and Propositions 8.3–8.4, now on the native free Lie algebra.
   - `Z.5/cycle-period-calibration` needs D on the whole pre-Bloch group, so `P.2/weight-two-regulator`, which is defined only on the Bloch group, is replaced by `P.2/bloch-wigner-descent`.
   - `Z.2/cluster-two-form` now says the forms Δᵢⱼ are invariant under Aut(V₂,ω), not under all of GL₂.
   - Every request's consumers now list its supplier stage. MC.4, H.2, R.7, M.8 and V.3 were missing on six nodes.
   - IND is addressed to the stage `Polylogarithms:P.4`.

## Source issues (item 6a)

- **E01** (GR Definition 10.7): confirmed, and reclassified as a misprint that affects nothing (see correction 7).
- **E02** (GR (244)): confirmed. The calculation on p. 107 gives δW=−42·A while the right side of (244) is A/2, so δW=−84·(right side). The −1/84 of (166) is right.
- **E03** (GR §9.3(2)): confirmed. For k=1 the segment I_k varies the nonexistent entry a₁,₀. The passage to F-defined framed motivic data is asserted without proof. G09 Theorem 3.4 and the warning after it give only a geometric Hodge–Tate variation.
- **E04** (GR Theorem 2.1, via G08 Proposition 8.4): confirmed. The first-shuffle relations have length at least three, so the pure word ⟨X_s,X_s⟩ survives in the shuffle quotient. G08 Proposition 8.3 puts it in the kernel of κ. The stated isomorphism therefore fails in weight one, which is now recorded as an error in a stated result. It does not reach weights two to four.
- **E05 (new)**, GR Lemma 7.9: error, see correction 5.
- **E06 (new)**, GR §9.3(1) a₃ normalization: misprint, see correction 6.
- **E07 (new)**, GR p. 93: the element whose cobracket is subtracted must carry the factor −3/28. The design had already scaled it without recording the misprint.
- **E08 (new)**, GR p. 14: the worked specialization of {tᵃu,tᵃv}₃,₁ drops the coefficient 3 that (26) and the displayed computation give.

## Nodes verified without change of substance

The following nodes were checked at their locators, and their statements, hypotheses and formulas match the source:

- **Z.1:** the raw generators and the conventions (3), (23)–(25) and (34); the specialization table (26); Q₃ and Q₄ with their signs and the standalone coefficients −4 and 3.
- **Z.2:** the face counts of K₃; the cell values (95), (97), (99) and (102).
- **Z.3:**
  - the cobracket (38) and Proposition 5.5;
  - Theorem 6.1 and Lemmas 6.2–6.6;
  - the correlators (62)–(68);
  - the Hodge correlator of item 6;
  - M20 Theorem 11 and Lemma 29;
  - GR Theorem 2.6, Lemma 2.8, Proposition 2.9 with footnote 12, Corollary 2.10 and §5.3.
- **Z.4:** (129)–(134); (159); Definition 7.5; the coefficients of (166), against the page image; Lemmas 10.10 and 10.12–10.13.
- **Z.5:** (191)–(192); Theorem 8.1 and the residue maps; Theorems 8.6 and 8.11; Lemmas 9.2–9.3; Corollary 9.4; Lemma 9.6; G93 Theorems 4.5–4.6, on the scan.
- **Z.6:** Theorem 1.3(i) and (240).

The 5/16 calibration is a correct and useful addition that GR leaves implicit. If Σq_z[z]₃⊗z=0, then Σq_z[z]₂⊗z⊗z=0, and applying D⊗log|·|⊗log|·| kills the correction term of L*₄.

## Questions for the orchestrator

1. The restructure proposal asks that `Polylogarithms:P.4` record the Z-targets as owners of its interface gap without citing them. A later P.4 fix should do this, and should name `Z.1/weight-four-presentation` and `Z.3/classical-subspace` as the owners of L₄ and B₄-comb, which `P.4/explicit-weight-four-complex` uses.
2. GR is listed as forthcoming in the Annals. E05–E08 and E01–E04 are scoped to arXiv v5. Before anything goes to the authors, the maintainer may want them compared with the published text.
3. Request MT-2 now goes to PeriodsAndSpecialValues:PS.9. If the maintainer prefers a Part II of the TauCetiRoadmap AnabelianGeometry roadmap, the request text names exactly what is needed.
