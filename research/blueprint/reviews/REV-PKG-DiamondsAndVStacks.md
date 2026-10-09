# Independent package review: Diamonds and v-stacks

**Verdict: needs_changes. Completed independent review of #7513**, by Codex
(GPT-6), session `codex-kOJMv9`, on 9 October 2026. This session did none of
package-writing job #7468 (`codex-60DrsW`). The accepted input is
[DiamondsAndVStacks.json](../packets/DiamondsAndVStacks.json), reviewed on
7 October 2026. That packet was not modified.

The corrected README faithfully presents the mathematical plan. The remaining
acceptance failure is the suggested file's coverage of specified declarations.
Compilation succeeds, but comments listing missing signatures do not supply
those signatures. This review is finished; its negative verdict is not a
checkpoint of unfinished review work.

## Six required checks

| Issue criterion | Result | Evidence |
| --- | --- | --- |
| 1. Upstream form and size | Pass after editing | Introduction, conventions, ownership, seven ordered layers, mathematical subsections, numbered targets, APIs, examples, locators and prerequisites; 186,602 bytes. |
| 2. Fidelity to the accepted plan | Pass after correction | All 90 targets, 213 API items, 116 tests and 606 prerequisite occurrences retained; statements and hypotheses compared, including every paraphrase. |
| 3. Own words and precise sources | Pass after editing | Rewrote close source wording; checked manuscript versions and sensitive locators; no source passage or source-by-section exposition remains. |
| 4. No programme process in README | Pass | No packet/job/review/checkpoint/coverage language; mathematical supplier obligations remain explicit. |
| 5. Lean elaboration and target correspondence | **Needs changes** | Final `lean-check`: exit 0, no errors, 95 `sorry` warnings. Required APIs, full tests and named targets remain absent as types, as detailed below. |
| 6. Metadata | Pass | Exactly `topic = "math.AG"` and a newline; appropriate to this algebraic-geometric roadmap. |

Read [UniversalCovers](../../../content/tau-ceti/UniversalCovers/README.md) and
[AlgebraicTopology](../../../content/tau-ceti/AlgebraicTopology/README.md) in full
for upstream form, and inspected the nearby AdicSpaces and ClassFieldTheory
roadmaps. Read `UPSTREAM_GUIDE.md`, the blueprint and expansion protocols, the
complete package and the accepted input. The package's detailed API and example
lists provide the expected density; its mathematical scope is explicit.

## Required revision: supply the enumerated Lean interfaces

