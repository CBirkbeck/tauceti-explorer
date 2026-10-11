# Genus-one Part II: revision 2 handoff

Job `DESIGN-NeronModelsAndSemistableAbelianVarietiesPartII~2`, issue #6379.
Agent: Codex, session `codex-koSr46`, 11 October 2026.
**The target-level revision is complete; the packet status is `complete`.**
G.0–G.6 are all `planned`, with their precise proof obligations retained. None
is `closed`, and every implementation status remains `unchecked`.

The five issue deliverables contain the revised plan. The mathematical contracts
and source locators are in the [packet](../packets/NeronModelsAndSemistableAbelianVarietiesPartII.json);
the [reader](../readmes/NeronModelsAndSemistableAbelianVarietiesPartII.md) presents
them by target. The [suggested file](../suggested/NeronModelsAndSemistableAbelianVarietiesPartII.lean)
uses the native objects available at the pinned build and explicitly lists the
full geometric types it cannot yet express.

## What this round resolves

The independent review identified two reasons for returning the design:
proof-step granularity and comparison tests that did not determine the actual
maps. This revision addresses both.

The 776-node plan becomes 168 targets: 12 definitions, 43 constructions,
79 lemmas, 28 theorems and 6 comparisons. All theorem and planet IDs are
retained, including the reusable conductor reconstruction, localization,
all-open section pullback, additive sheaf ShortExact, categorical Scheme descent
and flat-conductor comparison targets. The fourteen resolved-model targets remain
separate. There are 723 API contracts in total, of which 661 belong to definitions
and constructions; 483 test references in total, of which 442 belong to those
two kinds; 29 planets; and 546 baseline declarations. Counts are references,
not a count of distinct proved examples.

The other 608 IDs resolve through `revision.consolidatedIds`, which gives the
retained target and API name. Every migrated contract preserves its statement,
hypotheses, source match, proof outline and rewired prerequisites. The
coordinate, inverse, projection, restriction and reconstruction-law families
are owner APIs rather than independent targets. This includes the finite and
infinity chart round trips, relative and absolute normalization section laws,
generic-germ transport, conductor sheaf projections, and two-step flat tower
comparisons. Eighteen inherited short API statements are replaced by the more
precise full contracts already present in the old nodes. Six API entries also
retain their full hypothesis/source/proof metadata instead of just the short
statement.

Core construction prerequisites give an acyclic target graph. An API lemma
records its own proof inputs, including its owner and subsequent owner API laws;
these are not imposed as inputs to the definition of that owner. All 78 routed
source items and all 23 supplier requests retain their scope and now point to
the retained owners. No other packet, reserved ID or atlas/application file is
changed. No target is moved to another roadmap in this round.

Ten native comparison examples supplement the inherited generic laws:

| Owner | Discriminating examples |
| --- | --- |
| G.1/global-normalization-chart | Actual Spec pullback of q and tq for the cusp; the nonsplit F₂ quadratic; the two split rational branch points; recovery of t as tq/q on the actual cusp principal open. The existing overlap comparisons remain. |
| G.1/relative-normalization-sections-iso | Inclusion after the comparison equals the actual map to relative normalization; actual coefficient action in the nonsplit F₂ case; compatibility with restriction to a proper principal open. |
| G.1/normalization-function-field-map | Actual chart generic germs of q and tq for the cusp and nonsplit F₂ quadratic; the common infinity coordinate u in the split rational case. |

These examples use the native section maps, open-immersion section
isomorphisms, restrictions and germs. They do not assume their tested coordinate
equalities. The function-field examples require the nonempty chart instances as
internal proof obligations. The relative-normalization restriction test assumes
only that the chosen principal open is proper. Finiteness, inverse identities
and preservation of zero and one remain supplementary tests.

The suggested normalization chart is the actual Spec inclusion A_q→k[t].
The relative normalization, map to it and map from it use Mathlib's native
normalization objects. The native coefficient and restriction interfaces are
explicit prerequisites of the comparison target. Three affine API signatures
also express the tensor/pushout comparison, complement localization and finite
projection using the actual ring pullback. Existing common-ideal API names are
aligned with their suggested declarations.

## Accepted corrections retained

The previous review object is unchanged. Its 776 checks describe the input
version and do not certify this revision; the next reviewer replaces that
historical ledger. The independent source-finding judgments are also preserved:
all 27 retain their individual `confirmed` verdicts.

The following corrections remain in the roadmap and contracts:

- The surface classification and its G.4 consumers assume at most one rational
  base point whose fiber is semistable or smooth supersingular.
- Models 2 and 14 have one degree-two closed bad point, giving two conjugate
  geometric I₁ fibers and no rational bad base point there.
