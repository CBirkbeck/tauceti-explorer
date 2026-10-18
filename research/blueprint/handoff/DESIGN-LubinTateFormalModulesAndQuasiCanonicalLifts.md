# DESIGN-LubinTateFormalModulesAndQuasiCanonicalLifts

Agent: Codex. Session: `codex-ynl6ep`. Issue: #1687. Date: 2026-10-18.

The bot confirmed this session's claim before work began. This is a complete
target-level design for independent review, following the current WORKERS.md
shape. It is not a formalization or an upstream package. No second job was
claimed.

The five deliverables are the roadmap definition, packet, reader document,
suggested Lean file and this note, all named
`LubinTateFormalModulesAndQuasiCanonicalLifts` (with the `DESIGN-` prefix here).
All ten layers LT.0–LT.9 are planned, with empty remaining lists. The packet
has 51 nodes: 9 definitions, 13 constructions, 27 theorems and 2 comparisons;
137 API items; 89 discriminating tests; 48 planets, at most six per layer;
15 pin-verified baseline declarations; zero mathematical gaps; and 15 explicit
supplier-stage requests. Every implementation status is `unchecked`.

The packet is complete, but its stages are **planned**, not closed: the
supplier-stage requests remain open. No development continuation is needed
before independent review. That review should check the mathematical arguments
and the ownership coordination below, rather than interpret compilation as a
proof of any planned result.

## Scope and ownership

The parent is FiniteFlatGroupsAndIntegralPadicHodgeTheory. The exact existing
R07.1 nodes supply p-divisible groups, Tate modules and the connected
formal/p-divisible equivalence; R07.2 supplies finite Dieudonné equivalence and
Frobenius/Verschiebung. None of these is redefined. Mathlib's `FormalGroup` is
the law carrier. The missing formal coefficient-ring action, evaluated point,
Lubin–Tate, deformation and quasi-canonical APIs form this continuation.

The 15 requests record precise statements and consuming nodes in the packet:

- EllipticCurves Layers 1 and 3: invariant differentials, existing elliptic
  logarithm/exponential and isogeny/Frobenius facts.
- ModularCurves 0B, 0C, 2B, 7C, 7D, 7E and 7F: finite flat carriers and
  quotients, completed elliptic quotients, marked deformations, connected
  height two and Serre–Tate. The plan proves comparisons with those objects.
- ClassFieldTheory Layers 5–8: the existing arithmetic local reciprocity
  and class-field correspondence. The Lubin–Tate theorem compares with this
  Artin map; it does not construct another one.
- LocalFieldsRamification Layers 0–1: complete local fields, units and the
  existing deep logarithm/exponential, including its convergence threshold.

EndoscopicTransferAndUnitaryTraceComparison ET.6a and
VectorBundlesAndIsocrystals VB3:positive-basic-examples consume these
foundations. They remain responsible for the two-tower/cohomological
realization and the diamond universal cover. They are not prerequisites.
AnticyclotomicLocalUnits, the ColemanPowerSeries Part II direction, consumes
the BKO towers and formal trace comparisons and retains distinguished local
points, local-unit decompositions and their recurrence. Quadratic lifts also
serve UnitaryKudlaRapoportCycles and
GrossZagierAndArithmeticHeights GZ.7.

There is a scheduling overlap requiring orchestrator attention, recorded as a
`rescope` proposal. The live bot assigned #1687 as available, but the BKO paper
route also says the grouped design #3355,
FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, supersedes its original
per-route scheduling. At this checkout no grouped definition or packet exists;
the grouped issue was still available when read. Have that direction import
LT.0–LT.9 once. If the orchestrator consolidates names, migrate these stable
nodes and rewrite links rather than planning the foundations again. Its
AGHMP18 Breuil–Kisin realization, conjugate-semilinear special endomorphisms,
denominator torsors, wild obstruction and lifting-depth branch remains a
separate continuation. This job does not claim to prove that branch.

## Baseline and current-library audit

The pinned commits are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Each of the 15 cited declarations
was read at its pin. The checker verified their names against the full
baseline index. The reader describes their precise generality.

In particular, `FormalGroup.Point` has power-series-valued parameters; it is
not an evaluated maximal-ideal point carrier. The elliptic adic-point newtype
and group already exist. The generic `formalPointHom` retains its auxiliary
point hypothesis. The pinned unconditional `formalPointHomAdicCompletion`,
its injectivity and its range theorem apply to the stated height-one
Dedekind-completion presentation, and are reused there. General local-field
comparisons must supply the presentation comparison. Weierstrass preparation,
its quotient algebra equivalence and substitution inverses are existing inputs.

Current roadmap main was checked at
`0d144d044dacebca17b654695b6f1ad58f159b27`, and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The audit included the nine
post-snapshot roadmaps AlgebraicVectorBundles, DifferentialGeometry,
IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups,
PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry, including
their suggested statements. No overlapping Lubin–Tate/Honda/quasi-canonical
foundation was found. The current library's `deepUnitExpLogEquiv` in
`TauCeti/NumberTheory/LocalField/DeepUnits/Basic.lean` postdates the pins;
its owner remains LocalFieldsRamification Layer 1. It is imported through
that stage, not replanned here. No build was run in either read-only tree.

