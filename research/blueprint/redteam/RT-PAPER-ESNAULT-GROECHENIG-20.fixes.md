# Esnault–Groechenig repair: all eleven confirmed findings

Job `FIX-RT-PAPER-ESNAULT-GROECHENIG-20`, issue #5013. Codex, session `codex-J6LwjP`, 30 September 2026. The bot confirmed claim comment 5917973702. Both the complete findings and the complete independent verifier record were read; the issue body lists only findings 1–6. All eleven are addressed below, using the verifier’s corrected fixes.

The deliverables are this report, the [extraction](../papers/PAPER-ESNAULT-GROECHENIG-20.result.json) and its [reader](../papers/PAPER-ESNAULT-GROECHENIG-20.md). They now contain 146 items (125 missing, 16 planned, 5 library), eight routes and twelve source findings. Every missing item has one route. Status remains complete in the §16 extraction sense; neither formalization nor source-proof closure is asserted. No independent review verdict is assigned by this worker. The historical paper review applies to the old scope; changed/new routes need REV-FIX review before application.

## Finding-by-finding disposition

| Finding | Changes and evidence |
| --- | --- |
| 1 — crystalline dependency cycle | Split 044 at its two cited inputs: it retains only the Berthelot–Ogus reduction of quasi-nilpotence modulo p and depends on 043. New 137 is Katz’s special-fibre nilpotent-p-curvature criterion, depending on 012,015,043. The quasi-nilpotent forms 045–046 remain planned at CR.1. New 138–139 are the printed Theorem 2.19/Corollary 2.20 p-curvature forms in CartierFlows; 047 imports 139. Unlike moving all of 044, this preserves the independent foundational reduction lemma. Read published p.120 and CR.1/CR.2. Route 5 has no reachable CartierFlows prerequisite. |
| 2 — finished deformation blueprint | Item 090 now imports the actual finished R04.1/R04.2 nodes, scoped to the finite residue-field case used in Lemma 5.6. Schur supplies strict-versus-full conjugacy for fixed residual data; finite residue extension uses the separate change-of-residue-field theorem. Φ_p and Schur belong to representability, not the definition of the functor. The Artinian rigidity predicate and isolated-point comparison remain in 093. Move 091–093 to RigidCompanions, remove the obsolete source route, and remove the erroneous 090→089 and 092→090 dependencies. No new GlobalGaloisDeformations Part II is needed. |
| 3 — p-adic Hodge ownership | Move 095 into a real Part II route with exactly HEUER-25’s `PadicHodgeTheoryPartIIPadicSimpson` id, title and area. Add Faltings’s small integral version, deformation stability and §5 crystalline example beside Heuer’s local 35–36 and global 40; the rational theorem alone is not the integral theorem. RigidCompanions retains 096–098 and imports 095. Items 074/088 explicitly import GUO-REINECKE-24/075,076,080 from `PadicHodgeTheoryPartIIRelativeCrystallineLocalSystems`, including algebraic/adic generic-fibre comparison. Its full faithfulness is up to isogeny, not an integral substitute for LSZ. |
| 4 — Abe inputs | Items 087/108 and new 146 coalesce with `GlobalShtukasPartIICrystallineCompanions`: ABE-18/32,44 supply realization; 1,31 supply the companion relation and Frobenius normalization; 46,47 supply conditional p-to-ℓ existence plus the Abe–Esnault Lefschetz obligation. New 145 reuses ABE-18/17’s proper generically finite smooth **quasi-projective** cover; 086 retains EG’s projective curve-slice application and must track its extra projectivity reductions. Item 109 retains the uniqueness/application interface and imports ABE-18/51. Abe already cross-referenced EG; the original finding’s claim that neither mentioned the other was false. The remaining external companion input is the Lefschetz proof, not the whole mechanism. |
| 5 — ℓ-adic weights and trace | Add 140 (smooth-proper purity, DWP.7), 141 (curve purity, GS.6, Lafforgue VII.6(ii)/EK Theorem 4.4(ii)), 142 (smooth higher-dimensional purity, late DWP.10), 143 (ℓ-adic trace/L-function, SF.2 integrating upstream PR196), and 144 (Deligne constant-field decomposition). Item 113 names the weight/trace inputs; 112 names 144. Item 142 reuses the DELIGNE-80 Conjecture 1.2.10(i) owner with EK Corollary 4.5/Appendix B Proposition B.1, not a new RigidCompanions purity owner. GS.6 already consumes DWP.7, so the return to DWP is at DWP.10. Replace the obsolete Weil II/Lafforgue uncovered-source entry by EK and add De3 separately. |
| 6 — Lemma 4.11 proof gap | Add E11 (`gap`, `the proof`), and rewrite 076 and its inverse API. Full faithfulness of C⁻¹∘w* plus pairwise distinct representatives (Proposition 4.10(c), as corrected in E9) proves injectivity, then finiteness proves bijectivity. Only then deduce rigidity for the forward Cartier image. The existing 076→065→052 path already supplies disjointness. Published p.134 and v4 p.25 agree. |
| 7 — Lemma 5.5 trace error | Add E12 (`error`, `the proof`), retaining the true lemma. The Q₈ two-dimensional determinant-one representation has nontrivial order-two self-twists, so equality of traces does not force χ=1. From χ^r=1, χ is defined over K; the generic deformation is a constant K-representation up to isomorphism, so its closed moduli point forces the DVR family to be constant. Add this proof route to 092; its statement needed no correction. Published p.140 and v4 p.30 agree. |
| 8 — five misprints | Extend E10 with the five new slips and archive its old reviewed record in `sourceIssueHistory`. Correct S to S′ in Corollary 4.17; interpret the p.138 phrase as generically smooth and (of course) projective, not coarse projective; correct the arithmetic group to π₁(X_Qp), without a bar; shift the point, claim and reference in Lemma 5.11’s proof to (c), (d), (c), also retaining its use of (a); fix the r,d comma in Theorem 7.3. Published and v4 passages match. No inherited verdict is attached to this expanded E10 scope. |
| 9 — matrix Morita in the pin | Read and credit `MoritaEquivalence`, `ModuleCat.toMatrixModCat`, `ModuleCat.matrixEquivalence`, `moritaEquivalenceMatrix`, `IsMoritaEquivalent.matrix`, `IsAzumaya.matrix`. The nonempty finite matrix-index hypotheses are recorded. 022/023 remain missing only for geometric splitting, non-free projective generators, sheaf descent and support. The projective-generator TODO is a relevant lead; Basic’s stale matrix TODO is not evidence against the actual Matrix file. Remove the unrelated erroneous “unique up to unique isomorphism” wording from G1 in both documents. |
| 10 — example and locator | Item 107 derives inverse-integrality from complex conjugation of the monic minimal polynomial; it no longer assumes an additional hypothesis absent from Example 6.3. The corresponding API and test are updated. Item 132 now cites Corollary 4.17, pp.137–138 in §4.2, and §7, pp.146–151. |
| 11 — reading provenance retrofit | Add `sourceVersions` for the historical full published reading, historical selective author-copy reading with explicitly inferred date, and fresh focused published/v4/author-copy comparisons. The same published SHA-256 reproduces. Earlier arXiv PDFs were not read, and the current repair does not claim a new complete reading. This is a retrofit of the later §18 rule, not retrospective criticism of the original extraction. |

