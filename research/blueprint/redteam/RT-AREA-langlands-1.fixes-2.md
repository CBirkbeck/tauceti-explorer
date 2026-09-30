# RT-AREA-langlands-1: second-round fixes

Codex — `codex-J6LwjP`, 30 September 2026. Job
`FIX-RT-AREA-langlands-1~2`, issue #5140. Base: `1df7241`.

This implements the assigned GlobalGaloisDeformations producer repair for
findings /21 and /22. The packet, reader and suggested file now agree on the
R04.5 → G7 selection boundary and the G7/G8 contracts consumed by PA.3/PA.4.
The issue assigns no other roadmap's packet. The remaining high/medium findings
are handed to the specified blueprint jobs below; this report does not claim
those consumers or new stages have been implemented.

Inputs: all 35 finding claims and repairs in `RT-AREA-langlands-1.result.json`,
the complete independent decisions in `REV-RT-AREA-langlands-1.md`, and the
first-round report, especially its /21–/22 contracts. The verifier confirms
32 findings and rejects /11, /23 and /28. PROTOCOL §17 makes the 25 confirmed
high/medium findings the fix scope; the seven confirmed low findings /29–/35
are accounted for below without expanding the assigned files.

The packet retains its previous independent review verbatim, together with all
three source issues and their verdicts. `fixAmendment` records that the new
node and modified contracts await `REV-FIX-RT-AREA-langlands-1~2`. This is a
repair to a partial planning packet, not a fresh review, proof of closure or
claim of formalization. All nodes remain `implementationStatus: unchecked`.

## Changes in the assigned packet

### /21: one shared selection argument, with source-specific applications

Added `R04.5/chebotarev-selmer-selection`, a conditional arithmetic lemma.
Its inputs are actual localization maps on a finite-dimensional cohomology
space, detecting Frobenius conjugacy classes in finite Galois quotients,
finite exceptional sets and a nonempty admissible class for padding. It
imports the upstream Chebotarev theorem through the existing precise request;
it proves the elementary degree-one refinement and dimension-decrease/finite
avoidance argument and returns exactly q primes for q at least the dimension.
The padding hypothesis is explicit even when the cohomology space is zero.

The existing odd-p node and `G7/enormous-taylor-wiles-primes` now use this
lemma. Their image/cohomology arguments remain separate. G7 verifies the
regular-semisimple detection condition on the trace-zero and scalar summands;
it imports D8's description of the augmented dual Selmer group as a
localization kernel. Neither the shared lemma nor an edge substitutes
adequacy for the source's enormous-image hypothesis.

Kept `G7/enormous-taylor-wiles-presentation` as the owner of ACC+
Proposition 6.2.33 for G8's variable-determinant problem, as accepted RS-08
explicitly requires. Its contract preserves F = F⁺F₀, ζ_p outside F,
p ∤ 2n, absolute irreducibility, enormous cyclotomic image, T = S,
q at least the dual Selmer dimension, N ≥ 1, all residual eigenvalues in k,
and their orderings. It exports g = qn − n²[F⁺:Q], qn cyclic diamond factors
of order at least p^N, the Λ[Δ_Q]-action and its augmentation quotient.
The nonnegativity of g precedes conversion to a natural-number variable index.

Two details are now explicit. First, ACC+'s paragraph before the Taylor–Wiles
datum assumes k contains all residual eigenvalues. Second, the degree-one
selection also avoids rational primes ramified in F₀. A residue-degree-one
prime alone need not lie over a split rational prime: 2 in Q(i) is the
ramified counterexample. Finite avoidance supplies the required unramified
split places without strengthening the theorem's conclusion.

CG Proposition 8.5 is recorded as a comparison, not a second extracted
theorem. It uses big image, a fixed determinant and one one-dimensional
generalized Frobenius eigenspace, with
q + |T| − 1 − [F:Q]n(n−1)/2 − l₀ variables. A PA consumer choosing that
branch must request its exact variant and its §8/CHT proof inputs from
R04.5/G7. It cannot rename the ACC+ theorem or reuse its diamond count.

