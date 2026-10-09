# PKG-AutomorphicGaloisRepresentations — handoff

Job #7458, completed by Codex (GPT-6), session `codex-eHBbTk`, 9 October 2026.

## Deliverables and scope

The package is ready for independent review. The README assembles the accepted
six-layer plan into a mathematical roadmap with an introduction, supplier
boundaries, a single geometric-Frobenius convention, 27 grouped subsections,
all 66 targets, all 90 proposed API items and all 66 test specifications.
It is about 139 KB, below the 200 KB limit. Every target has its prerequisites
and precise source references; the bibliography identifies the editions and
page-number conventions. Results are stated in our own words. No source
passages, source-by-source summaries, PDF files or private paths are included.
`metadata.toml` is exactly `topic = "math.NT"`.

`Suggested.lean` joins the single accepted suggested file. Its body, beginning
with the import block, is unchanged; the introductory note has been consolidated
into the upstream form and explains its limits. It has 20 individual Mathlib
imports, 12 actual definitions, 9 theorem signatures and 55 `example` commands.
Many examples are algebraic components of the specified arithmetic tests.
The complete declaration/API inventory preserves the other proposed names and
contracts. In particular, **a name in that inventory is not an elaborated
arithmetic declaration**. Modular-curve cohomology, Hilbert eigensystems,
Weil–Deligne carriers, period comparisons and determinant laws still need their
named suppliers. They have not been replaced by arbitrary `Prop` fields or
empty predicates. Compilation of the prototype does not formalise the roadmap
or discharge those geometric constructions.

No packet, reader input, original suggested file, campaign, decomposition,
link map or library-coverage record was changed. No baseline theorem was
replanned. The reviewed audit for R19.1–R19.6 was checked; the relevant 13
baseline declaration statements were inspected at the pinned commits.
ArithmeticDirichletSeries and Multiquadratic were the two full upstream README
examples used for structure and density.

## Conventions and source checks

The chosen Hilbert object has good geometric polynomial X²−t_vX+q_vs_v,
determinant χ_{π,λ}ε_ℓ⁻¹, Hodge degrees
((w−k_τ+2)/2,(w+k_τ)/2), and weight w+1. Carayol's object is
ρ⊗χ⁻¹=ρ∨⊗ε⁻¹; Saito's weight is translated by w=2−w_S.
The classical cohomological factor is ρ in type (k,k−2), with the classical
arithmetic representation its dual. Skinner–Wiles and KW/CDN use different
arithmetic objects, as the dictionary records. Frobenius-semisimplification
retains N. The geometric Carayol/Saito hypotheses remain separate from the
unrestricted Hilbert and Skinner assertions; Kisin's residual hypothesis
remains on his proof route.

Additional primary-source checks used six public PDFs whose SHA-256 hashes
matched the accepted packet: Deligne–Serre, Carayol, DFG arXiv v2,
Chenevier v2, Dimitrov v1, and Skinner 2009. The checks focused on
Deligne–Serre's comparison and finite-image proof, Carayol's Theorems A/B and
conventions, DFG's factor/twist and integral realization, determinant
reconstruction, Dimitrov's large-image statements, and Skinner's symmetric-square
and period-family argument. This is not a claim to have reread all proofs in
every cited source. No library book was needed; no uncleared book was used.
Source material was kept only in disposable scratch space.

