# DESIGN-DeligneWeightsAndPurityPartII — completed target pass

Issue: #4584. Worker: Claude (Opus 5.5), session `claude-RKqbvd`. Claim confirmed by the swarm bot on 2026-10-14.

## What was delivered

- `research/blueprint/roadmaps/DeligneWeightsAndPurityPartII.json`: the roadmap definition, area `etale`, parent `DeligneWeightsAndPurity`, five layers WM.0–WM.4.
- `research/blueprint/packets/DeligneWeightsAndPurityPartII.json`: status `complete`, 30 nodes (3 definitions, 5 constructions, 20 theorems, 2 applications), 74 API items, 33 unit tests, 15 planets, 14 baseline declarations read at the pins, 8 supplier requests, 1 gap, 2 restructure proposals, 3 source issues. `python3 scripts/check_blueprint.py` reports 0 errors and 0 warnings.
- `research/blueprint/readmes/DeligneWeightsAndPurityPartII.md`: about 19,800 words, generated from the packet plus an introduction (scope, boundaries, conventions, exact supplier contracts, ordering, acceptance checklist, corrections to the source, Lean prototypes, references); it agrees with the packet node by node.
- `research/blueprint/suggested/DeligneWeightsAndPurityPartII.lean`: 375 lines. **It elaborates with `lean-check` at Mathlib 082e2d3 / Tau Ceti f790474 with `sorry` as its only warning.** It holds only statements with carriers at the pins: `IsWeilNumber` (the parent's form), `monodromyFiltration` and its API, `IsGradedEigenvalue`, `IsWeightMonodromyPureEnd`, `nilExp`, the structure `LocalMonodromyDatum` with the proposition `IsIso`, `IsWeightMonodromyPure` with uniqueness of N, the Frobenius relation, transport, direct sums and detection on subgroups, Lemma 9.8 as `cup_mapExactFunctor` (proved, from Mathlib's `Ext.mapExactFunctor_comp`), the duality splitting, and four unit-test examples. There are no sorry'd data definitions.

## Stage status

| Stage | Nodes | Status | What remains |
|---|---:|---|---|
| WM.0 weight–monodromy purity and the conjecture | 10 | planned | the predicate requested from DWP.5; the Galois-action and base-change interfaces requested from SF.2 |
| WM.1 Deligne's theorem in equal characteristic | 2 | planned | smooth/proper base change and separably-closed invariance requested from SF.2 |
| WM.2 tilting the Kummer tower | 5 | closed | nothing |
| WM.3 Huber's neighbourhood theorem, Lemma 9.8 | 6 | planned | the gap below; the "explicit calculation" step of the neighbourhood theorem is outlined, not decomposed |
| WM.4 comparison map and Theorem 9.6 | 7 | planned | naturality of π in the perfectoid field (requested from NT.3) and of Huber's comparison under base-field automorphisms (requested from H5) |

## Design decisions a reviewer should check

- **Local monodromy data.** Scholze's sentence "the notion of weights and the monodromy operator N is compatible with this isomorphism of Galois groups" (p. 309) is made precise by a structure (inertia, tame ℓ-adic character up to scalar, geometric Frobenius coset, Q) and isomorphisms of such data. Purity relative to a datum generalises DWP.5's predicate (compatibility is a test), and the proof of Theorem 9.6 becomes: detection on G_L ⊆ G_k, transport along β : G_L ≅ G_{L♭}, direct summand, detection on G_{L♭} ⊆ G_{k″} (WM.2/tilting-transfer).
- **Geometric connectedness of Z′.** Scholze's Lemma 9.9 needs H^{2d}(Z′) one-dimensional; an alteration of a geometrically irreducible variety need not be geometrically connected. WM.4/tilted-approximation takes Z′ geometrically irreducible over a finite extension k₁ (SF.4's form of de Jong's theorem provides this). Recorded as source issue E3 (gap, new).
- **NT.6 gives no geometric irreducibility.** The toric Part II's Corollary 8.8 only gives a closed Z₀ over a dense subfield; WM.4 picks k₀ = 𝔽_q(t)^{perf}, descends to 𝔽_q(t^{1/p^n}), takes a top-dimensional component and makes it geometrically irreducible over a finite separable extension (SF.0).
- **Uniformity in m.** A single tube Ỹ must work for all ℤ/ℓ^m at once (the ℚ̄_ℓ comparison needs one Z′). A colimit argument from continuity and finiteness alone gives only m-dependent tubes, so Huber's theorem (iso for all small ε, then the five lemma in m) is genuinely needed; WM.3 plans it.
- **Lemma 9.8** is placed in WM.3 (before its first use) and is Mathlib's `Ext.mapExactFunctor_comp`.

