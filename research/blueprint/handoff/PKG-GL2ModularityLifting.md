# PKG-GL2ModularityLifting

Completed package for issue #10190 by Codex, session `codex-9yFIPo`, on 2026-10-17. Claim confirmation: <https://github.com/CBirkbeck/tauceti-explorer/issues/10190#issuecomment-6235141935>. Branch: `codex-9yFIPo-gl2-modularity-package`.

## Delivered

- `research/blueprint/packages/GL2ModularityLifting/README.md`: twelve layers, 126 owned target subsections, exact supplier contracts, source locators, API outlines, discriminating Checks and a worked-example/dependency section at the end of every layer.
- `research/blueprint/packages/GL2ModularityLifting/Suggested.lean`: 202 lines, five light real-bodied definitions; representative theorems and examples only. Heavy arithmetic carriers remain explicit README targets.
- `research/blueprint/packages/GL2ModularityLifting/metadata.toml`: `topic = "math.NT"`.

The input inventory is the union of the three issue-named accepted packets: 94 + 28 + 1 = 123 distinct targets. All 123 are accounted for below: 121 have owned subsections, two are imported entirely from their existing owners. Five restricted mathematical interfaces have been made explicit to replace upward prerequisite citations. Every one of the thirty input definitions/constructions retains its named API and at least three Checks. Each of the five added interfaces also has an API and at least three Checks. The assembled reader was not copied: its older inventory omits accepted targets and retains superseded statements. No packet, assembled file, upstream roadmap or library file was changed.

The named Haiku/Sonnet delegation tools/models specified in the issue are unavailable in this session. Retrieval, mechanical checks, mathematics and writing were performed locally; no substitute subagents were spawned.

## Validation

- `lean-check research/blueprint/packages/GL2ModularityLifting/Suggested.lean`: **exit 0**, no errors, exactly **21 declaration-uses-sorry warnings and no other warnings**. Final run includes the inverse-Frobenius polynomial example. The wrapper used Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin is `f790474821cf4256814db967cb154e7af3d0c369`. Available memory was 89 GiB before the final run. No build, package update, cache download or language server was started.
- `python3 scripts/check_blueprint.py research/blueprint/packets/GL2ModularityLifting--R22.1.json`: **0 errors, 0 warnings**, 94 nodes.
- Same checker on `GL2ModularityLifting--R32.6.json`: **0 errors, 0 warnings**, one node.
- Same checker on unchanged `GL2ModularityLifting--R32.3.json`: **one existing error, 0 warnings**, 28 nodes: `R32.5/crystalline-weights-two-four-completion` points to missing `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/crystalline-reducible-reduction-is-ordinary`. The current ordinary package delegates this local calculation to `PadicHodgeTheory:R06.4/two-dimensional-ordinarity-criterion`, package §6.4. The delivered package uses that actual owner and its weight-p+1 endpoint. A later authorised packet edit should replace the obsolete edge; this job may not edit packets.
- Mechanical inventory pass: all 123 input identifiers assigned; 126 numbered owned subsections; all input definition/construction API lists and Check counts retained; twelve layer endings; all reference-style source links resolve; all five Lean definition names and all Lean theorem names occur in the README. No self-stage, upward R24/R30/R31, `FoundationsAndLibraryIntegration`, `UPSTREAM:`, private path or job-id residue in the README.
- `python3 research/blueprint/intake.py check-files` on exactly the four deliverables: **4 files, 0 problems**. `python3 scripts/check_sorry_data.py` on the suggested file: **exit 0**. `git diff --cached --check`: **exit 0**. Final consistency edits retain framed coinvariants until framing augmentation and identify the crystalline-to-ordinary supplier solely as R06.4.

## Library and duplication audit

Read the reviewed library-coverage audit and relevant link/tier files. The package belongs to tier 21. R01–R21 suppliers and CompletedCohomologyPartII are lower-tier interfaces; R24 is higher and R30/R31 cannot be assumed upstream prerequisites here.

