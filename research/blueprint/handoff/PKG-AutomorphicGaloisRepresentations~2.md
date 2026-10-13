# PKG-AutomorphicGaloisRepresentations~2 — completed package revision

Issue #7891. Codex, session `codex-w8uN08`, 13 October 2026. The claim was
confirmed by github-actions on comment 6156795920. This run completes one job;
the next action is an independent package review, not another worker claim.

## Deliverables and governing shape

The README is a seven-layer mathematical roadmap. All 66 reviewed targets,
90 reviewed API names and 66 reviewed test names remain. Five additional
interfaces move prerequisites down from later roadmaps, as WORKERS requires.
The seven layers follow their prerequisites; the audit found no forward or
self input links. Definitions retain their prose APIs and Checks, theorems
retain hypotheses and source locators, and every layer has worked examples and
dependencies. Sources are paraphrased; no source passage, private-library file
or source-by-source outline is included.

The binding 12 October amendment in [PACKAGE_REVIEW.md](../PACKAGE_REVIEW.md)
requires targets with carriers unavailable at the pins to remain in the README.
It overrides the 9 October review's requirement to put all
90 arithmetic/geometric API signatures into Lean, and the older 200 KB limit.
The geometric realization, Galois/period and whole-ring determinant interfaces
therefore remain detailed README targets. They have not been replaced by
arbitrary predicates, opaque carriers or sorry'd data. The old commented
target inventory is removed from Lean.

`Suggested.lean` has 331 lines: nine light real-bodied definitions, ten theorem
signatures and eighteen examples, in README layer order. Every active named
definition/theorem occurs in the README. It uses `import Mathlib`, the Tau Ceti
Landau module, one opening module docstring and the namespace
`TauCetiRoadmap.AutomorphicGaloisRepresentations`. The unchanged metadata is
exactly `topic = "math.NT"`. The accepted packet, its reader/prototype and
`review.json` are unchanged; this worker has not reviewed its own package.

## Mathematical changes and review findings

- Kept the reviewed Frobenius/duality dictionary, DFG conjugate-form twist,
  alternating pairing and exterior square. The light classical and Hilbert
  polynomial functions now work over an arbitrary coefficient field. The
  README checks nonquadratic character values as well as 11a1 and Δ.
- Replaced the arbitrary-idempotent `newformFactor` Lean definition with the
  actual orbit-factor construction contract in the README: rational new Hecke
  quotient, coefficient action/descent, dimension, periods and lattice. Generic
  averaging is imported from Mathlib, rather than developed a second time.
- Moved the resolved Kuga–Sato construction into §1.3. Its compactified
  eigensummand is the kernel of the open-cohomology boundary map, not all open
  cohomology. Scholl's explicit equivariant blowups and boundary argument are
  planned here; the existing StableReduction Layer 4 supplies the general
  Rees/relative-Proj blowup formalism. No general resolution theorem is assumed.
- Made Carayol's weight-two exception precise in §3.3: the extra H² term may
  survive before localization but has no cuspidal constituent. In other
  weights the component H⁰/H² vanish. Steinberg monodromy is retained in the
  full local comparisons and in an actual nonzero matrix example.
- The ordinary intersection is stated in both its ambient-vector-space and
  lattice-submodule presentations. Saturation is torsion-freeness of the actual
  quotient, with a separate finite-full-DVR rank-one theorem. The negative
  example has a nonzero uniformizer-torsion class in that quotient; it also
  covers ramified coefficient fields where p is not a uniformizer.
- Retained meaningful finite-matrix Condition C checks, a cyclic unipotent
  negative control, full-polynomial recognition in characteristic two, actual
  dual-number reduction maps and the nonzero square-zero class in the level-88
  oldspace algebra. Arithmetic inventory/count examples are removed. The
  remaining geometric tests are precise README Checks, not claims that a
  polynomial calculation proves their realization isomorphisms.
- Reconciled whole-ring reconstruction and descent with the current upstream
  IntegralHeckeAndGaloisDeterminants §1.3 and §4.1. The generic determinant law,
  Cayley–Hamilton quotient, matrix reconstruction and coefficient-descent
  machinery are imported. This roadmap owns extraction from geometric Hecke
  cohomology and its arithmetic-dual/deformation applications. Mixed
  coefficients, topology, injectivity and nilpotent quotients remain explicit.