Sections [13 and 20 of PROTOCOL.md](../PROTOCOL.md#13-the-suggested-lean-file)
require signatures for the plan's definitions/constructions, their enumerated
API items and tests, and its named theorems. Issue #7513 additionally requires
that the declarations match the README targets. The standard warning that a
suggested file is not exhaustive leaves room for further library development;
it does not turn the expressly enumerated signatures into optional work.
Likewise, permission to omit a condition whose API cannot be expressed is not
permission to replace whole specified constructions and theorems by prose.

Reconciled the accepted `signatureCoverage` entries with the active file after
removing nested Lean comments, and read the active definitions and statements:

| Specified class | Typed suggested forms | Missing complete forms | Total |
| --- | ---: | ---: | ---: |
| Definition/construction API items | 87 | 126 | 213 |
| Full definition/construction tests | 20 | 96 | 116 |
| Named theorem/lemma/comparison/application targets | 11 prototypes | 49 | 60 |

All 87 claimed API names resolve to active declarations. There are 135 active
named declarations including helpers and 22 `example` commands; these syntactic
counts do not imply coverage of the 116 complete tests. Some examples compute
only an objectwise or partial clause. The 11 named prototypes also leave
auxiliary conclusions in the README; they are not certified as full statements.
The omission ledger says plainly that its remaining entries are comments.
There is no false claim that Lean elaborated those comments, and no `True` or
opaque proposition standing in for the missing geometry.

The complete target table below locates the work. In particular:

- **D0.25–D0.26:** stackification has genuine pseudofunctor types, but local
  essential surjectivity/Hom sheafification and the full torsor tests are
  untyped. The quotient of a groupoid object in sheaves, its atlas, its
  stabilizer criterion and its descent API are comments. `TwoFibreObject`
  and a `SingleObj` automorphism calculation do not define a quotient stack.
  Construct the ordinary groupoid-in-sheaves carrier and quotient
  pseudofunctor, then give the stated strong transformations, invertible
  modifications and universal-property equivalences.
- **D3.6 and D3.8; D4.7:** the `Perfd.Stack` predicates currently cover
  set-valued sheaves. That is a useful specialization, but the full
  groupoid-valued morphism predicates, 0-truncation/faithful fibre functors,
  and small-v-stack atlas/relation conditions need their actual signatures.
  State these using the pinned pseudofunctor/descent machinery; retain the
  sheaf specialization and its comparison rather than treating it as the
  general stack declaration.
- **D1–D6 geometric targets:** instantiate the stated perfectoid/adic supplier
  interfaces, or give precise typed interfaces with their actual mathematical
  data, so that the descent, spatiality, atlas-independence and analytic
  comparison targets can be stated. Arbitrary category/topology functors do
  not imply these geometric conclusions. The current generic marked-untilt
  presheaf does not yet state `PreAdic.diamond_isVSheaf`, the complete-pair
  `Spd` comparisons or the integral examples of D6.6.
- **Tests:** turn the ledger's complete discriminating cases into Lean
  examples. For instance, D0.17's typed finite-coproduct example omits the
  infinite coproduct of noninitial sheaves, and the objectwise group
  calculation does not construct BG with its torsors and automorphism sheaf.
  D6 must distinguish integral `Spd(O_C,O_C)` from the analytic field pair.

A revision must preserve the full README scope and precise supplier boundaries,
complete these signatures rather than remove targets to fit the prototype,
and rerun `lean-check` with only `sorry` warnings. Use actual carriers and
conditions; opaque `Prop` fields and `def _ : Prop := sorry` would not repair
this finding. Where expressing a condition genuinely requires another owner's
interface, keep that particular omission precise and explain its effect on the
signature. No proof completion is requested by this package review.

The accepted planning review explicitly accepted honest open stages and their
omission ledger. This review does not reverse its mathematical planning verdict.
It applies the final package's additional signature requirement. The seven
recorded proof gaps and six supplier requests alone are not the reason for
`needs_changes`.

## Mathematical fidelity and corrections

The full crosswalk checks every target, not merely its heading. All definition
API and test names remain present. All 606 prerequisites match the accepted
references, with internal node ids converted to the appropriate numbered
anchors. All 112 explicit anchors are unique and every internal link resolves.
The packet checker independently resolves the prerequisite graph and reports
zero errors and warnings.

One auxiliary README assertion contradicted the already corrected accepted
plan. D0.17 now requires the terminal **object** to be quasicompact before
inferring object-quasicompactness from a quasicompact terminal morphism. For
sheaves on an infinite discrete space, the terminal object is not qc, while
its identity is a qc morphism: pulling that identity back along any qc object
returns the same object. This is the counterexample to the previous implication.
The active Lean theorem already had the terminal-object hypothesis, so its type
needed no change. The source is ECD's topos recollection, pp.40–41, read with the
accepted correction, not as authority for the unqualified implication.

Rewrote 22 target paragraphs in the README in our own words, preserving all
clauses, and synchronized the 49 comment-only named-target statements in
Suggested.lean with the definitive README. Added separators to run-together
hypotheses, restored the literal library identifier `StoneCech`, and made the
D0.20 constant-sheaf citation identify stable tag 02UW explicitly. These edits
change no active Lean token and introduce no new target or prerequisite.

The sensitive distinctions survive the edits:

- Split open covers are characterized by the epimorphism-to-surjection
  property of set-valued global sections, not preservation of every finite
  colimit. A two-point discrete space gives the product functor on pairs of
  sets, which does not preserve binary coproducts (ECD 7.2, pp.29–30).
- W-localization is a right adjoint, with its map to the original space;
  localization contains generalizations (ECD 7.12–7.14, pp.34–35;
  Bhatt–Scholze 2.1.10, p.8).
- The quotient criterion keeps its qc-open-basis and generalizing-projection
  hypotheses (ECD 2.7, 2.9–2.10, pp.11–13). The Stacks scheme-groupoid
  neighbourhood result is a counterpart, not a proof of arbitrary topology.
- Two-out-of-three uses surjective quasi-pro-étale f, quasi-pro-étale g∘f,
  and separated g, to conclude the property for g (ECD 11.30, pp.68–69).
- The component-orbit comparison has the explicit totally disconnected
  component-quotient hypothesis. GLX 3.2, p.16, does not justify the unrestricted
  assertion; the noncompact period-torsor application remains a stated proof
  obligation rather than an application of that unrestricted assertion.
- KL16 3.5.8, p.76, supplies the vector-bundle target with its analytic/étale/
  pro-étale/v distinctions and the affinoid finite-projective specialization;
  the convergent matrix descent input remains explicit.
- Fixed-field rigid full faithfulness assumes a seminormal source and keeps
  the morphism to `Spd K` (Berkeley 10.2.3, p.78; KL16 8.2.3, pp.162–163).
  Integral pre-adic diamondification is a v-sheaf statement, not a blanket
  diamond statement. Its map of underlying spaces is a continuous surjection
  in general and a homeomorphism in the analytic case. The integral Galois
  quotient is a proper v-cover, not an asserted free torsor (Berkeley
  18.1.1–18.2.2, pp.161–162).

## Suppliers, libraries and ownership

Read the DiamondsAndVStacks rows of the reviewed AUDIT-36 result and its review,
and the relevant AdicSpaces link map and RS-05 owner entries. Compared the 35
exact external supplier-node statements used by the package and the stage
contracts with the README's boundaries. The six requests specify extensions;
they are not silently claimed to be already supplied. In particular:

- Perfectoid spaces, tilting, almost purity, perfectoid rational geometry and
  pro-étale morphisms retain their P0–P6 owners; D2 builds the topologies.
- A4 supplies the analytic uniform-completion tower and finite-étale descent;
  D6 builds its diamond quotient and analytic-site comparison, including the
  generalized analytic site for pairs whose structural presheaf is not sheafy.
- R0/R2 supply the requested seminormal rigid and integral pre-adic extensions;
  the existing noetherian formal-spectrum target is not substituted for the
  required nonnoetherian complete pairs.
- TB.0's current normed-ring spectrum needs the explicit early complete-Tate
  extension. Its contract cannot depend backwards on D5.
- General canonical compactification belongs to C4. The RS-05 result still has
  the old D5 owner row noted by the accepted review. Preserve the corrected
  accepted-plan boundary in this package; synchronization of that external
  owner row belongs to the maintainer, not this issue's deliverables.

Read baseline declaration statements from the exact Mathlib and Tau Ceti
commits, with full contextual checks of spectral spaces/maps, constructible
compactness, pro-constructible subsets and Spa spectrality, and the sheaf,
descent, flatness and category carriers used by the active file. The 107
baseline references name existing foundations, not implemented perfectoid,
diamond or v-stack geometry. Tau Ceti source readings used `git show` at
`f790474821cf4256814db967cb154e7af3d0c369`; the shared Mathlib checkout is exactly
`082e2d37e8b0463410cdb532e111cd43d5a66174`. The suggested file imports individual
Mathlib modules only; it does not purport to elaborate a Tau Ceti geometric
supplier whose built module is unavailable.

## Sources and wording evidence

Downloaded the eleven public source PDFs below on 9 October 2026. Each hash
reproduces the accepted source receipt exactly. Consulted the supplied library
index; no restricted book or alternative uncleared copy was needed. No source
PDF, extracted source text or source passage is submitted.

Fresh source readings were targeted to package fidelity and the sensitive
claims above: ECD pp.10–12, 29–30, 32–35, 41 and 68–69; Bhatt–Scholze
pp.6 and 8; GLX p.16; KL16 pp.76, 81 and 162; Berkeley pp.78 and 161–162.
The remaining citations were compared to the accepted source-version and
locator records; this is not a claim to have independently reread every proof
in all eleven manuscripts. Stacks locators use stable tags in place of print
pages, and SGA transcription/PDF pagination is distinguished in the README.

Read the edited prose directly and scanned both package text files against
all eleven extracted PDFs for identical normalized runs of 16 words. After
the edits there are no matches. The scan is a supporting check, not a proof
that every shorter mathematical phrase is original. The exposition is organized
by the roadmap's foundation strands and geometric layers, rather than as a
section-by-section account of a source.

| Source, fetched 2026-10-09 | SHA256 |
| --- | --- |
| [ecd](https://arxiv.org/pdf/1709.07343v4) | `78ca42bba46f1d43c894b0dbfdfb41105efab4959ba5ba6e32e1e5cf7ef33efc` |
| [berkeley](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf) | `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc` |
| [arc](https://arxiv.org/pdf/1807.04725v4) | `4cdf5593067a425ca0aebc969d34efa4ef296cde613c3d9a6c671db65b9b6620` |
| [kl15](https://arxiv.org/pdf/1301.0792) | `a6a117423db62aec072442bb15b70e3175bcc3b631bdcd6d74f740e3c6cfd942` |
| [kl16](https://arxiv.org/pdf/1602.06899) | `97383900492daf1c6778959c37e993f67dd5ad379ac03c31049b870382e5d42c` |
| [heuer](https://arxiv.org/pdf/2307.01303) | `df8caac5ee92e8bcd5a4f9de8dcd5901d61d5f6f4f5c1c3c5bd6b65880e18943` |
| [hk](https://arxiv.org/pdf/2308.11064v2) | `c133b06bec1209a04f84d1c2984b78ce2242ba85fc1b72cf5a662002685cab8a` |
| [glx](https://arxiv.org/pdf/2208.07195v3) | `d2249ddbe1ae2f4728000d27846d396adffc97b2f8b7b1c82c5d2701153fcb12` |
| [sch12](https://arxiv.org/pdf/1111.4914) | `065441a872c5861560014f5c7675fdd4606b5796684f6a829747f01afee18e7b` |
| [sga4vi](https://pi.math.cornell.edu/~dkmiller/bin/sga4-2.pdf) | `8c5ab5c35e6c72c422d8d01c21dd7aaeeb5f55ebe282116d5b1d4f93b983b759` |
| [bs15](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf) | `99b418b32846c12721e0603590be864b0982d5fa7cf594f8771fc78e53e014c7` |

## Complete target and signature crosswalk

Every row's statement, hypotheses, API, tests, sources and prerequisites was
compared to the accepted plan. The target number links to the corrected README.
API and test columns give **typed / missing full forms**, not the number of
names present in comments. A dash means that class is absent for that node.
`prototype` describes a named target's documented partial/baseline-relative
form; `comment` means there is no active named-target type. Definitions and
constructions use the API/test columns; their suppliers and partial forms were
also inspected. This table is a revision index, not a formalization claim.

| README target | Accepted target suffix | API typed / missing | Tests typed / missing | Named target |
| --- | --- | ---: | ---: | --- |
| [D0.1](../packages/DiamondsAndVStacks/README.md#d0-1) | `locally-spectral-space` | 8 / 0 | 3 / 1 | — |
| [D0.2](../packages/DiamondsAndVStacks/README.md#d0-2) | `constructible-topology-profinite` | — | — | prototype |
| [D0.3](../packages/DiamondsAndVStacks/README.md#d0-3) | `pro-constructible-subsets` | — | — | prototype |
| [D0.4](../packages/DiamondsAndVStacks/README.md#d0-4) | `closure-of-pro-constructible` | — | — | prototype |
| [D0.5](../packages/DiamondsAndVStacks/README.md#d0-5) | `inverse-spectral-topology` | 4 / 0 | 3 / 0 | — |
| [D0.6](../packages/DiamondsAndVStacks/README.md#d0-6) | `spectral-components-profinite` | — | — | prototype |
| [D0.7](../packages/DiamondsAndVStacks/README.md#d0-7) | `generalizing-surjection-is-quotient` | — | — | prototype |
| [D0.8](../packages/DiamondsAndVStacks/README.md#d0-8) | `pro-constructible-equivalence-relation` | — | — | comment |
| [D0.9](../packages/DiamondsAndVStacks/README.md#d0-9) | `spectral-quotient-criterion` | — | — | comment |
| [D0.10](../packages/DiamondsAndVStacks/README.md#d0-10) | `cofiltered-limits-of-spectral-spaces` | — | — | prototype |
| [D0.11](../packages/DiamondsAndVStacks/README.md#d0-11) | `spectral-submersion` | 4 / 0 | 2 / 1 | — |
| [D0.12](../packages/DiamondsAndVStacks/README.md#d0-12) | `spectral-submersions-under-limits` | — | — | prototype |
| [D0.13](../packages/DiamondsAndVStacks/README.md#d0-13) | `pro-category-of-finite-t0-spaces` | 8 / 0 | 3 / 1 | — |
| [D0.14](../packages/DiamondsAndVStacks/README.md#d0-14) | `ordinal-assembly-of-cofiltered-diagrams` | 0 / 3 | 0 / 3 | — |
| [D0.15](../packages/DiamondsAndVStacks/README.md#d0-15) | `hochster-realization` | — | — | prototype |
| [D0.16](../packages/DiamondsAndVStacks/README.md#d0-16) | `profinite-presentation-of-compact-hausdorff` | 6 / 0 | 4 / 0 | — |
| [D0.17](../packages/DiamondsAndVStacks/README.md#d0-17) | `quasicompact-objects-in-a-topos` | 8 / 0 | 0 / 4 | — |
| [D0.18](../packages/DiamondsAndVStacks/README.md#d0-18) | `filtered-colimits-and-cohomology-on-coherent-sites` | — | — | comment |
| [D0.19](../packages/DiamondsAndVStacks/README.md#d0-19) | `cech-to-derived-comparison` | — | — | comment |
| [D0.20](../packages/DiamondsAndVStacks/README.md#d0-20) | `constant-sheaf-on-irreducible-space` | — | — | comment |
| [D0.21](../packages/DiamondsAndVStacks/README.md#d0-21) | `coherent-topos-limit-cohomology` | — | — | comment |
| [D0.22](../packages/DiamondsAndVStacks/README.md#d0-22) | `ordinary-sheaves-on-profinite-sets` | — | — | comment |
| [D0.23](../packages/DiamondsAndVStacks/README.md#d0-23) | `cutoff-cardinal` | — | — | prototype |
| [D0.24](../packages/DiamondsAndVStacks/README.md#d0-24) | `completion-cardinality-bound` | — | — | prototype |
| [D0.25](../packages/DiamondsAndVStacks/README.md#d0-25) | `stackification` | 6 / 1 | 2 / 2 | — |
| [D0.26](../packages/DiamondsAndVStacks/README.md#d0-26) | `groupoid-quotients-and-two-fibre-products` | 2 / 6 | 1 / 3 | — |
| [D1.1](../packages/DiamondsAndVStacks/README.md#d1-1) | `totally-disconnected-perfectoid-space` | 3 / 5 | 0 / 4 | — |
| [D1.2](../packages/DiamondsAndVStacks/README.md#d1-2) | `split-cover-characterisation` | — | — | comment |
| [D1.3](../packages/DiamondsAndVStacks/README.md#d1-3) | `components-of-totally-disconnected` | — | — | comment |
| [D1.4](../packages/DiamondsAndVStacks/README.md#d1-4) | `strictly-totally-disconnected` | 2 / 4 | 0 / 4 | — |
| [D1.5](../packages/DiamondsAndVStacks/README.md#d1-5) | `pro-constructible-generalizing-subsets-are-affinoid` | — | — | comment |
| [D1.6](../packages/DiamondsAndVStacks/README.md#d1-6) | `automatic-flatness` | — | — | comment |
| [D1.7](../packages/DiamondsAndVStacks/README.md#d1-7) | `w-local-and-w-strictly-local` | 3 / 3 | 0 / 4 | — |
| [D1.8](../packages/DiamondsAndVStacks/README.md#d1-8) | `w-localization` | 0 / 8 | 0 / 4 | — |
| [D1.9](../packages/DiamondsAndVStacks/README.md#d1-9) | `universally-open-std-cover` | 0 / 7 | 0 / 4 | — |
| [D1.10](../packages/DiamondsAndVStacks/README.md#d1-10) | `pro-etale-maps-over-std-base` | — | — | comment |
| [D1.11](../packages/DiamondsAndVStacks/README.md#d1-11) | `topological-classification-of-pro-etale-maps` | — | — | comment |
| [D2.1](../packages/DiamondsAndVStacks/README.md#d2-1) | `big-pro-etale-site` | 2 / 6 | 0 / 4 | — |
| [D2.2](../packages/DiamondsAndVStacks/README.md#d2-2) | `small-pro-etale-site-and-v-site` | 4 / 4 | 0 / 4 | — |
| [D2.3](../packages/DiamondsAndVStacks/README.md#d2-3) | `cutoff-independence` | — | — | comment |
| [D2.4](../packages/DiamondsAndVStacks/README.md#d2-4) | `perfectoid-sheaf-topoi-are-algebraic` | — | — | comment |
| [D2.5](../packages/DiamondsAndVStacks/README.md#d2-5) | `pro-etale-etale-comparison-and-structure-sheaves` | — | — | comment |
| [D2.6](../packages/DiamondsAndVStacks/README.md#d2-6) | `subcanonicity-of-the-pro-etale-topology` | — | — | comment |
| [D2.7](../packages/DiamondsAndVStacks/README.md#d2-7) | `v-descent-of-functions` | — | — | comment |
| [D2.8](../packages/DiamondsAndVStacks/README.md#d2-8) | `higher-v-acyclicity` | — | — | comment |
| [D2.9](../packages/DiamondsAndVStacks/README.md#d2-9) | `vector-bundles-across-pro-etale-and-v-sites` | — | — | comment |
| [D3.1](../packages/DiamondsAndVStacks/README.md#d3-1) | `descent-prestacks-of-perfectoid-spaces` | — | — | comment |
| [D3.2](../packages/DiamondsAndVStacks/README.md#d3-2) | `descended-subsets-are-cut-out-by-functions` | — | — | comment |
| [D3.3](../packages/DiamondsAndVStacks/README.md#d3-3) | `effective-descent-affinoid-over-totally-disconnected` | — | — | comment |
| [D3.4](../packages/DiamondsAndVStacks/README.md#d3-4) | `effective-descent-separated-pro-etale` | — | — | comment |
| [D3.5](../packages/DiamondsAndVStacks/README.md#d3-5) | `etale-and-finite-etale-are-v-stacks` | — | — | comment |
| [D3.6](../packages/DiamondsAndVStacks/README.md#d3-6) | `etale-and-quasi-pro-etale-morphisms-of-stacks` | 4 / 5 | 0 / 4 | — |
| [D3.7](../packages/DiamondsAndVStacks/README.md#d3-7) | `sub-v-sheaves-of-totally-disconnected-spaces` | — | — | comment |
| [D3.8](../packages/DiamondsAndVStacks/README.md#d3-8) | `immersions-separatedness-and-truncatedness` | 3 / 6 | 0 / 4 | — |
| [D3.9](../packages/DiamondsAndVStacks/README.md#d3-9) | `v-local-nature-of-morphism-classes` | — | — | comment |
| [D3.10](../packages/DiamondsAndVStacks/README.md#d3-10) | `locally-profinite-torsors` | 3 / 6 | 0 / 4 | — |
| [D4.1](../packages/DiamondsAndVStacks/README.md#d4-1) | `diamond` | 5 / 3 | 0 / 4 | — |
| [D4.2](../packages/DiamondsAndVStacks/README.md#d4-2) | `quotient-presentations-of-diamonds` | — | — | comment |
| [D4.3](../packages/DiamondsAndVStacks/README.md#d4-3) | `atlas-characterisation-of-diamonds` | — | — | comment |
| [D4.4](../packages/DiamondsAndVStacks/README.md#d4-4) | `diamonds-are-v-sheaves` | — | — | comment |
| [D4.5](../packages/DiamondsAndVStacks/README.md#d4-5) | `underlying-topological-space` | 1 / 7 | 0 / 4 | — |
| [D4.6](../packages/DiamondsAndVStacks/README.md#d4-6) | `compact-hausdorff-diamonds` | — | — | comment |
| [D4.7](../packages/DiamondsAndVStacks/README.md#d4-7) | `small-v-sheaves-and-small-v-stacks` | 1 / 7 | 0 / 3 | — |
| [D4.8](../packages/DiamondsAndVStacks/README.md#d4-8) | `spaces-and-surjectivity-for-small-v-stacks` | — | — | comment |
| [D4.9](../packages/DiamondsAndVStacks/README.md#d4-9) | `isomorphism-criteria-for-v-sheaves-and-stacks` | — | — | comment |
| [D4.10](../packages/DiamondsAndVStacks/README.md#d4-10) | `small-quotients-and-underlying-spaces` | — | — | comment |
| [D5.1](../packages/DiamondsAndVStacks/README.md#d5-1) | `spatial-diamond` | 3 / 6 | 0 / 4 | — |
| [D5.2](../packages/DiamondsAndVStacks/README.md#d5-2) | `injection-and-finite-etale-permanence` | — | — | comment |
| [D5.3](../packages/DiamondsAndVStacks/README.md#d5-3) | `limits-and-finite-stage-comparisons` | — | — | comment |
| [D5.4](../packages/DiamondsAndVStacks/README.md#d5-4) | `universally-open-presentation` | — | — | comment |
| [D5.5](../packages/DiamondsAndVStacks/README.md#d5-5) | `quasi-pro-etale-and-fibre-product-permanence` | — | — | comment |
| [D5.6](../packages/DiamondsAndVStacks/README.md#d5-6) | `two-out-of-three-for-quasi-pro-etale` | — | — | comment |
| [D5.7](../packages/DiamondsAndVStacks/README.md#d5-7) | `local-structure-of-etale-maps` | — | — | comment |
| [D5.8](../packages/DiamondsAndVStacks/README.md#d5-8) | `localization-at-a-point` | 1 / 3 | 0 / 3 | — |
| [D5.9](../packages/DiamondsAndVStacks/README.md#d5-9) | `locally-closed-generalizing-subdiamond` | 1 / 2 | 2 / 2 | — |
| [D5.10](../packages/DiamondsAndVStacks/README.md#d5-10) | `profinite-products-of-locally-spatial-diamonds` | — | — | comment |
| [D5.11](../packages/DiamondsAndVStacks/README.md#d5-11) | `spatial-v-sheaf-criterion` | — | — | comment |
| [D5.12](../packages/DiamondsAndVStacks/README.md#d5-12) | `relative-representability` | 3 / 5 | 0 / 4 | — |
| [D5.13](../packages/DiamondsAndVStacks/README.md#d5-13) | `berkovich-quotient` | 0 / 8 | 0 / 4 | — |
| [D5.14](../packages/DiamondsAndVStacks/README.md#d5-14) | `reduction-to-spatial-and-hausdorff-cohomology` | — | — | comment |
| [D5.15](../packages/DiamondsAndVStacks/README.md#d5-15) | `components-of-restricted-quotients` | — | — | prototype |
| [D6.1](../packages/DiamondsAndVStacks/README.md#d6-1) | `spd-of-a-tate-pair` | 0 / 8 | 0 / 4 | — |
| [D6.2](../packages/DiamondsAndVStacks/README.md#d6-2) | `untilt-descent-along-v-covers` | — | — | comment |
| [D6.3](../packages/DiamondsAndVStacks/README.md#d6-3) | `spd-is-a-spatial-diamond` | — | — | comment |
| [D6.4](../packages/DiamondsAndVStacks/README.md#d6-4) | `gluing-and-the-diamond-functor` | 0 / 8 | 0 / 4 | — |
| [D6.5](../packages/DiamondsAndVStacks/README.md#d6-5) | `etale-site-comparison` | — | — | comment |
| [D6.6](../packages/DiamondsAndVStacks/README.md#d6-6) | `pre-adic-diamondification` | 2 / 5 | 0 / 5 | — |
| [D6.7](../packages/DiamondsAndVStacks/README.md#d6-7) | `integral-galois-quotient` | — | — | comment |
| [D6.8](../packages/DiamondsAndVStacks/README.md#d6-8) | `pre-adic-topological-comparison` | — | — | comment |
| [D6.9](../packages/DiamondsAndVStacks/README.md#d6-9) | `seminormal-rigid-full-faithfulness` | — | — | comment |

## Final validation and artifact identities

- `python3 scripts/check_blueprint.py research/blueprint/packets/DiamondsAndVStacks.json`:
  **0 errors, 0 warnings**, 90 nodes, 213 APIs, 116 tests, 107 baseline records,
  seven stages planned and none closed.
- Final `lean-check research/blueprint/packages/DiamondsAndVStacks/Suggested.lean`:
  **exit 0, no errors, 95 warnings, all declaration uses `sorry`**. Memory was
  checked before each run; used the shared pinned build and left no compilation
  running. No language server, Lake project, build, update or cache fetch was used.
- Final correspondence and anchor checks pass; JSON and TOML parse; README size
  and process-word checks pass; active Lean code matches the input after comment
  removal. The accepted packet and all other jobs' files remain unchanged.

| Artifact | SHA256 |
| --- | --- |
| Accepted plan | `a427a7649fb43e0e20477e090dac6bc8d44ffd73d8fb4be0a65e4afd26b7f4d4` |
| Corrected README | `1f9f057abc360b9d7b918e479df9df4cab99b5f69a107213ae504852936ce5a5` |
| Corrected Suggested.lean | `bdc7ddf2f0f044647690ea093c08ee8128a163c7defe382bb0409ee798658a56` |

## Round 2 — 9 October 2026 (fixing review, streamlined pipeline)

**Verdict: accepted**, by Claude (Fable 5.1), session `cc-c62abc`, as
`independent-review-REV-PKG-DiamondsAndVStacks~2`. Round 1's only ground for
`needs_changes` was that 49 named targets, 126 API items and 96 tests were
comment-only. Under the streamlined pipeline a statement whose carriers do not
exist at the pins is simply absent from `Suggested.lean`; that is not a defect.
What follows was fixed in place; nothing was sent back.

### What was fixed

1. **`Suggested.lean` rewritten in TauCetiRoadmap form**, after the model
   `AdicSpaces/Suggested.lean`: `import Mathlib`; one module docstring stating
   the three design choices (extend Mathlib's spectral predicates, state the
   geometric layers relative to a supplied category with an underlying-space
   functor and supplied morphism classes, carry `Pro C` by `(Ind Cᵒᵖ)ᵒᵖ`);
   `namespace TauCetiRoadmap.DiamondsAndVStacks` for the whole file with topic
   sub-namespaces (`Spectral`, `Pro`, `Topos`, `Stack`, `Perfd`, `Perf`,
   `PreAdic`, `BerkovichSpectrum`); `/-! ## Layer k -/` sections in README
   order; a docstring on every declaration; `theorem` throughout; examples for
   unit tests. The 500-line omission ledger, every process comment and the
   `TauCeti.Diamonds`/`CategoryTheory.*`/`CompHaus` namespaces are gone; a
   short closing comment names the untyped targets. Wrapping in one namespace
   worked without breaking resolution; the only adjustments `import Mathlib`
   forced were `CategoryTheory.Equivalence.refl` (the root `Equivalence.refl`
   is the `Prop` one) and an explicit `[HasCoproduct F]` on the finite-coproduct
   test, whose instance search otherwise times out.
2. **Five previously comment-only targets typed with `sorry`** from Mathlib
   carriers: D0.8 (`ProConstructibleEquivalenceRelation`: `T0` quotient and
   invariant neighbourhoods, with the graph closed in
   `constructibleTopology (X × X)` and relative-spectral generalizing
   projections), D0.9 (`SpectralQuotientCriterion` with the qc-basis
   hypothesis, and `.of_isOpenMap` for the open case), D0.18
   (`Topos.preservesFilteredColimits_cohomology`: `Sheaf.cohomologyPresheafFunctor`
   evaluated at a qcqs object preserves filtered colimits on an algebraic
   site), D0.20 (`ConstantSheafOnIrreducibleSpace`: surjective restrictions and
   `Subsingleton (Sheaf.H _ (n+1))` for `constantSheaf` on
   `Opens.grothendieckTopology`), D1.2 (`OpenCoversSplit` and
   `SplitCoverCharacterisation`: the four equivalences of ECD 7.2 with the
   epimorphism-to-surjection clause on set-valued global sections). The new
   D5.13 is typed as `BerkovichSpectrum` (continuous `MulRingSeminorm`s with
   `φ ϖ = 1/2`, pointwise topology), `compactSpace_t2Space` for a complete Tate
   ring presented by an open `ϖ`-adic subring, and `changeNormalization`.
3. **Upward and out-of-order citations.** `FoundationsAndLibraryIntegration:LI.0`
   (a process stage, "pinned libraries and declarations") is replaced by the
   Mathlib and Tau Ceti items it stood for. `TropicalAndBerkovichArithmetic:TB.0`
   lies outside the 94 roadmaps of the order file, so the notion moved down:
   new target **D5.13 — The Berkovich spectrum of a complete Tate ring and the
   maximal Hausdorff quotient of Spa**, sourced to ECD Definition 13.7, Remark
   13.8 and Proposition 13.9 (p. 79; ECD states it for affinoid perfectoid
   spaces and the argument uses only that `R` is complete Tate), with seven API
   items and four tests; the former D5.13–D5.15 are now D5.14–D5.16 and D5.14
   takes its spectrum from D5.13. The `AdicCoefficientsAndComparisons:L1`
   dependency inside D6.6 (API item `PreAdic.diamond_integralScheme` and the
   comparison clause) is dropped: that comparison is the consumer's. Pointers
   to DiamondEtaleCohomology, EnhancedDerivedSheaves, RelativeFarguesFontaine
   and AdicCoefficientsAndComparisons now appear only in the boundaries
   section; the inline DiamondSixOperations name in D5.12 is gone.
4. **Form of the upstream README.** "Ownership and imported geometry" is now
   "Prerequisites and boundaries" and lists what Tau Ceti already has (the
   pro-constructible calculus, patch criterion, spectrality of `Spv`/`Cont`/`Spa`,
   AdicSpaces Layers 1–3, and the Mathlib carriers) as deferrals, with the one
   clause by which D0.1, D0.3 and D0.5 extend them. No "(removed)" stubs; the
   nine `Hypotheses and scope` lines without terminal punctuation were
   completed. Layer table and D5 introduction mention the Berkovich spectrum.

### Duplication sweep (TauCeti a91d3aaf and current roadmaps)

Searched by object (spectral spaces, constructible topology, pro-constructible
sets, generalizing maps, quotient criteria, Hochster dual, pro-categories,
Stone–Čech presentations, stackification, cutoff cardinals, w-local spaces,
split covers, perfectoid/tilt/pro-étale/v-topology/diamond/Berkovich). In the
library: `Topology/Spectral/{PatchCriterion,ProConstructible,SpectralMap}.lean`
and the `AdicSpace` spectrality modules are unchanged since the atlas pin
(`ProConstructible.lean` differs by one import) and were already cited;
`AdicSpace/FarguesFontaine/{Y,Window,Quotient}.lean` build the Frobenius orbit
space `𝒴/φ^ℤ` as a topological quotient, not a diamond; `RingTheory/Huber/WittVector.lean`
gives `A_inf` its Huber structure only; the new `Topology/Category/TopCat/Cech/*`
is the Čech diagram of an open cover in `TopCat`, not the site-level comparison
of D0.19. No perfectoid, tilting, pro-étale, v-sheaf, diamond or Berkovich
material exists. In the roadmaps (including the nine newer than the atlas
snapshot and `Completed/*`): only AdicSpaces touches these notions (Layers 1–2,
already the roadmap's cited supplier); the other hits were instance diamonds
and Leray in unrelated senses. **No target was removed.**

### Checks

- Sources: 30 locators re-read in the downloaded texts (ECD 2.1, 2.2, 2.5, 2.7,
  2.9, 2.11, 4.1, 7.1, 7.12, 7.18, 7.19, 8.1, 9.6, 10.12, 11.1, 11.17, 11.31,
  12.1, 13.7, 15.1; Arc 2.14, 2.18, 3.10; GLX 3.2; KL16 3.5.8, 8.2.3; Berkeley
  10.2.3, 18.1.1, 18.1.2, 18.2.2). All on the stated pages (Berkeley printed
  page + 10 = PDF page, as the README says). Downloads reproduce Round 1's
  hashes.
- Gaps: every prerequisite is Mathlib, Tau Ceti, an earlier target, a bundle
  roadmap (PerfectoidSpaces, AdicEtaleGeometry, AdicSpacesPartII) or
  SchemeAndStackFoundations (tier 2). No `UPSTREAM:` ids remain.
- Unit tests: 120 (116 + 4 for D5.13), each discriminating; 23 typed as
  `example`s.
- Lean: `/home/chris/atlas-workers/bin/lean-check …/Suggested.lean` → exit 0,
  104 `declaration uses sorry` warnings, nothing else; 150 declarations.
  Ten signatures spot-checked against the README (D0.1, D0.5, D0.8, D0.9,
  D0.11, D0.17, D0.18, D1.2, D4.1, D5.13): hypotheses present, nothing vacuous,
  no `True` or `Prop := sorry`.
- Own words: the new D5.13 paragraph and all docstrings are original prose.
- `python3 research/blueprint/intake.py check-files` on the five files: 0
  problems; no `/home/` paths.

### What remains (not defects)

The statements still absent from `Suggested.lean` are exactly those needing
the perfectoid category, tilting, pro-étale limits, or the pre-adic and
rigid-analytic interfaces: D0.14, D0.19, D0.21, D0.22, most of D1–D6 beyond the
generic relative forms, and the `Spa`-side half of D5.13. They are named in
the file's closing comment and fully stated in the README. README: 91 targets,
219 API items, 120 tests, 190,943 bytes.
