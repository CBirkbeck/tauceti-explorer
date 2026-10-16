# PKG-CompletedCohomologyPartII — handoff

Codex, session `codex-q26fcp`, 16 October 2026. Refs #9922. The bot confirmed the claim in [issue comment 6213905179](https://github.com/CBirkbeck/tauceti-explorer/issues/9922#issuecomment-6213905179). This is the completed package, not a checkpoint. No mathematical implementation is claimed.

## Deliverables and effective plan

Only the three files in `research/blueprint/packages/CompletedCohomologyPartII/` and this handoff are changed. No packet, original reader, original suggested file, supplier roadmap or library was edited.

The package starts from the assembled reader and the effective union of `packets/CompletedCohomologyPartII.json`, `packets/CompletedCohomologyPartII--CC.0.json` and `packets/CompletedCohomologyPartII--CC.8.json`. All 85 numbered mathematical subsections remain, with layer counts 7, 5, 10, 17, 7, 9, 7, 8, 15. The README retains the targets, non-standing hypotheses, source locators, proof routes, definition APIs, Checks and worked examples. Catalogue tables, target-id headings and process narrative have been removed. Same-roadmap references use numbered sections and anchors. Every definition subsection has at least three Checks; the package adds negative controls where the ownership moves or corrected cover hypothesis need them.

`README.md` has 2,322 lines. It includes the exact external interfaces, boundaries, all nine layers, proof obligations and source corrections, downstream consumers and bibliography. `Suggested.lean` was written as a compact file from the start and has 445 lines. It uses only native carriers, light real-bodied specialisations, theorem signatures and examples. Its namespace is `TauCetiRoadmap.CompletedCohomologyPartII`. Heavy arithmetic objects are README targets and are named in the closing comment. `metadata.toml` is `topic = "math.NT"`.

The retained Lean definitions are the native module colimit, topological-module limit, continuous integral dual and precomposition, the range of a support map, functorial transport of a diagram action, the native commutative-ring limit and its evaluations, and the continuous range of an idempotent with its inclusion and projection. They do not manufacture an arithmetic tower or cohomology theory. The current arithmetic carriers are absent at the pins, so their comparison theorems are stated in the README rather than over unrelated placeholder functions.

## Ownership and duplication audit