## Ownership moves for the maintainer

These changes affect the package only. Later packets should redirect their
imports when their own jobs are worked; this issue does not authorize edits
to those packets.

| Former supplier | Owner in this package | Exact interface and redirect |
| --- | --- | --- |
| GeneralizedHeegnerCycles GH.0 | §1.3 | Concrete Kuga–Sato compactification, equivariant resolution and parabolic comparison. Keep general blowups in StableReduction Layer 4 and cohomological formalism in EDC.0–EDC.4. |
| PotentialModularityAndCompatibleSystems R24.5, rank-one converse | §3.13 | Geometric rank-one characters are algebraic Hecke avatars; totally real characters are finite order times a cyclotomic power. Global reciprocity and local rank-one classification stay with their lower suppliers. |
| OrdinaryAutomorphicFormsAndModularityLifting R21.1–R21.3 | §4.10, §4.11 and §5.1 | Finite-weight nearly ordinary packet, normalized operator and unit action, attached graded characters and fixed saturated lattice. Later modularity-lifting/Hida-family theorems consume these; no Iwasawa algebra is needed for the finite-weight carrier. |
| SerreWeightAndLevelOptimisation R20.6 | §6.5 | DDT's optimized weight-two existence with its ℓ=3 quadratic-restriction hypothesis, and the semistable type-Σ nonemptiness consequence. Endpoint lifts in §5.5 remain conditional on an independently specified lift of the exact type. |
| PotentialModularityAndCompatibleSystems R24.5, system data/operations | §7.1 | Common coefficient field, labelled Hodge data, weak/strict/almost-strict predicates and operations. Potential automorphy is an application, not an input to these definitions. |
| SerreWeightAndLevelOptimisation R20 | §7.6 | The particular weight-two squarefree-level lowering and bounded-level congruence argument giving residual ramification for every sufficiently large coefficient prime. R14.4 supplies the precise Ihara/degeneracy hypotheses. |

The rank-one converse includes the coefficient-field step: removing the local
algebraic part gives a discrete idele character whose restriction to K× is the
inverse algebraic character, not 1. Finite ray class representatives have
algebraic powers, giving one number field for their values before using
Conrad's converse. The nearly ordinary normalization uses Skinner–Wiles's
`m=k−2t`, `m+2v=µt`, `min v_τ=0` and the labelled factor `(ϖ_𝔭)^{−v}`;
at parallel weight v=0. Its modified unit action includes the Teichmüller
factor. The compatible-system almost-strict exception occurs only at
coefficient-place pairs with reducible residual representation, and still
requires comparison at odd unramified pairs.

The independent geometric weight input in R34.6 must not import the retired
R06.6 application or this roadmap's coefficient-prime theorem. The package
states that independent scope explicitly. AG2.0–AG2.2 are early independent
character/unitary/GL₃ suppliers; later AG2 rank-two comparisons are consumers.
Foundations/UPSTREAM bookkeeping aliases have been replaced by declarations
or their actual upstream owners. The analytic `HeckeRing.GL2.Newform` bundle
and the current elliptic Tate-module determinant are reused, not re-planned.

## Source checks and their limits

Fresh public-source readings relevant to the changes included:

- Scholl, author copy: §1.0–§1.3, Theorems 1.2.1, 1.2.4, 1.3.3; §2.1 and
  Proposition 2.1.1; §2.4 and Theorem 3.1.0, internal pp. 1–7.
- Carayol, Numdam scan: conventions/Theorems A and B, pp. 409–411; §4.4,
  p. 424, and §11.5, p. 451, for the weight-two exception.
- Deligne–Serre, Numdam scan: residual eigensystems, lifting, Condition C
  and the weight-one construction, §§6–8, printed pp. 520–527.
- Diamond–Flach–Guo, arXiv v2: the parabolic/integral factor and pairing
  passages, §§1.2, 4.5, 5.3–5.4, internal pp. 8–10, 50–51, 56–59.
- Skinner–Wiles, Numdam scan: §3.1–§3.2, printed pp. 27–31, including the
  scanned formula for the weight-normalized operator; §3.3, pp. 38–39.
- Conrad's 2011 algebraic Hecke-character seminar notes: the second Lemma 1
  and proof, internal pp. 9–10. Its algebraic-Weil-value hypothesis is explicit.
