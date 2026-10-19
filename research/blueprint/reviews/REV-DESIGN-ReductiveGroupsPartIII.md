# Independent review: Reductive algebraic groups, Part III

**Accepted as a complete target-level planning pass.** Issue #3603;
`REV-DESIGN-ReductiveGroupsPartIII`; reviewer Codex, session `codex-98PYit`;
2026-10-19. This reviewer did not author the design. Acceptance concerns the
correctness and coverage of the plan, not implementation or dependency closure.
All implementation statuses remain `unchecked`.

## Inventory and verdict

| Item | Reviewed result |
| --- | ---: |
| Retained nodes | 41 |
| Verified / corrected / added | 32 / 9 / 0 |
| Removed duplicate nodes | 1 |
| Definitions / constructions | 5 / 4 |
| Theorems / comparisons / applications | 29 / 1 / 2 |
| API statements / worked tests | 45 / 36 |
| Planets | 30 |
| Confirmed pinned baseline declarations | 7 |
| Public source texts checked | 10 |
| Source findings confirmed / rejected | 6 / 0 |
| Explicit gaps / supplier requests | 7 / 15 |
| Stages planned / closed | 6 / 0 |

Every retained node has its own verdict and mathematical explanation in
`packet.review.checked`. The nine definitions/constructions each retain five
API statements, two recorded uses and four discriminating worked tests. Planet
counts by stage are 6, 4, 4, 6, 5 and 5, within the six-per-stage limit. No new
node, baseline declaration or roadmap was added. No baseline citation was
removed. The suggested Lean file needs no mathematical change.

## Corrections made

