# PKG-IntegralHeckeAndGaloisDeterminants

Completed by Codex, session `codex-LNKWpn`, for issue #7478 on 2026-10-08.

The package is complete and ready for independent review. No continuation of the packaging job is needed. The mathematical assertions remain formalisation targets, with `sorry` proofs in the suggested forms.

## Deliverables

- `research/blueprint/packages/IntegralHeckeAndGaloisDeterminants/README.md`: a mathematical roadmap with motivation, ownership boundaries, conventions, ordered constructions, exact hypotheses, APIs, examples and target-level section/theorem/page citations. It contains all 253 accepted targets, all 228 API items and all 207 test specifications. Size: 199,693 bytes.
- `research/blueprint/packages/IntegralHeckeAndGaloisDeterminants/Suggested.lean`: the accepted suggested forms joined under one definitive-document note and one sorted block of 57 distinct imports. Mathematical code, including signatures and examples, is unchanged from the accepted input; normalization affects imports and comments only.
- `research/blueprint/packages/IntegralHeckeAndGaloisDeterminants/metadata.toml`: `topic = "math.NT"`.

The packet, its reader document, its suggested input, atlas data and other jobs' files were not changed. ReductiveGroups and SemisimpleAlgebras were read in full as the two upstream models. The reviewed library audit, the ownership links, supplier requests and pinned Mathlib declaration statements were inspected. The roadmap extends Mathlib's existing polynomial-law and divided-power carriers rather than replacing them.

## Ordering and input corrections

The node dependency graph is acyclic, but treating IHG.3 as one indivisible stage gives an apparent cycle: symplectic coefficient descent needs its full multiplier conversion, whereas Galois-type ideals need IHG.1 field reconstruction. The package presents IHG.3a immediately after IHG.0 and IHG.3b after IHG.1–2. Every internal node dependency precedes its use, including dependencies not repeated because they follow transitively from a listed construction.

Eight accepted targets have empty prerequisite lists: the extension and product nilpotence bounds, the filtered-module bound, zeroth Fitting ideals, Ribet difference modules, generic-minor localization, and chain/cohomology Hecke images. Their Uses paragraphs supply the existing Mathlib ideal/submodule, determinant, polynomial/localization, complex/homology and algebra-homomorphism-range carriers. The additional declaration statements were read at the same Mathlib pin.

Some ACC23 locators in the input confuse section and equation numbering. The GLₙ Hecke polynomial is in §2.2.5, equation (2.2.6), pp.921–922, rather than Lemma 2.2.10. The automorphic Frobenius statement is Theorem 2.3.2, p.935; 2.3.1 is a subsection heading. The Hecke-image definitions are on pp.919–920, with the chain action in §2.1.2, pp.910–911, and the ghost comparison in Lemma 2.2.4, pp.920–921. The notation section starts at p.905, rather than p.899. The package corrects these locators and supplies missing page numbers without altering mathematical targets. The underlying accepted input retains its original citations.

The accepted plan records 38 mathematical proof obligations and 19 supplier requests. Packaging does not discharge those proofs. The README states their mathematical content as construction steps and owner interfaces, rather than hiding them behind a citation. In particular, retain these distinctions during implementation:

- degree-one laws over torsion modules; internal multiplication on homogeneous divided powers; full determinant laws rather than traces in small characteristic;
- ordered all-characteristic residual factorization versus factorial-dependent trace arguments; finite dimension over a factor center versus over the original field;
- simultaneous henselian matrix-unit lifting, Cayley–Hamilton ideal closedness and small-characteristic topological finiteness;
- actual quotient constituents in GMA Ext, an invertible alternating form and full multiplier in symplectic descent, and the generic-projector corner during local compression;
- bounded-cohomology ghost exponents, finite derived Hom by truncations, and artinian operator localization versus mere topological nilpotence;
- conjugacy-saturated Frobenius density, uniform finite-quotient existence witnesses over nonreduced coefficients, and determinants over the specified nilpotent quotient;
- integral cokernel control in the good-filtration cohomology product argument; signed integral Buchsbaum–Rim differentials and ordered-prefix regularity; an exact upper-entry complex versus a target with acyclic terms;
- finite generation over T using a T-valued trace lattice, weighted Fitting containment in the auxiliary ring, and the separate coincident/distinct-character Ribet constructions.

