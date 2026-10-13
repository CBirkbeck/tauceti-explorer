# PKG-MordellLawrenceVenkatesh~2 — revised package

Claude (Opus 5.5), session `claude-mQQ9ze`, 2026-10-13. Refs #7911. Branch `claude-mQQ9ze-mlv-package`.
Input: `origin/main` at `88926f221`, accepted plan `research/blueprint/packets/MordellLawrenceVenkatesh.json`
(146 nodes, accepted by REV-DESIGN-LV~2), the previous package and its review REV-PKG-MordellLawrenceVenkatesh
(`needs_changes`). The two open draft pull requests #8150 and #8763 of earlier sessions were not used.

## What changed

**Shape.** Both files were rewritten to the binding 2026-10-12 shape (PACKAGE_REVIEW.md, "Shape of a roadmap"),
which supersedes the review's demand for 193 further API signatures and 73 named tests in Lean:

- `README.md` (2,818 lines, 363 KB) now has the TauCetiRoadmap form of the accepted packages (LefschetzPencils
  model): `# Roadmap:` with a `**Summary.**`, `## Scope and ownership`, `## Conventions` (with the three common
  settings P, Q, C stated in full), `## Exact supplier contracts` (Mathlib, Tau Ceti pinned and current,
  TauCetiRoadmap roadmaps, other roadmaps), `## How to read the build`, twelve `## Layer LV.k` sections with one
  `### k.n` subsection per target (statement with its hypotheses, API list, proof sketch, locators, `*Needs:*`,
  `**Checks.**`), per-layer `### Examples` and `### Dependencies`, then worked examples, downstream consumers and
  references. Every definition and construction has at least three Checks; no target tables or field lists.
- `Suggested.lean` (722 lines) states only what the pinned libraries can type: real-bodied light definitions
  (semilinear centralizer as an `F`-subalgebra, the permutation group `Aff(q)` and its linear part, generating
  tuples, symplectic transvections, the largest CM-or-totally-real subfield, finite filtrations and their Hodge
  degree, the Legendre curve, `size_v`, singly ramified surjections, averaging idempotents, primitive vectors),
  the theorems statable at the pins (dimension of semilinear centralizers, cycle types, centralizer and
  normalizer of `Aff(q)`, Jordan's totient count, isotropic subgroup bound, minimal subrepresentations,
  transvection identities, simplicity of `𝔰𝔭`, two-factor Lie Goursat, Lagrangian dimension, Legendre invariants,
  the S-unit theorem, `size_v` monotonicity, primitive-homology complement, lattice lemmas, the admissible prime
  and the short-orbit count), discriminating `example`s, and a closing comment listing by number every README
  target that has no carrier at the pins. No sorry'd data; every Lean declaration name occurs in the README.

**Targets: 164** = 146 planned − 4 removed + 22 added. Numbering is by position in the README (`k.n`); the packet
node ids are not printed.

Removed (cited at their owners instead, with full statements kept in the supplier contracts):
- `LV.1/trace-determines-semisimple`, `LV.1/frobenius-test-set`, `LV.1/weil-polynomials-finite`:
  FaltingsFinitenessAndIsogenyTheorems (tier 17) cites these three nodes from R28.4/R28.5, and
  `upstream/CaraianiNewton.md` lists its MordellLawrenceVenkatesh citations as upward citations to remove.
  **Move down:** FaltingsFinitenessAndIsogenyTheorems must plan these three statements itself (statements,
  hypotheses and sources are in the MLV packet nodes and in this README's supplier contracts); this roadmap then
  imports them from there.
- `LV.3/strassmann`: EffectiveDiophantineMethods `ED.4/strassmann-bound` states Strassmann over any complete
  nonarchimedean field, and that packet's restructure proposal makes it the single owner (ArithmeticDynamics DY.6
  and this roadmap cite it).

Added (supplier statements that no current package, packet, TauCetiRoadmap roadmap or Tau Ceti library states; found
by a reconciliation of all 76 supplier contracts against the current material). Each has a statement, proof sketch,
free locators (read on the PDFs in this session) and prerequisites:
- Layer LV.0: unit group of a finite-dimensional algebra (0.5); Zariski closures of abstract subgroups (0.15);
  the symplectic Lie algebra: simple, inner automorphisms (0.16); centre, closed normal subgroups and generation of
  `Sp(V)` by transvections (0.17); orbit maps and transporters (0.18). Sources: Milne iAG and LAG, LV20.
- Layer LV.1: local Artin map on units onto inertia (1.6); continuous Galois characters as idele class characters
  (1.7). Source: Milne CFT.
