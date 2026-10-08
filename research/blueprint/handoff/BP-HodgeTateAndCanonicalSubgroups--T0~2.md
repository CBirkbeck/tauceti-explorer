# Handoff: Hodge–Tate and canonical subgroups, revision 2

Issue #7304; agent Codex; session `codex-AkiLuL`; 8 October 2026.
This is a complete planning pass for T0–T5, ready for another independent
review. It is not an implementation or an acceptance of the preceding plan.

## Deliverables and coverage

The [packet](../packets/HodgeTateAndCanonicalSubgroups--T0.json),
[reader](../readmes/HodgeTateAndCanonicalSubgroups--T0.md), and
[suggested signatures](../suggested/HodgeTateAndCanonicalSubgroups--T0.lean)
now agree. There are 63 nodes: 11 definitions, 12 constructions, 25 theorems,
12 lemmas and 3 comparisons; 128 API items; 79 mathematical tests; 25 planets;
29 pinned baseline declarations; 11 gaps and 18 supplier requests.

| Stage | Nodes | Planets | Coverage |
|---|---:|---:|---|
| T0 | 23 | 6 | planned |
| T1 | 3 | 1 | planned |
| T2 | 8 | 5 | planned |
| T3 | 9 | 5 | planned |
| T4 | 8 | 3 | planned |
| T5 | 12 | 5 | planned |

Every target has a declaration route ending in a checked baseline, an existing
owner or an explicit dependency gap. No stage is closed, and every
implementation status remains unchecked. All 56 preceding node IDs, the whole
preceding `review` object and all 15 source-issue review objects are retained
exactly. Their old verdicts describe the preceding review; the next independent
review must replace them. All 117 excerpt fields were removed. Statements,
source matches and source-issue descriptions are authored paraphrases.

## Changes in this round

- T0 now gives a global conormal sheaf and its affine identification with the
  existing augmentation cotangent space. The O_C conormal/Faltings extension
  is requested specifically from R07.1, without extending a noetherian-local
  theorem by assertion. R07.6 owns the co-Lie, syntomic determinant and trace
  foundation; StableReduction owns general Fitting operations. The inverse
  different remains a fractional line, not the torsion conormal. Multiplicative
  determinant normalization takes place on the character lattice before base
  change. Boundary torsion distinguishes the finite Raynaud part from the full
  polarized one-motive; no dual of an arbitrary semi-abelian scheme is asserted.
- T1 uses CS17's two period lattices and the actual proper-smooth comparison
  setting over a discretely valued field, with stated base extension to C.
  CDM12 Proposition 4.15 supplies a read good-reduction character/Kummer proof;
  P8 still owns its relative compatibility. The rational tensor and common
  Tate-trivialization conventions are consistent throughout T1–T2.
- T2's filtered-functor contract has a precise public source: Ziegler
  Definition 3.4 and Theorems 3.14, 3.15 and 3.52. General strict filtered
  reconstruction belongs to a proposed ReductiveGroups Part II, while the
  Shimura pro-étale torsor conclusion uses CS17 Lemmas 2.3.6–2.3.7 separately.
  The corrected Plücker indices, chart counterexample, quotient convention,
  rational frames and Tate-normalized Levi comparison are retained.
- T3 separates weak formal, strong sufficient, strict HN and larger inclusive
  pointwise ranges. The all-prime HALO appendix closes the source-reading gap
  for p=2 canonical estimates. It does not prove the unsplit ramified Hilbert
  generator contract, the p≥3 inclusive endpoint, or the global PS16 p=2
  modification estimate. Canonical differentials use the truncated comparison
  and retain the raw character cokernel error.
- T4 has a scalar valuation-ring kernel-congruence route. Generic embedding
  projection now precedes the numerical period inclusion, removing the old
  dependency cycle. Integral balls use the integral closure, without splitting
  the ramified tensor order. The kernel coordinate, denominator domains,
  adjugate convention and scaled finite Atkin–Lehner radius agree.
- T5 records AIPH's lifted-generator matrix and adjugate proof, plus a separate
  inclusion/determinant-cancellation proof of level independence. It uses
  strict transforms and distinguishes local exterior factors from determinant
  norm descent. A new HT-to-AIP lift and torsor-ratio lemma establish the actual
  B_m-valued automorphy factor conditionally on the stated integral model and
  generator inputs. This avoids inferring a smaller structure group from a
  larger ambient radius. O5 owns coefficient sheaves; P9 integral effective
  descent; O6 p-Hecke. Infinite level uses forgetful pullback.

