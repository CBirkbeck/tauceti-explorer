# BP-LefschetzPencilsAndVanishingCycles--LPV.0~2

Revision 2 for issue #6992, Codex session `codex-XfOgbL`, 2026-10-10.
The target-level planning pass is complete and awaits independent review. This
is a revised plan with explicitly recorded source and supplier-form gaps. It
claims no implementation and no complete geometric Lean interface.

## Inventory and coverage

All 89 original node ids, all seven scope ids, the 29 planets, all 19 baseline
citations and the inherited `review` object are preserved. The 23 inherited
source findings retain their review verdicts; their descriptions and corrections
now use our own words. The four inherited LPV.0 paragraph digests are replaced
by direct target contracts, with their numbered source locators retained.
No source excerpt is retained. One new proposed finding,
E24, records the Tate-twist discrepancy in Weil I §7.1.5 and requires independent
verification.

| Item | Revision 2 |
| --- | ---: |
| Definitions / constructions | 8 / 11 |
| Theorems / comparisons / lemmas / applications | 53 / 7 / 6 / 4 |
| API items / unit-test specifications | 113 / 77 |
| Planets / baseline declarations | 29 / 19 |
| Supplier requests / explicit gaps | 27 / 11 |
| Source findings | 24 |
| Nodes with complete / partial / missing suggested forms | 3 / 14 / 72 |
| Full forms omitted and individually specified | 211 |

LPV.0, LPV.1, LPV.2, LPV.3, LPV.4, LPV.5 and LPV.6 are each **planned**, and
none is closed. Every original target is a node with a prerequisite chain ending
in a checked baseline declaration, exact independent supplier node, requested
owner stage or recorded gap. Packet `status: complete` means that this planning
pass covers its targets. It does not mean the inherited review accepted this
revision, that the sources are all closed, or that the suggested file supplies
every planned form. Every implementation status remains `unchecked`.

## Changes and review findings

The main repair is removal of the review's false arbitrary-input signatures.
There is no universal quasi-unipotence theorem for arbitrary representations,
commutation theorem for arbitrary residues, Frobenius equation for unrelated
endomorphisms, rank-one theorem for arbitrary complexes, geometric isomorphism
for arbitrary schemes, or exactness theorem for arbitrary t-structures/functors.
The actual replacement forms are either constrained on existing linear carriers
or omitted with their full statement, hypotheses and owner inputs.

The per-node `prototype` ledger records the exact omitted definition, theorem,
API and test names, statements, hypotheses, prerequisites and suppliers. The
suggested-file missing-form ledger repeats those contracts. The reader lists the
missing forms alongside the definitive target specifications. Entries in those
ledgers are **not** elaborated declarations or completed tests. The seven stage
prototype gaps refer to these individual entries, rather than hiding them behind
one hypothetical carrier.

Specific mathematical repairs:

- Variation retains the review's corrected composition order and multiplication
  law. Its degree-zero cokernel factor has a uniqueness API and genuine zero
  tests. The derived representative-independence form remains explicit.
- Finite logarithms have actual nilpotence bounds; graded powers and graded N
  have representative equations binding them to the input N. The two-block
  filtration test includes all four steps, and the three-block test includes
  both zero odd grades and the three one-dimensional even grades. Lower
  primitive and minus-dual conventions are preserved.
- Semisimple trace now uses the same actual representation, its finite increasing
  inertia/Frobenius-stable filtration, and finite inertia on its associated
  graded. Haines–Ngô §3.1, Lemma 8 and Corollary 9, pp. 127–128 supply the primary
  independence/additivity proof. The induced action and Frobenius maps have
  representative equations. Short-exact-sequence additivity carries injection,
  surjection, kernel/image equality and both equivariances. The unipotent test
  uses a concrete shear action: semisimple trace two versus invariant trace one.
  This is the q=1 algebraic specialization; a genuine arithmetic Weil action,
  the derived triangle and shift forms remain separately specified.
- Ordinary forms include characteristic two and exclude rank zero. Field parity
  and Mathlib nondegeneracy APIs are stated without imposing two invertible.
  Ordinary formal germs use an actual k-algebra equivalence, a coordinate
  quadratic series, and a remainder whose coefficients vanish below degree
  three. Pure quadratic cones are only the named specialization. The scheme
  completion/base-change forms remain supplier gaps.
