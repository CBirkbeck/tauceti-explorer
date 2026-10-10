# Independent package review: Abelian varieties isogenous to no Jacobian

**Verdict: needs_changes.** Reviewer: Codex, session `codex-OT5kIS`,
`independent-review-REV-PKG-AbelianVarietiesIsogenousToNoJacobian`, 2026-10-10.
This session did none of the package or accepted design work. This is a completed
package review, not a checkpoint or a request to resolve the two supplementary
research problems before the main theorem can be planned.

The README faithfully presents all 95 accepted targets. Its native Lean fragment
elaborates, but 92 targets occur only in comments, including 16 definitions or
constructions and their missing APIs and tests. In addition, several essential
quantitative inputs have named prospective owners but no cited supplier layers.
These are substantive package requirements under PROTOCOL §§13 and 20 and the
upstream no-gaps rule. Acceptance of the earlier target-level planning pass did
not certify these geometric signatures or close those supplier gaps.

## Required changes

### R1. Supply the missing Lean interfaces and examples

`Suggested.lean` declares only the guarded matrix correspondence (0I), its
five API lemmas and three examples; the denominator-invertibility lemma (3J);
and the Newton series (9A), its five API lemmas and three examples. There are
11 admitted theorem declarations and six admitted examples, yielding 17
`sorry` warnings. The matrix blocks, nonzero determinant, complex casts,
Newton normalization and envelope hypotheses agree with their README targets.
The denominator statement correctly uses the signed full matrix and does not
assume preservation of polarization.

The other 92 target blocks are explicitly marked `Omitted`. A comment carrying
a definition, an API name or a test description is not a Lean signature or an
`example`. The missing totals are 16 definitions/constructions, 75 API items
and 51 tests, as well as the remaining theorem/comparison targets. In particular
there are no geometric signatures for Torelli, Rosati, genericity, theta models,
quantitative avoidance or its arithmetic consequences. The following table
makes the extent reproducible against the accepted packet and the README's
milestone labels:

| Layer | README targets | Typed targets | Definitions/constructions | Planned API items | Planned tests |
| --- | ---: | ---: | ---: | ---: | ---: |
| 0, MZ0 | 9 | 1: 0I | 4 | 18 | 12 |
| 1, E0 | 3 | 0 | 0 | 0 | 0 |
| 2, E1 | 11 | 0 | 2 | 9 | 6 |
| 3, I0 | 10 | 1: 3J | 1 | 4 | 3 |
| 4, G0 | 8 | 0 | 0 | 0 | 0 |
| 5, C0 | 8 | 0 | 0 | 0 | 0 |
| 6, T0 | 14 | 0 | 5 | 28 | 18 |
| 7, C1 | 5 | 0 | 0 | 0 | 0 |
| 8, A0 | 12 | 0 | 0 | 0 | 0 |
| 9, X0 | 6 | 1: 9A | 3 | 15 | 9 |
| 10, T1 | 4 | 0 | 1 | 4 | 3 |
| 11, X1 | 5 | 0 | 2 | 7 | 6 |
| Total | 95 | 3 | 18 | 85 | 57 |

The header saying that upstream's suggested file is not exhaustive does not
remove the explicit package requirement to include the plan's definitions,
theorems, API lemmas and tests. Preserve the honest handling of unstated
conditions: PROTOCOL §13 forbids manufacturing `Prop` fields, opaque geometric
carriers or `def _ : Prop := sorry`. Use genuine library/supplier objects and
state the available interfaces against them; identify any remaining unstatable
condition precisely. This review leaves the compiling fragment intact because
inventing the missing geometric contracts would change the accepted design.
The admitted examples are signature checks, not executed proofs of the tests.

### R2. Resolve the unlocated quantitative supplier contracts

The README's scope table and following three paragraphs explain the missing
strengths accurately, but naming a Part II does not identify a roadmap layer
that supplies them. The direct prerequisite tables still cite qualitative
stages for consumers needing those stronger statements:

| Required shared input | Affected milestones | Current reference and deficiency |
| --- | --- | --- |
| Elliptic isogeny-degree estimates; rational Rosati discriminant, degree/length and cusp-value bounds | 1C, 2D, 2H, 3H–3I, 5F–5G, 8C | `FaltingsFinitenessAndIsogenyTheorems:R28.4` and the named Part II: R28.4 is a qualitative Tate/isogeny criterion, without these numerical outputs. |
| Uniform connected Pila blocks, semialgebraic image control, Ax–Lindemann and the weakly-special image dichotomy | 2F–2H, 7C–7D | `LogicAndDefinabilityInNumberTheory:LD.6` and the named Part II: the existing packet has no uniform block theorem or these full image contracts. |
| Quantitative CM orbit lower bound and bounded-discriminant finiteness | 8I | `ComplexMultiplicationAndExplicitReciprocity:CM.0`, `CM.2` and the named Part II: orders and qualitative reciprocity do not imply the absolute quantitative estimate. |

The accepted packet already records these supplier-design gaps; they are not
new mathematical errors introduced by packaging. Replacing its gap list by
supplier prose does not establish the layer references required for an upstream
package. The revision must cite actual owner layers with the necessary
hypotheses, in the permitted package/bundle order, and update every affected
direct input. Do not invent stage identifiers or duplicate the owners' general
theory here. Read PROTOCOL §15 and WORKERS' upstream-tiers rule when reconciling
these references. Not every one of the packet's 27 gaps is an independent
package rejection: ordinary proof refinements can remain work to implement;
these particular cases lack the supplier targets the package says it imports.

## Six requested checks

