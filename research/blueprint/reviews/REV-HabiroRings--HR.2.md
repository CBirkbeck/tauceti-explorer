# Independent review of HabiroRings HR.2

Job `REV-HabiroRings--HR.2`, issue #6450. Reviewer: Codex, session
`codex-tAVjn2`, 6 October 2026. The planning session was `codex-7NZvwu`;
this reviewer did none of its work.

**Verdict: accepted after corrections.** This is acceptance of a finished
target-level planning pass. HR.2 remains **planned**, with two gaps and ten
supplier requests; it is not closed or formalised. The three solid nodes are
conditional on the specified light-solid foundation. The review does not
certify that foundation or turn the suggested file's comment ledger into Lean
declarations.

## Counts and coverage

The packet has five nodes: three constructions and two theorems. All five have
individual `corrected` review entries. No nodes were added or removed. Its three
constructions have 31 API items and 11 tests; the tensor theorem has another
five API items, giving 36 overall. There are four new planets, three baseline
declarations, two gaps, ten requests, and one planned stage with no closed
stages. The nine accepted parent HR.2 nodes are imported unchanged. Including
the parent's Habiro-completion planet gives five planets on HR.2, within the
six-planet limit.

Every HR.2 target is covered by these nodes or the parent imports: algebraic
Habiro completeness and completion, the corrected two-term resolution,
factorial and principal-completion comparison, homotopy completeness,
Nakayama and degree detection, completed tensor, spectral realization, the
solid embedding and the bounded-below solid comparison. The remaining list
identifies the unassigned solid supplier, genuine higher typed interfaces and
the proposed substage's structural application. It does not claim that these
inputs have been established.

## Sources checked

I downloaded and read the following public PDFs. Each SHA-256 agrees with the
packet, including the living author-hosted thesis and Higher Algebra files.