- Layer LV.3: connectedness of complex points (3.10). Source: SGA 1 XII 2.4.
- Layer LV.5 (surface foundations that the plan expected from a "GeometricTopology Part II" / "AlgebraicTopology
  Part II", which do not exist): Jordan–Schönflies (5.2), Radó triangulation including the boundary case (5.3),
  duality and the intersection form for topological surfaces (5.5), collars/annular neighbourhoods/cutting (5.7),
  homotopy sequence of a fibre bundle (5.14), asphericity (5.15), centreless surface groups (5.16), the evaluation
  fibration (5.17), Hamstrom (5.18), lifting homeomorphisms to covers (5.24). Sources: Gallier–Xu App. E, Hatcher,
  Farb–Margalit v5.0; boundary collars from Tau Ceti's `IsLocallyCollared.isCollared` (current library).
- Layer LV.7: finite surjective morphisms preserve dimension (7.3). Source: Stacks 0ECG.
- Layer LV.8: normalization and analytification (8.4; SGA 1 XII 2.1, 5.1, 5.3, 5.4); the connected kernel of an
  endomorphism of an abelian scheme over a smooth base in characteristic zero (8.9; LV20 §7.2, Milne AV); homology
  of the Jacobian and its Riemann form (8.11; Milne AV §18, III §2).

Other content changes:
- Supplier citations re-anchored to the sections that now state them (e.g. AbelianSchemes §A4.3, §A5.7;
  CrystallineCohomology §CR.2.3; ComplexComparisonPartII §C5.2 relative Hodge bundles; JacobianChallengePartII
  §§1.2–1.4 for the relative Jacobian polarization; ArithmeticGaloisRepresentations §1.3, §1.12, §7.6). Étale base
  change with torsion coefficients and the curve Galois category are cited, as the accepted LefschetzPencils
  package does, from TauCetiRoadmap CohomologicalPointCounting (pull request #196) through SchemeAndStackFoundations
  SF.2 (SF.2 itself delegates them there).
- Duplication with the current libraries: `Aff(q)` is stated on Tau Ceti's `AffineGroup (ZMod q)` (current
  library: translation/linear subgroups, order and Frobenius structure are cited, not restated; the Lean file uses
  its permutation image because the pinned Tau Ceti lacks it); the Legendre curve is the base change of the
  universal Legendre curve of TauCetiRoadmap ModularCurves Layer 4C. Other overlaps found by the sweep are partial
  (real-only Lagrangian dimension in Tau Ceti, symplectic bases, finite-group character determination, Hecke
  purity) and are cited where used.
- The plan's statement of `LV.6/kummer-cyclic-field` refers to a nonexistent part "(b) of the reductions"; the README
  uses the corrected statement of the previous package. Proposition 5.3's setting text is restated as "in setting Q".
- The review's corrections to the previous README (CM relative degree, componentwise rank, Kummer hypotheses,
  fibre transport notation) are kept.

## Checks run

- `lean-check research/blueprint/packages/MordellLawrenceVenkatesh/Suggested.lean`: exit 0, 65 warnings, all
  "declaration uses `sorry`", no errors or other warnings (shared build, Mathlib `082e2d37e8`, Tau Ceti `f790474`;
  the file imports only `Mathlib`).
- `python3 scripts/check_sorry_data.py` on the Lean file: no offenders.
- `python3 research/blueprint/intake.py check-files` on the four changed files: no problems.
- Generator-side checks (scratch, not committed): every `*Needs:*` reference points to an earlier target or layer;
  all cross-references resolve; every Lean declaration name occurs in the README; no forbidden words; the 95
  baseline declarations of the plan exist in the pinned index.
- Two independent Sonnet proofreads of the rendered README (process residues, stale references, grammar, citation
  tags, dependency order). Their findings on process words, broken sentences, ambiguous source-lemma numbers and
  untagged citations were applied; references of the form "Layer LV.k" inside proofs were kept where they point to
  a whole layer.
- Adversarial pass on the Lean statements and the worked numbers (Legendre `Δ` and `j` from Mathlib's
  conventions, `J₂(6) = 24`, the 810/135 count for `Aff(3)`, the fixed-space bound `2^g N^g`, admissibility of
  `q = 107`, the twist sign convention against Farb–Margalit v5.0 Proposition 6.3).

## Notes for the plan and for other roadmaps (no packet was edited)

- **Stage cycle risk:** MetaplecticAutomorphicForms `MP.0` cites `LV.3/lagrangian-symplectic-basis`; with
  `ED.4 → LV.3` (Strassmann) this closes the cycle ED.4 → LV.3 → MP.0 → … → ED.4 recorded in the
  EffectiveDiophantineMethods restructure proposal. MP.0 should import adapted symplectic bases from a lower owner.
- The plan's 76 requests should be rebuilt from the README's supplier contracts at the next plan revision: 27
  `extensionNeed` clauses are now targets here or are stated by the current suppliers as listed above.
- HeightsRationalPointsAndObstructions RP.4 and DiophantineApproximationAndTranscendence DT.2 own the declarations
  of Faltings's theorem and of the unit equation; this package proves them (11.6, 6.10) and says so.

## For the reviewer

Highest-value checks: the new targets of Layer LV.5 (statement scope and the cited pages), the boundary case of
Radó (5.3) and the abelian-kernel argument (8.9), and the claim that the three Faltings inputs move down. The
generator that produced the README from the packet and the reconciliation reports were scratch files of this
session and are not committed.