Read current upstream DifferentialGeometry and ProfiniteArithmetic READMEs in full, and inspected upstream Suggested files including AdicSpaces and ProfiniteArithmetic. Screened the nine newer upstream roadmaps, the completed roadmaps and current Tau Ceti against this package's needs. Used the current ModularForms Layers 4 and 9 for primitive associates and twists; ClassFieldTheory, RestrictedProducts, ProfiniteArithmetic, LocalGaloisGroups and Chebotarev supply their existing arithmetic infrastructure. CompletedCohomologyPartII's degree-zero adapter (Layer 3.17), general duality, tower limits and Hecke action image are consumed, not replanned.

Checked the actual pinned statements of Matrix determinant identities; `Relation.ReflTransGen`; spectrum comaps and minimal-prime/component correspondence; injective-subgroup solvability; Tau Ceti upper-triangular solvability and finite/infinite-place weak approximation. README names the declarations and pins. The current Tau Ceti/upstream checkouts were read only, with no lake invocation there.

Moves/removals to propagate when the maintainer updates neighbouring plans:

| Input direction | Delivered owner and boundary |
| --- | --- |
| R22.1 minimal modular-lift existence | Entire theorem imported from R20.6, including KW II Theorems 8.2 and 8.4. Its hypotheses, output and negative tests are in the opening contracts; it is not a second existence target here. |
| R32.1 quadratic/cyclotomic irreducibility equivalence | Entire comparison imported from ArithmeticGaloisRepresentations R01.4; opening includes the p=3 and dihedral tests and the counterexample to a diagonal-torus proof shortcut. |
| R30.6 local input | Restricted types/all-block cycles, compact block functor, regular algebraic vectors, arithmetic finite detection are owned in §§8.1–8.3. General p-adic local Langlands remains elsewhere. Higher plans should import these restricted interfaces. |
| R31.2–R31.4 completed compatibility | Pan-specific Hecke quotient, block action, nice-prime comparison and classical points owned in §10.1. General completed objects remain CompletedCohomologyPartII/IHG. |
| R31.5 patching/typed detection | Odd arithmetic GL₂ patching owned in §8.3, dyadic typed support/augmentation in §9.1. Dyadic specialisation §9.2 uses §9.1, not Pan's Hecke quotient. |
| R31.6 auxiliary source independence | Restricted dependency-closure target owned in §12.8, with individual constructions named, rather than assumed certified. |
| R24.5 compatible-system carrier/existence | Replaced by explicitly indexed semisimple finite-coefficient representations with common algebraic good-prime polynomials in §12.5. Existence is not an input or conclusion. Higher compatible-system results may supply these data. |
| Generic arithmetic/patching infrastructure | R01/R02/R03/R04/R06/R08/R17/R18/R19/R20/R21 and the current upstream roadmaps keep their existing notions. This package owns the arithmetic map/module comparisons and restricted missing local–global producers only. |

## Corrections to carry back to the accepted plan

These changes are mathematical clarifications/corrections in the delivered package, not edits to the input packets.