## Supplier requests and layer order

No finished supplier blueprint is an assigned deliverable. The extraction’s `supplierImports` records precise contracts and finer nodes where available; `upstreamNotes` gives the maintainer the following requests.

1. `BP-CrystallineCohomology`: keep 044’s quasi-nilpotence-only reduction and the quasi-nilpotent 045–046 at CR.1. The missing p-curvature applications 137–139 belong to the CartierFlows design. Order CR.1/CR.2 → HodgeStructuresPartII → CartierFlows → RigidCompanions.
2. `DESIGN-PadicHodgeTheoryPartII`: include 095’s small integral Faltings input alongside HEUER-25/35,36,40, and provide GUO-REINECKE-24/075,076,080’s crystalline-local-system contract to 074/088. Neither p-adic Hodge supplier imports EG’s rigid-arithmetic conclusions.
3. `DESIGN-GlobalShtukasAndFunctionFieldLanglandsPartII`: merge route 7 with the existing Abe proposal; export 087/108/146. The arithmetic-D-module design should coalesce the early cover 145 and Čebotarev input with ABE-18/17,51; the late EG applications 086,109–118 consume the GlobalShtukas supplier. Keep the layer order early ArithmeticDModules → GlobalShtukasPartIICrystallineCompanions → late RigidCompanions, even if the design groups the two PDE candidates under one parent.
4. `BP-DeligneWeightsAndPurity`: source 142’s smooth-variety proof to DWP.10 after DWP.7→GS.6, coalescing the existing DELIGNE-80 target. EK Proposition B.1 supplies the curve through a point preserving irreducibility; this check does not silently settle the full normal-variety generalization.
5. Maintainer: reconcile the analogous stale source route 4 in unassigned PAPER-LANDESMAN-LITT-24 with the finished GlobalGaloisDeformations packet. EG imports the exact existing nodes and keeps its new character-variety conclusions in its arithmetic consumer; it does not modify that packet or the other extraction.

