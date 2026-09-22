# PAPER-HE-18 handoff

Agent: Codex — codex-a71f92. Refs #1406. Status: partial research checkpoint.

## What is complete

The 27-page published He18 paper was read completely, including all proofs and references. Selected arXiv v3 passages were compared, with published pages 9 and 24 visually checked. Richarz16 was read completely; the HN14 author-final introduction and §§1–3.4 were read; Haines–Rapoport's relevant setup/Proposition13 passage was checked. Exact versions, public URLs, hashes and read scopes are in the JSON.

The extraction contains 94 stable items, 249 internal dependency edges, 36 definitions/constructions, 108 API entries and 108 specified tests. Every one of the 82 missing items is routed exactly once. Nine other items are planned imports and three are exact library ingredients. Seven routes reuse SR.1, RG2.0/1/3/4 and the existing RootSystemsPartIIDominanceAndDemazure candidate, and propose one distinct SmoothRepresentationsPartIINewtonCocenters continuation.

The main report includes complete symbolic counterexamples for finite twisted Ω-cosets/minimal representatives, arbitrary-ring distribution finite generation and the graph direction; it also gives a direct finite-clopen/cosheaf proof strategy for the corrected general-ring rigid presentation. Ten structured sourceIssues await independent review. There is no self-review verdict.

Pinned-library statements were actually read. In particular, use Mathlib CompactlySupportedContinuousMap with discrete coefficients, and Representation.Coinvariants with arbitrary-target universal property. Do not duplicate these carriers or confuse pointwise multiplication with convolution. The compact-ambient locally constant stabilizer theorem is not already a proof for noncompact G.

The related reviewed coverage entries and owner documents were read. No SR/RGII/RootSystems coverage entry was invented where absent. All 42 paper results were screened at the claim snapshot. HE21's merged follow-up #1753 adds the generic affine-Hecke cocenter branch to the existing KP18 parahoric-center candidate; preserve it. The refreshed KPZ26 root route still uses the same root candidate and requests KZ25 alias consolidation.

## Where to resume

1. **G1 and G5:** build the actual Iwahori–Weyl/translation interface for arbitrary local reductive G, including a nontorus minimal Levi, possible torsion kernel and split center. Repair the Theorem3 power-growth argument by tracking Ω-cosets and central averages before applying root-length growth.
2. **G2 and G6:** read the cited Bruhat–Tits and Tits root-filtration inputs, then give connected intersection models, finite-level Lang lifting with compatible inverse limits, σ-equivariant depth shifts, the level-n contracted-product bijection and the adjacent-depth containment. Richarz's unshifted count is read but is not a substitute for these adapters.
3. **G4:** finish the omitted affine gradient-wall-crossing details via He–Nie's finite-Weyl predecessor and He's partial-conjugation proof. Preserve the exact author-final HN14 numbering and the central-kernel scope.
4. **G3:** close Vignéras I§2 and reductive unimodularity/θ-volume preservation. Only pro-p compact volumes are automatically units in arbitrary R.
5. **G7:** recover general finite-order central-twist field-valued Howe finiteness with a compact core or another level-compatible bound. The torus example disproves the printed finite-minima argument, not Howe itself. Do not restore arbitrary-ring distribution finite generation: the square-zero example genuinely refutes it.
6. **G8:** independently check the ten source findings and the direct presentation repair. A subsequent extraction worker is not an independent reviewer of its own edits. No author contact is authorized or performed by this checkpoint.

Keep level cocenters as images in the ambient cocenter. Infinite distribution decompositions use products. The graph relation is (f,−T_(x⁻¹)f). Rigid means central Newton vector, not zero Newton vector. Do not route these actual G(F) strata into BunG's Frobenius geometry.

## Checks and scope

The refreshed current paper checker, including source-issue validation, reports no errors. Structural checks cover unique IDs, exact-one routing, acyclicity, definition APIs and three tests each, gap endpoints, source-excerpt presence and no private paths/self-review. Scratch diagnostics pass: 24 S3 relation-space comparisons, 1,681 torus lattice checks, four exact GL2 matrix examples, and six square-zero coefficient models.

These are finite diagnostics and structural checks, not Lean proofs. The infinite coefficient example is justified by the symbolic argument in the report. No Lean deliverable was requested for this paper issue; no Lean file was created or compiled. Every implementation status is unchecked.

Claim-snapshot main: 4c3314007ebfd7c3a595698404caf1331356d63a. Publication owner/protocol refresh: 52efbf53b0a0129fe2d71f37a19510488f743966. The PR changes only this issue's result JSON, report and this handoff.