1. `s` is the positive O-rank of the unframed minimal module, or the rank of the framed module over its framing power-series ring. A framed module is usually infinite over O. The framed Hecke map sends framing variables to their counterparts; setting them to zero is the augmentation.
2. Alpha and beta are existential predicates on actual automorphic witnesses, introduced before minimal-level construction. A Steinberg beta witness is not an unramified alpha witness, without ruling out another witness for the same reduction.
3. Auxiliary roots are labels of residual U_v branches; arbitrary coefficient lifts do not equal characteristic-zero U_v eigenvalues. Diamonds, the isotropy quotient Delta'/Delta'[N], Hensel's selected root, and the inverse character on the other branch are retained.
4. Arithmetic finite patching retains all scalar/framing/augmentation maps. Power-generated ideals differ from ordinary ideal powers. The isotropy annihilator estimate needs its index shift; the finite-level small-kernel condition does not imply a zero kernel, even when the dyadic torus has rank zero.
5. Depth, support, projectivity and integral R=T are separate steps. Maximal Cohen–Macaulay modules over a reducible ring need not have full support. Generic regularity needs the depth/Auslander–Buchsbaum argument; integral complete-intersection conclusions need the numerical/regular-sequence input.
6. Dyadic oddness is imposed in characteristic zero. I and diag(1,-1) have the same mod-two reduction; residual determinant parity supplies no replacement. Tung arXiv v3 Theorem 8.0.3(3) has a bar inconsistent with its odd real-place deformation quotient; the package uses §3.2.5/Proposition 3.2.7. The real dyadic ring and the 2-torsion restriction of the twist action are stated explicitly.
7. Kisin's general-field dyadic DVI Theorem 3.3.5 is literally Barsotti–Tate. The potentially Barsotti–Tate conclusion is obtained by the separate component/soluble-base-change reduction; it is not attributed as the literal theorem. Keep the original-field ordinary matching before changing field.
8. Classical hypotheses remain separate: KW types A/B/C, residual weights, splitting at the endpoint, the p=5 projective-image exception, the Fontaine–Laffaille width, the Q-only Durham weight range, and the ordinary Diamond/Kisin endpoint. The last needs the exact R21 supplier contract; a Skinner–Wiles variant with a non-CM-induction restriction cannot silently substitute for it.
9. BCDT uses the dual type lattice, the localised plus involution and the actual compact-cohomology pairing. Weak acceptability can include a zero local branch; the actual lift and residual type occurrence exclude that branch in the lifting application. A nonzero local deformation quotient alone does not prove residual automorphic occurrence.
10. Gee–Kisin Appendix B corrects multiplicities: equal residual eigenvalues at auxiliary places contribute factors two; the faithfulness criterion includes their product. The withdrawn local lemma is not used. Filtrations count repeated Jordan–Hölder weights. The older nonexceptional graded-piece inequality is not extended to excluded cyclotomic blocks.
11. Tung's all-odd-prime cycle statement includes p=3. Its fixed-determinant typed O-flat ring has total dimension four and special-fibre dimension three; the cycle identity is placed in the special-fibre dimension, despite the four-dimensional label in Theorem 1.2. This is recorded here, without an out-of-scope errata edit.
12. The restricted odd arithmetic producer includes its rank-two CM globalisation and definite-unitary arithmetic spaces; quaternionic R15/R18 data alone do not construct them. Emerton–Gee Appendix A supplies the precise restricted lift and potential-automorphy steps preserving the p-adic completions. Reducible local potentially BT lifts use BLGG Lemma 6.1.6 on actual extension classes; Snowden Proposition 7.8.1 alone also permits type C and does not justify the blanket potentially BT assertion. Gee–Kisin Lemma 4.4.1 supplies potential diagonalizability.
13. Typed dyadic full support is obtained by both ordinary and nonordinary detection and the auxiliary-place component argument. An infinite faithful completed module, or a support merely meeting every component, does not imply the required finite typed fibre is nonzero.
14. Pan's geometric-Frobenius/HT(-1) determinant convention is transported explicitly. Nice primes include a Hecke witness and a constant-lift clause away from p, whereas potentially nice primes do not. Good components require an actual seed and potentially nice intersections. Extension components use generic points in the actual spectrum-map image. Scalar ordinary equations and cyclotomic ordinary ideals have different dimension consequences; the reducible locus is not the nilradical.
15. Character normalisation first proves the actual twisting character geometric using its line in Hom(rho_g,rho), then invokes rank-one classification, compares weights, and takes a primitive associate after a finite Dirichlet twist. No guessed twisting level or unjustified geometric character is assumed.
16. Polynomial-family transfer needs finite coefficients, common algebraic polynomials and semisimplicity, and only the selected members need regular de Rham hypotheses. Compare algebraic coefficients and re-embed separately at each coefficient place. There is no isomorphism of local fields in different residue characteristics. The reducible Pan/ordinary-three B-branches need no modular A-family. Historical KW almost-strict compatibility alone does not imply every member de Rham; DP Definition 1.10(4)–(5) does.

## Adversarial mathematics pass

The table groups all target families; exact statements and negative controls occur in the corresponding sections. Compilation checks elaboration only: none of the sorry theorems is claimed proved.