These are concrete design handoffs, not changes to campaign data, source roadmaps, generated queues or other workers’ packets. The shared supplier phases are acyclic. A whole-roadmap reciprocal dependency would obscure that order and must not be generated from the parent grouping.

## Source audit

The published mirror is byte-identical to the original source: SHA-256 `0d81a6d3e9be477c58a725096c41f06a8a9262422fe596363c3f04c26ab1cfab`. The publication, arXiv v4 and author-copy URLs, hashes, dates and exact reading limits are in `sourceVersions`; the fresh reading was focused. Published pp.134,140,143,145,149 were inspected as images. E11 and E12 appear in both the publication and v4; all five new E10 slips persist there. The author-copy text matched the compared v4 passages.

Esnault’s publication-list entry 126, the arXiv version history, title/arXiv correction searches and Crossref metadata disclosed no separate EG erratum on 30 September. This is limited evidence, not proof of novelty. Esnault–Kerz’s one-page 2014 errata was read and does not alter Corollary 4.5 or Appendix B Proposition B.1. Deligne’s §1.2–1.4 input was read in the IAS author PDF, not misidentified as a Weil II formula with the same number.

## Verification

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-ESNAULT-GROECHENIG-20.result.json`: passes.
- `source_issues.check_issues` and `check_errata.versions_checked`, applied to the extraction: pass. The errata CLI’s different top-level schema is not applied to a paper extraction.
- `python3 research/blueprint/intake.py check-files` on the three assigned paths: passes.
- `git diff --cached --check`: passes.
- Internal DAG: 146 nodes, 291 edges, no cycles; all 125 missing items routed once. Reachability from the foundational crystalline source route contains no CartierFlows item. All seven finer Galois-deformation supplier node IDs exist in the finished packet. Six added Mathlib reference names match exact declaration-index rows; their source statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` (Tau Ceti remains `f790474821cf4256814db967cb154e7af3d0c369`).
- The reader’s original executable certificate was replayed: 24 monic-root witnesses, 3 trace-free BNR witnesses, 19 jet counterexamples, 4 support witnesses, 5,913 permutations and 104 restricted-derivation eigenvalues.
- Additional certificate below: 8 Q₈ matrices, 64 products, and 50,070 finite endomaps (874 injective) check the new witnesses. These computations do not establish the geometric theorems.

No Lean file is assigned or compiled; no build was created. Scratch is removed after the PR opens. The persistent reader and this report contain the mathematical witnesses and executable certificates needed to reproduce the checks.

```python
from itertools import product

def mul(a, b):
    return tuple(sum(a[2*r+k]*b[2*k+c] for k in range(2))
                 for r in range(2) for c in range(2))
def scale(t, a):
    return tuple(t*z for z in a)
I = (1, 0, 0, 1)
A = (1j, 0, 0, -1j)
B = (0, 1, -1, 0)
Ainv = scale(-1, A)
q, ap = [], I
for e in range(4):
    q.extend([(ap, 1), (mul(ap, B), -1)])
    ap = mul(ap, A)
chi = dict(q)
assert len(chi) == 8 and chi[B] == -1
for g, cg in q:
    assert g[0]*g[3] - g[1]*g[2] == 1
    assert mul(mul(A, g), Ainv) == scale(cg, g)
    assert g[0]+g[3] == cg*(g[0]+g[3])
    for h, ch in q:
        assert chi[mul(g, h)] == cg*ch
# A has two distinct eigenspaces; B exchanges them, proving irreducibility.
# All complex arithmetic above involves only 0, ±1 and ±i, so is exact.
total = injective = 0
for n in range(7):
    for f in product(range(n), repeat=n):
        total += 1
        if len(set(f)) == n:
            assert set(f) == set(range(n))
            injective += 1
assert len(set((0, 0))) < 2
assert (total, injective) == (50070, 874)
```