- The canonical-degree source is Bombieri–Mumford Theorem 2(iv), printed p.27,
  with its proof on p.29.
- The finite-map criterion supplies integrality. The separate native instance
  for an integral morphism makes its map to relative normalization an
  isomorphism.
- The six redundant SF.0 stage edges removed by the review remain removed.
  The exact planned flat-annihilator, ideal-comap-top and ideal-restrict-top
  exports remain imports, with their generality checked again.

All excerpt fields have been removed. Source assertions and baseline `provides`
descriptions are authored mathematical prose, rather than source passages or
Lean declaration headers. The classification correction distinguishes the
fourteen required candidates from the certificate needed to prove completeness
and pairwise inequivalence. Its bounded counterexamples and inherited source
judgments do not establish that certificate.

## Validation

The canonical suggested file elaborates with `lean-check` at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. It finishes with zero errors and 1,116 warnings, all concerning placeholder
proofs. The checks validate signatures and example types, not proofs or the full
geometric conditions listed in the omission ledger. In particular, a partial
native model structure is not the full genus-one fibration definition.

`python3 scripts/check_blueprint.py` reports zero errors and zero warnings.
Additional integrity checks account for every input ID, compare every migrated
mathematical contract against its input, preserve the historical review,
baseline identity/provenance, source judgments, route items and request scopes,
and check the acyclic target graph. Every definition and construction has an API,
recorded consumers and at least three examples. Every proposed contract name is
represented by a name or short name in the suggested file or its omission
ledger. `git diff --check` passes.

Fresh finite calculations reproduce the five binary-equation orbits and the
fourteen displayed invariant calculations. The reproducible calculation is:

1. Enumerate the 32 tuples (a₁,a₂,a₃,a₄,a₆) in F₂⁵ and the eight triples
   (r,s,t) in F₂³. Transport points by (x,y)↦(x+r,y+sx+t). Apply the native
   characteristic-two change formulas and check the equation on all four
   affine pairs: 1,024 transport checks. Verify the sixteen smooth witness rows
   against the five recorded representatives. The disjoint orbit sizes are
   2,4,4,4,2 and projective point counts are 1,2,3,4,5.
2. Treat bit j of each `modelData` coefficient mask as the coefficient of tʲ.
   Polynomial addition is XOR and multiplication is the ordinary convolution
   modulo two. Compute b₂=a₁², b₄=a₁a₃, b₆=a₃²,
   b₈=a₁²a₆+a₁a₃a₄+a₂a₃²+a₄², and
   Δ=b₂²b₈+b₆²+b₂b₄b₆. The fourteen Δ masks, in model order, are
   256,7168,1024,1024,2048,2048,4096,16,256,256,256,1024,2048,1792.
3. Reverse each aᵢ with weight i and compare the recomputed discriminant with
   the weight-12 reversal of Δ. Check every coefficient degree bound and
   directly count the smooth equation fibers at t=1.

The characteristic-two coefficient changes used in the first check are:
a₁′=a₁; a₂′=a₂+sa₁+r+s²; a₃′=a₃+ra₁;
a₄′=a₄+sa₃+(t+rs)a₁+r²; and
a₆′=a₆+ra₄+r²a₂+r³+ta₃+t²+rta₁.
These are mathematical calculation recipes, not copied source code.
The point-group addition cycles were not rerun in this round. Neither these
calculations nor the earlier attributed computation supplies all-place
minimality, regular resolution, rationality, Picard constancy, the full 2¹⁸
surface search, the 512×PGL₂ orbit action, or exhaustive rejection witnesses.

## Existing-owner and source checks

The reviewed R11 audit and the existing StableReduction and EllipticCurves
contracts remain the starting point. The current overlap screen uses upstream
main `070dc2becd74419e76303ede84b465ed4a69461f` and current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The relevant StableReduction and
EllipticCurves interfaces were read; all nine post-snapshot roadmap suggested
files, including nested OperatorTheory files, and the current library were
searched for the conductor, Ferrand, quadratic-pinching and genus-one targets.
This target-specific screen found no matching implementation or new roadmap
target. It is not a library-wide absence proof. IntegralLattices' abstract
lattice material, regular models, dual graphs, equation-side reduction and
point-count APIs remain imports.

The earlier independent review inspected all 546 baseline statements. This
round rechecked the native Spec, scheme section/restriction, relative
normalization, open-immersion and generic-stalk interfaces used by the new
examples. The 124 native interfaces whose inherited baseline descriptions
contained Lean headers were read again in their recorded pinned modules and
paraphrased with operative hypotheses. The revision does not claim that the
remaining baseline or source reading was newly repeated.