| Statements/conventions checked | Instances tried and resulting correction/control |
| --- | --- |
| Coefficients, Frobenius and determinants | Ramified O uses varpi truncations; inversion of p agrees with inversion of varpi. Roots 2,3 give inverse-Frobenius polynomial X²-(5/6)X+1/6, pinned by a Lean example. Arithmetic and Pan geometric determinants remain distinct. |
| Residual witnesses, field changes, minimal data | Wrong weight, Steinberg versus spherical, separate witnesses, empty finite set; no forced fixed cyclic degree. For genuinely quadratic changes, a split avoidance prime made inert ensures disjointness. Dyadic D_v^× makes the level noncompact only when Sigma is nonempty. |
| Hecke maps and framing | Nonzero unframed rank one with three framing variables is infinite over O; maps preserve variables. Surjection is onto the actual action image; trace generation is unframed. |
| All auxiliary-level maps and control | Empty Q recovers minimal data; changed residual root changes branch; changed coefficient lift does not. Character inversion on the other line is explicit, and coinvariants retain the same scalar action. |
| Patching truncations and limits | h=0 still leaves m-dependent truncations. In F2[[x,y]], xy lies in m² but not (x²,y²). The degree-six ordinary bound for two generators and cubes is valid. Positive rank excludes the zero-module finiteness shortcut. |
| Support, avoidance, integral refinements | k[[x,y]]/(xy) and its quotient by x refute full support from depth. Avoidance needs common special fibres, union of components and the component bijection. Nilpotent kernels and integral zero kernels are not conflated. |
| Classical odd lifting/local ranges | p=3, k=2, k=p+1 and upper Durham endpoint 2p-1; ordinary/nonordinary cases use distinct theorems. Residual weight p+1 uses Hasse multiplication and a characteristic-zero witness. Zero BCDT branch cannot contain an actual lift. |
| Dyadic local data and patching | I versus diag(1,-1); real ring singularity; twist ell=-1 preserves determinant but general ell does not. t=0 does not force D'_m=D_m; k[e]/e^(m+1)→k[e]/e^m is a nonzero allowed small kernel. |
| Classical dyadic endpoints and H | Residually S3 is solvable and excluded. Potentially BT reduction matches ordinary components before base change. Weight-four nonfinite residual case and characteristic-zero oddness retained. |
| Four modern predicates and normalisation | pStar(2)=2 but no quadratic-subfield assertion; pStar(3)=-3, pStar(5)=5, pStar(7)=-7. Weights {3,7} normalise to {0,4}, k=5. Odd residual parity implies oddness only for odd p. Reducible characteristic-zero representations are excluded from the Pan and ordinary-three predicates. |
| Local types, blocks, algebraic vectors | Scalar inertia has Steinberg semistable type versus character crystalline type. A repeated factor counts twice. A block is generated by Ext chains, not isomorphism classes. Weights (1,0) and (4,1) give trivial and Sym² tensor det algebraic parts in Tung's convention; Emerton's det shift is retained with its smooth normalisation. |
| Odd arithmetic producer and finite detection | Zero typed quotient gives zero module despite compact projectivity. Supported generic rank is one; completed module need not be finite over the deformation ring. Capture, local geometry and finite Cayley–Hamilton detection have separate roles. Local extension classes, adequacy and the auxiliary eigenvalue ratio are retained. |
| Corrected multiplicities/odd lifting | Two equal-eigenvalue auxiliary places give r=4; e(R)=(1/4)e(M). A zero local mu factor excludes the corresponding graded piece. At p=3 all-block results replace, rather than assume, the older excluded inequality. |
| Dyadic typed support and lifting | Zero coefficient object gives zero Hom; mismatched centre gives zero intertwiners. Ordinary and nonordinary components both needed, including self-extensions. Finite typed augmentation gives nonzero fibres by localisation/Nakayama. |
| Pan Hecke and nice-prime objects | No actual maximal ideal means no datum; characteristic-zero classical point is not a nice characteristic-p prime. Split residual lattice cannot witness the nonsplit clause; finite inertia alone cannot witness a constant lift. |
| Good/extension components | Component sets {0},{0,1},{1,2}, nice locus {0,1}, seeds {0} propagate through two edges; a nonnice common point does not. Empty seeds give no good component. Identity spectrum map detects every minimal prime; zero target ring detects none; composition only discards detected components. |
| Pan dimensions and propagation | Generic ordinary principal relation, scalar three-relation cover, cyclotomic two-generator ideal have different lower bounds. Degree d>2 is needed to separate 2d-1 from d+1. Reducible-locus quotient is not reduction modulo nilpotents. |
| Ordinary branch at three | omega3 is nontrivial on inertia. Teichmuller lift of the actual quotient gives the normalising finite twist and changes determinant by eta^-2. Residual 1⊕omega3 does not alone imply ordinary characteristic-zero local shape; weights two/four use R06.4 endpoint. |
| All transfer applications | Selected p may lie in the ramification set. Nonsemisimple extensions can have the same polynomials as their semisimplifications; semisimplicity is essential. A modular seed is essential in the residual-irreducible transfer branch but unnecessary for direct Pan B-modularity. Only selected p-adic Hodge conditions are used. |
| Restricted proof-input closure | Conditional residual-modular statements are separated from unconditional Serre corollaries. Named auxiliary globalisations still require proof-level closure; no source-inspection claim is silently promoted to an independence theorem. |

