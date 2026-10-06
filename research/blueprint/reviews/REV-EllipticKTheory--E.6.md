# Independent review: EllipticKTheory E.6

**Accepted with corrections.** Reviewer: Codex — codex-t0ghx2;
`independent-review-REV-EllipticKTheory--E.6`, issue #6433, 6 October 2026.
The original submission was by Codex — codex-pMKZqt. This reviewer did not
write it.

The packet remains a complete target-level planning pass for E.6. Its stage
remains **planned**, with no remaining targets or mathematical gaps. The
StableReduction contracts and inherited arithmetic/K-theoretic interfaces are
planned inputs, so this is not closed or implemented mathematics.

## Counts and corrections

| Item | Reviewed result |
| --- | --- |
| Nodes | 6: one definition and five theorems |
| Per-node verdicts | 4 verified, 2 corrected, 0 unverifiable |
| API items | 14, including 3 added in this review |
| Definition tests | 3; 2 kind labels corrected |
| Source citations | All 10 locator/excerpt matches checked |
| Baseline declarations | All 10 confirmed at their recorded pins; 0 removed or replaced |
| Imported parent nodes | All 7 read and retained |
| Supplier requests | 2, both justified by the owning StableReduction layers |
| New nodes | 0 |
| New prerequisites | 1 accepted arithmetic-localization node |
| Source findings | 2 confirmed and 1 additional confirmed misprint |
| Planets | 3 new; 4 including the parent integral-part planet |
| Open mathematical gaps/questions | 0 |

Every substantive edit is listed here:

1. `minimal-model-localisation` now directly imports
   `ArithmeticKTheory:N.1/S-integers-localisation-of-torsion-class-group`.
   The previously cited `S-integers-as-a-localisation` is a conditional
   characterization for general Dedekind domains; alone it does not establish
   the required open immersion. The accepted supplier explicitly gives
   principal prime powers when the class group is torsion and a principal
   localization for finite sets. The corrected proof chooses
   `(a_v) = v^{h_v}` in O_F for v in S′ minus S, sets `a = ∏ a_v`, and obtains
   `O_{F,S′} = O_{F,S}[1/a]`. Thus the base map is the principal open D(a),
   including `a = 1` for the empty set. The original theorem and its hypotheses
   are unchanged.
2. The `smooth_37a1_minimal` and `nodal_37a1_minimal` test kinds change from
   `example` to the protocol's `computation`: they determine minimality for
   explicit small models. The third test remains a `non-example`.
3. Added `RegularProperModel.Hom.id_hom` and `.comp_hom` to the packet API and
   suggested file as named simplification lemmas. The original identity and
   composition operations promised these underlying-map equalities, but no
   named simp signatures exported them.
4. Added `RegularProperModel.toLocalModelHom` to both files. It explicitly
   supplies the local morphism comparison promised by the original
   `toLocalModel` API, using the actual pinned `TauCeti.Model.Hom` and the
   inherited generic-fibre tower comparison.
5. Added independent verdicts to both original `sourceIssues` and recorded
   the additional 0C5R misprint below. Added the top-level accepted review
   object with all six node verdicts.
6. The suggested file credits this independent review and explains the
   principal-open localization input. Its real imports, mathematical test
   comments and honest `sorry` status are retained.

The reader document is outside this issue's editable deliverables. Its
localization reference remains the conditional lemma; the packet now names
the accepted supplementary supplier needed to apply it. The three added API
items make existing reader contracts explicit and do not change its
mathematics. This report records those supplements for assembly.

## Mathematical checks by node

| Node suffix | Verdict and check |
| --- | --- |
| `minimal-arithmetic-model` | Corrected API/test metadata. Marked morphisms are over the base and induce identity on the fixed generic E; minimality is the outgoing-isomorphism condition. Regularity gives a reduced source, flatness gives a dominant generic-fibre projection, and properness gives a separated target, matching the existing equality theorem. Terminality is subsequently proved using positive genus. |
| `exists-locally-minimal-arithmetic-model` | Verified. The parent construction supplies a projective regular starting model. The nonsmooth locus has finite image B in the arithmetic base. A smooth fibre has no exceptional curve because its components have trivial normal sheaf. A local exceptional curve lies in a fibre and is also an exceptional Cartier curve globally. The projective Noetherian-base contraction theorem preserves projectivity and regularity at the contracted point; integrality and Dedekind torsion-free flatness preserve flatness. Each contraction lowers the total component count over B by one. |
| `locally-minimal-terminal-model` | Verified. Use the parent common resolution, a finite sequence of point blowups towards the arbitrary model. Each centre is vertical. Local positive-genus terminality forces the last exceptional curve to map to a point in the minimal target. The global blowdown universal property factors the map; induction finishes. Dominance and separatedness give uniqueness. No descent from an infinite collection of local maps is assumed. |
| `minimality-local-criterion` | Verified. Local minimality gives terminality by the preceding theorem. Terminality and marked-map uniqueness give outgoing minimality. For the reverse implication, construct a locally minimal model and use its terminal map from the outgoing-minimal model, which must be an isomorphism. Local properties transport across that isomorphism. |
| `unique-minimal-arithmetic-model` | Verified. Terminal maps both ways compose to identities by marked-map uniqueness. The isomorphism induces identity on E, and its localization is the unique local comparison. Elliptic translations or involutions do not contradict uniqueness because they change the generic marking. |
| `minimal-model-localisation` | Corrected direct dependency and first proof step as above. Retained primes have the same DVRs and local models, so the local criterion proves minimality after open restriction. Unique identity-marked maps give both the identity and composition coherence. There is no assertion of invariance under arbitrary ramified base extension. |