- Clifford tests identify actual algebras Q×Q and Q[X]/(X²−2), rather than only
  dimensions. The rank-two lemma is named for rank, and is not advertised as
  étaleness. General-ring étale/Azumaya and ruling idempotent forms remain
  explicit. Canonical quadric ambient and dimension-zero exceptions are retained.
- Radical-quotient projection, descent and representative pairing APIs are
  supplied. Concrete Q⁴ symplectic three-plane/isotropic-plane tests compute
  radicals and quotient dimensions; the conic linear model computes norm two.
  A concrete shear shows genuine path dependence. Geometric model identification,
  Tate-valued pairing and continuous monodromy remain distinct missing forms.
- The full pencil predicate in packet/reader includes a transverse axis, actual
  incidence/blowup, smooth total space, finite critical set and ordinary germs.
  The quadric/cubic tests specify general axes and their actual models, rather
  than assert critical-set cardinalities for arbitrary families. Their untyped
  geometric tests are omitted and listed precisely.
- The middle reduction gives the two exact sheaf chains of Weil I §7.1,
  pp. 299–300. In the nonradical case H¹(j*E) surjects onto H¹(Rⁿf*) and injects
  into H¹(j*(E/radical)). In the totally isotropic case the constant kernel is
  j*E⊥, and F is its actual cokernel. H¹(Rⁿf*) injects into H¹(F), which receives
  the surjective skyscraper boundary. All three Leray terms, possible corner
  d₂ maps, extension classes and the E=0 upper-corner defect remain visible.
- E24 proposes Q_l(m−n) in that skyscraper line: pairing an untwisted vector with
  δ∈Hⁿ(m) takes values in Q_l(m−n). The printed opposite twist is flagged, with
  the n=1 check and an explicit request for independent verification. No new
  accepted erratum is claimed.

The previously accepted corrections remain: finite-log Illusie 1.5 locator,
Kummer cofinal versus coordinate independence and normal-bundle torsor, excellent
reserved key, direct reflection fixed-space calculation, canonical ambient n>0
and negative canonical-bundle power, dimension-zero diagonal cokernel, one
integral orientation before composite-modulus reduction, empty dual/projective
space case, degree-two jet exception, FSY and Weil II locators, SF.4 Rees owner,
SF.0 closed-point geometry, and EDC trait/integral/enlarged Part II scope. The
original algebraic odd Picard–Lefschetz route and early two-component prefix are
kept; no reverse LPV.7 dependency is introduced.

## Primary sources and ownership

The source gaps for Huber comparison, compact p-adic subgroup theory, finite
orthogonal rationality and semisimple-trace independence are resolved at the
source/contract level:

- Huber, *Étale Cohomology of Rigid Analytic Varieties and Adic Spaces*,
  Theorem 3.5.13, p. 207 and proof pp. 208–209; Corollaries 3.5.16–17, p. 210.
  The exact noetherian/principal-type-(S) completion alternatives and the
  strictly henselian rank-one finite-type nearby corollary are recorded. The
  comparison is for RΨ, and inertia compatibility comes from functoriality
  under each automorphism of the actual completion/base-change diagram.
- Schneider, *p-Adic Lie Groups*, §18.10–19, pp. 144–153; Exercise 26.2,
  pp. 181–182; Theorem 27.1, pp. 192–194; Theorem 29.2 and Corollaries 29.4–6,
  pp. 203–205. The finite-rank p-valuation/ordered-basis chart argument is stated,
  with analytic inclusion and local inverse-function openness. General analytic
  infrastructure remains a LieGroups, Part II request; real Cartan is not used
  as a theorem over Q_l.
- Deligne, Weil II 4.4.5–9, pp. 229–231, including both character-comparison
  lemmas. Integral traces give an integer locally square at every l≠p; abelian
  Chebotarev excludes a nonsquare quadratic extension. Rational Gram coordinates,
  finite averaging/positivity and the root-system inputs are specified. This
  adds the exact existing Chebotarev Layer 9 contract, not a weight assumption.
- Haines–Ngô, *Nearby cycles for local models of some Shimura varieties*, §3.1,
  pp. 127–128, with both refinement and Grothendieck-group arguments. The
  published author-hosted text is hashed in the packet. Kisin–Pappas is kept as
  the consumer, rather than attributed the entire construction.