Seven prerequisite nodes were added: conormal base change, conormal right
exactness, finite character naturality, scalar canonical-kernel congruence,
integral lattice level independence, HT-to-AIP lift and the AIP automorphy
factor. The suggested file replaces the previous comment catalogue with real
scheme, sheaf, functor, subobject, module, ideal and map signatures. All 244
distinct node/API/test names occur as declarations, and all 79 tests have
Lean examples. Comments identify supplier conditions that cannot yet be typed;
those conditions are omitted rather than replaced by opaque proposition fields.
The signatures remain schematic where such omissions are recorded.

## Confirmed red-team routes

- **RT-AREA-padic-1/22:** the global tower period map, equivariance and
  automorphic pullbacks remain with PerfectoidShimuraVarieties S3; T2 keeps
  finite/family sequences, flags and torsors.
- **RT-AREA-padic-1/23:** the four BCGP25 cohomology comparisons are routed to
  TC.2 and HigherHidaAndColemanTheory, outside this packet's targets.
- **RT-AREA-padic-1/25:** local Scholze–Weinstein classification is requested
  from a FiniteFlat stage after R07.2 importing the vector-bundle inputs;
  T2, IG.3 and ET.6a consume it. No classification-to-T0 back edge is added.
- **RT-AREA-padic-1/26:** arbitrary-base BT₁ Hasse, LF and the BT₁ character
  sequence belong to R07.2. T0 keeps the semi-abelian/boundary application.

These are ownership and routing proposals in this job's deliverables. No other
packet, roadmap, brief, atlas data or reserved ID file was edited.

## Sources and remaining contracts

Re-read the used statements and proofs in FAR10, FAR11, SCH15, BHW, PIL20,
PS16, BP26, BCGP21, CS17, SW13, AIPH and AIP15 at the recorded public versions.
Added direct readings of HALO Appendix A.1–A.3 (PDF pp. 37–41), CDM12
Propositions 4.13–4.15 (PDF pp. 27–29), and Ziegler's filtered-functor results
(PDF pp. 15, 17, 27). Lan's corrected author copy, Definition 8.5 and
Theorems 8.6–8.7 (PDF p. 34), and errata item (3) were read for the precise
coefficient/model and dimension-exception contract. E27 remains rejected as a
source-error allegation. All 19 PDF hashes match the packet's receipts.
Published BHW/Scholze source-issue collations are inherited from the retained
independent review; no new whole-paper published collation is claimed.

No uncleared Illusie, Huber or Faltings–Chai copy was read. The co-Lie/deformation
foundation remains a supplier obligation. The DRW O8 domain refinement has not
been read and is explicitly a gap. PS16 Remark 1.10 cites an unwritten
communication for the p=2 global exponent; this run does not certify it.

Resume from the reader's **Recorded gaps and follow-up**, which reproduces the
11 precise gap contracts and their affected node IDs. Priority obligations are:
O_C conormal/dimension and integral Faltings complexes; group co-Lie/trace and
square-zero deformation; arbitrary-C Raynaud and one-motive realization;
formal minimal Hasse and mod-p^n boundary gluing; strict filtered reconstruction
and representable flag/torsor interfaces; p≥3 inclusive canonical endpoints and
ramified O_F generators; formal matrix transfer to O⁺ and common level models;
the exact GSp₄/F coefficient, mod-p^k pushforward and determinant/norm descent;
the p=2 modified-bundle estimate; effective completed coefficient descent; and
the DRW refinement. Each has a request to its existing owner where applicable.
Discharge these contracts before changing any stage to closed.

The fully qualified existing Cartier-duality API is documented under the
source-checked category entry. Its malformed declaration-index alias needs an
orchestrator repair outside this job's allowed files.

## Validation and Lean limitation

- `python3 scripts/check_blueprint.py` on the packet: **0 errors, 0 warnings**.
- Additional checks passed for exact retained review values and node IDs,
  the acyclic local dependency graph, scope/coverage, API/test/use coverage,
  the reader's names and remaining lists, all PDF hashes, planet limits,
  unchecked implementation status, removed excerpts and absence of local paths.
- The full suggested file was attempted with `lean-check` but **did not
  compile**: the shared build lacks the compiled module
  `TauCeti.Algebra.AlgebraicGroup.Tangent.Cotangent`, before the Cartier imports
  can be checked. No library build, update, cache download or language server
  was started.
- A scratch Mathlib projection passed `lean-check`, including checks of all
  244 exact packet names, with only admission warnings. It replaced the
  unavailable Tau imports by a cotangent carrier/signature stand-in and an
  ambient group-object category stand-in. This validates Mathlib-side
  elaboration only; it does not validate linkage to the finite-flat Tau
  category or any omitted supplier hypothesis. Available memory exceeded
  20 GB, and compilation was sequential.

The next reviewer should inspect the revised targets against these contracts,
and the full file needs elaboration when a compatible Tau build is available.
The scratch sources and checks are disposable; no future work depends on them.
