# RT-PAPER-FENG-24 — independent red team

Codex, session `codex-rtOQ9t`; issue #4212; 2026-10-01. Target snapshot:
`origin/main` at `30c3dd7`. **Complete: four high-severity findings.** Each makes
an active extracted statement false or its construction undefined. This report
adds findings; it does not modify the extraction or adjudicate its existing review.

## Sources and scope

Freshly read the entire **published 66-page version**, including Appendices A/B
and references: Tony Feng, with an appendix with Gus Lonergan, *Smith theory and
cyclic base change functoriality*, Forum of Mathematics, Pi 12 (2024), e1,
[DOI 10.1017/fmp.2023.32](https://doi.org/10.1017/fmp.2023.32),
[publisher PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/76E09C985494E340189BDD496BDBD3C1/S205050862300032Xa.pdf/div-class-title-smith-theory-and-cyclic-base-change-functoriality-div.pdf).
Downloaded 2026-10-01; SHA-256
`d0abda98ec3077894814ee06bcd6689c1dd0939ff96a17320ddeecddc7307584`.
The PDF carries a download timestamp; its hash identifies this downloaded copy.
Page images 33 and 37 were inspected to check the formulas and hypotheses.

Also downloaded the [author PDF](https://math.berkeley.edu/~fengt/Smith_base_change.pdf)
linked from the [author's publications page](https://math.berkeley.edu/~fengt/papers.html):
68 pages, creation metadata 2023-11-28, SHA-256
`617fb499cca6b6ae7373a12af08fbe5da1bbb41cf577be6b69127210b1dc9b18`.
Its Lemma 5.7, p.38, has the same descent argument. This was a targeted comparison,
not a second full read. The [arXiv record](https://arxiv.org/abs/2009.14236) lists
v6 dated 2023-11-29. The publisher page, author list, Crossref correction relations
and bounded title/author/erratum/ramification searches supplied no correction to
the findings below. No fresh reading of arXiv TeX or of every cited supplier is claimed.

Read the 142 current items, 57 source-issue entries, four route briefs, nine
prerequisites, extraction report, accepted review report and review JSON. The
accepted review is cc-39fac3's PR #3314; this session did neither extraction nor
review. The earlier unmerged self-review is not the accepted review.

The extraction already records substantial issues, including E25/E29 on equivariant
parity and naturality, E34 on the torus reduction, E41 on component support and
E48–E51 on local levels. Those issues are not counted again here.

## 1. Ramified equivariance is not effective descent (high)

**Where:** item 60, Lemma 5.7; route 2; downstream items 62–64 and E41's repair.
The published setup in §5.1.7, pp.32–33 allows a cyclic extension with ramification.
The proof on p.37 turns the unique equivariance cocycle into effective descent.
Representability kills automorphisms, but does not kill inertia acting on a bundle
at a branch point.

Here is a counterexample compatible with arbitrarily deep level at the stated
single auxiliary point. Distinguish geometric characteristic 7 from coefficient
characteristic `p=3`.

- Let `X=P¹_t` and `X′=P¹_u` over `F_7`, with `t=u³` and `σ(u)=2u`.
  This is cyclic of degree 3 and ramified at 0 and infinity.
- Let `H=G_m`, its usual parahoric model, and `G=Res_{X′/X} G_m`.
  Take no legs, `D=∅`, and `x_0=(t=1)`.
- On `X′`, take the trivial line bundle `L`, the Frobenius identification defined
  over `F_7`, and the frame `ν=u` on
  `A_n=F_7[u]/((u³−1)^n)`, for any `n≥1`. The frame is defined because `u` is a
  unit in `A_n`. This is a no-leg `G`-shtuka with level `nx_0`.
- Pullback by `σ` changes the frame to `2u`. Multiplication by `4=2⁻¹` identifies
  `(L,ν)` with `(σ*L,σ*ν)`, since `(2u)·4=u`. It commutes with Frobenius and its
  threefold cocycle is identity because `4³=1` in `F_7`.
- Any automorphism of the trivial line bundle on projective `X′` is a constant.
  Compatibility with the nonempty frame forces that constant to be 1. Thus the
  point is genuinely fixed after passing to a representable HN truncation; it is
  not residual stack automorphism data. The underlying torsor is trivial, so it
  lies in the degree-zero piece. Choose a bound containing it and any sufficiently
  large `n` as in the lemma. For a torus the no-leg bounded piece is discrete and
  this level already removes its scalar stabilizers.

It cannot come from an `H`-shtuka under the asserted diagonal map. Such a preimage
would have an underlying line bundle `M` on `P¹_t` with `π*M≅O`. Its degree obeys
`3 deg(M)=0`, so `M≅O`. Every isomorphism of its pullback with `L` is multiplication
by a global constant `c`. The pulled-back level frame is a function of `t` and hence
is `σ`-invariant. It cannot equal `cu`: reduction to `n=1` gives the three values
`c,2c,4c` over `t=1`, which are distinct for `c≠0`. This also proves the obstruction
for every larger `n`. Equivalently, the unique linearization above acts as 4 on the
fiber at the fixed point `u=0`; pullback descent has trivial inertia there.

**Repair:** add a source issue and distinguish the étale-cover theorem from the
ramified situation. An effective-descent/trivial-inertia locus is the relevant
candidate in the latter case. If the application instead increases level at all
branch points, state those level conditions and prove that they eliminate the
inertia obstruction. Recheck the use of the *whole* fixed locus in equivariant
localization, the component identification asserted in E41, and the ensuing global
and local routes. Extra fixed points alone do not disprove the main existence of
base change: a corrected argument may use a smaller locus or stronger auxiliary
level. They do disprove the identification that item 60 currently asks to build.

## 2. The admissible-family axioms do not imply linearity (high)

**Where:** item 56, Definition 5.1 and Construction 5.2, published p.33; route 2.
The review correctly repaired E35's reversed indices. Even with that repair,
only fusion and composition of fusion isomorphisms are required.

Set `A=k`. For every finite set `I`, including the empty set, define an ordinary
functor `H_I` that sends every object to the one-dimensional trivial `Γ^I`-module
`k` and **every morphism to `id_k`**. It preserves identity and composition. Take
all fusion maps to be identity. Both written admissibility axioms hold.

For `W=1`, take `x=0` and `ξ=id`. These really are L-group morphisms, so there is
no typing issue in this example. Construction 5.2 gives `id_k`, since each arrow
is identity. But the linearity relation in §2.4.2(iii), also stated in item 13,
forces the generator with `x=0` to act by zero. Thus the abstract theorem fails.
One may also use the empty-set evaluation relation.

**Repair:** specify the additive, coefficient-compatible functor structure and
all normalization/inflation/coherence needed for the excursion relations, then
prove those relations. The target must carry the required scalar action; an
unspecified ring `A` does not by itself supply it. Test zero, addition and scalar
multiplication of creation maps. This is a missing-hypothesis/source-contract
finding, not a claim that the actual cohomological functors fail linearity.

## 3. Creation maps need not be L-group morphisms (high)

**Where:** item 56 and its use of the generator convention in item 13; published
Construction 5.2, p.33. This persists if the linearity issue is repaired.

Take the split group `G=G_m`, `p=3`, and a nontrivial quadratic character
`χ:Γ→{±1}⊂k×` of the function-field Weil group, obtained from degree modulo 2.
Let `I={0}` and `W=k(χ)` with trivial dual-torus action. Both `x=1∈W` and the
corresponding `ξ∈W*` are invariant under the diagonal dual group, as required by
§2.4.1 and item 13. But they are not maps from/to the trivial representation of
`L G=G-hat×Γ`: for `χ(γ)=−1`, the image of `x` is `−x≠x`.

The functor's stated domain is `Rep_k(L G)`, so `H_{ {0} }(x)` is undefined.
The source's parenthetical observation on p.33 only makes `x` a **dual-group**
morphism; it does not supply the missing arithmetic equivariance.

**Repair:** state the underlying functors on geometric representations and their
Galois-equivariant/descent structure separately, so the creation and annihilation
maps have a domain. Proposition 5.12(i), p.39, already distinguishes geometric
representation functors from their arithmetic forms. Supply the comparison with
the L-group excursion presentation and prove its relations. An alternative using
auxiliary induced representations would need its construction and independence
proof. Requiring full L-group invariance of every generator's vector would change
item 13's algebra and is not an adequate repair.

## 4. Review-added rev-6 gives a false bound for Rj_* (high)

**Where:** item `rev-6` and route 1. It says that both `Rf_!` and `Rj_*` take
tor-amplitude `[a,b]` into `[a,b+c]`, with `c` at most twice the relative dimension.
An open immersion has relative dimension zero. The assertion would make `Rj_*`
t-exact on free coefficient sheaves.

Let `j:G_m→A¹` over `Fbar_7`, with `A=k[C_3]`, `k=Fbar_3`, and take the constant
free `A`-sheaf in degree zero. Its tor-amplitude is `[0,0]`. At the origin,
`R¹j_*A` is nonzero. Indeed, on the fraction field of the strict henselization of
`O_{A¹,0}`, the equation `z³=t` gives a nontrivial Kummer torsor: the valuation of
a cube is divisible by 3, whereas `v(t)=1`. Its nonzero `F_3` cohomology class
persists after extension to `k` and the constant free `A`-coefficient module. Thus
`Rj_*A` has nonzero degree-one cohomology and cannot have tor-amplitude `[0,0]`.
The input remains free, so no coefficient-flatness caveat removes this example.

Feng's proof on p.16 needs preservation of **finite** tor-amplitude and does not
state this bound. [Stacks tag 0F10](https://stacks.math.columbia.edu/tag/0F10)
asserts finiteness of cohomological dimension for finite-type schemes over a field.
The [Kummer sequence](https://stacks.math.columbia.edu/tag/03PK) gives the torsor
class used here. The invalid quantitative strengthening belongs to the review.

**Repair:** separate the compactly supported pushforward bound from the bound for
open-immersion direct image. For `Rj_*`, give a valid finite bound in terms of the
ambient geometry with its hypotheses, or retain only the finiteness statement
needed by the consumer. Keep the existing owner and add the punctured-line test.

## Coverage, library and route checks

The three proposed roadmap routes contain 63, 33 and 32 items respectively.
All **128 missing items occur exactly once**; six coefficient-independent items
are in the source route. All 13 distinct existing planned-stage identifiers resolve.
The current atlas has none of the three proposed roadmaps, nor the conditional
`SmithTheoryAndModPFunctoriality` supplier; those briefs are proposals, not existing
implementations. No recursive closure of every cited supplier was demanded.

Read the relevant GS.0–GS.7, RG2.0a/RG2.2–RG2.5, SR.0/SR.1/SR.3/SR.6, LP0 and
LP2 excursion/character, ES0 and Satake GS1/GS4 stage descriptions, restructured
scopes and available library-audit context. The modular/global versus local and
rational-coefficient distinctions explain the accepted routing changes. Broad
subject overlap alone was not treated as a second-owner finding.

For the three library items, read the actual pinned signatures:

| Item | Evidence read | Result |
| --- | --- | --- |
| 105 | Mathlib `RepresentationTheory/Homological/TateCohomology/Basic.lean`: `tateCohomology`, `Rep.tateNorm`, `TateCohomology.δ`, `exact₁`, `exact₃`; Tau Ceti `LowDegree.lean`: `H0IsoNormQuotient`, `HNegOneIsoNormKernelQuotient`; `Periodic.lean`: `Rep.FiniteCyclicGroup.periodicIso` | The finite-group/coefficient hypotheses match the modular input. The review already records the naturality adapter needed for a folded six-term sequence; no new claim of full six-term formalization. |
| 106 | Mathlib Witt vector definition, Frobenius, Teichmüller, `isDiscreteValuationRing`, `isAdicCompleteIdealSpanP`, `quotientPEquiv` | The perfect-field assumptions cover `Fbar_p`; completeness and residue-field claims have the additional cited witnesses. |
| rev-34 | `Algebra.IsInvariant.isIntegral`, `Algebra.IsIntegral.finite`, root `fg_of_fg_of_fg`, `Submodule.exists_sub_one_mem_and_smul_eq_zero_of_fg_of_le_smul` | Finite invariants, finite-type finiteness, Artin–Tate and Nakayama match after the usual invariant-subalgebra specialization and change from `r−1` to `1−a`. |

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Declaration existence alone was not
taken as evidence of the stronger sheaf-theoretic results.

## Validation

- Exact arithmetic checked the three values of the frame over `t=1`, its scalar
  identification and order-three cocycle, the constant-functor zero test and the
  quadratic-character non-equivariance. The proofs for all thickened levels and
  for the punctured-line cohomology are above; the arithmetic check is not a Lean proof.
- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-FENG-24.result.json`.
- `python3 research/blueprint/intake.py check-files` on the two deliverables.
- `git diff --cached --check` and two-file scope verification.

No Lean source, compilation, library build, cache download or language server is
part of this job. The PR reports the outcomes of the validators.
