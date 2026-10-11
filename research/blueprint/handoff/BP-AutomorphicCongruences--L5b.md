# BP-AutomorphicCongruences--L5b handoff

Issue #683; agent Codex (GPT-6); session codex-xLX9fD; 2026-10-11.
This is a complete target-level planning pass, ready for independent review.
It is not a checkpoint and makes no implementation or proof-closure claim.

## Deliverables and coverage

The packet, reader and suggested file cover exactly
`AutomorphicCongruences:L5w` and `AutomorphicCongruences:L5b`.
Both coverage records are **planned**, with explicit remaining obligations;
neither is closed. Every node has implementation status `unchecked`.

| Item | Count |
| --- | ---: |
| Theorem nodes | 12 |
| Application nodes | 5 |
| Comparison nodes | 5 |
| Definition nodes | 1 |
| Total nodes | 23 |
| Definition API items | 5 |
| Definition unit tests | 4 |
| Planets | 10 (five per stage) |
| Pinned baseline declarations | 6 |
| Supplier requests | 23 |
| Gap records | 5 |
| Source-issue records | 5 |

The reader states the conventions, target hypotheses, proof routes,
prerequisites and acceptance checks for every node. It records the exact
Wan polynomial-coefficient, central and ordinary operator list, including
geometric Frobenius. The tests distinguish a coefficient preimage from the
Hecke ideal, detect a squared modulus and test the zero and unit cases.

## Confirmed findings and structure

`RT-AREA-iwasawa-1/31` is handled by importing Kato L4 directly alongside
the early L5a product inequality. No HE.8b endpoint is a prerequisite.
The order is L5w → L5a → {L5b, HE.8b}; L5b exports to
ModularIwasawaMainConjectures L3. The four-factor descent uses the individual
Kato inclusions in the opposite direction to the early product inclusion.
The exact integral image condition is separated from rational equality.
Its stability under quadratic twisting uses an integral unipotent basis
and squaring, retaining the unit factor 2.

`RT-AREA-langlands-2/35` is handled by importing R21.4 and R04.6 and making
L5w an exact hypothesis/Hecke-type verification. Fujiwara's generic minimal
R=T and freeness are not replanned. The existing R21.4 nice-prime
Skinner–Wiles nodes do not suffice for the particular Fujiwara contract;
the request states the extension precisely. Non-ordinary minimal cases
are not used in this instance.

RS-11's current amendments have `review.status=not_reviewed`. The existing
stage IDs are retained; no atlas or restructuring file was edited. The
confirmed findings above are applied directly. The selected-field theorem
in L5w is conditional on explicit field/local data: L5a supplies those data.
It has no backward prerequisite on L5a, which would create a stage cycle.

Nakamura's added universal zeta source is routed by the issue to L3/L4.
Its targets are outside this part and are not duplicated here.

## Existing work and exact supplier imports

The current upstream Multiquadratic, RepresentationTheory/InductionRestriction,
IntegralHeckeAndGaloisDeterminants, LocalGaloisGroups and ProfiniteArithmetic
roadmaps were checked against the requested scope, together with the
current Tau Ceti source areas for twists, multiquadratic fields, completed
groups and local Galois theory. No existing roadmap was replanned.
IHG.2, IHG.4 and IHG.6 provide the integral Hecke/determinant/Ribet framework.
The pinned quadratic-twist point-group character-equivariance theorem is
reused; the continuous Tate-lattice and ordinary-filtration extension is
requested from its owner.

The named P7 pseudo-coherent residual-Nakayama and R03.6 finite-module
support-base-change nodes are imported with their actual finiteness
hypotheses. They do not assert ordinary control. The PadicMeasures L4
characteristic-ideal, multiplicativity and coefficient-norm nodes and the
Selmer L3 kernel-control/derived-control nodes are cited by exact node ID.
The requests identify refinements beyond their existing contracts; a
packet's presence is not evidence that the required instance is proved.

The packet and reader give all 23 request statements. The main obligations
for the next mathematical refinement are:

1. **Minimality and periods.** Extend R21.4/R04.6 to Fujiwara v2 Definition
   6.11, Theorems 11.1–11.2 and Corollary 11.5 with the actual ordinary local
   types, minimal lift, residual restrictions and free Hilbert/quaternionic
   module. Match the APL L3h toric period/primitivity instance.
2. **Analytic and congruence interfaces.** Supply the parallel Hilbert Hida
   branch, ordinary GU(2,2) carriers, all-cusp boundary/control and the
   actual integral projector. Wan 82's all-bad-prime imprimitive landing
   does not itself establish every primitive fixed-form integral statement.
   Prove the fixed-form period/Euler comparison and the cuspidal lifting
   hypotheses. A generic Katz carrier is insufficient for the Rankin object.
