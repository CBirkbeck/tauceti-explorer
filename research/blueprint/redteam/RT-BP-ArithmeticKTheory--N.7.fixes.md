# Fixes to RT-BP-ArithmeticKTheory--N.7

Job FIX-RT-BP-ArithmeticKTheory--N.7, issue #5555.
Author: Codex — codex-a71f92. Date: 2026-10-01.
Audit tree: f0d9a2100ac2ef14dd17813ec2458a4a5fc88d6b.

This session verified the red team in #4428 / PR #5301; it did not write
the red team or the original blueprint. It now fixes the confirmed defects
and will not perform the independent REV-FIX review of its own changes.

## Finding /1 — honest suggested signatures

The verifier's current-state qualification matters. FIX-RT-AREA-ktheory-1
(#5221) had already removed both dummy certificate structures and eight
N.8 True declarations. At this audit tree there were six N.7 True
declarations, the unstated Vandiver condition and an arbitrary eigenspace
Type stub. The existing N.8 corrections are retained, not recreated.

Removed the six remaining vacuous declarations and the arbitrary Type stub.
Corrected the header so it no longer endorses True placeholders. Replacements:

- residue_field_units_prime_to_l has a genuine signature using the units of
  the actual ideal quotient of the ring of integers of CyclotomicField l Q,
  not a newly postulated finite field. It quantifies over a maximal ideal
  lying over (l), proves the unit order l−1 and its nondivisibility by l,
  and assumes primality alone. The l=2 and l=5 examples have orders one
  and four respectively. Oddness and regularity are unnecessary.
- herbrand_ribet and eigenspace are mathematical comments until the genuine
  cyclotomic class-group quotient, canonical G-action, ZMod l-module and
  character-eigenspace interface are available. They specify P, the
  eigenspace equation, the invertible denominator l−1, odd primality,
  1≤k≤(l−3)/2, the arithmetic Bernoulli numerator and index l−2k.
  The 37 / B_32 / index-5 check is included. An arbitrary Type is not
  substituted for this missing interface, which N.7 owns.
- tameKernel_no_l_torsion is a mathematical comment giving the complete
  odd-regular-prime assertion for K₂ of the cyclotomic ring of integers,
  naming the missing K₂/tame-kernel/localisation carrier from K2SymbolsBrauer
  T.5, its twists from T.7 and Tate comparison from MotivicEtaleKTheory M.3.
- even_K_no_l_torsion and modl_K_free_over_bott are mathematical comments
  with actual conclusions, hypotheses and suppliers. The latter retains
  the coefficient ring (Z/l)[beta^(l−1)], degree 2l−2, (l+3)/2 generators
  in degrees 0, 2l−3 and 4k+1, and the l=5 rank check. No fake K-group,
  arbitrary module or vacuous proposition stands in for these structures.
- VandiverConjecture is no longer an unstated proposition or a second
  definition. Its exact class-number condition is written explicitly as
  the import contract of IntegralIwasawaTheory L3 (finding /2 below).
  A carrier example uses the pinned NumberField instance of the actual
  maximal real subfield. There is no conjecture asserted or silently assumed.
- vandiver_iff_K4i_vanishes is a mathematical comment. The GLOBAL conjecture
  at every odd prime is equivalent to joint vanishing of K_{4i}(Z), i≥2;
  a condition at one irregular prime is not that theorem. K₄(Z)=0 remains
  an unconditional imported result. The source's numerical bound is
  identified as historical, not recomputed or represented as a current record.

The packet now has a separate lemma
ArithmeticKTheory:N.7/residue-field-units-prime-to-l, with exact hypotheses,
proof steps, prerequisites, source match and acceptance cases. Its consumer
lists it explicitly. The proof uses the cyclotomic absolute norm at exponent
k=0 (rewriting l¹=l), the actual quotient cardinality and Nat.card_units;
it has no prerequisite on K-theoretic vanishing. This makes the named
arithmetic input independently reusable and prevents a circular argument.
The reader agrees with the packet and the suggested file.

The two obsolete dummy records are not restored. All six current N.8 nodes
and the entire N.8 suggested section, including its review note, are
byte-for-byte unchanged. Their comments still specify the arithmetic fields,
proof obligations, tags and the missing N.6 OrderCertificate rather than
defining a second certificate engine.

## Finding /2 — a single Vandiver owner

Although only /1 is reproduced in the generated issue's finding list, the
review JSON also confirms /2 as low severity. This is the interface needed
to fix /1 without duplicating another roadmap.

Read IntegralIwasawaTheory L3's stage contract: it explicitly owns
Vandiver(l), defined by l not dividing the class number of Q(mu_l)^+.
The available IntegralIwasawaTheory--I.8 packet/suggested file develops L0,
not an L3 predicate. There is no published L3 Lean declaration to import.

Added IntegralIwasawaTheory:L3 as a prerequisite of vandiver-separation,
and a supplier request naming that consumer and the exact defining condition.
The request includes transport from the supplier's real cyclotomic field
model to NumberField.maximalRealSubfield (CyclotomicField l Q).
The intrinsic carrier and its number-field instance exist at the Mathlib pin;
the definition is not mathematically mysterious.

The suggested file therefore records a precise owner-labelled import
contract, not a guessed module, a locally duplicated predicate, a free
proposition parameter or a proposition with an unstated body. This is the
section-13 treatment of an unpublished supplier declaration. L3 supplies
the predicate; N.7 retains the odd-character comparison, conditional K-theory
consequences and separation discipline. Publication of L3's formal interface
is an open request, not claimed as work done by this fix.

## Evidence and checks

Read the confirmed result and verification, the reviewed AUDIT-27 entries
for N.7/N.8, the current suggested file and the affected packet and reader
sections. The inherited needs_changes review, four source/certificate gaps,
sourceIssues, reviewHistory and sourceVersions are unchanged. This fix
does not supply the Gaussian span proof or the independent generation proof
for Q(sqrt(5)), and does not claim to complete either certificate.

Downloaded the author-hosted K-book again and verified the existing SHA-256:
a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845.
Reread VI.8.3.2 (PDF p. 522), the paragraph before Table 10.1.1 (p. 535)
and VI.10.5–10.8.2 (pp. 538–540); inspected p. 540 as an image.
Source: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf.
The new residue lemma cites the single-prime localisation as its motivation
and the pinned Mathlib arithmetic as its proof, not a fictitious separately
stated theorem in the book.

Personally read all seven added baseline declarations and their hypotheses
at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174:
NumberField.maximalRealSubfield, NumberField.of_subfield,
IsCyclotomicExtension.Rat.absNorm_span_zeta_sub_one, Ideal.absNorm_apply,
Submodule.cardQuot_apply, Nat.card_units and Ideal.Quotient.field.
Also checked the cyclotomic field number-field instance, classNumber,
prime uniqueness and inertia-degree-one statements. Ideal.Quotient.field
is a noncomputable abbreviation, not an automatically installed instance.

The actual repository check_blueprint.py at the audit tree, with the shared
pinned declaration index, reports **0 errors, 0 warnings**: 15 nodes,
37 baseline declarations, 24 API items, 18 definition unit tests,
6 planets, 4 gaps, 10 requests. The new lemma additionally has its two
explicit Lean examples and three acceptance cases. All implementation
statuses are unchecked and the packet remains partial.

Static/regression checks confirm zero vacuous theorem declarations,
zero proposition definitions with unstated bodies, zero dummy records,
zero arbitrary eigenspace types and zero new Vandiver definitions.
Every original node id survives. Only the tame-kernel and Vandiver nodes
change; one residue lemma is added. All N.8 nodes and suggested comments,
and the prior review/gap/provenance records, are preserved.

Ran the real atlas assembler against immutable Git blobs, without a new
checkout or repository snapshot. To isolate this fix from earlier pending
N.8 edits, compared hypothetical promotion of the current research packet
before and after this fix, not the older promoted packet. The full
stageEdges-plus-requires union has **8624 → 8625** distinct pairs.
Exactly one pair is new: IntegralIwasawaTheory:L3 → ArithmeticKTheory:N.7.
All preceding pairs survive. The route appears in requires and consumers,
is not skipped by the assembler and has no return path, hence introduces
no cycle. This is a dependency regression test, not review acceptance
or promotion; the live assembled graph still has 8622 pairs.

The suggested Lean file is **not compiled**. The available Tau Ceti
checkout is at another commit, with no existing pinned library build.
No Lake project, update, cache download, library build or language server
was started. Scratch stayed below 1 GB. Only the four issue deliverables
are submitted; no campaign or data file is edited. Independent
REV-FIX-RT-BP-ArithmeticKTheory--N.7 must judge these changes before promotion.
