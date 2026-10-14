# Independent review: P-adic differential equations and rigid cohomology, RD.7 follow-up

**Verdict: accepted, with corrections made in place.** The packet is a complete pass over stage RD.7, with coverage `planned`. Of its 13 nodes, 6 are verified and 7 corrected; none was added or removed. All six baseline declarations were confirmed at the pins. Three gaps, three requests and seven `remaining` items are recorded honestly. Acceptance certifies the plan, not any formalisation.

- **Reviewer.** Claude (Opus 5.5), session `claude-ylTapP`, job `REV-PadicDifferentialEquationsAndRigidCohomology--RD.7` (#9757), 14 October 2026.
- **Work under review.** `BP-PadicDifferentialEquationsAndRigidCohomology--RD.7` (#9749, PR #9785), written by session `claude-n6fYvL`. This session wrote no part of it.
- **Files changed.** The packet, the reader document, the suggested Lean file, this report and the handoff note.

## What was checked

| Item | Result |
| --- | --- |
| Nodes | 13: 2 constructions, 7 theorems, 2 lemmas, 2 applications; 6 verified, 7 corrected |
| API items | 17; 3 restated (`tubeToEnvelope_coeff`, `tubeToEnvelope_cohomology`, `Tuitman.frobeniusMatrix`) |
| Unit tests | 8 → 9; added `RigidCohomology.Tuitman.frobeniusPower_order` |
| Baseline declarations | 6 read at Mathlib `082e2d3` and Tau Ceti `f790474`; all confirmed, none removed |
| Prerequisites outside this packet | 49 distinct references after the review (parent-packet nodes, other roadmaps' nodes and stages); each was read in its supplier packet |
| Requests | 3 read against the supplier layers (R01.6; R11.5 package §5.3; R07.3 `dSt_isWeaklyAdmissible`); all precise, all to lower tiers |
| Gaps | 3; the Katz–Messing gap's `neededBy` narrowed |
| Source issues | E701–E704 confirmed; E705, E706 and E707 added and confirmed |
| Planets | 3 here, 3 in the parent: 6 for the layer, the maximum; names come from the sources |
| `check_blueprint.py` | With the pinned declaration index: 0 errors, 0 warnings, before and after the review |
| Cycles and tiers | The union of the roadmap's packets (347 nodes) has no cycle and no edge to a later stage. All 8 other roadmaps cited are in lower tiers of `upstream/CaraianiNewton.md` (tiers 6–11 against RD's 12) |
| Lean | `lean-check` exited 0 before and after the edit, with 15 warnings, all `declaration uses sorry` |

## Sources

All 16 sources were downloaded; Deligne came from the Numdam PDF of the item page. Every SHA-256 matches the packet. Each node was read at every locator.

| Source | Read |
| --- | --- |
| Berthelot, *Finitude et pureté* (1997 preprint, web.archive) | §1, Proposition 1.9 and its proof, printed pp. 13–15 |
| Shiho, arXiv:0707.1742v2 | Introduction p. 1; Proposition 2.35 (the functor Φ), pp. 29–30; the map before Theorem 2.36, Theorem 2.36, Corollaries 2.37–2.38, pp. 30–31 |
| Kedlaya, *Notes on isocrystals* v6 | Definition 2.1, Theorem 2.2, Remark 2.3, pp. 2–3; Definition 8.1–Remark 8.5, p. 20 |
| Guo–Reinecke v3 | Theorem 6.13 with proof and footnote 13, PDF pp. 60–61 |
| Deligne, Weil I (Numdam) | pp. 274–277 |
| Milne, LEC v2.21 | §27, pp. 155–159; Lemma 27.10 (p. 158) read on the page image; the author's errata page |
| Kedlaya, Weil II v3 | §1.1, p. 3; §6.6, pp. 50–52 |
| D'Addezio v4 | proof of Theorem 5.1.6, p. 25 |
| Kedlaya, hyperelliptic point counting, arXiv v2 | pp. 3–6 |
| Kedlaya's errata note (2003) | whole note |
| Edixhoven, *Point counting after Kedlaya* (2006) | §4.3, pp. 9–14, with p. 14 on the page image; §5.2–5.3, pp. 16–19 |
| Harvey, arXiv v2 | §3 and §4 (Proposition 2 with its proof), pp. 5–6 |
| Tuitman II, arXiv v2 | pp. 2–5, 9, 11–15 |
| Tuitman's June 2020 erratum | whole erratum |
| BDMTV, arXiv v1 | §5.2, (22)–(24), p. 25 |
| Fresán–Sabbah–Yu v5 | §5.1.5, pp. 49–52, with p. 51 on the page image |

The author's Magma code for Tuitman's algorithm (github.com/jtuitman/pcc, `pcc_q/zeta_q.m`) was read for the matrix convention only. No source text is in the repository, and no passage is quoted in the deliverables.

## Baseline

Each declaration was read in the source file of the pinned build, and cross-checked against the pinned declaration index.

| Declaration | Confirmed statement |
| --- | --- |
| `PowerSeries.ext` | Power series with equal coefficients are equal (`RingTheory/PowerSeries/Basic.lean:97`) |
| `IsIntegrallyClosed.eq_map_mul_C_of_dvd` | A divisor in K[X] of a monic f ∈ R[X], times its inverse leading coefficient, comes from R[X] (`GaussLemma.lean:80`) |
| `IsGalois.mem_range_algebraMap_iff_fixed` | For finite Galois E/F, x ∈ F iff it is fixed by Gal(E/F) (`Galois/Basic.lean:340`) |
| `Matrix.charpolyRev` | `det (1 − X • M.map C)` (`Charpoly/Coeff.lean:291`) |
| `Matrix.reverse_charpoly` | `M.charpoly.reverse = M.charpolyRev` (`Charpoly/Coeff.lean:293`) |
| `WeierstrassCurve.frobeniusTrace` | `q + 1 − pointCount`, with `frobeniusTrace_eq_card_point` on elliptic models; read in `PointCount.lean` at `f790474` through the GitHub API and in the pinned build |

Current TauCetiRoadmap main (`0d144d0`) and the current Tau Ceti library have no rigid, crystalline, point-counting or weight-separation development. TraceFormula PR #196 is still open at `4bd7237`, as the upstream note says.

## Corrections

1. **Coefficients of the comparison theorems** (nodes `tube-to-envelope-comparison-map`, `comparison-map-quasi-isomorphism`, `crystalline-rigid-comparison-with-coefficients`).
   - **The problem.** The packet attached a convergent isocrystal E to every crystal M of finite locally free modules, citing RD.3/restriction-to-convergent. That node gives the correspondence only with Frobenius structures. Kedlaya's Theorem 8.3 assumes an F-crystal (through Theorem 2.2). Shiho's Theorem 2.36 starts from a locally free convergent isocrystal E and its crystalline isocrystal Φ(E) (Proposition 2.35).
   - **The fix.** The coefficient version of Berthelot's map now takes E and has target Φ(E)_D. Ogus's comparison is stated for F-crystals. A Frobenius-free variant covers crystals with M ⊗ Q = Φ(E).
   - **Why the hypothesis matters.** A non-example was added and checked by hand. On G_m over W(F_{p^2}), take a = pμ with μ mod p ∉ F_p. The connection d + a·dt/t is topologically quasi-nilpotent, so it is a crystal. But v_p(binom(a, n)) = 1 + ⌊(n − 1)/p⌋ − v_p(n!), so its Taylor series converges only for |ξ| < |p|^{1/(p(p−1))}. Its isocrystal is therefore not convergent.
   - **Uniqueness.** Berthelot proves uniqueness on the closed tube. The packet asserted it on the open tube without argument; it now has one: A ⊗ Q is dense in each affinoid algebra of an exhausting family.
   - **Locator.** The Shiho locator now includes Proposition 2.35, on pp. 29–31.
2. **Proof of the abelian-variety theorem.** Step 3 cited DWP.1/point-counts-of-abelian-varieties for H^i_et = ∧^i H^1_et, which that node does not state. It gives Z(A, t) with P_r the characteristic polynomial of π on ∧^r T_ℓA.
   - Parts (1) and (2) are now proved by weight separation. One side is DWP.1's zeta function, made pure by DWP.1/weil-estimate-for-abelian-varieties and DWP.0/weil-number-arithmetic. The other is the rigid factors, from RD.7/rigid-zeta-expression and RD.7/weil-factors-rational-and-integral. RD.7/weight-separated-factor-extraction (4) identifies them.
   - The ℓ-adic H^1 still uses the R01.6 request.
   - Katz–Messing is no longer needed, so gap 3's `neededBy` drops this node.
3. **Two reversed prerequisites.** `kedlaya-reduction-denominators` and `hyperelliptic-integral-frobenius-lattice` listed the parent's `RD.7/kedlaya-point-counting-certification` as a prerequisite. That node states Lemmas 2 and 3 and the q-Frobenius product as its items (iv)–(vi), and it records Edixhoven's Lemma 4.3.5 as an unread gap. So it is the consumer of these two nodes, not their supplier.
   - Once the assembly adds the forward edges, the old edges would close a cycle. They are removed, and the forward edges are a new `remaining` item for the assembly.
   - The lattice node's Frobenius step now names its actual inputs:
     - the lift, RD.0/frobenius-lift-on-dagger-algebra;
     - lift independence, RD.4/mw-comparison-for-affine-curves and RD.4/frobenius-independent-of-lift (b);
     - σ-semilinear compatibility of the comparison, `crystalline-rigid-comparison-with-coefficients` with M = O.
4. **Tuitman's matrix convention.**
   - **The convention.** The node uses BDMTV's row convention with the decreasing twisted product F^{σ^{n−1}}⋯F. That is correct, and it is what Tuitman's code does.
   - **Where the paper differs.** Tuitman's Step III writes the matrix in columns, which does not match the product in his Proposition 4.7 (E707).
   - **The fix.** The convention is now stated in the node and in the `frobeniusMatrix` API.
   - **The new test.** `frobeniusPower_order` shows that the order matters: over W(F_8), F_8 = F_2[a]/(a^3 + a + 1), lift the matrix with rows (0, 1) and (a, a^2). The two orders give traces 0 and 1 modulo 2, computed by hand and by machine.
5. **Locators.**
   - Harvey's discussion of Kedlaya's Lemmas 2 and 3 is in §4 (proof of Proposition 2, p. 6), not §3. This is corrected in node 7, E701 and the source's read sections.
   - Tuitman's Definition 2.1 is on p. 2; Steps III–IV (p. 12) were added.
   - The Kedlaya Weil II §1.1 match no longer attributes the abelian-variety reading to Kedlaya.
6. **An unsupported acceptance test.** One test said the rigid–crystalline comparison matches the cycle classes of a point on P^1. Nothing in the plan supplies compatibility of cycle classes, so the test was replaced by the identity of H^*_dR(P^1) under the lift.

## Source issues

| Id | Verdict | Check |
| --- | --- | --- |
| E701 (Kedlaya errata, Lemma 3 formula) | confirmed, as scoped | The y dx reduction for Q = x^3 + x + 1, p = 5 was recomputed exactly; the x dx/y coefficient 2/5 is forced for every admissible F. Edixhoven 4.3.5 and Harvey §4 agree with d(m′ + 1) − 2 for the even exponent. The journal's indexing was not available to the review either. |
| E702 (errata index range) | confirmed | The note's range starts at 1; the basis starts at 0. |
| E703 (Edixhoven v_∞(y)) | confirmed | Page image of p. 14. |
| E704 (Tuitman Assumption 1(3)) | confirmed, known | The June 2020 erratum. |
| E705 (Milne, proof of Lemma 27.10, p. 158) | added, confirmed | The proof concludes \|c_i\|_ℓ < 1, but only \|c_i\|_ℓ > 1 was excluded; f = 1/(1 − t) shows equality occurs. A misprint that affects nothing. |
| E706 (Milne, 27.14(c), p. 159) | added, confirmed | The proof passes from 'reciprocal roots are algebraic integers' to P_{r,ℓ} ∈ Z[t] without rationality. That needs Galois-stable root sets, which purity supplies. A gap in the proof only. |
| E707 (Tuitman, Step III against Proposition 4.7) | added, confirmed | Column convention with the row-convention product. The author's code uses rows. A misprint that affects nothing. |

Milne's errata page (LEC v2.21 section) and Tuitman's erratum were searched for E705–E707; neither has them.

## Numerical checks redone

- **Elliptic curves.**
  - y^2 = x^3 + x + 1 over F_7: 5 points, a = 3, discriminant −31 ≢ 0 mod 7.
  - y^2 = x^3 + x over F_5: 4 points, a = 2.
  - y^2 = x^3 − x over F_3: a = 0.
  - y^2 = x^3 + x over F_7: supersingular, 1 + 7t^2 over F_7 and (1 + 7t)^2 over F_49.
- **Genus two.** For y^2 = x^5 + x + 3 over F_7: 11 points over F_7 and 55 over F_49. The squarefreeness of x^5 + x + 3 mod 7 was checked. Both counts agree with 1 + 3t + 7t^2 + 21t^3 + 49t^4, which confirms the inherited PARI/GP value.
- **Tuitman's precision.** B = 3 for genus two over F_7, and binom(4g, i) ≥ 2·binom(2g, i) for 1 ≤ i ≤ g.
- **Tests on tubes and PD envelopes.**
  - Σ b_n n!·t^{[n]} lies in D̂ ⊗ Q for every function on the open disc.
  - Σ p^k t^{[p^k]} diverges for |p|^{1/(p−1)} < |t| < 1.
  - Σ p^k t^{p^{2k}−1}dt has no primitive in the Tate algebra.
- **Kloosterman dimensions.** The formula was checked for k = 2, 3, 4, 5 and 8.
- **Precision loss on the monomial basis.** The induction giving loss p^{−(j−1)c} after j factors was re-derived.

## Reader document and suggested file

- **Reader.** The 13 node sections are a deterministic rendering of the packet. The review rebuilt that rendering and confirmed it reproduces the original text exactly. It then re-rendered the 7 changed sections from the corrected packet. The surrounding sections were edited to match:
  - conventions on matrices and coefficients;
  - suppliers;
  - internal dependencies;
  - the Section 1 and Section 3 introductions;
  - gap 3;
  - the seven source issues, with verdicts;
  - the two new remaining items;
  - Harvey's, Shiho's and Tuitman's read sections.
- **Suggested file.** It states nothing the corrections change. Its list of unstated names now includes `frobeniusPower_order` and records the row convention. It elaborates (see above).

## Questions for the orchestrator

1. **Assembly of RD.7.** Add `RD.7/kedlaya-reduction-denominators` and `RD.7/hyperelliptic-integral-frobenius-lattice` to the prerequisites of the parent's `RD.7/kedlaya-point-counting-certification`, and drop its Lemma 4.3.5 gap. This is recorded in `coverage.remaining`.
2. **RD.3 follow-up (#9745).** Shiho's functor Φ on convergent isocrystals without Frobenius is sketched inside node 1 and used by the Frobenius-free variant of Ogus's comparison. RD.3/restriction-to-convergent gives the coefficient model only with Frobenius. Should the RD.3 follow-up give Φ its own node, or should the variant stay a remark?
3. **Restructure proposals.** The three proposals stand as written: DWP.0 as final owner of the weight-separation lemmas; the Kloosterman applications moved to CohomologyComparisons:CP.4; the RD.3/RD.7 ownership split. The review found no reason to change them.