3. **Selmer control and torsion.** Prove the exact coefficient and cyclotomic
   control maps, including localization-image and Tor corrections, and
   compare locally trivial and inertia conventions. Establish finite torsion
   duals using early Kato/control inputs; Wan 101's non-torsion zero-ideal
   convention cannot be canceled or treated as a torsion theorem.
4. **Early product and elliptic upper bounds.** L5a must export Proposition
   5.2.1 and Lemma 5.2.3 independently of HE.8b, including the integral μ
   upgrade, quartic-to-K comparisons and the new ramified K-prime
   refinement. Kato L4 must export the exact BCS elliptic (im) refinement
   with MSD/Néron periods and primitive Selmer conventions. Its current
   general SL2 criterion and p-power error do not supply that refinement.
   Preserve the separately proved rational CM upper-bound branch.
5. **Arithmetic signatures.** Add actual Hilbert, GU(2,2), continuous
   Tate/Selmer and analytic-function carrier signatures supplied by these
   owners, then replace the documented signature gaps. Do not replace them
   by opaque propositions, expected-conclusion fields or fake Selmer types.

## Source checks and independent verification

Read public copies of the published BCS paper and arXiv v2, published Wan
2015, Fujiwara arXiv v2, CGS arXiv v1, the Skinner–Urban author manuscript,
and Kato's published Numdam scan. Their URLs, versions, read date, SHA-256
hashes and the sections actually checked are in the packet. BCS uses the
published 15-page pagination; v2's 12-page pagination is stated separately.
The Skinner–Urban author manuscript has different numbering; the directly
read section-based locators are retained. No cleared private book was
needed. No source file or source passage is included in the repository.

Five source findings require independent verification:

- **E1 (Fujiwara wording).** The description of 0E on v2 p.16 uses
  irreducible inertia but describes induction from an unramified quadratic
  extension. Restriction of that induced representation gives two inertia
  character lines. The corrected induced exceptional type has reducible
  inertia; BCS H3 is consistent with this description. This is not an
  allegation that BCS H3 is wrong.
- **E2 (BCS/Wan class fields).** BCS's unqualified Hilbert class field is
  insufficient to identify Wan's explicitly narrow condition. The stronger
  contract is retained, and a new K-ramified prime outside D_F gives a
  finite-ramification proof in the selected instance. Existence belongs to
  L5a. A convention clarification could settle the printed ambiguity.
- **E3 and E4 (BCS reference labels).** The minimal-base-change Theorem 103
  and interpolation Proposition 84 point to Wan 2015, not the cited Wan
  2021 Heegner-point paper. These change locators, not mathematics.
- **E5 (Wan local bullet).** Theorem 8's printed irreducible-inertia test
  does not test the induced exceptional case with reducible inertia. Check
  the exact supplier theorem and exclude that case separately. No
  counterexample to the Gorenstein conclusion is asserted. The selected
  field q_v argument verifies both tests.

No correction was found in the author/publisher/arXiv and targeted erratum
searches recorded in the packet. The selected local splitting pattern
satisfies both inertia q_v tests, and the narrow condition is explicit.
These observations do not establish general theorems under the ambiguous
printed hypotheses. Review the source findings independently before
promoting them into an errata result.

## Validation and formal limits

`python3 scripts/check_blueprint.py
research/blueprint/packets/AutomorphicCongruences--L5b.json` passes with
zero errors and zero warnings. The source-issue and source-version
validators pass when applied with roadmap ID AutomorphicCongruences.
Packet/reader/suggested names, definition API/test coverage, local acyclicity,
planet counts and deliverable-path checks were also checked.

`lean-check research/blueprint/suggested/AutomorphicCongruences--L5b.lean`
completed successfully at the existing shared pinned build. Memory was
checked first. Its only warnings are declarations using `sorry`.

This establishes elaboration of the coefficient-ideal definition, its five
API lemmas and four examples, six concrete algebraic reduction signatures
and three further examples. It does **not** establish elaboration of the
full arithmetic targets: those are explicit named mathematical comments
with missing carrier/hypothesis interfaces. Each reduction identifies its
omitted arithmetic content; all target names and statements are present
in the file. The fifth gap and each coverage record preserve this limitation.
No Lean implementation, arithmetic proof or full-signature completion is
claimed.

Resume from the five obligations above and their exact request records.
No scratch files are needed: the packet contains the source provenance and
contracts, and this note records the reasoning necessary for the next pass.