## Mathematical review points

- Strict coordinates have derivative one; marked isomorphisms preserve the
  entire special-fiber identification. They are different conditions.
- The general base is a finite extension of Q_p. Formal O_K-height h becomes
  p-divisible height h[K:Q_p]. Deformation bases B are specified, with residue
  field k; no canonical Cohen ring for an imperfect field is presumed.
- LT.3 includes the universal coefficient algebra and coupled law/action
  cocycles, so formal O_K-deformation smoothness is proved, including ramified
  O_K. The nonclosed-residue argument descends finite-jet linear equations
  and uses stabilization of affine correction images to obtain compatible
  coefficients; it does not tensor arbitrary infinite power-series products.
- Honda's q in the skew operator can differ from the full residue-field
  size. The converse used here explicitly has an unramified coefficient
  ring, uniformizer p, q=p and the p-Frobenius lift. For O=W(F_p²), scalar
  q-Frobenius [s p] gives type p−sT² and parameter s p. The proof uses Honda70
  Proposition 3.3, Lemma 4.2, Lemma 2.4 and Theorem 3. Elliptic scalar
  Frobenius is deduced from the characteristic polynomial and the absence
  of nonzero nilpotents in its endomorphism ring.
- The packet records inherited confirmed erratum BKO21/E9 as source issue
  E1: the signs in Lemma 5.1(ii), p.956, are reversed. The a_p=0 application
  has type p+T² and parameter −p. No fresh published-erratum search is claimed.
- The Serre product is an integral series. Its quotient proof uses a finite
  free Weierstrass basis; kernel translation on distinct generic roots
  forces positive-degree invariant basis coefficients to vanish integrally.
  A logarithm alone is not used to infer integral quotients. The reduction
  is the appropriate Frobenius twist, retained in the marking.
- Homomorphisms of lattice quotients are proved by clearing denominators
  and the quotient universal property, within this known isogeny class.
  This is not a general Tate full-faithfulness assertion. Multiplier orders
  determine endomorphisms; setwise kernel stability differs from rationality
  of every kernel point. Marked minimality requires its own classification.
- For quadratic F/F0 the conductor is indexed by the smaller-field
  uniformizer: O_s=O0+varpi0^s O_F. Positive-level field degrees are
  q0^(s−1)(q0+1) unramified and q0^s ramified, including residue
  characteristic two. Level zero is separate. Minimal fields contain F and
  concern the marked modulus, not absolute minimal unmarked equations.
- The level-one BKO quotient is an actual ramified-base counterexample to
  extending the unramified Honda theorem without its hypotheses: its full
  geometric integral endomorphism order is Z_p+pO, and −p is no longer a
  uniformizer of its coefficient field.
- BKO indices are Φ_n from π^(n+1)-torsion and
  Ψ_n=(Ψ′_(n+1))^Δ′. The primed tower retains tame order p+1. Its
  unprimed anticyclotomic part is Z_p over Φ and has full Q_p group
  Z_p semidirect C2, with inversion; the full group is not pro-p.
- The tame formal trace D_s is unnormalized. On base points it is [p+1],
  so its integral unit inverse gives a section. The adjacent p-step trace
  square commutes. For π=−p, Tate generators satisfy
  w_n=[(−1)^n]v_n. A fixed scalar commutes with a finite trace; when source
  and target use different indices n,m, the transported trace has factor
  (−1)^(n+m). The sign is not omitted from a field-level comparison.

## Sources and validation

The packet records public URLs, SHA-256 hashes, access dates and read coverage;
each node gives its theorem/section/page locators in the worker's own words.
Lubin–Tate 1965 and 1966, Honda 1970, Gross 1986, Yu 1995 and the
Viehmann–Ziegler article in Astérisque 312 were read completely. Honda 1968
§§1–2 and 4, and BKO21 §§2, 4 and 5 were read for the used comparisons.
Gross's scanned paper was read from page images. No source needed by the
current targets remains unavailable. No restricted book, source passage,
source PDF, extracted source text or private filesystem path is submitted.

The suggested Lean file has 189 lines: four light real-bodied predicates,
five milestone statements and eight examples over pinned carriers. Heavy
formal-module/action, marked deformation, lattice quotient and field/tower
carriers remain README targets, as required by current WORKERS.md. There are
no placeholder data structures or data definitions with missing bodies.
`lean-check` completed with exit zero: exactly 13 permitted missing-proof
warnings, no other diagnostics. It used the shared build at the pins; no
language server or library build was started.

Final validation commands are recorded in the pull request: the packet
checker, submission file checker, missing-data-body checker and Git whitespace
check, plus the pinned Lean elaboration and a cross-file/topological/API audit.
The independent reviewer should begin with the reader and packet together,
then inspect the source locators, pin claims and review points above. The only
remaining coordination is the 15 supplier contracts and the grouped #3355
ownership decision. The job's scratch sources and generator are disposable;
the deliverables and this note contain the information needed to continue.
