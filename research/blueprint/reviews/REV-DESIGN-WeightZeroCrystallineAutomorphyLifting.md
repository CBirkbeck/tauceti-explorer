# Independent review: WeightZeroCrystallineAutomorphyLifting

**Verdict: accepted as a target-level planning pass.** Reviewer: Codex,
session `codex-zAUWyT`, 11 October 2026. Job: `REV-DESIGN-WeightZeroCrystallineAutomorphyLifting`
([#7107](https://github.com/CBirkbeck/tauceti-explorer/issues/7107)). The design
was written by a different session, `codex-DdIaCt`, in
[#8851](https://github.com/CBirkbeck/tauceti-explorer/pull/8851).

The corrected packet has 21 justified target nodes: 2 definitions, 5
constructions and 14 theorems. Its review records 12 verified and 9 corrected
nodes, with no added or unverifiable nodes. There are 31 API items, 30 unit-test
specifications, 21 planets, 5 baseline declarations, 20 supplier requests and
28 explicit gaps. All six stages are **planned**; none is closed. The packet's
`complete` status describes the completed planning pass under the protocol,
not completed proofs or an available arithmetic implementation.

## Corrections made

1. Restricted the prepared patching interface in WZ.0 to `n≥2`, matching the
   higher-rank crystalline supplier. BCGNT's final theorem and the ordinary
   final theorem still allow `n=1`, through the separate WZ.4 character target.
   Updated the roadmap description and reader to state this specialization.
2. Replaced the invalid `q=3,n=2` tower example, which fails `q≥n²f`, by
   `n=2,f=5,q=20`, with both dual Selmer dimensions below 20. The diamond rank
   is 20 and `g=0`. Five equal-degree p-places satisfy the strict complementary
   local-degree condition, so the example also respects the prepared profile.
3. Added source issue E7 and `GAP-BLOCK-CONVENTION`. MT's local projector and
   diamond kernel select the last block, but its later displayed partitions
   and localization polynomials put the selected multiplicity first. The
   packet consistently uses `(n−d,d)` with the selected block last. Strengthened
   the SR.2, SR.5 and ALS.6 requests, WZ.3/WZ.5 proof outlines and stage
   `remaining` lists: the comparison must transport the projector, selected
   polynomial, level, diamond action, local deformation condition and boundary
   Hecke map together. A partition permutation by itself is insufficient.
   Added the `n=3,d=1` discriminating test and its omitted-prototype index in
   both the packet and Lean file. The reader now explains the same obligation.
4. Made `ζ_p∉F` explicit in the prepared ordinary patching target. Its final
   theorem supplies this through the scalar-outside-cyclotomic witness, which
   must survive preparation. Replaced the ordinary preparation's incorrect
   ACC §6.5.12 locator by §§6.6.1 and 6.6.10.
5. Removed locators to other papers from individual BCGNT and MT source entries
   in WZ.3, WZ.4 and WZ.5; retained their separate correct source entries.
   Added the BCGNT p. 60 ordinary application as its own source entry. Corrected
   “Proposition 2.14” to **Theorem 2.14** in the modular parahoric supplier
   request and gap, and corrected the CN title to *On the modularity of
   elliptic curves over imaginary quadratic fields*. Extended the recorded MT
   read scope to its boundary calculations in §5, pp. 17–20, and corrected
   §6's range to pp. 20–22. Synchronized all reader occurrences.
6. Added independent verdicts to all seven `sourceIssues` and recorded the
   independent baseline, supplier and current-upstream audits. Removed four
   absent roadmap directory names from `currentMainScreen`; retained the nine
   later roadmaps actually screened. Added the top-level review and its
   exhaustive per-node checked list.

No baseline citation was removed or replaced. No new mathematical node was
needed: the newly detected non-routine comparison is a precise request to the
existing owners, accompanied by an explicit gap.

## Sources and source issues

I read the actual public PDFs recorded by the packet, checked their hashes
against `sourceVersions`, and checked every node's statement, hypotheses and
locator. References below use the PDFs' internal page numbers. These are
mathematical specifications in our own words; no source excerpt was added.

| Source | Checked target-bearing passages |
| --- | --- |
| [BCGNT25, published author copy](https://www.math.uchicago.edu/~fcale/papers/SatoTate.pdf) | §3.1–3.2, pp. 30–35; sibling Theorem 2.5.5, pp. 28–29; ordinary application p. 60 |
| [MT23, published PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A36C754C24E9258E1E062C62378BF1E/S2050509423000038a.pdf/automorphy-lifting-with-adequate-image.pdf) | Theorems 1.2–1.3, pp. 1–3; §§2–3, pp. 3–15; §5, pp. 17–20; §6, pp. 20–22; Theorems 7.6–7.7 and §8, pp. 26–30 |
| [CN25v3](https://arxiv.org/pdf/2301.10509v3) | Theorems 4.2.15 and 4.3.1, pp. 71–73; Lemma 5.3.3, Proposition 5.4.2 and Corollary 5.4.3, pp. 76–79 |
| [ACC23v2](https://arxiv.org/pdf/1812.09999v2) | Theorem 2.4.10, pp. 52–55; Lemmas 6.2.25–6.2.26, pp. 146–147; §§6.4–6.5 patching/preparation, pp. 157–179; ordinary §6.6, pp. 179–189 |

All six original source issues were independently confirmed. E7 was added and
confirmed in this review.

| Issue | Independent finding |
| --- | --- |
| E1 | BCGNT p. 32 uses a global field degree over `Q_p` in the complementary-degree bound. The intended bound is `[F⁺:Q]/2`, consistent with ACC p. 178 and MT p. 28. |
| E2 | BCGNT p. 31's constant Hecke coefficient needs `(-1)^n`; the printed positive sign fails odd rank. This was already recorded as BCGNT extraction E20. |
| E3 | ACC pp. 175 and 186 drop a factor of `n` from the earlier archimedean subtraction on pp. 174 and 185. MT Proposition 6.7, p. 22, yields the adequate count `g=q−n²f`. The existing extraction/parent entries E88/E58 agree. |
| E4 | The almost-everywhere comparison in ACC's proof on pp. 175–176 does not alone establish its every-place local Weil–Deligne assertion. PA.5 explicitly supplies local soluble base change and LLC compatibility. Existing E90/E60 already record this proof input. |
| E5 | ACC's quadratic example on p. 178 omits congruences at its residual-image test set. The corrected preparation includes them; the weight-zero variant also splits p. Existing E91/E61 agree. |
| E6 | BCGNT Theorem 3.2.5, pp. 34–35, does not assume `ζ_p∉F`, but MT Proposition 6.7, p. 22, does. The prepared conditions do not imply it. `GAP-CYCLOTOMIC` retains the required tower/count justification for that boundary. This is a gap in the invoked method, not a counterexample to the support theorem. The final global theorem supplies noncontainment. |
| E7 | MT §§2–3, pp. 7–11, and §5/Theorem 7.6, pp. 18–20 and 26, use incompatible displayed selected-block orders. The new joint convention-comparison request prevents a literal import of incompatible local and global data. It records a proof obligation, not a claim that the automorphy theorem is false. |

## Baseline and ownership

The pinned baseline is Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. I read the actual statements of all
five cited declarations. The relevant local source files are byte-identical
to GitHub at that pin.

| Declaration | What its actual statement supplies |
| --- | --- |
| `Representation` | Algebraic monoid homomorphisms to module endomorphisms; the inverse scalar coefficient needs precisely this carrier. It supplies no topology or smoothness. |
| `Representation.trivial` | The identity-endomorphism representation on the same scalar module. |
| `PrimeSpectrum.comap` | Inverse image of prime ideals under a commutative ring homomorphism. |
| `range_comap_of_surjective` | Image of spectrum comap equals the zero locus of the kernel for a surjection; nilpotence makes that zero locus the whole spectrum. The declaration is global, as cited. |
| `Module.support` | Primes where the localized module is nontrivial, applied to cohomology over the actual Hecke image. |

I read all 37 direct external supplier-node statements, their hypotheses and
the 20 request contracts. The proof outlines respect the owners of local
deformation rings, automorphic Galois attachment, arithmetic spaces, selected
block calculations and derived patching. They do not treat the current partial
supplier prototypes as implementations. Important near misses remain explicit:
the rank-two CN Barsotti–Tate algebra argument does not supply arbitrary-rank
weight-zero reducedness; generic tensor algebra does not prove geometric
completed-tensor component products; characteristic-zero Bernstein theory
does not supply the modular selected-block comparison; and the older
Fontaine–Laffaille/enormous-image preparation does not supply ramified-p
crystalline/adequate preparation.

The layers are ordered from prepared objects through Hecke recognition,
local-component geometry, paired adequate patching and global descent to the
ordinary verification. Direct requirements and requests retain this order.
The source's sibling local reducedness theorem stays with R08.3, and generic
commutative algebra stays with P9. Rank-one realization imports the existing
ClassFieldTheory Layers 7 and 11 and requests the coefficient-valued labelled
p-adic Hodge/Hecke comparison rather than defining reciprocity again.

I checked `data/library-coverage.json`, searched both pinned source trees, and
read the current upstream at roadmap commit
`c251d2e42c66f14c279d1e5c2708c5a91d8c8aec` and Tau Ceti commit
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nine later roadmaps screened
are recorded in `upstreamAudit`; LocalGaloisGroups, ProfiniteArithmetic and
ClassFieldTheory were also checked for relevant existing interfaces. No
duplicate weight-zero lifting or adequate arithmetic tower was found.

## API, prototype and validation

Every definition/construction has at least four discriminating test
specifications. The APIs cover the usable selectors, inverse coefficient,
representing problem, finite-level tower, paired patched system and soluble
preparation. Empty auxiliary sets, coefficient reduction, framing, repeated
eigenvalues, residual comparison, dual augmentation and image preservation
are among the cases checked. The new orientation test catches a complementary
block being mistaken for the selected block. All planet names and declaration
assignments agree with the targets and source terminology.

The suggested Lean file has three generic typed targets: the subgroup
selector, inverse scalar representation and integer dimension identities.
Only the inverse scalar target has its complete generic API/test signatures;
the other two are partial arithmetic targets. All unavailable arithmetic
signatures, APIs and tests are indexed explicitly as omitted. There are no
unconstrained proposition fields used to mimic unavailable arithmetic data.
This is the protocol's honest omitted-signature case, not a proof of the
arithmetic results.

Validation:

- `scripts/check_blueprint.py` with the pinned declaration index: zero errors
  and zero warnings.
- `lean-check` on the suggested file at the shared pinned build: exit 0;
  twenty `declaration uses sorry` warnings and no other warnings or errors.
- Checked JSON/reader synchronization for every statement, hypothesis,
  proof step, acceptance condition, API and test, and checked the new source,
  request and gap corrections in both documents.
- `git diff --check`: passed.

## Questions for the orchestrator

1. Coordinate SR.2/SR.5/ALS.6's E7 comparison as one shared contract before
   either adequate arithmetic tower is implemented; the selected polynomial,
   diamond-linear local condition and boundary comparison must use one order.
2. Ensure R08.3's Part II extension explicitly owns BCGNT Theorem 2.5.5's
   arbitrary-rank weight-zero special-fibre reducedness. Its existing generic
   regularity and rank-two targets are insufficient.
3. Route the full prepared `ζ_p∈F` boundary to G7 as requested. It is additional
   to the noncontainment case needed by the final global theorem.
4. Preserve all 20 supplier requests and 28 gaps as follow-up inputs. Acceptance
   of this planning pass does not discharge them or close any proof stage.
