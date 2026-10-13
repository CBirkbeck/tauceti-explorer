# Independent review of R18.4

**Accepted as a complete target-level planning pass; R18.4 remains planned.**
This verdict does not assert proof closure or formalization. The two original
p-adic proof leaves and fifteen precise supplier requests remain explicit.
There is no unresolved contradiction in the corrected targets.

Reviewer: Codex, session `codex-CakdsQ`, job
`REV-HilbertModularVarietiesAndShimuraCurves--R18.4`, issue [#9392](https://github.com/CBirkbeck/tauceti-explorer/issues/9392),
2026-10-13. The input was written by a different worker, session
`codex-GR7zc9`, in [#9467](https://github.com/CBirkbeck/tauceti-explorer/pull/9467).
The reviewer did not write that input.

## Scope and counts

Reviewed the [packet](../packets/HilbertModularVarietiesAndShimuraCurves--R18.4.json),
[reader](../readmes/HilbertModularVarietiesAndShimuraCurves--R18.4.md) and
[suggested Lean](../suggested/HilbertModularVarietiesAndShimuraCurves--R18.4.lean).
The packet's `review.checked` gives a separate justification for every node.

| Item | Result |
| --- | --- |
| Nodes | 27: 12 verified, 15 corrected, 0 added, 0 unverifiable |
| Kinds | 5 constructions, 1 definition, 17 theorems, 3 comparisons, 1 application |
| API entries | 42, increased from 23 |
| Definition/construction checks | 19; each of the six nodes has at least three |
| Planets | 6, all mathematical definitions/constructions or central theorems |
| Baseline declarations | 7 confirmed; none removed or replaced |
| Primary sources | 7 exact PDFs checked at every cited locator |
| Source issues | 4 confirmed: 2 inherited and 2 added |
| Proof leaves | 2 original source gaps and 15 supplier requests |
| Suggested Lean | 193 lines; 6 real-bodied light definitions; no sorry'd data |

The nine earlier R18.4 core targets were read in accepted R18.2, together
with their supplier statements and retained limitations. R18.2 is outside
this issue's edit scope. Two inherited dependency replacements are explicitly
required when packaging; the new nodes no longer import those backward edges.

## Corrections

1. **Integral reduction:** `integral-ihara-saturation` previously carried DVR
   saturation through reduction to O/λⁿ. The correct conclusion is a split
   injection and a finite-free cokernel over the reduced ring. The reduced
   cokernel of x↦(x,0) from O to O² is O/λⁿ, which has λ-torsion.
   DVR coefficient extensions still preserve saturation. Added the end
   signature `integral_ihara_split` and synchronized the worked example.
2. **Coefficient dual:** `central-character-exactness` now states the actual
   [MS](https://arxiv.org/pdf/1907.06043v2) Lemma 2.5, pp.10–11:
   H¹(X,A∨) and H⁰(Y,A∨), with coefficient Pontryagin dual
   Hom_Z_l(A,Q_l/Z_l). Exact character extraction is restricted to the
   appropriate sequences with injective kernels. Finite coefficient duals,
   free integral linear duals and inverse-limit homology are distinguished.
   A non-self-injective finite algebra supplies a discriminating countercheck.
3. **Definite supplier scope:** the imported KW definite nodes in R18.3 assume
   even totally real degree and an unramified coefficient prime. They cannot
   supply the general-field definite theorem used by MS Theorem 6.8,
   pp.34–36. Four consuming nodes now depend on an exact R18.3 Part II request
   for the general constant-coefficient carrier, central action and definite
   Ihara proof. The final MS Theorem 6.5 is not silently narrowed.
4. **Characteristic-zero comparison:** the early Galois–Hecke node no longer
   imports the core eigenspace node through its higher-tier R17 prerequisites.
   It uses the lower-tier ALS.5 comparison and an explicit compact Matsushima
   specialization request with AF.3/AF.4 inputs. Actual common E-models remain
   hypotheses of the bridge. The AF supplier packet's `needs_changes` verdict
   is recorded rather than described as an accepted theorem.
5. **Purity order:** the Saito projector no longer depends on core
   `quaternion-purity`, whose R34.5 prerequisite creates a backward cycle.
   The projector precedes the coefficient-purity refinement. Packaging must
   route the old core purity and eigenspace dependencies through these early
   targets, as recorded in `coverage.remaining` and `upstreamNotes`.
6. **Patching:** removed the domain-only Kisin datum/theorem imports from the
   quaternionic patching functor. The precise generic request now covers MS
   Definition 4.1 and Propositions 4.2–4.6 without a domain hypothesis, then
   Lemma 4.7, Corollary 4.8 and Theorem 4.19. Reducible local rings are retained;
   arbitrary inverse-limit exactness is never asserted.
7. **Flatness:** the R03.3 request includes MS Lemma 5.1 with local noetherian
   rings, regular base, finite MCM module and the actual fibre-dimension
   equality, followed by Lemmas 5.2–5.3, pp.31–33. Removed the unreviewed old
   named miracle-flatness import and fixed the ambient rings in the proof.
8. **Direct prerequisites:** added the existing Chebotarev Layer 10 contract
   to residual Eisenstein vanishing and early Galois–Hecke support. Split
   potentially semistable admissibility in PHT R06.2 from WD descent in R06.3.
9. **Saito good models:** sharpened [Saito](https://arxiv.org/pdf/math/0612077v2)
   Lemma 4, pp.32–33, to retain the split-p, hyperspecial PEL and unchanged
   p-component hypotheses, as well as the semistable genus condition. Corrected
   the CM/PEL source range to pp.18–24. The degree q₀ and CM correction a
   still give coefficient H¹ weight q₀+1−2a=w−1.
10. **API and metadata:** added constructors, extensionality, translation and
    functor laws, quotient universal properties, mean projections, fixed-datum
    patching maps and projector identities. Normalized test kinds. Corrected
    Milne 24.2 from theorem to remark. Added version kind, URL, read date and
    hash; the reader's target blocks contain the packet's statements,
    hypotheses, APIs, tests, proof steps, prerequisites and acceptance clauses.

No new mathematical node was needed: corrections belong to the existing
target statements/proof sketches, while generic missing contracts remain with
their owners as requests. Smaller implementation lemmas were not added.

## Baseline and current upstream

Read every declaration and its surrounding hypotheses at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. The four containing modules in
the shared pinned build matched their exact-commit raw GitHub files byte-for-byte.

| Confirmed declaration | What is actually provided |
| --- | --- |
| `TauCeti.LocalCoefficientSystem` | Fundamental-groupoid functors into modules |
| `TauCeti.LocalCoefficientSystem.pullback` | Whiskering along a continuous map |
| `TauCeti.LocalCoefficientSystem.monodromyRepresentation` | Linear monodromy on the actual fibre |
| `TauCeti.LocalCoefficientSystem.constantFunctor` | The existing constant module-valued functor |
| `AlgebraicGeometry.Scheme.EllAdicCohomology` | Additive constant continuous Z_l pro-étale cohomology |
| `IsDiscreteValuationRing` | Nonfield local PID |
| `Module.free_of_finite_type_torsion_free'` | Freeness from finite generation and torsion-freeness over a domain PID |

No baseline citation was removed. The PID entry's `provides` field now lists
its actual finite/domain/PID hypotheses. None of these declarations supplies
variable arithmetic étale coefficients, the integral curve tower or the PEL/CM
projector carriers.

Read the reviewed library audit and checked current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Its twisted-cochain construction
uses Hom variance, so the arithmetic finite-free dual/bidual adapter is correctly
new while generic twisted cohomology remains upstream. Checked current
AlgebraicTopology, Chebotarev, ClassFieldTheory, IntegralHeckeAndGaloisDeterminants
and SmoothRepresentationsOfLocalGroups contracts, and searched the nine newer
roadmaps and the four Completed roadmaps for overlapping targets.
IntegralLattices' Z-primitivity criterion does not supply the DVR residual
criterion. The current smooth-representation roadmap's complex p-adic
Steinberg target does not supply the requested finite GL₂(k_q) integral lattice.

## Sources and mistakes

All seven PDF hashes agree with `sources`. Read the source statements and proof
inputs supporting the packet, not just theorem names: MS §§2–6; Carayol
pp.409–412 and 417–420; Saito §§4–7; Milne §21 and §24; Deligne printed
pp.204–207; Badulescu–Renard §1.5 and Theorem 18.1/proof; EGS Lemma 4.1.1/proof
and §6.2. The precise ranges and URLs are in the packet. Every source record
and mathematical statement is in our own words; there are no source excerpts.

The two inherited MS v2 issues are confirmed at p.33 (split real place) and
p.23 (matching fixed determinant). Added two further confirmed misprints:

- **E-R18.4-03, p.37:** the fixed-determinant displays add an extra free Q,
  contrary to the four-coordinate presentations in Propositions 3.5–3.7.
- **E-R18.4-04, p.38:** the ambient ps and unipotent patched rings are swapped
  in the applications of Lemmas 5.2 and 5.3. Use residual R_ps,∞ first and
  R_unip,∞ second; the original module actions and XY relations force this.

Checked these four locations in the accessible
[author copy](https://jackgshotton.webspace.durham.ac.uk/wp-content/uploads/sites/164/2021/04/quaternion.pdf),
which retains the same slips. The published MPI PDF returned HTTP 403, and
browser access failed; this review scopes every finding to arXiv v2 and does
not independently certify the published text. No correction was located in
the accessible author/preprint text or the erratum/corrigendum search.

## Validation

- `python3 scripts/check_blueprint.py` on the packet: 0 errors, 0 warnings.
- `lean-check` on the suggested file at the pins: exit 0; only the expected
  `declaration uses sorry` warnings. Available memory exceeded 20 GB.
- `python3 scripts/check_sorry_data.py`: passed.
- Section 18 source-version/source-issue validators: passed for all four issues.
- Reader consistency check: all 419 checked target/API/test/proof/dependency
  clauses match the corrected packet; all 27 verdict IDs match their nodes.
- `git diff --check`: passed.

Compilation checks the light signatures and examples. The actual arithmetic
carriers remain in the reader's explicit omission ledger, as WORKERS and
PACKAGE_REVIEW require.

## Questions for the orchestrator

Which supplier jobs will discharge the fifteen requests, particularly the
general-field R18.3 definite theorem, the nodomain weak-patching extension and
the compact ALS.5/AF rationality specialization? The contracts and consuming
node IDs are precise; this is scheduling work, not a pending review verdict.

Who will trace the two original p-adic proof leaves before claiming proof
closure? Preserve them through packaging. The package worker must also apply
the two inherited core dependency replacements; the durable
[handoff](../handoff/REV-HilbertModularVarietiesAndShimuraCurves--R18.4.md) names
the affected nodes and owners. No question blocks acceptance of this planning pass.
