# Independent package review: Perfectoid quotients

**Verdict: accepted after corrections.** All six checks in issue #7526 hold
for the corrected package. Review by Codex (GPT-6), session `codex-5yUR5w`,
9 October 2026. This reviewer did not perform the package-writing job #7494
(session `codex-L7wvYo`). The accepted plan is
[PerfectoidQuotients.json](../packets/PerfectoidQuotients.json), independently
reviewed on 6 October 2026. This verdict accepts its mathematical roadmap and
honest prototype; it does not certify proofs, completed supplier implementations
or closure of the plan's seven recorded gaps and nine requests.

## 1. Upstream form

Read the complete package and compared it with the complete upstream
[AdicSpaces](../../../content/tau-ceti/AdicSpaces/README.md) and
[AnalyticToricGeometry](../../../content/tau-ceti/AnalyticToricGeometry/README.md)
roadmaps and with `UPSTREAM_GUIDE.md`. The README introduces the purpose,
conventions, neighbouring owners and pinned foundations before developing the
layers in order. Related targets share mathematical subsections; definitions
have named APIs and tests, while theorems retain hypotheses, proof routes,
locators and prerequisites. It is 79,120 bytes after correction, below the
200 KB limit. It is a mathematical exposition rather than the older reader
copied into a package.

## 2. Fidelity, hypotheses and ownership

Read all 61 accepted targets, including statements, hypotheses, APIs, tests
and source locators, and the complete README and suggested file.
The crosswalk below accounts for each target exactly once. All 42 API names
and all 37 test names occur in the README; the latter includes three tests of
the elementary Witt theorems in addition to the 34 definition/construction
tests counted by the packet checker. No target was removed or newly planned.

Checked the 83 direct exact supplier nodes underlying 87 references, the four
stage-level supplier contracts, the relevant ownership/link entries and the
Q-layer library audit. These checks cover the interfaces consumed here, not
every statement in the supplying roadmaps or a whole-atlas dependency audit.
The generic prism, animation, cotangent, derived completion, almost module,
Tate-pair and closed-immersion objects retain their existing owners. Q3 applies
`PR.2/quasisyntomic-covers-lift-to-prisms`; Q4 compares its integral construction
with P4's universal analytic object. The two Part II directions and P7 towers
stay outside the proof dependencies of this package.

One mathematical clarification was necessary in Q1, and is now in both the
README and the supplier comment in Suggested.lean:

- Differential forms are p-completed. The twist here is tensoring an A/I-module
  with powers of the invertible module I/I², using dual powers for negative
  indices. Constructing the prism's Breuil–Kisin twists is a different PR.3
  interface. This corrects the earlier imprecise description of the twist.
- Crystalline comparison uses a crystalline prism (A,(p)), a PD ideal J
  containing p and a smooth A/J-algebra T. The prismatic argument is the
  Frobenius-induced base change T ⊗_(A/J,ψ) A/p, not the untwisted T.
- The PR.1 de Rham comparison requires W(A/I) to be p-torsion-free and uses
  derived p-completed base change along Frobenius. Its extension without that
  torsion hypothesis belongs to PR.3. The README now supplies explicit
  Construction 4.9 and Theorems 5.2, 6.3–6.4 locators.

These corrections state the exact accepted supplier contracts; they add no
unsupported comparison theorem. Other sensitive hypotheses and conclusions
were retained:

- The BMS2 integral predicate allows p-torsion and the zero ring. The BMS1
  pseudouniformizer convention and the torsion-free Česnavičius convention are
  distinguished rather than silently identified by divisibility alone.
- The principal Fontaine criterion imposes regularity of the pseudouniformizer
  only in its converse. Witt coordinate one is distinguished from the
  corresponding Teichmüller digit. The elementary Witt divisibility argument
  is compatible with the bounded-torsion conclusion.
- Relative completed cotangent vanishing is separate from the absolute shifted
  rank-one result; a generator choice trivializes the latter. The torsion-free
  quotient decomposition keeps both reduced special fibres. Root-stable
  quotients keep the full ideal-power condition, and products allow the empty
  index set.
- Semiperfectoidness includes derived p-completeness, witnessed in the
  prototype by the actual countable-product difference operator, as well as a
  surjective perfectoid presentation. Initial prisms quantify over all prisms.
  The PR.2 discreteness hypothesis is on the Hodge–Tate reduction; weak
  initiality and an idempotent retract are not promoted to automatic initiality.
- Complete flat descent and the completed-colimit/kernel calculation remain
  distinct proof obligations. Neither BS Proposition 8.5 nor later arc descent
  is used to prove the earlier surjectivity theorem.
