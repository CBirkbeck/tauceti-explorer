# Independent review: Arithmetic Galois representations and conductors (R01.1–R01.6, G7)

Job `REV-ArithmeticGaloisRepresentations` (issue #350), reviewing
`research/blueprint/packets/ArithmeticGaloisRepresentations.json` and
`research/blueprint/suggested/ArithmeticGaloisRepresentations.lean` (author: `BP-ArithmeticGaloisRepresentations`,
session claude-UMyMEf). Reviewer: Claude (session claude-Sdvs9H), 7 October 2026. The reviewer did not
write the files reviewed.

**Verdict: `needs_changes`.** The packet was corrected in place. It passes `scripts/check_blueprint.py`
with no errors and no warnings, and the suggested Lean file elaborates at the pinned Mathlib with
`sorry` as its only warning. It is sent back for three reasons, none of which a review can settle
itself:

1. **The reader document is stale.** `research/blueprint/readmes/ArithmeticGaloisRepresentations.md`
   renders the packet as submitted, and a review may not edit it. It still states what this review
   found false (see "Corrections of substance"), lacks the 58 nodes added here, and
   describes Brauer–Nesbitt as obtained from another roadmap. It must be regenerated from the
   corrected packet before the plan goes live.
2. **The roadmap is to be planned at lemma level and the packet is a target-level pass.** Its
   distance from the libraries is 5, the threshold of `research/blueprint/detail.json`, and both
   issues (#676, #350) say lemma level; the packet's summary said "target-level". 124 of
   its 132 nodes bundle several declarations. A full split would give about 450 to 500 nodes,
   beyond the budget of 300 for one pass, so the review added as nodes only what the mathematics
   needed now (hidden non-routine arguments, and the splits that break a cycle), and recorded every
   remaining split, exactly, in the `remaining` list of its stage. All seven stages are therefore
   `partial`, and the packet's status is `partial` (the checker requires this of a pass under the
   budget whose stages are not all planned).
3. **Two nodes could not be verified** at their sources (`R01.3/saito-conductor-discriminant`,
   `R01.6/serre-independence-and-connectedness`): Saito's 1988 paper and Serre's original proofs
   were not obtainable. They are kept as quotations, with gaps.

What is planned is, to the best of two independent readings, right; the continuation round should
start from the `remaining` lists and from "Questions for the orchestrator" below.

## Counts

| | As submitted | After the review |
|---|---|---|
| Nodes | 132 | 190 |
| Kinds | 60 theorem, 30 definition, 28 construction, 8 lemma, 3 application, 3 comparison | 68 theorem, 56 lemma, 31 definition, 28 construction, 4 comparison, 3 application |
| API items | 504 | 549 |
| Unit tests | 278 | 292 |
| Planets | 40 | 40 |
| Library declarations cited | 236 | 417 |
| Requests | 70 | 60 |
| Gaps | 24 | 36 |
| Source issues | 30 | 47 |
| Restructure proposals | 5 | 8 |
| Sources | 52 | 53 |

Review verdicts on the 190 nodes: 126 corrected, 58 added, 4 verified, 2 unverifiable.

| Layer | Nodes | verified | corrected | added | unverifiable | Status | Remaining items |
|---|---|---|---|---|---|---|---|
| R01.1 | 35 | 3 | 21 | 11 | 0 | partial | 28 |
| R01.2 | 27 | 0 | 19 | 8 | 0 | partial | 30 |
| R01.3 | 22 | 0 | 14 | 7 | 1 | partial | 38 |
| R01.4 | 19 | 0 | 14 | 5 | 0 | partial | 21 |
| R01.5 | 19 | 0 | 13 | 6 | 0 | partial | 29 |
| R01.6 | 18 | 0 | 13 | 4 | 1 | partial | 27 |
| G7 | 50 | 1 | 32 | 17 | 0 | partial | 65 |

Among the 132 original nodes the statement changed in 87, the hypotheses in
50, the proof steps in 112, the acceptance items in 53, the
prerequisites in 101 and the source citations in 71.

## How the review was done

- **Sources.** All 52 sources of the packet were fetched again at the recorded URLs; the SHA-256 of
  each file matches the packet's record (three files come from a server with an incomplete
  certificate chain and were accepted on their hash; Dickson's 1901 book arrived when archive.org
  answered, later in the review). Every excerpt was looked for as a literal substring of the extracted text by
  script; the excerpts of scanned sources (Deligne 1973, Serre 1961, 1970, 1972 and 1987, Ribet 1976,
  Brumer–Kramer, Liu, Noot, Deligne–Serre, Dickson) were read on rendered page images.
- **First reading.** Eight readers, one per group of nodes (R01.1 to R01.6, and G7 in two halves),
  worked in parallel under the reviewer's direction. Each read every node of its group against the
  source passages, recomputed the examples, tests and acceptance items, checked each proof step
  against the listed prerequisites, and wrote findings and machine-applicable edits. Three more
  readers read the Lean statement of each of the 236 cited library declarations at the pinned
  commits and compared it with the use each citing node makes of it.
- **The reviewer** read the supplier nodes of the cross-roadmap prerequisites, computed the stage
  graph that promotion would produce (on the live atlas and on the atlas with the links of every
  unpromoted packet), checked the graph claims of the gaps and restructure entries, decided the
  points the readers left open, and wrote the packet-level corrections.
- **Second pass of the same readers:** the library findings were turned into node edits, the hidden
  non-routine arguments became lemma nodes or gaps, two cycles hidden by omitted prerequisites were
  broken, each stage's `remaining` list was rewritten, and the Lean sections were corrected, each
  reader elaborating its copy of the file.
- **Second reading.** Eight fresh readers, who were given the corrected packet and the sources but
  none of the findings, read the nodes again, the added nodes line by line. Their findings went back
  to the first readers, who checked each one and applied or rejected it (see "The second reading").
- All edits are applied by one re-runnable script to the packet as it is on `main`
  (2,142 operations, each asserting what it replaces), followed by `check_blueprint.py`,
  the two checks of `scripts/check_errata.py`, a cycle check on the node graph and the excerpt check.

## The two red-team findings handed to the blueprint

**RT-AREA-langlands-1/17 (Brauer–Nesbitt in R01.1).** The packet followed the handed fix: it derived
Brauer–Nesbitt from the reconstruction theorem of IntegralHeckeAndGaloisDeterminants IHG.1 (Chenevier,
Theorem 2.12), with a request that IHG.1 export it. The review found this fragile: Chenevier's proof
of uniqueness in 2.12 itself quotes Brauer–Nesbitt (p. 31 of arXiv v2, "As a semisimple representation
is well known to be uniquely determined by its characteristic polynomials (Brauer-Nesbitt's
theorem)"), so the dependence can only run from R01.1 to IHG.1; and two proof steps used statements
that the cited IHG.0 nodes do not make. The theorem is now proved inside R01.1, by the classical
argument, in four nodes with no prerequisite in another roadmap:
`R01.1/brauer-nesbitt-algebraically-closed` (density gives elements acting as a rank-one idempotent
on one constituent; traces give the multiplicities modulo p; cancel, extract p-th roots of the
characteristic polynomials, induct), `R01.1/semisimplification-detected-after-field-extension` (the
descent from an algebraic closure, valid for every field, imperfect ones included),
`R01.1/brauer-nesbitt` (the kept id) and `R01.1/brauer-nesbitt-traces` (traces suffice when the
dimension factorial is invertible, and need not otherwise). This answers the finding's substance:
the characteristic-p theorem has an owner and a proof, and neither trace-only recognition in small
characteristic nor descent is claimed beyond what is proved. It departs from the letter of the fix
(the edge IHG.1 → R01.1 is not created); restructure entry 8 proposes that IHG.1 cite R01.1 for the
uniqueness clause instead. The second reader checked the chain line by line and found it complete
and correct.

**RT-AREA-langlands-1/6 (Ogg's formula in R01.3).** The packet has the nodes the fix asked for
(`R01.3/ogg-formula`, `R01.3/saito-conductor-discriminant`, with the edge direction R01.6 → R01.3),
keeps the wild terms and drops no residue characteristic. The review corrected four things. (i) The
claim that residue characteristic at least 5 is closed "by a direct case check" did not hold: the
table of discriminant valuations was taken from a node that proves none, the vanishing of the wild
part rested on the action of inertia under potential good reduction (Serre–Tate), which no
prerequisite supplies, and the descent of the number of components was not requested. These are now
two exact requests and one gap: the case is planned, not closed. (ii) The number m of components is
counted without multiplicity on the minimal regular model, not on the Néron model (for type I₀*
the formula needs 5, the Néron model has 4). (iii) The bound f₂ ≤ 8 was credited to an argument that
gives 9; the sharp bound is Brumer–Kramer's Theorem 6.2 through their Theorem 5.5, now a gap. (iv)
Saito's theorem is scoped to what Liu quotes (the minimal regular model over a discrete valuation
ring with perfect residue field), and its node is `unverifiable` until Saito's paper is read. Tau
Ceti EllipticCurves layer 4 owns the algorithmic exponent only; the comparison stays here.

## Corrections of substance

Only the corrections that change mathematics are listed; locators, excerpts and wording were also
corrected throughout (for instance every Milne citation of R01.6 gave the page of an older text of
the book, the section numbers of five sources of R01.3 were wrong, and the Calegari–Geraghty
excerpts were quoted from the arXiv version while the source list named the typeset copy, which is
now a second source entry).

**R01.1.** Parts of `coefficient-extension` rested on nodes that depend on it. The equivalence
"irreducible with scalar endomorphisms ⇔ absolutely irreducible" was proved for perfect fields only
though stated for all. Three examples were false: Ind 1 ≅ 1 ⊕ ε_K when 2 is not invertible; a
character a ↦ u^a of Z_ℓ for a unit u that is not principal; two characters of Z_ℓ with distinct
reductions. The profinite structure of Mathlib's absolute Galois group, which has no compactness
instances, is now supplied through Tau Ceti's comparison with Gal(K^sep/K). The Mackey decomposition,
Burnside's theorem and Jordan–Hölder multiplicities exist in Tau Ceti; the nodes that planned them
now cite them and plan only the topological additions.

**R01.2.** The element conjugating the Weil–Deligne representations attached to two Frobenius lifts
was copied from Deligne with the constant for the other order of multiplication (source issue E250;
checked with exact arithmetic). The comparison isomorphism of `local-restriction` was misdescribed.
Part (d) of `tame-semisimple-residual-local-representations` was false for p = 2. Existence and
uniqueness of unramified characters with prescribed Frobenius value failed for coefficient rings
that are not complete and Hausdorff. Φ denoted the geometric Frobenius in the Euler-factor and
ε-factor nodes and the arithmetic one elsewhere. The induced monodromy operator needed q to the
power minus the degree. A cycle between Frobenius semisimplification and purity, hidden by an
omitted prerequisite, is broken by the new node `R01.2/monodromy-filtration`. The comparison with
the ε-factors of AutomorphicLFunctionsAndLocalFactors AL.1 is now an explicit statement, checked for
unramified and ramified characters.

**R01.3.** Two proof steps of `hasse-arf-integrality` were false (they assumed finite inertia image,
and that every character factors through a finite quotient), and its proof used the induction
formula, whose node depended on it through the global conductor: the local induction formula is now
its own node, with the intersection formula for the upper numbering of an open subgroup. The
additivity of the Artin conductor on exact sequences, attributed to Brumer–Kramer, is false in the
modular case (E351); the node states the inequality. Milne's worked example is the curve of
discriminant −11, not 11a1. The residual conductor statement had the wrong hypothesis at ℓ = 2, 3.

**R01.4.** Oddness "automatic when 2 = 0" is false over non-reduced rings. Part (e) of Dickson's
classification needs absolute irreducibility, and the proof route missed two exceptional cases
(dihedral groups for p = 2; A₅ in PSL₂(F₉)). The exceptional clause of Serre's Proposition 17 at ℓ = 5 was incomplete. Four
statements about Cartan subgroups lacked q ≥ 3. The statement on dihedral projective images
mishandled the scalar case. An instance about a weight-26 form was wrong (the form is ordinary at
107). The source issue E401 (Serre 1987, §3.3) was rejected: Serre's remark has no gap. Dickson's
book was read on page images for §§251–257 and 260–262, and two nodes now carry his counting
argument.

**R01.5.** The recognition theorem was false as written: the common coefficient field needs a
Hausdorff topology in which both embeddings are continuous (χ_ℓ against ι ∘ χ_ℓ for a discontinuous
ι is a counterexample), and it assumed finite ramification, which Deligne–Serre's Lemme 3.2 does
not. The proof of `frobenius-density` gave positive upper density, not the stated density. In
Carayol's lemma equal traces always suffice when the residual representation is absolutely
irreducible; the node required the dimension factorial to be invertible. Function-field Chebotarev
was requested from the wrong owner (it is FunctionFieldArithmetic FA.5). Five requests to Tau Ceti
layers were replaced by declarations the pinned Tau Ceti already has.

**R01.6.** A claim about the character on a rational cyclic subgroup was false at ℓ = 2, and the
quotient isogeny was requested from the wrong owner. The sign of the
polarisation of an elliptic curve was wrong. A proof step claimed surjectivity on K^sep-points for
every isogeny (false for inseparable ones). The λ-adic Tate module was misdescribed for ramified λ.
The node on Serre's theorems contained a clause that is not in Richard–Yafaev's Theorem 4.9 and
proof steps describing proofs that were not read. The gap on Serre's complement (Noot, Proposition
1.3) rested on a dependency that does not exist in the stage graph. The comparison with Mathlib's
`WeierstrassCurve.localPolynomial` now covers additive reduction in every residue characteristic.
The nodes of R01.6 no longer take the similitude group from G7.

**G7.** The characteristic-polynomial formulas for symmetric and exterior powers assumed a
triangular basis that need not exist over a ring. The trace of an endomorphism of a non-free
projective module was Mathlib's `LinearMap.trace`, which is 0 there. The packet planned an
isomorphism between two normalisations of GSp₄ that the two sources do not have (they print the same
J). The definition of a polarized representation excluded the totally real case that the next part
used, and dropped the hypothesis l > 2 of the source. A claim about symmetric powers failed at
d = 2p − 1. The lifting theorem used a lemma of Conrad with no supplier; it is now two nodes, the
part that needs only Tate's theorem and the part with Hodge–Tate control. One API name
(`IsOddAt`) denoted two different conditions in R01.4 and G7. In the second half: an acceptance item
of `adequacy-criteria` was false for p ≤ 3; `adjoint-invariants-of-symmetric-powers` (b) was false
for p = 3; the proof that enormous image fails when p divides n rested on a supposed misprint of the
source that is not one (E752, rejected); the Clebsch–Gordan node hid a two-node cycle and used
Serre's theorem on tensor products with no node; the vanishing of H¹(SL₂(F_q), Sym^k) recorded as a
gap is proved; and one case of Boxer–Calegari–Gee–Pilloni's Lemma 7.5.22 is now a gap.

## The second reading

Eight readers who had seen none of the findings read the corrected packet, one group each, with the
sections of the merged Lean file. They reported 125 findings: 25 errors,
56 weak points and 44 notes; 31 concern the Lean file. A session
limit ended every agent at once while this was running: six second readings had finished; those of
R01.4 and of the first half of G7 were cut off after writing their findings but before their reports,
so their coverage of those two groups may be incomplete. Each group's findings were then judged by a
further reader, who checked each one at the source or by computation, applied or replaced its fix, and
corrected the Lean statements, elaborating its copy of the file; for the two groups whose second
reading was cut off, that reader also read the Lean sections of the nodes added by the review and
tested their statements on small cases.

| Group | Findings | error | weak | note | of which about the Lean file | Adjudication |
|---|---|---|---|---|---|---|
| R01.1 | 12 | 1 | 6 | 5 | 0 | 12 accepted, 0 accepted with another fix, 0 rejected |
| R01.2 | 23 | 10 | 7 | 6 | 11 | 19 accepted, 4 accepted with another fix, 0 rejected |
| R01.3 | 9 | 4 | 3 | 2 | 3 | 8 accepted, 1 accepted with another fix, 0 rejected |
| R01.4 | 15 | 1 | 4 | 10 | 2 | 10 accepted, 5 accepted with another fix, 0 rejected |
| R01.5 | 23 | 2 | 13 | 8 | 4 | 18 accepted, 5 accepted with another fix, 0 rejected |
| R01.6 | 14 | 1 | 6 | 7 | 2 | 9 accepted, 5 accepted with another fix, 0 rejected |
| G7, first half | 15 | 3 | 10 | 2 | 2 | 11 accepted, 4 accepted with another fix, 0 rejected |
| G7, second half | 14 | 3 | 7 | 4 | 7 | 13 accepted, 1 accepted with another fix, 0 rejected |

Errors found by the second reading in the packet (all corrected unless listed as rejected below):

- `R01.1/brauer-nesbitt-traces`: the remark that traces suffice over F₂ in dimension 2 is false for
  monoids, which the node allowed (Γ = {1, e} with e² = e, acting by 1 and by 0); it is restricted to
  groups.
- `R01.2/cyclotomic-and-dirichlet-characters` (d): a continuous character of finite order with values
  in a Hausdorff coefficient ring need not have open kernel (R = F₂[[t]][ε]/(ε²)).
- `R01.2/grothendieck-monodromy-and-the-weil-deligne-functor`: under a change T ↦ aT of the
  trivialisation of Z_ℓ(1) the monodromy operator changes by a⁻¹, not by a.
