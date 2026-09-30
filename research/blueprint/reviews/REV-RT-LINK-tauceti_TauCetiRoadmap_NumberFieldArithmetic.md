# Independent verification of the NumberFieldArithmetic link findings

Both medium findings are **confirmed**. This review verifies their evidence
and proposed input routes; it does not re-audit the entire 61-link packet or
close the Faltings decomposition's imported-theorem gap.

Codex, session `codex-rtOQ9t`, 2026-09-30; issue #4344. Claim comment
5911800382 was confirmed by bot comment 5911802734, after which the whole
issue was reread. Base: `ef592ec09e45a367015ca9716965e3910afe2d47`.
The map's authors were ChatGPT cgp-866dc6aebdcc and Claude local claude6/2;
its reviewer was codex-a71f92 and its red-team author codex-J6LwjP. This
verifier did none of those jobs.

## Finding 1: finite unramified composita feed R02.3

The physical NumberFieldArithmetic README, §1.5, explicitly plans closure
of finite unramified extensions under compositum. Its source contract has
not changed into an infinite Galois construction. The full R02.3 description
in `content/campaign/ArithmeticGaloisDuality/README.md` requires constructing
G_{F,S}, in addition to the subsequent cohomology theorems.

The link map's `examined` entry nevertheless concludes that this roadmap
has no NFA use, describing only local Galois/cohomological objects. I also
read its accepted NFA1 → IntegralIwasawaTheory:L1 link: that link correctly
recognizes the same finite-compositum input without assigning the infinite
extension or inverse limit to NFA. This supplies an internal consistency
check, not a substitute for the actual R02.3 obligation.