- André's integral theorem is actually p-completely faithfully flat and the
  stated ind-syntomic refinement is modulo p. Bhatt's fixed-field route is
  almost faithfully flat modulo the specified root ideal; its raw completed
  colimit requires almost-elements saturation. Monic root assertions require
  positive degree and do not require the resulting ring to be a domain.
- The analytic ideal may be nonclosed and infinitely generated. The construction
  retains the completed integral model, localization, minimal open integrally
  closed plus ring and continuous universal property. Almost surjectivity is
  in the direction ambient-plus to quotient-plus.

## 3. Own words and sources

Read the mathematical exposition and checked its locators against the accepted
plan and targeted fresh readings. No source passage or section-by-section
source summary occurs in the package. A 16-word consecutive-match scan against
all eleven downloaded source texts found only bibliographic author/title
matches; the prose was also inspected directly. The added Q1 paragraph states
the mathematics in the reviewer's own words.

All eleven freshly downloaded public PDFs match the accepted plan's SHA256
receipts. The table records targeted fresh reading, not a claim to have reread
all these papers. Generic results outside those readings were checked through
the exact supplier contracts. The library index was consulted; no restricted
book or uncleared copy was used. No source PDF or extracted passage is submitted.

| Source version | Fresh reading relevant to this review |
| --- | --- |
| [Bhatt–Scholze, arXiv:1905.08229v4](https://arxiv.org/pdf/1905.08229v4) | Lemma 3.9 and Theorem 3.10, pp.31–32; Lemma 4.8 and Construction 4.9, pp.38–39; Theorem 5.2 statement, p.45; Theorems 6.3–6.4, pp.52–54; §7, pp.55–62, including the initial prism, derived comparison, covers, André argument and surjectivity proof. No full fresh reading of §§4–6 is claimed. |
| [BMS1, arXiv:1602.03148v3](https://arxiv.org/pdf/1602.03148v3) | §3, pp.19–24, including Definition 3.5 and Lemmas 3.9–3.14; Lemmas 3.20–3.21, pp.26–27. |
| [BMS2, arXiv:1802.03261v2](https://arxiv.org/pdf/1802.03261v2) | Definitions 4.18, 4.20 and Proposition 4.19, pp.21–23; the bounded-torsion proof is on p.23. |
| [Published BMS2](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf) | Proposition 4.19(3), printed p.227, PDF p.29; checked against the preprint's elementary Witt argument. |
| [Česnavičius–Scholze, arXiv:1912.10932v3](https://arxiv.org/pdf/1912.10932v3) | §§2.1.2–2.1.11, pp.11–17: torsion removal, both reduced fibres, p-integral closure and all five completed ring operations. |
| [Česnavičius, arXiv:1711.06456v4](https://arxiv.org/pdf/1711.06456v4) | §§4.2–4.8, pp.7–9; 4.4 is a Remark, correctly identified in the README. |
| [Anschütz–Le Bras, arXiv:1907.10525v4](https://arxiv.org/pdf/1907.10525v4) | §2.1, pp.12–14, especially Proposition 2.1.8, Lemma 2.1.9 and Corollary 2.1.10. |
| [Bhatt, arXiv:1608.08882v2](https://arxiv.org/pdf/1608.08882v2) | Notation 1.4, p.3; §2.1–2.7, pp.4–5, including the saturation correction in footnote 6. |
| [Davis–Kedlaya, arXiv:1409.7530v1](https://arxiv.org/pdf/1409.7530v1) | §3, pp.5–11, including Theorem 3.2 and the relevant finite-Witt equivalences and proof implications. |
| [Bhatt's 23 April 2017 lecture notes](https://websites.umich.edu/~bhattb/teaching/mat679w17/lectures.pdf) | Theorem 9.4.3, pp.113–115; the following examples/exercise and Corollary 9.4.7 with its ω₁ iteration, pp.115–117 (PDF pp.114–118). |
| [Scholze, Etale cohomology of diamonds, 14 April 2026](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf) | Definitions 5.6–5.7, Theorem 5.8 and its following remark, pp.24–25. The README correctly reverses the erroneous plus-map direction in the remark. |

Also read Stacks [091P](https://stacks.math.columbia.edu/tag/091P), criterion
(7), [091T](https://stacks.math.columbia.edu/tag/091T),
[091U](https://stacks.math.columbia.edu/tag/091U) and
[0G3I](https://stacks.math.columbia.edu/tag/0G3I) on 9 October 2026. These
supply the ordinary-ring derived-completion criterion, separatedness
comparison, weak-Serre closure and finite sharp-ideal separation input.

The public PDF receipts are retained below so a later worker can identify the
versions without relying on this run's disposable downloads.

| Source id | SHA256 |
| --- | --- |
| `bs-prisms-2022` | `1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a` |
| `bms2-thh-2019` | `b2338ef19714f39aeac2aaaa4e8d6bd708020815016bbe5541a74e4db3594038` |
| `ecd-2026` | `4ce3d1232a6e9e186d1a36da5cc659616569ac8dd2bb263510247c07995a26c1` |
| `bms1-integral-2018` | `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a` |
| `BMS2-WITT-TORSION` | `6b43d1ff3c3f345db85100562a30c2bcbb6fcbfc2874ce899f8b4ded23ff23dd` |
| `cs24-flat-purity` | `2f9d3ee868c244a7ddd6579a5dafed10a7ac9eb8b2ffe840db9f2bc115cd6ed4` |
| `cesnavicius-purity-2019` | `a62a12bbe26595aec89d31d24d46774a1ee3eff73c08da0febf5a2b472118709` |
| `alb23-prismatic-dieudonne` | `6eb02c16c525360141b1c5d118ae04db070f3c0e9cb9fff0f1598fc889b50aec` |
| `bhatt-direct-summand-2018` | `08578ca15b17f51ee12c398ef305af3446057063c015e2bc8beb6012bcc26430` |
| `dk-witt-frobenius` | `c54d3cbe035567e4f051c6bb0c2ecd86110a1a103767049c00eed3da80c44b9d` |
| `bhatt-perfectoid-notes-2017` | `47aaf5ddc4ec5d6f5e8efd0ecb80ae2f0ef4999265d861393c4bda6670974048` |

## 4. Programme vocabulary

The README already used mathematical ownership names and boundaries without
programme bookkeeping. Suggested.lean contained target packet identifiers,
status tags, G1–G7 labels, a protocol reference, a restructuring-job reference
and references to the current issue or acquired readings. Replaced them with
mathematical headings and the actual missing construction or comparison.
The source and supplier names remain; the explanation of absent signatures
remains explicit. Moved the prescribed standard note before the imports as a
plain block comment. It still distinguishes the definitive README, suggested
signatures and placeholder proofs. The reviewer wording in this standard note
is prescribed by PROTOCOL §13 and is not a review-status announcement.

## 5. Suggested.lean and the library baseline

Read all active declarations, examples and omitted-interface comments. Checked
the 65 recorded baseline declarations directly at the pinned Mathlib commit,
including their enclosing assumptions. In particular, completion surjectivity
is not restricted to Noetherian rings or finitely generated ideals. Fontaine's
map retains nonunit-p and ordinary completeness instances. The direct
PerfectClosure and inverse PreTilt carriers are not interchanged. Existing
completion, quotient, localization, subring, Witt and perfection operations
are used rather than replaced by opaque conditions.

The mathematical Lean tokens are unchanged by this review: edits to this file
are comments only. Its 13 individual imports are all Mathlib modules. It has
71 named declarations and 33 examples. No opaque proposition placeholder or
arbitrary replacement carrier was introduced to type unavailable mathematics.

Ran the final command:

```text
lean-check research/blueprint/packages/PerfectoidQuotients/Suggested.lean
```

It exited 0 with **0 errors and 91 warnings, all `declaration uses sorry`**.
The Mathlib commit used by the shared build is exactly
`082e2d37e8b0463410cdb532e111cd43d5a66174`. The shared Tau Ceti checkout is
newer than the plan's `f790474821cf4256814db967cb154e7af3d0c369`, but this
file imports no Tau Ceti modules. Thus all imported mathematics was checked
at its exact pin; no claim is made about elaborating a Tau Ceti import at its
historical pin. No language server, library build, update or cache download
was started.

The accepted inventory is preserved: 26 targets fully typed, 10 partly typed,
20 stated only in omission comments and 5 supplier applications. Of the 42 API
items, 25 are typed and 17 remain comments. Of the 37 planned tests, 24 are
examples and 13 remain comments: initial prism (4), analytic closed quotient
(5) and Bhatt root extension (4). Nine further examples give 33 in total.
Comments do not count as elaborated declarations. The ten partial signatures
retain exactly the limitations described in the accepted inventory, including
normalization, finite Witt maps, tilt/completion transport and the initial-prism
formula for the typed ring-valued universal perfectoidization.

Acceptance applies PROTOCOL §§13 and 20: the suggested file is nonexhaustive,
the README is definitive, and unavailable conditions are left explicit rather
than fabricated. The declarations that are present match the stated targets
or the documented special cases. The successful Lean run checks these types;
it neither proves them nor makes the omitted statements formalized. These
limitations do not represent uncompleted work on the independent package review.

## 6. Metadata and final checks

`metadata.toml` is exactly the single line `topic = "math.AG"`, appropriate for
the algebraic geometry and prismatic applications. No metadata edit was needed.

Ran `python3 scripts/check_blueprint.py research/blueprint/packets/PerfectoidQuotients.json`:
**0 errors, 0 warnings**, with 61 nodes, 42 API items, 34 definition/construction
tests, 65 baseline declarations, seven stages planned and none closed.
The additional three theorem tests account for the 37-test total above.
The README/name cross-check, metadata parse, file-size limit, unchanged
mathematical Lean token check, allowed-path check and `git diff --check` pass.
The accepted packet, older reader, original suggested file, suppliers and atlas
data were not modified. The only mathematical exposition correction is the
explicit Q1 supplier hypothesis clarification; the other edits remove process
comments and move the standard note.

## Complete target crosswalk

Each row was checked against the accepted statement and hypotheses, not merely
against its name. Layer and suffix identify `PerfectoidQuotients:<layer>/<suffix>`.
The subsection labels are the README's mathematical groupings. `Full` means
all target clauses have types, `partial` means only the documented clauses do,
`comment` means no target signature, and `supplier` means application of an
existing owner's interface. All proofs remain placeholders.

| Layer / target suffix | README subsection | Suggested form |
| --- | --- | --- |
| `Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings` | Integral rings, units and characteristic p | full |
| `Q0:integral-algebra/integral-perfectoid-nontrivial-criterion` | Integral rings, units and characteristic p | full |
| `Q0:integral-algebra/inverse-perfection-unit-criterion` | Integral rings, units and characteristic p | full |
| `Q0:integral-algebra/perfect-witt-unit-criterion` | Integral rings, units and characteristic p | full |
| `Q0:integral-algebra/witt-product-first-coordinate` | Integral rings, units and characteristic p | full |
| `Q0:integral-algebra/theta-kernel-characteristic-p` | Integral rings, units and characteristic p | full |
| `Q0:integral-algebra/tilt-projection-injective-characteristic-p` | Integral rings, units and characteristic p | full |
| `Q0:integral-algebra/characteristic-p-perfectoid-criterion` | Integral rings, units and characteristic p | full |
| `Q0:integral-algebra/untilt-naturality` | Naturality, normalization and Fontaine generators | full |
| `Q0:integral-algebra/theta-naturality` | Naturality, normalization and Fontaine generators | full |
| `Q0:integral-algebra/integral-perfectoid-ring-equivalence` | Naturality, normalization and Fontaine generators | full |
| `Q0:integral-algebra/frobenius-surjectivity-equivalences` | Naturality, normalization and Fontaine generators | comment |
| `Q0:integral-algebra/bms-perfectoid-normalization` | Naturality, normalization and Fontaine generators | comment |
| `Q0:integral-algebra/principal-theta-kernel-criterion` | Naturality, normalization and Fontaine generators | partial |
| `Q0:integral-algebra/theta-generator-unit-coordinate` | Naturality, normalization and Fontaine generators | partial |
| `Q0:integral-algebra/witt-product-p-square-detection` | Elementary Witt torsion and cotangent consequences | full |
| `Q0:integral-algebra/witt-principal-p-saturation` | Elementary Witt torsion and cotangent consequences | full |
| `Q0:integral-algebra/witt-principal-quotient-p-torsion` | Elementary Witt torsion and cotangent consequences | full |
| `Q0:integral-algebra/perfectoid-bounded-p-torsion` | Elementary Witt torsion and cotangent consequences | partial |
| `Q0:integral-algebra/perfectoid-cotangent-vanishing` | Elementary Witt torsion and cotangent consequences | comment |
| `Q0:integral-algebra/perfectoid-rings-reduced` | Reducedness, torsion removal and compatible roots | full |
| `Q0:integral-algebra/torsion-free-perfectoid-quotient` | Reducedness, torsion removal and compatible roots | partial |
| `Q0:integral-algebra/compatible-roots-and-iterated-frobenius` | Reducedness, torsion removal and compatible roots | partial |
| `Q0:integral-algebra/p-integral-closure` | p-integral closure and perfectoid completion | full |
| `Q0:integral-algebra/p-integral-closedness-criterion` | p-integral closure and perfectoid completion | partial |
| `Q0:integral-algebra/completed-p-integral-closure-perfectoid` | p-integral closure and perfectoid completion | full |
| `Q0:integral-algebra/completely-etale-and-henselian-perfectoid` | Ring operations and their tilts | comment |
| `Q0:integral-algebra/completed-root-polynomial-algebras` | Ring operations and their tilts | comment |
| `Q0:integral-algebra/completed-perfectoid-tensor-products` | Ring operations and their tilts | comment |
| `Q0:integral-algebra/completed-root-stable-quotients` | Ring operations and their tilts | partial |
| `Q0:integral-algebra/products-of-perfectoid-rings` | Ring operations and their tilts | partial |
| `Q0:integral-algebra/completion-along-sharp-ideal` | Ring operations and their tilts | partial |
| `Q0:integral-algebra/tate-powerbounded-model-import-contract` | Tate rings and the fixed-field integral model | supplier |
| `Q0:integral-algebra/bhatt-field-integral-model-comparison` | Tate rings and the fixed-field integral model | comment |
| `Q0:animated-application/prism-and-animation-import-contract` | Prism and animation interfaces | supplier |
| `Q1/smooth-prismatic-hodge-tate-reexport` | Smooth prismatic cohomology and Hodge–Tate comparison | supplier |
| `Q2/semiperfectoid-rings` | Semiperfectoid rings and the initial prism | full |
| `Q2/initial-prism-of-a-semiperfectoid-ring` | Semiperfectoid rings and the initial prism | comment |
| `Q2/universal-perfectoidization` | The perfectoidization functor | partial |
| `Q2/derived-prismatic-initiality-import-contract` | Derived comparison and the two descent calculations | supplier |
| `Q2/completed-perfectoidization-base-change` | Derived comparison and the two descent calculations | comment |
| `Q2/perfectoidization-completed-colimits` | Derived comparison and the two descent calculations | comment |
| `Q3/lifting-quasisyntomic-covers-to-prisms` | Quasisyntomic lifting and the two perfection covers | supplier |
| `Q3/relative-perfectoid-cover-of-smooth-site` | Quasisyntomic lifting and the two perfection covers | comment |
| `Q3/frobenius-flat-prism-perfection-cover` | Quasisyntomic lifting and the two perfection covers | comment |
| `Q3/andre-flatness-lemma` | André's flatness lemma and its modulo-p refinement | comment |
| `Q3/andre-ind-syntomic-mod-p` | André's flatness lemma and its modulo-p refinement | comment |
| `Q3/bhatt-rational-root-neighborhoods` | Rational root neighborhoods and the saturated root extension | comment |
| `Q3/bhatt-perfectoid-root-extension` | Rational root neighborhoods and the saturated root extension | comment |
| `Q3/bhatt-root-extension-almost-flat` | Almost flatness and functorial monic-root iteration | comment |
| `Q3/functorial-almost-absolutely-integrally-closed-extension` | Almost flatness and functorial monic-root iteration | comment |
| `Q4/quotient-frobenius-surjective` | Characteristic-p quotients and radicals | full |
| `Q4/perfect-quotient-radical-criterion` | Characteristic-p quotients and radicals | full |
| `Q4/radical-quotient-integral-perfectoid` | Characteristic-p quotients and radicals | full |
| `Q4/characteristic-p-perfectoidization-universal` | Characteristic-p quotients and radicals | full |
| `Q4/compatible-root-ideal-radical` | Characteristic-p quotients and radicals | full |
| `Q4/integral-perfectoid-quotient-radical-criterion` | Characteristic-p quotients and radicals | full |
| `Q4/surjectivity-of-perfectoidization` | The principal calculation and general surjectivity | full |
| `Q4/principal-root-quotient-perfectoidization` | The principal calculation and general surjectivity | full |
| `Q4/completed-integral-closed-quotient` | Integral models of the analytic closed quotient | comment |
| `Q4/zariski-closed-subsets-are-strongly-zariski-closed` | Integral models of the analytic closed quotient | comment |

## Artifact identities

Hashes identify the corrected package and unchanged accepted plan checked in
this run. Source receipts above identify readings independently of scratch paths.

| Artifact | SHA256 |
| --- | --- |
| Accepted packet | `570bbfa78c085e4bcc23095096cce1dc1301f5e526cf1ba74320345bdc232903` |
| Corrected README | `5f25e6b43ee957c01fb507531dc2d70acd093a415a1e65b03d706342fe11b35a` |
| Corrected Suggested.lean | `76a6ffbc3d99801d531f430c8da549d8e376e56fb50620a969c9574182f0eb56` |
