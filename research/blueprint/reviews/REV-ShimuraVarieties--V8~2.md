# REV-ShimuraVarieties--V8~2: independent review

**Verdict: accepted.** The revision resolves the previous reader blocker. The
corrected packet is a complete target-level planning pass for V8 and V8.general;
both stages remain `planned`, with seven explicit gaps and every implementation
status `unchecked`.

Reviewer: Codex, session `codex-9Nf2HQ`. Date: 2026-10-08.
Issue: [#7093](https://github.com/CBirkbeck/tauceti-explorer/issues/7093).
This session wrote neither BP-ShimuraVarieties--V8 nor its revision.
The reviewed revision is [PR #7386](https://github.com/CBirkbeck/tauceti-explorer/pull/7386),
from [#7011](https://github.com/CBirkbeck/tauceti-explorer/issues/7011), by Codex
session `codex-Fq5w0M`. I read the [previous independent review](REV-ShimuraVarieties--V8.md)
and the [revision handoff](../handoff/BP-ShimuraVarieties--V8~2.md), then checked
the mathematics, baseline, suppliers and reader independently.

The reviewed files are the [packet](../packets/ShimuraVarieties--V8.json),
[suggested Lean file](../suggested/ShimuraVarieties--V8.lean) and
[reader](../readmes/ShimuraVarieties--V8.md). The packet's `review.checked`
records a verdict and reason for each of the 26 nodes: 19 verified, seven
corrected. No node was added or removed in this round.

## Counts and coverage

| Item | Result |
| --- | ---: |
| Nodes | 26: 13 theorems, 3 constructions, 8 comparisons, 2 applications |
| Construction API entries | 16 |
| Unit-test contracts | 15 |
| Baseline declarations | 12, all retained and confirmed |
| Supplier requests | 25 |
| Gaps | 7 |
| Planets | 7: six in V8, one in V8.general |
| Source issues | 10 confirmed: nine retained, E10 added |
| Stages | 2 planned, 0 closed |

The scoped targets are represented: reflex-field level maps and Hecke
correspondences, datum functoriality, abelian-type specialization, the GL2
modular and component comparisons, arithmetic minimal compactifications and
their maps, and the general-data specialization. Prerequisite chains terminate
in baseline declarations, named supplier nodes or requested stages, or explicit
gaps. The local prerequisite graph is acyclic. The general suffix reuses the
conditional V8 arguments; the abelian instance has no local path to V7.
Acceptance follows the protocol's definition of a finished planning pass,
including its precise remaining-work lists.

## Corrections made in this review

All changes below also appear in the reader. Suggested-file changes are comments
clarifying the congruence kernel and the separate auxiliary-model assumption.

| Node or record | Correction and evidence |
| --- | --- |
| `disjoint-special-reflex-fields` | Distinguished the two incidence maps in Deligne 5.1–5.1.2, pp.153–154. The regular-semisimple map W → V is finite étale; the map W → Spec E has geometrically irreducible fibres. The latter is not the finite étale cover. Narrowed the R09.2 request to cocharacters in the chosen datum conjugacy class; the entire relative cocharacter Hom scheme need not be finite. |
| `datum-functoriality` | Made the determinant acceptance check refer to the strict one-point torus target, whose principal-level model is the maximal-real cyclotomic quotient. The separate two-point-domain component target remains μ_N^prim. Milne, pp.62–63 and formula (64), p.119, distinguish these targets. |
| `zero-dimensional-shimura-variety` | Replaced the additive expression 1 + N Zhat by the kernel of reduction on Zhat units, with N positive, in the statement, acceptance and test. The additive expression includes nonunits at primes not dividing N. The corrected compact open gives the finite quotient used in Milne's GL2 example, p.63. |
| `abelian-instance` | Recorded both corrected source references on Milne p.127: 14.15 supplies the connected-to-full step (E9); the quotient following 14.16(b) starts from the G1 variety (new E10). Both defects also occur in the published 2005 version, p.356. The V6 specialization and its dependencies are unchanged. |
| `codim-one-extension` | Replaced an insufficient uniqueness argument from normality and a common dense open. The specified complex comparison gives the isomorphism between models of the same partial compactification; conjugate maps agree on the dense open, and descent of the map and its inverse proves uniqueness. Pink 12.6, p.198, and 12.10, pp.200–201. |
| `minimal-descent` | Applied the same corrected uniqueness argument to models of the specified complex Baily–Borel compactification. This avoids claiming that arbitrary normal compactifications of a fixed open are isomorphic. Pink 12.6 and 12.12, pp.198 and 202. |
| `general-minimal` | Stated explicitly that V7 supplies strict pure-datum models, while any auxiliary domains in Pink's broader category require their own actual models. V7's strict existence theorem alone does not supply a domain mapping non-injectively to the homomorphism space. Pink 12.10, pp.200–201; the two-point torus case is already constructed here. Updated the general-stage remaining list accordingly. |
| Auxiliary-class gap | Extended the broader-auxiliary caveat to the general lane and separated the algebraic logarithmic line from V2's missing logarithmic-section embedding interface. The latter remains its own gap, supported by Pink 8.2 and 12.12, pp.132–133 and 202. |
| Source records and reader | Replaced inherited reviewer reasons with independently checked paraphrases and dated searches, added the published 2005 version and E10, and updated the source reading records. Fixed reader rendering of scalar `affects` values, which previously split each effect into individual characters. The reader links this accepted round's report. |

The previous review's substantive corrections remain intact: target neatness for
étaleness; the source reflex field for datum maps; row-basis right action; fine
full level N ≥ 3 and Gamma1 level N ≥ 4; coarse Gamma0 including N = 2 via PR81
9D; and the prime-only range of Layer 10. The obsolete torus-torsor gap and C2
restructuring proposal remain withdrawn. The three previously added nodes were
checked directly against their sources and suppliers, rather than accepted from
the earlier verdict alone.

## Sources and source findings

The five public PDF hashes reproduce the packet's `sourceVersions` records.
Checked passages include:

- Milne, [Introduction to Shimura Varieties, 2017 author copy](https://www.jmilne.org/math/xnotes/svi.pdf):
  the component and zero-dimensional formulas, pp.57–63; 5.29–5.30,
  pp.65–66; 6.3 and 6.11, pp.70–74; canonical-model definitions and laws,
  pp.111–119; and 14.12–14.16, pp.125–127.
- Milne, [published 2005 version](https://www.jmilne.org/math/xnotes/svi2005.pdf),
  Clay Mathematics Proceedings 4, pp.265–378: Proposition 14.16 and its following
  paragraphs, p.356, for E9 and E10.
- Milne, [Modular Functions and Modular Forms v1.31](https://www.jmilne.org/math/CourseNotes/MF.pdf):
  8.3–8.9, pp.98–100.
- Pink, [Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf):
  8.1–8.4, pp.131–133; 10.9, p.175; 10.20–10.22, pp.183–185;
  11.16, p.194; and 12.3–12.13, pp.197–203.
- Deligne, [Travaux de Shimura, Bourbaki exposé 389](https://www.numdam.org/item/SB_1970-1971__13__123_0.pdf):
  5.1–5.4, pp.153–156, including page-image inspection of pp.154–155.

For the 2017 SVI PDF, PDF and printed pages agree. Pink's PDF page is printed
page plus one; Deligne's is printed page minus 121. Statements and checks in
the deliverables are in our own words. No source passage or PDF is included.

| Finding | Independent check |
| --- | --- |
| E1, MF 8.9, p.100 | The Legendre discriminant is 16 λ²(1−λ)², so the coarse parameter line excludes 0 and 1. The automorphism [-1] preserves level two, and quadratic twists obstruct the asserted universal family. Confirmed. |
| E2, MF 8.7, p.100 | The displayed lattice generators yield a fixed reference pairing root. An arbitrary primitive root requires scaling the first generator by the corresponding unit. Confirmed. |
| E3, SVI 6.3, p.71 | The comparison map must go from the fixed rational vector space W to V, and similarly to V′, for the stated inverse-composite construction to type correctly. Confirmed; the official p.70 notation corrections do not fix these arrows. |
| E4, SVI 5.29(a), p.65 | For K contained in K′, forgetting the finer level gives S_K → S_K′. The printed arrow goes the other way. Confirmed and already listed by Jungin Lee. |
| E5, SVI p.114 | The norm lands in a multiplicative torus, so evaluation requires a product over embeddings. The special-point formula uses embeddings of E(x), the field defining its cocharacter. Confirmed; already corrected in the official lists. |
| E6, Deligne 5.1.3, p.155 | The specialization needs a nonempty real open and finite F. With F algebraically closed, the connected degree-two cover s² = t never has the required inert F-point. Confirmed; the main theorem uses finite F. |
| E7, Deligne 5.1.2(b), p.154 | The maximal tori belong to the ambient reductive group G_C. The printed multiplicative-group ambient symbol is inconsistent with the incidence construction. Confirmed. |
| E8, Deligne pp.154–155 | The lemma label is 5.1.3, and the geometric irreducibility used in its proof is its own hypothesis. The cited 4.12 is an unrelated moduli result. Confirmed. |
| E9, SVI p.127; published p.356 | The final passage from connected to full abelian-type varieties uses 14.15. Proposition 14.16 concerns connected varieties. Confirmed. |
| E10, SVI p.127; published p.356 | The paragraph after 14.16(b) repeats the target index in the quotient input. The kernel of the first congruence completion's map acts on the source G1 tower, whose canonical model is the hypothesis; quotienting it gives the G2 model. Confirmed new misprint, with no change to the intended proposition. |

I rechecked the [official SVI errata](https://www.jmilne.org/math/xnotes/errata.html),
[Jungin Lee's list](https://www.jmilne.org/math/xnotes/SV_errata.pdf), and
[Course Notes errata](https://www.jmilne.org/math/CourseNotes/errata.html), and
bounded searches for the unlisted findings, including E10. No applicable
published correction to E10 was found. The packet retains the dated searches
and separates already-known corrections from findings marked new.

## Baseline, APIs and ownership

All twelve baseline entries were checked in the actual Mathlib source at
`082e2d37e8b0463410cdb532e111cd43d5a66174`. None needed removal or replacement.
The relevant declaration locations and the interfaces they provide are:

| Declaration | Mathlib module and line | Verified role |
| --- | --- | --- |
| `AlgebraicGeometry.Scheme` | AlgebraicGeometry/Scheme, 42 | Native scheme carrier and category |
| `CategoryTheory.Over` | CategoryTheory/Comma/Over/Basic, 39 | Slice category over the base scheme |
| `CategoryTheory.Functor` | CategoryTheory/Functor/Basic, 40 | Objects, maps and identity/composition laws |
| `CategoryTheory.Over.pullback` | CategoryTheory/Comma/Over/Pullback, 61 | Base change when the category has the required pullbacks |
| `CategoryTheory.Over.pullbackId` | Same module, 108 | Natural comparison for identity base change |
| `CategoryTheory.Over.pullbackComp` | Same module, 112 | Natural comparison for successive base change |
| `CategoryTheory.Limits.span` | CategoryTheory/Limits/Shapes/Pullback/Cospan, 179 | Ordered native span |
| `CategoryTheory.Limits.spanCompIso` | Same module, 292 | Applying a functor to the span of its two legs |
| `AlgebraicGeometry.IsFinite` | AlgebraicGeometry/Morphisms/Finite, 40 | Finite scheme morphisms |
| `AlgebraicGeometry.IsProper` | AlgebraicGeometry/Morphisms/Proper, 42 | Proper scheme morphisms |
| `AlgebraicGeometry.IsOpenImmersion` | AlgebraicGeometry/OpenImmersion, 36 | Native open-immersion property |
| `IntermediateField.LinearDisjoint` | FieldTheory/LinearDisjoint, 157 | Linear disjointness via underlying subalgebras |

The three constructions have respectively five API entries and six tests
(tower), four and five (Hecke span), and seven and four (zero-dimensional
variety). They expose projections and laws, native base change, quotient
representatives and equality, transitions, the one-point specialization and
reciprocity. The tests discriminate identity/composition errors, swapped legs,
the level-three degree 24, two level-three components, the p+1 Hecke index,
and the strict one-point versus two-point quotient. Missing arithmetic carriers
and the finite-étale/Galois-set equivalence remain explicit supplier inputs.

I read the scoped roadmap and reviewed AUDIT-11 rows, the accepted RS-04
ownership boundary, and the HodgeStructures and ReductiveGroups upstream
documents as complete examples. Exact supplier statements checked include
ShimuraData D3–D5, ShimuraVarieties V0–V7, AA.5 and ComplexComparisonPartII.
The 25 requests were checked against R09.2/.3/.5, IG.2, R12.1–R12.6,
R13.4a/b, PEL M3–M5, C1, V1/V2/V4, ReductiveGroups Layer 7 and PR81's used
layers and conventions. They record required interfaces without asserting
that the owners already implement them.

AA.5 retains ownership of the underlying adelic quotient, R12.2 of analytic
uniformization, and M5 of the genus-one PEL comparison. V8 owns the arithmetic
comparison and pure-data arithmetic partial/minimal descent. Pink 12.10's
lifted product closure and finite-quotient construction avoid an arithmetic
torus-torsor supplier; the remaining complex and auxiliary contracts are
recorded honestly. No consuming C2.general model is imported into the local
general-minimal dependency chain. The audit's existing congruence-subgroup
ingredients are reused rather than planned again.

## Validation and remaining work

- `python3 scripts/check_blueprint.py research/blueprint/packets/ShimuraVarieties--V8.json --json`:
  exit 0, **0 errors and 0 warnings**, using the supplied declaration index.
  The twelve declarations' statements were also independently verified from
  pinned source as recorded above.
- Packet-to-reader comparison: all 26 catalogue entries, hypotheses, proofs,
  prerequisites, source matches, acceptance checks, API/test statements, requests,
  gap details, coverage remaining lists, baseline names and ten source findings
  agree. All 26 proposed node names and 16 API names occur as declarations in the
  suggested file, and its 15 named test examples match the packet.
- `lean-check research/blueprint/suggested/ShimuraVarieties--V8.lean`:
  **exit 0, no errors, 56 warnings, all `declaration uses sorry`**.
  Available memory was 111 GB. The shared build's Mathlib checkout exactly
  matches the pin. Its Tau Ceti checkout differs from the packet's f790474 pin;
  this file imports only Mathlib and cites no Tau Ceti baseline declaration.
  The result therefore validates schematic Mathlib signatures. It establishes
  no arithmetic theorem or Tau Ceti implementation.
- JSON parsing, five PDF SHA-256 comparisons, local prerequisite DAG and lane
  checks, and `git diff --check`: passed.

The schematic theorem forms are explicitly incomplete under PROTOCOL §13.
Future implementations must bind the actual supplier carriers and restore
every mathematical hypothesis before proving them. Numeric examples specify
required values for those future carriers.

No review blocker remains. For the orchestrator, subsequent planning should
refine the seven recorded interfaces: V2's complex datum-map and partial-open
functoriality; the broader auxiliary existence class in both lanes; concrete
Lean carriers; AA.5's integral-representative contract; V1's level index
category; V2's all-type logarithmic-section embedding; and V4's full-idelic
field-change reflex-norm lemma. These remain work for their named owners and
are not grounds to reopen the resolved reader revision. The withdrawn C2
restructuring should remain withdrawn.
