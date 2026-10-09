# Independent review of Parameter stacks, invariant theory and spectral coefficients, revision 2

**Verdict: accepted.** Job `REV-LanglandsParameterStacks~2`, issue #7072; Codex session `codex-BiS4GG`, 9 October 2026. The original plan was written by `codex-eWzdia` and revision 2 by `codex-iNzDyp`; this reviewer wrote neither. The prior review, revision handoff, binding protocols, library audit, supplier statements and confirmed ownership decisions were read before completing this review.

This accepts a complete **target-level planning pass**, with eight planned stages and no closed stage. It certifies the retained statements and their stated proof routes, including explicit requests where stronger supplier interfaces are missing. It does not certify implementations, completed supplier extensions or changes to external atlas edges. The five precise gaps G1–G4 and G6 remain open. The old rejection's local Chapter X and generic-anchor duplication, together with its inconsistent reader, have been corrected.

## Counts and validation

| Item | Result |
| --- | --- |
| Retained nodes | 79: 14 definitions, 11 constructions, 45 theorems, 7 comparisons, 2 lemmas |
| Independent node verdicts | 60 verified, 19 corrected; no unverifiable nodes |
| Nodes added or removed by this review | 0 / 0 |
| Existing-owner delegations | 10: eight ES2/ES3 action targets and two IHG finite-anchor targets |
| API items / tests | 140 / 90; each of the 25 definitions and constructions has at least three tests |
| Planets | 31, with at most six per stage |
| Pinned baseline declarations | 31 independently confirmed; none removed or replaced |
| Public sources | Seven downloads, all matching the packet's SHA-256 records |
| Source findings | Ten independently confirmed; none rejected or added |
| Requests / gaps / restructuring proposals | 16 / 5 / 7 |
| Coverage | Eight planned stages, zero closed; all implementations unchecked |

The packet's `review.checked` is the current 79-node ledger. Each entry records the actual mathematical check; it replaces the historical 89-node ledger, including entries for declarations removed by the revision.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/LanglandsParameterStacks.json`: zero errors and warnings.
- `scripts/check_errata.py` on an errata-v1 wrapper of the packet's source findings and version records: passed.
- A separate correspondence audit checked every node statement, hypothesis, proof step, acceptance condition, source annotation and direct prerequisite against its reader entry. All 140 API items and 90 tests also match the suggested file's inventory.
- Dependency checks confirmed the local graph is acyclic, the ten former target IDs are absent from current nodes and prerequisites, and no LP3 dependency enters LP1, excursion-presentation or semisimple-characters. The new direct colimit prerequisite is on the unconditional branch.
- Coverage was checked against the eight atlas stage descriptions, accounting explicitly for the recorded ownership migrations. Planet limits, unique review entries, source hashes, implementation statuses and whitespace were checked.

`lean-check research/blueprint/suggested/LanglandsParameterStacks.lean` exited successfully in the existing build at pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. It produced **97 warnings, all for declarations using `sorry`**, and no errors. Available memory exceeded 20 GB. These are elaborated signatures and admitted tests, not proved mathematical results. Full enhanced signatures remain explicitly omitted under G3. The shared build lacks the `TauCeti.GroupTheory.FixedSubgroup` object, so its import and two checks remain commented; its declaration and the continuous-cohomology declaration were independently read in source at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No library build, cache operation or language server was started. The final Lean change after elaboration only removed a redundant comment from the inventory; executable declarations are identical to those checked.

## Corrections made by this review

