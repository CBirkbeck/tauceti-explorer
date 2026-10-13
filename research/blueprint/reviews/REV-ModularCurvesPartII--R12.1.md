# REV-ModularCurvesPartII--R12.1

Independent review of the complete blueprint pass for *Modular curves, following Katz–Mazur, Part II*, stages R12.1–R12.6 and R13.1–R13.2. Refs #450.

- **Reviewer:** Claude (Opus), session claude-lcwGHe, 2026-10-13. This session wrote none of the blueprint. The checkpoint was by cc-fb70e5 (#3927) and the completing pass by codex-DB7w56 (#9362).
- **Verdict:** **accepted**, with the corrections below made in place.
- **Deliverables edited:**
  - the packet `research/blueprint/packets/ModularCurvesPartII--R12.1.json`;
  - the suggested file `research/blueprint/suggested/ModularCurvesPartII--R12.1.lean`.

  The reader document is not a deliverable of this review. It lags the corrections; see "Reader lag".

## Counts

| | Before | After |
|---|---|---|
| Nodes | 48 | 48 (none added) |
| Node verdicts | — | 1 verified, 47 corrected (13 of them only in source locators or matches) |
| Baseline declarations | 12 | 12, all confirmed; 2 `provides` texts narrowed |
| Requests | 38 | 36: 11 removed or replaced by exact nodes, 9 added (see "Supplier routing") |
| Gaps | 1 | 0: the analytic-carrier gap is closed by an existing owner |
| `restructure` / `externalContractUpdates` | 1 / 1 | removed, since both proposed the superseded SF.2 integration |
| Source issues | 14 | 14, all confirmed; renumbered E101–E114 |
| Source locators | — | 60 corrected, 9 added |
| Planets, unit tests, API items | 39, 52, 73 | unchanged |
| `check_blueprint.py` (pinned index) | 0 errors, 0 warnings | 0 errors, 0 warnings |
| Suggested file | 94 lines, `lean-check` exit 0 | 114 lines, `lean-check` exit 0, 4 placeholder warnings |

## What was checked

- **Mathematics.** Every node was read in full and its statement, hypotheses, proof sketch, tests and acceptance items checked. Formulas were recomputed rather than taken on trust:
  - the lattice cubic, its discriminant and j(Z+iZ)=1728;
  - homothety weights and isogeny kernels;
  - the row action and its left-action form;
  - stabilizers at small level;
  - the index, cusp and genus formulas for Γ(p);
  - cusp widths, including N/gcd(c²,N) for Γ₀(N);
  - the Hodge-line automorphy factor;
  - the branch-by-branch Hecke normalization a^k/n=a^{k−1}/d;
  - the σ₁ against ψ degrees;
  - polygon automorphisms and torsion ranks;
  - the non-flatness of u↦u^d at the node of a one-gon;
  - the level-map ranks;
  - d(m)=m/gcd(m,N/m);
  - the scalar inertia μ_{gcd(m,N/m)}.
- **Sources.** Every source was fetched into scratch. Every locator was found in the source text: Haiku agents retrieved the passages, and the reviewer read every passage that a correction or finding rests on.
  - The hashes recorded in the packet matched for all sources but one: Bakker–Tsimerman's published PDF now returns HTTP 404. Its sections were read in arXiv:1403.7168v2, added as source `bt-preprint`.
  - The Gross–Zagier pages (I §1, p.226; V §1, p.306) and the misprint pages (Conrad p.16, Conrad handout p.37) were read on rendered images.
  - A Sonnet second-reading pass re-checked every changed locator against the texts and found no discrepancy.
- **Baseline.** All 12 declarations were read at the pinned commits:
  - `PeriodPair`, `weierstrassP`, `derivWeierstrassP`, `g₂`, `g₃` and `derivWeierstrassP_sq`;
  - `WeierstrassCurve` and `IsElliptic`;
  - `natDegree_cyclotomic`;
  - `Subgroup.integerCuspWidth`;
  - `irreducibleSpace_of_connected_of_isDomain_stalk`;
  - the composite Hecke coefficient theorem.

  Two `provides` texts were narrowed:
  - `integerCuspWidth` is the strict width at ∞ of a subgroup of GL₂(R): −1 is not adjoined, and other cusps need conjugation.
  - The Hecke theorem is stated on the χ-part of M_k(Γ₁(N)); trivial χ is the Γ₀(N) case.
- **Suppliers.** Each cross-roadmap prerequisite was compared with what its supplier actually plans: the packets, the accepted packages and current TauCetiRoadmap main.
- **Ordering and cycles.**
  - Every supplier is Mathlib, Tau Ceti, a TauCetiRoadmap roadmap, or a roadmap of tier ≤10 in the Caraiani–Newton order (this roadmap is tier 11).
  - A stage-graph check found no cycle, before or after the edits. It used the atlas edges, the accepted restructurings and this packet.

## Corrections

### 1. The analytic Weil pairing had the wrong sign (R12.1, R12.2, R12.6)

The packet stated that, with the Tau Ceti/Silverman convention, the frame (1/N,τ/N) on C/(Z+Zτ) pairs to ζ_N=e^{2πi/N}. It treated Conrad's handout as using the opposite convention.

- **The computation.** Tau Ceti's pairing is e_N(S,T)=τ_S^*g_T/g_T, where g_T has divisor [N]^*(T)−[N]^*(O) and τ_S is translation by S. This is Silverman III.8, read in the current library at `Isogeny/MulByInt/WeilPairing/Basic.lean`.
  - Take g_T(z)=σ(Nz−t)σ(Nz)⁻¹exp(η(Nt)z).
  - Quasi-periodicity of σ gives e_N(S,T)=exp((η(Nt)·Ns−η(Ns)·Nt)/N).
  - Legendre's relation then gives e_N(ω₁/N,ω₂/N)=e^{−2πi/N} when Im(ω₂/ω₁)>0.
  - So (τ/N,1/N) pairs to ζ_N and (1/N,τ/N) pairs to ζ_N⁻¹.
- **Numerical check.** A Jacobi-theta evaluation for N=3 and τ=0.3+1.1i returned e^{−2πi/3} for S=1/3, T=τ/3.
- **The sources agree with this.**
  - Conrad's handout (proof of Proposition 7.16) normalizes ⟨τ/N,1/N⟩=ζ_N. Its caution concerns an exercise in Silverman's *Advanced Topics*, not the AEC III.8 definition.
  - Milne's Lemma 8.7 uses the frame (z/N,1/N).
- **Nodes changed.**
  - `analytic-algebraic-weil-pairing`: the statement, the hypotheses, the proof sketch (σ and Legendre), the acceptance items and the API item.
  - `marked-torus-family`: e_N(P,Q)=ζ_N⁻¹.
  - `open-level-uniformization`: Γ(N)\H→Y(N,ζ_N) through τ↦(τ/N,1/N).
  - `complex-conjugation-comparison`: the conjugate frame now pairs to ζ_N.
- **Unaffected.** Statements about determinant changes (ζ↦ζ^r) and about Galois permutation of the components do not depend on the sign.

### 2. RT-AREA-algebraicgeometry/3: the analytic carrier now has an owner

- **What the packet did.** It answered the finding through the finding's option (ii):
  - a request asking SF.2 to take on complex analytic spaces and analytification;
  - a gap;
  - a restructure proposal adding SF.2 edges;
  - an update to the PR196 external record.
- **What changed since.** FIX-PKG-AlgebraicModuliForArithmeticGeometry~adv gave the carrier an owner: AlgebraicModuliForArithmeticGeometry A0-extension, package Layer 7, tier 4 (the accepted package).
  - §7.10.1 has `ComplexAnalyticSpace`, with nilpotent local models, open and closed subspaces, gluing and fibre products.
  - §7.10.1 also has `complexSchemeAnalytification`, with its functor laws, representing property, comparisons and `etaleLocalIso`.
  - §7.10.3 has `completedAnalyticStalkComparison`, `properSchemeGagaPushforward` and `properSchemeGagaEquivalence`.
  - The ComplexComparisonPartII package (accepted 2026-10-12) consumes this. It removed `C0/repair-analytification`, `C0/repair-local-faithful-flatness` and the C2/C3 GAGA nodes.
- **The review's changes.**
  - Five nodes' SF.2 citations, five citations of `C0/repair-analytification` and one of `C0/repair-local-faithful-flatness` now cite `AlgebraicModuliForArithmeticGeometry:A0-extension`, as do the six citations of the C2 stage (with the exact C2 nodes below). The request names the exact package targets used, including the Picard space of §§7.3/7.9 for the structure criterion.
  - The SF.2 request, the gap, the restructure proposal and the external-record update are removed.
  - The ComplexComparisonPartII C2 stage citation is replaced by A0-extension (§7.10.3) together with the exact surviving nodes `C2/gaga-base-change` and `C2/projective-geometric-dictionaries`.
- **The consumer side of /3 for this roadmap is settled.** What remains is outside this packet; see question 2.

### 3. Supplier routing

Several stage-level requests asked suppliers for mathematics they do not plan, while an existing owner plans it.

| Was | Need | Now |
|---|---|---|
| SF.4 (stacks) in 5 nodes | algebraic stacks, 2-fibre products, descent, inertia, DM criterion | SF.1, which owns them (SF.1/algebraic-stack, two-fibre-product, deligne-mumford-stack, inertia); SF.4 is "deformations, models" |
| R09.1, R09.2 | Hilbert atlas, stack of marked nodal curves | SF.4 Hilbert/Quot (SF.4/hilbert-scheme) with SF.1; Ell_m is built directly, as in Česnavičius §3.1 |
| R09.3 | normalization sequence, dualizing sheaf, genus formula for nodal curves | TauCetiRoadmap StableReduction Layers 1–2 |
| R09.4, R09.5 (contraction) | relative Cartier divisors, ampleness, cohomology and base change, relative Proj contraction | StableReduction Layers 2–3 and ModularCurves 0A (and 0C for quotients) |
| R09.6, F0 (stage) | formal algebraization of proper marked curves | exact nodes F0/grothendieck-algebraization, grothendieck-existence, closed-subscheme-algebraization, formal-morphism-full-faithfulness |
| SF.3 (several uses) | normalization, extension of curve maps, Stein factorization, DM normalization | AlgebraicCurves Layer 12C, SF.4 (Stein), and the exact accepted nodes R09.5/dm-normalization and dm-normalization-finite |
| none | μ₂-rigidification (R12.2 projective level) | R09.5/rigidification |
| this roadmap's R13.3 and R13.4a stages (11 nodes) | Tate and level cusp charts, Hodge evaluation, integral coarse curves, legal base change, Φ_N | the exact nodes of the R13.3 packet, merged after the pass (#9365): R13.3/generalized-tate-n-gon, formal-level-cusp-charts, boundary-carriers-and-hodge-evaluation, gamma-one-integral-boundary, gamma-zero-prime-power-cusp-rings; R13.4a/integral-coarse-curves, coarse-normalization-comparisons, legal-coarse-base-change, modular-polynomial |

- **R13.3 packet.** None of the cited R13.3/R13.4a nodes depends on an R12 node. A node-level check over the R12.1, R13.3 and R14.3 packets found no cycle. R13.4a/modular-polynomial also states ℚ(X₀(N))=ℚ(j,j′), so `R12.6/gamma-zero-rational-function-field` now leaves that algebraic equality to it and keeps the complex comparison j′(τ)=j(Nτ) and the canonical-model compatibility.
- **SF.3.** The request now covers only what nothing else supplies: the trace on regular differentials for finite maps of smooth projective curves in characteristic zero (R12.5).
- **R12.4, field extension.** `geometric-connectedness-field-extension` attributed the invariance of connectedness under Q̄→C to ModularCurves 0E, which does not state it. ModularCurves 5C lists it as an unowned external contract. The node now proves it from Stacks Lemma 33.7.6 (tag 0363), through a new SF.0 request. `fixed-pairing-geometric-connectedness` and the 0E request text were corrected to match.

### 4. Other corrections

- **R13.1 structure criterion.**
  - The group-action hypothesis is triviality on the algebraic space Pic⁰_{C/S}. It can be checked on fibres only for finite locally free D (Conrad Corollary 2.2.3).
  - The automorphism clause keeps DR's condition (3.1.1) (DR II Théorème 3.2, p.193; the packet called it "Proposition 3.2").
- **R12.2 projective level.** The proof sketch now names the μ₂-rigidification step.
- **Source locators.** 60 were corrected and 9 added. The main patterns:
  - The Conrad Math 248B handout's section pages were shifted: §5 p.10, §6 p.14, §7 p.15, §8 p.17, §9 p.20, and Theorem 17.21 on p.42. Its "Proposition 6.2" does not exist.
  - The classical handout has no cusp material. Its citations now point to the local quotient charts (§3), and cusp widths cite Milne §4, p.48.
  - Česnavičius labels:
    - "Theorem 4.2.1" is Lemma 4.2.1.
    - "Theorem 3.4.1" is Theorem 3.4.2.
    - "Corollary 3.1.7" is Remark 3.1.7.
    - The "Definitions" 4.3.1/4.4.1/4.6.1, 5.3/5.4 and 5.9 are unlabelled subsections.
    - "Theorem 5.10" is §5.10.
    - "Lemma 5.13" is Theorem 5.13.
  - Conrad labels:
    - "Theorem 3.1.1" is Lemma 3.1.1.
    - "Theorem 4.2.4" is Lemma 4.2.4.
    - "Definition 2.1.1/Example 2.1.2" is Definition 2.1.2 with the 1-gon paragraph, and the generalized elliptic curve is Definition 2.1.4.
  - DR pages and labels: II 1.10 is on pp.177–178, 1.12 on p.178 and Corollaire 1.20 on p.184; VII §4.5 starts on p.311.
  - Some `match` texts claimed more than the source states. For example, DR VII §4 has nothing on cusp widths, and DDT §1.2 has no widths. These were restated.

## Baseline citations

All 12 are confirmed at the pins. None was removed, and none added. The provides texts of `TauCeti.Subgroup.integerCuspWidth` and the composite Hecke coefficient theorem were narrowed as described above.

## Source issues

All 14 were checked at their locators and **confirmed**. They were renumbered from E1–E14 to E101–E114, because the accepted ModularCurvesPartII--R14.3 packet already uses ModularCurvesPartII/E1–E3. References in node text and the Lean comment were updated.

| Id | Source | Verdict and changes |
|---|---|---|
| E101 | Conrad (author copy) p.5 | confirmed. The printed 1-gon model y²z=x³−x²z has a non-split node over Z (cusp-like in characteristic 2), and the printed parametrization glues ±i rather than 0 and ∞. Locator corrected: there is no "Example 2.1.2". |
| E102 | Conrad Theorem 2.2.2 | confirmed. With G=1, inversion contradicts the unconditional automorphism clause. DR II Théorème 3.2 has condition (3.1.1). |
| E103 | Conrad p.16 | confirmed on the rendered page: "Q is a Z/p^r-structure" should read Q′. |
| E104 | Conrad p.21 | confirmed. The fibre of S_Γ→M_Γ is a GL_{3d}-torsor of trivializations of f_*O(3D), not a projective-space bundle. Wording sharpened. |
| E105 | Conrad Theorem 3.2.7 | confirmed. N=n=p² is admissible and DM. Česnavičius (published p.2063) states that his Proposition 4.6.5(b) improves Conrad 3.1.7. Reason sharpened. |
| E106 | Conrad handout Proposition 2.9 | confirmed, **reclassified as a misprint affecting nothing**: the second half of the proposition treats lattice points. |
| E107 | Conrad handout p.37 | confirmed on the rendered page. It is the discriminant of y(y+a₁x+a₃)=x³ in the level-3 sketch, not of Tate normal form; Lemma 17.3 on p.38 is correct. |
| E108 | Conrad classical handout Proposition 3.1(1) | confirmed. It is stated for every discontinuous action, so orbits of an infinite Γ give infinite fibres. |
| E109 | Milne p.89 | confirmed. The counterexample needs 1488c to be nonintegral (for example c=1/1489); reason corrected. |
| E110 | Milne Example 8.9 | confirmed. Level two does not rigidify, because of quadratic twists. |
| E111 | Bakker–Tsimerman §§2.1–2.2 | confirmed in arXiv v2. The substantive error is calling the scalar-frame space fine; the order-p cusp stabilizer is right for the effective orbifold of their §3. Published text not re-readable (HTTP 404). |
| E112 | Bakker–Tsimerman §2.5 | confirmed in arXiv v2. Cyclic correspondence with degree σ₁(n); at n=4 the degrees are six and seven. |
| E113 | Česnavičius Proposition 4.3.6 | confirmed. The statement takes s≥1, so it calls X(1) a scheme. |
| E114 | Conrad Theorem 2.4.5 proof | confirmed. Česnavičius makes the same objection in the remark before Proposition 4.2.11 (preprint p.33); `known` updated. |

No further source mistake was found. DR II 1.10 and Conrad Example 2.1.5 write the polygon automorphism group as a semidirect product. Inversion commutes with the μ_n-scaling, so the product is direct, as Česnavičius Lemma 2.1.6 states. The packet's direct product is right, and the sources are not wrong.

## Suggested Lean file

The file keeps the compact 2026-10-12 shape. Additions:
- the square-lattice test `(PeriodPair.mk 1 I h).g₃ = 0`, with a placeholder proof;
- the collapsed-basis non-example `¬ LinearIndependent ℝ ![1, 2]`, proved;
- the all-subgroup Hecke degree `σ₁(4)=7`, proved.

The E107 comment now names the level-three normal form. `lean-check` exits 0 at Mathlib 082e2d3 and Tau Ceti f790474. Its only warnings are the four proof placeholders. No language server, build, update or cache command was run.

## Reader lag

`research/blueprint/readmes/ModularCurvesPartII--R12.1.md` was not edited, because it is not a deliverable of this review.
- **Stale sections.** Seven node sections have statements that differ from the packet: `pointed-elliptic-uniformization`, `analytic-algebraic-weil-pairing`, `marked-torus-family`, `open-level-uniformization`, `geometric-connectedness-field-extension`, `complex-conjugation-comparison` and `deligne-rapoport-structure-criterion`.
- **Stale references.** The reader still describes the SF.2 integration request, and it names none of the new suppliers (A0-extension, SF.0, SF.1, StableReduction Layers 1–3, AlgebraicCurves Layer 12, ModularCurves 0A/0C).
- **Locators.** Most source locators in the reader also predate the corrections.

The package job writes its README from the packet and should take the packet as definitive.

## Questions for the orchestrator

1. **SF.3 trace request.** The trace on regular differentials for finite maps of curves in characteristic zero is requested from SF.3. Neither the SF.3 packet nor the SchemeAndStackFoundations package states it. If SF.3 cannot take it before ModularCurvesPartII is packaged, the package should state it at R12.5 (the duality trace f_*Ω¹_X→Ω¹_Y). The SF.0 request (Stacks 0363) and the SF.1/SF.4 requests point to nodes those stages already have.
2. **RT-AREA-algebraicgeometry/3, the other consumers.** These packets still cite `ComplexComparisonPartII:C0/repair-analytification`, which the ComplexComparisonPartII package removed: PELModuli, ShimuraCompactifications--C0, ShimuraVarieties--V8, HodgeStructuresPartII--H.1 and Polylogarithms--P.5. ShimuraVarieties--V0 names it in its notes. The maintainer edges suggested by the finding (SF.2→C0, V2, C2, M3, R12.3) should instead start at AlgebraicModuliForArithmeticGeometry:A0-extension.
3. **Duplication in the AlgebraicModuli R09.4 packet.** That packet (status needs_changes) still holds generalized-elliptic-curve nodes: `arith-generalized-elliptic`, `arith-standard-ngon`, `arith-polygon-automorphisms`, `arith-contraction` and `arith-elliptic-*`. These duplicate ModularCurvesPartII R13.1. The accepted AlgebraicModuli package routes this material to ModularCurvesPartII, so the R09.4 packet should drop the nodes or point to R13.1.
4. **Source-issue ids in the R13.3 packet.** The R13.3 packet (merged as #9365, not yet reviewed) also uses ModularCurvesPartII/E1–E6. Those collide with R14.3's E1–E3, so its review should renumber them. This packet's findings are now E101–E114.
5. **Bakker–Tsimerman.** The published PDF at the recorded URL now returns 404. E111/E112 are confirmed against arXiv v2. A collation against the Annals version is needed before these are sent anywhere.
6. **Upstream notes** (recorded in the packet's `upstreamNotes`):
   - ModularCurves 5C's three external contracts are planned here at R12.4.
   - The Weil-pairing normalization fixed by ModularCurves 2E gives e_N(τ/N,1/N)=e^{2πi/N} on C/(Z+Zτ).