## Source work and remaining mathematical obligations

All sources used were freely accessible public author/arXiv/publisher copies; no private book was needed or copied. Text is in our own words, with theorem/section/page locators. The table below preserves public-file hashes for version-sensitive citations. Kisin's author DVI was extracted as text; its theorem numbering is kept distinct from the published Fontaine–Mazur numbering, whose shift is explained in the README. Skinner–Wiles' main theorem was checked on the scanned page image. Source files/extractions are scratch and are not committed.

The restricted independence theorem §12.8 is an explicit mathematical target, not a certificate that all auxiliary proofs are independent of Serre. Inspected edges include Tung's odd arithmetic module through CEG/Emerton–Gee, Emerton–Paskunas density/support, BLGG ordinary-component globalisation and Gee's prescribed-weight lifting; Emerton's algebraic-vector proof and its restricted globalisation; and Tung's dyadic Lemmas 4.3.3–4.3.4 through Calegari, Snowden, Paskunas and KW II. Emerton–Gee A.5/A.6 have prescribed-lift and potential-automorphy inputs (including a rank-four induced construction in the rank-two case); these restricted auxiliary constructions are owned as part of §8.3, not imported as a general R24 result. Their complete proof-level dependency independence must be established when formalising §12.8. The README does not conceal this behind an unconditional Fontaine–Mazur theorem.

The other supplier contracts are mathematical prerequisites, not claims that their roadmap code already exists. In particular the ordinary Diamond/Kisin endpoint, exact extra-S H¹ comparison, finite decorated arithmetic patching and finite typed augmentation must have the precise exported statements recorded in the opening contracts. Review should check these contracts against supplier packages, preserving the boundary rather than removing hypotheses.

No package implementation remains before independent review. Follow-up packet corrections and higher-roadmap ownership updates above are outside this issue's permitted files. No review verdict was written by this worker.

## Public source versions checked

Access date for all files: 2026-10-17. URLs are in the package bibliography. Duplicate aliases have the same URL and hash and are listed once.

