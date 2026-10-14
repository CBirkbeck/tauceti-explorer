# Independent review: P-adic differential equations and rigid cohomology, RD.6 follow-up

**Verdict: accepted, with corrections made in place.** The packet is a complete pass over stage RD.6, and its coverage stays `planned`.

- **Nodes.** Of the 27 nodes, one is withdrawn as a duplicate of a lower layer. Of the remaining 26, 5 are verified and 21 corrected. No node was added.
- **Baseline.** The 13 Mathlib declarations were confirmed at the pins. Four Tau Ceti declarations were added, and they replace a request.
- **What remains open.** Eight gaps, three requests and eight `remaining` items are recorded honestly.
- Acceptance certifies the plan, not any formalisation.

- **Reviewer.** Claude (Opus 5.5), session `claude-Brfan8`, job `REV-PadicDifferentialEquationsAndRigidCohomology--RD.6` (#9756), 14 October 2026.
- **Work under review.** `BP-PadicDifferentialEquationsAndRigidCohomology--RD.6` (#9748, PR #9788), written by session `claude-oL1sdf`. This session wrote no part of it.
- **Files changed.** The packet, the reader document, the suggested Lean file, this report and the handoff note.

## What was checked

| Item | Result |
| --- | --- |
| Nodes | 27 → 26: 11 theorems, 10 lemmas, 3 constructions, 2 definitions; 5 verified, 21 corrected, 1 withdrawn (`RD.6/highest-break-equals-ramification-break`) |
| API items | 33 → 34; 2 restated (`fourierAut_extend`, `kummerIsocrystal_int`); 1 added (`dworkCharacter_splitting_value`, answering a request of DirichletPadicLFunctions L3) |
| Unit tests | 22; 1 restated (`kloostermanIsocrystal_degenerate`) |
| Acceptance tests | 4 corrected or replaced (Kloosterman relation, Hankel threshold, symmetric-power case, recognition test) |
| Baseline declarations | 13 Mathlib read at `082e2d3`, all confirmed; 4 Tau Ceti added after reading them at `f790474` |
| Prerequisites outside this packet | Every one resolves. Each supplier statement was read in its packet (RD.1–RD.5, the parent, DWP.0, R01.3, LPV.1, CA.6, SF.0, AdicSpacesPartII R3, LocallyAnalyticDistributions L4) |
| Requests | 4 → 3. The ReductiveGroups Layer 1 request is withdrawn (the Tau Ceti library has what it asked for). The JacobianChallenge request now names Layer F's rational-point hypothesis. The L4 request now says "orthogonal" basis, as van der Put does |
| Gaps | 8; gap 1 now also names the algebraic Euler–Poincaré formula for meromorphic connections |
| Source issues | E-RD6-1 confirmed; E-RD6-2, E-RD6-3 and E-RD6-4 added and confirmed |
| Planets | 6 here and 6 in the parent. One planet moved: "Irregularity equals Swan conductor" is the name of RD.2's local theorem, so RD.6's planet is now "p-adic Euler–Poincaré formula" (Christol–Mebkhout's name, Théorème 1.2) |
| `check_blueprint.py` | With the pinned declaration index: 0 errors, 0 warnings, before and after the review |
| Cycles and tiers | The union of all packets has no cycle through an RD.6 node, and no RD.6 node cites a later layer. Every other roadmap cited is in a lower tier of `upstream/CaraianiNewton.md` (tiers 2–11, against RD's 12). An in-memory `merge_blueprints` run with `data/atlas.json` succeeds and skips no link |
| Lean | `lean-check` exited 0 before the edit (20 warnings) and after it (21), all `declaration uses sorry`. A `run_cmd` audit found no proof placeholder inside a statement or a definition body |
| Reader | Regenerated from the corrected packet by a renderer that first reproduced the old reader byte for byte |

## Sources

All 16 sources were downloaded, and every SHA-256 matches the packet. The maintainer's library copy of van der Put was used; Numdam serves the same file. Each node was read at every locator. The following were read on page images:

- Kedlaya Weil II, p. 30;
- Crew 1998, p. 759;
- Crew 1994, pp. 4, 10 and 11.

| Source | Read |
| --- | --- |
| Kedlaya, Weil II, arXiv v3 | §2.1 (pp. 9–10); §§4.2–4.4 (pp. 29–36); §6.1 (pp. 40–41); 6.2.1 (pp. 42–43); 6.4.3–6.4.4 (pp. 47–48); 6.5.1 (pp. 48–49); 6.6 (pp. 50–52); 6.7 (pp. 52–53); bibliography |
| Kedlaya, Notes on isocrystals v6 | pp. 6–7, 20–25 |
| Kedlaya, overview | §4.6–4.7 (pp. 25–27); §5.4 (pp. 33–36) |
| Kedlaya, Swan conductors I v3 | §3.5 (pp. 22–25) |
| Christol–Mebkhout, Astérisque 279 | Chapter I (pp. 126–129); Définitions 10.1–10.9, 11.7–12.2 and 13.1 (pp. 160–167); Chapter IV, §14 (pp. 170–173) |
| Crew 1992 | pp. 429–436 |
| Crew 1998 | §3 (pp. 725–727); §9 (pp. 752–755); §10 (pp. 756–762) |
| Crew 1994 | §1 (pp. 3–11) |
| Deligne, Weil II | (1.6.1)–(1.6.14) (pp. 165–171); §1.8 (pp. 175–176) |
| Deligne–Milne (Milne's 2018 copy) | Theorem 2.11–Proposition 2.21 (pp. 21–25) |
| Abe, arXiv v1 | §§5–6 (pp. 6–8) |
| Abe–Marmora v3 | p. 46 |
| Poineau–Pulita V v3 | p. 39; Theorem 3.5.2 (p. 50) |
| Xu–Zhu v2 | §§2.1.4–2.1.5 (pp. 9–10); §1.1.3 (p. 3) |
| Fresán–Sabbah–Yu v5 | Remark 3.7, Theorem 3.8 (pp. 21–22); §3.2 (pp. 23–25) |
| van der Put | §1 (pp. 33–35); §3 (pp. 39–40) |

No source text is in the repository, and no passage is quoted in the deliverables.

## Baseline

- **Mathlib.** Each of the 13 declarations was read in its file at `082e2d3`: `AddChar` and `AddChar.zmodChar`, `AddChar.sum_eq_zero_of_ne_one`, `Algebra.trace`, `IsPrimitiveRoot`, `PowerSeries.exp` and `PowerSeries.mk`, `RatFunc`, `Polynomial.reverse`, `CategoryTheory.MonoidalCategory`, `CategoryTheory.RightRigidCategory`, `FDRep`, `LinearMap.trace`. Each provides what its citing nodes use.
  - `Polynomial.reverse` was cited by the Kummer node, which does not use it. It moved to `nonnegative-slopes-constant-coefficients-on-curves`, which does.
  - Mathlib's `TannakaDuality.FiniteGroup.equiv` exists at the pin, as the recognition node's finite-group test says.
- **Tau Ceti (added).** These four were read with `git show f790474:` and cross-checked against the pinned declaration index:
  - `TauCeti.FGComoduleCat` (`Comodule/Finite/Basic.lean`);
  - `TauCeti.FGComoduleCat.instSymmetricCategory` (`Finite/Symmetric.lean`);
  - `TauCeti.FGComoduleCat.instRigidCategory` (`Finite/Rigid.lean`);
  - `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` (`AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean`). For a commutative Hopf algebra over a field, it identifies the functor of points with the tensor automorphisms of scalar extension on finite comodules, naturally in the algebra.
- **Tau Ceti roadmaps.** The current TauCetiRoadmap main has the two layers the packet cites:
  - JacobianChallenge Layer F: Abel–Jacobi with its universal property, for a curve with a rational point.
  - ReductiveGroups Layer 1: comodules and reconstruction, but not recognition.

## Corrections

1. **Duplicates of the concurrent RD.2 and RD.3 follow-ups.**
   - **The overlap.** RD.2, RD.3 and RD.6 were planned at the same time. RD.6 restated four results the lower follow-ups state:
     - Matsuda's comparison of differential and ramification breaks: `RD.2/matsuda-highest-break-theorem`, and `RD.2/irregularity-equals-swan-conductor` (a);
     - the local equality Irr = Swan: `RD.2/irregularity-equals-swan-conductor` (b);
     - the Kummer isocrystal: `RD.3/kummer-isocrystal`, with the p-power Frobenius structure and the same direction convention;
     - Crew's unit-root correspondence: `RD.3/crew-unit-root-correspondence` and `RD.3/unit-root-f-isocrystal`.
   - **The fix.** `RD.6/highest-break-equals-ramification-break` is withdrawn; no packet cited it. The three other nodes now cite their lower owners and state only what they add:
     - `irregularity-equals-swan`: the identification at the points at infinity of a curve;
     - `kummer-isocrystal`: the q-power Frobenius over F_q, which exists for a ∈ (q − 1)^{-1}Z, and its trace function;
     - `unit-root-isocrystals-and-p-adic-representations`: the K-coefficient form, and Tsuzuki's theorem on curves through `RD.2/tsuzuki-equivalence-finite-local-monodromy`.
   - **For the assembly.** A `restructure` entry records the owners.
2. **The Tau Ceti library already has the comodule input.**
   - **The problem.** `neutral-tannakian-recognition` requested comodules, the comodule dictionary and reconstruction from TauCetiRoadmap ReductiveGroups Layer 1. The pinned library has all three.
   - **The fix.** The request is withdrawn, and the node cites the four library declarations above. Its proof now follows Deligne–Milne Lemma 2.13 and Propositions 2.14 and 2.16, which were read, with Rep_K(G) taken as finite comodules over B. The upstream note to ReductiveGroups now says what the library already has.
   - **The Lean file** gains the statement `neutralTannakian_recognition` against Mathlib's rigid symmetric monoidal categories and `TauCeti.FGComoduleCat`. Its omitted clauses are marked.
3. **The Kloosterman relation had the wrong sign.**
   - **The problem.** An acceptance test of `kloosterman-f-isocrystal` gave Kl_2(z; q²) = Kl_2(z; q)² − 2q.
   - **The fix.** Tr F^r = −Kl_2(z; q^r) and det F = q give Kl_2(z; q²) = 2q − Kl_2(z; q)², the relation that matches Carlitz's L-function 1 + Kl_2 t + q t². It was checked numerically for every z and q = 3, 5, 7, 11.
4. **The Hankel threshold.**
   - **The problem.** `rational-descent-of-power-series` said D_n = 0 for n ≥ 2 for f = Σ (1 + q^r) t^r.
   - **The fix.** In CA.6's convention, D_n = det(a_{i+j+1}) for 0 ≤ i, j < n. So D_1 = 1 + q, D_2 = q(q − 1)² ≠ 0, and D_n = 0 from n = 3 on. This was computed exactly for q = 2, …, 9. The Hankel determinants of exp(t) are nonzero for n ≤ 10.
5. **The symmetric-power node.**
   - **The hypothesis.** The node assumed kn > 2. Fresán–Sabbah–Yu Theorems 3.8 and 3.12 assume kn ≥ 2, and only for the hypersurface description; this is now part (c).
   - **The test.** Its first test (k = n = 1) lay outside the node's hypotheses. It is replaced by H^1_mid(G_m, Kl_2) = 0, re-derived from the one-dimensional local invariants at 0 (weight 0) and none at ∞. This is the rigid counterpart of their Remark 3.7.
6. **The global Euler–Poincaré proof** (`christol-mebkhout-global-euler-characteristic`).
   - **Unlisted results.** Step 2 used three results it did not list: `RD.6/irregularity-equals-swan`, `R01.3/local-induction-formula`, and Kedlaya's Proposition 6.6.1, which is `RD.3/etale-cover-of-affine-space`. They are now listed. `RD.5/principal-parts-index-computation` was added for χ(C/K, O_C).
   - **The point-removal step.** The node said removing a point "adds r to −χ and r to the right side". Both sides drop by r. Kedlaya's own text says "increases"; this is recorded as E-RD6-4.
7. **R01.3 tiers.** `irregularity-equals-swan` claimed that for finite k only R01.3's finite-residue-field tier is used. But the break comparison (overview Theorem 5.4.10) passes to an algebraically closed residue field, so it rests on R01.3's tier (P) and its recorded gap. This is now said in the node, in the R01.3 restructure entry and in `remaining`.
8. **Locators and matches.**
   - **Kedlaya Weil II.** The match for Proposition 6.1.2 described Corollary 6.1.3. The twist to weight 0 is in the proofs of 6.5.1 (p. 48) and 6.6.2 (p. 50), not on p. 40.
   - **Swan I.** Proposition 3.5.5 is on p. 23. Remark 3.5.14 concerns the coefficients and not the comparison; one match attributed 3.5.5's content to it.
   - **Abe.** Corollary 6.3 is on p. 8, and it is conditional on his Conjecture (D).
   - **Crew 1998.** Corollary 9.6 is stated for smooth affine curves and strict isocrystals. The coefficient-category node now says so.
   - **Kedlaya's Remark 4.2.3.** The extended ρ(F) is (Σ c_i ∂^i x^i)(dx^σ/dx)F. The API item and two texts had dropped the x^i.
9. **Smaller corrections.**
   - **Katz–Lang node.** "Equivalently" became "In particular": an infinite product of copies of Z/p has only characters of finite order.
   - **Rank-one monodromy.** The finite monodromy group is now "contained in μ_n", with the Tannakian node as a prerequisite.
   - **Dwork character.** It now cites `RD.1/dwork-overconvergence-proof` for the radius that lets θ(1) be evaluated.
   - **Unit-root correspondence.** The geometric-Frobenius normalisation is not stated by the cited sources; it was checked on Spec F_q, where the arithmetic Frobenius acts on the fixed vectors by F^{-1}.
   - **Nuclear traces.** The node now notes that van der Put's (1.5) is linear algebra for his notion of nuclear operator, which narrows what L4 must supply.
   - **A consumer's request.** DirichletPadicLFunctions L3 asks RD.6 for the splitting value of Robert's series Θ_q = exp(π(X − X^q)) at Teichmüller points, and for a coefficient bound. A new API item of `dwork-additive-character` states the value for odd p; it is Dwork's identity, already used by the sign dictionary. The case p = 2 and the q-power coefficient bound (Robert's book, not read here) are recorded in `remaining`.
10. **Reader.**
    - **The old reader had rendering faults:**
      - 126 spurious emphasis spans (an `_` after a Greek letter, or `^*`, opens emphasis in `src/markdown.js`);
      - "[1/p](π)" rendered as a link;
      - two API and test table rows were broken by a `|`;
      - "Marius van der Put" was cited as "Put".
    - **How it was regenerated.** It was re-rendered from the corrected packet with additive escaping. A Python port of the site's inline parser finds no unintended span, and removing the escapes gives back exactly the unescaped rendering.
    - **The framing prose** (introduction, dependency table, section introductions, layer acceptance) was updated for corrections 1–3.

## Source issues

| Id | Verdict | Check |
| --- | --- | --- |
| E-RD6-1 (Xu–Zhu §2.1.5 (ii), Kummer multiplier) | confirmed | Xu–Zhu fix the direction F^*M → M in §2.1.4. For ∇ = d − a dt/t that direction forces t^{−(q−1)a}. The remark on the parent's E69 was made precise: E69's inference holds in the module-to-pullback direction. |
| E-RD6-2 (Crew 1998 (10.6.3), p. 759) | added, confirmed | Crew prints FN = q_y NF. Horizontality of his Φ : F^*M → M gives NF = q_y FN, as Kedlaya writes (EF = qFE, p. 48). The printed form contradicts his Theorem 10.8, where N lowers weights by 2. A misprint; it affects nothing. |
| E-RD6-3 (Crew 1994 (1.5.1), p. 11) | added, confirmed | The formula lacks the sign (−1)^{n−1}, which Lefschetz on the fibre G_m^{n−1} forces. With Crew's own Frobenius on the Dwork F-isocrystal (p. 10, pullback direction of p. 4), the p-adic trace uses ψ^{-1}. For odd n the two characters' sums differ by a ↦ −a. |
| E-RD6-4 (Kedlaya Weil II, pp. 33–34) | added, confirmed | Kedlaya says removing a rational point "increases" both sides of (4.4.2) by rank(E). Both sides decrease (E = O on A^1 against G_m). A misprint; it affects nothing. |

No erratum was found for these papers:

- the Numdam item pages of Crew 1994 and Crew 1998 link none;
- Kedlaya's papers page lists none for Weil II.

## Numerical checks redone

- **Kloosterman relation.** Kl_2(a; p²) = 2p − Kl_2(a; p)², with complex characters, for p = 3, 5, 7, 11 and every a.
- **Hankel determinants.** In CA.6's convention, for Σ (1 + q^r) t^r: D_1 = 1 + q, D_2 = q(q − 1)², and D_n = 0 for n ≥ 3 (q = 2, …, 9). For exp(t): D_n ≠ 0 for n ≤ 10.
- **Teichmüller lift.** The lift of 2 in Z_3 is −1, which the Kummer test with q = 3, a = 1/2 uses.
- **Re-derived by hand:**
  - horizontality of every Dwork and Kummer pair in the dictionary;
  - Dwork's identity giving ψ_π(Tr x_0)^{−ε};
  - θ(1)^p = 1;
  - the Euler–Poincaré tests (A^1, G_m, L_{x^d}, K_a, Kl_{n+1});
  - the nuclear-trace test on K⟨x⟩† (traces q and 0);
  - the Katz–Lang test on an elliptic curve (image ≅ E(F_q)).

## Red-team findings

- **RT-AREA-padic-2/34.** Handled. The local index theorems are an RD.1-parented node. The global formula and the comparison at the points at infinity are at RD.6, on RD.2's local comparison. The edge R01.3 → RD.6 is proposed, and the review adds the tier (P) caveat.
- **RT-AREA-etale/9.** Handled. Every weight notion is imported from DWP.0, and the edge and the owner record are proposed.

## Questions for the orchestrator

1. **The RD.2 and RD.3 reviews.** Both merged while this review ran (#9816 and #9811), and both were accepted. They keep every id RD.6 now cites:
   - `RD.2/irregularity-equals-swan-conductor` and `RD.2/matsuda-highest-break-theorem`;
   - `RD.2/tsuzuki-equivalence-finite-local-monodromy`;
   - `RD.3/kummer-isocrystal`;
   - `RD.3/crew-unit-root-correspondence` and `RD.3/unit-root-f-isocrystal`.

   After fast-forwarding, the statements of these nodes were compared with the start of the review. Two RD.2 statements changed in wording only (solvability made explicit; K discretely valued), and neither affects RD.6's use. The RD.2 review independently proposed the same ownership change as correction 1 (its report, "New restructure proposal"); this review applies it on the RD.6 side.
2. **The parent's E69.** Its reason argues in the module-to-pullback direction (see E-RD6-1). The parent packet was not edited; its next revision may want to say so.
3. **Overlap with DirichletPadicLFunctions L3.** That higher-tier roadmap plans the same correspondence between π and ζ with ζ ≡ 1 + π, and the trace character (`gross-koblitz-cyclotomic-unit-normalized-root`, `gross-koblitz-field-pi-congruence`, `gross-koblitz-trace-character`). Since RD (tier 12) is lower, its package could import `RD.6/dwork-additive-character`. Its two requests to RD.6 are now answered in part (see correction 9); the rest is in `remaining`.
4. **The pending Tau Ceti TraceFormula pull request.** The parent's notes record PR 196 (Layers 12–13: arithmetic zeta functions) as a pending provider. If it is adopted, the elementary part of `RD.6/closed-points-and-zeta-function` should be checked against it before packaging.