I read the current upstream AdicSpaces and AlgebraicTopology READMEs and Suggested files in full before writing. I also searched the nine newer roadmaps named in WORKERS.md, the four Completed roadmaps, and the current Tau Ceti library by mathematical object and operation. Upstream roadmap commit: `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti commit: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. OperatorTheory has no Suggested file in that checkout. The reviewed library-coverage audit and the pinned declaration statements were consulted.

The following existing mathematics is deferred, not proposed again:

- AlgebraicTopology Stage 4: finite CW-pair chains, relative chains and cellular/singular comparison; Stage 5: finite-cover transfer and deck descent; Stage 6: finite-level duality with local systems. The new targets lift these through the specified arithmetic tower.
- `TauCeti.completedGroupAlgebra`, its ring/topology/projection/density API in `Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean`.
- `TauCeti.IsCompactModule` in `Topology/Algebra/Module/Compact.lean` and `IsCompactModule.completedGroupAlgebraModule`, `completedSMul_of`, `mkQ_completedSMul`, `continuousSMul_completedGroupAlgebraModule` in the completed-group-algebra Module file. Section 3.4 proves only the arithmetic two-index comparison and checks the action conventions.
- `TauCeti.IsCompactModule.module_finite_completedGroupAlgebraModule_of_dense_closure_univ_smul` in that Module file already gives the generic compact-module finite-generation criterion. Section 5.1 concerns the arithmetic model and its hypotheses; it does not re-propose that criterion.
- ProfiniteCohomology owns the discrete-coefficient theory on Mathlib's `continuousCohomology`. Compact completed-coefficient descent is a distinct ArithmeticGaloisDuality D7 contract.

These current-library declarations are later than the pin and are used only as boundary receipts in the README, not as imports of the suggested file. The latter was checked at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

### Notions moved down into this package

NoncommutativeAndEquivariantIwasawa is outside the 94-roadmap order, as the assembly handoff noted. Its prerequisite references cannot remain in this tier-12 package. The narrow facts needed here are therefore owned here:

| New owner | Interface moved down |
| --- | --- |
| 0.1 | Uniform pro-p conventions, the open uniform theorem, and a normal pro-p neighbourhood basis; the p=2 powerful condition is `[U,U] ⊆ U⁴`. |
| 3.11 | `O[[K]]` is local exactly when K is pro-p, with the finite quotient criterion and a non-pro-p negative control. |
| 5.1 | Left/right noetherianity for analytic completed group rings, via a uniform subgroup and finite-coset extension. |
| 5.5 | Auslander regularity, the integral/residual coefficient shift, grade, Ore rank and finite-index dimension invariance. |
| 5.8 | Filtered Hilbert growth along uniform power subgroups, including the noncommutative augmentation-ideal comparisons. |

The wider equivariant roadmap must import these interfaces. The package has no remaining NE.0 prerequisites. G1 still names the required proofs, rather than treating a citation to an outline as a proof. Venjakob's public author manuscript is added as a precise source for the Z_p filtered/Auslander argument; extension to ramified O is explicitly an additional coefficient argument.

The earlier assembly's downward moves are retained: 0.6–0.7 and 8.1–8.3 own the narrow finite comparison, orientation, central quotient and selected canonical-model inputs. ShimuraVarieties, HilbertModularVarietiesAndShimuraCurves and EtaleDualityAndPerverseSheaves import these narrow interfaces and retain their wider geometry. The new package does not cite their later layers as prerequisites. The L1 Banach/duality extension, P7/P8 extensions and IHG.2 equivariant extension remain explicit lower-owner contracts.

## Corrections to preserve when the packets are next revised

No input packet was changed. Besides the ownership moves above:

1. Section 3.8's normalised invariants and Haar formulas now require a **faithful regular cover with deck group K/K'**, so the cover degree really is `[K:K']`. Merely knowing that the effective deck group is a quotient of K/K' does not justify dividing trace by the raw index. An ineffective C2 action on a point has cover degree 1 and raw index 2; at odd p, division by 2 produces multiplication by 1/2 instead of the identity. Until the effective-kernel/Haar comparison is proved, only the unnormalised colimit is used. Section 3.9 inherits this restriction. This corrects a mathematical defect in the input hypotheses; neatness alone does not repair it.
2. The interior-image warning is made precise: for the constant source system Z mapping by reduction to Z/p^s, the image of the map on limits is Z inside Z_p, whereas the limit of the finite images Z/p^s is Z_p. Images cannot be interchanged with inverse limits without the kernel-system control.
3. The source labels E1–E5 remain attached to the corrections. Pan's mismatched Tate-module degree occurs in the published proof itself. I verified the published pp.44–45, not the alternative arXiv-v3 pagination.
4. Fu's equation (38) is on printed arXiv-v2 p.23; p.24 applies it. The specific descent citation is corrected accordingly. Gee–Newton's fetched PDF has 59 pages, not the 57 stated in the input source metadata. Schneider–Teitelbaum 1.2 is a theorem; 1.3 and 1.6 are propositions, and 1.4–1.5 lemmas.
5. The Lean statement of the no-coherent-roots clause is algebraic over any commutative ring, an element varpi and termwise `IsAdicComplete`/`IsSMulRegular` hypotheses, with `Localization.Away varpi` as source. Section 2.5 explicitly registers this generality and its convergent-sum proof; the arithmetic application keeps O the integers of a finite extension of Q_p. It does not broaden the other arithmetic conclusions to equal characteristic.

The inherited source corrections are retained with their witnesses: the torsion-only E/O term in the first integral UCT sequence; the adjacent Ext torsion term on coefficient reduction; restriction of growth to the regular uniform filtration; integral Ext amplitude d+1; the Tate-module degree; the Boxer–Pilloni completed tensor and Serre involution; and Nakamura's corrected diagram target. They are mathematical corrections, not claims that the authors have published errata.

## Adversarial mathematics pass

I walked every subsection's defining formula, identities, theorems and conventions, using the following concrete witnesses. This is a mathematical scope audit; the Lean build checks elaboration only.

| Statements checked | Instances and calculation | Result or restriction |
| --- | --- | --- |
| 0.1–0.7: index, uniform basis, coherent supports, coefficient transport and trace | Trivial group, point torsor, degree-p circle cover, compact quotient, modular cusps, p=2, real split centre and compact torus | Keep support and component data; distinguish degree from raw index; use U⁴ at 2; require coefficient descent and the complex orientation/Tate choice. |
| 1.1–1.5: colimits, smooth actions, Hecke and trace | Constant/zero diagram, degree-p circle, a lattice moved by an element of H, a cover of degree d | Level colimit precedes coefficient limit; integral action is H_int; trace after pullback is d, not 1. |
| 2.1–2.10: completion, Milnor, Pan control and Bockstein | O, E, `[O --varpi--> O]`, null-sequence diagonal differential varpi^n, non-ML kernel systems | Preserve lim¹; torsion transitions are multiplication by varpi; exclude E from complete terms; no-coherent-roots does not exclude every infinitely divisible class. |
| 3.1–3.7: duals, homology and integral UCT | O, O/varpi, zero, pointwise versus uniform topology, pro-p circle, inverse action of a nontrivial scalar | O-dual kills torsion; E/O-dual restores it; homology transition is pushforward; rationalisation follows the limits; dual left action uses the inverse. |
| 3.8–3.10: varying tame level and completion–Tate duality | Identity cover, prime-to-p faithful torsor, p-cover, ineffective C2 point, p=2 | Haar denominators must be units and actual cover indices; the ineffective example prompted the added hypothesis; do not average at p. |
| 3.11–3.17: localness, admissible complexes and coefficient tensors | Pro-p group, non-p finite quotient, zero module, free scalar coefficient, infinite product, noncommuting deck actions | Local iff pro-p is separate from finite projectivity; completed tensor and topologies are explicit; right/opposite actions and the BP involution remain. |
| 4.1–4.7: completed chains, perfectness and coefficients | Faithful point torsor, circle differential gamma−1, boundary pair, ineffective central kernel, torsion-free complete M | Require an actual finite regular CW tower; finite projective terms justify derived coinvariants; ordinary homology coinvariants alone fail on the circle; no unconditional perfectness for an ineffective full group. |
| 5.1–5.9: finiteness, admissibility, grade and growth | U={1}, U=Z_p, zero module, k over O, ramified O, p=2, anisotropic filtration of Z_p² | Integral dimension is d+1, residual d; rank vanishing is invariant under finite index; nonzero M and d>0 in growth; no arbitrary-filtration or concentration claim. Coefficient extension is a proof target. |
| 6.1–6.7: descent and classical maps | Circle Tor contribution, degree zero, a nontrivial algebraic coefficient, Q_p versus F_v analytic vectors | Completed continuous Tor is distinct from discrete algebraic Tor; retain coefficient factor; E06 gives a spectral sequence, while the stronger derived GSp4 comparison needs G6. |
| 7.1–7.8: supports, interior and Iwasawa duality | Compact quotient, open curve with cusps, zero/identity support map, dense Z in Z_p, O/varpi in local dimension zero, opposite action | Interior means image; control kernel lim¹ before commuting image and limit; no torsion-free Ext amplitude without its hypothesis; orientation/opposite-ring conversion remains in the chain pairing. |
| 8.1–8.6: arithmetic/étale adapters | Split real centre, S¹ torus fibre, Hilbert central units, definite unitary degree zero, nontrivial real component, p=2 | Ordinary versus compact supports have different central shifts; verify effective deck groups and coefficient descent; avoid prime-dividing component averaging; the perfectoid comparison stays with TC.2. |
| 8.7–8.15: actions, Hecke images and localisation | Trivial/sign actions, integral sign at 2 versus mod 2, noncommuting shears, constant/zero finite ring diagram, zero/identity idempotents, a label disappearing in an unsupported quotient | Joint continuity is a projection-topology theorem; commutation requires finite commutation; semilocality needs surjective transitions and radical kernels; localisation is a closed split range with an actual compatible supported label. |

Ten signature comparisons were made explicitly: `homology_hom_away_eq_zero` (and its registered algebraic scope), `interiorSubmodule_closed` (compact domain/Hausdorff target), `transportedAction_projection`, `transportedAction_unique`, `transportedAction_commute` (finite commutation), `transportedAction_jointlyContinuous` (joint finite continuity), `completedHecke_semilocal`, `completedHecke_decomposition` (finite rings, surjective transitions, radical kernels), `residualProjector_factor` (support at exactly one maximal ideal), and `completedLocalization_complete` (complete Hausdorff uniform additive group). The remaining signatures and examples were checked against the same native operations. No signature assumes its conclusion or uses a sorry-defined data carrier.

## Source verification and limits

All 17 original public PDFs were fetched anew on 16 October 2026 and their SHA-256 hashes match the input source records. Venjakob was fetched from his university page as the additional source. No restricted book was used. No PDF, source text, or source passage is included in the repository.

Direct reading in this run included the following printed-page ranges; the locators and mathematical matches were checked there. The bibliography also preserves additional locators from the accepted plan; this handoff does not claim a fresh line-by-line reading of every cited page.

| Source | Directly read for the package |
| --- | --- |
| E06 | pp.20–35 (finite-cell control, completed homology, lattices, actions and untwisting), pp.40–42 (central quotients and Galois comparison). |
| CE | pp.2–8, 12–14: definitions, duality, torsion, grade, coefficient and growth corrections. |
| GN | pp.7–11 and 23–24: actual chain model, patched perfectness and augmentation. |
| ST | pp.3–15: compact/Banach duality, transpose topology and admissibility. |
| CEbounds | pp.3–8: leading-rank/error estimates and the classical multiplicity proof inputs. |
| Marshall | Published pp.1646–1648: homological descent. |
| Fu | arXiv-v2 pp.23–24: double-limit definition, torsion bullet and equation (38). |
| BP | pp.56–57: completed-tensor duality, invariant action and Serre twist. |
| Nakamura | pp.20–24 and 90–92: tame Borel–Moore duality, normalisation, corrected diagram and coefficient-module duality. |
| LLHLM | pp.120–123: definite unitary functions and formula (5.8). |
| BCGP | pp.101–104: the derived GSp4 comparison and its boundary input. |
| MilneSV | pp.114–115, 118–119, 125–128: canonical-model criteria and functoriality. |
| E11 | pp.99–104: orthonormalisable/pro-free coefficients and duality. |
| MilneEC | pp.130–134 and 144–145: finite comparison, constructible extension and trace. |
| Scholze | Published pp.1020–1021: fixed-exponent completed convention and the separate perfectoid comparison. |
| Pan22 | Published pp.44–45: complete torsion-free control and the Tate-degree typo. |
| PanII | arXiv-v1 pp.118–120: coefficient maps, bounded torsion and complete-coefficient interchange. |
| Venjakob | pp.1, 16–21: hypotheses, filtered polynomial input, finite-index argument and Auslander dimension. |

Still unverified in this run: Pan22's alternative arXiv-v3 p.48 locator, the published PanII version, and the additional bibliography ranges outside the table above. The package's operative Pan22 locator is the fetched published pp.44–45; PanII uses the fetched arXiv-v1 numbering. The original plan's proof gaps are not resolved by source availability: in particular G5 still needs the classical multiplicity/noncuspidal proofs, G9 the canonical-model existence proofs, and G10 the constructible compact-support comparison beyond Milne's outline.

The remaining mathematical work is precisely planned in the README's G1–G10 and G12 obligations and its named finite equivariant noncommutative Hecke, finite p-group residue-detection and carrier targets. In particular the lower supplier extensions do not already assert the needed noncommutative P7/IHG statements. These are roadmap proof targets, not unfinished package deliverables. The independent package review should check the ownership moves, the strengthened tame-cover hypothesis and these source boundaries before the maintainer ports it upstream.

## Validation

- `python3 scripts/check_blueprint.py` on each of the three input packets: exit 0, 0 errors, 0 warnings.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/CompletedCohomologyPartII/Suggested.lean`: exit 0.
- `lean-check research/blueprint/packages/CompletedCohomologyPartII/Suggested.lean`: exit 0 at the required pins; only `declaration uses sorry` warnings. No Lean server, Lake project, dependency build or update was started.
- `python3 research/blueprint/intake.py check-files` on the three package files and this handoff: 0 problems.
- Coverage check: all 85 numbered subsections; all actual input definition API names retained after namespace conversion; every definition subsection has at least three Checks; no broken internal anchor links.
- `git diff --check`: clean. The submission contains only the four authorised deliverables.

No scratch file is needed by the next worker. Resume at the independent package review, using this handoff's corrections and the README's explicit proof inputs.

## Public source fingerprints

Access date for every file below: 2026-10-16. The Pan22 hash is for the PDF served by Cambridge through the DOI landing page.

| Source | Public file | SHA-256 |
| --- | --- | --- |
| E06 | [Source](https://math.uchicago.edu/~emerton/pdffiles/interpolate.pdf) | `8bde4c0c13ddf91e699468e3e9de4531fc6269e53a90c88b7932e1ae7e635826` |
| CE | [Source](https://math.uchicago.edu/~emerton/pdffiles/survey.pdf) | `926a5de427c4355da43daf00616fc81e366a52b34f53bb256d24309d2f7d0e08` |
| GN | [Source](https://www.ma.imperial.ac.uk/~tsg/Index_files/derivedpatchingpadicLL.pdf) | `c248b649dde553ec301d25909aa7c1d3909c146eb8cbb64a8637ea2a2994082d` |
| ST | [Source](https://arxiv.org/pdf/math/0005066) | `28dfe78dc1fcbe908641523a17ee1fdec5f330494dfdd5e4a48ac7b181c78747` |
| CEbounds | [Source](https://math.uchicago.edu/~emerton/pdffiles/bounds.pdf) | `ebc84f6f049a9efdcee643f564b8efd1de284d66bdde349a16cb36255eb046db` |
| Marshall | [Source](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n3-p13-p.pdf) | `0f7afc3733020661ff2efbd38a87067ce2687ef8c76bdf4e667425d8ecd55081` |
| Fu | [Source](https://arxiv.org/pdf/2201.11190v2) | `d71e9d3f8d3a1217743c3ba72c9a9630981f054ecefd943ff4edb4879b842614` |
| BP | [Source](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf) | `af70d084612b1b75761694923ef2395752d23b41e0b8b458910d096df4c8c3c6` |
| Nakamura | [Source](https://arxiv.org/pdf/2006.13647) | `0d8fa462594a20ef96d755d31a13ba23081f1454bfe9809a5fda54fd30311ba7` |
| LLHLM | [Source](https://math.rice.edu/~bl70/LLHLMlattices.pdf) | `848f3b73d80dbfe24af8bf863207b2bd426b74851f3e13e95d8e89f152cbbec0` |
| BCGP | [Source](https://arxiv.org/pdf/2502.20645v1) | `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c` |
| MilneSV | [Source](https://www.jmilne.org/math/xnotes/svi.pdf) | `f637e61735ff9cf9730c43d978d8f05185685a37d5e1920fc3347061c83d7c7e` |
| E11 | [Source](https://math.uchicago.edu/~emerton/pdffiles/lg.pdf) | `bf4f8556ef04be02daed0b1dba35c91ce4a7b2f4cbbf28d0d8351b1fc369eb13` |
| MilneEC | [Source](https://www.jmilne.org/math/CourseNotes/LEC.pdf) | `ac4f122f371d38a44c58c296b7dbf88081d89d2de2334070bff3606771c01077` |
| Scholze | [Source](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf) | `ebac854f47381c19a987b43b59d2c05cad55c3186c4d8cde067a7be0d06cbd16` |
| Pan22 | [Source](https://doi.org/10.1017/fmp.2022.1) | `61549f3aa31342994049b2d4780009f722c96b6331d0db6dd5bede0453bc293e` |
| PanII | [Source](https://arxiv.org/pdf/2209.06366v1) | `0873b61a758c57a9c5567f8e9ed7d905adcb7b359013a24e680facd1027b31b4` |
| Venjakob | [Author PDF](https://www.mathi.uni-heidelberg.de/~venjakob/papervenjakob/auslander.pdf) | `a0b4d2f06dad2c4bcd64c1d5ce7f50dc962b0225e2f0d8b47640569b1cef09fb` |
