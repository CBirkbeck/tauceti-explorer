# Handoff: BP-PadicHodgeTheory--R06.5 (first checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #969.

- Stages R06.5 and R06.6 of `PadicHodgeTheory`; part 1 is `PadicHodgeTheory--P7` (R06.1–R06.4, P7, P8), whose nodes this part imports.
- RS-01 (accepted) keeps both stages unchanged, so the current structure is used.
- 14 nodes: 11 theorems, 1 application, 1 construction, 1 definition; 15 API items, 10 unit tests, 9 planets (3 in R06.5, 6 in R06.6).
- Both stages are partial. The checker reports no errors.

## What is closed

R06.5:

- `crystalline-comparison-good-reduction` (planet): CP.2's comparison read through D_cris, with the Hodge filtration and weights. This is the item CP.2 lists as remaining.
- `abelian-scheme-dcris`: D_cris(V_p(A)) dual to H^1_cris; jumps −1 and 0. This answers MordellLawrenceVenkatesh LV.4 (g = 1).
- `abelian-variety-hodge-tate-weights` (planet): V_p(A) is de Rham with weights 0 and 1 for every A.
- `weil-pairing-duality`: duals, Tate twists and the determinant test.
- `elliptic-curve-ordinary-supersingular` (planet): the roadmap's required example.

R06.6:

- `kummer-representation` (construction) and `kummer-representations-semistable` (planet): every extension of Q_p by Q_p(1) is semistable, with explicit D_st for ramified K.
- `tate-curve-tate-module` and `tate-curve-filtered-phi-n-module` (planet). The second discharges the hypothesis of P7's `R06.3/tate-curve-weil-deligne-example`.
- `tate-curve-l-invariant` (definition, planet), with the classification of non-crystalline Kummer extensions by L.
- `good-reduction-iff-crystalline` (planet): proved through Grothendieck's criterion and Kisin's lattice classification. This answers MordellLawrenceVenkatesh LV.1/LV.4 and NeronModels R11.5's p-adic input.
- `semistable-reduction-semistable` (planet): via Raynaud and Berger's Théorème 6.2 (P7 R06.4).
- `multiplicative-reduction-elliptic-curves`: split, non-split and additive cases with v(j) < 0.
- `local-global-compatibility-good-reduction` (planet): the p-adic and ℓ-adic Weil–Deligne parameters agree at good places and at multiplicative elliptic places.

## What remains

- **R06.5, modular forms.** The applications to modular curves, Kuga–Sato varieties and Shimura curves:
  - V_f crystalline at p ∤ N with Frobenius polynomial X² − a_pX + χ(p)p^{k−1};
  - the semistable and potentially semistable cases at p | N.
  - Sources to find: Scholl (Invent. Math. 1990), Faltings, T. Saito (Invent. Math. 129, 1997; T_SAITO in the roadmap references).
- **R06.6, R19 inputs.** Local–global compatibility for modular forms (Saito) as consumed by AutomorphicGaloisRepresentations R19.5.
- **R06.6, converse.** The semistable criterion (V_p(A) semistable ⇒ semistable reduction), and the Weil–Deligne comparison for other bad reduction.
- **R06.5, semistable models.** The general semistable geometric branch (CP.4 Hyodo–Kato; WeightsInEtaleCohomology R34.3).

## Requests made

- Tau Ceti EllipticCurves Layer 4: the Tate curve, its uniformisation, Tate's theorem with twists, potentially good ⇔ v(j) ≥ 0.
- ArithmeticGaloisRepresentations R01.6: Tate modules, H^1 duality, the Weil determinant, P_v and base change.
- AbelianSchemesAndArithmeticModuli A3 (Weil pairing) and A4 (Hodge exact sequence).
- NeronModelsAndSemistableAbelianVarieties R11.1 (good reduction via Néron models) and R11.3 (Grothendieck's criterion at p, semistable reduction, Raynaud's uniformisation).
- ClassicalAdicEtaleCohomology H5: Huber's algebraic–analytic comparison for proper smooth varieties, beyond curves.
- ArithmeticGaloisDuality R02.1: Kummer theory in continuous cohomology.

## Suggested Lean file

It imports Mathlib only and was compiled with `lake env lean` against the Mathlib 082e2d3 build. It elaborates, with `sorry` as its only warning.

It prototypes:

- the Kummer cocycle and representation;
- the Tate-type normal form, its L-invariant and the isomorphism criterion;
- the ordinary/supersingular trace dichotomy (three `decide` tests on 11a1).

Theorems that need V_p(A), D_cris or the Tate curve are comments that name the missing object.

## Source issues (new, PadicHodgeTheory/E40–E47)

Berger's survey (arXiv v1):

- E40: φ(Y) = Y^p should be φ(Y) = pY.
- E41: an exponent n − 1 in the log[p̃] series should be n.
- E42: the torsion index range 0 ≤ i, j < p^n − 1 should end at p^n − 1 inclusive.
- E43: the isomorphism E ≅ E_q is claimed for all multiplicative reduction; it needs split reduction (15a1 at 3 is a counterexample).
- E44: the "ℓ-invariant" log_p(q/p^{v_p(q)}) is not an invariant of V; the invariant is log_p(q)/v_p(q).
- E45: Hom(T_pA, Z_p(1)) ≃ H^1 is off by a Tate twist.

Brinon–Conrad (2009 notes):

- E46: the Tate-curve parameter c_q = −λ(q) should be −λ(q)/ord_p(q).

Coleman–Iovita (arXiv v1):

- E47: "if" and "only if" are swapped in crediting Fontaine.

All eight are recorded in the packet's sourceIssues.

## Sources

All sources are public:

- Berger, arXiv:math/0210184v1;
- Brinon–Conrad, math.stanford.edu/~conrad/papers/notes.pdf;
- Coleman–Iovita, arXiv:math/9701229v1.

Sources not read:

- Chapter II of Coleman–Iovita, which is absent from arXiv;
- Berthelot–Breen–Messing;
- Silverman's Advanced Topics;
- Mazur–Tate–Teitelbaum.

The acceptance values (a_p of 11a1 and 15a1, and q and L of 11a1 at 11) come from a Python point count and q-expansion inversion run during the job; the script is not committed, and its results are recorded in the acceptance lists of the nodes.