Fresh public-source reading is bounded to:

- [Schröer, public v3](https://arxiv.org/pdf/2004.07025v3): §3, printed
  pp.9–11; §10 hypotheses, printed pp.27–28; Theorem 10.4, printed p.29.
- [Temkin–Tyomkin, public v3](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf):
  Theorem 5.3.1 and its displayed proof on printed pp.15–16; Theorem 6.2.1
  and its proof on printed p.17. Finite algebraic-space pinching does not
  require the scheme affine-neighborhood criterion, Noetherianity or
  quasi-separatedness.
- [Bombieri–Mumford, public scanned original](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1976d--EnrClass-II-NC.pdf):
  Theorem 2(iv), printed p.27, and its proof on p.29, checked in parsed text.
- Stacks [0ET0](https://stacks.math.columbia.edu/tag/0ET0), statement and
  proof, and the finite flat-annihilator context at
  [07T8](https://stacks.math.columbia.edu/tag/07T8).

Ferrand, Witaszek, LLR and its corrigendum, Szydlo, Serge Lang,
Cossec–Dolgachev–Liedtke and the other Stacks source-finding checks retain their
named prior-design and independent-review attribution. No new exhaustive
erratum search, published-persistence check or private book reading is claimed.
Original EGA/Raynaud adapter proofs, the rational-surface proof, general Tsen,
recursive quasielliptic sources and William Lang (2000) are not source-closed
here. A subsequent worker needing a cleared private source must read the
maintainer's indexed copy in place and record results in their own words.

## Required follow-up boundaries

The 17 gap records and 23 exact request scopes in the packet determine the
remaining work. The stage frontiers are:

| Stage | Targets | Required closure |
| --- | ---: | --- |
| G.0 | 41 | Integrate the SF.1 algebraic-space carrier and descent/quotient/lifting/representability exports, SF.3 flat patching, scheme affine-neighborhood comparison, and three-step closed-subscheme/conductor-map coherence with transport of the full geometric-pushout predicate. |
| G.1 | 62 | Identify the glued source with native P¹ and the curve with the specified Proj cubic; properness/projectivity; specialize the conductor sheaf sequence and E/k defect to derive H⁰/H¹ and genus; construct the separate I₂ scheme; provide finite-extension geometric adapters, numerical-Picard/component descent, general Lang/P¹ forms, quasielliptic inputs, and the pointed-curve-to-Weierstrass scheme adapter. |
| G.2 | 11 | Read and close the EGA/Raynaud horizontal-divisor and (N)* adapters, LLR recursive Lie/Picard/conductor/period-index inputs, and the excellent-DVR henselization/model-preservation adapter. LLR's algebraically closed residue-field hypothesis is required. |
| G.3 | 18 | Close canonical-bundle duality/cohomology and Raynaud multiplicity/order inputs; supply the rational-surface minimal-model/blowup proof, regular non-smooth quasielliptic compactification and Picard/group comparisons, and general Tsen ownership/proof. |
| G.4 | 13 | Supply the required William Lang (2000) configurations or certified independent replacements and exact owner exports. |
| G.5 | 17 | Give every candidate an all-place minimality, splitting, regular-resolution, rationality, relative-minimality and resolved-surface count certificate, with the equation-algorithm-to-scheme adapter. |
| G.6 | 6 | Certify the full enumeration, mathematical rejection witnesses, admissible transformation/PGL₂ action, surviving geometric certificates and pairwise inequivalence, or fully decompose a sufficient configuration source. Both classification targets retain these dependencies. |

Supplier ownership is unchanged. SF.0 owns generic quotient/tensor/localization,
flat-annihilator and henselian algebra inputs; SF.1 owns general space and
scheme descent; SF.3 owns generic Proj/P¹, coherent and Weierstrass scheme
interfaces; SF.4–SF.6 and the moduli/Picard owners supply duality, intersections,
Picard and contraction geometry. StableReduction supplies its nodes, coherent
smooth-curve theory, intersections and smooth-generic regular models; its Layer
5 does not supply non-smooth quasielliptic generic models. EllipticCurves supplies
its isogeny, finite-field and equation-side local reduction APIs; these do not
substitute for the requested arbitrary pointed scheme presentation or resolved
surface comparison. R11 supplies the named local Jacobian/LLR inputs, and
WeilConjectures supplies the cycle-class/Frobenius point-count bridge.

A fresh independent review must check the target/API consolidation and the
native comparison examples, while recognizing the unchanged historical review
as the preceding version. The recorded proof gaps are required mathematical
work, and elaboration is not grounds to mark any stage closed.