[Milne, Arithmetic Duality Theorems, second edition, I §4, p. 48
(PDF page 56)](https://www.jmilne.org/math/Books/ADTnot.pdf) defines the
maximal restricted-ramification subfield of a fixed separable closure and
its Galois group. I read that opening passage and its place conventions.
For the finite-subextension construction, composita must preserve
unramifiedness at each finite place outside S. Conjugates must be compared
over the same base; taking their finite compositum gives the needed normal
closure. These finite arithmetic steps precede the union and topological
Galois quotient. This dependency is an inference from the source definition
and the two roadmap contracts, not a claim that Milne's paragraph proves
the whole construction.

The partial, unreviewed `ArithmeticGaloisDuality.json` node
`R02.3/restricted-ramification-group` and its NFA1 request explicitly
describe this construction. They corroborate the accepted stage's meaning;
their unreviewed status is retained. In particular, their potentially
infinite S must not acquire a finite-S restriction merely from choosing an
available finite-set library lemma.

The reviewed AUDIT-04 Layer 1 coverage distinguishes existing unramified
predicates/tower descent from the compositum target. I read
[NumberField.isUnramifiedAway_of_intermediateField at Tau Ceti
f790474](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/UnramifiedTower.lean#L53),
including its number-field, scalar-tower and `Finset` hypotheses. It
descends unramifiedness from a top field to an intermediate field. It does
not state compositum closure or construct the infinite extension. I do not
claim a fresh whole-library absence search.

**Fix:** add the inferred NFA Layer 1 → ArithmeticGaloisDuality:R02.3 link,
with the §1.5 compositum quotation and R02.3's construction sentence as
two-sided evidence; correct the `examined` entry. Keep normal closure, union,
Krull topology, the absolute-Galois quotient and cohomology with their
consumer/suppliers. The pointwise finite-place input works independently of
the finiteness hypotheses required by later cohomology theorems.

## Finding 2: discriminant and different inputs feed accepted Faltings descent

I read the full accepted Hermite–Minkowski child node, its recorded gap,
its individual verified review entry, its link to the bounded-height
semiabelian-model node, and that consumer's descent steps. The decomposition
is accepted and integrated but remains **partial**; verification of a
faithful imported statement does not certify its missing proof.

The current R28.1 parent explicitly includes descent from moduli points to
isomorphism classes. The map's `examined` decision, which discounts a
Lawrence–Venkatesh attribution, overlooks this stronger accepted evidence.
No reliance on that external attribution is needed.

I freshly read [Faltings 1983, §3, printed p. 357](https://math.uchicago.edu/~drinfeld/Deligne%27s_conjecture_Manin_conf/Faltings_argument/Faltings.pdf)
on the PDF page image. Lemma 4 states finiteness for prescribed-degree
extensions unramified outside a finite S; its entire proof is
“Bekannt (Hermite-Minkowski).” The preceding proof uses the lemma to obtain
a finite extension containing the required division points and carry out
descent. Thus the accepted packet correctly records an imported theorem,
not a discriminant-bound proof extracted from this page.

I read NFA §§4.2, 5.9, 5.10 and 6.3–6.4, preserving these boundaries:

- Layer 4 gives relative discriminants and their tower formula, including
  reconciliation with the absolute signed discriminant via an ideal.
- Layer 5.9 compares the global and completed different. Layer 5.10 weights
  local different exponents by residue degrees; the weights cannot be
  dropped when assembling a discriminant exponent.
- Layer 6.4 gives the global wild bound
  `e ≤ v_P(different) ≤ e − 1 + v_P(e)`, with its separate bridge from the
  local natural-number valuation to global ideal multiplicity. It is for
  number fields, whose completed residue extensions are separable. The
  upper bound is an inequality, not an equality in every wild extension.

The reviewed Layer 4–6 coverage identifies these planned bridges and the
already-built algebraic tower theorem. I checked the relevant declarations
directly, rather than infer their signatures from the audit:

| Pinned declaration | Actual interface |
| --- | --- |
| [TauCeti.relDiscr_tower](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/DedekindDomain/Discriminant/Separable.lean#L50) | Dedekind-domain tower, finite and torsion-free module hypotheses, scalar tower, and separability of the top fraction-field extension. The exponent is `Module.finrank B C`. |
| [NumberField.finite_of_discr_bdd](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean#L496) | A finite set of finite-dimensional intermediate fields over ℚ in a fixed characteristic-zero field A, satisfying an explicit absolute discriminant bound by a natural N. |

I also read the reviewed EffectiveBounds Layer 2 target list. Its qualitative
and effective bounded-discriminant results do not supply the omitted bound
from a fixed degree and a ramification set by changing a theorem's name.

To check the mathematical relevance of the proposed inputs, write n=[L:K]
and d_P for the local different exponent. At a fixed finite base prime
p above a rational prime ℓ, the global bound uses
`v_P(e_P)=e_P v_p(e_P)`; `1≤e_P≤n` bounds the latter in terms of K, p and n.
Summing `f_P d_P` and using `Σ e_P f_P=n` bounds the relative discriminant
exponent. Outside S it is zero. The tower formula then converts the finite
set of relative bounds into an absolute bound. This is the verifier's
interface check, not a new reviewed decomposition of the missing theorem:
the uniform estimates, all normalization lemmas, fixed-closure counting and
application of Hermite finiteness must still be supplied in the consumer's
proof plan.

**Fix:** add inferred NFA4 → R28.1 and NFA6 → R28.1 links. Quote the tower
formula and wild bound on their supplier sides and the parent's descent
clause on the consumer side; name the accepted Hermite–Minkowski child and
its gap in the reasons. Correct `examined`. Reuse the landed tower theorem,
retain the Layer 5 bridge and weighted assembly, and keep the existing gap
open. A future general owner of the completed theorem should become the
intermediate supplier. Adding these links supplies neither an infinite
extension construction nor a completed finiteness theorem.

## Current graph and diagnostic repair

Read-only production assembly at the base has 2,840 stages and 8,007 edges.
I checked all three proposed pairs for direct edges, forward reachability
and reverse reachability. All are absent. Neither proposed Faltings source
reaches the integrated Hermite–Minkowski child either.

A conservative union includes the assembled edges, declared stage
requirements, all 36 research link packets and the declared requirements of
research-roadmap stages. It has 8,406 distinct pairs. None of the proposed
pairs gains a forward or reverse path there. This union tests possible
conflicts without treating unreviewed research material as accepted work.

A scratch copy of the accepted link map adds exactly the three inferred
links, each with literal two-sided evidence and the restricted reasons
above. The existing 61-link map and the 64-link scratch proposal both pass
`check_links` with zero errors/warnings. Calling `merge_links` on a copy of
the actual assembly produces an acyclic 8,010-edge graph and installs each
supplier in its target's `requires`. A second merge still has 8,010 edges.
Only graph-edge membership is claimed idempotent; evidence metadata may
accumulate. The accepted map and production data were not changed.

## Evidence integrity and submission checks

All reads are dated 2026-09-30. The public Faltings PDF has SHA-256
`0b7fb3e505d5d63e3e6c5913daf15bd843488e59f80f8d5176b154ac8faa3fc2`.
Milne was read through the public PDF text at the link above; no local
binary hash is asserted for that source.

| Inspected repository input | SHA-256 |
| --- | --- |
| Accepted NFA link map | `28eda9a75a209959ed2575f52d6da5c8ceaecf4396477ff19dd82fb5fde18647` |
| Red-team result | `a0dc67efd8724d1135b4414e9dee1db0d42c42a7ff7e7ddd56594763d7ed68ac` |
| Accepted Faltings decomposition | `fbc9c9750c94be25bca07dd87a5899e8d099a2e392e0326b35d2ed0fa09a8357` |
| NFA README | `780a031c02c365a0e96a31ca71b6d7064f95cdfc99e41132f7328a3fad8fa0ed` |

Both findings receive exactly one verdict in the review JSON. The red-team
checker passed, deliverable intake reported two files and zero problems,
and the staged whitespace check passed. No Lean file was changed or compiled; no library build or
language server was started. This review claims the evidence and graph
checks above, not formalization of the planned arithmetic.