| Source | Passages read for this review | Result |
| --- | --- | --- |
| Ferdinand Wagner, [q-Hodge complexes over the Habiro ring, arXiv v2](https://arxiv.org/pdf/2510.04782v2) | Appendix B.1–B.8, printed/PDF pp.77–80 | All five node locators match. B.2 supplies the spectral completion and Ext criterion; B.3–B.5 supply detection; B.8 is a proof sketch with the stated bounded-below scope. |
| Guido Bosco, [Rational p-adic Hodge theory for rigid-analytic varieties, arXiv v1](https://arxiv.org/pdf/2306.06100v1) | Appendix A.1, Notation A.2, Proposition A.3 and Lemmas A.4–A.5, pp.92–93 | A.3 concerns a derived p-complete solid ring and cohomologically bounded-above complexes. A.4 supports uniform decay across product blocks and the profile order, in the algebraic setting. Neither result proves the spherical contract. |
| Ferdinand Wagner, [q-Hodge filtrations, Habiro cohomology, and ku](https://guests.mpim-bonn.mpg.de/ferdinand/q-Thesis.pdf), author PDF dated 15 August 2025 | Numbered paragraphs 5.1–5.3, printed pp.85–86 / PDF pp.89–90 | The light hypersheaf definition, internal-Hom solidity criterion, discrete adjunction and compact generator are recollections. The text expressly refers their foundations to lecture recordings and unfinished notes. |
| Jacob Lurie, [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), 18 September 2017 | Definition 2.2.1.6, Example 2.2.1.7, Proposition 2.2.1.9 and its following proof setup, pp.196–198; Theorem 7.1.2.13 and proof, pp.1212–1213 | Monoidal localization requires tensor-compatible localization equivalences. The discrete-ring module/derived equivalence is symmetric monoidal for the discrete ring's relative tensor. |

All ten node citation excerpts were checked against those passages. Three were
replaced by shorter uninterrupted literal fragments: the thesis's compact
generator phrase and the Wagner/Bosco phrases broken by line-end hyphenation.
This is a transcription correction, not a source error.

No new mathematical error in these source passages was found. The inherited
`HabiroRings/E8` was checked again at Wagner p.78. With the printed differential,
the image of the basis vector at index 1 has augmentation
`1/(1−q)−1 = q/(1−q)`, which is nonzero. The corrected next-factor differential
has zero composite. Its existing confirmed entry stays in the parent; no
duplicate erratum is introduced. Lecture recordings were not watched, and
there is no claim to have verified their spectral proofs.

## Baseline and ownership

All three baseline declarations were read in their source files at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`:

| Reference | Checked statement and limit |
| --- | --- |
| `mathlib:LaurentPolynomial` | `Mathlib/Algebra/Polynomial/Laurent.lean`, line 84: the abbreviation is `AddMonoidAlgebra R ℤ` for a semiring R. It supplies the ordinary coefficient ring, not a spherical group ring. |
| `mathlib:DerivedCategory` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`, line 87: localization of cochain complexes over an abelian category, with `HasDerivedCategory`. It is the ordinary derived category, not the enhanced spectral carrier. |
| `mathlib:LightCondMod` | `Mathlib/Condensed/Light/Module.lean`, line 42: `LightCondensed (ModuleCat R)` for a ring R, sheaves of ordinary modules. It supplies neither spectral hypersheaves nor solid tensor. |

No baseline citation was removed or replaced. Searches of the pinned Mathlib
source and Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369` agree with
the reviewed `AUDIT-17` HR.2 record: the completion, stable spectra and solid
spectral interfaces are absent. No new node duplicates something that audit
identifies as built.

The supplier statements were read, rather than inferred from their names:
H.5:spectra owns the concrete spectral foundation, H.5:S-delooping owns smash
products, H.6 owns coefficients and convergence, E3 owns accessible adjunctions,
and E5:abstract owns coherent algebras and modules. The late E5:spectra-comparison
is used only after H.5. Its explicit statement supplies the Eilenberg–Mac Lane
return; it does not construct the earlier spectra again. DD.1 owns generic
derived completion. HC.1 supplies the factorial polynomials, cofinality and
ordinary completion. QM.0's Gaussian polynomial statement supplies the
factorial product identity over integers. VS2 owns the qualified solid
abelian/module theory, and is used only for the algebraic compatibility
boundary, not as an owner of light solid spectra.

## Corrections and mathematical checks

1. **Requested inputs now appear in the direct graph.** Added E5:abstract to
   each new node's prerequisites, because its existing definition nodes alone
   do not prove the requested localization and relative-tensor extensions.
   Added HC.1 to the solid-unit node for the requested quotient bases, the
   completion node to the countable construction, and the unit, completion
   and B.7 nodes to the tensor theorem. These are ten additional direct
   references, not new mathematics or invented supplier identifiers. The E5
   request now explicitly includes extension of a compact generator to a
   module category.

2. **Finite-stage sphere bases keep the polynomial sign and spectral
   argument.** P_n has leading coefficient (−1)^n. Division uses its monic
   associate (−1)^nP_n. The basis is 1,q,…,q^(d_n−1), with
   d_n=n(n+1)/2. Monic division with coefficients π_kS proves the sphere-basis
   comparison in every homotopy degree; the cofiber long exact sequence uses
   injectivity of this monic multiplication. The unit constant term makes q
   invertible. Polynomial representatives split the tower as S-modules;
   this does not assert R-linear splittings. Thus the ranks 1 and 3 in the
   acceptance examples are justified without replacing spectra by static
   abelian groups. Relative tensor/tower exchange still belongs to G-solid.

3. **The countable construction keeps its category.** The former final proof
   step suggested comparing arbitrary product blocks to a discrete spectral
   product via B.7. That adjunction alone does not give the comparison:
   discrete condensation preserves finite products but need not preserve
   countable products. The step now makes the finite-block comparison only.
   Infinite product blocks remain solid constructions and are not assumed to
   lie in the B.7 image. The same boundary is stated in G-solid and the Lean
   ledger. This change leaves the solid countable tensor calculation intact.

4. **The non-example keeps P_1's convention.** Corrected P_1=q−1 to P_1=1−q,
   while stating that the two generate the same ideal. Reduction of a completed
   singleton coproduct modulo P_1 has finite support, so the constant family
   cannot be in its image. This remains a discriminating test.

5. **Eight functorial API items were added.** Completion now specifies the
   induced map, identity and composition laws, and unit naturality. The
   countable construction specifies induced maps, identity/composition, and
   compatibility with block inclusions. Its map class is precise: each input
   block map factors through a finite output subcoproduct. The ledger contains
   every new name and mathematical statement.

The localization's universal mapping space and the next-factor telescope
agree with B.1/B.2. For completion, applying Hom to the fibre triangle gives
the reflection and the T-local kernel, which is a tensor ideal. This verifies
the hypothesis of HA 2.2.1.9. The Ext term involves π_(k+1)M. The complete,
exhaustive Postnikov filtration has a uniform two-degree graded amplitude,
so this criterion is unbounded; the bounded-below restriction is specific to
the solid tensor theorem. Restriction along the spherical-to-HZ coefficient
map commutes with completion by localization base change. Its tensor
comparison is only lax monoidal; HA 7.1.2.13 applies symmetrically to
HZ-relative tensor.

For the countable profile model, J_r is the fibre object equipped with its
P_r multiplication map; J_0=SH. It is not defined as an untyped subset.
Reverse pointwise order has the common target min(f,g), which remains proper.
The mapping-space API is the universal property of the completed coproduct.
Its empty, single-block, constant-family and decaying-family tests each have
the stated interpretation, and do not assume arbitrary block products are
discrete.

For the tensor calculation I checked both directions of cofinality. The
Gaussian identity gives P_aP_b dividing P_(a+b). For radial proper h define
a(k)=min{h(m,n):m+n≥k}; this minimum exists, a is increasing and tends to
infinity. Setting f(k)=g(k)=floor(a(k)/2) gives
f(m)+g(n)≤a(max(m,n))≤h(m,n). Conversely max(f(m),g(n)) is radial proper:
outside a large finite square at least one of the two one-variable bounds
applies. The containments are
P_hSH ⊆ P_(f+g)SH ⊆ P_fP_gSH and
P_fP_gSH ⊆ P_max(f,g)SH. They prove the two cofinal directions. G-solid
still has to prove the spectral null-family, product-tensor and uniformly
bounded-below resolution/realization inputs. Bosco's algebraic proof is not
silently promoted into that proof.

## Verification and suggested file

`python3 scripts/check_blueprint.py
research/blueprint/packets/HabiroRings--HR.2.json` reports zero errors and zero
warnings. A separate traversal from the five new nodes and nine imports,
using packet prerequisites and atlas stage requirements, found 227 reachable
references and no cycles. Every construction has at least three tests; all
API and test names appear in the suggested file, either in its typed fragment
or its explicitly marked unavailable-signature ledger. The two upstream
AlgebraicTopology and AdicSpaces documents were read for conventions and the
expected proof/API density.

Memory was checked before `lean-check`. The suggested file elaborated
successfully against the exact pinned Mathlib, with ten warnings, all for
`sorry`. It imports only Mathlib modules. The shared Tau Ceti checkout is
newer than the atlas pin, but no module from it is imported by this file;
the Tau Ceti baseline investigation used the exact pinned commit separately.
No library build, package update, cache fetch or language server was started.

**What Lean checked:** three arithmetic API signatures, seven acceptance
examples, and their imports/notation. **What it did not check:** the three
spectral/solid constructions, their API/test ledger, and the two spectral/solid
theorem signatures. G-signatures records that missing carrier boundary. No
opaque spectrum carrier, fake proposition field or vacuous theorem was
introduced to hide it. The two gaps remain appropriate follow-up obligations
under the protocol's acceptance rule for honest open coverage.

## Orchestrator follow-up

Assign G-solid's generic Part II supplier, including the precise tower and
bounded-below realization contract. Apply the proposed HR.2:solid split
atomically, keeping it off the algebraic HR.3–HR.5 / HQ.3–HQ.5 path. Replace
the ledger with typed signatures when the genuine carriers exist.

The reader is outside this review's permitted edits. Its assembly should
incorporate the corrected direct references, normalized finite-stage basis
argument, finite/infinite block distinction, eight map-law API items and P_1
sign. The packet and suggested file are the corrected artifacts of this
review. No parent packet, reader, campaign document, atlas data or supplier
packet was changed.