- DDT, revision of 9 September 2007: the local δ cases and Theorem 3.15,
  pp. 90–91, and the auxiliary restriction exercise after Proposition 2.11,
  p. 51. The new example uses 11a1 modulo 7; modulo 5 it is reducible.
- Skinner 2009: Theorem 1 and the irreducibility Remark, printed pp. 242,
  256; the original local/family comparison passages were checked separately.
- Dieulefait–Pacetti v2: Definition 1.10, internal pp. 6–7. Its Q-definition
  and the specified labelled/pairwise generalization are distinguished.
- Skinner 2020: §3, printed p. 350, for the separate “some ordinary λ” and
  “every sufficiently large residual λ” quantifiers.

These are checks of statements and the relevant arguments, not a claim to
have reread every proof of all 26 cited sources. Kisin 2008's AMS URL returned
403; its unchanged original locators are inherited from the accepted source
audit. Taylor's inaccessible originals, Saito 1997, Momose's full inner-twist
argument, and the other original inputs recorded below are not claimed freshly
verified. No restricted book was needed or used. Public PDFs and extracted
texts were kept only in disposable scratch, and are not repository assets.

Two complete current upstream models were read before writing: the README and
Suggested.lean of ArithmeticDirichletSeries and ConformalMapping. Current
ModularForms, IntegralHeckeAndGaloisDeterminants, StableReduction and relevant
current-library statements were additionally consulted for ownership.
The upstream roadmap checkout was at
`0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti checkout was at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

## Imported/source obligations that remain explicit

The unchanged accepted packet has twelve recorded gaps and fifty-one supplier
requests. Packaging does not mark it closed. In the revised package they mean:

1. The concrete resolution/boundary work is now owned in §1.3; exact coefficient
   descent and realization comparisons are still required. No individual Chow
   projector or descent from traces alone is asserted.
2. Taylor's original congruence/local-global proofs remain anchored through the
   published Kisin/Skinner/Blasius statements; those originals were not obtained.
3. R18 and LPV supply bad-reduction, Drinfeld/supersingular and equivariant
   vanishing-cycle geometry, including the normalization-kernel monodromy map.
4. AG2, PadicHodgeTheory and PadicFamilies supply the symmetric-square geometry,
   period continuation, crystalline lift and totally real quaternionic
   eigenvariety. Retain φ^{f_v} and the nonzero-divisor Sen-polynomial condition.
5. The endpoint comparison does not give an automatic weight-two lift. Ordinary
   rational/integral period lines and P7's semilinear Wach comparison remain
   imported with exact weight/dual conventions and integral versus rational
   quotients distinguished.
6. Higher-weight/Hilbert families still require the faithful generic rank-two
   geometric multiplicity module with generalized eigenspaces and topology.
   The flat-family descent does not imply a torsion/non-flat construction.
7. Type-Σ conditions require the actual finite-quotient local functors. The
   reduced family's cofinal product quotients do not justify an analogous
   assertion for arbitrary nonreduced quotients or merely dense field points.
8. Momose openness and generic trace-zero analytic Chebotarev keep their exact
   supplier obligations. Large image does not assert full unrestricted GL₂.
9. Fibrewise quaternionic characters do not supply the family's finite-projective
   invariant line; prove that line/descent separately.
10. The classical all-weight coefficient-prime case retains its Saito/Skinner
    sources and geometric proof inputs, without a claim to have read Saito 1997.
11. R34.6 must provide the geometric weight theorem independently. Full
    all-Hilbert purity in §7.2 uses its separate local-compatibility/Ramanujan route.
12. The quaternionic fixed-sign assertion still excludes Nv≡−1 mod p with
    unramified split residual data. Extending it needs the uniformizer operator
    or an independently proved single-sign result.

These are explicit implementation/source contracts, not unfinished package
edits. The next reviewer should particularly check normalization, the downward
ownership moves, the finite-weight unit action, whole-ring nilpotent conditions
and the deliberate README/Lean distinction under the amended shape rule.

## Validation

- `lean-check research/blueprint/packages/AutomorphicGaloisRepresentations/Suggested.lean`:
  exit 0; 21 warnings, all `declaration uses sorry`; no errors or other warnings.
  One compilation at a time, with 104 GB available before the final invocation.
  No language server or build/update/cache command was run.
- Mathlib's shared-build checkout equals
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. The runner identifies its existing
  Tau Ceti source snapshot as `f790474821cf4256814db967cb154e7af3d0c369`;
  that snapshot has no git metadata. Its imported Landau source was compared
  byte-for-byte with `git show` at that exact pin and matched. All thirteen
  accepted baseline declarations and the averaging APIs were read at the pins.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicGaloisRepresentations.json`:
  0 errors, 0 warnings; accepted input unchanged.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/AutomorphicGaloisRepresentations/Suggested.lean`:
  pass; no sorry'd data definitions.
- Intake path/content checks and `git diff --check`: pass. Only the package
  README, Suggested.lean and this handoff are changed. Metadata remains correct.
- Coverage and link audit: all 66 original targets, 90 APIs and 66 tests retained;
  71 numbered targets in total; no broken internal target links or forward/self
  prerequisite links; all active Lean names occur in the README.

Scratch contains no material needed by the next worker and is removed once the
PR is open. The following map is the durable navigation for the accepted inputs.

## Reviewed target-to-section map

IDs are suffixes of `AutomorphicGaloisRepresentations:`. This table belongs in
the handoff only; the README uses mathematical headings.

| Reviewed target | README section |
| --- | --- |
| `R19.1/geometric-construction-and-the-eichler-congruence-relation` | §1.1 — Coefficient Eichler–Shimura |
| `R19.1/parabolic-realisation-premotive` | §1.2 — Parabolic realisations |
| `R19.1/scholl-projector` | §1.3 — Scholl's projector |
| `R19.1/newform-projector-and-coefficient-descent` | §1.4 — Rational orbit projector and coefficient descent |
| `R19.1/newform-rank-two-realisation` | §1.5 — Rank-two newform realisation |
| `R19.1/integral-structure-of-the-newform-premotive` | §1.6 — Integral newform structures |
| `R19.1/lambda-adic-representation-of-a-weight-k-eigenform` | §1.7 — Higher-weight classical existence |
| `R19.1/rankin-bound-for-a-cuspidal-eigenform` | §2.1 — Rankin's prime estimate |
| `R19.1/weight-one-eigenvalues-outside-a-sparse-set` | §2.2 — Finite eigenvalue sets off sparse primes |
| `R19.1/mod-lambda-representation-of-a-mod-lambda-eigenform` | §2.3 — Residual eigensystems before characteristic-zero eigenforms |
| `R19.1/deligne-serre-condition-c` | §2.4 — Deligne–Serre Condition C |
| `R19.1/bounded-semisimple-subgroups-of-gl2` | §2.5 — Bounded finite semisimple images |
| `R19.1/uniformly-bounded-residual-images-in-weight-one` | §2.6 — A bound uniform in splitting coefficient primes |
| `R19.1/lifting-representations-of-groups-of-order-prime-to-l` | §2.7 — Prime-to-residue-characteristic lifting |
| `R19.1/weight-one-characteristic-zero-lift` | §2.8 — A characteristic-zero weight-one lift |
| `R19.1/weight-one-cuspidal-irreducibility` | §2.9 — Weight-one cuspidal irreducibility |
| `R19.1/weight-one-artin-representation` | §2.10 — The weight-one Artin representation |
| `R19.2/carayol-sigma-lambda-construction` | §3.1 — The quaternionic multiplicity space |
| `R19.2/carayol-twisting-and-determinant` | §3.2 — Twisting and the exact determinant |
| `R19.2/carayol-vanishing-cycle-filtration` | §3.3 — Vanishing-cycle filtration |
| `R19.2/carayol-special-places` | §3.4 — Special local components |
| `R19.2/carayol-local-fundamental-representation` | §3.5 — The local fundamental representation |
| `R19.2/carayol-ordinary-cuspidal-places` | §3.6 — Ordinary cuspidal local components |
| `R19.2/carayol-theorem-b` | §3.7 — Carayol's Theorem B |
| `R19.2/carayol-primitive-restriction-lemma` | §3.8 — Primitive two-dimensional restriction |
| `R19.2/carayol-cubic-base-change-of-extraordinary` | §3.9 — The extraordinary cubic step |
| `R19.2/all-cohomological-hilbert-representation` | §3.10 — The unrestricted Hilbert constructor |
| `R19.2/hilbert-normalisation-dictionary` | §3.11 — The representation dictionary as a theorem |
| `R19.2/hilbert-hodge-tate-property` | §3.12 — Hilbert Hodge–Tate property |
| `R19.2/hilbert-uniqueness-determinant-oddness-irreducibility` | §3.14 — Determinant, total oddness and absolute irreducibility |
| `R19.2/cm-hilbert-eigenform` | §3.15 — The CM predicate |
| `R19.2/virtual-reducibility-implies-cm` | §3.16 — Virtual reducibility characterizes CM |
| `R19.2/hilbert-modular-compatible-system-carayol-theorem-A` | §3.17 — Carayol's geometric Hilbert theorem |
| `R19.3/strict-compatibility-and-the-monodromy-weight-purity` | §4.1 — Geometric weight-monodromy and strict compatibility |
| `R19.3/hilbert-ramanujan-conjecture` | §4.2 — Hilbert Ramanujan–Petersson |
| `R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility` | §4.3 — Hecke versus Langlands normalization |
| `R19.4/all-hilbert-local-global-compatibility` | §4.4 — All-Hilbert compatibility away from λ |
| `R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime` | §4.5 — Geometric coefficient-prime comparison |
| `R19.5/kisin-hilbert-coefficient-prime` | §4.6 — Kisin's coefficient-prime theorem |
| `R19.5/skinner-full-hilbert-coefficient-prime` | §4.7 — Skinner's full coefficient-prime theorem |
| `R19.3/classical-newform-irreducibility` | §4.8 — Classical characteristic-zero irreducibility |
| `R19.5/hilbert-local-behaviour-at-p` | §4.9 — The KW coefficient-prime local forms |
| `R19.2/wiles-ordinary-hilbert-representation` | §4.11 — The nearly ordinary Hilbert construction |
| `R19.4/nearly-ordinary-hilbert-compatibility-away-from-p` | §4.12 — Nearly ordinary compatibility away from p |
| `R19.5/shimura-curve-hk-dR-multiplicity` | §4.13 — Shimura-curve Hyodo–Kato/de Rham multiplicity |
| `R19.5/ordinary-refinement-and-saturated-lattice` | §5.1 — Ordinary refinement and the fixed lattice |
| `R19.5/good-nonordinary-crystalline-wach-realisation` | §5.2 — Good-prime crystalline and Wach factors |
| `R19.2/ordinary-cm-primes-split` | §5.3 — Ordinary CM primes split |
| `R19.2/cm-ordinary-line-complex-conjugation` | §5.4 — Complex conjugation moves the ordinary CM line |
| `R19.5/endpoint-weight-local-contract` | §5.5 — The endpoint-weight local contract |
| `R19.6/weight-two-tate-module-decomposition` | §6.1 — Weight-two Tate-module decomposition |
| `R19.6/residual-representation-of-a-newform` | §6.2 — Residual newform representation |
| `R19.6/full-weight-two-hecke-algebra-and-its-galois-representations` | §6.3 — The full weight-two Hecke algebra |
| `R19.4/conductor-and-local-factors-classical` | §6.4 — Classical conductors and bad Euler factors |
| `R19.6/hecke-algebra-representation-classical` | §6.6 — Classical type-Σ Hecke representation |
| `R19.6/reduced-hecke-algebra-as-a-localisation` | §6.7 — The specified reduced localization |
| `R19.6/geometric-hecke-determinant` | §6.8 — The geometric Hecke determinant |
| `R19.6/determinants-and-representability-over-a-hecke-algebra` | §6.9 — From a determinant law to a Hecke representation |
| `R19.6/hecke-algebra-representation-quaternionic` | §6.10 — Quaternionic Hecke-algebra representations |
| `R19.4/quaternionic-sigma-place-local-form` | §6.11 — A fixed character at quaternionic ramification places |
| `R19.6/hecke-family-local-conditions` | §6.12 — Local conditions on the entire Hecke family |
| `R19.3/monodromy-weight-purity-of-the-family` | §7.2 — Purity of the entire family |
| `R19.3/fixed-eigenform-compatible-family` | §7.3 — The fixed-eigenform compatible family |
| `R19.3/dimitrov-large-image` | §7.4 — Dimitrov's residual large image |
| `R19.3/ribet-momose-classical-large-image` | §7.5 — Ribet–Momose classical large image |
| `R19.3/skinner-density-one-ordinary-primes` | §7.7 — Density-one ordinary primes for the fixed weight-two form |