`consumerContracts` exposes the G7 package for PA.4. It is a handoff record,
not an assertion that the PA packet or an atlas edge was edited. PA.4 retains
the actual levels, arithmetic complexes, Hecke actions, uniform bounds and
specialization verifications. The first-round report's separate neatness
places v₀,v₀′ remain PA's responsibility; their scalar Frobenius and
q_v ≠ 1 mod p conditions are incompatible with identifying them as the
Taylor–Wiles choices. The old CH-L15 justification should be reconciled by
the maintainer with that separate prime choice; no unassigned link file is
edited here.

### /22: actual global deformation data for PA.3

The second producer contract names G8's problem, representability, framing
and presentation nodes, plus G7's local diamond/augmentation comparison.
For the polarized branch it separately names G7's pairing- and
multiplier-dependent presentation. These are existing mathematical producers,
so no duplicate “export theorem” was created.

`BP-PotentialAutomorphyInfrastructure` must add the corresponding consumer
imports, together with L7/L8 and R08.2's matching local conditions, and
construct the geometric R-to-Hecke maps and mod-coefficient comparisons.
The abstract P9 support theorem does not supply that arithmetic data. Follow
the verifier's correction: do not add a blanket L7 → P9 edge; route the
arithmetic application through PA.3. LocalGaloisDeformationRings' exporter
prose is an additional maintainer/future local-packet handoff, outside the
four files assigned here.

### Reader, suggested file and provenance

The reader documents the shared lemma, its counterexamples, the two producer
contracts and the distinction between CG and ACC+. The suggested file drops
the under-specified `exists_twPresentation` sketch. Its replacement explains
the complete future signature and why unavailable arithmetic carriers cannot
be encoded as placeholder propositions. Two baseline-expressible finite-field
examples test independent detection versus repeating a coordinate. The
arithmetic theorem has no claimed executable Lean signature until its named
suppliers exist.

Fresh source reading, 30 September 2026:

| Source | Passages actually read | SHA-256 |
| --- | --- | --- |
| [ACC+, published](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), 217 pages | Physical pp. 135–137, 143–145, 148–151: global problems and framing, local diamond/presentation, enormous image, Lemma 6.2.32 and Proposition 6.2.33 with their proofs | `c5429e4f384384045dbb48502d71547bb21699783c0f77cce27b24e742467f02` |
| [Calegari–Geraghty, published](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), 137 pages | Physical pp. 113–115: framing, Selmer groups, Propositions 8.4–8.5 and proof | `c0ba8de04d5ee92fe1a967f9487df6cb49295590dfd03762a9150a92838225c5` |

This is selective reading. The prior ACC arXiv-v2 reading and locators are
preserved as historical evidence. A separate published-source entry records
the numbering comparison: v2 Definition 6.2.28, Lemmas 6.2.29/6.2.31 and
Propositions 6.2.24/6.2.32 become published Definition 6.2.29,
Lemmas 6.2.30/6.2.32 and Propositions 6.2.25/6.2.33. The other findings below
use the independent verifier's and first-round fixer's source work; they do
not assert a fresh reading of those papers in this session.

Read the upstream Chebotarev scope, conventions, Layer 10 and acceptance/API
contracts, and the ClassFieldTheory purpose and Layer 12 contracts. Reuse
their existing carriers and theorems. The reviewed coverage aggregate has no
GlobalGaloisDeformations layer record at this base; the relevant accepted
AUDIT-31 ArithmeticGaloisRepresentations G7 and AUDIT-02 R02.6 records mark
the residual-image and dual-Selmer targets absent. A bounded search of the
pinned declaration index found no Taylor–Wiles, enormous-image, dual-Selmer
or Chebotarev-density implementation. No new library declaration is claimed.

## Findings handed to the other jobs

Every handoff below follows the qualified verifier decision rather than an
unqualified raw proposed edge. A handoff is pending work at its named owner.