Suggested signatures retain the input's explicit omission comments where external carriers are needed (scheme invariants and rational comodules, completed group-algebra topology, central-scalar norm classification, and analytic localization). These conditions remain definitive in the README; no empty `Prop` substitute was introduced.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/IntegralHeckeAndGaloisDeterminants.json`: exit 0, **0 errors and 0 warnings**; 253 targets, 228 API items, 207 unit tests, seven planned stages.
- `lean-check research/blueprint/packages/IntegralHeckeAndGaloisDeterminants/Suggested.lean`: final run exit 0, **0 errors, 509 warnings**, all exactly `declaration uses sorry` (Lean displays backticks around `sorry`). Available memory exceeded 20 GB before elaboration. No language server or library build was started.
- Shared Mathlib source HEAD was `082e2d37e8b0463410cdb532e111cd43d5a66174`, the required pin. The shared Tau Ceti checkout was newer than the specified pin; this file imports only Mathlib, so compilation does not exercise a Tau Ceti API or verify that checkout's pinned build. Existing Tau Ceti roadmap dependencies remain mathematical interfaces, not implementation claims.
- Additional checks: every target heading occurs once; every API name is present; all direct internal prerequisites precede their target; all internal links and source anchors resolve; every target has source page locators and prerequisites; README is below 200,000 bytes; metadata is valid; one unique import block; comment/import-stripped Lean code equals the accepted input. No programme-process prose or source passages were imported into the README.
- A source-text overlap scan found no twelve-word English passage shared by a target statement and its cited public source. Public source texts were used for locators and proof checks; the scanned Buchsbaum article was inspected visually. No restricted library text was copied or used for this job.

## Reproducing the source checks

All reference URLs and editions are in the README. The following SHA-256 hashes identify the public PDFs downloaded for the mathematical and locator checks (accessed 2026-10-08). They are provenance records, not claims that every page of every paper was read.

| Reference | SHA-256 |
| --- | --- |
| ACC23 | `c5429e4f384384045dbb48502d71547bb21699783c0f77cce27b24e742467f02` |
| ANT20 | `077a344352c80389ce75d5c61a69fba90413303aca911a616fe46dbeb8514bfa` |
| BC09 | `f593756809df6c39ee5cf83b7cce82965cebec55a075bd4c84430203394e1c34` |
| BCGP25 | `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c` |
| BHKT19 | `ec54cf92ce04146c73b48945be2765f675359255d46cc94a0aa35a39229743b9` |
| BIP23 | `b48dad0a42d8cacea0a4ae80d5f3a5e89c3a13bf2e03beb8527081422b5853c4` |
| BN93 | `e6f876a959a0500a7cbf8b0eb035944c181851bb303ca151d40faa45d48cd759` |
| BP26 | `af70d084612b1b75761694923ef2395752d23b41e0b8b458910d096df4c8c3c6` |
| BUCH64 | `f6bb40712c53513f78e14d8091b3aece81eb61dc71e22c0e7624c93beabc7249` |
| CG18 | `67896c853258801967270f8927e5bb33c0315989d3a4188d53435a9305993ebb` |
| CG20 | `39aa93a83c77ce93884db6352e4c63f80e881197f4213dd699cdf7d77cfbb059` |
| CGH20 | `8389edfec6576b92aea1fd4dbf6c96ccb86b2186a6f244ab46c4abf1c02e2bed` |
| CHENEVIER-DET | `f3c0e0d86e803301c617d3023d425752e30da46673ed5af932647eb284286953` |
| CHT08 | `9d3b7079440d8cd3167812bb11c25ae4b51ada973b2e98f0928624254a60156c` |
| CN23 | `57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3` |
| DKSW23 | `5bff54fc876fae984c89bc531353d9ad4ab12911e677f243b10d7dcc44381128` |
| EM23 | `913a43abfa9b7def92208c32a09942b7b16d54f2076acb092fb635f7f1733c35` |
| GG12 | `558d81e45f4828b1df946e93e6c76dcd1147097f2008007c08b1818e3f2426db` |
| GT05 | `4ff0f8c76c3c7ba4cc48ad6d536669ef455c04d432c53bade804fd80c0b1f3f7` |
| PILLONI20 | `4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58` |
| PQ26 | `b18abe909131d28524f7a326834e5656d10063039a92f54e627d7cb899350d93` |
| Q23 | `67eb82118e49df3f7da6c1e211ad9961fc7323fc4d09d0559bcbc2434eead827` |
| ROBY63 | `1679797ecbd2a655d8d0dfe38ffe28bc8c49b881bf84bb965d018190c331e330` |
| SCH15 | `ebac854f47381c19a987b43b59d2c05cad55c3186c4d8cde067a7be0d06cbd16` |
| WE18 | `d005a7591b068835eb6512e3bb7dd27d69adf90580ec7b650f9bed2ff3a0a5ab` |

## Where to resume

The next action belongs to the independent package reviewer: read the package against the accepted packet, check the named supplier contracts and source locators, and rerun the Lean check. For mathematical implementation, start with IHG.0 and retain the construction order given in the README. No scratch files or downloaded sources are required to continue; the packet, package references and this note contain the persistent context.
