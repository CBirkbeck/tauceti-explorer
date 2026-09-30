# Chebotarev link-map red team

Two medium omissions are submitted for independent verification: the accepted
Habiro HB.2 request, and the source-backed interfaces for the existing K-theory
U.4 target. The latter packet remains partial and unreviewed. This report does
not accept that packet or certify its full proof. The fifteen retained links
pass the checks below. The original map's eight explicit caveats are not new
findings.

Worker: Codex, session `codex-rtOQ9t`, 2026-09-30; issue #4351.
Target: `LINK-tauceti_TauCetiRoadmap_Chebotarev`.
Atlas base: `63dd274b65dec5cad2b579767df28ba8e75c8938`.
The original author `cgp-780fc5e50f71` and reviewer `codex-hjdg0j` are independent
of this worker. Only this report and its result JSON are changed.

## 1. Missing HB.2 prime-selection interface

The map's HabiroNumberFields entry says “No search match; full document not
read.” The current accepted packet explicitly requests Layer 10 for
`HB.2/chebotarev-detection` and `HB.2/local-R-is-an-isomorphism`. Both nodes,
their hypotheses and proof steps were read, together with the canonical HB.2
description. The packet is accepted as a partial plan, with open gaps; that
does not make all its mathematics implemented.

[Calegari–Garoufalidis–Zagier, arXiv v3](https://arxiv.org/pdf/1712.04887v3),
Proposition 4.2 and proof, pp. 22–23, uses a conjugacy class in a Galois closure
combining Kummer and cyclotomic conditions. Theorem 5.2 and proof, pp. 26–27,
also selects a prime with a generating Frobenius and specified congruences.
These are actual uses of the supplier, not merely shared terminology.

The proposed edge is Layer 10 → `HabiroNumberFields:HB.2`. Its reason must
retain realizability of the prescribed restrictions, finite-exception removal,
the odd-prime-power and root-of-unity hypotheses, and the consumer's Kummer
and comparison constructions. For example, when the field already contains
ζ₅, a rational prime away from 5 cannot both split completely there and be
−1 modulo 5. Density does not manufacture a compatible automorphism.

Use the canonical sentence at `content/campaign/HabiroNumberFields/README.md:24`
as consumer evidence and cite the accepted request and both node IDs in the
reason. Layer 10's infinitude and finite-symmetric-difference contract is at
`content/tau-ceti/Chebotarev/README.md:421–423`. No separate generic Chebotarev
development or effective prime bound is requested. HB.6 was also inspected,
but its constant-family argument is not included in this finding: this report
does not claim a primary-source audit of that separate argument.

## 2. Missing U.4 arithmetic interfaces

The KTheoryLowDegrees examined entry has the same negative search note. The
canonical U.4 target specifically requires the actual class-field-theoretic
inputs to Bass–Milnor–Serre, rather than a general Dedekind-domain assertion.
`research/blueprint/packets/KTheoryLowDegrees--U.1.json` makes two requests:
Layer 10 for `U.4/idelic-density-theorem` and `U.4/primes-with-norm-not-one`,
and Layer 4's cyclotomic Frobenius formula for the latter. That packet has no
accepted review. This finding rests additionally on an independent reading
of the cited source and the existing canonical target.

[Bass–Milnor–Serre, IHÉS 33 (1967)](https://www.numdam.org/item/10.1007/BF02684586.pdf),
Appendix (A.5)–(A.8), printed pp. 82–83 (PDF pp. 25–26), supplies the precise
interfaces. Prime idèle classes in each finite quotient coset use Artin
existence and abelian Frobenius infinitude. The norm corollary chooses a
nonidentity automorphism in a cyclotomic extension; arithmetic Frobenius then
identifies the nontrivial action with the residue-norm condition.

Record Layer 10 → U.4 and Layer 4 → U.4, keeping the provisional packet status
explicit. The consumer still owns the ray-class dictionary, class-field
existence import, norm argument and the eventual K-theory proof. Restrict to
number fields, m ≥ 2, absence of a primitive m-th root in the base, and primes
away from m. If the base already contains ζ₃, every residue field away from 3
contains its reduction; its norm is 1 modulo 3. This checks why the missing-root
hypothesis cannot be dropped. Neither BMS's function-field continuation nor
SK₁ vanishing follows from this link alone.

The exact canonical consumer quotation is “Use class-field-theory inputs with
their actual statements where the argument requires them.” The Layer 4
quotation includes the literal backticks around `ζ_m` and `ζ_m ^ 𝔑𝔭`.
The scratch proposal was corrected to preserve them, then passed quotation
validation. Update the examined entry alongside the links.

## Retained interfaces and adversarial checks

Read all fourteen focal layers, the original independent review, the handoff
interface ledger and unresolved records, and the reviewed AUDIT-03 status and
target notes for every focal layer. All distinct external endpoint/overlap
descriptions were read. All 37 link/overlap evidence quotations match their
canonical stage or owner document.

| Records | Contract checked |
| --- | --- |
| CH-L01–04 | Moduli, least conductor, ray characters and a uniform class-count estimate come from their existing GNF owners. No generic ray-class construction is moved into Chebotarev. |
| CH-L05–06 | Full prime cyclotomic degree/ramification and the qualitative degree-above-one discard supply the particular crossing argument; the latter is not an effective error estimate. |
| CH-L07–09 | Representation recognition and modularity retain semisimplicity/image and comparison hypotheses; prime density does not determine bad-prime monodromy. |
| CH-L10–15 | Endoscopic prime avoidance, Euler-system auxiliary primes, Taylor–Wiles selection, Heegner primes, determinant uniqueness and potential automorphy each retain their extra compatibility, image and cohomological obligations. |
| CH-O01–03 | AN.4's general endpoint stays with Chebotarev; rational Frobenius stays with NumberFieldArithmetic; finite abelian orthogonality reuses the existing library interface. |

The previously recorded S01–S05 caveats remain justified: removing an Euler
factor changes a zeta residue (over Q, removing 2 multiplies it by 1/2), but
does not change the pole coefficient of the negative logarithmic derivative;
nonvanishing on the whole boundary line is stronger than at s=1; singleton
character fibres require the abelian setting; the powered Frobenius ψ is not
a fixed-prime-set ψ; and the ray-character comparison remains an adapter.
The existing U01–U03 records already cover the unregistered effective-zero
consumer, potential-modularity route ambiguity and GeneralizedHeegner ES.1
versus transitive ES.2–5 question. They are not counted again.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, read the actual statements
and surrounding parameters of:

- `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite` in
  `TauCeti/GroupTheory/FiniteAbelian/CharacterOrthogonality.lean:123`:
  finite commutative group, domain and enough roots; the inverse is on the tag.
- `AlgEquiv.sum_inv_mul_galoisCharacterWeight_apply_of_unramified` in
  `TauCeti/NumberTheory/Chebotarev/GaloisCharacter/Orthogonality.lean:99`:
  number fields, Galois extension, commutativity mixin and unramified prime.
- The powered-class definition at line 63 and exact tail, upper bound and
  little-o statements at lines 324, 344 and 358 of
  `TauCeti/NumberTheory/Chebotarev/PrimeCounting/VonMangoldt.lean`.

Thus the tail adapter is already present, as S04 says. In C₄, a prime with
Frobenius g contributes its square to the g² fibre; a fixed-set definition
would omit it. For S₃ the one-dimensional characters cannot distinguish the
identity from a 3-cycle, so the abelian singleton condition is substantive.
No new defect is inferred from either example.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, also read
`AddChar.sum_apply_eq_ite` in
`Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean:188` with its
finite additive commutative group context, and
`Nat.forall_exists_prime_gt_and_eq_mod` in
`Mathlib/NumberTheory/LSeries/PrimesInAP.lean:442` with positive modulus and a
unit residue. These are statements read at the pin, not successful new Lean
elaborations or an exhaustive library audit.

## Discovery and graph verification

The fresh screen covered 414 JSON documents: 211 atlas extracts, nine new
roadmap definitions, 143 packets and 51 decompositions, including stage, node,
gap and request fields. It produced 224 matching records. A separate screen
of 429 Markdown documents produced 305 matching lines in 57 files. These
counts describe discovery, not full-document or whole-source reading.

Close negative checks included the ArithmeticDynamics Lech embedding chain
(explicit elementary prime selection), ClassicalArithmeticCompletion's
three-squares auxiliary prime (existing Dirichlet-in-AP), and FF.2 geometric
Chebotarev (a different finite-field contract). Kato's norm-relation prime
parameter is not itself a prime-existence theorem. GlobalGaloisDeformations
G7, GL2 R22.2 and ordinary R21.4 are already reachable from Layer 10.

The LV.1/LV.6/LV.11 links are already written in the new definition's
`requires`; that definition remains draft with a needs_changes review and its
stages are absent from the assembled atlas. This is a deferred roadmap, not
evidence that the accepted-link merger dropped three current-stage edges.

The production assembler, run without writing generated files, returns 2840
stages and 8007 distinct directed pairs. All fifteen focal pairs populate
consumer `requires`. The reused NumberFieldArithmetic and
ArithmeticDirichletSeries maps contribute their existing 14 and 16 pairs.
Neither new consumer has a forward path from the proposed suppliers, nor a
reverse path. No sibling research link map supplies the omitted pairs.

A disposable proposed packet used canonical endpoint quotations for the three
new pairs. `check_links` reports zero errors and warnings for both it and the
unchanged target. The production `merge_links` function, tested in memory
using a copied accepted marker solely to exercise its normal path, yields
8010 pairs and remains at 8010 on a second pass. It populates all three
`requires` entries and passes the production acyclicity check. This does not
constitute independent acceptance or modify the live atlas.

Source downloads matched the packet metadata: CGZ v3 SHA-256
`024317c20a1d8b66234e608af46941093a675b6399ef480dfedd52a31dcd7bf5`;
BMS SHA-256
`b455790cdaeba5e3a313f1bd4dddfe2892e8a2035067bcdef434ef717edfb996`.
Only the source sections listed above were audited here.

`check_redteam.py`, intake `check-files` for these two deliverables and
`git diff --check` pass. This report-only job has no suggested Lean file;
no compilation, cache download, library build or language server was run.
