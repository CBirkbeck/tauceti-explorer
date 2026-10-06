# BP-PotentialModularityAndCompatibleSystems--R24.3: completed target-level pass

Codex, session `codex-Hpnayd`, 6 October 2026. Refs #977. The claim was
confirmed against [comment 6021443706](https://github.com/CBirkbeck/tauceti-explorer/issues/977#issuecomment-6021443706).
Branch: `codex-Hpnayd-977-compatible-systems`.

**Status: complete at target level, ready for independent review.** All five
stages in the issue are `planned`; none is declared proof-closed. There is no
formal implementation claim. The packet has 43 nodes, 85 API items, 61 tests,
12 planets, 21 baseline declarations, 26 supplier requests and 6 explicit gaps.
All 33 inherited node IDs are retained. Ten missing targets were added.

## What this pass completes

- General rank-n carriers and operations precede eigenform and potential
  modularity/automorphy existence, as accepted RS-12 requires. Predicates are
  separate from the carrier. Members are representations, and recognition is
  up to isomorphism after coefficient extension.
- Weak, very weak, extremely weak, KW plain, KW almost-strict, KW strict and
  BLGGT strict compatibility are distinguished. In particular the BLGGT
  all-member de Rham requirement is not inferred from KW's sufficiently-large
  crystalline condition, and BLGGT strictness adds no coefficient-prime WD
  comparison.
- Polarized systems carry actual perfect pairings, multipliers and signs.
  CM tensor and positive symmetric/exterior powers include the quadratic
  character correction. Dual, twist and common-sign/common-multiplier block
  sum conditions are explicit. Total oddness is checked on the pairing sign.
- Rank-one algebraic-character, induced-character, finite-image Artin and
  Artin-twist purity are planned without potential automorphy. Canonical
  Hodge metadata are part of the induction and Artin-twist contracts.
- Brauer assembly gives a genuine irreducible family over one coefficient
  field: Mackey/Frobenius reciprocity and overlap Hom lines give norm one;
  positive dimension fixes the sign of the irreducible class. Degree two or
  true restrictions alone are not a genuineness criterion.
- A strict Brauer refinement uses Skinner's full 2009 coefficient-prime
  theorem, including reducible residual members and residue characteristic
  two. The source-faithful historical almost-strict variant remains visible.
- The common monodromy-component field, multiplicity one and uniform
  coefficient extension are separated from the Larsen good-prime theorem.
  Coefficient descent uses BLGGT Lemma A.1.5 with its split distinct-eigenvalue
  hypothesis. Residual irreducibility is a density-one conclusion, with no
  unproved upgrade to cofinitely many primes.
- Böckle's presentation, parameter-system complete-intersection argument,
  auxiliary-to-minimal integral R=T, KW Annals minimal lifts, all four KW
  prescribed types, their application table and Snowden's type lifts are
  retained with exact supplier contracts. Imported statements that were too
  narrow are requested in full.

The four confirmed findings in the issue are addressed: RT-AREA-langlands-2
/10 (early carrier/operations ownership), /12 (R24.4 imports the full R22
lifting theorem and does not depend mathematically on lift-existence
finiteness), /21 (modern ramified-coefficient and residually reducible de Rham
transfer stays with R32.6), and /30 (Skinner supplies full coefficient-prime
compatibility). Only this job's files were changed; campaign edges and
supplier packets were not edited.

## Ownership and what remains

The packet's `requests`, `gaps` and per-stage `remaining` lists are the exact
worklist for proof closure and future signature refinement. These are
supplier/source leaves of this completed planning pass, not unplanned local
targets.

- R03.3 supplies arbitrary parameter systems in regular/Cohen–Macaulay local
  rings and power-series instances; R22.3 supplies the integral minimal R=T
  isomorphism; R08.6 supplies all minimality cases and the automatic-minimality
  recognition criterion. R15/R20 own residual Serre weights.
- R22.5 must export full KW I Theorem 4.1(2), including the endpoint with
  residual weight two and general potentially semistable weight two. R22.6
  owns the dyadic theorem. R24.4 only consumes these and the weight reductions.
- R19.3–R19.5 supply general Hilbert eigenform families, absolute
  irreducibility, away-coefficient monodromy and full Skinner compatibility.
  The currently narrower Carayol/Saito exports are insufficient. R17.6
  supplies the overlap Hom-character comparison for Brauer pairing descent.
  WeightsInEtaleCohomology R34.6 supplies eigenform purity.
- R01/G7 and PadicHodgeTheory supply arithmetic continuity, integral
  reductions, inertia/WD, labeled Hodge comparisons, representation-level
  pairings and monodromy. R01.5 supplies Chebotarev recognition and the
  split-eigenvalue descent criterion, consuming upstream SemisimpleAlgebras.
- Upstream InductionRestriction supplies finite Brauer induction, Mackey and
  Frobenius reciprocity. Upstream GlobalNumberFields Layers 9–10 already own
  general Hecke characters and infinity-type purity. Upstream ClassFieldTheory
  supplies global Artin reciprocity. A recorded restructuring proposal asks
  for **Class field theory, Part II: algebraic ℓ-adic character realization
  and classification**, starting from those existing interfaces and using
  local Hodge/WD comparisons from their owner. No general character carrier
  or reciprocity proof is reconstructed here.
- EndoscopicTransferAndUnitaryTraceComparison ET.6 supplies local L/epsilon
  factors with the fixed additive character and normalization.

Unread original proof leaves remain explicit: Savitt's precise residual
weights; Dieulefait 2004/Gee 2011 (the read KW/Snowden arguments supply the
local targets); Larsen–Pink/Serre for component fields, Sen 1973 for the
Hodge-weight torus, Larsen 1995, Bogomolov, Serre's abelian representation
results, Conrad–Chai–Oort and Bruhat–Tits for integral good-prime models.
BLGGT's potential-automorphy and analytic endpoints are outside this part's
scope and are consumed at ModularityAndLanglandsExtensions ML.2.

## Source record and corrections

URLs, file hashes, editions and actual reading scopes are in the packet.
This pass rechecked the relevant KW I/II, KW Annals, Böckle, Snowden,
Dieulefait–Pacetti and Taylor passages; BLGGT v4 §§2.1, 5.1–5.4 and Appendix
A.1.5/A.2; Skinner 2009 Theorem 1 and its introduction/proof synopsis; and
Khare's level-one §5 Brauer computation reference. This does not claim a
full reading of Skinner's proof or the unread originals listed above.

The ACC+ author-copy §7.1 definitions and purity paragraph were collated
against the published journal-layout PDF on Frank Calegari's page,
pp.1084–1086 and 1092. New source issue **E4** records the literal
Artin-up-to-twist purity observation's missing Hodge-metadata condition for
extremely weak systems. An irreducible S₃ Artin family over ℚ(i), with
H_τ={−1,1} and H_cτ={0,0}, satisfies both determinant sums but fails
weight-zero Hodge symmetry. The corrected nodes require canonical metadata
or a very weak realization. The published text, author copy, arXiv history,
journal landing page and correction searches are recorded; the finding
awaits independent review. E1–E3 are retained with their version scopes,
including the correction of BLGGT v1's odd-weight archimedean factors in v4.
Every node excerpt was checked as a literal passage after whitespace/Unicode
normalization and is at most 300 characters.

## Suggested Lean file and validation

The file follows the signature/proof-target form, with all lemma and example
proofs left as `sorry`. Every packet name and test is present. There are 49
active declaration fragments and 64 omitted full signatures. There are 55
baseline-expressible test fragments; six complete arithmetic test signatures
are omitted: `newform_is_strict`, `brauer_trace_agreement`, `torus_case`,
`gl2_case`, `finite_image`, and `not_uniform_without_regular`.

The carrier, polynomial, perfect-pairing, additive representation-class,
Gamma-factor and finite arithmetic fragments use actual baseline objects.
Full local inertia/Frobenius/WD, Hodge, deformation-point, automorphic,
density and reductive-model conditions that cannot yet be stated are
explicitly omitted, with exact names in the final catalogue and
`suggestedCoverage` metadata. No missing condition is replaced by an
arbitrary proposition field or a dummy proposition. In particular the
additive representation-class fragment does not inherit a false pointwise
representation-ring multiplication. Compilation checks these fragments'
signatures, not their omitted arithmetic assertions or proofs.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/PotentialModularityAndCompatibleSystems--R24.3.json`:
  zero errors and zero warnings.
- The `check_errata.check` schema/versions check on an `errata-v1` projection
  of the packet's four findings: zero errors. The standalone errata CLI is
  for errata-job files, so the blueprint packet was not relabelled as one.
- `lean-check research/blueprint/suggested/PotentialModularityAndCompatibleSystems--R24.3.lean`:
  exit zero, zero errors, 79 warnings, all `declaration uses sorry`.
  Memory was checked before elaboration. Mathlib is the exact pinned
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. The shared Tau Ceti checkout is
  `cf386627e9176a3827c1a5fe804989fd94a4d216`, newer than the requested pin;
  the file imports no Tau Ceti modules and makes no claim of compilation
  against the pinned Tau Ceti checkout.
- Packet/reader/prototype names, preservation of inherited IDs, five-stage
  scope, definition APIs/tests and planet limits were checked together.
- `git diff --check` and the submission file checker passed.

Resume at independent review of these four deliverables, especially the
Brauer overlap contract, polarization correction, coefficient-prime descent,
source E4 and the honest signature omissions. Scratch generators and downloaded
papers are not needed: the deliverables contain the full statements, routes,
reading records and worklist. No second job was claimed in this run.