- `R01.3/swan-conductor-orbit-formula` (b), a node added by the review: the lift of a character was
  said to be unique up to isomorphism with a property that θ and θ⁻¹ on C₃ both have.
- `R01.3/global-conductor-and-prime-to-p-conductor`: a test and an acceptance item were false at p = 2.
- `R01.4/subgroups-of-psl2-with-several-sylow-p-subgroups`, added by the review: an acceptance item
  overlooked that two involutions of SL₂(F₄) or SL₂(F₈) can generate a dihedral group of order 6.
- `R01.5/descent-obstruction` (4): the simple factors of k[Γ]/ker(D) are indexed by Galois orbits of
  the constituents over the algebraic closure, not by the constituents (ℤ/3 over ℚ).
- `R01.5/polynomial-zero-sets-are-haar-null`, added by the review: measurability of a closed set for
  the product σ-algebra needs the ring to be second countable.
- `R01.6/good-reduction-frobenius-polynomial`: a statement was attributed to a named lemma of a Tau
  Ceti layer that the layer does not have; the request is rewritten.
- `G7/polarization-sign-and-determinant` (1): for a general coefficient ring the change-of-place
  factor is a square root of 1, not necessarily a sign.
- `G7/lifting-projective-representations`: the hypotheses said that Tate's vanishing theorem is
  special to global fields and that lifting can be obstructed over local fields; both are false.

Errors found in the Lean file were statements false as typed: recognition and ramification
statements without continuity or with unconstrained stand-in parameters (R01.2: eight declarations
or families), the break decomposition without the hypothesis on the characteristic and the
comparison of conductors with unconstrained parameters (R01.3), a dictionary for the group 𝒢_n
without the index-two hypothesis (G7), and, in the second half of G7, two restriction statements for
the Taylor–Wiles conditions and a section on enormous subgroups that had lost the hypothesis that
the field is algebraic over F_p.

Findings rejected on adjudication:

- none

The proofs of the nodes added by the review were read line by line by the second readers; apart from
the three items above they held, and the Brauer–Nesbitt chain was found complete and correct for
arbitrary fields.

## Library citations

236 cited as submitted; 226 kept, 10 no longer cited, 191 added; 417 cited now. All 236 cited declarations exist under the cited name and module at the pinned
commits. The findings below are those where the Lean statement does not give what a citing node took
from it, or where the declaration was listed and not used; each was turned into a node edit (a
reduction step, another declaration, or removal). Each declaration added during the review was read
at the pinned commit by the reader who cited it, and every entry was checked against the declaration
index by script.

