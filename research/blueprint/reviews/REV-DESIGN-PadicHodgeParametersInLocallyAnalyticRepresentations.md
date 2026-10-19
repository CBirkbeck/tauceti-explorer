# Independent review: p-adic Hodge parameters in locally analytic representations of GL_n

**Verdict: accepted, after corrections in place.** This is the complete review, not a checkpoint. Claude (session claude-h2BY32) reviewed the new roadmap that Codex (session codex-bLRWOL) designed in DESIGN-PadicHodgeParametersInLocallyAnalyticRepresentations (issue #3467). Refs #3586. Review date: 2026-10-19.

The review covered all four files of the roadmap `PadicHodgeParametersInLocallyAnalyticRepresentations`: the roadmap definition, the blueprint packet, the reader document and the suggested Lean file. All four are corrected in place and agree with one another. All 30 nodes were checked: **16 verified, 14 corrected, 0 added, 0 unverifiable**.

| Inventory | Design | After review |
| --- | ---: | ---: |
| Nodes (definitions / constructions / theorems) | 30 (4 / 13 / 13) | unchanged |
| API items / unit tests | 85 / 68 | unchanged in the packet; the Lean file now names every PH.0–PH.1 test |
| Planets | 26 | 24 (two bookkeeping planets removed) |
| Baseline declarations | 8 | 8, all confirmed |
| Requests | 4 | 2 (two provisional filings removed) |
| Gaps | 3 | 3, narrowed to what no roadmap owns |
| Cross-roadmap node prerequisites | 2 | 15 |
| Stages planned / closed | 6 / 0 | 6 / 0 |
| Source issues | 9 (no verdicts) | 12, all confirmed (E6 reclassified; E10–E12 new) |

## What was read

- **Ding, *p-Adic Hodge parameters in the crystabelline representations of GL_n*, Publ. Math. IHÉS 142 (2025), 1–74**, the published open PDF at pmihes.centre-mersenne.org. Its SHA-256 matches the packet's record (741a49c0…05ba). I read pp. 9–59 in full: §2.1–§2.4 (conventions, the modification D_σ, trianguline, paraboline and σ-de Rham deformations, higher intertwining) and §3.1–§3.2 (principal series, parabolic and σ-analytic inductions, the comparison, π_min, recovery and the Artinian reformulation). I read every node locator and every contract locator at its page. I checked page 43 on the rendered page as well as in the extracted text. Printed page numbers equal PDF page numbers.
- **Search for corrections.** The Springer article page lists no correction, and a web search for an erratum or corrigendum found none. The arXiv listing 2407.21237 has versions v1 and v2 only. Nothing from the paper is quoted here or in the corrected files.

### Baseline

I read all eight `baseline.declarations` in the pinned Mathlib source (082e2d37e8) and found each in the pinned declaration index:
- `Equiv.Perm` (abbrev, Logic/Equiv/Defs.lean);
- `LinearMap` and `Submodule` (structures);
- `LinearMap.ker`;
- `LinearMap.quotKerEquivOfSurjective` (the quotient by the kernel of a surjection);
- `LinearMap.finrank_range_add_finrank_ker` (rank–nullity, for a finite-dimensional domain);
- `TrivSqZeroExt` (R × M with square-zero M);
- `Module.Dual`.

Each provides what its citing nodes use. None was removed or added.

### Duplication and ownership

I checked the plan against TauCetiRoadmap main at 661f8ac9, fetched from GitHub because the local checkout is a stale feature branch. Two upstream roadmaps were read: PadicFunctionalAnalysis, which covers Banach, Mahler and Amice material on ℤ_p and none of these targets, and RepresentationTheory/LieHighestWeight, Layers 7 and 9. I also checked every atlas packet that cites Ding. No other roadmap plans the comparison t_D, π_min, recovery or the universal Artinian action.

What the review found is the reverse: a good part of the two input theories is already planned in accepted atlas packets, yet the design had assigned it to the two supplier designs that do not exist yet. That would have led those designs to plan it a second time. Finding 1 corrects this.

## Findings and corrections

1. **Supplier ownership (closure and duplication).** The design filed two "provisional" requests, against `LocallyAnalyticDistributions:L0` and against `PhiGammaModulesAndIwasawaCohomology:PG.7`. It also listed both stages as prerequisites of twelve nodes. Its own text says that neither stage owns the contracts. Requests filed against non-owners are not precise, and the direct dependency on L0 is not justified: L0, the Banach spaces of locally analytic functions, sits one level below what the nodes actually use. Both requests were removed. The nodes now cite the exact accepted supplier nodes:
   - `LocallyAnalyticDistributionsPartII:ND.1/distribution-algebra` and `ND.2/coadmissible-theorems`: distribution algebras of compact open subgroups and coadmissible modules, the foundation of LA1. Cited by PH.0/comparison-presentation, PH.2/minimal-extensions and PH.5/universal-extensions.
   - `PhiGammaModulesAndIwasawaCohomology:PG.7/rank-one-characters` and `PG.1/rank-one-dictionary`: the modules R_{K,E}(δ) and the normalisation ε=N|·|_K. Cited by PH.0/comparison-presentation and PH.2/central-character.
   - `PhiGammaModulesAndIwasawaCohomology:PG.2/etale-tilde-equivalence`: the étale dictionary for the K=Q_p consequence. Cited by PH.4/recovery.
   - `PadicHodgeTheory:P7/embedding-selective-crystalline-modification`, which plans exactly Ding's Proposition 2.5(1), the object D_σ. Cited by PH.3/modified-comparison.
   - `LocalGaloisDeformationRings:R08.1/phi-gamma-module-deformation-rings`, which plans R_D, R_{D,w}, R_{D,g}, R_δ, R_{δ,g} and the Cartesian square (3.55). Cited by PH.5/first-order-algebras.
   - `SmoothRepresentationsOfLocalGroups:SR.3/part-ii-principal-series-completion`, `part-ii-ordered-character-map` and `part-ii-principal-series-tangent`: Ĥ_φ, the maps 𝒥_w and their tangents. Cited by PH.5/first-order-algebras.

   The contracts were narrowed to match.
   - **LA1** consumes ND.1–ND.2.
   - **LA6** loses its smooth Bernstein-centre half to SR.3.
   - **TR1** consumes the Robba ring, rank-one and de Rham carriers (PG.1, PG.3, PG.7, P7).
   - **TR2** consumes R08.1 for Proposition 2.10(2)–(3).
   - **TR4** consumes P7 for D_σ and keeps the deformation-level 𝔗_σ (Propositions 2.23–2.24, Corollary 2.27).
   - **TR5** drops the étale dictionary, now consumed directly from PG.2.
   - **TR6** is already met by existing nodes.

   The detail of gaps G-LA and G-TR now names exactly what no roadmap owns. The stage `requires` and roadmap `prerequisites` in the definition, the reader's contract section, its "Unresolved input chains" and the library-audit bullets were updated in step. A dry atlas assembly with the corrected roadmap succeeds with no skipped links. The requires on LocallyAnalyticDistributionsPartII take effect once that packet is promoted.

2. **Locators.**
   - LA3: (3.10) is on p. 37, so the range is now pp. 37–39.
   - LA4: Proposition 3.13 is on p. 44, so the range is now pp. 42–44.
   - LA5: cites Proposition 3.20, not "Corollary 3.20".
   - TR1: the old "§2.3.2, p. 19" was wrong; the locator is now §2.1, pp. 9–11, and (2.1)–(2.2) on p. 11.
   - TR2: (2.12) is on p. 15, so the range is now pp. 15–18.
   - TR3: Corollaries 2.14–2.15 are in §2.3.1, not §2.3.2.
   - TR5: (2.39) is on p. 29, so the range is now pp. 29–32.
   - PH.1/endpoint-gluing: Proposition 3.13 is cited at p. 44, not p. 43.
   - Every other node locator was confirmed.

3. **Source issues (PROTOCOL.md section 18).** All nine recorded findings were checked at their locators and confirmed. Each now carries `"source": "DING25"` and a review verdict, and `sourceVersions` records the published PDF that was read.
   - **E6** is a sign slip whose intended meaning is clear: dim Ext̄¹_{F_P} = d_K dim(B∩L_P) + n. It is reclassified from error to misprint.
   - **E7** also occurs in (3.33) of Proposition 3.18(1), p. 46, which was added to its locator.

   Three new findings were added:
   - **E10 (misprint, pp. 31–32).** The σ-relation subspace is named with D_{2,σ} where C_{1,σ} is meant.
   - **E11 (gap, p. 51).** In the proof of Proposition 3.26, the bijection on tangent spaces is justified only by the invariants forming a polynomial algebra. In fact the bijection needs h to be regular: the Jacobian of the elementary symmetric polynomials is the Vandermonde determinant. It holds under the standing hypothesis, and PH.2/scalar-characters already uses that argument.
   - **E12 (misprint, p. 43).** In the two displayed endpoint inductions, the cyclotomic twist sits on the wrong Levi block relative to the normalisation ε⁻¹∘θ_P of (3.19), p. 40. At n=2 the printed first induction has algebraic part z^{(h_1+1,h_2)} instead of z^λ. Nothing downstream changes, since π_F and π_G are fixed by Lemma 3.10.

4. **Planets.** The planets on PH.0/endpoint-refinements (an indexing device) and PH.1/kernel-multiplicity (a numerical coefficient, duplicated by the kernel-dimension planet) were removed as bookkeeping (section 14). Every layer keeps between two and six planets.

5. **Suggested Lean file.**
   - It now imports six individual Mathlib modules instead of `import Mathlib` (section 13) and opens with the standard note.
   - Every test of the three PH.0–PH.1 definitions is a named `example`.
   - The packet's light API items `endpoint_membership`, `blockTuple_apply` and `diagonal_in_block` were added.
   - The tests `rank_two_distinction` (now including the transposition), `rank_three_endpoint_count` (the 3-cycle), `center_overlap` and `nonnegative_bound` were completed.
   - All statements were checked by hand to be true.
   - `lean-check` at the pinned shared build (Mathlib 082e2d3, Tau Ceti f790474) exits 0, with only the 18 declaration-uses-sorry warnings. `scripts/check_sorry_data.py` passes.

6. **Verified without change.** I checked the following against the source:
   - the comparison map and its uniqueness (Theorem 3.21, Remark 3.22);
   - the telescoping spanning identity, which correctly replaces the false direct sum (3.43) (E1);
   - the kernel dimension c_n·d_K and the worked table for n≤5 and for n=3 with d_K=2;
   - transversality (Lemma 3.23);
   - π_min, π_fs and f_D, including (3.45) and the surjectivity input from Lemma 3.5(2);
   - Corollaries 3.24–3.25 and Proposition 3.26 with its normalisation μ↔ξ_{μ−θ};
   - Proposition 3.27 and Remark 3.28;
   - Corollaries 3.29–3.33;
   - Theorem 3.34 with its corrected directions (E4, E5);
   - Lemma 3.35, Theorem 3.36 (E3) and Corollary 3.37.

   The PH.5 dimension checks (10, 7, 3 and 11 at n=3, d_K=1) and the tangent and cotangent variance were recomputed. Gap G-HC is genuine: upstream LieHighestWeight works over an algebraically closed field, and its Layer 9 states no Harish-Chandra isomorphism for gl_n.

## Checks run

- `TAUCETI_BASELINE=<pinned index> python3 scripts/check_blueprint.py` on the packet: 0 errors, 0 warnings.
- The source-issue checks of `scripts/source_issues.py` and `check_errata.versions_checked`: no errors.
- `python3 research/blueprint/intake.py check-files` on the four files: 0 problems.
- `lean-check` on the suggested file: exit 0, with sorry warnings only.
- A dry `build.assemble` with the corrected roadmap: it assembles, with no skipped (cyclic) links.

## Questions for the orchestrator

1. Designs #3411 (LocallyAnalyticRepresentationsOfLocalGroups) and #3412 (TriangulineVarietyAndItsLocalModel) should receive this packet's contracts as amended: LA1–LA6 and TR1–TR5. Their briefs from PAPER-DING-25 ask them to construct some things that accepted packets already plan:
   - **#3411:** D(G,E) and coadmissible modules, in LocallyAnalyticDistributionsPartII ND.1–ND.2; and the Bernstein-centre maps, in SmoothRepresentationsOfLocalGroups SR.3.
   - **#3412:** the modification D_σ (PadicHodgeTheory P7), the deformation rings (LocalGaloisDeformationRings R08.1) and the rank-one and Herr foundations (PhiGamma).

   They should import these, not plan them again.
2. A name search of the PadicHodgeTheory and SmoothRepresentationsOfLocalGroups packages did not find the Ding-specific nodes consumed here: P7/embedding-selective-crystalline-modification and the SR.3 part-ii nodes. This is recorded in `upstreamNotes`. When this roadmap is packaged, either those packages carry the targets or the notions move down into this package.
