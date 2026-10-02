# Independent review of the N.7 arithmetic K-theory fixes

Refs #5556. Codex — `codex-rtOQ9t`, 2 October 2026.
Reviewed fixer `codex-a71f92`, [PR #5594](https://github.com/CBirkbeck/tauceti-explorer/pull/5594),
at base `c9a6e56`. This session did none of that fix. Its earlier work on
Arithmetic N.1 is not the N.7 fix under review. Claim 5945152006 was
confirmed by the bot, and the entire issue was reread afterwards.

**Overall verdict: `needs_changes`; both targeted findings are addressed.**
The N.7 signature and ownership repairs are sound. The packet also contains
N.8, whose independently reviewed certificate-generation objections remain
unresolved. I preserve that earlier review verbatim in `reviewHistory` and
retain its negative overall disposition. This is a completed review, not
a checkpoint, a proof of the missing certificates or an elaboration claim.

## /1 — Vacuous suggested declarations: corrected

I read the complete current 305-line suggested file, the verifier's
current-state qualification and the affected packet nodes. The six remaining
N.7 `True` theorems, the unstated proposition and the arbitrary eigenspace
carrier are gone. The two obsolete dummy records and eight old N.8 `True`
declarations had already been removed by the area fix; the current fix
correctly preserves that work and N.6's certificate ownership.

The replacements have distinct mathematical meanings:

- **Residue units:** the theorem uses the actual quotient of the ring of
  integers of `CyclotomicField l ℚ` by a maximal ideal lying over `(l)`.
  Its conclusion is unit-group order l−1 and nondivisibility by l.
  It assumes primality, including l = 2, and assumes neither regularity
  nor oddness. The separate packet lemma names all arithmetic inputs and
  the tame-kernel application imports it explicitly.
- **Herbrand–Ribet:** a comment specifies the actual localized class-group
  quotient P, canonical G-action, `ZMod l` module, character eigenspace
  equation and denominator l−1. It keeps odd primality, the finite k range,
  arithmetic Bernoulli convention and character index l−2k. N.7 owns the
  missing interface. An arbitrary type is not substituted for it.
- **K-theory consequences:** comments state the odd-regular-prime tame-kernel
  vanishing, even-group torsion conclusion and finite-coefficient Bott module
  with their missing carriers and suppliers. The coefficient ring, Bott
  degree, generator count and degrees are preserved. The Vandiver consequence
  quantifies the global conjecture and joint vanishing, rather than asserting
  global vanishing from a hypothesis at one prime.

The residue lemma's proof route matches the pinned statements. Identify the
prime with `(ζ−1)`, rewrite l¹ = l to specialize the prime-power absolute
norm theorem at k = 0, identify absolute norm with quotient cardinality,
install the quotient's field structure locally, and apply `Nat.card_units`.
The cyclotomic norm theorem handles p = 2, including its k = 0 case. Its
prime uniqueness hypothesis is satisfied by maximality and lies-over;
there is no appeal to a K-group vanishing theorem.

The resulting two Lean examples have unit orders 1 and 4 at l = 2 and 5.
Independent finite arithmetic checks at 2, 3, 5 and 37 distinguish field
cardinality from unit cardinality; the composite-ring counterexample ℤ/4
has two units, demonstrating the need for primality. This is a finite
arithmetic diagnostic, not a formal proof of the number-field norm theorem.

The source comparisons and elementary controls also agree: B₃₂ has numerator
divisible by 37 and character index 5; at l = 5 the four Bott-module
generator degrees are 0, 1, 5 and 7, producing ranks
1,1,0,0,0,1,0,1 modulo 8. These tests cannot replace the unread
Herbrand–Ribet proof or the missing K-theory interfaces.

## /2 — Vandiver ownership: corrected

Read IntegralIwasawaTheory's L0 and L3 contracts. L3 explicitly owns the
predicate defined by class-number nondivisibility in the real cyclotomic
field. The affected node now cites `IntegralIwasawaTheory:L3`, with a
request for that predicate and transport to the intrinsic pinned
`NumberField.maximalRealSubfield (CyclotomicField l ℚ)` model. N.7 retains
the odd-character comparison and conditional K-theory consequences.

The available I.8 packet lists L3 in scope but its coverage is `not_read`;
its actual nodes are all parented in L0 and supply no Vandiver predicate.
The suggested file likewise has no L3 declaration. Consequently the N.7
file correctly records a precise supplier contract instead of inventing
an import, redeclaring a predicate or introducing an unconstrained proposition.
The real-subfield carrier has the pinned number-field instance. This
establishes that the class-number condition can be stated; it does not
prove or assume the conjecture.

The live stage graph has no return path that would prevent L3 supplying N.7:
adding L3 → N.7 to the assembled graph gives an acyclic graph. The request
and prerequisite agree. No other roadmap's definition is reconstructed here.

## Corrections made during this review

The suggested comments already labelled the source's numerical bound historical
and made the global quantifiers explicit, but the packet statement still
presented the 163-million verification bound and the >10⁸ order restriction
as undated facts. I qualified both as statements of the inspected 2013 source,
without asserting a latest computation or current status. The packet now
explicitly says joint vanishing of K₄ᵢ(ℤ) for every i ≥ 2 is equivalent to
the global Vandiver conjecture at every odd prime. The corresponding proof
step also labels the verification bound historical. No new numerical claim,
conjectural assumption, node, API or dependency is introduced.

Only that node's prose and the review metadata/history change. The suggested
file already carries these conventions and is byte-for-byte unchanged.
The issue does not authorize editing the reader or supplier files.

## Remaining reason for `needs_changes`

The previous [area review](REV-FIX-RT-AREA-ktheory-1.md), finding /11 and
its work-still-required paragraph for N.7, requires two independent
generation proofs. They are still absent from the current N.8 nodes and
their explicit gaps:

1. The empty Gaussian tame-kernel presentation needs the span/vanishing
   proof for K₂(ℤ[i]). An empty list of proposed generators does not prove
   the actual group is trivial.
2. The ℚ(√5) example has the valid sign-character lower bound four, but
   still needs a proof that `{−1,−1}` and `{−1,ε}` generate its integral
   tame kernel. That gives the independent upper bound. The Birch–Tate
   numerical equality is a consumer check and cannot supply that proof.

The fixer explicitly did not claim to complete either certificate, and
neither targeted finding asks for their construction. I confirm the
successful N.7 repairs without using them to erase the outstanding
objections in the same packet. The next certificate work must source and
decompose those generation arguments, then synchronize the certificate
interfaces and examples before accepting the overall packet. All four gaps
and ten requests, including the L3 import, remain intact.

## Evidence and validation

Read the full red-team result, both verifier decisions, the complete fix
report, all N.7 changed-node contracts and the prior area review's N.8
objections. Read the reviewed `AUDIT-27` coverage of N.7 and N.8: supporting
arithmetic exists, while regular-prime K-theory, class-action/eigenspace
interfaces and the certificate calculations remain unimplemented.

Freshly downloaded the public
[K-book combined draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf),
dated 29 August 2013, SHA-256
`a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.
Read PDF pp. 522, 535 and 538–540: VI.8.3.2, the paragraph before
Table 10.1.1, VI.10.4.2–10.6 and VI.10.8–10.8.2, including the source's
finite verification bound and its global equivalence. The new residue
lemma is a consequence of pinned arithmetic, not a separately stated
theorem in that book. No new published-edition or archived-errata check,
or acquisition of the unread certificate papers, is claimed.

Personally read all seven added declarations at
[Mathlib 082e2d3](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174):
`NumberField.maximalRealSubfield`, `NumberField.of_subfield`,
`IsCyclotomicExtension.Rat.absNorm_span_zeta_sub_one`, `Ideal.absNorm_apply`,
`Submodule.cardQuot_apply`, `Nat.card_units` and `Ideal.Quotient.field`.
Also read class-number definition, cyclotomic number-field instance,
prime uniqueness and inertia-degree-one statements with their surrounding
hypotheses. `Ideal.Quotient.field` is a noncomputable abbreviation requiring
maximality, not an automatically installed field instance. This is the
fix's baseline delta, not a claim to reread every unchanged baseline entry.

Checks at the review base and final working tree:

- Pinned-index `check_blueprint.py`: **0 errors, 0 warnings**; 15 nodes,
  37 baseline declarations, 24 API items, 18 definition/construction tests,
  six planets, four gaps and ten requests.
- Static declaration checks find no vacuous theorem, unstated Vandiver
  proposition, dummy certificate or arbitrary eigenspace carrier. The genuine
  quotient signature and the exact ownership request were checked directly.
- The 24 internal prerequisite pairs are acyclic. Actual assembly:
  2,956 stages and 8,639 stage pairs, acyclic; the hypothetical L3 import
  overlay has 8,640 pairs and remains acyclic. This is a dependency check,
  not promotion.
- All original node IDs, N.8 nodes, suggested-file bytes, ownership,
  prerequisites, API/tests, coverage, gaps, requests, planets and provenance
  are preserved. Only the stated Vandiver prose and review records change.
- Intake validation and `git diff --check` pass for the two changed files.

**Suggested Lean not compiled:** no matching existing build at both pins.
No new project, cache download, library build or language server was started.
All implementation statuses stay unchecked; the packet stays partial.