| Source identifier | SHA-256 |
| --- | --- |
| KW2-2009 | `53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4` |
| GEE-MLT-2022 | `878f83e189ad44603ac04f6c16ef17f4c4fe046db91a2f0933a192e048715ea5` |
| KW1-2009 | `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82` |
| KISIN-2ADIC-2009 | `a11fdea301d662ada1cd675bea21a89ba9ab0a75955e496e4a1bcdecab97bf7d` |
| KISIN-FFLAT-2009 | `242151c94cb831c526e67de6e3b70a370b65a002342074440e86fc88a2ec5f0f` |
| DIEULEFAIT-PACETTI | `0c6850dafda032f7a4008947c519b5aef8cc13762207bb67c36810170a8eebe6` |
| KISIN-FM-2009 | `663d83eba34d147b58823b23d63c007f79be47a29054902032d3325a83920d50` |
| TUNG-2021-P3 | `22017bc9beb585c2aae5421d2fe1a8a9049d8a93e4f8bb8cf684149616db1ba2` |
| HU-TAN-2015 | `d36f237d7269e9dac7d32d80f1e4d6fe5c20b210ae067075b2dedb51e73d9bb2` |
| PASKUNAS-BM-2015 | `fce17b369313877b7efedab0844e8ece721a0c249dee1ef212f1d1303fc82c18` |
| EMERTON-LGC-2011 | `bf4f8556ef04be02daed0b1dba35c91ce4a7b2f4cbbf28d0d8351b1fc369eb13` |
| GEE-KISIN-2014 | `65cb5797bbe10e328843b5fdc73f2623c80e19fa89ceb72ce6cd296881eb68f9` |
| DIEULEFAIT-PACETTI-PUBLISHED | `2a133808911a1819ea9480bea0bfc18846035f961e866ddec4d05d69b093e0f8` |
| CHT-2008 | `9d3b7079440d8cd3167812bb11c25ae4b51ada973b2e98f0928624254a60156c` |
| BCDT-2001 | `13043cf6e9043a69dc7988882658cd92595efc88dfd4fd2f326ac3ef3cae8e06` |
| CDT-1999 | `e9dac063b9db6fd7b34e79907ce09095688b1fd8b1ea48c8527797b6090ae91c` |
| KISIN-DURHAM | `08711a7f1ed4975c7af74d1623f8066bc9e8a4b64b3ddf738046bbdf90969e84` |
| GEE-TYPES | `d9cba984e173c30c2a502ce9fffb068d79be89e401ea8115b7a5ba993074db5b` |
| SKINNER-WILES-1999 | `ec0697b3e9c9fa68063b19688f10347d204a8b7b86526384c9ccd6e7fe30e6f3` |
| PAN-2022 | `590171129d28a65749cf92b1f6099dbacaa90cc6698828f0a4dfd3da943f4824` |
| PASKUNAS-2016 | `727addeb49ee302052a493cf097a868a70c340286981598b5e7382fcd8f86749` |
| TUNG-2021-DYADIC | `a601da3762c35dab9ebdac5fb5106f1e3f627304dfc2390ac43fe2ac862c6de8` |
| CALEGARI-2012 | `8c95a021afd8fb5b7479f248bac5366389b6dd93b33f272f95f3ae3cbbda126b` |
| SNOWDEN-2009 | `bd1efdc925a2e2413ea6f49c55d3e535697cd77b4cf7262444137362b10cd679` |
| BLGG-2013 | `31838df42505245f32079aa3b3d4ba9ee81525079aa415daab05bfa17cf1eb96` |
| CEG-2016 | `08556076ad01f855f7e1b7b6db53c10cac29553744b26c8a1e2cbf086b03b1b3` |
| EMERTON-PASKUNAS-2020 | `1fbab3f4f4f195d2960723cc8c23ce2a55e9f7c81fa5cb4cd366fbec911336c5` |
| EMERTON-GEE-2014 | `ac0bd912b2ce9ec2a6d53730f4da3b99b6ef5c3403f352c2b5c6197600367f7f` |
| BLGG-2012-ORDINARY | `1667f974900d400736588d28a0ec4636df9ff2c22387ea025bdf9b1a3c7dbd3a` |

## Complete input-to-package inventory

Identifiers below are the accepted input targets, with their package locations. Reordering puts predicates and producer interfaces before their consumers.