1. **Upstream form: structure and size pass; prerequisite completeness fails
   at R2.** The README has scope, conventions, existing declarations, twelve
   ordered layers, 95 mathematical milestones, definition APIs and examples,
   direct inputs and references. At 89,426 bytes it is below 200 KB. I read the
   current upstream JacobianChallenge and RealAlgebraicGeometry READMEs and
   checked IntegralLattices Layer 2F and relevant suggested files. The density
   is appropriate. The two final research problems are explicitly separated
   from the avoidance theorem rather than claimed as proved consequences.
2. **Fidelity to the accepted plan: pass for the mathematical prose, with R2
   still required for package dependencies.** Every target, all 85 API names
   and all 57 test names appear. Compared statements and direct prerequisites,
   including the changed notations and locally numbered references. The
   package imports Integral Lattices 2F instead of re-planning successive
   minima: squared minima are converted to lengths and independent witnesses
   are not called a basis. Real Algebraic Geometry owns general semialgebraic
   projection. No new general theory is claimed here.
3. **Own words and locators: pass after corrections below.** The target
   organization is mathematical, not a source-section synopsis. Checked the
   public MZ20 mathematical text, §§1–5.4, printed pp.635–670, against the
   claims. Checked Demailly II §8.2, (8.7), (8.10), pp.118–121; Le Fourn
   Definition–Proposition 6.4(a,b), p.181 and the full-level convention in
   Definition 6.5, p.182; BCCR §2, p.3, preceding Definition 2.1. References
   to older theta and quantitative results are indirect locators from MZ20;
   this review does not certify having read those original proofs or books.
4. **No process in the roadmap: pass.** No job identifiers, packet filenames,
   review decisions, checkpoints or coverage statuses appear in the README.
   Mathematical supplier and layer names are retained. Review findings and
   validation counts are confined to this report, review.json and handoff.
5. **Suggested Lean: elaboration passes; completeness fails at R1.** Ran
   `lean-check research/blueprint/packages/AbelianVarietiesIsogenousToNoJacobian/Suggested.lean`
   independently before and after the prose edits: exit 0, no errors and
   exactly 17 warnings, all `declaration uses sorry`. The shared build is at
   Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
   `f790474821cf4256814db967cb154e7af3d0c369`. A successful compilation of
   three native targets cannot validate signatures that do not exist.
6. **Metadata: pass.** The file is exactly `topic = "math.NT"` plus a newline,
   a fitting single arXiv category for the arithmetic main results.

## Corrections made in place

Reworded 2A, 5E, 7E, 8A, 8B, 8F, 8G and 8H, and their matching Lean comments,
to avoid copying source prose. These changes keep the quantifiers, numerical
bounds, genus exceptions, geometric isogeny convention, constant dependencies
and existential bad-fibre interpretation. Rational-map indeterminacy remains
exceptional. No typed Lean statement changed.

Corrected the theta bibliography: pp.415 and 422–423 concern Masser–Wüstholz,
*Periods and minimal abelian subvarieties*, Annals 137 (1993), pp.407–458,
MZ20 reference [25], not Igusa's *Theta Functions*. Recorded that MZ20 p.666
also prints a conflicting [18, p.415] citation, rather than silently claiming
its original source had been verified. Igusa's order, normality, weight and
bounded-Fourier-index locators remain distinct. Removed an editorial “corrected”
from the layer overview.

## Mathematical boundaries retained

The rational Rosati pairing has the factor `2 Re` missing from the printed
trace identity (MZ20 §4, (22), p.653); the length of scalar multiplication is
therefore `√(2g)|n|`. The matrix estimates use the enlarged domain rather than
assuming ordered product diagonals. The horizontal offset uses the simultaneous
union bound `2d⁴+1`; it does not claim the source's sharper `2d³+1`. Theta
coefficient vanishing includes trace `≤W`, giving the strict order `>W` used
in the next step. Genericity exceptions for `g` odd or `g=2,6` do not include
`g=4`. CM counts concern distinct moduli points with specified finite-domain
multiplicity and the stated genus/GRH distinction.

The main degree `2^{16g⁴}` does not imply full rational sixteen-torsion.
Layer 10 asks for the actual arithmetic comparison and all field-degree factors.
Layer 9 constructs a compact real analytic parametrized image, not an embedded
curve or a globally closed hypersurface. In Layer 11, `G−g<G−1` for `g≥2`
and Demailly's singular complex-space version of Remmert–Stein justify the
algebraicity obstruction. A finite chart cover alone does not extend or glue
its analytic equations. These limitations agree with the accepted plan and
must survive revision.

## Additional validation and limits

`python3 scripts/check_blueprint.py research/blueprint/packets/AbelianVarietiesIsogenousToNoJacobian.json`
returned zero errors and zero warnings: 95 nodes, 85 API items, 57 tests,
15 baseline declarations, 27 gaps and 27 requests, with all twelve stages
planned and none closed. This is validation of the unchanged input packet,
not an upstream readiness certificate. Read all fifteen cited declaration
statements in the shared pinned source tree, the relevant reviewed audit rows
for abelian Hom/Rosati, qualitative Faltings and CM reciprocity, and nearby
link-map boundaries. Searched the current upstream additions and current Tau
Ceti abelian-variety/isogeny and Cholesky APIs; existing abelian varieties and
Cholesky must be imported, not redefined. No Lean build or lake update was run
in the read-only upstream tree.

The mathematical comparison does not establish formal proof closure of the
source leaves. Package acceptance should follow a revision addressing R1–R2
and an independent recheck of the changed supplier interfaces and Lean file.
