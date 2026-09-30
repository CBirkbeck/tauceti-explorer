# Fixes to the modern Serre closure and export

**Job:** FIX-RT-BP-ClassicalSerreModularity--R33.5, issue #5189.
**Agent/session:** Codex / codex-rtOQ9t. **Date:** 2026-09-30.
**Base:** a93cd5e. All five confirmed findings in the
[verification](RT-BP-ClassicalSerreModularity--R33.5.review.json) are addressed,
including its two low-severity scope extensions. The packet remains partial;
the fix awaits independent review and certifies no formalized Serre theorem.

## /1 — conditional export without the classical proof edges

`R33.6/elliptic-curve-export-via-either-route` now assumes the strong conclusion
for the given residual representation: a newform with exact weight k(ρ̄), level
N(ρ̄), nebentypus reducing to ε(ρ̄), and the coefficient-place residual
isomorphism. It does not obtain that hypothesis by importing the proved
classical endpoint or its unconditional finite-flat export. Both edges are
removed.

The four prerequisites are the exact existing definition/local-weight/
nebentypus nodes and the modern strong theorem:

- `AlgebraicModularFormsAndSerreWeights:R15.6/s-type-arises-from-and-modular`;
- `AlgebraicModularFormsAndSerreWeights:R15.4/weight-two-iff-finite-flat-at-p`;
- `SerreWeightAndLevelOptimisation:R20.4/nebentypus-congruent-character`;
- `ClassicalSerreModularity:R33.6/strong-form-by-the-modern-route`.

Finite flatness and the inertia determinant give k=2; the determinant formula
gives ε=1. Apply the supplied strong conclusion, then Carayol at p≥5 to make
the characteristic-zero nebentypus trivial without changing weight or level.
The proof now states that step explicitly: reducing to the trivial character
does not by itself make a character trivial. The coefficient prime, residual
isomorphism and trace congruences remain part of the export. The local supplier's
Raynaud F-vector-space obligations beyond F_p are retained, not replaced by an
unqualified group-scheme-of-type-(p,p) assertion.

The suggested signature spells out the hypothesis for this ρ̄ and uses the
pinned newform carrier with its actual level/weight parameters and character
field. The missing Galois and coefficient-place interfaces remain commented
planning signatures. No new `StrongSerre` definition is introduced: R27.6 owns
the single statement. **Maintainer handoff:** coordinate the existing R27.6
export as an instance of this shared conditional API. This fix does not edit
the supplier packet or create another unconditional finite-flat theorem.

## /2 — use the system KW actually constructs

The auxiliary-prime lemma is restricted to the system in KW I Theorem 5.1(1)
for dyadic k=2 or (2) for k=4, supplied by
`R24.5/kw-theorem-5-1-systems`, with its exact two R24.3 lift suppliers.
KW's definitions on p.8 make irreducibility and oddness properties of every
characteristic-zero member; its theorem on p.9 supplies those properties.
At an odd prime p>3 with unramified local parameter, the almost-strict clause
supplies crystallinity with weights {0,1}, including when the residual member
is reducible. Fontaine–Laffaille and DP Lemma 1.14 apply in the irreducible
residual branch; its alternatives p=3 or p=1 are excluded.

The former cross-characteristic Chebotarev/Brauer–Nesbitt step and the
unsupported determinant-character assertion are removed. The arbitrary-system
irreducibility bridge is unnecessary, so no rank-one companion request is
added. The reducible **residual** branch still invokes DP Theorem 1.6;
characteristic-zero irreducibility does not erase that branch. Modularity
transfer uses the distinct R24.6 supplier, whose proof compares each member
with Deligne's modular system at the same coefficient prime.

## /3 — exact suppliers and the still-partial audit

The exact current supplier statements, hypotheses and prerequisites were read:

| Need | Node imported |
| --- | --- |
| DP 1.9(1) | R24.3/theorem-5-1-part-1-minimal-crystalline |
| DP 1.9(2) | R24.3/theorem-5-1-part-2-weight-two |
| The selected dyadic system | R24.5/kw-theorem-5-1-systems |
| DP 1.11 for a given lift in the qualitative route | R24.5/dieulefait-families |
| DP Remark 4 | R24.6/linked-systems-modularity-transfer |
| Existing globalisation audit | R32.6/globalisation-dependency-audit |
| S-type, arises-from, N/k/ε and coefficient conventions | R15.6/s-type-arises-from-and-modular |

The first five are in `PotentialModularityAndCompatibleSystems--R24.3.json`,
the audit in `GL2ModularityLifting--R32.3.json`, and the definition in
`AlgebraicModularFormsAndSerreWeights.json`. All are **partial, unreviewed
supplier plans** at this snapshot; exact node imports do not mark them proved.
The packet's `supplierChecks` records that status.

