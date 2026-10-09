# Independent package review: Metaplectic automorphic forms

**Verdict: accepted after corrections.** Reviewer: Codex (GPT-6), session
`codex-Fjr6hF`, 2026-10-09. This session did not produce the package being
reviewed. Review scope is PROTOCOL §§13 and 20: the package against its accepted
plan, upstream guidance and existing library interfaces. It does not certify
implementation or repeat a full proof audit of all cited sources.

## Findings and corrections

1. **Upstream form — passes.** The introduction states scope, neighbouring
   owners and conventions; nine successive layers give mathematical targets,
   hypotheses, sources, prerequisites and definition APIs/tests. The form was
   compared with current ClassFieldTheory, representation-theory and compact-group
   roadmaps. README size is **199,805 UTF-8 bytes**, below the 200 KB limit.
2. **Fidelity and boundaries — passes.** Both accepted inputs,
   `MetaplecticAutomorphicForms--MP.0.json` and
   `MetaplecticAutomorphicForms--MP.8.json`, were compared with the package.
   All **261 targets** are present: layer counts are 18, 7, 10, 44, 8, 16, 22,
   51 and 85 for MP.0 through MP.8. All **293 API items** and **284 tests** are
   represented; every definition/construction has at least three tests. The
   original mathematical hypotheses remain in target paragraphs or their
   explicitly indexed shared settings. Shortened titles retain source locators.
   No additional mathematical claim requiring a new plan was introduced.
3. **Own words and citations — passes.** The package states results and
   construction requirements rather than reproducing source passages or source
   section summaries. Targets carry theorem, equation or section locators and
   printed/PDF page references. The critical independent source comparisons
   listed below support the retained normalization choices.
4. **Process-free reader files — passes after correction.** Removed package
   history, source-reading status and revision narratives from the Lean
   signature inventory. Preserved its mathematical targets, API/test names,
   supplier categories and explanations of absent signatures. The introductory
   prototyping note required by §13 remains. Inventory wording now matches the
   README's original-kernel requirement for the Friedberg–Hoffstein comparison.
5. **Suggested Lean — passes.** Independently ran
   `lean-check research/blueprint/packages/MetaplecticAutomorphicForms/Suggested.lean`
   twice. Both runs exited successfully with **0 errors, 639 warnings for
   `sorry`, and 0 other warnings**. The shared checker uses the required Mathlib
   `082e2d3` and Tau Ceti `f790474` baseline; the Mathlib checkout was independently
   verified. Individual module imports and the standard prototyping header are
   present. Final changes are comments only; a lexical comparison confirmed
   that active Lean tokens are unchanged from the reviewed input.
6. **Metadata — passes.** `metadata.toml` is exactly
   `topic = "math.NT"` followed by one newline, appropriate to the automorphic
   and arithmetic targets.

MP.0.13 previously asked contributors to give the factor-set extension a product
topology that the current Tau Ceti library already provides. It now names
`TauCeti.FactorSet.Extension.instTopologicalSpace`, `homeomorphProd` and
`Extension.isTopologicalGroup`, with the native closed-embedding/open-map
interfaces. The local-field local-compactness, second-countability and jointly
continuous isometry-action consequences remain the new targets. Its Lean
comment was corrected accordingly.

## Mathematical and ownership checks

The package preserves the coefficient-first Heisenberg convention, the
half-pairing coordinate correction, scalar versus double covers, and the
characteristic-not-two hypothesis without excluding dyadic local fields.
Regularized Siegel–Weil identities retain their quotient and measure conditions.
Half-weight versus weight-zero spectral parameters, Petersson normalization,
and finite/ramified local comparisons remain distinct requirements.

Current upstream roadmaps and the current Tau Ceti library were screened for
existing work, including the nine roadmaps missing from the atlas snapshot.
Relevant interfaces in IntegralLattices, ProfiniteArithmetic,
OrthogonalSpinGroups, SmoothRepresentationsOfLocalGroups and AdelicAlgebraicGroups
were read alongside native Heisenberg and factor-set extension declarations.
The finite quadratic-module/Gauss-invariant ownership stays with IntegralLattices;
generic smooth induction and adelic quotient/measure infrastructure stay with
their existing owners. Existing link-map entries do not force an additional
exact prerequisite. GZ.5 and BSD.2 remain downstream consumers rather than
inputs to the analytic interfaces that they consume.

Independent source spot checks included:

- [Kudla, *Notes on the local theta correspondence*](https://www.math.toronto.edu/skudla/castle.pdf),
  I.1–I.2, printed pp.3–5: Heisenberg group law, smooth Stone–von Neumann
  setting, scalar cover and its relation to the double cover.
- [Duke–Imamoğlu–Tóth, *Geometric invariants for real quadratic fields*](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf),
  §5, (5.16), printed p.965; §8, (8.9)–(8.11), printed pp.976–977:
  trace constants, spectral conventions, plus Kloosterman normalization,
  symmetry and the principal-part/Bessel factors.
- [Bump–Friedberg–Hoffstein, *Nonvanishing theorems for L-functions of modular forms and their derivatives*](https://www.wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf),
  §7, printed p.589 and pp.592–593, (7.8)–(7.11), (7.15)–(7.16): the
  independent arithmetic regularity route and local congruence systems. MP.8.70
  retains the accepted corrected middle modulus and its discriminating finite
  test rather than copying the printed formula.

The signature inventory and explicit omitted-hypothesis comments are essential:
several analytic or geometric carriers cannot yet be typed. Under PROTOCOL §13,
those conditions are omitted honestly rather than replaced with empty
`Prop` fields. Scalar/algebraic prototypes are fragments of the stated targets;
they do not establish the full source theorem for arbitrary functions or
independent data. The README remains definitive, and the supplier mathematics
and comparison maps remain requirements of the accepted roadmap.

## Validation

Both accepted inputs passed `scripts/check_blueprint.py` with zero errors and
warnings. Target/API/test inventory checks found no missing entry. The final
package passed Lean as described above; JSON, deliverable-path and whitespace
checks were also run before submission.