| Input target | Package location |
| --- | --- |
| `R22.5/kw-residual-modularity` | §1.1 |
| `R22.5/kw-residual-modularity-beta` | §1.2 |
| `R22.1/cht-soluble-prescribed-completions` | §1.3 |
| `R22.1/allowable-base-change-existence` | §1.4 |
| `R22.1/alpha-beta-under-allowable-base-change` | §1.5 |
| `R22.1/minimal-level-data` | §1.6 |
| `R22.1/hecke-points-local-conditions` | §1.7 |
| `R22.1/deformation-to-hecke-map` | §1.8 |
| `R22.1/deformation-to-hecke-traces` | §1.9 |
| `R22.1/deformation-to-hecke-surjective` | §1.10 |
| `R22.1/framed-hecke-algebra` | §1.11 |
| `R22.1/framed-hecke-module` | §1.12 |
| `R22.1/framed-hecke-properties` | §1.13 |
| `R22.1/framed-deformation-to-hecke-map` | §1.14 |
| `R22.2/auxiliary-level-groups` | §2.1 |
| `R22.2/auxiliary-hecke-algebra` | §2.2 |
| `R22.2/auxiliary-maximal-ideal` | §2.3 |
| `R22.2/deformation-to-auxiliary-hecke-map` | §2.4 |
| `R22.2/auxiliary-eigenvalue-compatibility` | §2.5 |
| `R22.2/delta-actions-agree` | §2.6 |
| `R22.2/auxiliary-map-surjective` | §2.7 |
| `R22.2/auxiliary-hecke-comparison` | §2.8 |
| `R22.2/delta-freeness-at-taylor-wiles-level` | §2.9 |
| `R22.2/taylor-wiles-module-system` | §2.10 |
| `R22.2/module-system-control` | §2.11 |
| `R22.2/dyadic-twists-of-forms` | §2.12 |
| `R22.3/arithmetic-patching-data` | §3.1 |
| `R22.3/finite-level-patching-realization` | §3.2 |
| `R22.3/patching-data-finite-and-compatible` | §3.3 |
| `R22.3/patched-ring-and-module` | §3.4 |
| `R22.3/patched-support` | §3.5 |
| `R22.3/minimal-ring-finite` | §3.6 |
| `R22.3/generic-fibre-r-equals-t` | §3.7 |
| `R22.4/ihara-avoidance-comparison` | §4.1 |
| `R22.4/support-transfer-mod-lambda` | §4.2 |
| `R22.4/modularity-from-full-support` | §4.3 |
| `R22.4/integral-r-equals-t-when-smooth` | §4.4 |
| `R22.4/avoidance-special-fibre-comparison` | §4.5 |
| `R22.5/solvable-base-change-reduction` | §5.1 |
| `R22.5/component-patching` | §5.2 |
| `R22.5/strong-residual-modularity` | §5.3 |
| `R22.5/kw-odd-prime-lifting` | §5.4 |
| `R22.5/alpha-beta-from-modularity-over-q` | §5.5 |
| `R22.5/kisin-potentially-bt-lifting` | §5.6 |
| `R22.5/kisin-nonordinary-pbt-lifting` | §5.7 |
| `R22.5/kisin-pbt-lifting-over-q` | §5.8 |
| `R22.5/fontaine-laffaille-lifting` | §5.9 |
| `R22.5/bcdt-corrected-hecke-module` | §5.10 |
| `R22.5/bcdt-residual-support` | §5.11 |
| `R22.5/bcdt-type-r-equals-t` | §5.12 |
| `R22.5/bcdt-type-lifting` | §5.13 |
| `R22.5/bcdt-extended-type-lifting` | §5.14 |
| `R22.5/kisin-durham-crystalline-over-q` | §5.15 |
| `R22.5/nonordinary-weight-p-plus-one` | §5.16 |
| `R22.5/kw-i-theorem-4-1-odd-prime` | §5.17 |
| `R22.5/ordinary-overlap` | §5.18 |
| `R22.6/dyadic-oddness` | §6.1 |
| `R22.6/dyadic-finite-patching-data` | §6.2 |
| `R22.6/dyadic-finite-level-realization` | §6.3 |
| `R22.6/dyadic-patched-ring` | §6.4 |
| `R22.6/dyadic-patched-module` | §6.5 |
| `R22.6/dyadic-torus-action` | §6.6 |
| `R22.6/dyadic-patched-torsor` | §6.7 |
| `R22.6/dyadic-power-series-isomorphism` | §6.8 |
| `R22.6/dyadic-generic-fibre-regular` | §6.9 |
| `R22.6/dyadic-patched-module-faithful` | §6.10 |
| `R22.6/dyadic-r-equals-t` | §6.11 |
| `R22.6/kw-dyadic-lifting` | §6.12 |
| `R22.6/kw-i-theorem-4-1-dyadic` | §6.13 |
| `R22.6/kisin-dyadic-component-criterion` | §6.14 |
| `R22.6/kisin-dyadic-bt-lifting` | §6.15 |
| `R22.6/hypothesis-h` | §6.16 |
| `R32.1/p-star` | §7.1 |
| `R32.1/lifting-statement-table` | §7.2 |
| `R32.1/dyadic-lifting-proposition` | §7.3 |
| `R32.1/residually-reducible-lifting-proposition` | §7.4 |
| `R32.1/ordinary-three-lifting-proposition` | §7.5 |
| `R32.1/non-solvable-residual-image` | §7.6 |
| `R32.1/hodge-tate-and-oddness-normalisation` | §7.7 |
| `R32.1/oddness-of-odd-residual-lift` | §7.8 |
| `R32.1/weight-of-modular-twist` | §7.9 |
| `R32.1/residual-modularity-forms` | §7.10 |
| `R32.1/exceptional-local-cases` | §7.11 |
| `R32.2/patched-weight-filtration` | §8.4 |
| `R32.2/patched-generic-rank` | §8.5 |
| `R32.2/patched-weight-nonvanishing-and-support` | §8.6 |
| `R32.2/patched-graded-piece-bound` | §8.7 |
| `R32.2/kisin-multiplicity-criterion` | §8.8 |
| `R32.2/kisin-fontaine-mazur-totally-split` | §8.9 |
| `R32.2/odd-prime-de-rham-lifting` | §8.10 |
| `R32.2/odd-prime-statement-over-q` | §8.11 |
| `R32.2/application-requirements` | §8.12 |
| `R32.3/typed-component-specialisation` | §9.2 |
| `R32.3/totally-real-dyadic-lifting` | §9.3 |
| `R32.3/dyadic-de-rham-modularity-lifting` | §9.4 |
| `R32.4/nice-prime` | §10.2 |
| `R32.4/potentially-nice-prime` | §10.3 |
| `R32.4/good-component` | §10.4 |
| `R32.4/extension-components` | §10.5 |
| `R32.4/nice-prime-component-bridge` | §10.6 |
| `R32.4/large-component-at-regular-point` | §10.7 |
| `R32.4/generic-ordinary-intersection` | §10.8 |
| `R32.4/scalar-ordinary-intersection` | §10.9 |
| `R32.4/potentially-nice-base-change` | §10.10 |
| `R32.4/extension-component-control` | §10.11 |
| `R32.4/extension-component-propagation` | §10.12 |
| `R32.4/cyclotomic-component-connectedness` | §10.13 |
| `R32.4/nonordinary-hilbert-modularity` | §10.14 |
| `R32.4/pan-residually-reducible-fontaine-mazur` | §10.15 |
| `R32.4/pan-residually-irreducible-fontaine-mazur` | §10.16 |
| `R32.5/ordinary-character-normalisation` | §11.1 |
| `R32.5/p-three-residually-reducible-branch` | §11.2 |
| `R32.5/crystalline-weights-two-four-completion` | §11.3 |
| `R32.6/transfer-residually-irreducible-odd` | §12.1 |
| `R32.6/transfer-dyadic` | §12.2 |
| `R32.6/transfer-residually-reducible` | §12.3 |
| `R32.6/transfer-ordinary-three` | §12.4 |
| `R32.6/directed-polynomial-family-transfer` | §12.5 |
| `R32.6/de-rham-lifting-and-almost-strict-systems` | §12.6 |
| `R32.6/ramified-reducible-coefficient-prime` | §12.7 |
| `R32.6/globalisation-dependency-audit` | §12.8 |
| `R32.1/quadratic-cyclotomic-irreducibility` | opening supplier contract |
| `R22.1/theorem-8-2-minimal-modular-lifts` | opening supplier contract |
