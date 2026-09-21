# PAPER-ANDRE-18 — ramification beyond unramified almost purity

**Partial checkpoint, 21 September 2026.** Author: GPT-6 Astra Pro; session
`g6ap-0921-andre-7c4e`; issue #1464. This is not a complete extraction, an
accepted routing decision, a Lean implementation, or an independent review.
The companion JSON contains 72 items: 35 mapped to existing stage contracts
and 37 assigned provisionally to a Part II. No item is labelled `library`.

## Source and reading boundary

The source read is Yves André, *Le lemme d’Abhyankar perfectoïde*,
Publications Mathématiques de l’IHÉS **127** (2018), 1–70,
[DOI 10.1007/s10240-017-0096-x](https://doi.org/10.1007/s10240-017-0096-x).
The [published NUMDAM PDF](https://www.numdam.org/item/10.1007/s10240-017-0096-x.pdf)
was accessible as parsed text. All locators below are **published page and
statement numbers**; they are not silently borrowed from the
[2016 preprint](https://arxiv.org/abs/1609.00320).

The introduction and §1 were read, along with the passages named individually
in `source.readSections`: the almost-perfectoid definition and criterion,
finite invariants, the Riemann-extension result, the inverse-limit argument,
and §§5.1–5.3. Section 5.4 was read but is not yet extracted. Most of §§2–3
and several examples still need extraction. Some §1 packages must also be
split further before final acceptance. The 72 items are therefore **not** a
claim to enumerate every result of the paper.

Direct PDF-byte retrieval failed because the execution environment could not
resolve the host, and PDF screenshot requests returned an internal error.
Accordingly `source.sha256` is null. No successful visual verification or PDF
hash is claimed. A continuation must obtain the bytes and check formula-heavy
passages visually before completing the provenance record.

## The proposed division of ownership

The full current documents for
[PerfectoidSpaces](../../../content/campaign/PerfectoidSpaces/README.md) and
[PerfectoidQuotients](../../../content/campaign/PerfectoidQuotients/README.md)
were read. Their relevant contracts are distinct.

**PerfectoidSpaces P0, P3 and P8 already own the foundational direction.**
Section 1 of André supplies the abstract almost-base setup, adjoints,
finite-projective modules, almost finite étale algebras, descent and the
Galois arguments. P0 explicitly permits a general idempotent ideal with the
required flatness/tensor hypotheses. This is important: the opening of the
older integrated PerfectoidSpaces decomposition specializes to a perfectoid
field and its valuation ideal, while its own boundary note says the general
base still needs reading. André is an additional source for the existing
**general P0 contract**, not a reason to create a second almost-mathematics
roadmap. The Galois-envelope and rigidity lemmas are auxiliary sources for
P3. Proposition 3.8.1 supplies the finite-invariant result within P8; division
by the group order is not its proof.

**The proposed Part II owns the ramified extension direction.** The name in
the JSON is `PerfectoidRamification`, titled *Perfectoid rings and spaces,
Part II: ramification and Riemann extension*. It imports P0 almost algebra,
P1 tilting/coreflection infrastructure, P2 rational localization and P3
unramified almost purity. It must also import any existing general
Banach-limit or completed-tensor supplier from the adic roadmaps. The
checkpoint's general uniform-limit item is specifically marked for that
ownership reconciliation; it is not permission to duplicate a general
construction. A keyword search found no `PerfectoidRamification` result, but
that does not replace checking the full proposed-roadmap and reserved-ID
catalogues.

**PerfectoidQuotients is not an alternative owner of this theorem.** Its
Q2–Q4 route constructs universal integral perfectoidization, André's
absolutely-integrally-closed faithfully flat extension via prisms, and
surjectivity for closed perfectoid quotients. Those are different statements
and different universal properties. In this paper, the perfectoid
coreflection is a **right adjoint**, with map `D^♮ → D`. It must not be
replaced by the prismatic universal perfectoidization, whose universal
property points in the other direction.

These are provisional routing proposals. The library and catalogue audits
listed below are still acceptance requirements; this checkpoint should not
be promoted as a final design brief.

## Proof route and its precise boundaries

Fix a perfectoid field `K`, residue characteristic `p`, and a nonzero
`ϖ ∈ K°°` with compatible p-power roots and `|p| ≤ |ϖ|`. The ramified almost
base of §5.1 is

```text
V = K°[T^(1/p^∞)],      m = (ϖT)^(1/p^∞)V.
```

For a perfected-coordinate algebra, write `g = T·1` and
`A[j] = A{ϖ^j/g}`. Where root saturation is viewed inside `A[1/g]`, retain
the stated non-zero-divisor hypothesis. Its meaning is

```text
g^(-1/p^∞)A° = ⋂_n g^(-1/p^n)A°,
```

not a union of fractional lattices.

The first essential passage is Proposition 4.2.1: the integral
root-localization models recover their input almost after inverse limit.
Theorem 4.2.2 then gives

```text
lim_j A[j]° = g^(-1/p^∞)A°.
```

It also identifies the right side as the **complete integral closure** of
`A°` in `A[1/g]`. This means closure under almost-integral elements, not
ordinary integral closure followed by completion and not merely topological
closure. Corollary 4.2.4 applies the right perfectoid coreflection to obtain
the largest spectral perfectoid subalgebra in the principal localization.
Dropping that coreflection would assert more than the paper proves.

The second passage is the inverse-limit obstruction. For Proposition 4.3.1,
with `A′` the perfectoid limit and `A` the uniform limit, the exact logical
shape is

```text
(1) ⇔ (2) ⇐ (3) ⇔ (4) ⇔ (5).
```

Conditions (1) and (2) say that `A` is perfectoid and that `A′ → A` is an
isomorphism. The remaining conditions control integral reduction and
Frobenius. The arrow from (3) to (2) must not be reversed. The ramified
version in Remark 4.3.1 gives **almost** perfectoidness and an almost
comparison of integral reductions.

Proposition 4.4.1 supplies the missing `lim¹` vanishing. Its proof uses the
nested root-localization hypotheses and summable annihilator estimates; it
does not assume that the transition maps themselves are surjective. Theorem
4.4.2 consequently constructs a fully faithful localization functor with
uniform-limit right adjoint and an isomorphic unit. It does **not** prove
that every compatible annular system lies in its essential image.

For the special tower arising from a finite étale `A[1/g]`-algebra `B′`,
Proposition 4.4.4 proves the required additional effectivity:

```text
B_j = B′ ⊗_{A[1/g]} A[j],
C = ulim_j B_j,
C{ϖ^j/g} ≅ B_j,                 C[1/g] ≅ B′.
```

The injectivity argument uses the trace pairing, and the surjectivity
argument reduces to a finite Galois envelope. Ordinary module dimension
arguments do not replace those steps.

Theorem 5.2.1 has two equivalences, extracted separately. The integral
category requires completeness, finite étaleness **modulo every `p^m`**,
and finite étaleness after inverting `g`. Inverting `ϖ` gives the category
of almost-perfectoid algebras finite étale after inverting `g`; inverting
`g` then gives finite étale algebras over `A[1/g]`. Proposition 5.2.3 also
has two distinct conclusions: almost finite étaleness modulo `p^m` uses
the ramified ideal, whereas almost finite étaleness of `B°[1/g]` over
`A°[1/g]` uses the valuation ideal `(K°,K°°)`.

Finally, §5.3 constructs the ordinary integral closure `D°` of
`g^(-1/p^∞)A°` in `B′`, and the corresponding algebra `D` after inverting
`ϖ`. Proposition 5.3.1 identifies `D` with the almost-perfectoid uniform
limit, proves integral completeness and root saturation, and compares it
almost with the ordinary integral closure of `A°`. The maximal
**perfectoid** algebra is `D^♮`. Trace almost-surjectivity requires that
`B′` be faithful over `A[1/g]`.

## Assertions deliberately not promoted

Question 3.5.1 does not authorize calling every root-saturated envelope
perfectoid. Question 4.4.3 does not supply arbitrary essential surjectivity
of the annular localization functor. Question 5.2.2 and Remark 5.2.1 do not
supply integral almost finite étaleness merely from all the modulo-`p^m`
statements. Remark 5.2.1 explains the missing almost-finiteness and why the
restricted-ideal lifting theorem of §1.8.2 cannot simply be reused: the
relevant ideal is not tight in the ramified almost setting.

Useful checks for the eventual design are `g=1` (recover unramified P3), a
finite p-group action (no division by its order), and a nonfaithful finite
étale projection `A₁×A₂ → A₁`. The last example prevents both an unjustified
injective structure map and an unjustified trace-surjectivity conclusion.
These are proposed mathematical acceptance tests, **not executed Lean tests**.

## Library audit, prerequisites and continuation

The prescribed pins are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Keyword searches for perfectoid
and almost terminology were performed. The pinned Mathlib
`Mathlib/RingTheory/Perfectoid/FontaineTheta.lean`, lines 1–115, was opened;
its broader definitions and later theorems were not all read. This does not
establish a complete tilting, almost-purity or perfectoid-ring interface.

`data/library-coverage.json` returned empty content through the file reader.
The reviewed audit therefore remains unread. Current-branch search results
are only leads, not evidence of availability at the pins. In particular,
`planned` records a read mathematical stage contract, **not** a verified
claim that the entire result is absent from both libraries. The provisional
`missing` entries require a final baseline and cross-roadmap audit.

The empty `prerequisites` list is unresolved, not a finding that all inputs
are covered. The JSON keeps separate candidates: Gabber–Ramero's almost
ring theory, Scholze's torsion paper Proposition II.3.1, and Roos's derived
inverse-limit results. The existing PerfectoidSpaces decomposition already
covers parts of Gabber–Ramero and Scholze, so neither whole source should
be called missing. Roos's journal metadata and corrected
[DOI 10.1112/S0024610705022416](https://doi.org/10.1112/S0024610705022416)
were checked; its theorem-level reading and supplier check remain. Section
2 and the applications may expose further inputs.

## Validation actually performed

The repository's `scripts/check_paper.py` was copied without alteration;
its locally computed Git blob hash is
`cf3cae9e7d2d41209bf9fa4d719fd6fe17a69f1f`, matching the fetched file.
The command

```sh
python3 scripts/check_paper.py research/blueprint/papers/PAPER-ANDRE-18.result.json
```

reported `ok`, using a **scoped local catalogue** of the verified
PerfectoidSpaces P0–P9 IDs. This checks the schema, cited owner IDs and route
multiplicity. It does not substitute for the full repository catalogue,
the reviewed library audit, source completeness, or mathematical review.
Every currently extracted provisional missing item has exactly one route.
No Lean file was required or compiled. The remaining tasks and resume
locators are in the companion handoff.
