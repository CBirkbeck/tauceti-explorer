# Independent review of the classical-to-homotopy K₂ comparison supplement

**Verdict: accepted.** Reviewer: Claude (Opus), session `claude-oOdukb`, job
`REV-K2SymbolsBrauer--T.1-plus` (#9265), 2026-10-14. The packet, reader and
suggested file were written by Codex, session `codex-9L3lGH` (#9307, PR #9547).
The packet's `review.checked` records a verdict for every node and for the
inherited target whose proof the packet specifies.

The supplement is sound. It plans the comparison of classical K₂ with π₂ of the
ring plus space by Weibel's fibre route (IV.1.7, 1.7.1), with a fixed boundary
and the common kernel/H₂ identification. It proves naturality and independence
of the plus model, and transports the comparison to π₂ of ΩBQ(Proj_fg(A)). The
stage stays **planned**, not closed, because the early K-space interface of
`GeneralAlgebraicKTheory:K.2:plus` is still a request. The Tau Ceti
AlgebraicTopology Hurewicz stage is consumed, not requested as new work. No
implementation is claimed.

## Inventory

| Item | Result |
| --- | --- |
| Nodes | 4: 2 constructions, 2 theorems; 4 corrected, none added |
| Inherited target with specified proof | `K2SymbolsBrauer:T.1/k2-pi2`: verified, locators corrected |
| API items | 12 (11 original, 1 added: `fromHomology_pi2Equiv`) |
| Unit tests | 8, four per construction; each catches a plausible wrong definition |
| Planets | 1 (was 2): one removed as a duplicate, one renamed |
| Baseline declarations | 14, all confirmed at Mathlib 082e2d3 / Tau Ceti f790474 |
| Sources | 3 public sources; SHA-256 of all three match the files downloaded on 2026-10-14 |
| Requests | 2; the K.2:plus request narrowed, the AlgebraicTopology Stage 8 request confirmed |
| Source issues | packet had none; 1 added and confirmed |
| Checker | `check_blueprint.py`: 0 errors, 0 warnings |
| Suggested file | elaborates at the pins with `sorry` warnings only, before and after the review's edits |

## What was checked

- **Stage text.** T.1:plus asks for K₂ ≅ H₂(E(A);ℤ) through the universal central
  extension, and for an identification with π₂ of the K-theory space by Hurewicz
  and the plus construction, natural in A. The first is the inherited
  `k2-h2-elementary`. The second is the inherited `k2-pi2`, realised here by χ_A
  (fibre route) and Ξ_A (into ΩBQ), with the Hurewicz composite of `k2-pi2`
  fully specified under `inheritedTargets`. "Planned" is the right status.
- **Mathematics.** The connecting map ∂ : π₂(X_A) → π₁(F_A) is injective
  because π₂BGL(A) = 0, and its image is ker(π₁F_A → GL(A)) = ker ε_A, since
  E(A) → GL(A) is injective. So δ_A is an isomorphism. Equation (2), δ_A χ_A = a_A
  on kernels, follows from `uce-kernel-h2-natural` for id_E and injectivity of
  κ_F. The naturality square follows from `H.3/plus-pi2-natural` with
  GL(f)(E(A)) ⊆ E(B), by cancelling ρ_B. Model independence is naturality for
  id_A with two models, plus uniqueness of lifts between universal central
  extensions. The cover/Hurewicz composite ρ_cov = b ∘ H₂(q)⁻¹ ∘ h ∘ (p_*)⁻¹ is
  well defined:
  - p_* is an isomorphism in degree 2 (Hatcher Prop. 4.1);
  - Hurewicz is applied on the simply connected cover;
  - H₂(q) is an isomorphism because q is the plus construction of BE(A)
    (H = P case of `H.3/plus-universal-cover`, homology through the regular
    cover);
  - b is the H.1 bar comparison.
- **Suppliers read.**
  - StableHomotopyKTheory: H.1 `classifying-space-of-group-is-KG1` and
    `bar-complex-comparison`; H.2 `homotopy-fibre-and-long-exact-sequence`,
    `connecting-map` and `long-exact-sequence`; H.3
    `plus-pi2-universal-central-extension`, `plus-pi2-natural`,
    `plus-construction-functoriality`, `-uniqueness` and
    `-universal-property`, `plus-universal-cover`,
    `twisted-homology-via-cover`, `hspace-is-abelian`, `abelian-space` and
    `plus-hspace-recognition`; H.4 `plus-hspace-block-sum`.
  - The parent `K2SymbolsBrauer--T.1` nodes `k2-definition`,
    `steinberg-is-uce`, `k2-h2-elementary`, `k2-pi2`, `uce-kernel-h2`,
    `uce-kernel-h2-natural` and `uce-lift`.
  - KTheoryLowDegrees U.1 `whitehead-lemma` and `stable-elementary-perfect`.
  - The atlas text of `GeneralAlgebraicKTheory:K.2:plus` and Stage 8 of the
    current TauCetiRoadmap AlgebraicTopology README (item 3, absolute
    Hurewicz).
- **Baseline.** Each declaration was read in the pinned trees:
  - Mathlib: `groupHomology.H2` (LowDegree), `Rep.trivial`,
    `groupHomology.map`, `map_id` and `map_comp` (Functoriality, with
    restriction of coefficients in `map_comp`), `HomotopyGroup` (with its
    `CommGroup` instance for nontrivial N), `MonoidHom.ker`,
    `MulEquiv.toAdditive`, `MonoidHom.toAdditive` and
    `AlgebraicTopology.singularHomologyFunctor`.
  - Tau Ceti: `HomotopyGroup.mapHom` (Map.lean, root namespace),
    `HomotopyGroup.mulEquivOfHomotopyEquiv` (`Finite N`),
    `TauCeti.homotopyGroupTransport_map` (`Fintype N`, keeps the track) and
    `IsCoveringMap.homotopyGroupMulEquiv` (`Nontrivial N`).

  All say what the packet claims.
- **Sources.**
  - Weibel, K-book Chapter III, Definition 5.3.1 to Theorem 5.4 on p. III.37
    and Theorem 5.5 on p. III.38.
  - Weibel, K-book Chapter IV:
    - Definition 1.1 on p. IV.2; Definition 1.1.1, Functoriality 1.1.2 and
      Homotopy Fiber 1.2 on p. IV.3.
    - Theorem 1.5 and Lemma 1.6 on p. IV.5; Proposition 1.7 and
      Corollary 1.7.1 on p. IV.6.
    - Exercise 1.8 on pp. IV.14–15.
    - Cofinality Theorem 4.11 on pp. IV.44–45; Corollary 4.11.1 on p. IV.45.
    - Theorem 7.1 on p. IV.61; Corollary 7.2 on p. IV.62; Theorem 7.8 on
      pp. IV.63–64.
  - Hatcher: Proposition 4.1 on p. 342; Theorem 4.32 on pp. 366–367; the
    absolute Hurewicz map and its naturality on p. 370; Theorem 4.37 on
    p. 371.
- **Library audit and upstream.**
  - The audit (AUDIT-29) finds both T.1:plus targets absent. It lists
    `GeneralAlgebraicKTheory:K.2:low-degree-comparisons` as a duplicate; the
    atlas edges make that stage a consumer of T.1:plus, which is how the
    packet treats it.
  - Current Tau Ceti (a91d3aa) has no plus construction, Steinberg group or
    Hurewicz map. TauCetiRoadmap (0d144d0) plans Hurewicz in AlgebraicTopology
    Stage 8 and nothing on K₂.

## Corrections made in place

1. **ρ_A is consumed from H.3, not built again.** The packet built
   ρ_A = κ_F ∘ δ_A from the H.2 connecting map and `uce-kernel-h2`. That is
   exactly the equivalence `TauCeti.plusConstruction.pi2Equiv` of
   `StableHomotopyKTheory:H.3/plus-pi2-universal-central-extension`, whose
   proof uses the same boundary and kernel identification. The statement and
   proof now cite it. A compatibility API item `fromHomology_pi2Equiv` was
   added (packet, reader table, and the omitted list of the suggested file,
   since its carriers are absent at the pins).
2. **Wrong supplier for the H-space structure.** The naturality theorem took
   the trivial π₁-action on π₂ of the ring plus model from an H-space structure
   requested from `GeneralAlgebraicKTheory:K.2:plus`.
   `StableHomotopyKTheory:H.4/plus-hspace-block-sum` already plans the
   block-sum H-space structure on BGL(R)⁺ and the trivial action of
   π₁ = K₁(R) on every π_n. It is also what makes the target abelian, which
   `H.3/plus-construction-functoriality` needs in order to produce f⁺ at all.
   - It is now a prerequisite of `comparison-naturality` and
     `comparison-model-independence`; the latter also gains
     `H.3/hspace-is-abelian`.
   - The K.2:plus request no longer asks for it, and K.2:plus is no longer a
     prerequisite of the naturality theorem.
   - There is no cycle: H.4 already precedes T.1:plus through K.2:plus.
3. **Direct prerequisite.** `comparison-naturality` uses the naturality of κ,
   so the inherited `k2-h2-elementary` is now a direct prerequisite. Its
   kernel map C(f) is the UCE lift of E(f).
4. **What χ_A is.** χ_A realises the existence-and-naturality statement of
   `k2-pi2` by Weibel's fibre route. It does not refine that target's
   Hurewicz construction, and the packet never asserts that χ_A equals the
   Hurewicz composite. The statement and reader now say this instead of
   "refining" the target.
5. **Planets.** The planet "Classical and homotopy K₂" on the normalised
   comparison duplicated the parent's planet on `k2-pi2` ("K2 is the second
   homotopy group") in the same layer, so it was removed. "The plus and Q
   comparison" named Quillen's + = Q theorem, which this layer imports from
   K.2:plus; it is renamed "Classical K₂ as Quillen's K₂", which is what
   Ξ_A is.
6. **Locators.** Hatcher Theorem 4.32 gives only an abstract isomorphism; the
   statement that the Hurewicz map is the isomorphism is Theorem 4.37
   (absolute case), p. 371, now added to the locator, `readSections` and
   reader. Weibel's Lemma IV.1.6 and its proof lie on p. IV.5, not pp. IV.5–6.
   `singularHomologyFunctor` was listed in the baseline for the cover route
   but cited nowhere; it is now among that route's prerequisites.
7. **Missed source issue.** `K2SymbolsBrauer/E-plus-factorisation-strict` is
   added and confirmed. Weibel IV, Theorem 1.5(2), p. IV.5, states the
   factorisation through a plus construction as an equality g = h ∘ f. That
   fails for the plus construction [0,1] → point and g = id. The intended
   statement is up to homotopy, which is how parts (3) and 1.1.2 use it. The
   archived errata list (SHA-256 ef7ed6d0…) and the register have no entry.
   `sourceVersions` records the chapter file read.
8. **Suggested file.**
   - Added `fromHomology_fibre`, the algebraic step of equation (2), with δ,
     κ_F and the kernel map as inputs over the actual kernel and π₂ carriers.
   - Replaced the unrelated example `(1 : ℤ) ≠ -1` with the packet's
     `negative_comparison_test` stated on those carriers: if κ z ≠ −κ z, the
     negated comparison fails normalisation.
   - Named the tests in comments and updated the omitted-targets comment.
9. **Reader.** Brought in line with items 1 to 8, including the dependency
   table, the request paragraph, the planet line and the sources list.

## Questions for the orchestrator

1. **Duplicate comparison in a sibling packet.** `K2SymbolsBrauer--T.1-2`
   (Codex `codex-N3kPM4`, #9305; its review is #9263) has a node
   `K2SymbolsBrauer:T.1/chosen-k2-comparisons`. It builds
   β_R = p_* ∘ hur⁻¹ ∘ H₂(j_R) ∘ α_R : K₂(R) ≃ π₂BGL(R)⁺ with the same
   requests to K.2:plus and AlgebraicTopology Stage 8. That is the
   cover/Hurewicz composite this packet specifies for `k2-pi2` (ρ_cov, χ_cov),
   built in parallel. The layer that owns this comparison is T.1:plus. I
   recommend that the review of #9263, or the assembly, retire
   `chosen-k2-comparisons` in favour of this packet's χ_A and inherited-target
   route, or identify β_R with χ_cov under T.1:plus. Two owners should not
   survive assembly. The T.1-2 request also asks K.2:plus for the H-space
   interface, which item 2 above reassigns to StableHomotopyKTheory H.4.
2. **Two comparisons, not compared.** χ_A (fibre boundary) and χ_cov
   (cover + Hurewicz) are both natural isomorphisms K₂(A) ≅ π₂BGL(A)⁺. The
   packet honestly does not assert that they are equal or opposite. No present
   consumer needs the relation; if one does, it becomes a refinement of this
   stage.
3. **Pinning H.3's equivalence.** The API statement of H.3's `pi2Equiv` does
   not name the boundary it uses; only its proof does. When StableHomotopyKTheory
   is packaged, its README should say that `pi2Equiv` is the H.2 connecting map
   followed by the kernel/H₂ identification. This supplement's normalisation
   relies on that.

## Summary

Accepted. Four nodes corrected, none added. All 14 baseline citations
confirmed, none removed. One API item, one confirmed source issue and two
locator corrections added. The H-space input is moved from a request to
GeneralAlgebraicKTheory onto its existing owner, StableHomotopyKTheory H.4.
ρ_A is identified with StableHomotopyKTheory H.3's existing equivalence. The
suggested file elaborates. The sibling T.1-2 packet duplicates the
cover/Hurewicz comparison, which the orchestrator should resolve at assembly.
