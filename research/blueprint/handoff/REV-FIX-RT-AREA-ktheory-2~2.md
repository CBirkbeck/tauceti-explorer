# Handoff: REV-FIX-RT-AREA-ktheory-2~2

Completed independent review, Codex `codex-gM56zj`, 2026-10-17,
[issue #5159](https://github.com/CBirkbeck/tauceti-explorer/issues/5159).
The [review report](../reviews/REV-FIX-RT-AREA-ktheory-2~2.md) has every
finding's verdict, source locators, version hashes, mathematical controls and
compiled-file hashes. Seven permitted packets are accepted for the assigned
planning fixes; SchemeAndStackFoundations is **needs_changes** for /38.
Nothing was promoted manually. This is a completed review, not an unfinished
implementation checkpoint. Do not erase its negative decision by treating a
passing schema check as mathematical approval.

## Nisnevich correction still required

The existing `SchemeAndStackFoundations--SF.2.json` already owns:

- `SchemeAndStackFoundations:SF.2/nisnevich-covering`
- `SchemeAndStackFoundations:SF.2/nisnevich-topology`
- `SchemeAndStackFoundations:SF.2/elementary-distinguished-square`
- `SchemeAndStackFoundations:SF.2/distinguished-square-mayer-vietoris`
- `SchemeAndStackFoundations:SF.2/nisnevich-sheaf-criterion`
- `SchemeAndStackFoundations:SF.2/nisnevich-points-henselization`
- `SchemeAndStackFoundations:SF.2/brown-gersten-vanishing`

Reuse these targets; do not create another Nisnevich foundation. The aggregate
packet now requests them explicitly. The part's independent review of
11 October, `REV-SchemeAndStackFoundations--SF.2.md`, is needs_changes, with
unresolved general-gerbe H² bridges and Suggested-file defects. Those defects
are not an allegation that its narrowed Nisnevich statements are false, but
this job cannot approve or change that excluded part.

The permitted aggregate still lacks the requested arbitrary-qcqs
spectrum-valued descent theorem. Complete it with a source and exact
site/universe, sheaf versus hyperdescent, finiteness and spectrum-realization
hypotheses. Morel–Voevodsky §3.1, pp.95–102, and Voevodsky's bounded cd-structure
theorem establish the recorded finite-dimensional noetherian set/simplicial
route, not that broader assertion. Preserve F(empty)=point (sets/spaces) or
zero (spectra). Use ordinary henselizations and the canonical residue-field
map. Strict henselizations would test a different topology.

Use Mathlib `MayerVietorisSquare.mk'` after the appropriate set-sheaf theorem.
`mk_of_isPullback` demands both covering legs mono and cannot handle a general
étale leg. `SheafCondition` is an ordinary categorical pullback condition,
not a spectral descent adapter. Once the supplier is approved, S.4 and M.5a
should import its exact nodes. S.4 still owns the K-theory excision proof and
the comparison needed to use the geometric criterion.

## Exact consumer updates and reader reconciliation

The accepted `MotivicEtaleKTheory--M.5d.json` already exports the early nodes
previously requested as a split of all M.8:

- `MotivicEtaleKTheory:M.8/finite-etale-chern` is now a prerequisite of
  HB.1 `finite-coefficient-K3-and-the-chern-class`, `the-chern-class-map-c-zeta`,
  `hutchinson-chern-class-agrees`, and HB.2 `bott-element`,
  `chern-sign-conventions`, `soule-formula-in-degree-three`.
- `MotivicEtaleKTheory:M.8/deligne-regulator` is now a prerequisite of
  ER.2 `the-deligne-cohomology-target` and `the-normalisation-factor`, and P.5
  `unramified-weight-two-class`, `goncharov-deligne-complex-comparison` and
  `regulator-induces-beilinson`.

The coefficient-tower/reduction and raw Soulé specialization, the fixed
CGZ/GSWZ/Hutchinson sign comparison, logarithmic open-variety realization,
Schneider/Nekovář comparison and current-regulator comparison remain requests
or gaps. The finite-Chern supplier's positive-degree/additivity, invertible
coefficients, factorial/sign and product restrictions must survive any export.
The Deligne supplier has smooth projective scope and genuine Tate-lattice
normalization; its Hodge/MC.2 realization proof gap is not closed.

Readers were outside this issue's allowlist. Their next authorized editor
must synchronize `readmes/HabiroNumberFields.md`, `EllipticRegulators.md` and
`Polylogarithms.md` with these exact prerequisites and remaining requests;
remove the obsolete claim that these two M.8 exports do not yet exist.
In `EllipticKTheory.md`, correct the Harder proof-step's stale T.5 pointer to
`K2SymbolsBrauer:T.2:symbols/milnor-global-positive-characteristic`.
In `SchemeAndStackFoundations.md`, record the existing SF.2 supplier and
unresolved broader spectral theorem without duplicating targets.

All eight Suggested files now follow the binding statement-only shape:
real-bodied light definitions over existing carriers, native end signatures
and discriminating examples. Full mathematical targets, APIs and tests remain
in the packets and existing readers. The report lists the retained signatures
and omitted heavy families for the next reader/package reconciliation. Do not
restore admitted data or provisional K-functors merely to match an old reader's
declaration catalogue. A later package job should align its prose names to the
actual native signatures and keep the remaining targets in prose.

## Excluded-owner work, not implemented by this review

Dependencies below are supplier → consumer. Before applying any coarse edge,
use the exact current producer and check the combined graph; this review did
not certify a global replay of all historical integrations.

| Findings | Owner and concrete remaining work |
| --- | --- |
| 2 | HB.9 `constant-term-is-the-unit` currently consumes the conditional HB.2 refinement. Supply every evaluation/CRT/normalization premise or add and consume the unconditional comparison at HB.5 after the already-owned HB.4 Andrews–Gordon evaluation. Preserve δ^(-1/2) and source issue E46. No HB.4→HB.2 edge. |
| 3, 30 | RT.1/RT.4:q-Hodge: actual Devalapurkar image-of-J and relative THH base/twist/equivariance; solid-spectra extension of VS.2; precise even-filtration and étale-lift hypotheses. Keep p=2 separate. |
| 6 | Kato owner: expose the early L1 modular-unit K₂ symbols and norm/descent maps for ER.7 without importing the entire later Euler-system stage. |
| 15 | D.1→D.2 and V.4→D.2; fix the actual Coleman dilogarithm convention and retain the regulator comparison, not just a functional identity. |
| 16–17 | Maintainer: remove stale coarse M.1→HB.6 and unrelated KU-existing/KU-continuous edges; forward RS-08 finite-Chern/Galois dependencies to HB.1; use the accepted RS-10 route; point the external HABIRO convention comparison to V.3. |
| 18, 24 | M.8 owner: expose the remaining explicit finite coefficient/product and logarithmic/convention APIs from the existing early nodes. Do not recreate a split already present or import the late whole stage to obtain them. |
| 21–22 | Finite/local owner: L.1's common all-degree transfer theorem→V.5 with both composites. Arithmetic N.5/N.8→V.5 computations and forwarded integration; N.8 is outside the permitted N.1 part. |
| 23, 27 | Maintainer: migrate analytic V.3 reservations to P.1/P.2 together with aliases and incoming references. Keep V's torsion-sensitive algebraic comparisons. Use early V.6 certificates separately from late P.2/R.7/D.2 formulas; P.2 gives proportionality, R.7 exact normalization. |
| 25 | QT.5 imports P.2's oriented tetrahedron/Bloch–Wigner theorem, retaining triangulation/gluing and manifold assembly; Tau GeometricTopology remains the generic geometric supplier. |
| 26 | I.2 owns the early completed-unit map; L-function/Iwasawa consumers distinguish weak cyclotomic, strong and abelian Leopoldt. The uncompleted diagonal is injective; prime-to-p torsion is removed by completion. |
| 28–29 | RT.5 imports RT.4:q-Hodge and RT.4:Habiro-comparison, HQ.3 through those. H.6 supplies actual Burklund multiplicative Moore towers with coherences and E₁/E₂/modulus hypotheses; no arbitrary S/m E∞ assertion. |
| 31–32 | HR.6→RT.4:Habiro-comparison, using Wagner Corollary 3.13. Follow accepted RS-33's early H.5:spectra concrete pairing/operadic route, reexported by H.5:S-delooping; K.7 supplies the actual external K-product. |
| 33–37 | RT.2→L.4 for the generic genuine-equivariant comparison; preserve L.4's arithmetic application. Keep rejected /34 unchanged. Separate early nilpotent DGM from later henselian CMM. PR.4 syntomic objects→RT.6 with actual completeness/base hypotheses; DD.0/DD.2→RT.1, retaining HKR and the B/de Rham comparison. |
| 39 | Correct the old handoff: R09.1→S.5/projective-bundle-cohomology; R09.7a→S.5/regular-blowup-geometry→S.5/blowup-formula. The actual flag consumer is S.6/complete-flag-bundle, importing R09.1 and S.5. S.7 is not the blow-up formula owner. These exact imports already appear in the current Scheme-K packet; audit any stale coarse/forwarded links against them. |
| 40 | S.2 imports the StableReduction/Jacobian C proper coherent-pushforward package at its actual proper/finitely-presented/locally-noetherian scope. Distinguish coherent S-flat base change, relative-dimension-one vanishing, Gorenstein duality and arbitrary-base/perfect-complex targets. Generalizations remain explicit additional work. |
| 41–42 | Remove S.6→M.4 in favor of the genuine later M.6b use, S.6→Z.5 in favor of Z.3/S.2, and S.7→Z.6 in favor of S.2/S.5; reconcile forwarded copies. S.3 supplies N.2's shared localization interface; N.2 retains arithmetic support/residue and classical-row applications. |
| 43 | RT topological Adams operations: distinguish unstable integral BU/K₀, stable multiplicative operations after inverting k, and ℓ-complete unit-k scope. Preserve the Bott-invertibility obstruction to an integral unital periodic-KU map for nonunit k. |
| 44–46 | Import current Tau DGAInfinity 8/9 for Hochschild/Morita/Chern and 5 for Perf(A), retaining RT's cyclic/B/SBI structures and S.1's scheme-local/affine comparison. K.2:plus/K.5/K.7 supply RT.3's actual functor, relative fibres and product; request only supplied multiplicative refinements. |

Findings /47–52 were not part of the reviewed implementation issue: coarse
T.4 consumer relocation; Schappacher–Scholl 1991 plus erratum source work;
historical V.3 nonunit wording; HB ordinary-unit versus cyclotomic-unit audit
wording; definite ownership/proof planning of the weight-four Zagier theorem;
RT.4/substage metadata repair. Their individual report rows explain which
permitted packet contracts already have correct wording. Do not mark these
external jobs done from this review.

## Validation receipts

Every permitted packet passes `scripts/check_blueprint.py` with the pinned
declaration index: zero errors and warnings. All eight final Lean files compile
with `lean-check`, sequentially, with only admitted-theorem/example warnings;
all pass `scripts/check_sorry_data.py`. The report preserves their final hashes.
No link map or restructure proposal is in this review. File-rule, preservation
and whitespace checks pass. No build or language-server process remains.

Keep original GQ82, Bass–Tate, Keune, refined Bloch–Wigner and regulator/source
comparison gaps visible. No original theorem proof was supplied by the
arithmetic controls or by the successful admitted Lean elaboration. Earlier
reviews and source issues remain historical evidence, not freshly reaccepted
claims. Source files and scratch computations need not be retained: their URLs,
locators, outcomes and relevant version hashes are in the report.
