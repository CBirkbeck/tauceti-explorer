# REV-HabiroCohomologyFoundations--HQ.8 — review of the blueprint of the comparison atlas (HQ.8)

**Verdict: `needs_changes`.**

- **The packet and the suggested Lean file are corrected in place.** Every node was checked against its source, and every
  baseline citation was read at the pins. `check_blueprint` reports no errors.
- **The only outstanding change is the roadmap document.** `research/blueprint/readmes/HabiroCohomologyFoundations--HQ.8.md`
  is outside this review's files, so it still describes the uncorrected packet. It must be regenerated from the corrected
  packet before promotion.

- **Reviewer:** Claude Code, session `cc-2aeb03`, 25 September 2026 (issue #424).
- **Author of the blueprint:** another worker of the programme (#2896). This reviewer took no part in it.
- **Baseline:** Mathlib `082e2d3`, Tau Ceti `f790474`.
- **Companion packet:** HQ.1–HQ.7, whose review (REV-HabiroCohomologyFoundations--HQ.1, #2903) this reviewer also carried
  out. HQ.8's comparisons consume it, and they now cite its corrected node ids.

## What was read

**The seven sources, at their latest arXiv versions.** The ids, titles and authors were checked on the abstract pages. Each
recorded SHA-256 matches the gzipped e-print (LaTeX), not the PDF. Every excerpt is now a literal substring of the LaTeX
source, at most 300 characters.

- **Wagner:**
  - "q-Hodge complexes over the Habiro ring" (arXiv:2510.04782v2);
  - "q-Witt vectors and q-Hodge complexes" (arXiv:2410.23078v5);
  - "q-de Rham cohomology and topological Hochschild homology over ku" (arXiv:2510.06057v1).

  Two of these titles were wrong in the packet and are corrected.
- **Bhatt–Scholze,** "Prisms and prismatic cohomology" (arXiv:1905.08229v4). The e-prints of v1–v3 were compared for
  E801, E803 and E804.
- **Bhatt–Morrow–Scholze,** "Integral p-adic Hodge theory" (arXiv:1602.03148v3) and "Topological Hochschild homology and
  integral p-adic Hodge theory" (arXiv:1802.03261v2).
- **Scholze,** "Canonical q-deformations in arithmetic geometry" (arXiv:1606.01796v1).

The sections read are recorded in each source's `readSections`, and the packet now has `sourceVersions`.

## Counts

| | Before | After |
|---|---|---|
| Nodes | 15 | 17 (15 corrected, 2 added) |
| Baseline declarations | 10 | 11 (4 confirmed, 1 fixed, 5 removed; 6 added) |
| API items / unit tests | 13 / 8 | 17 / 6 (every test now has its `kind`) |
| Gaps | 4 | 5 |
| Requests | 10 | 12 (each with `neededBy`) |
| Source issues | 0 | 5 (E801–E805, all confirmed) |
| Coverage of HQ.8 | source decomposed | partial |

`python3 scripts/check_blueprint.py --index <pinned index>`: 0 errors, 0 warnings.

## Main corrections

- **The A_inf square had the wrong route.** The base-change property of the global q-de Rham complex holds for maps of
  Λ-rings, not for q ↦ [ε]. The route is now Scholze's Conjecture 4.3: Appendix A.1(b) of the q-Hodge paper, with prismatic
  base change (Bhatt–Scholze Corollary 4.12) and Theorems 16.18 and 17.2.
- **The Nygaard square** listed RefinedTraceMethods RT.6 as a prerequisite, against the packet's own staging rule. It also
  quotiented by the wrong element: q^{p^α} − 1 is right.
- **Several records** misstated which filtration a square carries, or claimed that nothing is inverted where something is.
- **The bases node** defined objects that PrismaticCohomology owns (the q-de Rham prism, its perfectoid base). It is now a
  lemma about them, with the congruences stated against Mathlib's cyclotomic and Witt-vector API (Fontaine's θ and the
  Teichmüller map).
- **The décalage node** bundled two results. It is split into the décalage square at the prism ideal and the obstruction:
  the décalage filtrations do not glue.
- **Coverage is now partial.** No node shows the commutation of the A_inf square with the classical specialisations of
  CohomologyComparisons CP.1. This is recorded as a gap.
- **Requests:**
  - PrismaticCohomology PR.1 and PR.3, AInfCohomology AI.3 and DerivedDeRhamCohomology DD.1 are added.
  - The requests to HabiroRings HR.2 and EnhancedDerivedSheaves E4 are removed, since no square uses them.
  - The eight kept requests are corrected, and every request now names its consumers.

## Baseline

- **Removed (5).** Each exists at the pin but no node cites it:
  - `cyclotomic_prime_pow_eq_geom_sum`;
  - `Ideal.Filtration`;
  - `IsAdicComplete`;
  - `WittVector.frobenius`;
  - `CategoryTheory.Tor`.

  The first four are near misses for what the squares need.
- **Fixed:** `PreTilt`. It is the tilt of any ring in which p is not a unit, not only of a perfectoid one.
- **Added (6):** cyclotomic identities (`cyclotomic_prime_mul_X_sub_one`, `cyclotomic_three`,
  `IsCyclotomicExtension.Rat.associated_zeta_sub_one_pow_prime`), `WittVector.teichmuller`, `WittVector.fontaineTheta`
  and `fontaineTheta_teichmuller`, used by the bases lemma.

## Mistakes in the sources (E801–E805)

The packet recorded none. Five are added, all misprints that affect nothing downstream.

- **E801, Bhatt–Scholze Notation 16.1 (v4 only; v1–v3 are correct).** The equality of derived (p, [p]_q)-completion and
  derived (p, q − 1)-completion holds for every complex of A-modules.
- **E802, Scholze §3.** The printed H¹ of the q-de Rham complex of ℤ[T] is the one for ℤ[T^{±1}]. For ℤ[T] the q-derivative
  sends Tⁿ to [n]_q Tⁿ⁻¹dT, so H¹ is the (q−1)-completed sum of ℤ⟦q−1⟧/[n+1]_q with no free summand. The free summand
  comes from T⁻¹dT, which exists only over ℤ[T^{±1}]. Checked by the coordinating reviewer.
- **E803 and E804, Bhatt–Scholze Constructions 16.19 and 16.20.** The module of continuous differentials is over the base
  D, and the construction refers to Lemma 16.10.
- **E805, Wagner §A.1.** The cross-reference is [BS19, Definition 16.2].

## The suggested Lean file

- **As submitted, it did not elaborate.** It had one error and 19 occurrences of `True` standing in for statements.
- **It is rewritten against the corrected packet:** 689 lines in namespace `TauCeti.HabiroCohomology`, `section HQ8`.
  - It elaborates at Mathlib `082e2d3` with `lake env lean`. The only messages are three `declaration uses 'sorry'`
    warnings.
  - The small cyclotomic and algebraic identities of the bases lemma are proved outright; they compile.
  - Every API item and unit test occurs under its packet name, and no statement is `True`.
  - The objects of the squares enter as structures supplied by their owners, each docstring naming the owner.
- **Not declared.** The commutation theorem, the staging rule and the gluing obstruction are stated in comments. They are
  about comparison maps between ∞-categorical objects, which have no faithful 1-categorical shadow at this pin.

## Questions for the orchestrator

1. **The roadmap document** must be regenerated from the corrected packet before promotion. This is the only reason for
   `needs_changes`.
2. **The companion packet HQ.1** carries the old title of arXiv:2510.06057 ("ku and q-de Rham cohomology"). A follow-up
   pull request of this reviewer corrects it to "q-de Rham cohomology and topological Hochschild homology over ku".
3. **No square is stated for the étale comparison.** This remains a recorded gap.