1. **Source attribution and locators.** Separated mixed FS/DHKM citations on the finite-presentation, flatness and dimension-comparison nodes; added the independent Zhu citations to derived construction/classicality, BHKT citations to the coarse quotient and Lafforgue citations to the excursion relations. The Zhu comparison retains its fixed C-group norm and normalization adapter. The monodromy comparison now cites FS **Proposition VIII.2.5, p.282**, rather than the derived-stack proposition. Subsection references for the free-group index, universal-homeomorphism discussion, induced-perfect subcategory and mapping approximation now carry a section marker, avoiding confusion with differently numbered propositions or definitions. The free good-filtration citation includes p.295, and the singular-support/Hochschild and quotient-etaleness citations include the actual proof pages. The 18 node locators corrected or clarified are identified in the packet ledger.
2. **Source matches.** Replaced boilerplate match sentences by specific, original-word accounts of the object, hypotheses or proof input actually supplied. Added seven separately attributed source entries. The reader uses exactly the same locators and annotations. No source passage or restricted-library content is reproduced.
3. **One direct prerequisite.** The universal-homeomorphism proof uses the underlying cocycle-coordinate colimit. Added `LP2:excursion-presentation/free-derived-cocycle-colimit` directly to its prerequisites and to the corresponding reader and Lean inventory entry. This uses the existing unconditional node; it does not introduce the good-prime invariant theorem or a new lemma.
4. **Highest-weight ownership.** Corrected the good-filtration t-structure's hypothesis and integral Chevalley restriction's proof, which still called highest weights an RG2.6 request. Both now extend the already accepted `ReductiveGroupsIntegralRepresentationsPartII`, through its registered parent Layer9 pending DESIGN stage assignment. The reader and suggested inventory distinguish this request from RG2.6's structural fixed-group and root-theoretic inputs.
5. **Delegation reasons.** The eight Chapter X migration records incorrectly repeated an IHG finite-anchor reason. Each now states its ES2/ES3 allocation and actual categorical contract. The ES3 finite-wild/characteristic-zero scope extension remains an explicit request; the current tame-W contract is not described as sufficient for the broader statement.
6. **Review evidence.** Independently rechecked all 31 baseline statements and refreshed their check records. Independently confirmed each of the ten source findings with this review's identifier and reasons, preserving the hashes and historical source-version information. Added current source-reading records and synchronized the reader's source-check notes and acceptance status.

No mathematical carrier, API item, test or planet was added or removed. No baseline description needed further narrowing after the first review's corrections. The two revision additions, `MonoidAlgebra` and `MonoidAlgebra.of`, supply the finite-support group-algebra carrier and its basis embedding; they do not supply a reconstruction theorem.

## Source checks

Every cited locator and the proof used by a retained target or delegation was read in the following public versions. The hashes match both the inherited source list and the newly downloaded files. Source results and defects are stated in our own words. No source from the restricted library was needed.