| Finding | Destination and required repair |
| --- | --- |
| /1 | `BP-EndoscopicTransferAndUnitaryTraceComparison--ET.4`: factor early cyclic base change/automorphic induction before ET.6, shared with the GL₂ specialization; preserve Scholze's internal proof order and the separate L-factor normalizations. The late ET.7a cannot supply its own prerequisite. |
| /2 | `BP-AutomorphicGaloisRepresentationsPartII--AG2.0` and `BP-EndoscopicTransferAndUnitaryTraceComparison--ET.4`: request the stronger Varshavsky theorem at EDC.8 or one early successor, preserving properness over the open, quasi-finiteness, locally invariant boundary, finite-Tor-dimension supported coefficients and the large-Frobenius bound. EDC.8 already reaches AG2.1a; theorem scope is the defect. ET.5 retains its Igusa checks. EDC supplier amendment is a maintainer handoff. |
| /3 | `BP-AutomorphicGaloisRepresentationsPartII--AG2.0`: import one early local Mantovan Ext/colimit functor and Harris–Taylor computation via an ET.6a extension/prefix; own the global Weil-equivariant Grothendieck-group product formula at AG2.1b. The ET supplier amendment belongs with the maintainer/ET blueprint work. A similarly named local-shtuka functor does not establish this comparison. |
| /4 | `BP-AutomorphicGaloisRepresentationsPartII--AG2.0`: instantiate the compact signature-(1,n−1) type-A datum and its counting/trace comparison, reusing the IG/ET good-reduction definitions where they match. Coordinate the supplier contract with `BP-IgusaVarietiesAndTorsionConcentration` and the ET owner; Shin's specific ramified Drinfeld-level extension is a further obligation, not an arbitrary ramified-PEL theorem. |
| /5 | The AG2.0 and ET.4 jobs: import one finite-field Tate/Honda–Tate producer, with endomorphism invariants, polarized O-linear virtual objects and Kottwitz α-effectivity. A new producer after A6/V5/R07.2 requires a maintainer design decision. Neither number-field Faltings nor downstream CM.5 supplies it; the latter creates the recorded cycle. |
| /6 | `BP-ArithmeticGaloisRepresentations`: plan the Ogg–Saito comparison at the R01.3 owner, with regular-model/R11.2 inputs, strict-henselian/descent and wild characteristic-two terms. Separate the early Tate-module input from the later R01.6 export, avoiding reciprocal whole-stage edges. Existing EC Layer 4 reachability is not a missing link. |
| /7 | `BP-PotentialAutomorphyInfrastructure` and `BP-ModularityAndLanglandsExtensions`: implement the PA.6 lifting endpoint and ML.2 handoff, with ACC+ Theorems 6.1.1–6.1.2 and their different Fontaine–Laffaille/ordinary support conclusions. Preserve enormous image, decomposed genericity, the scalar condition, weight/local hypotheses and different p bounds. Do not impose polarization uniformly or treat CG's conditional theorem as the unconditional endpoint. |
| /8 | `BP-AutomorphicCongruences--L0`, `BP-AutomorphicPadicLFunctions`, `BP-IgusaVarietiesAndTorsionConcentration`, `BP-IntegralIwasawaTheory--I.1`, `BP-PadicFamilies`: source Hilbert ordinary canonical-subgroup towers from T5, with explicit formal-model/CM-point requests; retain only genuinely matching unitary IG uses, including the GU(2,2) applications. The aggregation checkpoint imports the same tower rather than defining another. RS-14 link reconciliation remains with the maintainer. |
| /9 | `BP-IgusaVarietiesAndTorsionConcentration` and, necessarily, `BP-TorsionCohomologyInfrastructure`: the latter must own the actual TC terminal theorem, GLₙ boundary induction, square-zero image-kernel argument and determinant descent, with interior exponent 4(d+1) and full-cohomology uniform exponent. Feed IG.6 and PA.0 and correct CC.8's attribution through their owners. The issue's handoff list names IG for /9 but omits the indispensable TC producer, recorded here explicitly. |
| /10 | `BP-EndoscopicTransferAndUnitaryTraceComparison--ET.4`: expose the source-qualified Kottwitz Tamagawa/kernel coefficients with the required simply connected theorem and AA.2 measures/ET.0 cohomology. ET.5 reuses them. No arbitrary-group or all-global-fields formula is asserted. |
| /11 | Rejected: accepted class-field-theory links already supply ET.0. Do not add a blanket R02.4/D7 dependency without a specific consuming declaration. No edit. |
| /12 | ET.0, `BP-FunctionFieldArithmetic` and `BP-GlobalShtukasAndFunctionFieldLanglands`: share GS.0 Bun_G, the early geometric GS.1 Grassmannian prefix and FA.2 adeles, with exact model/characteristic comparisons. ET.2b retains Hitchin/Picard/affine-Springer geometry. Do not confuse GlobalShtukas with the Fargues–Fontaine GeometricSatake roadmap. |
| /13 | ET.0 and ET.4 jobs: correct the claim that the spherical twisted fundamental lemma is unproved, retaining the nonstandard target and exact reduction/normalization hypotheses. Avoiding the theorem in one proof is distinct from its literature status; the unrestricted weighted theorem is a separate input. |
| /14 | `BP-EndoscopicTransferAndUnitaryTraceComparison--ET.0`: add Kottwitz–Shelstad's corrected twisted splitting invariant, pairing and χ-data normalizations and transport them into ET.4/6/7a. Test actual identities, including the nonreduced-root quadratic-character factor; a universal minus-sign rule is false. |
| /15 | `BP-EndoscopicTransferAndUnitaryTraceComparison--ET.4`: request an early p-adic character prefix with local constancy/integrability, twisted characters and Weyl integration for ET.4/6. The proposed character Part II needs a maintainer design handoff; do not import its entire late, SR.6-dependent scope upstream. |
| /16 | `BP-AutomorphicGaloisRepresentationsPartII--AG2.6`: route the July 2026 coefficient-prime compatibility preprint for extraction and a source-qualified successor, preserving de Rham/labelled-weight conclusions, WD semisimplification and monodromy dominance. No unrestricted equality of monodromy or universal crystallinity; update only the actual new AG2.7 export. |
| /17 | `BP-ArithmeticGaloisRepresentations`: request finite-field Brauer–Nesbitt from IHG.1, with perfect-field preservation of semisimplicity and isomorphism descent. Coordinate the IHG supplier; characteristic polynomials cannot be replaced by traces in small characteristic. |
| /18 | AG2.0 and TC jobs: use the earlier arbitrary-regular polarized AG2.3 package in TC.3/4. Keep it independent of the nonselfdual AG2.4 factor-separation consumer; do not import all of AG2.7. Align /26's shared algebra simultaneously. |
| /19 | AG2.0 job plus maintainer/paper-route owners: reconcile CG20/Pilloni20 GSp₄ items with the accepted proposed GSp4LocalLanglandsAndGaloisRepresentations owner. Keep generic GL₄ construction, purity and polarization-sign inputs where they belong. Route/verdict edits need their own authorized files and review; the proposed owner is not a live implemented theorem. |
| /20 | AG2.6 job: import R24.5:operations' generic compatible-system carrier and separate weak/almost-strict/strict predicates. Keep AG2's constructed instances and embedding-independence/property proofs. Do not import the later two-dimensional existence theorem. |
| /21 | Producer changes implemented above. `BP-PotentialAutomorphyInfrastructure` must consume G7's precise ACC+ package in PA.4 and retain its arithmetic work. CG remains a separately requested variant if used. |
| /22 | Producer contract implemented above. `BP-PotentialAutomorphyInfrastructure` adds the matching G7/G8/L7/L8/R08.2 imports into PA.3; local exporter wording requires its owner's follow-up. No blanket L7 → P9 edge. |
| /23 | Rejected: the fixed PEL toroidal Hodge–Tate map is the minimal map composed with the toroidal projection. S6's stronger general-datum result is not a necessary missing supplier. No edit. |
| /24 | `BP-TorsionCohomologyInfrastructure`: state the exact unconditional CM/imaginary-quadratic-subfield and rational-pullback ramification-set hypotheses, naming the unitary-similitude transfer supplier. Distinguish the special characteristic-zero extension from the full integral torsion theorem and identify the remaining twisted weighted classification hypothesis. |
| /25 | `BP-AutomorphicGaloisRepresentations` and `BP-IntegralHeckeAndGaloisDeterminants`: use IHG.4 interpolation and IHG.1 reconstruction in R19.6, retaining arithmetic congruence, continuity and deformation-map data. IHG.1 already reaches R19.6; the IHG.4 handoff is the new one. Keep the henselian/Cayley–Hamilton/residual-split hypotheses. |
| /26 | AG2.0, IHG and TC jobs: own the geometric-input-free determinant factor theorem once in an independent algebra prefix and prove how HLTT meets its Laurent-variable factorization hypotheses. IHG.4 supplies interpolation. Keep the prefix independent of TC.2/3 geometry; pointwise factorization alone is insufficient. |
| /27 | `BP-AutomorphicCongruences--L0`, `BP-IntegralIwasawaTheory--I.1`, `BP-PadicFamilies`, `BP-SerreWeightAndLevelOptimisation`, with the essential supplier handoff to `BP-IntegralHeckeAndGaloisDeterminants`: one codimension-zero congruence-module/ideal contract, preserving depth and generic-point/separability comparisons. The higher-codimension IKM route was rejected/revise and is not an accepted duplicate supplier. |
| /28 | Rejected, low: accepted Chebotarev links already supply ET.3 and hence ET.6. No duplicate link or library-density claim. |
| /29 | Confirmed, low; outside §17 fix scope and assigned files. ArithmeticGaloisRepresentations should explicitly import the existing elliptic Tate-module/determinant supplier while retaining its general abelian/arithmetic work. |
| /30 | Confirmed, low; outside this fix. AG2.0 should apply AF.4's rationality theorem while retaining coefficient-descent/normalization work. |
| /31 | Confirmed, low; outside this fix. It concerns **ArithmeticGaloisRepresentations G7**, not this packet's GlobalGaloisDeformations G7. Reuse the pinned algebraic power constructors and retain the missing topological/arithmetic work. |
| /32 | Confirmed, low; outside this fix. ArithmeticGaloisRepresentations should replace its odd-representation bridge gap by the finite-field stable-line descent proof, preserving the characteristic-two exception. |
| /33 | Confirmed, low; outside this fix. Coordinate one IHG.1 finite-residue-field reconstruction producer and the R01.5 application; the Cayley–Hamilton quotient and finite-field splitness proof are essential. Same repair as /35. |
| /34 | Confirmed, low; outside this fix. IG.5 reuses SR.1's involution and the appropriate pinned Hecke datum, retaining its arithmetic duality and ideal dictionary. Inversion must preserve the datum's submonoid. |
| /35 | Confirmed, low; outside this fix, identical producer issue to /33. Do not create a second reconstruction theorem or overwrite historical source-reading claims. |

