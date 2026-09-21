# REV-RS-12 — independent review of automorphic Galois representations

**Verdict: needs changes.** Refs #823. Reviewer: ChatGPT Pro, session
`cp-7b4e91`, 2026-09-21. The proposal was written by session `cg-6b83f1`.
This is a completed independent restructuring review, not approval of the
partial mathematical blueprints or a claim of Lean implementation.

The deduplication is substantially sound: it preserves the stronger classical
and Hilbert theorems, all sixteen stages and all twenty recorded external
consumer interfaces. I corrected two acceptance/source-transcription issues in
`RS-12.result.json`. The remaining blocker is the advertised extension frontier:
the proposed Part II still owns early mathematics needed to construct its base.
The existing stage graph is acyclic; the objection is **not** a claim that the
thirty proposed links create a cycle.

## 1. Required structural revision

[PROTOCOL §15](../PROTOCOL.md#15-build-on-existing-roadmaps-never-duplicate)
requires an extension to start where its base stops. The proposal calls
`AutomorphicGaloisRepresentationsPartII` an extension of
`AutomorphicGaloisRepresentations`, but retains both `AG2.0` and `AG2.1a` within
that extension. The exact recorded path is:

```text
AutomorphicGaloisRepresentationsPartII:AG2.0
  -> AutomorphicGaloisRepresentationsPartII:AG2.1a
  -> EndoscopicTransferAndUnitaryTraceComparison:ET.6
  -> GL2AutomorphicRepresentationsAndTransfer:R16.3
  -> GL2AutomorphicRepresentationsAndTransfer:R16.6
  -> AutomorphicGaloisRepresentations:R19.1
```

This is not a vocabulary match. `AG2.1a` expressly exports raw unitary
cohomology to `ET.6`; `R16.3` imports its local correspondence; `R16.6` consumes
`R16.3`; `R19.1` explicitly names `R16.6`. I checked those descriptions as well
as the graph. The author's report §4 correctly discovers this path, but its
suggestion to interpret `extends` only as a label for late public mathematics
does not resolve the ownership/frontier requirement.

**Do not repair this by adding `R19.1 -> AG2.0`, or by feeding a completed
AG2.1 aggregate to ET.6.** The former closes the displayed cycle; the latter
confuses the raw producer with `AG2.1b`, which already uses the local comparison.
Nor am I asking for every late base theorem to precede every extension lemma.
Stage-scoped imports are necessary. The issue is retaining a *constructor of the
base* inside the purported extension without assigning that shared foundation
an appropriate earlier home.

The orchestrator should choose and record one actual repair: extract the shared
raw-cohomology/early-normalization part into an appropriate foundational owner,
with imports from both consumers, and delimit the remaining extension; or
re-audit a genuinely over-broad dependency on the displayed path and replace it
with the precise earlier supplier. A change to `R16.6`, for example, needs a
source-level separation of its early newform comparison from its later local
parameter comparison; simply deleting its edge is not evidence. A different
merge/rescope can also be assessed. The new owner, preserved targets, old-ID
handling and all forwarded consumers must be in the next proposal. A protocol
exception would need explicit maintainer authorization, not an independent
reviewer's implicit assumption.

This is not a clear local edit: it reaches the ET/R16/foundation boundaries.
I therefore left the proposed `extend` decision and all existing edges intact,
marked the review `needs_changes`, and did not invent a cross-family move.

## 2. Corrections made in the proposal

### C1. Separate ramification from nilpotent monodromy

The current Part II README's "Additional closure targets", line 99 at the input
pin, requests a ramified principal-series example with nonzero monodromy.
For an **irreducible smooth principal series of GL2**, normalized induction of
characters with ratio different from `|.|` and `|.|^-1`, the Weil–Deligne
parameter has `N = 0`, even when one character is ramified. A Steinberg twist
has nonzero rank-one `N`. These are different tests, not interchangeable names.

I appended both tests to the `AG2.5` retained contract: keep a ramified
principal-series test with `N = 0`, and separately test a Steinberg twist with
`N != 0`. This preserves the original intention to test ramified parameters and
to detect loss of monodromy. It does not confuse a reducible induced
representation's special subquotient with an irreducible principal series.
Source: [Snowden, Lecture 16](https://virtualmath1.stanford.edu/~conrad/modseminar/pdf/L16.pdf),
§§1.1–1.2, Theorems 1.3–1.4, pp. 2–3; text and the p. 3 image were checked.
The p. 2 image request failed, so its text, not an image inspection, was used.

### C2. Make the inherited characteristic-p correction explicit

The first R19.1 decomposition node repeats a universal one-subgroup assertion
in characteristic p. The author's report already flags it. I independently
checked the source image, [Deligne, Bourbaki exposé 355](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf),
§3.13 and Proposition 3.15 with its proof, printed pp. 156–157, and reran the
counterexample. Over F5, `E: y^2 = x^3 + 3x + 2` has discriminant 4 modulo 5 and
points `O, (1,1), (1,4), (2,1), (2,4)`. The reduced subgroup of these five points
is distinct from the connected Frobenius kernel. After extending scalars and
choosing prime-to-5 level, it still contradicts the universal fibre assertion.

I made this integration correction explicit in R19.1's `reason`. Finite
representability, finite projections and the geometric Eichler–Shimura
construction remain targets. The ordinary/supersingular fibre statement needs
its correct sourced replacement; copying a printed assertion is not a proof of
its mathematical validity. I did not modify the inherited decomposition itself,
which this review issue does not authorize.

Apart from these two appended contracts and the top-level `review` object,
the proposal is unchanged. The original author's report, roadmaps, atlas,
anchors, partial decompositions and implementation statuses are untouched.

## 3. Independent ownership and conservation audit

The family descriptor has two members and no named Tau Ceti anchors. I read both
member documents and all sixteen layer descriptions in full, all ten family
leads, all twenty proposed ownership scopes, the precise external suppliers and
the external consumer stages. Nearby upstream exemplars read were
[JacobianChallenge](../../../content/tau-ceti/JacobianChallenge/README.md) and
[SemisimpleAlgebras](../../../content/tau-ceti/RepresentationTheory/SemisimpleAlgebras/README.md).
Neither is modified or substituted as a supplier for an unstated theorem.

The ten directional leads reduce to five real overlap questions:

| Overlap | Checked ownership boundary |
| --- | --- |
| R19.1 / AG2.7 | R19.1 keeps the classical geometric object and separate weight-one Artin construction. AG2.7 compares overlapping exports up to isomorphism, not a second public representation. |
| R19.2 / AG2.3 | R19.2 keeps the covered Hilbert construction, including parity and auxiliary-place cases. AG2.3 keeps its general-rank method, descent and genuinely new field domains, including new rank-two CM cases. |
| R19.3 / AG2.6 | `R24.5:operations` owns the actual compatible-system carrier and operations; R19.3 and AG2.6 construct the respective families and prove their properties. It is not the late potential-modularity existence theorem. |
| R19.4 / AG2.5 | The stronger covered rank-two full WD theorem stays in R19.4. The general nonselfdual bound is not an adequate replacement for it. |
| R19.5 / AG2.6 | The exact covered coefficient-prime theorems remain in R19.5; extra rank/field/branch cases remain new work in AG2.6. |

The additional owner entries are consistent with the read suppliers: G7 for
representation operations and polarization pairings; R01.1 for invariant
lattices and residual semisimplification; AF.4 for algebraic weights/rational
structures; IHG.3 for the spherical polynomial; IHG.1/IHG.4 for reconstruction
and integral interpolation; R34.6 for purity applied to an actual geometric
eigenspace. Their generic APIs do not themselves construct the automorphic
instances. AG2.7's local no-ratio predicate and IG.5's dual-Hecke-normalized
obstruction remain different obligations. No additional duplicate public
construction was identified in this screen.

The stage-by-stage conservation check is:

| Stages | What must survive the revision |
| --- | --- |
| R19.1 | Weight-two Jacobian, higher-weight symmetric-power/Kuga–Sato and separate weight-one constructions; projectors, fields, lattices and the corrected geometric Frobenius calculation. |
| R19.2 | Hilbert/quaternionic realization, source-specific parity/auxiliary-place/descent hypotheses, determinant, oddness and irreducibility. |
| R19.3 | Actual eigenform family and its proved local properties, using the shared carrier and geometric purity supplier. |
| R19.4 | Full Frobenius-semisimplified comparison retaining N, conductors and bad factors in the source domain. |
| R19.5 | Geometric coefficient-prime comparisons and distinct ordinary, Barsotti–Tate, endpoint-weight and regulator interfaces. |
| R19.6 | Integral Hecke determinant, all finite-quotient congruences, nilpotents, reconstruction hypotheses and local deformation maps; the abelian-variety comparison is weight two only. |
| AG2.0 | Rec-free early weights/fields/Satake dictionary. Its owner/frontier needs the structural revision above; the mathematics is not dropped. |
| AG2.1 | Aggregate only, not an additional proof or substitute raw producer. |
| AG2.1a | Actual raw compact-PEL cohomology, algebraic projectors, commuting actions and geometric traces; preserve the ET.6/ET.6a exports while resolving ownership. |
| AG2.1b | Passage from virtual classes to actual constituents, with multiplicity, purity and cancellation proved after local comparison. |
| AG2.2 | Polarized cuspidal and discrete/isobaric assembly, constituent twists, multiplicities and the degree-2n polynomial. A cuspidal existence theorem does not supply this whole interface. |
| AG2.3 | Eigenvariety instance, approximation and effective descent, with the exact R19.2 overlap imported. |
| AG2.4 | HLTT's boundary/Levi and overconvergent construction, congruences at every coefficient power, determinant limits and degree-n factor extraction; no torsion-interpolation shortcut. |
| AG2.5 | New-domain local comparisons, late rec normalization and separate branch strengths; C1 corrects its examples. |
| AG2.6 | New families, common coefficient data and separately proved coefficient-prime properties; no upgrade from weak compatibility alone. |
| AG2.7 | Chosen-lattice applications, residual polynomial comparison, no-ratio predicate, typed exports and isomorphism-class GL2 comparison. |

No row authorizes a canonical lattice or unique matrix conjugacy. In R19.6 the
weight-two comparison has total Q_ell dimension `2[K_f:Q]`; it is not a
higher-weight abelian quotient. These distinctions agree with the present member
contracts and were not erased by the deduplication.

### Consumers and forwarding

I compared the full directed `stageEdges` data with the proposal, not only the
two members' local extracts. All twenty old external edges remain. Their target
stages, grouped by the unchanged producer, are:

| Producer | External consumers retained |
| --- | --- |
| R19.1 | AlgebraicModularFormsAndSerreWeights:R15.6; KatoEulerSystems:L2 |
| R19.3 | ComplexMultiplicationAndExplicitReciprocity:CM.4 |
| R19.5 | AutomorphicCongruences:L0 and L5; KatoEulerSystems:L3; PadicFamilies:L4; PadicHodgeRegulators:L4 |
| R19.6 | CompletedCohomologyAndLocalGlobalCompatibility:R31.3; EllipticCurveModularity:R29.1 and R29.5; GL2ModularityLifting:R22.1; OrdinaryAutomorphicFormsAndModularityLifting:R21.3; PotentialModularityAndCompatibleSystems:R24.1; SerreWeightAndLevelOptimisation:R20.1 |
| AG2.1a | EndoscopicTransferAndUnitaryTraceComparison:ET.6 and ET.6a |
| AG2.2 | TorsionCohomologyInfrastructure:TC.4 |
| AG2.5 | IgusaVarietiesAndTorsionConcentration:IG.5 |
| AG2.7 | PotentialAutomorphyInfrastructure:PA.0 |

The listed local deformation, period and arithmetic specializations remain
source-qualified applications, not consequences of generic GLn existence.
ET.6/ET.6a still receive raw geometry. TC.4 keeps its genuine torsion-class test;
PA.0 retains actual integral comparison maps, not an assumed splitting. IG.5
keeps the contragredient, inverse-root and Tate-twist normalization needed to
return from the dual Hecke ideal.

For each of the four narrowed stages, every new supplier has a direct link to
the narrowed stage and every old direct consumer. There are no missing
forwarding pairs:

| Narrowed stage | Old direct consumers covered |
| --- | --- |
| R19.3 | R19.4; CM.4 |
| AG2.3 | AG2.4; AG2.5; AG2.6 |
| AG2.5 | AG2.6; AG2.7; IG.5 |
| AG2.6 | AG2.7 |

The new AG2.7 → IG.5 predicate link is also directionally correct. The other
forwarding links are supplier access, not claims that each consumer uses every
theorem of the supplier. This matches their explicit reasons.

## 4. Source strength and inherited gaps

I independently read selected primary theorem statements and relevant page
images. I did **not** reread all construction proofs. The checks support these
boundaries:

- [HLTT, opening Theorem A / Corollary 7.14](https://www.kwlan.org/articles/rigcoh.pdf):
  regular algebraic cuspidal input over CM/totally real fields, no self-duality
  hypothesis, actual continuous semisimple representations and the stated
  good-prime comparison. This endpoint does not assert full ramified or
  coefficient-prime compatibility.
- [Chenevier–Harris](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf),
  General Hypotheses 1.1, Theorem 3.2.3 and Proposition 3.2.5: retain the polarized
  cuspidal hypotheses, the monodromy bound, de Rham/Hodge–Tate assertions and
  maximal-compact/Iwahori hypotheses for crystalline/semistable conclusions.
  The common field of realization may require an extension; do not identify it
  automatically with the trace field. This theorem is not the separate
  discrete-isobaric assembly required in AG2.2.
- [Varma](https://arxiv.org/pdf/1411.2520), introduction, Theorems (1ss) and (1):
  underlying semisimplified equality and a monodromy bound are distinct from
  full Frobenius-semisimplified WD equality. The proposal preserves that distinction.

The remaining Caraiani, Carayol/Saito, Harris–Taylor and reconstruction proof
obligations were checked against the **existing reviewed records**, not freshly
proved from their complete sources. R19 has eight partial nodes and eight gaps;
Part II has seven nodes and seven gaps. Those counts and their partial status
are unchanged. In particular, retain the missing definition/proof of the precise
monodromy order, discrete versus cuspidal assembly, the unexpanded
AG2.1b/AG2.2/AG2.3 proofs, and the misplacement of rec-normalized/finished
construction nodes in the early AG2.0/AG2.1a stages. Source-qualified Henselian
reconstruction cannot simply be applied to a finite-residue Hecke algebra
without the appropriate split/descent result. The structural blocker in §1 is
separate from these inherited blueprint gaps.

I read the reviewed library-coverage entries for both members. The only fresh
baseline declaration check in this review was
[Mathlib RepresentationTheory/Basic.lean, lines 1–160](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Basic.lean):
`Representation` is the existing algebraic monoid-homomorphism carrier. It does
not by its definition include continuity or the automorphic construction.
No exhaustive new absence audit, source-proof completion or implementation
promotion is claimed.

## 5. Reproducible checks and input pin

Inputs came from the repository's Pages artifact for commit
`9d79cd8f47dad84d63319b99ce6910a8d41c7721`, run `35614735619`, artifact
`10646330530`. This supplied the complete source documents and full atlas,
without using git commands. Library pins are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

Independent Python checks verified exact membership of all sixteen stage IDs,
unique ownership labels, thirty distinct proposal links, four narrowed-interface
forwarding sets, and all twenty external edges. The full base graph has
2,019 vertices and 3,508 edges; adding the proposal gives 3,534 edges and remains
acyclic. The extra 26 edges are genuinely new; four restate old imports. The
vertex count includes external endpoint IDs, not only the 1,968 atlas-stage
records. Adding the single counterfactual R19.1 → AG2.0 edge fails acyclicity
with the witness in §1. This is a separate test from the schema checker.

The finite examples were rerun with exact arithmetic: the F5 point count in C2;
`F = diag(1/2,1)` and `N = [[0,1],[0,0]]`, with `F N F^-1 = N/2`, `N^2 = 0`
and `N != 0`; and the no-ratio tests over F5, where roots `(1,1)` pass for
auxiliary p=7, `(1,2)` fail for p=7, and `(1,1)` fail for p=11. The matrix
calculation illustrates why forgetting N loses data; it is not an assertion that
both parameters are realized by one fixed global automorphic representation.
The ratio computations distinguish local genericity from pairwise distinctness;
they do not prove a global automorphy theorem.

Validation commands and results are recorded in the handoff. The restructuring
checker validates structure and references; it does not certify the extension
frontier or mathematical completeness. No Lean file is changed or compiled.

## 6. Resume after the structural decision

Resolve the shared-foundation/extension boundary in §1, retain the conservation
and forwarding obligations in §3, and integrate C1/C2 into the definitive
roadmap/source-node records. Re-run the full stage-graph check after actual moves
and any approved dependency refinement, including external ET/R16 consumers.
Then seek independent acceptance of the revised proposal. Do not mark the
partial source blueprints complete as a side effect of that acceptance.
