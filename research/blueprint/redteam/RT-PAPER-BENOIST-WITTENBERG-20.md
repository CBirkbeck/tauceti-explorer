# Red team: Benoist–Wittenberg I

Complete audit for #4172 by Codex, session `codex-rtOQ9t`, 1 October 2026.
Three findings: two high, one medium. The input extraction and review were
written by other sessions. This submission changes only the two red-team
deliverables and awaits independent verification.

## Evidence and scope

The input baseline is `922d4b9cac90c9a35f63f11fba577fb274426035`.
I read the entire [published article](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf),
pp.1–77, including proofs and references, and compared the 193 extracted
statements and their proof descriptions with it. Its SHA256 is
`daeb43ec861bd6c30564543dac796c55c7f21aa943c442f826b32613e72a46a9`, matching
the extraction. All locators below use the published numbering. Pages 14, 19
and 50 were also inspected as rendered images.

The JSON and reader, both accepted-review files, all seven routes, the
conventions and existing source-issue register were checked. This is not a
recursive audit of every cited supplier: PROTOCOL §16 permits a cited result
as one extraction item. I independently read the specific supplier passage
needed for finding 2, [SGA4 XVIII §3.2.6](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf),
printed p.586, PDF p.78. Both sources were accessed on 1 October 2026.

## 1. High: Geyer's criterion uses the wrong map

**Location:** `/geyer` in the extraction, routed to MC.7; its immediate
consumer is `/phi-genus`.

The extraction makes the Brauer obstruction on invariant Picard 2-primary
torsion surjective in even genus. Published Lemma 3.7, p.50, instead concerns
surjectivity **from Pic(B)[2∞] to Pic(B_C)^G[2∞]**. The Brauer map is the next
arrow in exact sequence (3.6), not the arrow of the lemma.

The anisotropic conic

\[
B:\ x^2+y^2+z^2=0\quad\text{over }\mathbb R
\]

is a complete counterexample to the extracted statement. It has no real
points and genus zero. Its complexification has Picard group Z, so the
invariant 2-primary torsion is zero. The proposed surjection is therefore
`0 → F2`, which is impossible. The actual lemma's map is `0 → 0`.

Correct `/geyer` to the paper's map. Equivalently, the Brauer obstruction on
2-primary torsion is zero for even genus and surjective for odd genus.
Preserve the ownership and parity sublemma; check the use in `/phi-genus`
with the corrected arrow. The published lemma is not at fault, and this
finding does not reopen the already recorded dimension exception E1.

## 2. High: finite exponent does not imply perfect algebraic duality

**Location:** `/semialg-duality`, the source-issue register and the shared
`EquivariantTopologyRealVarieties` handoff.

The extraction follows (1.16), p.14, in allowing locally constant stalks of
finite exponent. It asserts a perfect pairing of ordinary abelian groups,
without adding finite stalks or a continuous-dual interpretation. The cited
SGA statement has a constructibility hypothesis that prevents the following
counterexample.

Take the semialgebraic homology manifold V to be one point and let

\[
M=\bigoplus_{n\in\mathbb N}\mathbb F_2,
\qquad M^\vee=\operatorname{Hom}(M,\mathbb Q/\mathbb Z)
\simeq\prod_{n\in\mathbb N}\mathbb F_2.
\]

This is a locally constant stalk of exponent two. Degree-zero duality is
evaluation. For an algebraically perfect pairing, the evaluation map
`M → Hom(M^vee,Q/Z)` must be an isomorphism. It is not surjective.

Indeed, the quotient of the product by its finite-support subspace is
nonzero (the all-ones sequence has nonzero image). Choose a nonzero linear
functional from that quotient to F2 and pull it back to the product. It
vanishes on every coordinate vector but is nonzero. An evaluation by an
element of M is a finite sum of coordinate functionals; if it vanishes on
every coordinate vector, every coefficient is zero. Thus this functional
cannot be an evaluation.

The repair is to require finite abelian stalks for the algebraic perfect
pairing. Record the inherited omission in `sourceIssues`, with this
counterexample and the constructibility condition in SGA4. A wider
topological or one-sided statement needs its own precise contract and proof;
it cannot silently supply the algebraic biduality asserted here.

This does not refute Proposition 1.10: `/complement-duality` already assumes
a **finite** G-module. `/psi-real` uses F2 and is also unaffected by this
restriction. `/integral-pontryagin` separately retains the profinite
completion and Pontryagin dual, which must remain explicit. The problem is
the exported general theorem, not these finite-coefficient applications.

A bounded search for a correction using the title, author names and
erratum/corrigendum terms found no matching correction. This is not a claim
that none exists.

## 3. Medium: E5 introduces an incorrect degree sign

**Location:** `sourceIssues/E5.correction` and the E5 bullet in the reader.

E5 repairs the domain of the ordinary real-locus pushforward but says its
target has degree `p−c`. The rendered formula on published p.19 has `p+c`,
where the same section defines `c=dim X−dim Y`. The theorem item
`/real-push-coordinates` already has this correct degree.

The sign matters even for the closed embedding of a real point in P¹.
Here c=1 and the generator in H⁰ of the point pushes to the nonzero point
class in H¹(RP¹,F2). Degree `p−c` would put it in H⁻¹=0.

Correct the target to `H^(p+c)(X(R),F2)` in both E5 copies, while retaining
the domain correction to `H^p(Y(R),F2)`. The published degree was correct;
only the domain was a source typo. The previous review explicitly recorded
that it could not resolve the target exponent, so this finding supplies the
missing visual check rather than attributing an unsupported claim to it.

## Checks that did not produce findings

The seven library items were checked against actual declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. These include the real-closed-field
class, derived category and localization, sheaf cohomology, the algebraic
cycle carrier and weighted pushforward, cyclic cohomology, Shapiro and the
Hodge-structure carrier. `groupCohomology.coindIso` is in
`Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean:59`;
the similarly named representation comparison in `Coinduced.lean` is a
different declaration. The generic carriers do not implement the paper's
geometric comparison and duality theorems. The two complex norm-square facts
cited for the existing E3 argument also exist at the pin.

I read the relevant reviewed library coverage and current contracts for
SF.2/SF.4/SF.5, MC.0/MC.2/MC.7, M.5, EDC.2/EDC.3 and LD.6, and the full
upstream HodgeStructures and AlgebraicTopology roadmaps. The fresh assembly
has 2907 stages and 8322 stage edges. The two Part II proposals explicitly
reuse the IDs already routed by Benoist19; the quadratic-form ID also agrees
with Jannsen16. The bounded owner search found no new duplicate. Missing
exact coverage entries were not interpreted as evidence of implementation.

All 193 item IDs are unique. Their prerequisite graph has no dangling
reference or cycle. Each of the 177 missing items is routed once, with no
duplicate route assignment. The previously recorded broad-stage integration
ordering problem remains explicit. Known source issues E1–E4 and E6–E10
were not repackaged as new findings.

The report does not claim to verify every secondary proof, prove global
library absence from keyword searches, or establish an implementation. No
Lean build or language server was started; there is no Lean deliverable.

Validation: `scripts/check_redteam.py`, `research/blueprint/intake.py
check-files`, and the staged whitespace check were run for these two files.