| Declaration | Finding | What the Lean statement says against the use | Nodes changed |
|---|---|---|---|
| `mathlib:CompositionSeries.jordan_holder` | near-miss | The statement is as the packet says, but the node's use needs two things it does not give. (1) Subrepresentation ρ has a Lattice instance at the pin (Mathlib/RepresentationTheory/Subrepresentation.lean:89) but no IsModularLattice / IsWeakLowerModularLattice /  | `R01.1/semisimplification`, `R01.1/continuity-descent-and-lattice-independence` |
| `mathlib:ContRepresentation.coind` | near-miss | provides is accurate and the equivariance/translation conventions agree with the node. But the carrier is a submodule of C(H, V) with the topology induced from the compact-open topology, a different carrier and a different topology from the node's module of eq | `R01.1/continuous-induction` |
| `mathlib:Field.absoluteGaloisGroup` | confirmed-with-corrected-provides | It is a plain def with exactly three derived instances. CompactSpace, T2Space and TotallyDisconnectedSpace are not instances on it; Mathlib's CompactSpace Gal(K/k) (FieldTheory/Galois/Profinite.lean:329) assumes [IsGalois k K], which fails for AlgebraicClosure | `R01.1/continuous-representation`, `R01.3/breaks-and-swan-conductor` |
| `mathlib:Field.absoluteGaloisGroup.map` | near-miss | provides is accurate. But map takes only f and uses its own choice of embedding of algebraic closures; it cannot be applied to a prescribed closure embedding ι. The node's statement defines ι^* for every ι as 'the map Field.absoluteGaloisGroup.map for the clos | `R01.2/decomposition-group-at-a-place` |
| `mathlib:IntermediateField.adjoin.finiteDimensional` | confirmed-with-corrected-provides | Statement as described. The node uses it 'iterated' for finitely many matrix entries; Mathlib has the finite-set statement directly: IntermediateField.finiteDimensional_adjoin {S : Set L} [Finite S] (hS : ∀ x ∈ S, IsIntegral K x) : FiniteDimensional K (adjoin  | `R01.1/residual-descent-to-a-finite-field` |
| `mathlib:IsCyclotomicExtension.autEquivPow` | near-miss | provides is accurate, including the hypothesis that the cyclotomic polynomial is irreducible over K. Over ℚ that holds (Polynomial.cyclotomic.irreducible_rat; the ℚ-case is exactly IsCyclotomicExtension.Rat.galEquivZMod). Over a general number field F it does  | `R01.4/bad-dihedral-representations-and-the-oddness-criterion`, `R01.4/restriction-to-the-cyclotomic-field` |
| `mathlib:LinearMap.trace` | near-miss | Junk value: the trace is the ZERO map when M has no finite basis, in particular for a finite projective module that is not free. The packet records this hazard for LinearMap.det but not for LinearMap.trace. G7/adjoint-representations takes M finite projective  | `G7/adjoint-representations` |
| `mathlib:Matrix.symplecticGroup` | near-miss | provides is accurate (it is a Submonoid of matrices; the group structure is an instance in the same file). G7/vast-tidy-and-enormous-gsp4-subgroups cites it for 'the symplectic Lie algebra', which it is not: the Lie algebra is LieAlgebra.Symplectic.sp l R : Li | `G7/vast-tidy-and-enormous-gsp4-subgroups` |
| `mathlib:MeasureTheory.Measure.haar` | near-miss | provides is accurate: SOME Haar measure. It is haarMeasure K₀ for an arbitrary positive compact K₀ and is normalised by haarMeasure K₀ K₀ = 1 (haarMeasure_self), not by total mass 1; on a compact group it is in general not a probability measure. The node cites | `R01.5/haar-measure-chebotarev` |
| `mathlib:Module.End.exists_isNilpotent_isSemisimple` | unused | The statement is as described (it also needs FiniteDimensional K V, which the provides text omits). But no step of the only listing node invokes it: the node works with the multiplicative decomposition r(F) = s·u and names Tau Ceti's LinearMap.GeneralLinearGro | `R01.2/frobenius-semisimplification` |
| `mathlib:NumberField.IsCMField.complexConj` | unused | Exists as described (needs Algebra.IsIntegral ℚ K; that it is the conjugation of every complex embedding is the separate theorem isConj_complexConj). No field of G7/polarized-representation names or uses it: the node works with a complex conjugation c_v in the | `G7/polarized-representation` |
| `mathlib:alternatingGroup.isSimpleGroup_five` | confirmed-with-corrected-provides | Present at the pinned commit but deprecated there. The live statement, same file line 202, is: theorem alternatingGroup.isSimpleGroup {α} [DecidableEq α] [Fintype α] (hα : 5 ≤ Nat.card α) : IsSimpleGroup (alternatingGroup α). Also: no field of the listing node | `R01.4/normal-subgroups-and-automorphisms-of-psl2-pgl2` |
| `mathlib:groupCohomology.H1InfRes_exact` | confirmed-with-corrected-provides | Correct (exactness in the middle, plus the Mono instance for inflation). It is a statement about Mathlib's groupCohomology of ABSTRACT groups; the third term is H¹(S, A), not its G/S-invariants. All seven listing nodes apply it to finite groups (in G7/gsp4-big | `G7/adequacy-criteria`, `G7/enormous-symmetric-powers`, `G7/h1-of-sl2-with-adjoint-coefficients` |
| `mathlib:cyclotomicCharacter` | confirmed-with-corrected-provides | Correct. Argument order is cyclotomicCharacter L p, as the nodes write. In R01.4/odd-representation the only use (acceptance and tests) is of the mod-p character χ̄_p : G_ℚ → F_p^×, which is Mathlib's modularCyclotomicCharacter (or the reduction of cyclotomicC | `R01.4/odd-representation` |
| `mathlib:Module.free_of_flat_of_isLocalRing` | confirmed-with-corrected-provides | Correct (commutative local ring). R01.1/continuous-representation uses it properly (projective ⇒ flat). R01.1/integral-model lists it for 'finitely generated torsion-free modules over the DVR O_E are free': there the input is torsion-freeness, not flatness. | `R01.1/integral-model` |
| `mathlib:Module.End.IsSemisimple` | confirmed-with-corrected-provides | Correct. G7/adequate-subgroup DEFINES 'g semisimple' as diagonalisable over k̄ and then says 'semisimplicity of g is Module.End.IsSemisimple'. Over an imperfect k these two notions differ in general; they agree for elements of finite order (minimal polynomial  | `G7/adequate-subgroup` |
| `mathlib:Sylow` | confirmed-with-corrected-provides | Correct. Used in R01.4/p-subgroups-and-borel-subgroups. In R01.4/subgroups-of-gl2-over-a-prime-field no field mentions Sylow subgroups or p-subgroups: the proof of (a) uses only an element of order ℓ (Cauchy). | `R01.4/subgroups-of-gl2-over-a-prime-field` |
| `mathlib:Subrepresentation` | confirmed-with-corrected-provides | Correct. But Mathlib has no IsModularLattice (nor JordanHolderLattice) instance on Subrepresentation ρ at the pinned commit (searched Mathlib/RepresentationTheory). R01.1/semisimplification says 'the lattice of subrepresentations is modular, so Mathlib's Jorda | `R01.1/semisimplification` |
| `tauceti:LinearMap.GeneralLinearGroup.coe_semisimplePart_mem_adjoin` | near-miss | The declaration is about the semisimple factor. The node cites it for 'u is a polynomial in r(F)', a statement about the unipotent factor. The library has the statements about u that the node needs. | `R01.2/frobenius-semisimplification` |
| `tauceti:NumberField.exists_isArithFrobAt_multiquadratic` | near-miss | Existence of one Frobenius with the stated action; K is any Galois number field containing the r i (generation is not assumed). The node cites it for a statement about every arithmetic Frobenius. The universal statement is NumberField.isArithFrobAt_apply_sqrt. | `R01.5/prescribed-quadratic-residue-symbols` |
| `tauceti:SymmetricPower.trace_map_of_apply_basis` | near-miss | The hypothesis is that f is diagonal in the basis b. The node applies it, and SymmetricPower.map_basis_symmetricPower_of_apply_basis (same hypothesis), to a triangular basis of an endomorphism whose characteristic polynomial splits. Such an endomorphism need n | `G7/symmetric-and-exterior-powers` |
| `tauceti:TauCeti.GL2Borel.card_eq` | near-miss | It gives the order of the Borel subgroup only. One node cites it for the order of GL_2(F_q) and of the unipotent radical; one node lists it without any use. | `R01.4/p-subgroups-and-borel-subgroups`, `R01.4/subgroups-of-gl2-over-a-prime-field` |
| `tauceti:TauCeti.GL2Borel.exists_det_sub_algebraMap_eq_zero` | unused | The statement is as the packet says. Unused in node R01.4/odd-irreducible-implies-absolutely-irreducible: no step names it, and the rationality lemma (a) goes from eigenvalues to invariant lines, the opposite direction. | `R01.4/odd-irreducible-implies-absolutely-irreducible` |
| `tauceti:TauCeti.GL2Borel.index_eq` | near-miss | The statement is as the packet says. In R01.4/cartan-subgroups-and-normalisers the text speaks of the index of the non-split torus, which is another declaration; the Borel index is not used there. | `R01.4/cartan-subgroups-and-normalisers` |
| `tauceti:TauCeti.Isogeny.degree_frobeniusIsogeny` | unused | The statement is as the packet says. Unused in node R01.6/good-reduction-frobenius-polynomial: step (e) takes det(V_ℓπ_v) = q_v from (d), that is from the cyclotomic determinant. | `R01.6/good-reduction-frobenius-polynomial` |
| `tauceti:TauCeti.Isogeny.degree_oneSubFrobeniusIsogeny_eq_pointCount` | near-miss | degree here is TauCeti.Isogeny.degree, the degree of the function-field extension attached to a coordinate-ring pullback of Weierstrass curves. The node combines it with det(V_ℓβ) = deg β for an endomorphism β of the abelian variety E. These are different carr | `R01.6/good-reduction-frobenius-polynomial` |
| `tauceti:TauCeti.Matrix.SpecialLinearGroup.not_isSolvable_fin_two` | unused | The statement is as the packet says (the hypothesis means /F/ ≥ 4). Unused in node R01.4/dickson-classification-and-the-dyadic-refinement: no step names it, and non-solvability is taken from mathlib:Group.IsPerfect.not_isSolvable. | `R01.4/dickson-classification-and-the-dyadic-refinement` |
| `tauceti:TauCeti.rootsOfUnityEquivResidueFieldUnits` | near-miss | A statement about a nonarchimedean local field K and the exponent #𝓀[K] − 1. The node uses it as reduction μ_{Q−1}(K̄) ≅ F_Q^× for the algebraic closure K̄, which is not a local field. | `R01.2/tame-inertia-and-fundamental-characters` |
| `tauceti:TauCeti.simple_indFDRep_ofLinearCharacter_iff` | near-miss | Finite G, k algebraically closed of characteristic 0, k and G in one universe, as the packet says. The node's Γ is profinite and only the projective image of ρ is assumed finite, so χ : Δ → k^× may have infinite image (k = ℚ̄_ℓ); the declaration then does not  | `R01.4/dihedral-projective-image-iff-induced` |
| `tauceti:TauCeti.teichmuller` | near-miss | The def is as the packet says, with values in 𝒪[K]ˣ for the ValuativeRel integer ring of a nonarchimedean local field. Two nodes use it in other carriers (ℤ_p^×, W(F_{p²})^×), and one asks of it a splitting and a p = 2 variant that it does not contain. | `R01.2/cyclotomic-and-dirichlet-characters`, `R01.2/tame-inertia-and-fundamental-characters` |
| `tauceti:TauCeti.traceBilinForm_nondegenerate` | near-miss | Nondegenerate means that both partial maps are injective. The node concludes that the trace pairing is perfect. Over a ring that is not a field injectivity does not give bijectivity onto the dual (the form 2xy on ℤ is nondegenerate and not perfect). | `G7/adjoint-representations` |
| `tauceti:WeierstrassCurve.quadraticTwistOf` | near-miss | A def of a Weierstrass model from parameters (t, n) (trace and norm of a generator of a quadratic extension). R01.6/torsion-and-residual-representation cites it for the effect of twisting on the Galois action (ψ becomes ψ·ε_d), which the def does not carry. Th | `R01.6/torsion-and-residual-representation` |

Planned as new although the libraries have it (the nodes now cite the declarations and plan only
what they add): the Mackey decomposition (`Rep.mackeyDecomposition`), Burnside's theorem
(`Representation.asAlgebraHom_surjective_of_isIrreducible`), Jordan–Hölder multiplicities
(`TauCeti.jordanHolderMultiplicity`), base change of representations (`Representation.baseChange`),
tensor powers (`Representation.tensorPower`), the Haar probability measure (`TauCeti.haarProb`),
corestriction on 1-cochains (`TauCeti.ContCohomology.cochainsCor1_res`), the index of a central
simple algebra and base change of Brauer classes, Clifford-theoretic conjugate subrepresentations,
the order of GL₂(F_q), normal forms of 2×2 matrices, quadratic twists of Weierstrass curves with
their point maps, and the number of n-torsion points of an elliptic curve.

No longer cited by any node: `mathlib:IntermediateField.adjoin.finiteDimensional`, `mathlib:IsPGroup.card_modEq_card_fixedPoints`, `mathlib:IsSemisimpleRing.exists_algEquiv_pi_matrix_of_isAlgClosed`, `mathlib:JordanHolderLattice`, `mathlib:Matrix.SL2.transvection_induction`, `mathlib:MeasureTheory.Measure.haar`, `mathlib:Module.End.exists_isNilpotent_isSemisimple`, `mathlib:alternatingGroup.isSimpleGroup_five`, `tauceti:LinearMap.GeneralLinearGroup.coe_semisimplePart_mem_adjoin`, `tauceti:WeierstrassCurve.quadraticTwistOf`.

## Nodes added by the review

| Node | Kind | Title | Why it was needed |
|---|---|---|---|
| `R01.1/exterior-powers-of-finite-projective-modules` | lemma | Exterior powers of finite projective modules | Hidden argument of R01.1/continuous-representation: the determinant on a projective module of constant rank is the action on the top exterior power, which must be projective of rank one and compatible with base change; Mathlib has exterior powers of free modules only. |
| `R01.1/rank-one-projective-modules-are-invertible` | lemma | Projective modules of rank one are invertible | Hidden argument of R01.1/continuous-representation: End_A(⋀^r M) = A. Mathlib has the endomorphism statement for invertible modules but not that a projective module of constant rank one is invertible. |
| `R01.1/determinant-through-a-complement` | lemma | The determinant of an endomorphism of a projective module through a complement | Hidden argument of R01.1/continuous-representation and of R01.1/determinant-of-induced-representation: the determinant character is a polynomial in matrix coefficients on a free cover (continuity), commutes with base change, and agrees with LinearMap.det on free modules. |
| `R01.1/evaluation-at-a-transversal-is-a-homeomorphism` | lemma | The topology of the induced module: evaluation at a transversal | Hidden argument of R01.1/continuous-induction: Mathlib's ContRepresentation.coind lives on a submodule of C(Γ, U) with the compact-open topology, and the comparison with the module topology of the induced module was asserted without proof. |
| `R01.1/no-small-subgroups-in-a-normed-algebra` | lemma | No small subgroups in the unit group of a real normed algebra | Hidden argument of R01.1/finite-coefficients-and-finite-quotients (Artin complement): GL_n(ℂ) has a neighbourhood of 1 containing no nontrivial subgroup; neither library has it. |
| `R01.1/countably-many-coefficient-fields` | lemma | The finite extensions of Q_ℓ inside Q̄_ℓ are countably many and closed | Hidden argument of R01.1/baire-descent-to-a-finite-coefficient-field: the Baire category theorem needs a countable family of closed sets, and the sources do not prove countability. |
| `R01.1/semisimple-representations-over-perfect-fields` | lemma | Semisimple representations over a perfect field stay semisimple after extension of scalars | Hidden argument of R01.1/semisimplification ('if k is perfect then V^ss ⊗ k′ is semisimple'), used by R01.1/continuity-descent-and-lattice-independence (c); not in the pinned libraries. |
| `R01.1/brauer-nesbitt-algebraically-closed` | theorem | Brauer–Nesbitt over an algebraically closed field | Part of the rebuilt Brauer–Nesbitt theorem: the algebraically closed case, proved by the classical argument (separating elements, traces modulo p, p-th roots of characteristic polynomials, induction), with no use of determinants. |
| `R01.1/semisimplification-detected-after-field-extension` | lemma | Semisimplifications are detected after extension of scalars | Part of the rebuilt Brauer–Nesbitt theorem: the descent from an algebraic closure to an arbitrary field, valid for imperfect fields; it was a proof step of R01.1/brauer-nesbitt. |
| `R01.1/brauer-nesbitt-traces` | theorem | Brauer–Nesbitt with traces when (dim V)! is invertible | Part (b) of the former R01.1/brauer-nesbitt as its own theorem, proved from the trace congruence over an algebraic closure (multiplicities are below the characteristic) and descent; the claim 'traces do not suffice in characteristic p ≤ dim V' is replaced by the existence of counterexamples, since it is false as a universal statement (k = F_2, dimension 2). |
| `R01.1/residue-field-of-the-algebraic-closure-of-q-ell` | lemma | The residue field of Q̄_ℓ | Hidden argument of R01.1/reduction-and-residual-semisimplification and R01.1/teichmuller-lift-of-a-residual-character: the residue field of Q̄_ℓ is an algebraic closure of F_ℓ, and finite subfields come from coefficient fields. The text of Tau Ceti's LocalFieldsRamification Layer 2 does not state it, and it has a short proof from Mathlib's PadicAlgCl. |
| `R01.2/algebraic-closure-of-a-completion-is-generated-by-the-global-closure` | lemma | The algebraic closure of F_v is generated by F_v and the algebraic closure of F | Hidden argument of decomposition-group-at-a-place (injectivity of ι^*): F̄_v = F_v·ι(F̄), proved from Mathlib's IsKrasner.krasner and IsKrasner.of_completeSpace; replaces the stage prerequisite LocalFieldsRamification layer 0 there. |
| `R01.2/nilpotent-exponential-and-unipotent-logarithm` | lemma | The exponential of nilpotent elements and the logarithm of unipotent elements are inverse to each other | Hidden argument of grothendieck-quasi-unipotence, of the Weil–Deligne functor and of frobenius-semisimplification: Mathlib has IsNilpotent.exp but no logarithm, no injectivity and no unipotent roots; with it no convergent ℓ-adic series is needed. |
| `R01.2/rescaling-the-monodromy-operator` | lemma | Rescaling the monodromy operator: (V, r, N) ≅ (V, r, aN) for a ≠ 0 | The rescaling lemma (V, r, N) ≅ (V, r, aN), an API item used as a proof step by two nodes; proof after Deligne (proof of Lemme 8.4.3), with the hypotheses it really uses. |
| `R01.2/ell-adic-representation-of-a-weil-deligne-representation` | lemma | The ℓ-adic representation of the Weil group attached to a Weil–Deligne representation | The inverse of the Weil–Deligne functor, needed for the bijection of Deligne 8.3.7 stated in grothendieck-monodromy-and-the-weil-deligne-functor. |
| `R01.2/determinant-of-a-cyclic-block-endomorphism` | lemma | The determinant of a cyclic block endomorphism (Deligne, Lemme 3.9) | Deligne's Lemme 3.9, used for the Euler factor of an induced representation; stated over a commutative ring with a direct proof from Matrix.det_one_sub_mul_comm. |
| `R01.2/inertia-invariants-of-an-induced-representation` | lemma | Inertia invariants of a representation induced from the Weil group of a finite extension | The first half of Deligne's proof of Proposition 3.8: the inertia invariants of an induced representation, in coordinates, including the Weil–Deligne case. |
| `R01.2/monodromy-filtration` | definition | The monodromy filtration of a nilpotent endomorphism | Definition node for the monodromy filtration (existence, uniqueness, formula, conjugation, primitive decomposition, dual, tensor product), split out to break the cycle between frobenius-semisimplification and purity-of-weil-deligne-representations. |
| `R01.2/purity-from-a-pure-graded` | lemma | A nilpotent operator with pure graded has the Jordan type of its graded (the count behind FSY Lemma 5.40) | The step asserted without proof in FSY Lemma 5.40 (source issue E253): rank inequality, eigenvalue strings and the rank identity force the Jordan type and purity. |
| `R01.3/finite-wild-image` | lemma | Finiteness of the wild inertia image for coefficients of characteristic different from p | Added: the finiteness of ρ(P_K) for ℓ ≠ p (and for discrete or complex coefficients) was argued inside the statement of the definition node; it is the hypothesis under which Sw is defined. |
| `R01.3/wild-action-factors-through-a-finite-galois-extension` | lemma | The wild inertia action factors through a finite Galois extension | Added: every lower-numbering formula and the rationality of the breaks use a finite Galois L/K through which the wild action factors; no step proved that it exists. |
| `R01.3/swan-conductor-orbit-formula` | lemma | Swan conductors through orbits of wild characters: reduction to finite groups in characteristic 0 | Added: integrality of Sw in characteristic ℓ and for infinite inertia image is reduced to finite groups in characteristic 0 through orbits of wild characters; it was a hidden argument of hasse-arf-integrality. |
| `R01.3/upper-numbering-of-an-open-subgroup` | lemma | Upper numbering of the subgroup G_L: the function ψ_{L/K} of a finite separable extension | Added: G_K^u ∩ G_L = G_L^{ψ_{L/K}(u)} for a finite separable, not necessarily Galois, L/K is needed by the induction formula and by the tame base change; LocalFieldsRamification layer 3 states the Herbrand functions and their transitivity only for Galois towers. |
| `R01.3/invariants-of-an-induced-representation` | lemma | Invariants of an induced representation under a closed normal subgroup | Added: the count dim (Ind U)^D = [Γ : H·D]·dim U^{H ∩ D} (inertia invariants of an induced representation) is the Mackey step of the induction formula. |
| `R01.3/local-induction-formula` | theorem | The local induction formula for conductors, in rational form | Added to break the cycle hasse-arf-integrality → induction-formula-for-conductors → global-conductor-and-prime-to-p-conductor → hasse-arf-integrality: the local induction formula in rational form, with no global prerequisite and no integrality. |
| `R01.3/serre-bound-for-the-wild-invariant` | theorem | Serre's bound for the wild invariant of a representation of a p-adic Galois group | Added: Serre 1987, Proposition 9 (non-strict form), the bound behind f_3 ≤ 5 and the first bound at p = 2; (4.9.6) is reproved from Hensel's bound because LocalFieldsRamification layer 3 does not state it. |
| `R01.4/subgroups-of-psl2-with-several-sylow-p-subgroups` | theorem | Dickson: subgroups of PSL_2(F_s) with more than one Sylow p-subgroup | Needed by Dickson (a) for subgroups of order divisible by p; statement and proof route taken from Dickson §§251–254 (page images), cases checked against the subgroup lists of PSL_2(F_4) and PSL_2(F_9). |
| `R01.4/finite-subgroups-of-pgl2-of-order-prime-to-the-characteristic` | theorem | Finite subgroups of PGL_2 of order prime to the characteristic: cyclic, dihedral, A_4, S_4, A_5 | Needed by the Dickson node (a) and the Serre node (b); statement and proof route from Dickson §§256–257 (page images, pp. 280–282) and Serre Prop. 16; the three numerical solutions recomputed, and the conclusion checked on the subgroup lists of PGL_2(F_q), q ≤ 11. |
| `R01.4/two-transvections-generate-sl2-over-a-prime-field` | lemma | Two transvections with distinct axes generate SL_2(F_ℓ) | Needed by Serre's Proposition 15; proof from Tau Ceti's transvection generation of SL_n over a field; orders checked for ℓ = 2, 3, 5 and the failure over F_9. |
| `R01.4/irreducible-with-abelian-projective-image-is-klein` | lemma | An irreducible subgroup of GL_2 with abelian projective image has projective image (ℤ/2)² | Needed by (d) of the dihedral node when the normal subgroup acts by scalars; elementary proof given, examples Q_8 and D_8. |
| `R01.4/minimal-index-of-proper-subgroups-of-psl2` | theorem | Galois's theorem: proper subgroups of PSL_2(F_q) have index at least q + 1 for q ≠ 2, 3, 5, 7, 9, 11 | Needed by (a) of the large-image node; statement and proof route from Dickson §262 (page image); minimal indices computed for q ≤ 11. |
| `R01.5/rank-two-trace-and-determinant-comparison` | comparison | Rank two: the pair (trace, determinant) is the 2-dimensional determinant | Comparison required by the stage description: (tr ρ, det ρ) is the image of the 2-dimensional determinant det ∘ ρ under Chenevier's Lemma 1.9 (IHG.0/determinant-dimension-two, statement read in the IHG packet); identity checked on 1 ⊕ ψ. |
| `R01.5/absolutely-irreducible-determined-by-trace` | lemma | Characters of pairwise non-isomorphic absolutely irreducible representations are linearly independent | Lemma needed by descent-obstruction step 1: an absolutely irreducible representation is determined by its trace in every characteristic. Proof from Schur's lemma and Mathlib's Jacobson density theorem; examples computed. |
| `R01.5/simple-modules-over-the-algebraic-closure` | lemma | Extension of a simple module to the algebraic closure of a perfect field (Schur index) | Lemma needed by descent-obstruction step 2: W ⊗ k̄ is the sum over the embeddings of the centre of s copies of each conjugate, s the Schur index. Proof from Wedderburn and the image-algebra node; checked on ℍ over ℝ and ℚ(ζ_3) over ℚ. |
| `R01.5/haar-measure-on-open-subgroups-of-gl-n` | lemma | Haar measure on open subgroups of GL_n(O_E) is the restricted additive Haar measure | Lemma needed by haar-measure-chebotarev (e): Haar probability measure of an open subgroup of GL_n(O_E) is the normalised restriction of additive Haar measure. Proof from Mathlib's distribHaarChar and Tau Ceti's uniqueness of haarProb; measures of GL_1(ℤ_ℓ), GL_2(ℤ_2) computed. |
| `R01.5/polynomial-zero-sets-are-haar-null` | lemma | Zero sets of nonzero polynomials are null for additive Haar measure | Lemma needed by haar-measure-chebotarev (e): zero sets of nonzero polynomials are null (Fubini induction with Mathlib declarations read at the pinned commit); the finite-ring non-example shows the role of 'no isolated point'. |
| `R01.5/matrix-algebra-endomorphisms-are-inner-over-local-rings` | lemma | R-algebra endomorphisms of M_d(R) are inner for a local ring R | Lemma needed by carayol-lifts-recognition: R-algebra endomorphisms of M_d(R) are conjugations for R local. Proof by matrix units and freeness of projective modules over a local ring; the Dedekind non-example shows the role of 'local'. |
| `R01.6/determinant-of-a-symplectic-similitude` | lemma | The determinant of a symplectic similitude | Needed by determinant-and-oddness (a): det h = μ^g for a symplectic similitude is in neither library for g > 1 (Mathlib has μ = 1, Tau Ceti g = 1) and by decision of the lead is not taken from G7. |
| `R01.6/determinant-of-a-weierstrass-isogeny-on-the-tate-module` | lemma | The determinant and trace of a Weierstrass isogeny on the Tate module | Bridge required by the library finding on degree_oneSubFrobeniusIsogeny_eq_pointCount: det(T_ℓφ) = φ.degree and the trace formula for Tau Ceti isogenies of Weierstrass curves, proved from Layers 1 and 2. |
| `R01.6/specialisation-of-torsion-at-good-reduction` | lemma | Specialisation of torsion points of an abelian scheme over the integers of a local field | Hidden argument of good-reduction-frobenius-polynomial (a), (b): torsion points of an abelian scheme over the integers of a local field are unramified and specialise bijectively; proof route from A3, Mathlib's étale algebras and LocalFieldsRamification Layer 2. |
| `R01.6/tate-module-of-the-tate-curve` | lemma | The Tate module of a Tate curve | Hidden argument used by comparison-with-weierstrass-local-polynomial and required-examples: the Tate module of a Tate curve and the inertia action v(q)·t_ℓ. |
| `G7/charpoly-of-symmetric-and-exterior-powers` | lemma | Characteristic polynomials of the symmetric and exterior powers of an endomorphism (universal identity) | Needed because the characteristic-polynomial identities of Sym^d and ∧^d were proved with a triangular basis that need not exist and with library lemmas for diagonal endomorphisms; the universal identity via the generic matrix is a statement of its own. |
| `G7/tensor-induction-independent-of-transversal` | lemma | Tensor induction does not depend on the transversal | Needed because tensor induction is defined with a transversal and its independence was asserted in one line; the lemma gives the cocycle identity, the intertwiner and its compatibility. |
| `G7/charpoly-of-cyclically-permuted-tensor-product` | lemma | Characteristic polynomials of tensor products and of cyclically permuted tensor products of linear maps | Needed for the trace formula of tensor induction (called standard) and for the characteristic-polynomial identities that the stage description asks for; also gives the characteristic polynomial of a tensor product used by the transfer node. |
| `G7/trace-pairing-on-matrices-is-perfect` | lemma | The trace pairing on matrices, and on endomorphisms of a finite projective module, is perfect | Needed because perfectness of the trace pairing over a ring does not follow from the library's non-degeneracy lemma; the duality ad⁰ ≅ (ad/A·1)^∨ and the splitting for n ∈ A^× rest on it. |
| `G7/simplicity-of-pgl2-over-an-algebraically-closed-field` | lemma | PGL_2 of an algebraically closed field is a simple group | Needed by the Goursat step of Newton–Thorne's Lemma 2.2 (fact (e) of the Zariski-closure node); not in the pinned libraries, provable from Mathlib's Iwasawa criterion. |
| `G7/roots-of-characters-up-to-finite-order` | lemma | m-th roots of ℓ-adic characters up to characters of finite order | Needed by the Hodge–Tate lifting statement (Patrikis Lemma 2.3.15), with an elementary proof; it was part of a gap after pass 1. |
| `G7/lifting-projective-representations-hodge-tate` | theorem | Lifts of geometric projective representations: half-integral Hodge–Tate–Sen weights, and Hodge–Tate lifts over totally real fields | Split decided by the lead: the statements with Hodge–Tate control (Patrikis Lemma 2.7.4; BCGP21 Proposition 9.2.1) need p-adic Hodge theory and are separated from the Tate part, which keeps the old id. |
| `G7/schur-lemma-over-local-rings` | lemma | Schur's lemma for residually absolutely irreducible representations over a local ring | Needed by the transfer of polarizations over a local coefficient ring (uniqueness of the pairing up to A^×); R01.1 states Schur's lemma over fields only. |
| `G7/h1-restriction-injective-for-invertible-index` | lemma | Restriction to a subgroup of invertible finite index is injective on H¹ (Mathlib's group cohomology) | Needed by adequacy-criteria, enormous-symmetric-powers, h1-of-sl2 and gsp4-big-image-verification, which mixed two cohomology carriers; proved from TauCeti.ContCohomology.cochainsCor1_res and cochainsCor1_d0 (read at the pin) or by a three-line averaging argument. |
| `G7/vanishing-of-h0-and-h1-under-extension-of-the-coefficient-field` | lemma | Vanishing of H⁰ and H¹ under extension of the coefficient field | Needed for the invariance of the cohomological conditions of adequacy and enormity under extension of the coefficient field, including infinite H ⊆ GL_n(F̄_p). |
| `G7/h1-with-trivial-action-of-a-normal-subgroup` | lemma | H¹(B, N) embeds into the B-equivariant homomorphisms U → N when the normal subgroup U acts trivially and [B : U] is invertible | Replaces the unavailable isomorphism H¹(B, M) = H¹(U, M)^{B/U} by an elementary statement in Mathlib's carrier that suffices for the Borel-subgroup dévissage. |
| `G7/h1-of-borel-subgroups-with-symmetric-power-coefficients` | lemma | Vanishing of H¹ of Borel subgroups of GL₂(F_q) with coefficients Sym^k ⊗ det^j, by weights | The computation that closes the former gap on Cline–Parshall–Scott Lemma 2.7(c) and proves the PGL₂(F_5) case behind E754; every case was compared with the finite computations of pass 1. |
| `G7/dimension-of-absolutely-irreducible-representations-of-prime-to-p-groups` | lemma | An absolutely irreducible representation of a finite group of order prime to p has dimension prime to p | Needed for p ∤ n in the prime-to-p case of the adequacy criteria; proved from character orthogonality in Mathlib. |
| `G7/galois-descent-of-stable-subspaces` | lemma | Galois descent for stable subspaces of V ⊗_k k′ | Needed by the proof of Allen et al. Lemma 6.2.30 in the enormous node; proved by the classical minimal-length argument and the fixed-field statement of infinite Galois theory in Mathlib. |
| `G7/pieri-splitting-for-symmetric-powers` | lemma | V ⊗ Sym^{r−1}V ≅ Sym^rV ⊕ det ⊗ Sym^{r−2}V for r invertible | Part (a) of the Clebsch–Gordan node as its own node, so that the proof of part (d) (a new lemma node) does not depend on the bundled node that cites it. |
| `G7/tensor-products-of-symmetric-powers` | lemma | Sym^aV ⊗ Sym^bV ≅ ⊕ det^i ⊗ Sym^{a+b−2i}V when (a + b)! is invertible | Proves part (d) of the Clebsch–Gordan node in the generality its consumer needs, from the Pieri splitting and the Krull–Schmidt theorem of the pinned Tau Ceti, without Serre's theorem. |
| `G7/image-in-the-3-cyclotomic-tower-for-sl2-wreath-products` | lemma | The image over the 3-power cyclotomic tower of an induction with image SL₂(F_3) ≀ Z/2Z does not shrink | Repairs the k = F_3 step of Boxer–Calegari–Gee–Pilloni Lemma 7.5.22 (E764) without the Magma list; the group theory was checked by hand. |

## Granularity and status

The split plans are in the `remaining` lists: one item per bundled node, naming the declarations it
should become. They were written by the reader of each stage after checking the node, so they follow
the corrected statements. The other `remaining` items are the sources still to be read, the gaps,
and the stage-level prerequisites that should become node ids when their suppliers export them.

Open gaps (36):

- **Larsen's lemma on hyperspecial points after a totally ramified extension** (needed by `R01.1/reductive-integral-models`)
- **Functional equation of Artin L-functions of number fields with global constants** (needed by `R01.2/local-epsilon-factor`)
- **Local constants outside finite extensions of Q_p** (needed by `R01.2/local-epsilon-factor`)
- **Ramification filtration over a perfect infinite residue field** (needed by `R01.3/breaks-and-swan-conductor`, `R01.3/hasse-arf-integrality`, `R01.3/additivity-twist-and-unramified-invariance`, `R01.3/artin-schreier-swan-conductor`)
- **One-dimensional comparison with class field theory** (needed by `R01.3/artin-conductor-with-its-wild-part`, `R01.3/induction-formula-for-conductors`)
- **Automorphisms of PSL_2(F_q) and PGL_2(F_q) (Dieudonné / Steinberg) not read in their own source** (needed by `R01.4/normal-subgroups-and-automorphisms-of-psl2-pgl2`)
- **Freeness of V_ℓA over E ⊗ Q_ℓ for a subfield E ⊆ End⁰(A), and E-characteristic polynomials** (needed by `R01.6/tate-module-with-endomorphism-coefficients`)
- **Mumford–Tate containment of the ℓ-adic images (Richard–Yafaev Theorem 4.9, third clause)** (needed by `R01.6/serre-independence-and-connectedness`)
- **Gan–Takeda Lemma 6.1 not read** (needed by `G7/gsp4-semisimple-determined-by-gl4`)
- **Guralnick–Herzig–Taylor–Thorne adequacy theorem (appendix Theorem 9 / Theorem A.9)** (needed by `G7/adequacy-criteria`, `G7/gsp4-big-image-verification`, `G7/taylor-wiles-image-lemmas`, `G7/adequacy-of-symmetric-powers`)
- **Ext¹ computations for SL₂(F_{p^r}) behind GHT17 Corollary 9.4** (needed by `G7/adequacy-criteria`, `G7/adequacy-of-symmetric-powers`)
- **Thorne 2024, Lemma 7.3 (adequacy of symmetric powers of large SL₂ images)** (needed by `G7/adequacy-of-symmetric-powers`)
- **Inertia action on the Tate module under potential good reduction** (needed by `R01.3/conductor-of-an-elliptic-curve`, `R01.3/ogg-formula`, `R01.3/elliptic-conductor-exponent-bounds`, `R01.3/residual-elliptic-conductor-away-from-ell`)
- **Brumer–Kramer's bound for the Swan conductor of a real representation of a p-group** (needed by `R01.3/elliptic-conductor-exponent-bounds`)
- **H¹(SL_2(F_{2^r}), M_2(F)) = 0 for all r ≥ 2 (Dickinson 2001, Lemma 42): source not read, proof not planned** (needed by `R01.4/characteristic-two-residual-image-facts`)
- **Nekovář's semisimplicity criterion [Nek18, Proposition 3.10]** (needed by `R01.5/gsp4-semisimplicity-criteria`)
- **Integral, ℓ-independent characteristic polynomial of an endomorphism on V_ℓA (dimension > 1)** (needed by `R01.6/good-reduction-frobenius-polynomial`, `R01.6/local-euler-factor-of-an-abelian-variety`)
- **Serre's independence and connectedness theorems: proofs not read** (needed by `R01.6/serre-independence-and-connectedness`)
- **Serre's complement to the specialization of Galois images (Noot Proposition 1.3)** (needed by `R01.6/noot-specialization`)
- **The q-Frobenius endomorphism of an abelian variety over a finite field** (needed by `R01.6/good-reduction-frobenius-polynomial`, `R01.6/local-euler-factor-of-an-abelian-variety`, `R01.6/tate-module-with-endomorphism-coefficients`)
- **Borel, Linear Algebraic Groups, Ch. I §§1–2: closed images, closed derived groups, finite-index subgroups (source not read, no supplier node)** (needed by `G7/zariski-closure-and-monodromy-groups`, `G7/strong-irreducibility`)
- **Lemma 7.5.22 of Boxer–Calegari–Gee–Pilloni when Proj r̄^σ ≅ τ ∘ Proj r̄ for a field automorphism τ ≠ 1** (needed by `G7/gsp4-big-image-verification`)
- **Ĝ-pseudocharacters, Ĝ-complete reducibility and Lafforgue's reconstruction** (needed by `R01.1/reductive-integral-models`)
- **Classification of Frobenius-semisimple indecomposable Weil–Deligne representations** (needed by `R01.2/frobenius-semisimplification`)
- **Saito's conductor–discriminant theorem and its inputs** (needed by `R01.3/saito-conductor-discriminant`, `R01.3/ogg-formula`)
- **Analytic subsets of compact ℓ-adic Lie groups with empty interior are Haar-null** (needed by `R01.5/haar-measure-chebotarev`)
- **Algebraic-group inputs of BCGP25 Proposition 4.11.2** (needed by `R01.5/gsp4-semisimplicity-criteria`)
- **Specialisation of the points of a finite étale scheme over a normal integral base** (needed by `R01.6/noot-specialization`)
- **A bijective homomorphism of algebraic groups in characteristic 0 is an isomorphism (no supplier)** (needed by `G7/zariski-closure-and-monodromy-groups`, `G7/unequal-weight-tensor-irreducibility`)
- **Patrikis Lemma 2.3.17: characters of a totally real field with rational Hodge–Tate–Sen weights (no supplier)** (needed by `G7/lifting-projective-representations-hodge-tate`)
- **Finite group computations of Boxer–Calegari–Gee–Pilloni §7.5** (needed by `G7/gsp4-big-image-verification`)
- **H¹(SL₂(F_9), ad⁰) = 0 (the case #F = 9 of Darmon–Diamond–Taylor Lemma 2.48)** (needed by `G7/h1-of-sl2-with-adjoint-coefficients`)
- **H¹(SL_n(k′), ad⁰) = 0 for p > n ≥ 3 (Clozel–Harris–Taylor Lemma 2.5.6)** (needed by `G7/enormous-symmetric-powers`)
- **Simplicity and pairwise non-isomorphism of PSL₂(F_p) and PSU_m(F_{p²}) (Boxer–Calegari–Gee–Newton–Thorne Lemma 5.2.3)** (needed by `G7/taylor-wiles-image-lemmas`)
- **Projective images A₄ and A₅ in characteristic 3 and 5: the Sublemma of BLGG13, Appendix A.2** (needed by `G7/adequacy-criteria`)
- **Absolute irreducibility of 𝔰𝔭₄ under Sp₄(F_p) for p ≥ 3** (needed by `G7/gsp4-big-image-verification`, `G7/cg20-big-image-examples`)

## The stage graph

- **Promotion.** The packet's cross-roadmap prerequisites derive 63 links between
  layers; 10 are already in the live atlas, 53 are new, and none would be
  dropped as closing a cycle.
- **Graph claims that did not hold.** The gap on Serre's complement said that InverseGalois IG.2
  consumes R01.6; it does not, on the live graph or with the links of every unpromoted packet, so
  IG.2 can supply R01.6 (restructure entry 5). The gap on Saito's theorem said that the
  vanishing-cycles roadmap could not be used because it is downstream; the accurate statement is
  that neither LPV.0 nor LPV.7 states the specialisation identity for a non-semistable regular model
  in mixed characteristic. The handoff of the blueprint job reports a cycle through R01.6 that
  already exists; the review could not reproduce it.
- **Cycles between layers that would appear later.** The node graph is acyclic. Two nodes of G7 need
  Hodge–Tate weights and cite PadicHodgeTheory (R06.2 nodes and P7/sen-module), which makes the whole
  layer G7 a consumer of p-adic Hodge theory, while R01.5 and R01.6 cite one G7 node and consumers of
  G7 lie upstream of PadicHodgeTheory P7. None of this is a cycle in the live atlas; it becomes one
  when the unpromoted packets of those roadmaps are promoted, and promotion would then drop a link.
  Restructure entry 6 divides G7 into three sub-layers, which removes every such cycle; the division
  was checked on the node graph.
- **Dependencies inside the roadmap** that the document does not state (R01.6 → R01.3, R01.2 → R01.6,
  R01.1 → R01.3, R01.2 → G7, and the first sub-layer of G7 → R01.5, R01.6) are in restructure entry 7.

Restructure entries of the packet (the first five replace the packet's own, corrected):

1. (rescope; ArithmeticGaloisRepresentations) LocalFieldsRamification, Part II: ramification filtrations, Herbrand's theorem and Hasse–Arf for complete discretely valued fields with perfect residue field; the absolute upper filtration G_K^u with its quotient compatibility; the functions φ_{L/K}, ψ_{L/K} and the formula G_K^u ∩ G_L = G_L^{ψ_{L/K}(u)} for finite separable L/K that need not be Galois. R01.3 then imports them: the first part of R01.3/breaks-and-swan…
2. (rescope; AbelianSchemesAndArithmeticModuli, ArithmeticGaloisRepresentations) (a) A6/tate-module-of-a-weil-restriction cites ArithmeticGaloisRepresentations:R01.1/continuous-induction and R01.6/tate-module-of-an-abelian-variety, not G7. (b) The statements of R01.6 that need Milne 10.20 and 10.23 in dimension greater than one (part (f) of R01.6/good-reduction-frobenius-polynomial, the integrality of R01.6/local-euler-factor-of-an-abelian-variety, the freeness clause of R01.6/tate-module-with-en…
3. (rescope; ArithmeticGaloisRepresentations, NeronModelsAndSemistableAbelianVarieties, FaltingsFinitenessAndIsogenyTheorems) Once the proofs are read, state the two theorems at a stage downstream of NeronModelsAndSemistableAbelianVarieties:R11.3 and of the finite-flat theory, with R01.6 as a supplier of the Tate module and of the monodromy groups; R01.6 keeps the definitions (R01.6/galois-generic-abelian-varieties) and the statement as a quotation until then.
4. (rescope; ArithmeticGaloisRepresentations, AutomorphicBundles, ShimuraData) Plan the Mumford–Tate containment at a stage downstream of ShimuraData:D1 and AutomorphicBundles:B1, importing R01.6/tate-module-of-an-abelian-variety and R01.6/serre-independence-and-connectedness.
5. (rescope; InverseGaloisAndArithmeticFundamentalGroups, ArithmeticGaloisRepresentations) Extend the scope of InverseGaloisAndArithmeticFundamentalGroups:IG.2 to Hilbert irreducibility in the ℓ-adic Lie form over fields of finite type over Q. R01.6 then states Noot's Proposition 1.3 next to R01.6/noot-specialization with IG.2 as supplier (the need is recorded in the gap on Serre's complement); Noot's Corollary 1.5 stays with FaltingsFinitenessAndIsogenyTheorems.
6. (split; ArithmeticGaloisRepresentations) Divide G7 into three sub-layers. G7.I, 'Operations, similitude groups and polarizations' (requires R01.1, R01.2, R01.4; outside inputs IntegralHeckeAndGaloisDeterminants IHG.0 and IHG.1, ArithmeticGaloisDuality R02.4 and Tau Ceti layers; R01.5 and R01.6 may cite it): G7/symmetric-and-exterior-powers, G7/charpoly-of-symmetric-and-exterior-powers, G7/tensor-induction, G7/tensor-induction-independent-of-transversal, G7/…
7. (rescope; ArithmeticGaloisRepresentations) Record in the roadmap document: R01.3 requires R01.1 and R01.6 (the conductor of an elliptic curve and Ogg's formula consume the Tate module; R01.6 cites nothing of R01.3); R01.6 requires R01.2 (decomposition groups, Frobenius polynomials, Euler factors) and R01.4 (oddness), and its nodes on monodromy groups require the first sub-layer of G7; R01.5 requires the first sub-layer of G7 for R01.5/gsp4-semisimplicity-crit…
8. (rescope; ArithmeticGaloisRepresentations, ArithmeticStatistics, PELModuli, AutomorphicGaloisRepresentationsPartII, ClassicalSerreModularity, GL2ModularityLifting, WeightsInEtaleCohomology, NeronModelsAndSemistableAbelianVarieties, IntegralHeckeAndGaloisDeterminants, LefschetzPencilsAndVanishingCycles, DeligneWeightsAndPurity) The layer of this roadmap is the owner in cases (1)–(6), being upstream of the other in the stage graph; the other node cites it and keeps only what it adds (ST.5 and M0 the arithmetic-statistics and PEL structure on the group; AG2.0 the automorphic polarisation data; R27.1 and R32.1 their applications; R34.2 and R11.5 the cohomological and Néron-model statements; IHG.1 cites R01.1/brauer-nesbitt-algebraically-closed…

## Mistakes in the sources

26 of the packet's 30 entries confirmed, 4 rejected; 17 added by the review. Each was checked at its locator in the version named.

Entries of the packet:

| Id | Source | Kind | Where | Affects | Known | Verdict |
|---|---|---|---|---|---|---|
| `E101` | cg20 | gap | §6.3, proof of Theorem 6.13, p. 843 (Duke published version); arXiv:1907.08691v1 has the s | the proof | new | confirmed |
| `E201` | deligne73-constantes | misprint | 8.12, displayed formula after (8.12.4), Del-72, printed p. 572 (IAS typescript scan of LNM | nothing | new | confirmed |
| `E202` | deligne73-constantes | misprint | proof of Lemme 8.4.3, Del-69, printed p. 569 | nothing | new | confirmed |
| `E301` | ulmer16 | misprint | Tate, Number theoretic background (Corvallis, 1979), (4.2.4), as reported by Ulmer, arXiv: | a stated result | Ulmer, Conductors of ℓ-adic representations, Proc. Amer. Math. Soc. 144 (2016),  | confirmed |
| `E401` | serre87-duke | gap | 3.3, bracketed remark after condition (c), printed p. 198 (Duke Math. J. 54 (1987)); Collè | nothing | new | rejected |
| `E501` | chenevier-determinants | error | Definition 2.19, p. 33, arXiv:0809.0415v2 | nothing | new | confirmed |
| `E502` | bcgp25 | misprint | Proposition 4.11.2, proof, p. 111, arXiv:2502.20645v1 | nothing | recorded in the atlas register as PAPER-BOXER-CALEGARI-GEE-PILLONI-25/E020 (the  | confirmed |
| `E701` | cg20 | error | §4, second paragraph after the display of r̄/_{G_p}, p. 813 of the published text (read on | nothing | recorded in the atlas register as PAPER-CALEGARI-GERAGHTY-20/E18 (the same passa | confirmed |
| `E702` | cg18 | error | §8.4 "The invariant l_0", published p. 406; arXiv v2 §8.4 pp. 80–81 | a stated result | recorded in the atlas register as PAPER-CALEGARI-GERAGHTY-18/E164 (the same pass | confirmed |
| `E703` | bcgp21 | error | Lemma 2.1.3 and proof, §2.1.2 (arXiv v3 p. 17; publ. p. 171) | a stated result | recorded in the atlas register as PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E6 (the sa | confirmed |
| `E704` | nt26 | misprint | Proof of Lemma 2.2, arXiv v2 p. 10 | nothing | recorded in the atlas register as PAPER-NEWTON-THORNE-26/E13 (the same passage,  | confirmed |
| `E751` | accplus-cm-potential-automorphy | misprint | Lemma 7.1.4 and its proof, printed p. 1089 (also in arXiv v2) | nothing | recorded in the atlas register as PAPER-ALLEN-ETAL-23/E97 (the same passage, fou | confirmed |
| `E752` | accplus-cm-potential-automorphy | misprint | proof of Lemma 6.2.30, printed p. 1044 (also in arXiv v2) | nothing | recorded in the atlas register as PAPER-ALLEN-ETAL-23/E76 (the same passage, fou | rejected |
| `E753` | accplus-cm-potential-automorphy | misprint | §6.2.28, before Definition 6.2.29, printed p. 1044 (also in arXiv v2) | nothing | recorded in the atlas register as PAPER-ALLEN-ETAL-23/E75 (the same passage, fou | confirmed |
| `E754` | blgg13-serre-weights | error | Proposition A.2.1 and its proof, Point 5 and Figure 1, pp. 30–34 of the preprint arXiv 110 | a stated result | new | confirmed |
| `E755` | gn22-patching | gap | proof of Lemma 3.2.3, arXiv v5 p. 15 | the proof | new | rejected |
| `E756` | cht08 | error | Corollary 2.5.4 (and the bound in its proof via Lemma 2.5.2), Publ. IHÉS 108, pp. 56–57 | a stated result | corrected in print: Barnet-Lamb–Gee–Geraghty–Taylor, Potential automorphy and ch | confirmed |
| `E757` | cg20 | error | §4, proof of Example 4.11, published p. 819 (arXiv v1 pp. 14–15) | the proof | recorded in the atlas register as PAPER-CALEGARI-GERAGHTY-20/E28 (the same passa | confirmed |
| `E758` | cg20 | error | §4, proof of Example 4.11(1), published p. 819 (arXiv v1 p. 14) | nothing | recorded in the atlas register as PAPER-CALEGARI-GERAGHTY-20/E29 (the same passa | confirmed |
| `E759` | cg20 | error | §4, paragraph after the display of r̄/G_p, published p. 813 (arXiv v1 p. 10) | nothing | recorded in the atlas register as PAPER-CALEGARI-GERAGHTY-20/E18 (the same passa | confirmed |
| `E760` | cg20 | misprint | §4, proof of Example 4.11, published p. 818 (arXiv v1 p. 14) | nothing | recorded in the atlas register as PAPER-CALEGARI-GERAGHTY-20/E27 (the same passa | confirmed |
| `E761` | bcgp21 | error | proof of Lemma 7.5.18, (E3), arXiv v3 p. 203 (published p. 398) | the proof | recorded in the atlas register as PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E107 (the  | confirmed |
| `E762` | bcgp21 | misprint | Lemma 7.5.22, hypothesis for p = 3, arXiv v3 pp. 204–205 (published pp. 400–401) | nothing | recorded in the atlas register as PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E108 (the  | confirmed |
| `E763` | bcgp21 | error | proof of Lemma 7.5.22, case #k > 3, arXiv v3 p. 205 (published p. 401) | the proof | recorded in the atlas register as PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E109 (the  | confirmed |
| `E764` | bcgp21 | error | proof of Lemma 7.5.22, case k = F_3, arXiv v3 p. 205 (published p. 401) | the proof | recorded in the atlas register as PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E110 (the  | confirmed |
| `E765` | bcgp21 | error | Remark 7.5.23, last sentence, arXiv v3 p. 205 (published p. 401) | nothing | new | confirmed |
| `E766` | bcgnt25 | error | Lemma 5.2.6, hypothesis 2, arXiv v3 p. 54 (published p. 48) | a stated result | recorded in the atlas register as PAPER-BOXER-CALEGARI-GEE-ETAL-25/E28 (the same | confirmed |
| `E767` | bcgnt25 | gap | Lemma 5.2.4 (m = 2) and its proof, arXiv v3 pp. 52–53 (published pp. 46–47) | the proof | recorded in the atlas register as PAPER-BOXER-CALEGARI-GEE-ETAL-25/E31 (the same | confirmed |
| `E768` | bcgnt25 | misprint | proof of Lemma 5.2.4(2), arXiv v3 p. 53 (published p. 47) | nothing | recorded in the atlas register as PAPER-BOXER-CALEGARI-GEE-ETAL-25/E11 (the same | confirmed |
| `E769` | qian23 | misprint | citations of Allen et al., Theorem 1.4 (p. 1241) and proof of Lemma 2.6 (p. 1251) of the p | nothing | recorded in the atlas register as PAPER-QIAN-23/E16 (the same passage, found by  | rejected |

Entries added by the review:

| Id | Source | Kind | Where | Affects | Known | Verdict |
|---|---|---|---|---|---|---|
| `E150` | serre87-duke | error | §1.1 Notations, printed p. 180 (Duke Math. J. 54 (1987)); Collège de France PDF p. 2, read | nothing | new | confirmed |
| `E250` | deligne73-constantes | error | proof of Lemme 8.4.3, first display, Del-69, printed p. 569 (IAS typescript scan of LNM 34 | the proof | new | confirmed |
| `E251` | deligne73-constantes | misprint | 8.5, Del-70, printed p. 570 (read on the page image) | nothing | new | confirmed |
| `E252` | fsy22 | misprint | §5.3.1, formula (5.32), p. 54, in the version read (arXiv:1810.06454v5, labelled final pub | nothing | new | confirmed |
| `E253` | fsy22 | gap | proof of Lemma 5.40, p. 58, in the version read (arXiv:1810.06454v5; the Duke Math. J. tex | the proof | new | confirmed |
| `E254` | deligne73-constantes | misprint | 3.12 (C), displayed formula, Del-33, printed p. 533 (read on the page image) | nothing | new | confirmed |
| `E350` | ulmer16 | error | §3 (Ramification groups), PDF p. 3, arXiv:1307.4525v4 | nothing | new | confirmed |
| `E351` | brumer-kramer94 | error | §2, after (2.1), printed p. 229 (Compositio Math. 92 (1994), Numdam scan, PDF p. 4) | nothing | new | confirmed |
| `E352` | milne-ec | misprint | Chapter IV, §10, printed p. 165 (PDF p. 170) of the second edition (EC2.pdf) | nothing | new | confirmed |
| `E450` | accplus-cm-potential-automorphy | error | §7.1, Lemma 7.1.8(2) and its proof, printed pp. 1091–1092 (published PDF) | a stated result | recorded in the atlas register as PAPER-ALLEN-ETAL-23/E100 (the same passage, fo | confirmed |
| `E550` | cg20 | misprint | Appendix §A.4, proof of Lemma A.8, published p. 890, first sentence of the proof (author c | nothing | recorded in the atlas register as PAPER-CALEGARI-GERAGHTY-20/E152 (the same pass | confirmed |
| `E551` | bcgp25 | misprint | Lemma 10.2.3, proof, first sentence, p. 212, arXiv:2502.20645v1 | nothing | new | confirmed |
| `E650` | milne-ec | misprint | Ch. V, §7, "The zeta function of an elliptic curve revisited", before equation (46), p. 21 | nothing | new | confirmed |
| `E651` | milne-av | misprint | Ch. I, §10, proof of Proposition 10.20, p. 52 (version 2.00, PDF page 58) | nothing | new | confirmed |
| `E720` | bcgp21 | error | §7.5.16 'Representations Induced From Index Two Subgroups', the paragraph before Lemma 7.5 | a stated result | new | confirmed |
| `E780` | kt17-leopoldt | misprint | §4.3, Definition 4.10, condition 3, arXiv 1409.7007v2 p. 22 | nothing | new | confirmed |
| `E781` | bcgnt25 | error | Lemma 5.2.5, arXiv v3 p. 53 | a stated result | new | confirmed |

Notes. E401 is rejected: an irreducible representation over F_p stays semisimple over the algebraic
closure, so the case Serre is said to skip is empty. E752 is rejected as not a mistake of the source, and E755 and E769 as not established in a text that
was read. 22 entries repeat ones that the paper extractions already have in the register;
they are confirmed, and their `known` field names the register entry (see the questions). E754 quotes a stated result of the arXiv version of
Barnet-Lamb–Gee–Geraghty; the published version could not be obtained, so it is scoped to the
preprint and belongs on the collation list. E301 is second-hand: it is Ulmer's report of a misprint
in Tate's Corvallis article, which nobody could obtain.

## The suggested Lean file

The file was corrected section by section by the reader of each group, each elaborating its own copy,
and the patches were merged by script (no overlapping hunk). It grew from 8,939 to 11,715
lines. It elaborates with `lean-check` (`lake env lean` in the shared build at Mathlib 082e2d3):
980 `sorry` warnings, no error, no other warning. It imports Mathlib modules only (the
shared build has no Tau Ceti object files for these areas), so Tau Ceti declarations are named in
docstrings and the abelian varieties of R01.6 use a stand-in carrier, as before.

- Statements that were false as typed were corrected (for example recognition theorems over a
  topological field without the Hausdorff hypothesis, Carayol's lemma for an arbitrary ring topology,
  the image algebra for rank 0, Ogg's formula, the break decomposition without the hypothesis on the
  characteristic, the comparison of the Artin conductor with the Weil–Deligne conductor with
  unconstrained stand-in parameters).
- Every node added by the review has a section; those that cannot be stated with Mathlib's
  vocabulary are comment blocks with the statement in words.
- Every API item and unit test of the packet occurs in the file under its name: 769 as
  declarations or labelled examples, 72 in comment blocks because the vocabulary is
  missing.
- Lean points left open are in the `remaining` lists of their stages (for instance two statements
  of R01.3 that still use the Weil–Deligne functor without the hypothesis tying the tame character
  to the representation, the multipliers of twisted and tensored polarizations, and the deduction of
  the surjectivity hypothesis of the Taylor–Wiles restriction lemmas from linear disjointness).

## What was not checked

- Sources not obtained: Tate's Corvallis article, Saito 1988, Ogg 1967, Serre–Tate 1968, Livné 1989,
  Serre's Œuvres IV nos. 133, 135, 136 and his 2013 paper, Larsen–Pink 1992, Pink's definition of
  Galois generic points, Carayol 1994, Nekovář 2018, Boston–Lenstra–Ribet 1991, Dickinson 2001,
  Dieudonné and Steinberg on automorphisms, Larsen 1995, Conrad's lifting paper, Gan–Takeda, Borel's
  book, Thorne 2024, Cline–Parshall–Scott 1975, the published versions of several preprints
  (Barnet-Lamb–Gee–Geraghty 2013, Qian, Chenevier, Kisin–Zhou, Fresán–Sabbah–Yu). Each is a
  `remaining` item or a gap.
- Dickson's §§239–250 and 258; Brumer–Kramer §§3–5.
- The Magma enumerations of Boxer–Calegari–Gee–Pilloni §7.5 beyond the recomputation of
  H¹(Sp₄(F_p), 𝔰𝔭₄) for p = 3, 5, 7.
- The `uses` entries were checked for the existence of the consumer node, not for how each consumer
  uses the object.
- The reader document was not reviewed line by line; it cannot be edited here.
- No search of journal errata pages was made beyond the atlas register; "new" in a source issue means
  not in the register and not corrected in the versions read.

## Questions for the orchestrator

1. **Reader document.** Should a review of this size regenerate the reader document, or is that the
   continuation round's first task? As it stands the document contradicts the packet.
2. **Granularity.** The continuation round has 147 split items in the `remaining` lists. They
   exceed the budget of one packet; should the round split the roadmap into parts by layer, as the
   large roadmaps are?
3. **Brauer–Nesbitt.** The review proves it inside R01.1 instead of creating the edge IHG.1 → R01.1
   that the confirmed fix named. Is that acceptable as the resolution of RT-AREA-langlands-1/17?
4. **G7.** Restructure entry 6 proposes three sub-layers. Until it is applied, the two Hodge–Tate
   nodes make G7 a consumer of PadicHodgeTheory. Should they move to a consumer roadmap instead?
5. **Duplicates in the register.** 22 source issues of this packet repeat entries of paper
   extractions. They are confirmed here with `known` naming the register entry, which the register
   script then lists under "already corrected in print". Should packets cite the register entry
   instead of repeating it?
6. **Owners.** Restructure entry 8 lists seven statements planned both here and in another roadmap's
   packet or stage text (the similitude group, polarized representations, Dickson's classification,
   Frobenius on Tate modules, Brauer–Nesbitt, the monodromy filtration, a Haar-null statement).
7. **Upstream.** Mathlib's `LinearMap.det` and `LinearMap.trace` return 1 and 0 on modules without a
   finite basis; a determinant and trace for finite projective modules would remove freeness
   hypotheses in R01.1 and G7. This concerns Mathlib, not a Tau Ceti roadmap, so it is not in
   `upstreamNotes`.
8. **The blueprint job's handoff** names FiniteFieldsAndCharacterSums FF.2 and
   PadicDifferentialEquationsAndRigidCohomology RD.6 as consumers of ramification theory over
   F̄_q((t)); the review did not check this and removed it from the restructure entry.

## Checked list (original nodes)

| Node | Verdict | Note |
|---|---|---|
| `R01.1/continuous-representation` | corrected | Pass 1: comparison with Mathlib's ContRepresentation, matrix criterion and determinant step corrected. Pass 2: the determinant step now cites three added lemma nodes; the profinite structure of Field.absoluteGaloisGroup is supplied through TauCeti.absoluteGaloisGroupRestrictEquiv (read), with the caveat for imperfect fields; declarations named in the acceptance are prerequisites. |
| `R01.1/framed-representation` | verified | Statement, conjugation example (diag(ℓ,1) conjugates ρ_1 to ρ_2, reductions differ) and tests rechecked; Ribet's sentence read on the page image of p. 154 and is literal. |
| `R01.1/coefficient-extension` | corrected | Pass 1: parts (c), (e) no longer lean on later nodes; (d) for all field extensions. Pass 2: the node is built on Tau Ceti's Representation.baseChange (read) and cites Representation.finrank_intertwiningMap_baseChange for the finite-group case; base change of exterior powers is the added lemma. |
| `R01.1/restriction-dual-tensor-twist` | corrected | Conventions, determinant identities and tests rechecked in pass 1. Pass 2: the unsupplied equivalence of operator-norm and joint continuity is now Mathlib's continuous_clm_apply with the finite-dimensional module-topology lemma; the comparison test names Tau Ceti's conj_linHom; Hom ≅ dual ⊗ cites Representation.dualTensorHom_comm. |
| `R01.1/tate-twist` | corrected | Checked against Mathlib's cyclotomicCharacter in pass 1. Pass 2: the instance hypothesis of cyclotomicCharacter.spec is supplied from ℓ ≠ char F, and the comparison with the modular character cites cyclotomicCharacter.toZModPow. |
| `R01.1/continuous-induction` | corrected | Pass 1: example, topology comparison and locator corrected. Pass 2: the underlying representation is Mathlib's Representation.coind and both Frobenius reciprocities are Mathlib's adjunctions (Rep.resCoindAdjunction, Rep.indResAdjunction, Rep.resIndAdjunction, read); the comparison with ContRepresentation.coind is an isomorphism proved by the added lemma. |
| `R01.1/mackey-decomposition` | corrected | Formula recomputed in pass 1. Pass 2: the node now cites Tau Ceti's Rep.mackeyDecomposition (read: arbitrary subgroups of an abstract group, coinvariant model) for the algebraic isomorphism and plans only the finiteness of the double cosets, the passage to the function model and the ContinuousRep structure. |
| `R01.1/determinant-of-induced-representation` | corrected | Deligne's Proposition 1.2 read on the page image and the computation rechecked in pass 1. Pass 2: the projective non-free case is reduced to the free case by localisation, citing the added determinant lemma. |
| `R01.1/finite-coefficients-and-finite-quotients` | corrected | Pass 1: finiteness of the image for every discrete A. Pass 2: the Artin complement cites the added lemma that a normed real algebra has no small subgroups of units. |
| `R01.1/residual-descent-to-a-finite-field` | corrected | Serre 1987 §1.1 read on the page image in pass 1. Pass 2: the finiteness of the field generated by the matrix entries cites Mathlib's finite-set lemma IntermediateField.finiteDimensional_adjoin. |
| `R01.1/baire-descent-to-a-finite-coefficient-field` | corrected | Compared with BHKT and CG20 in pass 1. Pass 2: countability and closedness of the coefficient fields are the added lemma node, which this node cites. |
| `R01.1/compact-subgroups-stabilise-lattices` | verified | Parts (a)–(c) and the examples rechecked (closure of K is a group, cosets of the open stabiliser meet K); Ribet's remark read on the page image of p. 154, DDT p. 54 and BHKT Theorem 4.8(ii) at their places; IsNonarchimedeanLocalField.isCompact_closedBall gives compactness of the valuation ring. |
| `R01.1/integral-model` | corrected | Pass 1: lattice operations rechecked, excerpt replaced. Pass 2: freeness of a lattice cites Mathlib's instance for finitely generated torsion-free modules over a principal ideal domain. |
| `R01.1/semisimplification` | corrected | Pass 1: algebraic scope stated, excerpt replaced. Pass 2: Jordan–Hölder is taken in submodules of V.asModule and the multiplicities are Tau Ceti's (read); the wrong claim of a Mathlib instance on subrepresentations is removed; the perfect-field statement is the added lemma. |
| `R01.1/absolutely-irreducible` | corrected | Pass 1: (iv) ⇒ (iii) for all fields, sources corrected. Pass 2: Burnside's criterion over an algebraically closed field is cited from Tau Ceti (both directions, read) and the node is narrowed to field extension, (ii), (iv) and the ContinuousRep predicate; Schur and the density theorem cite Mathlib declarations. |
| `R01.1/brauer-nesbitt` | corrected | Rebuilt in pass 2 on the classical proof: (a) from R01.1/brauer-nesbitt-algebraically-closed and R01.1/semisimplification-detected-after-field-extension, (c) by continuity of linear maps; no node or stage of IntegralHeckeAndGaloisDeterminants remains among its prerequisites and the IHG.1 request is removed. The trace statement is R01.1/brauer-nesbitt-traces. |
| `R01.1/reduction-and-residual-semisimplification` | corrected | Pass 1: excerpt replaced, missing supplier for the residue field of Q̄_ℓ noted. Pass 2: that supplier is the added lemma node; the request to LocalFieldsRamification Layer 2 made in pass 1 is withdrawn because the layer's text does not cover the statement. |
| `R01.1/continuity-descent-and-lattice-independence` | corrected | Pass 1: the chain-of-lattices proof of (b) written out. Pass 2: that proof cites Tau Ceti's additivity of Jordan–Hölder multiplicities (read); Brauer–Nesbitt, now proved inside the stage, is used only for the last clause of (d). |
| `R01.1/coefficient-frobenius-twist` | corrected | Twist identities, the two consequences (inertia, Frobenius lifts) and the tests rechecked; the congruence (1.1) of Newton–Thorne verified on Brauer characters (Σ_{i=0}^{p+r−1} a^i b^{p+r−1−i} splits as stated) and its range of r added. The Layer 2 and Layer 4 requests are precise and needed. |
| `R01.1/teichmuller-lift-of-a-residual-character` | corrected | Pass 1: missing step for F̄_ℓ-valued characters added. Pass 2: that step rests on the added lemma on the residue field of Q̄_ℓ (roots of unity of order prime to ℓ reduce bijectively). |
| `R01.1/ribet-nonsplit-lattice` | corrected | Proposition 2.1 and its proof read on the page images of pp. 154–155, Theorem 1.3 on p. 152: K finite over Q_p, V of rank 2, any group stabilising a lattice, ρ simple with reducible reductions; the node keeps exactly these hypotheses and the proof steps follow Ribet (conjugation formula recomputed). Corrected an impossible example and two imprecise clauses. |
| `R01.1/self-dual-lattice-for-absolutely-irreducible-residual` | verified | (a) Nakayama argument, (b) the parity bookkeeping (Λ^⊥ = ϖ^mΛ, rescaling changes m by −2j, c = ϖ for odd m) and (c) the symplectic basis recomputed; CG20 pp. 839 and 843 read, and the step the node fills is the one recorded as E101. |
| `R01.1/semisimplicity-under-restriction-and-induction` | corrected | (a)–(d) reproved and the failure examples recomputed in pass 1. Pass 2: the first clause of (a) cites Tau Ceti's Clifford theorem isSemisimpleRepresentation_comp_subtype (read); the node keeps the isotypic shape over an arbitrary field and (b)–(d). |
| `R01.1/reductive-integral-models` | corrected | Compared with BHKT Theorem 4.8 and its proof (pp. 16–17): the node's (i), (ii) are BHKT's (ii), (iii), with the same hypotheses (Ĝ split reductive over Z, no condition on ℓ), and each step of the proof is BHKT's; the two gaps (pseudocharacters and Theorem 4.5; Larsen's Lemma 2.4) are exactly the inputs BHKT quotes, and the RG2.2 request covers the Bruhat–Tits inputs. Only change: the reduction of the Baire step to GL_N through a faithful representation is now said. |
| `R01.2/decomposition-group-at-a-place` | corrected | Statements (i)–(v), the conjugation formulas, the Gaussian and S_3 computations and the Deligne 3.12 transcription (page image Del-33) were checked. Corrected: wild inertia is defined intrinsically, and an acceptance item that silently used self-normalisation of decomposition groups is restated. Second pass: ι^* is mapOfAlgebra (not map); Krasner's step is the new node algebraic-closure-of-a-completion-is-generated-by-the-global-closure, proved from Mathlib's IsKrasner.krasner, and layer 0 is no longer a prerequisite; Tau Ceti's Frobenius existence and restriction lemmas and the local-field instance of the completion are cited. |
| `R01.2/local-restriction` | corrected | Checked (a), (b), the Mackey formula, the kernel-field statement and both examples. Corrected a false remark (the comparison isomorphism is ρ(ι^{-1}∘ι'), independent of σ and τ_0, and ρ(D) does not consist of automorphisms), and the Gaussian example, which fails when 2 is not invertible in the coefficients. |
| `R01.2/unramified-and-ramification-set` | corrected | Definitions, independence of the place, the finite-image statement, both acceptance items and the Deligne 2.3 and CG20 excerpts were checked (page image Del-23; CG20 PDF p. 13 = published p. 813). Corrected: the field F_S in the factorisation statement is made precise at the archimedean places. Second pass: the finite set of ramified primes of the kernel field is Tau Ceti's NumberField.Chebotarev.ramifiedPrimes, now cited. |
| `R01.2/frobenius-characteristic-polynomial` | corrected | Well-definedness, the dual and reversal identities, the twist formula and all examples were recomputed; CG18 literal; Deligne 2.2.3 read on the page image. Corrected: the Deligne excerpt (a dropped '⥲ Ẑ'), its locator, and the restriction API item, which was not a statement over a general ring. |
| `R01.2/unramified-character-lambda` | corrected | Existence criteria (profinite R^×, E/Q_ℓ, C), the geometric variant, the Weil-group variant, restriction and reduction were checked; CG18 literal, CG20 on PDF p. 7 (published p. 807). Corrected: the existence criterion (extension to Ẑ, not mere profinite continuity on Z) and the missing Hausdorff hypothesis for uniqueness. Second pass: Mathlib's ProfiniteCompletion.completion, eta and denseRange are cited and the universe and bundling restrictions of lift are stated. |
| `R01.2/cyclotomic-and-dirichlet-characters` | corrected | (a)–(e) were checked, with the Frobenius values, the ramification of ε_Gal (conductor), ε_Gal(c) = ε(−1) and the p = 2 Teichmüller convention; Deligne 2.3 read on the page image, CG20's Hodge–Tate sentence found on PDF p. 6 (published p. 806). Corrected: (d) needs an open kernel (or Hausdorff R), and a Mathlib theorem used by name in step (c) is added to the prerequisites. Second pass: cyclotomicCharacter.toZModPow, galEquivZMod_stabilizer and galEquivZMod_restrictNormal_apply are cited; (e) says what TauCeti.teichmuller gives and what the node adds (identification with Z_p, the splitting, p = 2). |
| `R01.2/ell-adic-tame-character` | corrected | (i)–(vi), the non-extension argument and the examples were checked; Deligne 2.2.2 was read on the page images Del-21 and Del-22. Corrected: an acceptance item false in dimension ≥ 4, and the Deligne excerpt (the source has Ẑ(1)(k̄), not Ẑ'(1)(k̄)). Second pass: the unused prerequisite LocalFieldsRamification layer 3 is removed. |
| `R01.2/tame-inertia-and-fundamental-characters` | corrected | Serre 1972 Proposition 2, Proposition 3 and the fundamental characters of 1.7 (printed pp. 264, 265, 267 = PDF pp. 7, 8, 10) and Serre 1987 2.1 (p. 183 = PDF p. 5) were read on the page images and agree with the node; the level, the Frobenius conjugation rule, ψψ' = ω and the Q_p(μ_p) computation were recomputed. Corrected: a false identity in an API item and an excerpt taken from a garbled OCR layer. Second pass: layer 3 removed; rootsOfUnityEquivResidueFieldUnits is applied to an unramified extension (this uses layer 2); the Teichmüller lift is stated with values in the integers of the unramified extension. |
| `R01.2/tame-semisimple-residual-local-representations` | corrected | Serre 1972 Proposition 4 and Serre 1987 Proposition 1, its proof and 2.2 were read on the page images and are transcribed correctly; (a)–(d) were re-derived. Corrected: the reducible case of (d) is false for p = 2, and the proof of irreducibility cited a Mackey criterion whose hypotheses (group order invertible) fail at p = 2; it is replaced by a direct argument and the request is withdrawn. |
| `R01.2/grothendieck-quasi-unipotence` | corrected | Deligne 8.1–8.2 were read on the page image (Del-66): hypotheses (nonarchimedean local field, E_λ finite over Q_ℓ, representation of the Weil group), the Tate-twisted N and the relation with q^{v'(w)} agree with the node. The proof was checked step by step for finite residue fields and is complete once the ℓ-adic log/exp lemma is supplied; that hidden lemma is now named in the step, one step is completed, and process remarks are removed. Second pass: the proof is restructured (Serre–Tate's eigenvalue argument) so that it needs only the finite exponential and logarithm of the new node nilpotent-exponential-and-unipotent-logarithm; the hypotheses say that only finite residue fields are treated. |
| `R01.2/weil-deligne-representation` | corrected | Définition 8.4.1 and the proof of Lemme 8.4.3 were read on the page images (Del-68, Del-69); the relation r(w)Nr(w)^{-1} = q^{weilDegree(w)}N agrees with (8.4.1.1) and with FSY's p^{-v(w)} (v counting geometric Frobenius). Sp(n), the duals, the rescaling isomorphism and all tests were recomputed. Corrected: the monodromy of an induced object is made explicit (the coset-wise operator needs the factor q^{-weilDegree}), and one transcription. Second pass: the API item iso_smul_monodromy points to the new lemma node rescaling-the-monodromy-operator. |
| `R01.2/grothendieck-monodromy-and-the-weil-deligne-functor` | corrected | 8.2, 8.3.5–8.3.7, 8.4.1–8.4.3 and 8.12 were read on the page images (Del-66 to Del-72). ρ' is a homomorphism, the relation for N', the invariants identity, the extension criterion to G_K and the examples were re-derived. Corrected: the conjugating element for a change of Frobenius lift (the packet copied Deligne's constant, which is wrong for F ↦ Fτ; verified numerically), the range of a in the change of trivialisation, the proof step that deferred to the source's incorrect display, a quotation of FSY's misprinted (5.32), and three transcriptions. Second pass: independence of the trivialisation and the bijection of 8.3.7 cite the new nodes rescaling-the-monodromy-operator and ell-adic-representation-of-a-weil-deligne-representation. |
| `R01.2/frobenius-semisimplification` | corrected | Deligne 8.5 and Définition 8.6 were read on the page image (Del-70) and the three excerpts are literal; commutation of u with r(W_K) and N, independence of F, the three objects, the examples and the API items were re-derived (r and r^{F-ss} have the same trace on W_K, so the same L- and ε-factors). The final classification statement has no source and only a sketched proof: recorded as a gap, and two missing prerequisites are added. Second pass: the library citations are corrected (unipotent-part lemmas of Tau Ceti instead of a statement about the semisimple part; an unused Mathlib theorem removed), the cycle with the purity node is broken by the new node monodromy-filtration, and the gap for the classification lists exactly what is missing. |
| `R01.2/local-euler-factor` | corrected | (3.5.1) (Del-28), (3.5.2)–(3.5.3) (Del-29) and 8.12 (Del-72, 170 dpi) were read on the page images; the factor uses the geometric Frobenius on (ker N)^{I}, X = t^d = q^{-s}, and all examples (ω, Sp(2), Sp(2)^∨, Tate curve invariants against coinvariants) were recomputed. Corrected: the letter Φ denoted a geometric lift here and an arithmetic lift in the neighbouring nodes. |
| `R01.2/local-factor-of-induced-representation` | corrected | Proposition 3.8 (Del-30) and Lemme 3.9 (Del-31) were read (page image and text layer); (a), (b), the P_v formula and both examples were recomputed (X² − 1 for the inert primes of Q(i)). Only change: the node now says that it extends Deligne's complex statement to Weil–Deligne representations over Ω. Second pass: the proof cites the new nodes determinant-of-a-cyclic-block-endomorphism and inertia-invariants-of-an-induced-representation. |
| `R01.2/purity-of-weil-deligne-representations` | corrected | FSY §5.3.2 (arXiv v5 p. 57, text layer, literal) was compared: monodromy filtration, purity with the geometric Frobenius and weights w + a agree. Sp(2) of weight −1, ω of weight −2, the non-example and the independence of the Frobenius lift were recomputed. Corrected: an unused embedding ι that contradicted the definition of Weil numbers (statement and API), and the field in which eigenvalues live. Second pass: the monodromy filtration is the new definition node monodromy-filtration, on which this node depends. |
| `R01.2/pure-graded-weil-deligne` | corrected | FSY Lemma 5.40 and its proof (arXiv v5 p. 58, text layer) were read: hypotheses (ℓ ≠ p, G-stable flag, Weil–Deligne representation of the graded pure) and conclusion agree; the generalisation from Q_p to K is declared. The Tate-curve acceptance item was recomputed. The proof's central step is only asserted in the source; a complete argument (rank inequality, eigenvalue strings, convexity) is added to the proof step. Second pass: the count in the proof is the new lemma node purity-from-a-pure-graded. |
| `R01.2/local-epsilon-factor` | corrected | Théorème 4.1 (1)–(4) (Del-35), (3.4.3.1)–(3.4.3.5) (Del-28), 3.12 (Del-33), (5.1)–(5.5.2) (Del-48) and (8.12.3)–(8.12.4) (Del-72) were read on the page images and FSY (5.31)–(5.33) in the text layer; the definition for Weil–Deligne representations agrees with both (FSY's ε_0 is Deligne's ε). ε(Sp(2)) = −1 recomputed. Corrected: the letter for the geometric Frobenius and the wording of the class-field-theory conversion. Existence stays conditional on the two recorded gaps. Second pass: the dictionary with AL.1's ε(s, ω, ψ) is stated as an API item with all normalisations and verified for unramified and ramified characters; the character item and the test epsilon_eq_tate are precise. |
| `R01.2/weil-deligne-required-examples` | corrected | Every example was recomputed: WD(Q_ℓ(1)) = (ω, 0), L = 1 − q^{-1}X, weight −2; λ(α): L = 1 − α^{-1}X; Tate curve: inertia acts by e_2 ↦ e_2 + v(q_E)t_ℓ(σ)e_1, WD ≅ Sp(2) with arithmetic Frobenius q on ker N, Euler factors 1 − q^{-1}X, 1 − X and 1 + X (non-split dual), weight −1, residual unramifiedness iff ℓ / v(q_E). All correct. Only change: one transcription in a source excerpt (τ, not T). |
| `R01.3/breaks-and-swan-conductor` | corrected | Definitions and the three expressions for Sw checked against Ulmer §§3–4, DDT §2.1, Serre 1970 n° 2.1 and Serre 1987 (1.2.2); Q_2 examples recomputed. Pass 1: two locators, the well-definedness clause, Ulmer's unclosed union (E350). Pass 2: the filtration is placed on Gal(K^sep/K) through TauCeti.absoluteGaloisGroupRestrictEquiv, the local-field class is a hypothesis, and the existence of L and the finiteness of ρ(P_K) are separate lemma nodes. |
| `R01.3/artin-conductor-with-its-wild-part` | corrected | Definition checked against Serre 1987 (1.2.1)–(1.2.2), Ulmer §§4, 6, 8 and DDT §2.1; Steinberg lattice test and dyadic examples recomputed. Pass 1: three locators corrected. Pass 2: the local-field class is stated as a hypothesis. |
| `R01.3/hasse-arf-integrality` | corrected | Checked against Serre 1961 n° 3.7 (Théorème 2, Proposition 10), Serre 1987 (a)–(c), Serre 1970 n° 2.1. Pass 1: proof steps 2, 3, 5 rewritten, locators corrected. Pass 2: the cycle through the induction formula is broken (step 4 cites the new node R01.3/local-induction-formula), and steps 3 and 5 cite the new lemma nodes for the existence of L and the orbit formula. |
| `R01.3/conductor-of-a-weil-deligne-representation` | corrected | Definition and comparison checked line by line against Ulmer §§6–8 (geometric-Frobenius convention there, arithmetic here: consistent); sp(n) ⊗ χ examples and the non-example recomputed. Locators corrected. |
| `R01.3/global-conductor-and-prime-to-p-conductor` | corrected | Checked against Serre 1987 (1.2.3) and DDT §2.1; examples (χ_{−4}, 11a1 at ℓ = 3, 5, the mod-p cyclotomic character) recomputed. One locator corrected. |
| `R01.3/additivity-twist-and-unramified-invariance` | corrected | Parts (a)–(e) rechecked. Pass 1: Brumer–Kramer and Ulmer locators and matches, (b) strengthened to all V, E351. Pass 2: the library declarations are named in the steps, and the tame base change for a non-Galois extension cites the new lemma on ψ_{L/K}. |
| `R01.3/induction-formula-for-conductors` | corrected | Local formula checked against Brumer–Kramer (2.5) and Serre 1961 (31), (34); examples recomputed. Pass 2: the local statement is proved in the new node R01.3/local-induction-formula, which this node and hasse-arf-integrality both cite; /d_M/ is the natAbs of Mathlib's signed discriminant. |
| `R01.3/reduction-does-not-increase-the-conductor` | corrected | Direction and equality cases of (a)–(c) checked against DDT Lemma 2.7, Ulmer §6 and Serre 1970 Remarque 2; Steinberg and 11a1 examples recomputed. Ulmer locators corrected and one match that misread Ulmer's semisimplification as a reduction rewritten. |
| `R01.3/tame-conductor-computations` | corrected | All computations rechecked. Pass 1: the cubic case over Q_3 proved for every ramified character of order 3. Pass 2: the Tate curve is cited from EllipticCurves layer 4 (every nonarchimedean local field), not from the R01.2 example node (K/Q_p only). |
| `R01.3/artin-schreier-swan-conductor` | corrected | Computation of the break redone (π_L = α^a π_K^b, valuation m of σ(π_L)/π_L − 1); Deligne (8.12)–(8.13) and Serre 1961 Lemme 4 read on the page images. The Ulmer match was false (Ulmer computes no Artin–Schreier conductor) and is rewritten; an unused prerequisite and request removed. |
| `R01.3/conductor-of-an-elliptic-curve` | corrected | Definition and (i)–(iv) checked against Serre 1970 n° 2.4, Brumer–Kramer (6.1), DDT §1.1; examples recomputed. Pass 1: locators, routine proof of (ii), twists, the Serre–Tate gap. Pass 2: the Tate curve is cited from EllipticCurves layer 4 for every K, and the trichotomy lemma is named. |
| `R01.3/ogg-formula` | corrected | Statement checked against Liu p. 51, DDT Remark 2.14, Milne p. 165 and Brumer–Kramer p. 245; case table and examples recomputed; suppliers read. Pass 1: m made precise, descent step, exact requests, gap rewritten. Pass 2: the step using valuation_Δ_eq_of_isMinimal_smul is named. |
| `R01.3/saito-conductor-discriminant` | unverifiable | Saito 1988 is not among the sources and could not be obtained; the node was checked only against Liu's quotation (pp. 51, 58–59 on the page images) and the count χ(X_k̄) = m − 1 + ε was recomputed. Pass 2: the statement is scoped to the minimal regular model, as Liu states it, and the definition of Art(X/S) is kept inside the gap (it needs étale cohomology that the atlas lacks upstream). |
| `R01.3/elliptic-conductor-exponent-bounds` | corrected | Bounds checked against Brumer–Kramer Theorem 6.2, Lemma 6.8 and Serre 1987 §4.9. Pass 1: wrong attribution, hypothesis of (c), Bennett–Siksek quotation. Pass 2: Serre's Proposition 9 is a node (non-strict form); the planned proof gives 2 + 3e_K at p = 3 and 2 + 8e_K at p = 2, and the dyadic bound 2 + 6e_K stays on the gap (Brumer–Kramer Theorem 5.5). |
| `R01.3/residual-elliptic-conductor-away-from-ell` | corrected | Checked against Serre 1987 (4.1.12) and Lemme 5 with its criterion (a), (b), and Bennett–Siksek (3); (a)–(d) and the global formula rechecked. The Milne citation concerns a different curve (discriminant −11, not 11a1) and is corrected and turned into an acceptance item; the hypothesis for ℓ = 2, 3 corrected; twists added as prerequisite. |
| `R01.4/odd-representation` | corrected | Pass 1: Serre 1987 1.3 and 3.3 read on page images, KW I, ACC+; convention (c), the char-two test and the base-change converse corrected, locators and a match fixed, two tests added. Pass 2: modularCyclotomicCharacter replaces cyclotomicCharacter, the determinant is the one of R01.1/continuous-representation, listed prerequisites named; Lean statement of isOdd_baseChange corrected. |
| `R01.4/odd-irreducible-implies-absolutely-irreducible` | corrected | Serre 1987 3.3 read on the page image; (a)–(c), the F_2 and F_5 examples and E[2] of y² = x³ − 2 recomputed and found right. Corrected the claim that Serre's remark has a gap (E401 rejected), re-transcribed a non-literal excerpt, removed a superfluous step and prerequisite, and tied the unused Tau Ceti prerequisite to the step that needs it. |
| `R01.4/dickson-classification-and-the-dyadic-refinement` | corrected | Pass 1: (e) needs absolute irreducibility, a wrong example and the closure of (c) corrected. Pass 2: Dickson §§251–257 and 259–262 read on page images; the proof of (a) now follows Dickson's count through two new nodes (prime-to-p case; several Sylow p-subgroups, with the dihedral and icosahedral exceptions); the four Dickson excerpts are confirmed on the image. |
| `R01.4/subgroups-of-gl2-over-a-prime-field` | corrected | Pass 1: Serre §2.3–2.7 read on page images, (a)–(e) checked on all subgroups of GL_2(F_ℓ), ℓ ≤ 5; scope of ℓ ≠ 5 in (d), a proof step and a CM instance corrected, sources for Prop. 18 added. Pass 2: unused library prerequisites removed, Cauchy added, (a) and (b) now cite the new lemma nodes (two transvections; prime-to-p subgroups). |
| `R01.4/cartan-subgroups-and-normalisers` | corrected | Pass 1: q ≥ 3 added in three places, N(C_ns) and a CM instance corrected, API for the half-Cartan and Serre's Prop. 14 added. Pass 2: the Tau Ceti declarations that already give the tori, their orders, indices and centralisers are cited with their exact names and arguments, and the node is narrowed to what it adds; Lean: IsCartan no longer vacuous for infinite k, two statements corrected, two items added. |
| `R01.4/p-subgroups-and-borel-subgroups` | corrected | Statement verified in pass 1 (one proof step completed). Pass 2: the fixed vector is taken from Tau Ceti's theorem on unipotent representations and (ii) from natCard_GL_fin_two, GL2Borel.equivProd, index_eq and stabilizer_infty; one unused Mathlib prerequisite removed. |
| `R01.4/dihedral-projective-image-iff-induced` | corrected | Pass 1: (d) corrected (scalar case, Klein four), notations, the reciprocity map and the Klein example fixed. Pass 2: the Clifford request is replaced by Tau Ceti declarations (conjSubrep, iSup_conjSubrep_eq_top), the Klein case is the new lemma node, the characteristic-0 criterion is cited with its finite-group scope. |
| `R01.4/bad-dihedral-representation` | corrected | Pass 1: definition checked against Dieulefait–Pacetti 1.12 and DDT 2.49; the extension to number fields declared; three statements made precise, two tests added. Pass 2: autEquivPow used over ℚ only, the injection autToPow_injective for a general F; Lean: isInduced now states [F′ : F] = 2, two tests added. |
| `R01.4/bad-dihedral-representations-and-the-oddness-criterion` | corrected | Pass 1: statements verified, two proof steps repaired, the generalisation over the source declared. Pass 2: 'cyclic' now rests on IsPrimitiveRoot.autToPow_injective and ZMod.isCyclic_units_of_prime_pow instead of autEquivPow, whose hypothesis fails over a general number field. |
| `R01.4/image-of-restriction-to-a-subfield` | corrected | ACC+ Lemma 7.1.6 with proof (p. 1090) and NT26 Theorem 4.1 (p. 26) read; (a)–(e) rechecked. Corrected (f) (bad dihedrality is not a property of the image alone; counterexample), removed a superfluous Galois hypothesis in (d) with a proof, and fixed the condition on d in an example. |
| `R01.4/normal-subgroups-and-automorphisms-of-psl2-pgl2` | corrected | Pass 1: (a), (b) and the abelianisations verified on all normal subgroups for q ≤ 9, (e) made precise; (c) rests on Dieudonné/Steinberg (gap). Pass 2: the deprecated A_5 instance replaced, PSL_commutator_eq_top named, the private Mathlib bridge reproved in one line; the Dickson §261 excerpt confirmed on the page image. |
| `R01.4/restriction-to-the-cyclotomic-field` | corrected | Pass 1: twist in (h), a vague clause in (d), an undeclared weakening in (e), a page and the proof of (c) corrected; (b), (c), (g) verified by enumeration. Pass 2: the inclusion Gal(F(ζ_p)/F) ⊂ (ℤ/p)^× is the injection autToPow, and (e) now derives Gal(F′(ζ_p)/F′) ≅ (ℤ/p)^× from Tau Ceti's irreducibility of Φ_p over a field unramified at p. |
| `R01.4/large-image-persistence` | corrected | Pass 1: a false instance (the weight-26 form is ordinary at 107), a page, two matches corrected. Pass 2: (a) cites the new node on Galois's theorem (Dickson §262, read on the page image); the Dickson excerpt is confirmed. |
| `R01.4/characteristic-two-residual-image-facts` | corrected | Pass 1: KW II Lemma 4.3 read; (b)–(d) verified by computation for q = 4, 8, 16; the case F_0 = F_2 corrected; the cohomology request replaced by Mathlib's groupCohomology. Pass 2: the node says that all H⁰/H¹ are Mathlib's cohomology of the finite group SL_2(F_0); Schur replaced by a direct computation. (c) for general r still rests on Dickinson's unread Lemma 42 (gap). |
| `R01.5/frobenius-density` | corrected | Pass 1: derivation from finite-level Chebotarev checked, exact density proved, statement (c), one acceptance item and one hypothesis corrected. Pass 2: the lift-restriction step now rests on two pinned Tau Ceti declarations and the NumberFieldArithmetic layer-2 request is dropped. |
| `R01.5/every-element-of-a-finite-image-is-a-frobenius` | corrected | Statement and the three examples recomputed (ℤ/3 quotient of (ℤ/7)^×: density 2/3; order-3 element of GL_2(F_2)); the consequence clause made precise, the lift-restriction step tied to frobenius-density, scan excerpts retranscribed. |
| `R01.5/prescribed-quadratic-residue-symbols` | corrected | Pass 1: equivalence and examples checked, proof completed for dependent families and for 'every Frobenius'. Pass 2: the Galois group of the multiquadratic field is taken from three pinned Tau Ceti declarations (read) instead of a request. |
| `R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent` | corrected | Pass 1: hypotheses corrected (Hausdorff common field with continuous embeddings, unramified on Σ), density step re-cited, trace warning made precise. Pass 2: Brauer–Nesbitt citations follow the new R01.1 nodes. |
| `R01.5/brauer-class-of-an-absolutely-irreducible-representation` | corrected | Pass 1: construction, API and tests checked; characteristic-polynomial relation added. Pass 2: the Brauer class, its base change, the Wedderburn presentation and the Schur index are expressed through pinned Tau Ceti declarations (read; the index and base change exist in the library although the node requested them), two requests removed and the layer-4 request narrowed to the reduced characteristic polynomial. |
| `R01.5/descent-obstruction` | corrected | Pass 1: statement rederived, proof steps completed. Pass 2: the two hidden arguments (trace determines an absolutely irreducible representation; extension of a simple module to the algebraic closure) are now lemma nodes and the steps cite them. |
| `R01.5/finite-field-realisability` | corrected | Statement compared with Lemme 6.13 on the page image (printed p. 523): identical hypotheses (k' finite, φ semisimple, k containing the coefficients of det(1 − φ(s)T)). Examples recomputed (conjugates of GL_2(F_2) in GL_2(F_4); χ ⊕ χ over F_4). The passage from F̄_p back to k' was missing in the proof and is added. |
| `R01.5/rational-eigenvalue-descent` | corrected | Statement identical to BLGGT Lemma A.1.5 read on the rendered page 85 (M of characteristic 0, r into GL_n(M̄) semisimple, traces in M, one element with distinct M-rational eigenvalues); proof followed line by line and the two unproved implications written out; examples checked. |
| `R01.5/haar-measure-chebotarev` | corrected | Pass 1: (a)–(d) rederived, (e) corrected for conjugation-stability, sources retranscribed. Pass 2: the measure is Tau Ceti's haarProb (Mathlib's Measure.haar is not normalised), and the two hidden measure-theoretic arguments of (e) are lemma nodes; the gap is narrowed to non-open images. |
| `R01.5/carayol-lifts-recognition` | corrected | Pass 1: (a)–(c) rederived; trace form added with proof. Pass 2: the statement no longer rests on an unread source (attribution caveat in the hypotheses), the inner-automorphism step is a lemma node, two unused prerequisites removed, the IHG.1 request restated. |
| `R01.5/gsp4-semisimplicity-criteria` | corrected | Pass 1: statement compared with BCGP25 §4.11, attribution, two acceptance items and the density citation corrected. Pass 2: the Goursat step restated and tied to G7/zariski-closure-and-monodromy-groups; the remaining algebraic-group inputs of part (b) recorded as a gap. |
| `R01.5/potentially-abelian-representations` | corrected | Pass 1: statement compared with BCGP25 Lemma 10.2.3, direction of the Galois action corrected, source slip recorded. Pass 2: Clifford's theorem is cited from R01.1/semisimplicity-under-restriction-and-induction (a) and the redundant request and an unused prerequisite are removed. |
| `R01.5/curve-recognition-from-an-open-subset` | corrected | Pass 1: statement checked against Kisin–Zhou Proposition 5.3.5; Chebotarev supplier corrected to FunctionFieldArithmetic FA.5. Pass 2: the proof step and the request state the finite-level theorem actually used; an unused prerequisite removed. |
| `R01.6/tate-module-of-an-abelian-variety` | corrected | Pass 1: Milne AV Remark 7.3 and Prop. 10.5 read; rank, continuity, kernel and tests checked; "canonical" isomorphism corrected, an API item depending on A4 removed, two API items added, Milne EC locator moved to the second edition. Pass 2: the identification with Gal(K^sep/K) cites Tau Ceti absoluteGaloisGroupRestrictEquiv; listed library declarations are named where they are used. |
| `R01.6/torsion-and-residual-representation` | corrected | Pass 1: ψ claim false for ℓ = 2; quotient by a stable line is Tau Ceti Layer 1 (Vélu); DDT pages. Pass 2: the twist step uses the pinned declarations for the Galois action on a quadratic twist (by a separable quadratic extension) instead of the bare model quadraticTwistOf; the count of E[ℓ] is cited from the library. |
| `R01.6/elliptic-tate-module-comparison` | corrected | Pass 1: sign of the canonical polarization and of the pairing comparison; A1 owns the identification; prerequisites; Milne EC locator. Pass 2: TauCeti.Isogeny.toPointHom is not in the pinned library: the point map is now a requested Layer 1 milestone. |
| `R01.6/functoriality-products-and-isogenies` | corrected | Milne AV pp. 45, 52, 142 read; cokernel formula rederived by Hom(Q_ℓ/Z_ℓ, −). Corrected: a false surjectivity claim in the proof (inseparable isogenies), "exponent" of the kernel, and base change extended to non-algebraic extensions (completions). |
| `R01.6/weil-pairing-on-tate-modules` | corrected | Pass 1: (iv) owned by A2/rosati-involution; (vi) for ℓ ∤ deg λ; API cycle removed; proofs of (v) and of alternation at ℓ = 2. Pass 2: the similitude property is stated directly and G7/similitude-groups is no longer a prerequisite (GSp form kept as a compatibility API item); roots of unity taken in one field; instance hypothesis of cyclotomicCharacter.spec discharged. |
| `R01.6/determinant-and-oddness` | corrected | Pass 1: integral determinant needs no condition on deg λ; (b) cited from Tau Ceti Layer 2; eigenlattices and ℓ = 2; locators. Pass 2: det h = μ^g is the new lemma node (not G7); the Pfaffian sentence removed; χ_ℓ(c) = −1 and the dimension bound for isotropic subspaces cite the Mathlib statements they need. |
| `R01.6/good-reduction-frobenius-polynomial` | corrected | Pass 1: elliptic case through Tau Ceti Layer 4; planning remarks removed; missing inputs recorded; Milne EC and DDT locators. Pass 2: (a), (b) cite the new lemma on specialisation of torsion; (e) goes through the new bridge lemma between Tau Ceti's isogeny degree and determinants on T_ℓ, and now uses degree_frobeniusIsogeny. |
| `R01.6/comparison-with-weierstrass-local-polynomial` | corrected | Pass 1: Mathlib localPolynomial read and the branches compared; dependence on the abelian-variety import removed; locators. Pass 2: the additive case is proved (potential good reduction: finite inertia of determinant 1; non-integral j: ramified quadratic twist of a Tate curve), so the comparison holds at every prime; library declarations named; the twist step uses the pinned declarations. |
| `R01.6/local-euler-factor-of-an-abelian-variety` | corrected | Invariant/coinvariant forms, degree and examples checked. Corrected: a planning remark in (b) and the DDT page. |
| `R01.6/tate-module-with-endomorphism-coefficients` | corrected | Pass 1: freeness caveat and λ-torsion corrected; reduction of endomorphisms supplied by NeronModels R11.1; locators. Pass 2: the trace-form step cites Mathlib traceForm_nondegenerate and the rank-two determinant lemma of Tau Ceti. |
| `R01.6/galois-generic-abelian-varieties` | corrected | Pass 1: independence of the polarization; match of the third source. Pass 2: the similitude group of the lattice is defined in the node (no prerequisite on G7/similitude-groups; G7/zariski-closure-and-monodromy-groups kept for the density argument); the adelic definition is marked as the standard formulation, Pink not read. |
| `R01.6/serre-independence-and-connectedness` | unverifiable | Statement compared with Richard–Yafaev Theorem 4.9 and Definition 2.4 and corrected (a clause not in the theorem, conjectured proof steps and their prerequisites removed). The proofs are in Serre's Œuvres IV, Serre 2013 and Larsen–Pink, which are not on disk. |
| `R01.6/noot-specialization` | corrected | Pass 1: Noot pp. 163–165 read on page images; reason for not stating Proposition 1.3 corrected; Corollary 1.5 hypothesis; Igusa attribution. Pass 2: the unused spreading-out prerequisite and its request removed; the input of Proposition 1.3 is a request to IG.2; the finite étale gap is narrowed to the normal-base case used here. |
| `R01.6/required-examples` | corrected | Pass 1: all counts recomputed; Milne EC citation replaced by Gauss's curve; supersingular statement restricted to residue field F_p; locators. Pass 2: example (2) cites the new Tate-curve lemma; the unused prerequisite removed. |
| `G7/symmetric-and-exterior-powers` | corrected | Pass 1: statement and identities checked; proof of the characteristic-polynomial identities, the characteristic-p non-example and its test corrected. Pass 2: T^d is the existing Representation.tensorPower; the coefficient ring is in universe 0 for Sym; the universal characteristic-polynomial identity is the new lemma G7/charpoly-of-symmetric-and-exterior-powers; the two diagonal-basis trace lemmas are cited for what they say. |
| `G7/tensor-induction` | corrected | Pass 1: construction, restriction, trace formula and Asai case checked; CG20 citation, two acceptance items (E720) and the 'other extension' claim corrected. Pass 2: the characteristic polynomial of (⊗-Ind ρ)(g) is stated, for all g and explicitly in index two; independence of the transversal and the cyclic-permutation computation are the new lemmas G7/tensor-induction-independent-of-transversal and G7/charpoly-of-cyclically-permuted-tensor-product. |
| `G7/restriction-of-scalars` | corrected | Pass 1: statement checked; two proof steps, a duplicate test name, a test and a use corrected. Pass 2: the characteristic polynomials are those of R01.2 (LinearMap.charpoly needs free modules), in the statement and in the API item. |
| `G7/adjoint-representations` | corrected | Pass 1: clauses (i)–(viii) checked at p / n; CG20 citation, perfectness step, the mixed case A = Z_p and a rank-two item corrected. Pass 2: the trace is the contraction trace for finite projective M (Mathlib's LinearMap.trace is 0 for non-free modules), with an API item and two tests; perfectness of the trace pairing is the new lemma G7/trace-pairing-on-matrices-is-perfect; the library comparisons are cited by name. |
| `G7/similitude-groups` | corrected | Pass 1: BCGP21 and CG20 use the same J; transpose convention, Mathlib comparison and CG20 citation corrected. Pass 2: det g = ν^m is reduced to Mathlib's SymplecticGroup.det_eq_one (no Pfaffian), the rank-two case is cited from Tau Ceti, and the comparison with Matrix.symplecticGroup is stated on sets of matrices. The lead keeps this node as the owner of GSp with its multiplier. |
| `G7/polarized-representation` | corrected | Pass 1: read against BLGGT §2.1 and CHT Lemma 2.1.1; the totally real case, the l > 2 restriction, the typing of ε and terminology corrected. Pass 2: the unused prerequisite complexConj is now used (c_v restricts to complexConj F, by isConj_complexConj) and the Mathlib predicates are named; the comparison of polarizations with CHT triples and the rank-two totally real example needed −μ(c_v), resp. det ρ(c_v), to be a sign (A a domain, or 2 ∈ A^× and Spec A connected), which is now stated in clause (c), an acceptance item and two tests. |
| `G7/polarization-sign-and-determinant` | corrected | Pass 1: (1)–(5) recomputed and read against BLGGT, CHT and BCGP21; the symplectic clause of (2), the torsor statement of (4) and a locator corrected; the 𝒢_n node added as prerequisite. Pass 2: one hypothesis line follows the new proof of det g = ν^m in G7/similitude-groups. |
| `G7/operations-on-polarized-representations` | corrected | Pass 1: all eight operations recomputed; two wording repairs. Pass 2: the value (χ ∘ Ver)(c_v) = 1 is derived from Mathlib's cycle formula for the transfer. |
| `G7/oddness-at-real-places` | corrected | Pass 1: each clause read against its source; locators and a finding id. Pass 2: the balance condition (d) is renamed IsBalancedAt, because the packet used the name TauCeti.GaloisRep.IsOddAt for it while R01.4/odd-representation uses that name for det ρ(c_v) = −1 (the suggested Lean file had already had to leave it undeclared); the rank-one predicate IsTotallyOddChar is R01.4's, and the duplicate item added in pass 1 is removed; the Mathlib predicates are named. |
| `G7/clozel-harris-taylor-group` | corrected | Read against CHT §2.1 (pp. 7–10: definition, ad, Lemmas 2.1.1–2.1.4, induction), BLGGT §1.1 (pp. 11–13) and BCG25 (2.1.2) (p. 514), literally. The semidirect product, ν, the dictionary, ⊗, I (ν(I(j)) = −1 computed) and the injection G_n × {±1} → 𝒢_n were verified by hand. Corrected: proof step 2 (numerical check replaced by the algebra), definition of CHT's induction added, one test generalised. |
| `G7/symmetric-power-polarization` | corrected | Pass 1: B_d, its Gram matrix, sign and multiplier recomputed; the claim for d ≥ p, the signature over ℝ and a process remark corrected. Pass 2: the field is in universe 0 for Sym[F]^d, and the two Tau Ceti declarations listed as prerequisites are named where they are used. |
| `G7/gsp4-and-symplectic-induction` | corrected | Pass 1: (i)–(iv) checked; BCGP21 and CG20 have the same J, the Asai summand made exact, CG20 citations and labels corrected. Pass 2: two machine-checkable citations of the arXiv version of CG20 added next to the published-page citations. |
| `G7/gsp4-semisimple-determined-by-gl4` | corrected | The statement (with char L ≠ 2) was proved independently: two invariant forms differ by a symmetric unit T of the commutant with involution, and T = S*S because over an algebraically closed field of characteristic ≠ 2 forms of one type and rank are isometric; the characteristic-2 counterexample was rechecked. BCGP21 Lemma 2.1.3 read (p. 17). Its cited proof (Gan–Takeda Lemma 6.1) is not on disk: the gap stays. Edits: the counterexample's reason, one hypothesis in an acceptance item. |
| `G7/strong-irreducibility` | corrected | Definition read in NT26 p. 10 (literal); the characterisation through G_ρ^0 in characteristic 0 checked (finite-index subgroups of the image are dense in a union of components containing G_ρ^0). Corrected: the CM elliptic curve example was wrong for Q_p-coefficients when p does not split in K; a process remark. |
| `G7/zariski-closure-and-monodromy-groups` | corrected | Pass 1: closure via the vanishing Hopf ideal, base change, Γ^0 and the component field checked; fact (e) restated for the closed subgroup; Borel gap made exact. Pass 2: the Goursat step rests on the new lemma G7/simplicity-of-pgl2-over-an-algebraically-closed-field; innerness of automorphisms of PGL_2 is no longer used (functoriality of Ad suffices, requested from ReductiveGroups layer 2); one gap remains for 'bijective implies isomorphism in characteristic 0'. |
| `G7/unequal-weight-tensor-irreducibility` | corrected | Pass 1: statement literal against NT26 Lemma 2.2, proof followed step by step; prerequisites refined to the supplier's nodes. Pass 2: the graph alternative is concluded through dφ (functoriality of Ad) instead of innerness of automorphisms of PGL_2; the node keeps its PadicHodgeTheory citations (it needs Hodge–Tate weights). |
| `G7/lifting-projective-representations` | corrected | Pass 1: read against Patrikis §2.1, Lemmas 2.3.15, 2.3.17, 2.7.4 and BCGP21 p. 254; locator, hypotheses and proofs corrected. Pass 2 (lead decision): the node now contains only the Tate part (existence of lifts, lifts differ by characters, unramified almost everywhere), with no p-adic Hodge theory; the Hodge–Tate statements are G7/lifting-projective-representations-hodge-tate. |
| `G7/transfer-of-determinants-to-representations` | corrected | Pass 1: IHG nodes read; polarization transfer corrected (2 ∈ A^×), ad⁰ for every n, topology in (a), prerequisites. Pass 2: Schur's lemma over a local ring and the universal characteristic-polynomial identities are cited as the new lemma nodes. |
| `G7/adequate-subgroup` | corrected | Definitions compared word by word with Thorne 2012 Def. 2.3, GHTT Lemma 1, GHT17 §1, Thorne 2017 Def. 2.20 (text and notation p. 4) and BLGG13 A.1.1–A.1.4; examples recomputed (H¹ for SL₂(F_p), p = 3, 5, 7, GL₂(F_5)). Corrected: the trace-condition API item no longer assumes irreducibility, the deviations from the sources' wording are stated, a test with p / n added, a process remark removed. Pass 2: library citations made exact (minimal polynomial separable against Module.End.IsSemisimple; groupCohomology named and listed); base change now cites a lemma node. |
| `G7/adequacy-criteria` | corrected | All six parts read against GHTT Theorem 9, BLGG13 A.1.2–A.3.1, GHT17 Remark 6.1 and Corollaries 9.4–9.5, Gee–Newton 3.2.3; H¹ values recomputed. Corrected: the acceptance item on Sym^{n−1} of SL₂(F_p) (false for p ≤ 3, n = p); GHT17 Corollary 9.5 added as the printed source for projective image PGL₂(F_5). Pass 2: one cohomology carrier (Mathlib's); the facts 'H¹ = 0 for order prime to p' and 'restriction to a Sylow overgroup is injective' and 'p ∤ n' are lemma nodes; the request to ProfiniteCohomology layer 6 is dropped; a gap added for the Sublemma of BLGG13 A.2. |
| `G7/enormous-image-and-its-coefficient-extension-invariance` | corrected | Definition, the note on p / n, Lemma 6.2.30 and Remark 6.2.31 compared with the Annals text pp. 1044–1045, Khare–Thorne Def. 4.10 and Gee–Newton §3.2; all examples recomputed (SL₂(F_p), GL₂(F_5), Q₈ ⊗ Q₈). Corrected: the proof of the coefficient-extension lemma no longer rests on E752, which is not a mistake of the source; the unsupported 'for n ≥ 3' claim; the justification of Remark 6.2.31. Pass 2: Galois descent and the invariance of H⁰ = H¹ = 0 under coefficient extension (also for infinite H) are lemma nodes; library names listed. |
| `G7/characteristic-zero-enormous-subgroups` | corrected | Definition 2.23, Remark 2.24, Lemmas 2.25 and 2.28 and Example 2.29 of Newton–Thorne 2023 and Lemma 4.7 of Newton–Thorne 2026 read; statement agrees. Corrected: a hypothesis (H compact) not in Lemma 2.28, the last step of its proof, and two unit tests (one justified by a lemma that does not apply over Q_p, one with a false clause). Pass 2: Borel is cited through Newton–Thorne's quotation; the Lean carrier of 'n distinct eigenvalues' named. |
| `G7/enormous-symmetric-powers` | corrected | Checked against Gee–Newton 3.2.4–3.2.5, CHT08 2.5.2–2.5.6, the Annals text of Lemmas 7.1.4 and 7.1.6 and Qian arXiv v1 Lemma 4.3; hypotheses and bounds agree (l > 2n + 1, l > 2m + 3); acceptance items recomputed. Corrected the justification that the torus generator is regular. Part (1) for non-prime k′ depends on part (c) of the H¹ lemma, now proved for all finite fields. Pass 2: carrier unified; gap added for H¹(SL_n(k′), ad⁰) = 0 behind part (4). |
| `G7/h1-of-sl2-with-adjoint-coefficients` | corrected | DDT Lemma 2.48 read with its proof; every numerical claim recomputed in pure Python (SL₂(F_p) for p ≤ 13, GL₂(F_p) for p ≤ 7, twists by det^j, {det = ±1}, Sym^a for p = 5, 7, 11, SL₂(F_9), Borel subgroups over F_25, F_49, F_121, SL₂(F_2)); all agree. Corrected: (b) now has a proof by weights, (c) has a complete proof for all finite fields (its gap can be closed), process remarks removed. Pass 2: the proofs are routed through three lemma nodes in Mathlib's carrier (restriction for invertible index; trivial action of a normal subgroup; the Borel dévissage by resonances), which replace the torus action on H¹(U, ·) and both requests; the case #F = 9 of (a), which the dévissage does not cover, is a gap. |
| `G7/mod-p-clebsch-gordan-decompositions` | corrected | (a)–(c) re-derived (Euler identity, eigenvalue counts) and compared with Newton–Thorne (1.1), (1.3), Clozel–Thorne (1.1), BCG25 p. 514 and CHT08 p. 56; acceptance items checked including the failure for p = 2. Corrected (d): it is now stated for every Γ (its consumer needs SL₂(k′) for non-prime k′) and proved from (a) and Krull–Schmidt instead of Serre's theorem, which had no node or gap. Pass 2: parts (a) and (d) are now the nodes pieri-splitting-for-symmetric-powers and tensor-products-of-symmetric-powers, cited here (no cycle). |
| `G7/adjoint-invariants-of-symmetric-powers` | corrected | BCG25 pp. 513–514 read; (a) and (c) agree with it. (b) was recomputed from the two-constituent congruence and torus weights: it is false for p = 3, F = F_3 (trivial character twice in Sym⁴) and is now stated for p ≥ 5 as in the source (p > 5 there). Proofs of (b), (c) completed; two prerequisites added; a process remark removed. Pass 2: a listed library declaration named. |
| `G7/adequacy-of-symmetric-powers` | corrected | BCG25 Lemma 2.2 with proof and Newton–Thorne 2026 Lemma 2.3 read; statements and bounds agree (p > 5 and p − 2 ≤ n ≤ p; a₀(p) ≥ 3; index < 2p); the exceptional list of GHT17 Corollary 9.4 was checked against both; acceptance items recomputed (H¹(SL₂(F_7), Sym⁴) ≠ 0). Two small corrections (a missing hypothesis in (3), a process remark). Pass 2: a listed library declaration named. |
| `G7/vast-tidy-and-enormous-gsp4-subgroups` | corrected | Definitions 7.5.2, 7.5.6, 7.5.11, Lemmas 7.5.3, 7.5.5 and Remarks 7.5.4, 7.5.8 compared with arXiv v3 pp. 198–201: literal up to notation. Tests checked: the wreath-product examples by hand; H¹(Sp₄(F_3), 𝔰𝔭₄) = 0 and H¹(Borel of Sp₄(F_5), 𝔰𝔭₄) = 0 recomputed, and the Borel subgroup of Sp₄(F_7) as well. One wording correction in (E3). Pass 2: the symplectic Lie algebra is cited as LieAlgebra.Symplectic.sp; the third term of the inflation–restriction sequence corrected. |
| `G7/gsp4-big-image-verification` | corrected | All twelve parts compared with arXiv v3 pp. 200–205. Recomputed: the tidiness elements (order 20, order 8), the order of g = (a, 1)σ, the abelianisations (Z/2 for p = 5, Z/6 for p = 3), enormity of Q₈ ≀ Z/2 by hand, H¹(Sp₄(F_3), 𝔰𝔭₄) = 0 and H¹ of the Borel of Sp₄(F_5) and Sp₄(F_7). Corrected: the k = F_3 case of (11) (the image cannot drop, so the Magma list is not needed), two process remarks. Not checked: the 162-class enumeration and Lemma 7.5.21(2), (3b), (4); the element used for (E3) in the τ ≠ 1 case of (11), now a gap. Pass 2: the k = F_3 argument is a lemma node; the gap on the §7.5 computations records what was recomputed (H¹(Sp₄(F_p), 𝔰𝔭₄) = 0 for p = 3, 5, 7) and what was not; a gap added for the absolute irreducibility of 𝔰𝔭₄. |
| `G7/cg20-big-image-assumption` | corrected | Assumption 4.1 and the paragraph before it compared in arXiv v1 (p. 10) and in the typeset Duke copy (p. 813): same text; (H1)–(H3) as printed. Corrected: the non-example test (replaced by a precise one at p = 3), the readings of (H2), (H3) made explicit, locators now name the text the excerpts come from. Pass 2: both readings of (H3) stated; Proposition 4.10 has no proof in the source, so the reading it needs is recorded as open; excerpts re-pointed to the source entry for arXiv v1. |
| `G7/cg20-big-image-examples` | corrected | Example 4.11 and its proof read in arXiv v1 (pp. 14–15) and the typeset copy (pp. 818–819). The corrected proof was re-derived: elements outside G_K over Q(ζ_{p^m}) are diag(A, B)·r̄(c) with det A = det B = (−1)^{k−1}; eigenvalues ±(xy)^{±1/2} on r̄ and xy, (xy)⁻¹, ±1 on As; the mod 13 polynomials; (H1), (H3) for both parts. Corrected: an unspecified multiplier, a wrong description of the image of ad⁰(r̄)(1), locators, two process remarks. Pass 2: excerpts re-pointed to arXiv v1; both examples satisfy the stronger reading of (H3). |
| `G7/taylor-wiles-image-conditions` | verified | Definition 5.2.1 (arXiv v3 pp. 50–51) and Allen et al. Theorem 6.1.1(3)–(4) read: (TW2), (TW3) are literal; the equivalence (TW3) ⟺ ζ_p ∉ F̄^{ker ad s̄}, the rank-one case and the GL₂(F_7) example were checked. Only two planning remarks were removed. |
| `G7/taylor-wiles-image-lemmas` | corrected | Lemmas 5.2.2–5.2.6 read with proofs in arXiv v3 pp. 51–55 (hypotheses of 5.2.6 on the page image), Lemma 7.1.6(1) in the Annals text. Statements agree with the sources as corrected. Corrected: every source-issue id in the node was off by one (E766/E767/E768/E769); the proof of (4) (meaningless appeal to Mackey, no proof of (TW3), an extraction item number); two unused prerequisites and their requests removed; the silently added hypothesis p ∤ m in (3) recorded as E781. |