## Validation

- Stock `scripts/check_blueprint.py` with the pinned declaration index:
  **66 nodes, 91 API items, 70 definition/construction unit tests, 26 planets,
  19 requests, 0 errors and 0 warnings**. The added lemma also has four
  theorem-acceptance tests. No stage is claimed closed.
- The upstream Chebotarev need follows this packet's existing request-only
  representation. A redundant direct upstream prerequisite exposed the
  checker's known `tauceti:` roadmap/declaration ambiguity; keeping the precise
  request with `neededBy` passes the stock checker and preserves the existing
  accepted Chebotarev → R04.5 dependency. No false baseline declaration was added.
- Read-only atlas assembly at the base has 2,840 stages and 8,258 recorded
  stage edges. R04.5 already reaches G7, and Chebotarev reaches R04.5.
  The proposed PA.3 imports from L7/L8/R08.2/G7/G8 and G7 → PA.4 were checked
  together, adding each against the graph containing the prior additions;
  no reverse path or cycle occurs. This validates these handoffs, not every
  proposed new stage in the first-round report.
- All old node IDs, baseline declarations, source issues and the complete
  independent review are preserved. Every request consumer and producer
  contract node resolves inside the packet. Internal acyclicity passes.
- Finite-field diagnostics over F₃² confirm joint coordinate detection,
  failure of repeated-coordinate detection, finite avoidance and padding to
  exact cardinality. These test the selection logic, not Chebotarev itself.
- Intake file checks and staged whitespace checks pass for the four assigned
  files. The suggested Lean file was **not compiled**: no existing build at
  the pinned commits is available. No build or language server was started.