| Source | Independently read scope |
| --- | --- |
| [Fargues–Scholze, Geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf) | Author-hosted 356-page copy: VIII.1–VIII.5, pp.277–315, including complete fixed-group, gerbe and wild-elimination proofs; IX.7.1 p.334; X introduction/X.1 pp.339–343 and X.3 pp.348–350 |
| [Vincent Lafforgue, arXiv:1209.5352](https://arxiv.org/pdf/1209.5352) | Public French v10: Lemma10.1 and Proposition10.8 with the relevant relations, pp.133–139; §11 definitions, Proposition11.7, Lemmas11.9–11.10 and Remark11.8, pp.140–147 |
| [Böckle–Harris–Khare–Thorne, Acta Mathematica 223](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf) | Published copy: §§3–4, pp.10–24, statements and complete cited proofs; Proposition8.3 and proof, p.53 |
| [Zhu, arXiv:2008.02998](https://arxiv.org/pdf/2008.02998) | Revised 2025 copy: C-group normalization and §3.1, pp.31–36, including Proposition3.7, Lemmas3.9–3.10, Corollary3.11 and Proposition3.12 |
| [Dat–Helm–Kurinczuk–Moss, arXiv:2009.06708](https://arxiv.org/pdf/2009.06708) | Introduction and integral-model conventions, pp.4–7; Theorem4.1, Corollary4.2 and proofs, pp.29–31 |
| [Kurinczuk–Skodlerack–Stevens, arXiv:1611.02667](https://arxiv.org/pdf/1611.02667) | Definitions1.20–1.21 and their surrounding admissible classical-group scope, pp.8–10 |
| [Quast, Deformations of G-valued pseudocharacters](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf) | Author copy matching the recorded v1 hash: Definition3.1, Lemmas3.4–3.6 and Theorem3.7 with its complete reconstruction proof, pp.11–15 |

The generalized-reductive reconstruction check is substantive: Quast's finite anchor first maximizes minimal-parabolic dimension and, for disconnected groups, component count, then minimizes centralizer dimension and component count. The subsequent one- and two-entry arguments recover multiplication. The LP component-idempotent fibre forces the prescribed projection to Q even in characteristic dividing |Q|. Those arguments justify the IHG import; they do not settle G4's topological extension.

The ten inherited source findings were checked individually at their stated locators. E1 is the coefficient-group symbol slip in Lafforgue11.10; E2 is the false general Lie-semisimplicity assertion in BHKT; E3 is the overly strong cartesian-square assertion in FS; E4 is the false identification of all associative HH² with cotangent Ext¹; E5 is the Frobenius reciprocal convention; E6 and E8 are weight-lattice/index slips; E7 is the unjustified regularity of an inner semisimple element; E9 is the quotient normalization field error; E10 is the formal-slice source-point slip. Their existing repairs and counterexamples survive independent checking. Fresh corrigendum searches located no separate correction to these findings; that records the search outcome, not nonexistence of an erratum.

## Pinned baseline and library audit

The reviewed library audit was read for every LP stage. Existing ordinary carriers remain imports or explicitly limited prototypes, rather than new planned implementations. Upstream ReductiveGroups and RepresentationTheory/RootSystems were read as scope and density models. Supplier statements were read for every external dependency, including precise IHG nodes and the ten delegation contracts. E5, SF.1/SF.4, S.1, DD.0, R03.3 and the upstream Weil/ramification/DGA interfaces do not silently supply the stronger extensions requested here.

Every baseline declaration was independently read in the module recorded by the packet at its pinned commit:

| Declaration | Scope confirmed |
| --- | --- |
| Representation | Abstract group representations on modules; rational algebraic regularity is extra |
| MonoidHom | Multiplicative maps, distinct from crossed cocycles |
| Subgroup | Ordinary subgroups |
| FreeGroup | Free group and generator-map universal property |
| RingHom | Ring maps; algebra-linearity is separate |
| MvPolynomial | Polynomial algebra carrier |
| AlgebraicGeometry.Scheme | Ordinary schemes |
| Module.Flat | Tensor exactness for flat modules |
| RingTheory.Sequence.IsRegular | Regular sequences, including the nonzero quotient condition |
| Algebra.Extension.H1Cotangent | Kernel of the naive cotangent differential |
| groupCohomology | Abstract discrete-group cochains and cohomology |
| PrimeSpectrum.isHomeomorph_comap | Elementwise nil kernel and positive power lifting; universal base change requires its own argument |
| CategoryTheory.Triangulated.TStructure | Ordinary triangulated t-structures |
| CategoryTheory.Idempotents.Karoubi | Ordinary idempotent completion |
| CategoryTheory.MonoidalCategory | Ordinary monoidal structure |
| CategoryTheory.Functor.Monoidal | Ordinary monoidal functors |
| CategoryTheory.CatCenter | Ordinary End(id), the shadow of the stable pi_0 target |
| Condensed | Condensed sheaf carrier |
| CondensedMod | Condensed modules; relative coefficient comparison is extra |
| Module.Free | Existence of a basis; finite rank is extra |
| RootPairing | Root/coroot pairing and duality, without invariant-degree or fundamental-group tables |
| CoxeterSystem | Coxeter generators and relations |
| TauCeti.ContinuousCohomology.continuousCohomologyFunctor | Degreewise continuous-cohomology coefficient functor, without derived local duality |
| CategoryTheory.PresheafOfGroups.OneCocycle | Nonabelian Cech cocycles on a cover, with a separate crossed-group descent bridge |
| SemidirectProduct | Twisted group multiplication, projection and section carrier |
| Subalgebra | Algebra carrier used for the coaction equalizer |
| CommRingCat.Colimits.hasColimits_commRingCat | Ordinary small commutative-ring colimits |
| Equiv.Perm.cycleFactorsFinset | Nontrivial disjoint cycles; singleton cycles are supplied separately in the trace identity |
| TauCeti.fixedSubgroup | Abstract fixed subgroup, without group-scheme smoothness or reductivity |
| MonoidAlgebra | Finite-support group-algebra coefficients and convolution |
| MonoidAlgebra.of | Canonical basis-element monoid homomorphism |

The APIs and tests exercise the source distinctions: nontrivial-action cocycles versus homomorphisms, prescribed projection on wild parameters, scheme coaction invariants versus pointwise invariants, geometric Frobenius monodromy scaling, singleton trace cycles, induced versus actual perfect complexes, bad-prime fixed groups and finite bases carrying possibly infinite torsors. Their enhanced omissions are named explicitly; no fake proof field certifies the missing results.

## Prior review and confirmed red-team findings

| Requirement | Current check |
| --- | --- |
| Reader discrepancies from the first review | Every current statement, hypothesis and proof step agrees with the packet. Moss attribution, Zhu numbering, coaction invariants, Frobenius, stable centres, Schur hypothesis, finite good-filtration dimension, torsor bases and source repairs are consistent. |
| geomlanglands/4 | Structural fixed-group reductivity and unipotent-class finiteness are requested independently before LP1. LP3 owns the later component-order argument. Registration remains G1. |
| /5 | LP owns the abstract stable excursion construction and pi_0 End(id); ES0 specializes it to the representation/Bun_G setting. Both VIII.3.7 and VIII.4.1–VIII.4.2 are represented. |
| /6 | The primary ES2/ES3 allocation is applied locally. LP4 has only representation bundles, VIII.5.1 generation and module comparison. Its free-cocycle theorem is imported from integral-invariants. Eight removed targets have exact suppliers and source locators. |
| /23 | Unconditional coarse quotients and geometric semisimple classification precede good-prime integral algebra/cohomology/base change. No backward LP3 input is introduced. |
| /24 | The accepted Kisin–Pappas18 route5 and KPZ26 route3 give the single integral-representation Part II owner; LP3 and PA.1 consume it. The two remaining old ownership sentences are corrected here. |
| /25 and later accepted IHG routing | Generic pseudocharacters, finite anchors and reconstruction are imported from IHG. LP keeps the prescribed-component fibre, group-algebra trace adapter and local Weil continuity; GS.5 keeps its global application. |
| /26 | The selected model is over Z[1/p], with Z_l base changes and canonical continuous comparison there. SR.6 imports it. |
| /27 | SF.1 supplies effective descent and ordinary quotient interfaces; S.1 supplies scheme-perfectness. Stacky/derived enhancements are explicit E5 extensions, without claiming that the narrowed red-team finding already assigns them. |

## Remaining orchestrator work

These are subsequent closure tasks, not blockers to the correctness of this planning pass:

- **G1:** register and verify the structural reductive extensions, and extend the accepted integral-representation DESIGN brief with the highest-weight/good-filtration contracts. Current RG2.5 and parent Layer9 do not prove them.
- **G2:** retain the source-open full excursion-algebra independence of discretization with torsion; the verified torsion-free comparison is weaker.
- **G3:** supply the continuous/condensed, algebraic regular-function, stable and derived carriers and elaborate their omitted full signatures.
- **G4:** extend valued continuity to the finite-Q local Weil problem with relatively discrete condensed coefficients. The accepted IHG connected profinite rank-one valued-field statement is not this theorem.
- **G6:** apply the exact external IHG prerequisite reconciliation. Its invariant-evaluation, closed-orbit, stable-tuple, one-entry, two-entry and reconstruction paths still cite blanket LP3 inputs. Replace them with unconditional excursion geometry and the stated generalized-reductive extension. Register the shared GIT inputs along the accepted LP/deformation-ring routes; do not create another RG2.6 GIT owner.

Apply the seven recorded restructuring proposals to atlas targets and consumers together. In particular, preserve excursion-presentation → IHG → semisimple-characters, avoid an aggregate LP2 → IHG cycle, and extend the ES3 tame-W comparison to the requested finite-wild and characteristic-zero coefficient range. The review changes only its authorized deliverables; it does not apply those external changes or promote work.