The public source versions and hashes were checked; the needed SGA/Weil/Illusie,
Qian, FSY, Kisin–Pappas and Caraiani–Scholze passages were revisited. Huber and
Schneider were read only in the maintainer-cleared library, in place, and their
hashes and numbered/page citations are recorded. No book file, extracted book
text or passage was copied into scratch or the repository.

Four source holes remain unchanged in substance: G-algebraic-PL (original
Illusie 2002 odd sign/blowup proof), G-nonordinary (original Illusie 2003 general
Corollary 2.10), G-approximation (general Artin/Elkik proofs with their owner), and
G-finiteness-source (the original nonproper excellent-trait finiteness proof).
Primary survey/application/erratum evidence is kept within its exact scope.
The seven other gaps are the exact unavailable prototype forms.

Current read-only TauCetiRoadmap main
`dea8191cc6047d6142a65872ebce6eeeb841a29b` and current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were checked in addition to the pinned
baseline. ClassicalGroups and OrthogonalGeometry were read as complete
references; OrthogonalSpinGroups Layers 0/2 and Suggested.lean, IntegralLattices’
carrier and Chebotarev Layer 9 were inspected. OrthogonalSpinGroups already owns
the general-field orthogonal carrier/reflections and canonical Q_l topology.
IntegralLattices already owns the lattice carrier. Only missing Q_l symplectic
interfaces extend ClassicalGroups, Part II. Nothing in these current roadmaps
or in the library is re-planned here, and no build was run in their environment.

## Exact supplier order and maintainer actions

The packet contains 27 precise requests. Keep generic arithmetic inertia,
projective geometry, Rees blowups, regular-trait purity, enhanced derived
realization, perverse structures, SL₂ infrastructure and p-adic charts with their
existing owners/Part II directions.

The following node-level sequences resolve the formerly circular imports:

1. **LPV nearby definition → H1 comparison → LPV comparison consumer.** Import
   only H1/formal-adic-comparison's scheme-completion-comparison-3-5-13 and
   formal-nearby-cycles-comparison. The latter uses the LPV nearby definition,
   not the LPV scheme/adic comparison conclusion. Expose these prefixes before
   installing a whole-stage H1↔LPV.0 link.
2. **IG geometry → LPV.6 interface → IG semiperversity.** Import only the checked
   IG.4/finite-level-formal-models and IG.4/ell-power-boundary-killing contracts.
   They do not use IG semiperversity/compact-perversity. Derive the finite-level
   affine/integral bound, then use the LPV colimit criterion. Split the IG.4
   geometry prefix before installing stage links; do not use its semiperversity
   conclusion as input to the LPV application.
3. **LPV geometric monodromy → DWP.4.** The reverse whole-stage DWP.4 dependency
   is removed. The finite orthogonal character proof uses FA.5 finite-cover
   Chebotarev, compatible trace formulas, CharacterTheory and existing
   Chebotarev/IntegralLattices/RootSystems interfaces. DWP.5 remains the consumer
   for weight-dependent relative existence and hard Lefschetz; the orthogonal
   nondegeneracy hypothesis is retained explicitly.

No supplier packet, atlas stage, queue, label or upstream document was edited.
The prefix splits and current-upstream integration notes are proposals in this
packet for the maintainer, not installed atlas edges.

## Validation and next review

- `python3 scripts/check_blueprint.py` on the packet: zero errors and warnings.
  The existing 19 baseline references were also checked in source at their pins;
  the local checker has no default declaration-index file.
- Shared `lean-check` on the suggested file: elaborated successfully at the
  pinned Mathlib/Tau Ceti environment, with only the permitted placeholder-proof
  warnings. No language server or prohibited build/update/cache command was used.
- Source-issue/version validation: all 24 findings pass the shared validators.
- Node/scope preservation, unchanged review object and inherited erratum verdicts,
  exact name/namespace versus missing-form accounting, reader/packet agreement,
  allowed deliverable paths and whitespace were checked.

The independent reviewer should verify the constrained replacement signatures,
explicit omissions, Huber/Schneider source arguments, both middle-map branches and
E24, plus the exact independent supplier prefixes. The remaining 211 omitted
forms must be filled when their actual suppliers can be expressed; they must not
be replaced by arbitrary input objects or opaque conditions. The four original
source-proof holes require the specified primary interiors. This worker takes no
second issue after opening the revision pull request.
