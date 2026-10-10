# PKG-EllipticCurveModularityPartIIGL2TypeAbelianVarieties

Completed by Codex, session `codex-IapPSQ`, on 10 October 2026. Refs #7899.
The claim was confirmed by the swarm bot on 10 October 2026 at 00:13:38 UTC.
This submission completes this package job; it is not a checkpoint.

## Deliverables

- `research/blueprint/packages/EllipticCurveModularityPartIIGL2TypeAbelianVarieties/README.md`: the introduction, boundaries, conventions, native library inputs, interfaces from named owners, and all six layers GT.1–GT.6. It retains all 44 targets, 39 API items and 24 definition tests, with hypotheses, construction/proof routes, prerequisites and precise source locators. The statements are in our own words. The document contains no source excerpts or source-by-source exposition.
- `research/blueprint/packages/EllipticCurveModularityPartIIGL2TypeAbelianVarieties/Suggested.lean`: the accepted native prototypes, with one header and import block, corrected `Module.Basis` names and `NumberField` notation scope. Repetitive omission entries are consolidated into mathematical interface notes, retaining the full targets, declaration names, API and tests. The README remains definitive.
- `research/blueprint/packages/EllipticCurveModularityPartIIGL2TypeAbelianVarieties/metadata.toml`: `topic = "math.NT"`.

The accepted packet, reader document and original suggested file are unchanged.
No ownership was moved and no other job's deliverable was edited.

## Mathematical boundaries preserved

The GL₂-type bundle belongs to R25.5, and native Tate components to R01.6.
End⁰ is the rational tensor product of the actual endomorphism ring. Powers
carry the regular field action, whereas primitivity is equivalent to
ℚ-simplicity. The integral model retains its actual isogeny and integral
endomorphism action. Residual comparisons use the actual torsion and common
residue-field embeddings.

The exact conductor and least-level assertions assume ℚ-simplicity. General
GL₂-type powers are modular using enough oldform copies at a larger level.
Pointed parametrisations are curve morphisms whose image generates the target,
and the comparison with the parent uses the same quotient and Abel–Jacobi map.
Good-prime rational compatibility precedes modularity; the all-place
Weil–Deligne realization follows it and permits finite coefficient extension.

The ℚ-curve definition uses geometric isogenies. The rational cocycle uses
non-CM scalar endomorphisms and rational inverses, with trivial action on
discrete multiplicative coefficients. The Weil-restriction Lie comparison
keeps the inverse-index conjugated isogenies and both algebra actions explicit.
The quadratic square and nonsquare branches remain distinct. Solvable base
change uses one algebraic finite character coherently across auxiliary primes
before deducing all finite local factors. The final quadratic conclusion
includes the separate CM alternative.

## Existing-work check and library update

Read the current AlgebraicVectorBundles and DifferentialGeometry roadmaps in
full to set the package's form and density. Checked the current roadmaps,
including the nine additions absent from the atlas snapshot, for overlapping
GL₂-type, rational-endomorphism and ℚ-curve targets. Relevant existing
ModularForms and ModularCurves material is imported through its named owners.
The roadmap checkout was at `c26fbb0367a7c73072fb41626091afe67f8c44f9`.

Checked the reviewed library audit and the 31 accepted baseline declarations
at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The 16 Tau Ceti source modules
used for this baseline in the shared build matched the latter commit exactly.
The current library was also checked at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

One accepted-plan library assumption is superseded by current Tau Ceti:
`TauCeti.AlgebraicGeometry.AbelianVariety.finrank_tangentSpace_eq_dim` is
already proved in `TauCeti/AlgebraicGeometry/AbelianVariety/TangentSpace.lean`,
line 193. The README cites that theorem rather than planning the dimension
bridge again in A1. `finiteDim_eq_dim` in the suggested file is explicitly an
adapter for the older required pin, where that theorem is absent; use the
native theorem when porting to the current library. Current native
`AbelianVariety.Hom.baseChange` and `AbelianVariety.End.baseChange` are also
cited as inputs, with rationalized functoriality and faithful geometric base
change remaining with A6. No packet changes were made.

## Source verification

Read the passages used from all five public sources. The fetched editions
match the accepted source hashes below. All target locators retain the
edition's own pagination (published pagination for Carayol).

| Source | Passages checked | SHA-256 |
| --- | --- | --- |
| Khare–Wintenberger, *Serre's modularity conjecture (I)*, author's `results.pdf`, 31 May 2009 | §§1, 5, 10; pp. 1–3, 7–9, 19–21 | `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82` |
| Ribet, *Abelian varieties over Q and modular forms*, author's `korea.pdf`, 6 September 2003 | Entire 19-page manuscript, particularly Theorems 2.1 and 6.1, §3, Lemmas 6.4 and 7.1, Proposition 6.5, Corollary 6.6 and Proposition 7.2 | `4c491a5294d1f4ec1b62855560aaea95cb64802d8fdd80fdd51ae2d2432f66ed` |
| Carayol, *Sur les représentations ℓ-adiques associées aux formes modulaires de Hilbert*, published scan | §0, pp. 409–411, including §0.6, Théorème (A) and Corollaire (0.8) | `d4a5fb6b1cd76f944f8948e06df1c7ad5656ae5ee14b9189178ee1e8f2b0dab8` |
| Freitas–Le Hung–Siksek, arXiv:1310.7088v4 | §1, pp. 2–3; §§11–12, pp. 17–18 | `aea71f7698edac25fedaf03627b7703c0ed6138e4e9c012b06b41822819d0403` |
| Caraiani–Newton, arXiv:2301.10509v3 | §1, pp. 2–7; Corollaries 7.2.5 and 7.3.4, pp. 97–98 | `57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3` |

No restricted-library source was needed.

## Validation and Lean limits

`python3 scripts/check_blueprint.py research/blueprint/packets/EllipticCurveModularityPartIIGL2TypeAbelianVarieties.json`
finished with **0 errors and 0 warnings**: 44 targets, 39 API items, 24 tests,
31 baseline declarations and six planned layers. Its existing interface gaps
and owner requests were preserved, with their interfaces stated in the README.

The final command
`lean-check research/blueprint/packages/EllipticCurveModularityPartIIGL2TypeAbelianVarieties/Suggested.lean`
finished with **exit code 0, no errors, and 35 warnings, all
`declaration uses sorry`**. Available memory exceeded the required 20 GB;
only one compilation was run at a time. No build, update, cache download or
language server was started, and no compilation remains running.

A structural comparison against the accepted packet confirmed all 44 target
headings in order, all 39 API names and 24 test names, prerequisites and exact
source locators for every target, the document size limit and the one-line
metadata. File-scope and whitespace checks passed.

Elaboration verifies the typed prototypes, not the unimplemented mathematics.
The inherited native-interface omissions remain explicit comments rather than
invented Jacobians, Tate modules, representations or `Prop` placeholders.
In particular the derivative action, bundled field/Rosati comparisons, full
modular geometry, geometric cocycle construction and finite-twist automorphic
interfaces still use the owners specified in the README. All their targets
and definition tests are specified there; comment tests are not claimed to
have executed.

The next step is the independent package review against the accepted plan and
the upstream guide, including another Lean check. This agent has not reviewed
or red-teamed its own work.