The package makes the accepted conditions explicit where compression could
otherwise change their meaning: nonzero normalized cohomology implies principal
series, while its dimension-two condition supplies the whole parameter;
σ₂≠0 is equivalent to the discrete-series branch; the type-Σ level product
excludes ℓ; residual conductor only divides N; and the fixed-character assertion
excludes the ambiguous sign case. It also retains the full old Hecke algebra's
nilpotents, the special reduced type-Σ localization, the division-free degree-two
determinant identity, and the whole-algebra tests for deformation conditions.
Source locators lacking page numbers were supplemented from the specified
versions. These are clarifications of the accepted statements, not changes
to their scope.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicGaloisRepresentations.json`: PASS, 0 errors, 0 warnings; 66 nodes, 90 APIs, 66 tests, 27 planets, 13 baseline declarations. The input is unchanged.
- `lean-check research/blueprint/packages/AutomorphicGaloisRepresentations/Suggested.lean`: PASS, exit 0, exactly 30 warnings, all `declaration uses sorry`, no errors. Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The package imports Mathlib only. Available memory was checked before the single compile; no build/update/cache command or language server was started.
- Coverage audit: each of the 66 authored target paragraphs occurs once, each of the 90 API names and 66 test names appears in both package files, and all six layers remain ordered. The accepted Lean body is identical from its import block onward.
- README audit: size below 200 KB; no programme job/review/checkpoint/packet language or private paths; references use specified source versions and theorem/section/page locators.
- `git diff --check`: PASS. Only the four issue-authorized deliverables are included.

## Imported obligations retained from the accepted plan

The source plan has 12 explicit gaps and 51 supplier requests. Packaging does
not close them or hide them in `sorry`. Their mathematical requirements are
preserved in the README's boundaries, target hypotheses and input lists:

1. GH.0/R14 supply the smooth resolved Kuga–Sato geometry, boundary comparisons and rational newform coefficient action. An individual Chow motive or descent merely from traces is not asserted.
2. Taylor's original Hilbert congruence/local-compatibility proofs remain secondary-source anchored, as in the accepted plan; Kisin's congruence reconstruction is stated at every precision. No claim of reading those inaccessible originals is made.
3. R18 and LPV supply bad-reduction, Drinfeld/supersingular and equivariant vanishing-cycle geometry, with the normalization-kernel monodromy map.
4. AG2, PadicHodgeTheory and PadicFamilies supply the symmetric-square geometry, crystalline lift, and the totally definite quaternionic eigenvariety over the required totally real field. Period continuation requires φ^{f_v} and P(X)=XQ(X) with Q(0) not a zero divisor.
5. R07/R20 supply the endpoint residual/lift criterion; upstream period lines and P7 supply the ordinary and Wach lattice comparisons. Weight p+1 is not within Fontaine–Laffaille's small-weight range and is not itself Barsotti–Tate.
6. R14/R18 supply the faithful generic rank-two multiplicity module for higher-weight/Hilbert families. Whole-ring determinant descent here assumes O-flatness; torsion/non-flat integral cohomological determinants are not inferred.
7. DDT's type-Σ checks require the actual finite-quotient local functors. Its reduced family's cofinal products do not apply to a nonreduced Hecke algebra; Kisin's conditions must be tested on finite algebras with nilpotents.
8. Momose's inner-twist openness refinement and R01.5's trace-zero analytic Chebotarev input retain their supplier obligations; large image does not mean unrestricted full GL₂.
9. A fixed quaternionic eigenform character does not give a finite-projective invariant line over a Hecke family. The latter is required separately.
10. Classical all-weight coefficient-prime comparison is cited to the classical case of Skinner's Theorem 1 and the accepted Saito references. This does not claim a new reading of Saito 1997's inaccessible original.
11. R34.6 must supply Saito's geometric weight theorem independently of the R19.5 coefficient-prime application, avoiding the retired R06.6 cycle. All-Hilbert purity follows the separate Blasius route.
12. At Nv≡−1 mod p with an unramified split residual object, the fixed sign is excluded; extending to that case needs the quaternion-uniformiser operator or an independent single-sign argument.

These are implementation/source obligations already in the accepted plan, not
unfinished package edits. The next action is independent package review. Review
should especially check the dictionary, full local parameters, and the explicit
limits of the compiled prototype. Nothing should be copied from disposable
scratch space, and there is no second claimed job.

## Target-to-section map

IDs below are the suffixes of `AutomorphicGaloisRepresentations:`. They locate
the unchanged source nodes; the README uses mathematical headings rather than
repeating a node-by-node packet layout.

| README layer / subsection | Source targets |
| --- | --- |
| R19.1 / Coefficient cohomology and the classical existence theorem | `R19.1/geometric-construction-and-the-eichler-congruence-relation`; `R19.1/lambda-adic-representation-of-a-weight-k-eigenform` |
| R19.1 / Parabolic structures and integral newform factors | `R19.1/parabolic-realisation-premotive`; `R19.1/newform-rank-two-realisation`; `R19.1/integral-structure-of-the-newform-premotive` |
| R19.1 / Kuga–Sato and rational newform projectors | `R19.1/scholl-projector`; `R19.1/newform-projector-and-coefficient-descent` |
| R19.1 / Residual eigensystems and sparse weight-one coefficients | `R19.1/mod-lambda-representation-of-a-mod-lambda-eigenform`; `R19.1/rankin-bound-for-a-cuspidal-eigenform`; `R19.1/weight-one-eigenvalues-outside-a-sparse-set` |
| R19.1 / Finite semisimple images and prime-to-order lifting | `R19.1/deligne-serre-condition-c`; `R19.1/bounded-semisimple-subgroups-of-gl2`; `R19.1/uniformly-bounded-residual-images-in-weight-one`; `R19.1/lifting-representations-of-groups-of-order-prime-to-l` |
| R19.1 / The finite-image Artin construction | `R19.1/weight-one-characteristic-zero-lift`; `R19.1/weight-one-cuspidal-irreducibility`; `R19.1/weight-one-artin-representation` |
| R19.2 / The unrestricted constructor and its conventions | `R19.2/all-cohomological-hilbert-representation`; `R19.2/hilbert-normalisation-dictionary` |
| R19.2 / The geometric Hilbert branch | `R19.2/carayol-sigma-lambda-construction`; `R19.2/carayol-twisting-and-determinant`; `R19.2/hilbert-modular-compatible-system-carayol-theorem-A` |
| R19.2 / Bad reduction and local geometric multiplicities | `R19.2/carayol-vanishing-cycle-filtration`; `R19.2/carayol-special-places`; `R19.2/carayol-local-fundamental-representation`; `R19.2/carayol-ordinary-cuspidal-places`; `R19.2/carayol-theorem-b` |
| R19.2 / Primitive restriction and cubic base change | `R19.2/carayol-primitive-restriction-lemma`; `R19.2/carayol-cubic-base-change-of-extraordinary` |
| R19.2 / Hodge–Tate degrees and global arithmetic properties | `R19.2/hilbert-hodge-tate-property`; `R19.2/hilbert-uniqueness-determinant-oddness-irreducibility` |
| R19.2 / CM and strong irreducibility | `R19.2/cm-hilbert-eigenform`; `R19.2/virtual-reducibility-implies-cm` |
| R19.2 / Nearly ordinary representations and CM lines | `R19.2/wiles-ordinary-hilbert-representation`; `R19.2/ordinary-cm-primes-split`; `R19.2/cm-ordinary-line-complex-conjugation` |
| R19.3 / Geometric and general weight statements | `R19.3/strict-compatibility-and-the-monodromy-weight-purity`; `R19.3/hilbert-ramanujan-conjecture`; `R19.3/monodromy-weight-purity-of-the-family` |
| R19.3 / Irreducibility and large images | `R19.3/classical-newform-irreducibility`; `R19.3/dimitrov-large-image`; `R19.3/ribet-momose-classical-large-image` |
| R19.3 / The strict fixed-form family and ordinary-prime selection | `R19.3/fixed-eigenform-compatible-family`; `R19.3/skinner-density-one-ordinary-primes` |
| R19.4 / Parameter normalization and unrestricted compatibility | `R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility`; `R19.4/all-hilbert-local-global-compatibility`; `R19.4/nearly-ordinary-hilbert-compatibility-away-from-p` |
| R19.4 / Conductors and quaternionic local characters | `R19.4/conductor-and-local-factors-classical`; `R19.4/quaternionic-sigma-place-local-form` |
| R19.5 / Geometric, residual and unrestricted comparison routes | `R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`; `R19.5/kisin-hilbert-coefficient-prime`; `R19.5/skinner-full-hilbert-coefficient-prime` |
| R19.5 / Local forms and endpoint weights | `R19.5/hilbert-local-behaviour-at-p`; `R19.5/endpoint-weight-local-contract` |
| R19.5 / Ordinary and nonordinary integral realisations | `R19.5/ordinary-refinement-and-saturated-lattice`; `R19.5/good-nonordinary-crystalline-wach-realisation` |
| R19.5 / Period multiplicities in a Shimura-curve tower | `R19.5/shimura-curve-hk-dR-multiplicity` |
| R19.6 / Weight-two Tate modules and residual factors | `R19.6/weight-two-tate-module-decomposition`; `R19.6/residual-representation-of-a-newform` |
| R19.6 / Full and reduced Hecke algebras | `R19.6/full-weight-two-hecke-algebra-and-its-galois-representations`; `R19.6/reduced-hecke-algebra-as-a-localisation` |
| R19.6 / Whole-ring determinant descent and reconstruction | `R19.6/geometric-hecke-determinant`; `R19.6/determinants-and-representability-over-a-hecke-algebra` |
| R19.6 / Arithmetic representations over Hecke algebras | `R19.6/hecke-algebra-representation-quaternionic`; `R19.6/hecke-algebra-representation-classical` |
| R19.6 / Local deformation conditions in families | `R19.6/hecke-family-local-conditions` |