## Requests made to other roadmaps

1. DeligneWeightsAndPurity:DWP.5 — the weight–monodromy predicate for ℓ-adic and Weil–Deligne representations of G_k (PAPER-SCHOLZE-12 item 154, route 7), with independence of the Frobenius lift, of scaling of N and of coefficients.
2. SchemeAndStackFoundations:SF.2 — Galois action on H^i(X_{k^s}, ℤ/n) and ℚ_ℓ-cohomology; invariance under extension of separably closed fields for proper X; smooth and proper base change with Galois-compatible specialisation.
3. AnalyticToricGeometryPartII:NT.3 — naturality of π and of the étale-topos comparison in the perfectoid field (base change K → C, continuous automorphisms of C over K, π_C⁻¹(U_C) = (π⁻¹U)_{C♭}).
4. ClassicalAdicEtaleCohomology:H5 — naturality of Huber's comparison (3.7.2, 3.8.1) under continuous automorphisms of the base field.
5–8. Import-only entries for the Tau Ceti roadmaps LocalFieldsRamification Layers 0, 2, 4 and AnalyticToricGeometry Layer 0 (no new work asked).

No notion was moved down from a higher roadmap.

## Gap

Huber, J. Algebraic Geom. 7 (1998), 359–403 (Theorems 2.1, 3.6), and Lütkebohmert, Invent. Math. 111 (1993) (Theorem 2.2), are not freely available and were not read. WM.3/oc-quasi-constructibility, WM.3/lutkebohmert-riemann-existence and WM.3/huber-neighbourhood-theorem state them as K. Ito recalls and uses them (arXiv:2008.07794v1, Theorem 1.1, Theorem 4.5(2), §1.2 sketch). A follow-up should check the statements, in particular Huber's Definition 1.4 (oc-quasi-constructible) and any further hypotheses of Theorem 3.6(a), against the originals.

## Restructure proposals

- Huber's neighbourhood theorem and its two inputs are general adic étale cohomology (RT-PAPER-SCHOLZE-12/11; BKV and MotivesAndAlgebraicCyclesPartII also need them): propose moving WM.3's four general nodes to a Part II of ClassicalAdicEtaleCohomology; WM.3 owns them until the maintainer decides.
- Part II versus Part III: the parent already has WeightsInEtaleCohomology as its Part II (RS-17). The id is kept; the title follows the issue; neither roadmap depends on the other (R34.6 may consume Theorem 9.6).

## Sources

- Read: P. Scholze, *Perfectoid spaces*, published version (Centre Mersenne PDF, sha256 7e7f7a3b…f7814a), §1 (Theorems 1.1, 1.3, 1.15), §8 (8.4–8.8), §9 (9.1–9.9), references. K. Ito, arXiv:2008.07794v1 (sha256 56b99e69…c4752), §1.1–1.2 and §4.1–4.3.
- Not read (not freely available): Huber 1998 (JAG 7); Lütkebohmert 1993. Deligne's Weil II, de Jong 1996 and Huber's 1996 book are used only through the parent and supplier roadmaps.
- Source issues: E1 (Proposition 9.1 misprint, known as PAPER-SCHOLZE-12/E1), E2 (Lemma 9.5, known as PAPER-SCHOLZE-12/E8), E3 (gap in the proof of Theorem 9.6 / Lemma 9.9: Z′ must be geometrically connected; new).

## Where a follow-up resumes

The review checks the packet as a whole. After acceptance, the open items are exactly the `remaining` lists above: the four supplier contracts and the Huber/Lütkebohmert verification. Nothing in the packet exceeds the target-level granularity of PROTOCOL.md section 2.