The seven imported parent nodes cover regular models, their existence, the
rational integral part, common resolutions, model independence, good-reduction
prime conditions and vertical residues. Their statements and direct
prerequisites were read. This continuation supplies the parent's explicit
arithmetic minimal-model uniqueness gap without duplicating those nodes.

The StableReduction layer 4 contract asks for the existing general
curve-on-surface projective contraction and its universal property over a
Noetherian base; the local-DVR resolution route is not incorrectly substituted
for that contraction. Layer 5 supplies the positive-genus local
minimal-model/terminality interface. Their actual roadmap targets were read.
The reviewed E.6 and StableReduction library-audit entries agree with this
ownership: numerical Weierstrass minimality and the existing DVR model carrier
do not implement regular arithmetic-surface minimality.

The target-level proof sketches need no additional lemma nodes. The API has
constructors, projections, category operations, simp statements,
extensionality, the outgoing characterization, isomorphism transport and local
comparison; the subsequent theorem nodes supply its universal property.
The three planets are the minimal regular arithmetic model, arithmetic
minimal-model theorem and uniqueness of the arithmetic minimal model. With
the inherited integral-part planet, the layer stays below the six-planet
limit. The StableReduction and JacobianChallenge roadmap documents were also
read for the upstream standard.

## Pinned baseline checks

All declarations were read from their modules using the exact pinned commits:
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. None was inferred merely
from its name or from a newer checkout.

| Declaration | Confirmed contract and location |
| --- | --- |
| `AlgebraicGeometry.ext_of_isDominant_of_isSeparated` | Reduced source, dominant comparison, separated target over a common base; the two maps agree over that base and after the dominant comparison. `Morphisms/Separated.lean:290`. |
| `IsRegularLocalRing` | Noetherian local ring, with maximal-ideal span finrank equal to Krull dimension. `RegularLocalRing/Defs.lean:51`. |
| `TauCeti.Model` | A flat finitely presented marked model over a DVR, with a field and fraction-field identification. Properness and regularity are additional properties. `StableReduction/Model/Basic.lean:44`; its `Hom` and category interface were read too. |
| `TauCeti.genericFiber` | Pullback as an over-category object for arbitrary commutative rings and an algebra map. `Fibers.lean:42`. |
| `TauCeti.genericFiberι` | The pullback first projection to the original total scheme. `Fibers.lean:48`. |
| `AlgebraicGeometry.IsProper` | Separated, universally closed, locally of finite type. `Morphisms/Proper.lean:42`. |
| `AlgebraicGeometry.Flat` | The affine flat-map condition, with the stalk formulation in the module. `Morphisms/Flat.lean:42`. |
| `AlgebraicGeometry.SmoothOfRelativeDimension` | Smooth morphisms with specified relative dimension. `Morphisms/Smooth.lean:130`. |
| `IsDedekindDomain.flat_iff_torsion_eq_bot` | Arbitrary Dedekind-base modules are flat exactly when their torsion submodule vanishes. `Flat/TorsionFree.lean:138–145`. |
| `TauCeti.genericFiberTowerIso` | Iterated/direct scalar-extension isomorphism for a commutative-ring algebra tower with `IsScalarTower`; projection compatibilities immediately follow. `Fibers.lean:331–370`. |

Localizing a proper arithmetic model supplies finite type over a Noetherian
DVR and hence finite presentation, as required by `TauCeti.Model`. The local
comparison explicitly specifies localization, the common fraction field and
the scalar tower. Its generic-fibre marking is therefore stronger than an
unmarked isomorphism of total schemes.

## Public sources and findings

Downloaded versions independently match all three packet SHA-256 values:

| Source | Text read and hash |
| --- | --- |
| [Conrad, *Minimal models for elliptic curves*](https://math.stanford.edu/~conrad/papers/minimalmodel.pdf) | Notes of 21 November 2015, §3 pp. 6–9 and Corollary 4.7/proof p. 12; `1093586aee9844c3c37f518d7b241175d4a64c3912839ecdd485c4c185a8b87a`. |
| [Stacks, *Resolution of Surfaces*](https://stacks.math.columbia.edu/download/resolve.pdf) | ed88ff78, 14 July 2026, §54.16 pp. 45–51 and §54.17 pp. 52–54; `6c6efffce73e982fa6c090792042a1842e7f53816a18c24ea172749571fa3db7`. |
| [Stacks, *Semistable Reduction*](https://stacks.math.columbia.edu/download/models.pdf) | Same edition, §55.8–55.10 pp. 33–40; `4e0302b02650015a5dae9fb1abb49656feb41326a66294098daecc736ea87b0c`. |

All ten node excerpts occur at their stated locators. The DVR results keep
smoothness, projectivity, the constant-field condition and positive genus;
arithmetic applications are justified by explicit arguments and supplier
contracts rather than attributed directly to those DVR statements.

All source findings are confirmed notation slips affecting no theorem:

- `E6-mapping-direction`: in [55.10.2](https://stacks.math.columbia.edu/tag/0C9Z),
  the first proof arrow must go from the arbitrary model Y to the minimal X,
  consistently with the statement and following sentence.
- `E6-contraction-ambient`: in
  [54.16.9(2)](https://stacks.math.columbia.edu/tag/0C2N), the image open X′
  belongs to the contracted compactification X̄′.
- Added `E6-factorisation-open`: in
  [54.17.1](https://stacks.math.columbia.edu/tag/0C5R), the maximal isomorphism
  open contains the codimension-one points of Y. The cited
  [33.17.3](https://stacks.math.columbia.edu/tag/0BFP) states precisely that
  target condition. The printed final V makes the sentence tautological.

The official HTML tags were checked on 6 October 2026. Their comment sections
and searches for existing corrections were checked; no correction of these
slips was found. The 0C2N comments address a separate case-numbering correction.

## Tests and Lean validation

The concrete tests detect three plausible mistakes: rejecting a smooth proper
minimal model; requiring every fibre of a minimal model to be smooth; and
equating regular proper flat models with minimal ones. Independently checked
the discriminant `64 − 27 = 37`, the unique affine singular point `(5,18)`
modulo 37, the derivative values `−74` and `37`, and the integer value
`f(5,18) = 222`, which is not divisible by 37². The quadratic tangent form is
nondegenerate in characteristic 37, so the singular fibre is nodal; the
valuation-one discriminant and irreducible fibre give the stated local test.
The point blowup has the actual nonisomorphic outgoing contraction, and the
two prime-inversion checks agree with the localization theorem.

`python3 scripts/check_blueprint.py
research/blueprint/packets/EllipticKTheory--E.6.json` passes with **zero errors
and zero warnings**, using the available pinned declaration index.

The **full suggested Lean file was not compiled**: `lean-check` stops at the
first import because the prebuilt object for
`TauCeti.AlgebraicGeometry.Curves.StableReduction.Model.Basic` is absent. The
`TauCeti.AlgebraicGeometry.Fibers` object is absent too. No libraries were
built or updated and no language server was started.

An independently checked Mathlib-only subset exits successfully, with **only
14 `sorry` warnings and no errors**. To check it, temporarily omit the two
Tau Ceti imports and the entire `LocalComparison` section, replace the
generic-fibre projection by its definitionally equal pullback first
projection, and add the individual Mathlib Flat and Proper imports. Restore
the full file afterwards. This checks the imported parent carrier, marked
Hom/category/minimality signatures, both new simp lemmas, the expressible
parts of the three tests, terminality implying outgoing minimality, and the
marked isomorphism from maps both ways. It does **not** check
`toLocalModel`, `toLocalModel_totalIso`, `toLocalModelHom`, the full concrete
geometric test instances, or the five commented arithmetic theorems.

Those omitted geometric statements are clearly named comments because their
planned scheme/genus/minimality vocabulary is missing, following the
protocol's missing-vocabulary rule. They are not empty predicates or assumed
conclusion fields. Elaborated signatures using `sorry` establish no proofs.
Every node's implementation status remains `unchecked`.

## Orchestrator disposition

No mathematical questions or unresolved contradictions remain in this scope.
Accept this reviewed continuation and use its corrected packet/API contracts
at assembly. Full signature checking remains an implementation task when the
real Tau Ceti modules are available in a prebuilt environment; it is recorded
as a validation limitation, not as a mathematical closure claim.