Broad R24.3/R24.6/R15.6 requests whose needs are now exactly stated are removed.
System existence and modularity transfer have separate node references rather
than one R24.6 request. The remaining R32.6 request names the existing partial
audit and its unfinished Tung/Gee obligations: [CEG+16] patching,
Emerton–Paškūnas faithfulness, BLGG13 Theorem A.4.1 and Gee Theorem 4.4.12.
Their supplier work is already routed to R31.6/R20.6. The gap also preserves
any still-unaudited lift/system input. It does not claim a new completed audit.

`modern-and-classical-modularity-agree` retains the eigenform/newform
comparison that R15.6 explicitly leaves open. **R17.6 and R20.6 stage edges
and requests are unchanged:** the former needs Rohrlich–Tunnell, and no current
R20.6 node supplies the dyadic k=4 weight-two-to-weight-four step. No supplier
packet is modified.

## /4 — accurate comparison of the two routes

The summary, comparison title and reader now distinguish: independence of the
qualitative argument from KW's induction; shared use of KW I Theorem 5.1;
shared use of `R27.4/strong-form-by-minimal-lifts` throughout odd p and dyadic
k=2; and indispensability of that refinement only in the scalar dyadic
non-dihedral case. This finding does not change the comparison node's already
correct statement or its edges. The reader's source-issue range is E3–E9.
No new source issue or independent acceptance is asserted.

## /5 — the pinned modular-form carriers exist

The suggested file no longer says modular forms are absent. Statements read at
Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174**:
`ModularForm` and `CuspForm`, `NumberTheory/ModularForms/Basic.lean:74,84`.
At Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**:
`TauCeti.cuspFormsOld` (`Newforms/Basic.lean:103`),
`HeckeRing.GL2.Newform` (`Newforms/Newform.lean:102`), and
`HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq`
(`Newforms/StrongMultiplicityOne.lean:87`). The latter is the fixed-level,
fixed-nebentypus statement with equality of good eigenvalues outside a finite
set; it is not claimed to supply every eigenform-to-newform comparison.

The residual G_ℚ and Serre-modularity interfaces remain absent, consistently
with the reviewed AUDIT-31 entries for R33.5/R33.6. The standard note now makes
that distinction. The executable arithmetic examples are byte-for-byte
unchanged; the mathematical signatures remain comments.

## Sources and checks

The public PDFs were fetched again and matched the packet's existing hashes:

- [KW I author preprint](https://www.math.ucla.edu/~shekhar/papers/results.pdf),
  23 pages, SHA256 `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82`.
  Read the relevant passages on pp.2–3 and 8–9.
- [Dieulefait–Pacetti v2](https://arxiv.org/pdf/2108.07577v2), 17 pages,
  SHA256 `0c6850dafda032f7a4008947c519b5aef8cc13762207bb67c36810170a8eebe6`.
  Read pp.6–8 and 15: the lift theorem, compatible-system definitions and
  theorem, Remark 4, bad-dihedral bound and characteristic-two closure.

Read date: 2026-09-30. The local TLS trust-chain check failed; the public PDF
retry disabled certificate verification and independently matched both
previously recorded hashes. No new version or source-issue verdict is inferred.

Dependency regression checks use prerequisite edges from each node to its
suppliers, treating unresolved/stage/baseline references as frontier leaves:

| Graph | Modern export before → after | Forbidden classical-proof nodes before → after |
| --- | --- | --- |
| Integrated decomposition, overridden by the three ClassicalSerreModularity packets | 119 → 63 reachable references | 33 → 0 |
| Integrated decomposition, overridden by all current packets | 2,552 → 2,333 reachable references | 33 → 0 |

The forbidden set is ClassicalSerreModularity R26 and R27.2–R27.6, except
`R27.4/strong-form-by-minimal-lifts`. The qualitative and modern strong roots
also pass that guard in both graphs. All 43 resolved incoming edges of this
packet have no reverse path. These are graph checks on the named plans,
not proof that the partial suppliers or open stage inputs are complete.

Structural guards preserve all eight node IDs, the existing review/source
issues and the exact R17.6/R20.6 requests. Only those two broad stage imports
remain. The packet checker passes (eight nodes, one gap, three requests);
the four-file intake reports zero problems and `git diff --check` is clean.

Lean was **not compiled**: the available Mathlib checkout is at 30a58f7,
not the pin, and its required prebuilt ZMod module was absent. Memory was
checked (75 GB available). No Lake project, cache download, library build or
language server was started. The comments record this limitation; no new
claim about the earlier examples' elaboration is made.
