# REV-PAPER-MASSER-ZANNIER-20: review of the extraction of Masser–Zannier, *Abelian varieties isogenous to no Jacobian*

**Verdict: accept, after corrections made in place.**

- **Routes.** All eight are accepted, one of them new.
  - Routes 2 and 3 placed items upstream of what they need, and are corrected in place.
  - Route 8 is added. It sends the Galois-orbit bound for CM points to the accepted Part II of ComplexMultiplicationAndExplicitReciprocity.
- **Mistakes.**
  - All five recorded misprints are confirmed.
  - The review adds seven (E6–E12): one gap, in a sketched remark (E10), and six misprints.
  - None affects a stated result.
- **Items.**
  - Four items are added and thirty-two corrected. Two of the corrected items change status.
  - The result has 72 items: 56 missing, 13 planned, 3 library.
- **Version of record.** The extraction read the published text, which is free on the journal's site. `sourceVersions` now records that.

Reviewer: Claude Code, session `cc-58621d`, 29 September 2026 (issue #1122). Extraction under review: Claude Code `cc-fb70e5` (issue #1121, PR #4020). At review it had 68 items (53 missing, 12 planned, 3 library), seven routes and five `sourceIssues`, with status `complete`. `cc-58621d` appears nowhere in its files.

Sources:

- **Version of record.** Annals of Mathematics 191 (2020), 635–674, doi:10.4007/annals.2020.191.2.7.
  - PDF from annals.math.princeton.edu, 40 pages, SHA-256 `8b76bfac…4b60`, matching the record.
  - No arXiv version exists.
  - Crossref records no update relation, and the article page lists no erratum.
  - Every finding and every formula whose text layer is ambiguous was read on a rendered page image.
- **Libraries and atlas.** Mathlib 082e2d37 and Tau Ceti f790474, with every cited declaration opened. The atlas as `scripts/build.py` assembles it at `9039c426`.

Method:
- Three read-only readers took items 1–33 (§§1–2 and the imported background), items 34–46 (§§3–4) and items 47–68 (§5).
- A fourth took the routes, the findings and the other fields.
- I read §§1.2, 2, 3.2, 4 and 5 myself, checked every recorded and new finding on the page, and rechecked each fix and each graph claim before applying it.

## 1. Items

**Added.**

| Item | Status | Where the paper uses it |
|---|---|---|
| 69. Quotients by finite subgroups | planned, AbelianSchemesAndArithmeticModuli A3 | E ≅ E′/G at the end of §2; A′ ≅ A″/Γ in Lemma 5.1(b) |
| 70. Degree and Rosati length of endomorphisms | missing, route 6 | (30)–(31) in the proof of Lemma 4.2, i.e. [27, Lemmas 2.2 and 2.3] |
| 71. Degree under generic linear projections | missing, route 7 | deg V̄₁₆ ≤ 2D and D_Ψ ≤ 2^{16g⁴−1} (p. 666) |
| 72. A field of definition of bounded degree over the field of moduli | missing, route 7 | the count "≫ D̃" of conjugates in the Pila step (p. 663, and p. 650 for g = 1) |

Item 72 fills a step the paper passes over. Lemma 5.2 bounds m̃ by an upper bound D̃ for the degree of a field of definition of Ã. The Pila step needs the number of Galois conjugates of the moduli point, which is the degree of the field of moduli. The fine moduli space A_{g,3} bridges the two. Items 36 and 49 now say so.

**Status changes.**
- **Item 21, Ax–Lindemann for A_g (Pila–Tsimerman, Theorem 6.1), is now planned in LD.6.** LD.6 builds its applications from "functional-transcendence theorems" and lists Ax–Lindemann inputs in its source route. PAPER-TSIMERMAN-18's accepted review classes the same theorem as planned there.
- **Item 65, the Galois-orbit lower bound for CM points, is now missing.** LD.6 builds "from separate Galois-orbit bounds" and requires "independent orbit … suppliers", so it takes the bound as an input and plans none. The accepted extractions of Tsimerman 2018, Andreatta–Goren–Howard–Madapusi Pera and Yuan–Zhang route exactly this bound to a Part II of ComplexMultiplicationAndExplicitReciprocity (route 8).

**Corrected statements.**
- **4.** Narrowed to the Mumford–Tate definition and its consequences, which continue ShimuraData D1. The special-subvariety characterization and the countable-union remark moved into item 22.
- **9.** Now defines Siegel's fundamental domain and says that it covers H_g, which the proofs use.
- **27.** Adds the openness of the Frattini subgroup of an open subgroup of GSp₂g(Z_p) ([38, p. 148]).
- **29.** Restricted to what Mathlib's `frattini` and `frattini_nongenerating` state: the abstract Frattini subgroup, not the profinite one.
- **32.** The count is of subgroups of order *at most* m (p. 644, p. 658).
- **38.** André's theorem now names its exceptional curves: the modular curves and the horizontal and vertical lines through singular moduli.
- **47 and 48.**
  - Lemma 5.1 now says that p is a fixed prime and names the dependence of its constants.
  - Lemma 5.2 now includes the choice M = [(log N)^ν], ν > 2gλ, and (36), on which the rest of §5.1 depends.
- **54.** V_e is parametrized by the θ_{m0}(eτ), not their squares, and is quasi-projective when 8 | e, with e a square.
- **55.** Lemma 5.5 is stated with ord(ϕ) > W (E11).
- **67.** Its kind is now theorem, since it asserts the vanishing for g ≤ 3 and the g = 4 Schottky result.

**Library, planned and locator fixes.**
- **Library.**
  - Item 10 gains `ModularGroup.three_le_four_mul_im_sq_of_mem_fd` (Modular.lean:400), the y ≥ √3/2 clause.
  - Item 13 gains `NumberField.absLogHeight₁`; its Faltings height stays planned in R35.3.
  - Item 34, a missing item, no longer carries a library field.
- **Planned layers.**
  - Item 8 adds AbelianSchemesAndArithmeticModuli A5, which plans the Siegel universal analytic family and its monodromy.
  - Item 11 adds Tau Ceti ModularForms layer 0, which plans j = E₄³/Δ.
- **Locators.** Items 12, 46, 49 and 54.
- **Notes.** Items 9, 15, 25, 30, 36, 39, 50 and 66 gain notes. Item 50's note records that AutomorphicBundles B4–B5 and ShimuraVarieties V2 plan Siegel modular forms, so only ord is new. Item 66's records that `TauCeti.cholesky` and `TauCeti.continuous_cholesky` supply the continuity it uses.

## 2. Statuses

- **Library.** The three library items stand after the additions above. Every cited declaration was opened at the pin:
  - `UpperHalfPlane`, `ModularGroup.fd` and `ModularGroup.exists_smul_mem_fd`;
  - `frattini`;
  - the Tau Ceti isogeny predicate.
- **Planned.** Every other planned item was checked against the description of the layer it names:
  - PELModuli M2 and M5 plan A_g;
  - ShimuraVarieties V5 and ShimuraData D4 plan CM;
  - ShimuraData D5 and A5 plan Siegel space;
  - R12.1 and ModularForms layer 0 plan j;
  - DT.0 and R35.3 plan heights, and R35.4 and R28.2 plan heights under isogeny;
  - LD.6 plans items 16, 17, 19, 38 and now 21;
  - GN.1 plans Minkowski's second theorem.
- **Missing.** The readers searched Mathlib, Tau Ceti and the atlas for each missing item. None plans:
  - modular polynomials, Siegel's fundamental domain for Sp₂g(Z), Masser–Wüstholz estimates or Rosati lengths;
  - Mumford–Tate groups (no stage mentions them);
  - thin sets, Cohen's count, theta constants of genus g, or a Jacobian locus in A_g.

## 3. Routes

1. **LD.6: accept.**
   - Pila's blocks, Ax–Lindemann for j² and for A_g, and the weakly special geometry belong to it, following PAPER-TSIMERMAN-18's accepted route 1.
   - LD.6's only inputs are LD.0, DT.0 and SF.0, so three links are needed: PELModuli M5 → LD.6, ShimuraData D5 → LD.6 and ModularCurvesPartII R12.1 → LD.6. None closes a cycle.
2. **ShimuraData: accept as corrected.**
   - Items 22 and 23 are about subvarieties of A_g, which is downstream of D4 (D4 → D5 → PELModuli M5). MOK-PILA-TSIMERMAN-19's accepted review rejected the same placement.
   - They moved to route 1, and the route keeps D1 with the narrowed item 4.
   - MOK-PILA-TSIMERMAN-19's Part II also claims weakly special subvarieties, so one owner is to be chosen at design time.
3. **ArithmeticGaloisRepresentations R01.6: accept as corrected.** The route keeps the definition of Galois genericity (item 5). The other three items moved to route 7:
   - **Item 24 (Serre's open image).** It rests on Faltings' theorems in R28.4, and R01.6 → R28.4 is an atlas edge, so keeping it here would close a cycle.
   - **Item 25 (Deligne's lemma).** It needs A_g, which is not upstream of R01.6.
   - **Item 6.** Cadoret's implication uses the open-image machinery, and Pink's uses Deligne's absolute Hodge theorem, which no layer plans.

   R28.6 plans its isogeny results "without requiring the full Serre open-image theorem", so no existing layer owns these.
4. **IG.2: accept.** Cohen's theorem needs the large sieve of SieveMethodsAndPrimePatterns SV.2. Either add the link SV.2 → IG.2 (no cycle) or give a self-contained proof.
5. **ModularCurvesPartII R13.4: accept.**
   - No stage plans Φ_m; the Φ_N of Tau Ceti ModularCurves layer 5 is the cyclotomic polynomial.
   - PAPER-GROSS-ZAGIER-86 sends Kronecker's congruence to CM.3/CM.5, which should import Φ_m through R13.4 → CM.3.
6. **Part II of FaltingsFinitenessAndIsogenyTheorems: accept.**
   - The route coalesces exactly with PAPER-TSIMERMAN-18's accepted route 10, and item 70 joins it.
   - RICHARD-YAFAEV-25 sent Masser–Wüstholz refinements to R28.4; the design should keep all such estimates in this Part II.
7. **New roadmap AbelianVarietiesIsogenousToNoJacobian: accept as corrected.** Nothing in the atlas or other extractions owns this direction. The brief now:
   - states the 16-torsion as the remark after Theorem 1.1;
   - includes Theorem 1.3's last sentence, that D(Ã, Ψ) = 2^{16g⁴} is attained over Q;
   - imports Siegel sets (AdelicAlgebraicGroups AA.3, ShimuraVarieties V0), Siegel modular forms (AutomorphicBundles B4–B5, ShimuraVarieties V2), R28.4 and PELModuli;
   - takes items 6, 24, 25, 71 and 72.

   Its import list no longer credits R01.6 with open images or ShimuraData with the weakly special geometry.
8. **Part II of ComplexMultiplicationAndExplicitReciprocity (new): accept.** Its parent, id, title and area are those of the accepted routes of PAPER-TSIMERMAN-18, PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18 and PAPER-YUAN-ZHANG-18. Item 65 joins that design.

Coverage: every missing item is routed exactly once. Planned items appear only in route 1, whose single stage plans them.

## 4. Source findings

**E1–E5 are confirmed** on the rendered pages.
- **E1.** The rational trace in (22) is twice the complex one. For τ = i and v = [n] the two are 2n² and n². The paper's own later values ℓ(n) = √(2g)n (p. 655) and ℓ(v₀) = √(2g) (p. 656) use the rational form.
- **E2.** The (50) on p. 656 is the Cholesky bound of §5.4, not (27).
- **E3.** On p. 661, (23) is the fundamental-domain inequality, not (41).
- **E4.** On p. 669 the paper repeats τ̃₀ where it means τ̃₁.
- **E5.** On p. 666 a parenthesis is missing.

**E6–E12 are new**, each checked on the page.

| id | kind | where | finding |
|---|---|---|---|
| E6 | misprint | §1.3, p. 641 | "isogeny estimates" [25] and "endomorphism estimates" [26] should cite [26] and [27] |
| E7 | misprint | after (42), p. 661 | the top-right entry of the matrix product should be −τ̃_σ(c_στ_n + d_σ) |
| E8 | misprint | §3.1 (v), p. 645 | Σ_{m≤M} ψ(m) ≤ Σ_{d≤M} d is false (8 > 6 at M = 3); Σ_{d≤M} d⌊M/d⌋ ≤ M² was meant |
| E9 | misprint | the D(A) display, p. 655 | E1 again, but worse: for Z[i] the complex Gram determinant is 0 and the rational one 4 |
| E10 | gap | §3.3 sketch, p. 651 | n₀ ≤ 2d³ + 1 excludes the bad n₀ for one m, but every m with ψ(m) ≤ d must be avoided at once; the sketch gives 2d⁴ + 1 |
| E11 | misprint | Lemma 5.5, pp. 665–666 | "ord(ϕ) ≥ W" must be > W for the use with W = Nk; the proof gives it |
| E12 | misprint | §1.1, p. 635 | "raise following the question" |

**E10** is the only one that touches an argument.
- The remark on families j = n + in₀ sketches why n₀ ≤ 2d³ + 1 exists. For one m with ψ(m) ≤ d, it excludes at most deg G_m ≤ 2dψ(m)² values of n₀.
- For d ≥ 3 two such m exist (m = 1, and m = 2 since ψ(2) = 3), and the union bound is 60 > 54 = 2d³.
- Some n₀ polynomial in d still exists. Whether 2d³ + 1 itself is true is not settled here.

**E11** matters more than its size suggests. With ord(ϕ) ≥ W₀, Lemma 5.4's ord(ϕ) ≤ W₀ gives no contradiction, so ϕ = 0 does not follow. The strict form, which the proof gives, repairs this.

The review also checked the constants of Lemma 2.1 and the sum in Lemma 3.2's proof, and found them correct. So are the exponents of Lemmas 3.3 and 5.2, including ε < 2/21 and λ ≥ 4. The same holds for Lemma 5.3's cocycle computation and the index bound n ≤ e^{2g²}(2e)^{2g²}, which gives 512^{2g²} and hence 2^{16g⁴}.

## 5. Other fields

- **`sourceVersions`** is added: the published PDF, with its hash. `collation.py` now classifies the paper as read in its published form. Before the fix it classified it as preprint.
- **`summary`** is updated with the new counts and routes.
- **Prerequisites.** Three sources that missing items rest on are added: Deligne, *Théorie de Hodge II* (item 25); Pink 2005 (items 5 and 6); Serre, *Œuvres IV* (item 24). The sixteen existing entries resolve on Crossref, and their `why` texts match the paper's uses.
- **PAPER-MASSER-ZANNIER-20.md** gains a post-review summary.

## 6. For the orchestrator

- **Links needed**, none closing a cycle:
  - PELModuli:M5, ShimuraData:D5 and ModularCurvesPartII:R12.1 → LD.6;
  - SieveMethodsAndPrimePatterns:SV.2 → InverseGaloisAndArithmeticFundamentalGroups:IG.2;
  - ModularCurvesPartII:R13.4 → ComplexMultiplicationAndExplicitReciprocity:CM.3.
- **One owner** for weakly special subvarieties: LD.6 (per PAPER-TSIMERMAN-18) or MOK-PILA-TSIMERMAN-19's Part II of LogicAndDefinabilityInNumberTheory.
- **Deligne's absolute Hodge theorem** is planned nowhere. Pink's implication (item 6) needs it.

## 7. Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-MASSER-ZANNIER-20.result.json`: ok.
- `source_issues.check_issues` and `check_errata.versions_checked`: no errors.
- **Intake file validation** on the four deliverables: 0 problems.

Pre-review inputs at `9039c426a456d1332487193dc84819c19067aacf` (SHA-256):

| Input | SHA-256 |
| --- | --- |
| PAPER-MASSER-ZANNIER-20.result.json | `e252ae0b8c0e18a39bf51c843bd94e3aa7ed697c255e389277993ceeb6823a22` |
| PAPER-MASSER-ZANNIER-20.md | `919c2abf5241e51984dc388e86e0c8737a8fbf990c0c5e07ff5a3d0ef013527c` |
| data/atlas.json | `62ab6c2ccb94ee9c4d99813da02b69656941721d30fc29384e2b7e6e86361c56` |

No Lean file is a deliverable, and no Lean was run.