1. **Import existing Chevalley theory.** Removed
   `RG3.0/chevalley-line-stabilizer`. Current Tau Ceti already supplies
   `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer`
   in `TauCeti/Algebra/AlgebraicGroup/Representation/ExteriorStabilizer/Character.lean`,
   [line 101 at the inspected commit](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Algebra/AlgebraicGroup/Representation/ExteriorStabilizer/Character.lean#L101).
   Its hypotheses are a commutative Hopf algebra over a field and a Hopf ideal
   with finitely generated underlying ideal. It produces a one-dimensional
   line in a finite-dimensional exterior-power comodule, with stabilizer
   equality on every commutative value algebra. It also supplies the unique
   subgroup character. Finite-type coordinate algebras over a field are
   noetherian, so this includes the entire removed target, even for nonreduced
   subgroups and value algebras. The highest-weight proof imports this through
   the existing RG Layer 1 dictionary. Requests, stage description, reader,
   restructuring proposal and Howe–Klevdal item `/019` now record an import.
   That item remains accounted for in the 487-item route map.
2. **Keep current library and fixed baseline distinct.** The above module
   postdates Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; it is recorded
   in `libraryAudit.currentLibraryImports`, not `baseline.declarations`.
   Replaced the ambiguous `currentUpstreamCommit` with separate inspected
   commits: Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and
   TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`. Corrected the
   roadmap commit in `upstreamNotes`. The Lean sketch still uses only the pins.
3. **Correct Steinberg locators.** Theorem 6.1, Lemmas 6.2–6.3 and
   Corollaries 6.4–6.6 are on printed pp.62–63, not pp.64–65. The character
   basis uses Theorem 6.1 and Lemma 6.3; there is no Proposition 6.2 at the
   cited location. Corollary 6.6 is on p.63. Corrected four node citations,
   both bibliographies and the reader. The semisimple source and the planned
   reductive extension remain distinguished.
4. **Correct KMPS locators.** Lemma 1.2.1 and its proof span pp.13–14;
   Lemma 1.2.2 is on p.14. Lemma 2.2.10 starts on p.28 and its proof ends on
   p.29. Corrected the auxiliary-class, torus-approximation, neatness and
   density citations in packet and reader.
5. **Clarify rational-embedding ownership.** The general quasi-split
   maximal-torus embedding theorem remains an ET.0 request. The RG3.4 node
   states its arithmetic application: local fixed classes in a finite Galois
   orbit imply an invariant class, which the imported theorem realizes
   rationally. It does not independently own the requested foundation.
6. **Record independent source verdicts.** Added confirmed reviews to all
   six `sourceIssues`, with counterexamples or the precise compatibility
   calculation. No additional source mistake was established. All statements
   and proof descriptions remain in the workers' own words; no source excerpt
   is retained.

## Sources and mathematical checks

The downloaded public files independently matched all ten packet SHA-256
values. These are the versions reviewed, with printed or internal pagination
as specified in their metadata:

| Source | Locations checked and use |
| --- | --- |
| [Kisin–Zhou, arXiv v2](https://arxiv.org/pdf/2103.09945v2) | §5.1.3 p.47; §§5.3.2–5.3.6 pp.53–55; §§6.1–6.3 pp.55–61. Conjugacy quotients, arithmetic descent, auxiliary realization and Frobenius conclusions. |
| [Kisin–Madapusi Pera–Shin, author copy](https://math.berkeley.edu/~swshin/HT.pdf) | Lemmas 1.2.1–1.2.2 and Proposition 1.2.5 pp.13–15; §2.1.8 and §2.2 pp.24–30; relevant §2.3 statements and proofs pp.33–36. Real twisting, Weil-point rigidity and torus transfer. |
| [Steinberg 1965](https://www.numdam.org/item/PMIHES_1965__25__49_0.pdf) | §§6.1–6.6 pp.62–63. Character triangularity, restriction and semisimple separation. |
| [Kottwitz 1986](https://people.dm.unipi.it/maffei/didattica/seminario2020/Kottwitz1986.pdf) | Theorem 1.2 and §§1–2 pp.369–377, particularly Theorem 2.2, Corollary 2.5 and Proposition 2.6; Theorem 6.6 and §§6.7–6.8 pp.381–384. Scanned pages were read visually. |
| [Kottwitz 1990](https://www.jmilne.org/math/Books/AA1988a.pdf) | §7 pp.186–189, particularly p.188. Relative obstruction cancellation by one Chebotarev prime; scanned pages were read visually. |
| [Langlands–Rapoport](https://publications.ias.edu/sites/default/files/shimuravarietaeten-und-gerben_rpl_0.pdf) | Lemma 5.6 and proof, internal p.55. Local-to-global torus transfer with an anisotropic place. Its original obstruction input remains a gap. |
| [Borovoi](https://www.tau.ac.il/~borovoi/papers/galofile.pdf) | Lemma 5.6.3 p.37 and Theorem 5.12 with proof pp.40–41. Torus approximation and abelianized/real cohomology. |
| [Deligne](https://www.jmilne.org/math/Documents/Deligne82.pdf) | Theorem 2.11 p.19 and §§3.4–3.8 pp.24–27. Absolute Hodge comparison and Mumford–Tate compatibility. |
| [Shin](https://math.berkeley.edu/~swshin/StableGal.pdf) | §3.1, Lemma 3.1 and Remark 3.2, internal pp.12–14. The common-multiplier unitary calculation has the additional hypothesis F=F⁺E. |
| [Milne, corrected 2022 manuscript](https://www.jmilne.org/math/Books/iAG2022.pdf) | Theorem 4.27/Lemma 4.28 pp.94–95; Theorem 22.2 and §§22.8–22.27 pp.464–471, including the complete highest-weight proof. |

The six findings are confirmed against the specified preprint/author copies:
KZ's H¹ bidegrees (E1), arbitrary nonsemisimple compact lift (E2), untracked
scalar/class in the real lift (E3), and conjugation display (E6); KMPS's
unrestricted scheme rigidity (E4) and connected-centralizer Levi assertion
(E5). In particular, dual numbers refute rigidity without reducedness and the
doubled line refutes it without separatedness. The Sp₄ centralizer has type
A₁×A₁ and is reductive but not a Levi. Choosing a semisimple elliptic-torus
representative and restoring the specified positive weight scalar repairs the
real lifting proof without changing its quotient class. Publisher full texts
were not obtained, so these verdicts do not assert errors in versions of record.
An independent title/erratum/correction search found the same public versions
and no separate correction; this is a scoped search, not a completeness claim.

## Baseline and ownership

All seven baseline statements and their ambient typeclass hypotheses were read
at the full recorded commits: Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Their uses are:

| Declaration | Confirmed contribution |
| --- | --- |
| `AlgHom.equalizer` | Actual subalgebra where two algebra maps agree. |
| `TauCeti.HopfAlgebra.conjugationAlgHom` | Coordinate left conjugation, first tensor factor the conjugator. |
| `TauCeti.HopfAlgebra.productMap_comp_conjugationAlgHom` | Evaluation at arbitrary algebra-valued points gives gxg⁻¹. |
| `TauCeti.HopfAlgebra.tensorProduct_map_comp_conjugationAlgHom` | Naturality needed to restrict pullback to regular class functions. |
| `TauCeti.reductiveCommHopfAlgProperty` | Existing smooth, geometrically connected reductive-group predicate. |
| `TauCeti.HopfAlgebra.IsSemisimplePoint` | Semisimplicity on all finitely generated comodules. |
| `MulAction.sum_card_fixedBy_eq_card_orbits_mul_card_group` | Finite-action Burnside identity for Jordan's subgroup criterion. |

Read the current RG and ClassicalGroups documents and their suggested
signatures, relevant RGII layers, current library and the reviewed library
coverage audit. The current library's abstract pointwise class functions do
not supply the coordinate-algebra equalizer on every algebra of points.
The general reductive algebraic-group highest-weight statement retains the
full character lattice and imports the existing complex classical cases;
PGL₂'s parity restriction and G_m's Laurent characters test that distinction.

Read the actual cross-packet supplier statements: ET.0's inner twists,
Tate–Nakayama, duality, abelianization, rational/stable classes and equal-form
obstruction; AA.3 finite class number; BG1 elliptic-torus basic image; D1's MT
group, connectedness and reductivity; MC.6's reconstruction and tensor-isomorphism
torsor; AutomorphicBundles' finite tensor stabilizers and absolute-Hodge
propagation; and the abelian-scheme comparison, semisimplicity and Frobenius
polynomial nodes. Requests correctly identify stronger interfaces not provided
by those statements, especially A4's coherent Betti–étale tensor comparison
and ET.0's relative-inner-form obstruction and quasi-split embedding theorem.

The layers are in dependency order. The proposed geometric continuation takes
RG3.0–RG3.4 and supplies applications only to RG3.5; adding reciprocal
whole-roadmap dependencies would create a cycle. All 13 incoming routes and
487 item dispositions remain accounted for. The eight independent directions
remain restructuring proposals, not newly asserted roadmaps. Galois gerbs
remain imported from `SchemeAndStackFoundations:key/galois-gerbs`; no gerb
definition or projective-limit theory is planned again here.

## Remaining work and orchestrator decisions

The existing seven gaps are precise and do not contradict the planned stage
statuses: geometric Frobenius/auxiliary realization; KMPS isogeny-group/Noot
realization; Langlands's original transfer obstruction; Kottwitz 1982's
quasi-split embedding theorem; Harder's original approximation and the local
openness interface; Noot's orthogonal action convention; and the arbitrary-CM
extension of the odd-unitary Hasse calculation. Every proof reaches a pinned
declaration, an existing node, an exact supplier request or a named gap. None
of the stages qualifies as closed. The accepted packet remains `complete`
in the protocol's sense of one complete planning pass.

For packaging, preserve the post-pin import distinction and use a library
revision containing the existing line-stabilizer theorem; do not reinstate
its proof as a target. Retarget Howe–Klevdal `/019` to that declaration when
applying the restructuring. The proposed geometry owner and the original
source acquisition contracts still need the maintainer's routing; this review
does not alter other jobs or suppliers. There is no unresolved mathematical
contradiction requiring a revision of the retained plan.

## Verification

- `python3 scripts/check_blueprint.py research/blueprint/packets/ReductiveGroupsPartIII.json`:
  **0 errors, 0 warnings** after correction, with the shared declaration index.
- `lean-check research/blueprint/suggested/ReductiveGroupsPartIII.lean`:
  **exit 0**, ten `declaration uses sorry` warnings and no other diagnostics,
  independently run in the supplied pinned build. Memory available before
  compilation was 87 GB. The file is unchanged, 102 lines, with one real-bodied
  equalizer definition and statements/examples on pinned carriers. No
  sorry-defined data, library build or language server was used.
- Checked JSON validity, all ten source hashes, exact review/node coverage,
  reader/packet statement/API/test/dependency/source concordance, stage and
  planet counts, route accounting, no dangling removed-node reference, no
  excerpts, permitted file scope and `git diff --check`.
